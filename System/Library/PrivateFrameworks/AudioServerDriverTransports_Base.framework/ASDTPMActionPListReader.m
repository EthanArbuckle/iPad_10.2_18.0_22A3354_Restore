@implementation ASDTPMActionPListReader

- (ASDTPMActionPListReader)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  ASDTPMActionPListReader *v9;
  objc_super v11;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("IsPList"));
  objc_msgSend(v7, "objectForKey:", CFSTR("BundleExt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v7, "setObject:forKey:", CFSTR("plist"), CFSTR("BundleExt"));
  v11.receiver = self;
  v11.super_class = (Class)ASDTPMActionPListReader;
  v9 = -[ASDTPMActionFileReader initWithConfig:forSequencer:](&v11, sel_initWithConfig_forSequencer_, v7, v6);

  return v9;
}

- (id)narrowPList:(id)a3
{
  return a3;
}

- (id)convert:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    -[ASDTPMActionPListReader narrowPList:](self, "narrowPList:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMActionPListReader convert:].cold.1(self, v5);
    v6 = 0;
  }

  return v6;
}

- (void)convert:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Error converting plist data: %@", (uint8_t *)&v5, 0x16u);

}

@end
