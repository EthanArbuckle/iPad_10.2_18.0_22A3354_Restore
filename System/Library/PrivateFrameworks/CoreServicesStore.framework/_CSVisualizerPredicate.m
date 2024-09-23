@implementation _CSVisualizerPredicate

- (_CSVisualizerPredicate)initWithExpression:(id)a3
{
  id v4;
  void *v5;
  _CSVisualizerPredicate *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "constantValueForExpression:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[_CSVisualizerPredicate initWithSearchString:operator:error:](self, "initWithSearchString:operator:error:", v5, 99, 0);
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (_CSVisualizerPredicate)initWithSearchString:(id)a3 operator:(unint64_t)a4 error:(id *)a5
{
  return -[_CSVisualizerPredicate initWithSearchString:forTitle:operator:error:](self, "initWithSearchString:forTitle:operator:error:", a3, 0, a4, a5);
}

- (_CSVisualizerPredicate)initWithSearchString:(id)a3 forTitle:(id)a4 operator:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  _CSVisualizerPredicate *v12;
  uint64_t v13;
  NSString *searchString;
  uint64_t v15;
  NSString *title;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSPredicate *numericPredicate;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  objc_super v34;
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[6];
  _QWORD v40[7];

  v40[6] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_CSVisualizerPredicate;
  v12 = -[_CSVisualizerPredicate init](&v34, sel_init);
  if (!v12)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v35[0] = *MEMORY[0x1E0CB2938];
    v35[1] = CFSTR("Line");
    v36[0] = CFSTR("mFulErr");
    v36[1] = &unk_1E4E25508;
    v25 = *MEMORY[0x1E0CB2D68];
    v36[2] = CFSTR("Failed to allocate NSPredicate instance.");
    v35[2] = v25;
    v35[3] = CFSTR("Operator");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v26;
    v36[4] = v10;
    v35[4] = CFSTR("SearchString");
    v35[5] = CFSTR("Title");
    v36[5] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -41, v27);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v17 = (id)v28;

    if (a6)
    {
      v17 = objc_retainAutorelease(v17);
      v12 = 0;
      *a6 = v17;
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_11;
  }
  v13 = objc_msgSend(v10, "copy");
  searchString = v12->_searchString;
  v12->_searchString = (NSString *)v13;

  v15 = objc_msgSend(v11, "copy");
  title = v12->_title;
  v12->_title = (NSString *)v15;

  v17 = 0;
  v12->_operator = a5;
  if (a5 - 4 >= 6 && a5 != 99)
  {
    if (v11)
    {
      if (objc_msgSend((id)objc_opt_class(), "operatorIsNumeric:", a5))
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_alloc(MEMORY[0x1E0CB3518]);
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("HAYSTACK"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "initWithLeftExpression:rightExpression:modifier:type:options:", v20, v21, 0, a5, 0);
        numericPredicate = v12->_numericPredicate;
        v12->_numericPredicate = (NSPredicate *)v22;

        v17 = 0;
        goto LABEL_11;
      }

      v32 = (void *)MEMORY[0x1E0CB35C8];
      v39[0] = *MEMORY[0x1E0CB2938];
      v39[1] = CFSTR("Line");
      v40[0] = CFSTR("kCSStorePredicateErr");
      v40[1] = &unk_1E4E254D8;
      v33 = *MEMORY[0x1E0CB2D68];
      v40[2] = CFSTR("Unsupported operator type.");
      v39[2] = v33;
      v39[3] = CFSTR("Operator");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40[3] = v26;
      v40[4] = v10;
      v39[4] = CFSTR("SearchString");
      v39[5] = CFSTR("Title");
      v40[5] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v27);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {

      v30 = (void *)MEMORY[0x1E0CB35C8];
      v37[0] = *MEMORY[0x1E0CB2938];
      v37[1] = CFSTR("Line");
      v38[0] = CFSTR("kCSStorePredicateErr");
      v38[1] = &unk_1E4E254F0;
      v31 = *MEMORY[0x1E0CB2D68];
      v38[2] = CFSTR("Unsupported operator type.");
      v37[2] = v31;
      v37[3] = CFSTR("Operator");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = CFSTR("SearchString");
      v38[3] = v26;
      v38[4] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v27);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
