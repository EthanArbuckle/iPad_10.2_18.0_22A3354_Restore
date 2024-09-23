@implementation _NSFileProviderEmptyItemVersion

+ (id)emptyVersion
{
  if (emptyVersion_onceToken != -1)
    dispatch_once(&emptyVersion_onceToken, &__block_literal_global_96);
  return (id)emptyVersion_instance;
}

- (id)metadataVersion
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (id)contentVersion
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSFileProviderEmptyItemVersion)init
{
  void *v3;
  void *v4;
  _NSFileProviderEmptyItemVersion *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_NSFileProviderEmptyItemVersion;
  v5 = -[NSFileProviderItemVersion initWithContentVersion:metadataVersion:](&v7, sel_initWithContentVersion_metadataVersion_, v3, v4);

  return v5;
}

- (_NSFileProviderEmptyItemVersion)initWithCoder:(id)a3
{
  _NSFileProviderEmptyItemVersion *v4;

  +[_NSFileProviderEmptyItemVersion emptyVersion](_NSFileProviderEmptyItemVersion, "emptyVersion", a3);
  v4 = (_NSFileProviderEmptyItemVersion *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
