@implementation NSArray(FuzzyMatch)

- (uint64_t)atx_INCustomObjectComparator:()FuzzyMatch object2:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v8, "compare:", v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = 1;
    else
      v10 = -1;
  }

  return v10;
}

- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a1 == v4)
    {
      v13 = 1;
    }
    else
    {
      v5 = v4;
      v6 = objc_msgSend(a1, "count");
      if (v6 == objc_msgSend(v5, "count"))
      {
        v7 = (void *)objc_msgSend(a1, "mutableCopy");
        v8 = MEMORY[0x1E0C809B0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __40__NSArray_FuzzyMatch__atx_isFuzzyMatch___block_invoke;
        v16[3] = &unk_1E82BFBA8;
        v16[4] = a1;
        objc_msgSend(v7, "sortUsingComparator:", v16);
        v9 = (void *)objc_msgSend(v5, "mutableCopy");
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __40__NSArray_FuzzyMatch__atx_isFuzzyMatch___block_invoke_2;
        v15[3] = &unk_1E82BFBA8;
        v15[4] = a1;
        objc_msgSend(v9, "sortUsingComparator:", v15);
        if (objc_msgSend(v7, "count"))
        {
          v10 = 0;
          do
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "atx_isFuzzyMatch:", v12);

            if ((v13 & 1) == 0)
              break;
            ++v10;
          }
          while (v10 < objc_msgSend(v7, "count"));
        }
        else
        {
          v13 = 1;
        }

      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
