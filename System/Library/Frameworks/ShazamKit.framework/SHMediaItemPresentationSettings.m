@implementation SHMediaItemPresentationSettings

- (SHMediaItemPresentationSettings)initWithSettings:(id)a3
{
  id v4;
  SHMediaItemPresentationSettings *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHMediaItemPresentationSettings;
  v5 = -[SHMediaItemPresentationSettings init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("openResultInBrowserOnFailure"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_openResultInBrowserOnFailure = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMediaItemPresentationSettings)initWithCoder:(id)a3
{
  id v4;
  SHMediaItemPresentationSettings *v5;
  char v6;

  v4 = a3;
  v5 = -[SHMediaItemPresentationSettings initWithSettings:](self, "initWithSettings:", MEMORY[0x24BDBD1B8]);
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("openResultInBrowserOnFailure"));

  v5->_openResultInBrowserOnFailure = v6;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SHMediaItemPresentationSettings openResultInBrowserOnFailure](self, "openResultInBrowserOnFailure"), CFSTR("openResultInBrowserOnFailure"));

}

- (BOOL)openResultInBrowserOnFailure
{
  return self->_openResultInBrowserOnFailure;
}

@end
