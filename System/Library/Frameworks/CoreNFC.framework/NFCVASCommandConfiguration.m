@implementation NFCVASCommandConfiguration

- (NFCVASCommandConfiguration)init
{
  void *v3;
  NFCVASCommandConfiguration *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[NFCVASCommandConfiguration initWithVASMode:passTypeIdentifier:url:](self, "initWithVASMode:passTypeIdentifier:url:", 1, &stru_24D451DF0, v3);

  return v4;
}

- (NFCVASCommandConfiguration)initWithVASMode:(NFCVASMode)mode passTypeIdentifier:(NSString *)passTypeIdentifier url:(NSURL *)url
{
  NSString *v8;
  NSURL *v9;
  NFCVASCommandConfiguration *v10;
  NFCVASCommandConfiguration *v11;
  objc_super v13;

  v8 = passTypeIdentifier;
  v9 = url;
  v13.receiver = self;
  v13.super_class = (Class)NFCVASCommandConfiguration;
  v10 = -[NFCVASCommandConfiguration init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[NFCVASCommandConfiguration setMode:](v10, "setMode:", mode);
    -[NFCVASCommandConfiguration setPassTypeIdentifier:](v11, "setPassTypeIdentifier:", v8);
    -[NFCVASCommandConfiguration setUrl:](v11, "setUrl:", v9);
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("{Mode=%ld, passId=%@, url=%@}"), self->_mode, self->_passTypeIdentifier, self->_url);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (NFCVASMode)mode
{
  return self->_mode;
}

- (void)setMode:(NFCVASMode)mode
{
  self->_mode = mode;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(NSString *)passTypeIdentifier
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, passTypeIdentifier);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(NSURL *)url
{
  objc_storeStrong((id *)&self->_url, url);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
