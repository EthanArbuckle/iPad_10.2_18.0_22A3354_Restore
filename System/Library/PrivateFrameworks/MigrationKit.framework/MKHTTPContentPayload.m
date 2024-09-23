@implementation MKHTTPContentPayload

- (MKHTTPContentPayload)initWithHeaderValue:(id)a3
{
  id v4;
  MKHTTPContentPayload *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  MKHTTPContentPayload *v12;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKHTTPContentPayload;
  v5 = -[MKHTTPContentPayload init](&v15, sel_init);
  if (v5)
  {
    if (!v4)
    {
LABEL_12:
      v12 = 0;
      goto LABEL_13;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v4, 0);
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v8)
    {
      +[MKLog log](MKLog, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MKHTTPContentPayload initWithHeaderValue:].cold.2((uint64_t)v5, v8, v9);
LABEL_11:

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MKLog log](MKLog, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MKHTTPContentPayload initWithHeaderValue:].cold.1((uint64_t)v5, v9);
      goto LABEL_11;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("is_required"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPContentPayload setIsRequired:](v5, "setIsRequired:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("is_excluded_from_backup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPContentPayload setIsExcludedFromBackup:](v5, "setIsExcludedFromBackup:", objc_msgSend(v11, "BOOLValue"));

  }
  v12 = v5;
LABEL_13:

  return v12;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setIsRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (BOOL)isExcludedFromBackup
{
  return self->_isExcludedFromBackup;
}

- (void)setIsExcludedFromBackup:(BOOL)a3
{
  self->_isExcludedFromBackup = a3;
}

- (void)initWithHeaderValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ could not initialize because it received an unexpected format.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithHeaderValue:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_21EC08000, a3, OS_LOG_TYPE_ERROR, "%@ could not initialize because there was a json error. error=%@", (uint8_t *)&v6, 0x16u);

}

@end
