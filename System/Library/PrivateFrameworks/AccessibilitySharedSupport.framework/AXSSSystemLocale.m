@implementation AXSSSystemLocale

- (AXSSSystemLocale)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSSSystemLocale;
  return -[AXSSSystemLocale init](&v3, sel_init);
}

- (AXSSSystemLocale)initWithPreferredLanguages:(id)a3
{
  NSArray *v4;
  AXSSSystemLocale *v5;
  NSArray *preferredLanguages;
  objc_super v8;

  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)AXSSSystemLocale;
  v5 = -[AXSSSystemLocale init](&v8, sel_init);
  preferredLanguages = v5->_preferredLanguages;
  v5->_preferredLanguages = v4;

  return v5;
}

- (NSArray)preferredLanguages
{
  NSArray *preferredLanguages;

  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages)
    return preferredLanguages;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
}

@end
