@implementation AAiCloudTermsStringResponse

- (NSString)termsString
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->super._responseTermsDictionary, "objectForKey:", CFSTR("iCloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Got terms string: %@", (uint8_t *)&v5, 0xCu);
  }

  return (NSString *)v2;
}

@end
