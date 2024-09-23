@implementation MKGETPlaceholderRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MKPlaceholder *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;

  v6 = a5;
  objc_msgSend(a4, "headers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 3)
  {
    v10 = 0;
    v11 = 0;
    if ((objc_msgSend(0, "isEqualToString:", CFSTR("/")) & 1) != 0)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("/")) & 1) != 0)
    {
      v11 = 0;
LABEL_8:

      goto LABEL_9;
    }
    if (v10)
    {
      v12 = -[MKPlaceholder initWithBundleIdentifier:]([MKPlaceholder alloc], "initWithBundleIdentifier:", v10);
      v11 = -[MKPlaceholder enabled](v12, "enabled");

      goto LABEL_8;
    }
    v11 = 0;
  }
LABEL_9:
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("enabled"));

  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v13, 0, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  if (v16)
  {
    +[MKLog log](MKLog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MKGETStatusRouter server:didReceiveRequest:response:].cold.1((uint64_t)v16, v17);

  }
  objc_msgSend(v6, "setBody:", v15);

}

@end
