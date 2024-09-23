@implementation FMDBVersion

void __28___bmFMDatabase_FMDBVersion__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  int v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "FMDBUserVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 > 2)
  {
    v6 = v1;
  }
  else
  {
    do
    {
      objc_msgSend(v1, "stringByAppendingString:", CFSTR(".0"));
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      v6 = v11;
      v1 = v11;
    }
    while (v5 < 3);
  }
  v12 = v6;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    if (v10 >= 16)
    {
      NSLog(CFSTR("FMDBVersion is invalid: Please use FMDBUserVersion instead."));
      v10 = 15;
    }
    FMDBVersion_FMDBVersionVal = v10 | (16 * FMDBVersion_FMDBVersionVal);
  }

}

@end