LABEL_11:

  return v12;
}

- (BOOL)evaluateNumerically:(id)a3
{
  id v4;
  void *v5;
  NSString *title;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSPredicate *numericPredicate;
  void *v13;
  void *v14;
  id v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  int v20;
  __int128 v21;
  int v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  title = self->_title;
  if (title)
  {
    v8 = +[_CSVisualizer rangeOfValueForTitle:inDescription:](_CSVisualizer, "rangeOfValueForTitle:inDescription:", title, v4);
  }
  else
  {
    v7 = objc_msgSend(v4, "length");
    v8 = 0;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "attributedSubstringFromRange:", v8, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute:atIndex:effectiveRange:", CFSTR("_CSVNum"), 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3900]);
      objc_msgSend(v10, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v16, "initWithString:", v17);

      objc_msgSend(v14, "setCaseSensitive:", 0);
      v23 = 0;
      v21 = 0uLL;
      v22 = 0;
      if (objc_msgSend(v14, "scanString:intoString:", CFSTR("0x"), 0)
        && objc_msgSend(v14, "scanHexLongLong:", &v23))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_msgSend(v14, "scanDecimal:", &v21) & 1) == 0)
        {
          v9 = 0;
          goto LABEL_8;
        }
        v19 = v21;
        v20 = v22;
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithDecimal:", &v19);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v11 = v18;

      if (!v11)
      {
        v9 = 0;
        goto LABEL_9;
      }
    }
    numericPredicate = self->_numericPredicate;
    v24 = CFSTR("HAYSTACK");
    v25[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSPredicate evaluateWithObject:substitutionVariables:](numericPredicate, "evaluateWithObject:substitutionVariables:", 0, v13);

    v14 = (void *)v11;
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)getRanges:(void *)a3 inDescription:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 searchedInRange:(_NSRange *)a7
{
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *title;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  BOOL v20;
  unint64_t v21;
  NSUInteger *v22;
  _QWORD *v23;
  uint64_t *v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;
  NSUInteger *v29;
  _QWORD *v30;
  unint64_t v31;
  NSUInteger v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  BOOL v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  NSUInteger *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  NSUInteger *v55;
  unint64_t v56;
  NSUInteger *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  NSUInteger *v63;
  unint64_t v64;
  BOOL v66;
  void *context;
  _QWORD v68[2];
  _QWORD v69[3];

  v69[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  context = (void *)MEMORY[0x1A85AA4B4]();
  v13 = self->_searchString;
  objc_msgSend(v12, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  title = self->_title;
  if (title)
  {
    v17 = +[_CSVisualizer rangeOfValueForTitle:inDescription:](_CSVisualizer, "rangeOfValueForTitle:inDescription:", title, v12);
    v19 = v18;
    v20 = v17 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v19 = objc_msgSend(v14, "length");
    v17 = 0;
    v20 = 1;
  }
  v66 = v20;
  if (a7)
  {
    a7->location = v17;
    a7->length = v19;
  }
  if (v15 && v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_numericPredicate)
    {
      if (-[_CSVisualizerPredicate evaluateNumerically:](self, "evaluateNumerically:", v12))
      {
        v22 = (NSUInteger *)*((_QWORD *)a3 + 1);
        v21 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v22 >= v21)
        {
          v49 = *(NSUInteger **)a3;
          v50 = ((uint64_t)v22 - *(_QWORD *)a3) >> 4;
          v51 = v50 + 1;
          if ((unint64_t)(v50 + 1) >> 60)
            abort();
          v52 = v21 - (_QWORD)v49;
          if (v52 >> 3 > v51)
            v51 = v52 >> 3;
          v44 = (unint64_t)v52 >= 0x7FFFFFFFFFFFFFF0;
          v53 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44)
            v53 = v51;
          if (v53)
          {
            v53 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v53);
            v49 = *(NSUInteger **)a3;
            v22 = (NSUInteger *)*((_QWORD *)a3 + 1);
          }
          else
          {
            v54 = 0;
          }
          v55 = (NSUInteger *)(v53 + 16 * v50);
          v56 = v53 + 16 * v54;
          *v55 = v17;
          v55[1] = v19;
          v23 = v55 + 2;
          if (v22 != v49)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v22 - 1);
              v55 -= 2;
              v22 -= 2;
            }
            while (v22 != v49);
            v49 = *(NSUInteger **)a3;
          }
          *(_QWORD *)a3 = v55;
          *((_QWORD *)a3 + 1) = v23;
          *((_QWORD *)a3 + 2) = v56;
          if (v49)
            operator delete(v49);
        }
        else
        {
          *v22 = v17;
          v22[1] = v19;
          v23 = v22 + 2;
        }
        *((_QWORD *)a3 + 1) = v23;
      }
    }
    else if ((self->_operator & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      if (-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::once != -1)
        dispatch_once(&-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::once, &__block_literal_global_211);
      if (self->_operator == 7)
        v24 = &-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::likePredicate;
      else
        v24 = &-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::matchesPredicate;
      v25 = (id)*v24;
      v68[0] = CFSTR("HAYSTACK");
      objc_msgSend(v15, "substringWithRange:", v17, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = CFSTR("NEEDLE");
      v69[0] = v26;
      v69[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "evaluateWithObject:substitutionVariables:", 0, v27))
      {
        v29 = (NSUInteger *)*((_QWORD *)a3 + 1);
        v28 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v29 >= v28)
        {
          v57 = *(NSUInteger **)a3;
          v58 = ((uint64_t)v29 - *(_QWORD *)a3) >> 4;
          v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) >> 60)
            abort();
          v60 = v28 - (_QWORD)v57;
          if (v60 >> 3 > v59)
            v59 = v60 >> 3;
          v44 = (unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0;
          v61 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44)
            v61 = v59;
          if (v61)
          {
            v61 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v61);
            v57 = *(NSUInteger **)a3;
            v29 = (NSUInteger *)*((_QWORD *)a3 + 1);
          }
          else
          {
            v62 = 0;
          }
          v63 = (NSUInteger *)(v61 + 16 * v58);
          v64 = v61 + 16 * v62;
          *v63 = v17;
          v63[1] = v19;
          v30 = v63 + 2;
          if (v29 != v57)
          {
            do
            {
              *((_OWORD *)v63 - 1) = *((_OWORD *)v29 - 1);
              v63 -= 2;
              v29 -= 2;
            }
            while (v29 != v57);
            v57 = *(NSUInteger **)a3;
          }
          *(_QWORD *)a3 = v63;
          *((_QWORD *)a3 + 1) = v30;
          *((_QWORD *)a3 + 2) = v64;
          if (v57)
            operator delete(v57);
        }
        else
        {
          *v29 = v17;
          v29[1] = v19;
          v30 = v29 + 2;
        }
        *((_QWORD *)a3 + 1) = v30;
      }

    }
    else if (v19)
    {
      v31 = a5 | 1;
      v32 = v17 + v19;
      v33 = (_QWORD *)*((_QWORD *)a3 + 1);
      do
      {
        if (a6 <= ((uint64_t)v33 - *(_QWORD *)a3) >> 4)
          break;
        v34 = objc_msgSend(v15, "rangeOfString:options:range:", v13, v31, v17, v19);
        v36 = v34;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v37 = v35;
        v39 = (uint64_t *)*((_QWORD *)a3 + 1);
        v38 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v39 >= v38)
        {
          v40 = *(uint64_t **)a3;
          v41 = ((uint64_t)v39 - *(_QWORD *)a3) >> 4;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60)
            abort();
          v43 = v38 - (_QWORD)v40;
          if (v43 >> 3 > v42)
            v42 = v43 >> 3;
          v44 = (unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0;
          v45 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44)
            v45 = v42;
          if (v45)
          {
            v45 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v45);
            v40 = *(uint64_t **)a3;
            v39 = (uint64_t *)*((_QWORD *)a3 + 1);
          }
          else
          {
            v46 = 0;
          }
          v47 = (uint64_t *)(v45 + 16 * v41);
          *v47 = v36;
          v47[1] = v37;
          v48 = v47;
          if (v39 != v40)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v39 - 1);
              v48 -= 2;
              v39 -= 2;
            }
            while (v39 != v40);
            v40 = *(uint64_t **)a3;
          }
          v33 = v47 + 2;
          *(_QWORD *)a3 = v48;
          *((_QWORD *)a3 + 1) = v47 + 2;
          *((_QWORD *)a3 + 2) = v45 + 16 * v46;
          if (v40)
            operator delete(v40);
        }
        else
        {
          *v39 = v34;
          v39[1] = v35;
          v33 = v39 + 2;
        }
        *((_QWORD *)a3 + 1) = v33;
        v17 = v36 + v37;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v19 = v32 - v17;
      }
      while (v32 != v17);
    }
  }

  objc_autoreleasePoolPop(context);
  return v66;
}

