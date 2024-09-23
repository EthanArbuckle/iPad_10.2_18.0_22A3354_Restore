@implementation MOSuggestionAssetsArrayTransport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_assets, CFSTR("coderKeyMOSuggestionAssetsArrayTransport"));
}

- (MOSuggestionAssetsArrayTransport)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetsArrayTransport *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *assets;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetsArrayTransport;
  v5 = -[MOSuggestionAssetsArrayTransport init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("coderKeyMOSuggestionAssetsArrayTransport"));
    v9 = objc_claimAutoreleasedReturnValue();
    assets = v5->_assets;
    v5->_assets = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
