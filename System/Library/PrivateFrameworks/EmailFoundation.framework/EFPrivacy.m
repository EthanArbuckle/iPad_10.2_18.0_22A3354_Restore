@implementation EFPrivacy

+ (unsigned)bucketMessageCount:(unint64_t)a3
{
  unsigned int result;

  result = a3;
  if (a3 > 0xA)
  {
    if (a3 <= 0x63)
      return (round((double)a3 / 10.0) * 10.0);
    else
      return 100;
  }
  return result;
}

+ (id)partiallyRedactedStringForString:(id)a3
{
  objc_msgSend(a1, "partiallyRedactedStringForString:maximumUnredactedLength:", a3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)partiallyRedactedStringForString:(id)a3 maximumUnredactedLength:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  EFStringHash *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = v6;
  if (!a4)
  {
    v11 = -[EFStringHash initWithString:]([EFStringHash alloc], "initWithString:", v5);
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[EFStringHash redactedStringValue](v11, "redactedStringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<%lu chars, hash=%@>"), v7, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v6 > a4)
  {
    v8 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", a4 - 1);
    v10 = v8 + v9;
    if (v7 > v8 + v9)
    {
      v11 = -[EFStringHash initWithString:]([EFStringHash alloc], "initWithString:", v5);
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "substringToIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EFStringHash redactedStringValue](v11, "redactedStringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("\"%@...\"<%lu chars, hash=%@>"), v13, v7, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      goto LABEL_8;
    }
  }
  v15 = v5;
LABEL_8:

  return v15;
}

+ (id)fullyRedactedStringForString:(id)a3
{
  id v3;
  EFStringHash *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[EFStringHash initWithString:]([EFStringHash alloc], "initWithString:", v3);
    -[EFStringHash redactedStringValue](v4, "redactedStringValue");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

+ (id)dateByRemovingTimeComponentsFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 28, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int64_t)weeksSinceDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", v3) == 1)
  {
    objc_msgSend(v4, "components:fromDate:toDate:options:", 0x2000, v3, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "weekOfYear");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int64_t)bucketedMessageAgeSinceDate:(id)a3 leadingDigits:(int64_t)a4
{
  double v5;
  uint64_t v6;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v6 = (int)(v5 / 86400.0);
  if ((_DWORD)v6)
    return +[EFPrivacy bucketedNumber:leadingDigits:](EFPrivacy, "bucketedNumber:leadingDigits:", v6, a4);
  else
    return 0;
}

+ (int64_t)bucketedNumber:(int)a3 leadingDigits:(int64_t)a4
{
  int v6;
  double v7;
  double v8;
  int v9;

  if (a3 >= 0)
    v6 = a3;
  else
    v6 = -a3;
  v7 = log10((double)v6);
  v8 = __exp10(floor(v7) + 1.0 - (double)a4);
  v9 = (int)(v8 * round((double)a3 / v8));
  if (v9 >= 0)
    return v9;
  else
    return -v9;
}

+ (int64_t)roundedInteger:(int64_t)a3 placeValueDigits:(int64_t)a4
{
  double v5;

  v5 = __exp10((double)a4);
  return (uint64_t)(v5 * round((double)a3 / v5));
}

+ (int64_t)roundedInteger:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_class();
  return objc_msgSend(v4, "roundedInteger:placeValueDigits:", a3, objc_msgSend((id)objc_opt_class(), "numberOfDigits:", a3) - 1);
}

+ (int64_t)numberOfDigits:(int64_t)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

+ (id)partiallyRedactedStringFromArray:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = (id)0xAAAAAAAAAAAAAAAALL;
  v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__EFPrivacy_partiallyRedactedStringFromArray___block_invoke;
  v7[3] = &unk_1E62A6DC0;
  v7[4] = &v8;
  v7[5] = a1;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__EFPrivacy_partiallyRedactedStringFromArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length"))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR(", "));
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "partiallyRedactedStringForString:maximumUnredactedLength:", v5, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

  }
}

