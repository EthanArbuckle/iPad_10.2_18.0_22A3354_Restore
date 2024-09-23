@implementation CacheDeleteServiceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (BOOL)doNotQuery
{
  return self->_doNotQuery;
}

+ (id)serviceInfoWithExtensionContext:(id)a3
{
  id v3;
  CacheDeleteServiceInfo *v4;

  v3 = a3;
  v4 = -[CacheDeleteServiceInfo initWithExtensionContext:]([CacheDeleteServiceInfo alloc], "initWithExtensionContext:", v3);

  return v4;
}

- (CacheDeleteServiceInfo)initWithExtensionContext:(id)a3
{
  id v5;
  CacheDeleteServiceInfo *v6;
  id *p_isa;
  CacheDeleteServiceInfo *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CacheDeleteServiceInfo;
  v6 = -[CacheDeleteServiceInfo init](&v11, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (!v5 || !v6)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong(p_isa + 2, a3);
LABEL_5:
    v8 = p_isa;
    goto LABEL_9;
  }
  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "extensionContext is not of class NSExtensionContext: %@", buf, 0xCu);
  }

  v8 = 0;
LABEL_9:

  return v8;
}

- (void)setDoNotQuery:(BOOL)a3
{
  self->_doNotQuery = a3;
}

@end
