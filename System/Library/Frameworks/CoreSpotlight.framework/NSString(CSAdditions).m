@implementation NSString(CSAdditions)

- (id)cs_escapedStringForSearchQuery
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "decomposedStringWithCanonicalMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v4, "length"));
  return v4;
}

- (uint64_t)cs_fuzzyPrefixMatchString:()CSAdditions locale:
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unsigned int v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "length");
  v9 = objc_msgSend(v6, "length");
  objc_msgSend(v7, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "languageCode");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v13 = objc_retainAutorelease(v11);
  objc_msgSend(v13, "UTF8String");
  MDMatcherCreate();
  v14 = objc_retainAutorelease(v6);
  objc_msgSend(v14, "UTF8String", 0, 0);
  v15 = MDMatchUTF8();
  MDMatcherDispose();
  if ((double)v8 * 300.0 / (double)v9 >= 70.0)
    v16 = v15;
  else
    v16 = 0;

  return v16;
}

@end
