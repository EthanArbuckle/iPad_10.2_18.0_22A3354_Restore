@implementation VNVersionParser

+ (BOOL)_isSeparatedString:(id)a3 equalToString:(id)a4 atIndex:(unint64_t)a5 usingSeparator:(id)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = 0;
  if (v9 && v10)
  {
    if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
    {
      objc_msgSend(v9, "componentsSeparatedByString:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByString:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "count");
      v12 = 0;
      if (v15 == objc_msgSend(v14, "count") && v15 >= a5 + 1)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v16, "isEqualToString:", v17);

      }
    }
    else
    {
      v12 = 1;
    }
  }

  return v12;
}

+ (BOOL)isMajorVersion:(id)a3 equalToMajorVersion:(id)a4
{
  return objc_msgSend(a1, "_isSeparatedString:equalToString:atIndex:usingSeparator:", a3, a4, 0, CFSTR("."));
}

+ (BOOL)isMinorVersion:(id)a3 equalToMinorVersion:(id)a4
{
  return objc_msgSend(a1, "_isSeparatedString:equalToString:atIndex:usingSeparator:", a3, a4, 1, CFSTR("."));
}

@end
