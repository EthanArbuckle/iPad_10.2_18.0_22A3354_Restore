@implementation WKError

+ (id)errorWithCode:(int64_t)a3
{
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 - 1) > 5)
    v6 = CFSTR("WatchKitErrorUnknownErrorMessage");
  else
    v6 = off_24D3BB770[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_24D3BD200, CFSTR("Localizable"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    v6 = (__CFString *)v8;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.watchkit.errors"), a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
