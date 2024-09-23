@implementation _IKDOMConditionalExpression

+ (id)parseExpressionsFromString:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "expressionFromString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)expressionFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  _IKDOMConditionalOperation *v10;
  id v11;
  id v12;
  _IKDOMConditionalOperation *v13;
  IKDataBindingPropertyPath *v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  uint64_t v19;
  _IKDOMConditionalExpression *v20;
  _IKDOMConditionalExpression *v21;
  void *v22;
  void *v23;
  char v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v3);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":)"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isAtEnd");
  if ((v8 & 1) != 0)
  {
    v25 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_48;
  }
  v9 = 0;
  v25 = 0;
  v10 = 0;
  while (2)
  {
    switch(v9)
    {
      case 0:
        v30 = 0;
        objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("("), &v30);
        v11 = v30;
        objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v7);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "isEqualToString:", CFSTR("not")) && !objc_msgSend(v4, "count"))
        {
          v25 = 1;
LABEL_36:
          v9 = 4;
          goto LABEL_37;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("and")) && objc_msgSend(v4, "count")
          || !objc_msgSend(v12, "length") && !objc_msgSend(v4, "count"))
        {
          goto LABEL_36;
        }
LABEL_46:

LABEL_47:
        v9 = 6;
LABEL_48:
        v19 = objc_msgSend(v4, "count");
        v20 = 0;
        if ((v8 & 1) != 0 && v19 && !v9)
        {
          v21 = [_IKDOMConditionalExpression alloc];
          v22 = (void *)objc_msgSend(v4, "copy");
          v23 = (void *)objc_msgSend(v5, "copy");
          v20 = -[_IKDOMConditionalExpression initWithOperations:dependentPathStrings:isNegated:](v21, "initWithOperations:dependentPathStrings:isNegated:", v22, v23, v25 & 1);

        }
        return v20;
      case 1:
        v29 = 0;
        objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("}"), &v29);
        v12 = v29;
        if (!objc_msgSend(v12, "length"))
          goto LABEL_46;
        v14 = -[IKDataBindingPropertyPath initWithString:]([IKDataBindingPropertyPath alloc], "initWithString:", v12);
        -[IKDataBindingPropertyPath string](v14, "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        -[_IKDOMConditionalOperation setPropertyPath:](v10, "setPropertyPath:", v14);
        v9 = 7;
        goto LABEL_44;
      case 2:
        if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("-not-equal"), 0) & 1) != 0)
        {
          v16 = -1;
        }
        else if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("-less-than-equal"), 0) & 1) != 0)
        {
          v16 = -3;
        }
        else if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("-less-than"), 0) & 1) != 0)
        {
          v16 = 1;
        }
        else if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("-greater-than-equal"), 0) & 1) != 0)
        {
          v16 = -2;
        }
        else
        {
          if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("-greater-than"), 0))
            goto LABEL_43;
          v16 = 2;
        }
        -[_IKDOMConditionalOperation setType:](v10, "setType:", v16);
LABEL_43:
        objc_msgSend(v6, "scanUpToCharactersFromSet:intoString:", v27, 0);
        v9 = 8;
LABEL_44:
        v8 = objc_msgSend(v6, "isAtEnd");
        if ((v8 & 1) != 0)
          goto LABEL_48;
        continue;
      case 3:
        v28 = 0;
        objc_msgSend(v6, "scanUpToString:intoString:", CFSTR(")"), &v28);
        v17 = v28;
        objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v7);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
        {
          -[_IKDOMConditionalOperation setLiteral:](v10, "setLiteral:", v12);

          v9 = 5;
        }
        else
        {
          v9 = 5;
LABEL_37:

        }
        goto LABEL_44;
      case 4:
        v13 = objc_alloc_init(_IKDOMConditionalOperation);

        v9 = 6;
        v10 = v13;
        if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("("), 0) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 5:
        v18 = objc_msgSend(v6, "scanString:intoString:", CFSTR(")"), 0);
        objc_msgSend(v4, "addObject:", v10);

        v10 = 0;
        v9 = 0;
        if (!v18)
          goto LABEL_48;
        goto LABEL_44;
      case 6:
        if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("{"), 0) & 1) == 0)
          goto LABEL_47;
        v9 = 1;
        goto LABEL_44;
      case 7:
        if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("}"), 0) & 1) == 0)
          goto LABEL_47;
        v9 = 2;
        goto LABEL_44;
      case 8:
        v12 = 0;
        if (objc_msgSend(v6, "scanString:intoString:", CFSTR(":"), 0))
          v9 = 3;
        else
          v9 = 5;
        goto LABEL_37;
      default:
        v12 = 0;
        goto LABEL_37;
    }
  }
}

- (_IKDOMConditionalExpression)initWithOperations:(id)a3 dependentPathStrings:(id)a4 isNegated:(BOOL)a5
{
  id v8;
  id v9;
  _IKDOMConditionalExpression *v10;
  uint64_t v11;
  NSArray *operations;
  uint64_t v13;
  NSSet *dependentPathStrings;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IKDOMConditionalExpression;
  v10 = -[_IKDOMConditionalExpression init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    operations = v10->_operations;
    v10->_operations = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    dependentPathStrings = v10->_dependentPathStrings;
    v10->_dependentPathStrings = (NSSet *)v13;

    v10->_isNegated = a5;
  }

  return v10;
}

- (BOOL)passesForDataItem:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  BOOL isNegated;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_operations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "passesForDataItem:", v4, (_QWORD)v13))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  isNegated = self->_isNegated;
  return v10 ^ isNegated;
}

- (NSSet)dependentPathStrings
{
  return self->_dependentPathStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentPathStrings, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

@end
