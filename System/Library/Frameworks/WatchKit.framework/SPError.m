@implementation SPError

+ (id)errorWithCode:(int64_t)a3
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 0x1C)
    v5 = CFSTR("SPErrorUnknownMessage");
  else
    v5 = off_24D3BAFF8[a3];
  spUtils_localizedStringForSystemLanguage(v5, CFSTR("/System/Library/Frameworks/WatchKit.framework"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v5 = (__CFString *)v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.watchkit.errors"), a3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 additionalDescription:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "errorWithCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FD8]);
  v10 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v7, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v7, "code"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)isValidationErrorCode:(int64_t)a3
{
  return a3 == 5;
}

@end
