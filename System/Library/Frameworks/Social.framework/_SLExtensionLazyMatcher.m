@implementation _SLExtensionLazyMatcher

- (_SLExtensionLazyMatcher)initWithIdentifier:(id)a3
{
  id v4;
  _SLExtensionLazyMatcher *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SLExtensionLazyMatcher;
  v5 = -[_SLExtensionLazyMatcher init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (NSExtension)extension
{
  uint64_t v2;
  NSExtension *extension;
  NSString *identifier;
  NSExtension *v6;
  id v7;
  NSExtension *v8;
  id v10;

  extension = self->_extension;
  if (!extension)
  {
    identifier = self->_identifier;
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", identifier, &v10);
    v6 = (NSExtension *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = self->_extension;
    self->_extension = v6;

    _SLLog(v2, 7, CFSTR("_SLExtensionLazyMatcher for %@ got extension %@ error %{public}@"));
    extension = self->_extension;
  }
  return extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
