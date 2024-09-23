@implementation ISTransparentIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_35 != -1)
    dispatch_once(&sharedInstance_onceToken_35, &__block_literal_global_36);
  return (id)sharedInstance_sharedInstance_34;
}

void __35__ISTransparentIcon_sharedInstance__block_invoke()
{
  ISTransparentIcon *v0;
  void *v1;

  v0 = objc_alloc_init(ISTransparentIcon);
  v1 = (void *)sharedInstance_sharedInstance_34;
  sharedInstance_sharedInstance_34 = (uint64_t)v0;

}

- (ISTransparentIcon)init
{
  void *v3;
  ISTransparentIcon *v4;
  uint64_t v5;
  ISResourceProvider *resourceProvider;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_nullUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ISTransparentIcon;
  v4 = -[ISConcreteIcon initWithDigest:](&v8, sel_initWithDigest_, v3);

  if (v4)
  {
    v5 = objc_opt_new();
    resourceProvider = v4->_resourceProvider;
    v4->_resourceProvider = (ISResourceProvider *)v5;

  }
  return v4;
}

- (ISTransparentIcon)initWithCoder:(id)a3
{
  ISTransparentIcon *v4;

  +[ISTransparentIcon sharedInstance](ISTransparentIcon, "sharedInstance", a3);
  v4 = (ISTransparentIcon *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeResourceProvider
{
  return self->_resourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProvider, 0);
}

@end