- (BOOL)evaluateWithObject:(id)a3
{
  return -[_CSVisualizerPredicate evaluateWithObject:substitutionVariables:](self, "evaluateWithObject:substitutionVariables:", a3, 0);
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v5;
  _BOOL4 v6;
  CSStore2 *v7;
  unint64_t operator;
  _QWORD *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t v17;
  __int128 v18;
  void *__p;
  _QWORD *v20;
  char *v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __p = operator new(0x10uLL);
    v20 = __p;
    v21 = (char *)__p + 16;
    v6 = self->_operator == 9;
    v18 = xmmword_1A4E89680;
    v7 = (CSStore2 *)-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:](self, "getRanges:inDescription:options:limit:searchedInRange:", &__p, v5, 4 * v6, 1, &v18);
    if ((_DWORD)v7)
    {
      operator = self->_operator;
      switch(operator)
      {
        case 4uLL:
          v9 = __p;
          if (__p == v20)
            goto LABEL_22;
          v10 = *(_QWORD *)__p == (_QWORD)v18 && *((_QWORD *)__p + 1) == *((_QWORD *)&v18 + 1);
          goto LABEL_19;
        case 5uLL:
          v9 = __p;
          if (__p != v20)
          {
            v11 = 1;
            goto LABEL_28;
          }
          v11 = *(_QWORD *)__p != (_QWORD)v18 || *((_QWORD *)__p + 1) != *((_QWORD *)&v18 + 1);
          goto LABEL_27;
        case 6uLL:
        case 7uLL:
          goto LABEL_11;
        case 8uLL:
          v9 = __p;
          if (__p == v20)
            goto LABEL_22;
          v12 = *(_QWORD *)__p;
          v13 = v18;
          goto LABEL_18;
        case 9uLL:
          v9 = __p;
          if (__p == v20)
          {
LABEL_22:
            v11 = 0;
            goto LABEL_28;
          }
          v12 = *(v20 - 1) + *(v20 - 2);
          v13 = *((_QWORD *)&v18 + 1) + v18;
LABEL_18:
          v10 = v12 == v13;
LABEL_19:
          v11 = v10;
          goto LABEL_27;
        default:
          if (operator == 99 || self->_numericPredicate)
          {
LABEL_11:
            v9 = __p;
            v11 = __p != v20;
            goto LABEL_28;
          }
          CSStore2::GetLog(v7);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v17 = self->_operator;
            *(_DWORD *)buf = 67109120;
            v23 = v17;
            _os_log_error_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_ERROR, "Unexpected predicate operator '%u'!", buf, 8u);
          }

          break;
      }
    }
    v11 = 0;
