@implementation ILClassificationUIExtensionViewController

- (void)prepareForClassificationRequest:(ILClassificationRequest *)request
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  ILDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ILClassificationUIExtensionViewController prepareForClassificationRequest:]";
    _os_log_impl(&dword_228FAC000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Client did not override %s", (uint8_t *)&v4, 0xCu);
  }

}

- (ILClassificationResponse)classificationResponseForRequest:(ILClassificationRequest *)request
{
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8FF8]), "initWithClassificationAction:", 0);
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[ILClassificationUIExtensionViewController classificationResponseForRequest:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_228FAC000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Client did not override %s, returning empty response: %@", (uint8_t *)&v6, 0x16u);
  }

  return (ILClassificationResponse *)v3;
}

@end