+ (id)partiallyRedactedDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = (id)0xAAAAAAAAAAAAAAAALL;
  v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__EFPrivacy_partiallyRedactedDictionary___block_invoke;
  v7[3] = &unk_1E62A6DE8;
  v7[4] = &v8;
  v7[5] = a1;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__EFPrivacy_partiallyRedactedDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 40), "partiallyRedactedStringFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), v9, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v8);

}

+ (id)fullyOrPartiallyRedactedStringForString:(id)a3
{
  +[EFPrivacy fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:](EFPrivacy, "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", a3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fullyOrPartiallyRedactedStringForString:(id)a3 maximumUnredactedLength:(unint64_t)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;

  v5 = a3;
  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInternal");

  if (v7)
    +[EFPrivacy partiallyRedactedStringForString:maximumUnredactedLength:](EFPrivacy, "partiallyRedactedStringForString:maximumUnredactedLength:", v5, a4);
  else
    +[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fullyOrPartiallyRedactFields:(id)a3 inString:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v22;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v24 = *(_QWORD *)v27;
    do
    {
      v25 = v6;
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(?<=%@ = ['|\"|“])([^;]+)(?=['|\"|”];)"),
          *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v8, 1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = objc_msgSend(v5, "length");
          v11 = v10;
          if (v10)
          {
            v12 = 0;
            v13 = v10;
            do
            {
              if (v12 + v11 > objc_msgSend(v5, "length"))
                break;
              v15 = objc_msgSend(v9, "rangeOfFirstMatchInString:options:range:", v5, 0, v12, v11);
              if (v15 == 0x7FFFFFFFFFFFFFFFLL)
                break;
              v16 = v14;
              objc_msgSend(v5, "substringWithRange:", v15, v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[EFPrivacy fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:](EFPrivacy, "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", v17, 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "replaceCharactersInRange:withString:", v15, v16, v18);
              if (v13 != objc_msgSend(v5, "length"))
                v13 = objc_msgSend(v5, "length");
              v19 = objc_msgSend(v18, "length");
              v20 = objc_msgSend(v5, "length");

              v12 = v19 + v15;
              v11 = v20 - v12;
            }
            while (v12 < v13);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  return v5;
}

+ (id)redactedQueryStringForQueryString:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'(.*?)'"), CFSTR("?"), 1024, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("[0-9]+"), CFSTR("?"), 1024, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("CAST\\(X\\? AS TEXT\\)"), CFSTR("?"), 1024, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\(\\?+(,()*\\?+)*\\)"), CFSTR("(?)"), 1024, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (unint64_t)_roundQueryLogCount:(unint64_t)a3 maxCount:(unint64_t)a4 queryCount:(unint64_t)a5
{
  if (a5 >= (a4 + a3) >> 1)
    return a4;
  else
    return a3;
}

+ (unint64_t)bucketValueForQueryLogCount:(id)a3 bucketValues:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v21;

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v8, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFPrivacy.m"), 239, CFSTR("Invalid number of values in queryBucketValues"));

  }
  v9 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v9 >= v11)
  {
    objc_msgSend(v8, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    if (v9 <= v13)
    {
      v15 = 0;
      do
      {
        if (v15 >= objc_msgSend(v8, "count") - 1)
          __assert_rtn("+[EFPrivacy bucketValueForQueryLogCount:bucketValues:]", "EFPrivacy.m", 259, "0 && \"Fail to bucket query count value\");
        objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntegerValue");

        objc_msgSend(v8, "objectAtIndexedSubscript:", v15 + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        ++v15;
      }
      while (v9 < v17 || v9 > v19);
      v9 = objc_msgSend(a1, "_roundQueryLogCount:maxCount:queryCount:", v17, v19, v9);
    }
    else
    {
      objc_msgSend(v8, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v14, "unsignedIntegerValue");

    }
  }

  return v9;
}

@end