LABEL_27:
    v9 = __p;
LABEL_28:
    if (v9)
    {
      v20 = v9;
      operator delete(v9);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)predicateFormat
{
  void *v3;
  const __CFString *title;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1A85AA4B4](self, a2);
  if (self->_title)
    title = (const __CFString *)self->_title;
  else
    title = CFSTR("*");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", title);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", self->_searchString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, self->_operator, 0);
  objc_msgSend(v7, "predicateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_CSVisualizerPredicate predicateFormat](self, "predicateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> { \"%@\" }"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericPredicate, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)constantValueForExpression:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CFTypeID TypeID;
  int v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  if (objc_msgSend(v3, "expressionType"))
  {
    if (objc_msgSend(v4, "expressionType") == 3)
    {
      objc_msgSend(v4, "keyPath");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_5:
    v6 = 0;
LABEL_12:
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "constantValue");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;
  if (!v5)
    goto LABEL_12;
  TypeID = CFBooleanGetTypeID();
  if (TypeID == CFGetTypeID(v6))
  {
    v8 = objc_msgSend(v6, "BOOLValue");
    v9 = CFSTR("false");
    if (v8)
      v9 = CFSTR("true");
    v10 = v9;
  }
  else
  {
    objc_msgSend(v6, "description");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
LABEL_15:

  return v11;
}

+ (BOOL)operatorIsNumeric:(unint64_t)a3
{
  return a3 < 6 || a3 == 100;
}

+ (id)translateNSPredicate:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id *v33;
  _CSVisualizerPredicate *v34;
  id v35;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[4];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isEqual:", v38) & 1) != 0 || objc_msgSend(v39, "isEqual:", v37))
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v39;
    objc_msgSend(v35, "subpredicates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") == 1)
    {
      v12 = objc_msgSend(v35, "compoundPredicateType");

      if (v12)
      {
        objc_msgSend(v35, "subpredicates");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        objc_msgSend(a1, "translateNSPredicate:error:", v14, &v47);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v6 = v47;
LABEL_33:

        v14 = v13;
        goto LABEL_34;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v35, "subpredicates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v44;
      while (2)
      {
        v26 = 0;
        v27 = v6;
        do
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v13);
          v28 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * v26);
          v42 = v27;
          objc_msgSend(a1, "translateNSPredicate:error:", v28, &v42);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v42;

          if (!v29)
          {
            v5 = 0;
            goto LABEL_33;
          }
          objc_msgSend(v14, "addObject:", v29);

          ++v26;
          v27 = v6;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
        if (v24)
          continue;
        break;
      }
    }

    if (!v14)
    {
      v5 = 0;
      goto LABEL_35;
    }
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v35, "compoundPredicateType"), v14);
LABEL_34:

