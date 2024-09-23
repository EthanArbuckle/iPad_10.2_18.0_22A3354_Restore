@implementation DMCVersioningUtilities

+ (BOOL)_allZerosArray:(id)a3 startingAtIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  int v7;
  BOOL v8;

  v5 = a3;
  if (objc_msgSend(v5, "count") <= a4)
  {
    v8 = 1;
  }
  else
  {
    do
    {
      objc_msgSend(v5, "objectAtIndex:", a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "intValue");
      v8 = v7 == 0;

      if (v7)
        break;
      ++a4;
    }
    while (a4 < objc_msgSend(v5, "count"));
  }

  return v8;
}

+ (BOOL)versionString:(id)a3 isOlderThanVersionString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  _BOOL4 v16;

  v5 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (objc_msgSend(v6, "count"))
  {
    while (v8 < objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "intValue");
      objc_msgSend(v7, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      if (v10 < v12)
      {
        LOBYTE(v16) = 1;
        goto LABEL_10;
      }
      if (++v8 >= objc_msgSend(v6, "count"))
        break;
    }
  }
  v13 = objc_msgSend(v6, "count");
  v14 = v6;
  if (v8 >= v13 && (v15 = objc_msgSend(v7, "count", v6), v14 = v7, v8 >= v15))
    LOBYTE(v16) = 0;
  else
    v16 = !+[DMCVersioningUtilities _allZerosArray:startingAtIndex:](DMCVersioningUtilities, "_allZerosArray:startingAtIndex:", v14, v8);
LABEL_10:

  return v16;
}

@end
