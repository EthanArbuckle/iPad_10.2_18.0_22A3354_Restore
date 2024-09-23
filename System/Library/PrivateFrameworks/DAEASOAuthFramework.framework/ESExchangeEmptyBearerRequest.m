@implementation ESExchangeEmptyBearerRequest

+ (id)emptyBearerRequestForHost:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD1808];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("https"));
  objc_msgSend(v5, "setHost:", v4);

  objc_msgSend(v5, "setPath:", CFSTR("/Microsoft-Server-ActiveSync"));
  v6 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("Bearer"), CFSTR("Authorization"));
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

@end