LABEL_35:
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v39;
    objc_msgSend(v15, "leftExpression");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constantValueForExpression:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v15, "predicateOperatorType");
    objc_msgSend(v15, "rightExpression");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constantValueForExpression:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v20)
      {
        if (!objc_msgSend(v15, "comparisonPredicateModifier"))
        {
          v22 = v17;
          v32 = v20;
          if (objc_msgSend(v22, "isEqualToString:", CFSTR("*")))
          {
            v41 = 0;
            v33 = (id *)&v41;
            v34 = -[_CSVisualizerPredicate initWithSearchString:operator:error:]([_CSVisualizerPredicate alloc], "initWithSearchString:operator:error:", v32, v18, &v41);
          }
          else
          {
            v40 = 0;
            v33 = (id *)&v40;
            v34 = -[_CSVisualizerPredicate initWithSearchString:forTitle:operator:error:]([_CSVisualizerPredicate alloc], "initWithSearchString:forTitle:operator:error:", v32, v22, v18, &v40);
          }
          v5 = v34;
          v6 = *v33;

          goto LABEL_39;
        }
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v50[0] = *MEMORY[0x1E0CB2938];
        v50[1] = CFSTR("Line");
        v51[0] = CFSTR("kCSStorePredicateErr");
        v51[1] = &unk_1E4E25460;
        v50[2] = *MEMORY[0x1E0CB2D68];
        v50[3] = CFSTR("Predicate");
        v51[2] = CFSTR("Aggregate operations (ANY, ALL, etc.) are not supported.");
        v51[3] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v22);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v52[0] = *MEMORY[0x1E0CB2938];
        v52[1] = CFSTR("Line");
        v53[0] = CFSTR("kCSStorePredicateErr");
        v53[1] = &unk_1E4E25448;
        v52[2] = *MEMORY[0x1E0CB2D68];
        v52[3] = CFSTR("Predicate");
        v53[2] = CFSTR("Unsupported expression type (right-hand side).");
        v53[3] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v22);
        v23 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v54[0] = *MEMORY[0x1E0CB2938];
      v54[1] = CFSTR("Line");
      v55[0] = CFSTR("kCSStorePredicateErr");
      v55[1] = &unk_1E4E25430;
      v54[2] = *MEMORY[0x1E0CB2D68];
      v54[3] = CFSTR("Predicate");
      v55[2] = CFSTR("Unsupported expression type (left-hand side).");
      v55[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v22);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v23;
    v5 = 0;
