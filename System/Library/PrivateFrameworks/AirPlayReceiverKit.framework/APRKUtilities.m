@implementation APRKUtilities

+ (id)baseDictionaryForResponseToRequestWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
    objc_msgSend(v3, "objectForKey:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("type"));
    objc_msgSend(v4, "setObject:forKey:", CFSTR("response"), CFSTR("kind"));
    objc_msgSend(v3, "objectForKey:", CFSTR("messageID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("messageID"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)baseDictionaryForUpstreamMessageWithType:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDBCED8];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", 2);
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("type"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)dictionaryForError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("domain"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("code"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)secureStopURL
{
  if (secureStopURL_onceToken != -1)
    dispatch_once(&secureStopURL_onceToken, &__block_literal_global);
  return (id)secureStopURL_url;
}

void __30__APRKUtilities_secureStopURL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "temporaryDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("FPSSecureStop"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)secureStopURL_url;
  secureStopURL_url = v1;

}

@end