LABEL_39:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    v5 = 0;
    goto LABEL_4;
  }
LABEL_3:
  v5 = v39;
  v6 = 0;
LABEL_4:
  if (a4 && !v5)
  {
    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v48[0] = *MEMORY[0x1E0CB2938];
      v48[1] = CFSTR("Line");
      v49[0] = CFSTR("kCSStorePredicateErr");
      v49[1] = &unk_1E4E25478;
      v48[2] = *MEMORY[0x1E0CB2D68];
      v48[3] = CFSTR("Predicate");
      v49[2] = CFSTR("Could not translate generated predicate to a form usable by CoreServicesStore.");
      v49[3] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v8);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = objc_retainAutorelease(v6);
    *a4 = v6;
  }
  v9 = v5;

  return v9;
}

+ (id)predicateWithFormatString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16[9];
  _QWORD v17[4];
  _QWORD v18[16];

  v18[15] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1A85AA4B4]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:argumentArray:", v6, MEMORY[0x1E0C9AA60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v16[0] = 0;
    objc_msgSend(a1, "translateNSPredicate:error:", v8, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16[0];

    if (v9)
      goto LABEL_10;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:argumentArray:", v6, MEMORY[0x1E0C9AA60]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpression:", v11);
    if (!v9)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v17[0] = *MEMORY[0x1E0CB2938];
      v17[1] = CFSTR("Line");
      v18[0] = CFSTR("kCSStorePredicateErr");
      v18[1] = &unk_1E4E254A8;
      v17[2] = *MEMORY[0x1E0CB2D68];
      v17[3] = CFSTR("Expression");
      v18[2] = CFSTR("Could not translate generated expression to a form usable by CoreServicesStore.");
      v18[3] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
      v10 = (id)v14;
    }
  }
  else
  {
    v9 = 0;
  }

LABEL_10:
  objc_autoreleasePoolPop(v7);
  if (a4 && !v9)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

+ (void)getRanges:(void *)a3 matchingPredicate:(id)a4 inDescription:(id)a5
{
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CSPredicate.mm"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CSPredicate.mm"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description != nil"));

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    v13 = v12;
    if (v12[4] != 5)
      objc_msgSend(v12, "getRanges:inDescription:options:limit:searchedInRange:", a3, v11, 0, -1, 0);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v9;
      if (objc_msgSend(v14, "compoundPredicateType"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v14, "subpredicates");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v22;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v15);
              objc_msgSend(a1, "getRanges:matchingPredicate:inDescription:", a3, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18++), v11);
            }
            while (v16 != v18);
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v16);
        }

      }
    }
  }

}

@end
