@implementation FPProvider

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPProvider;
  -[FPProviderDomain encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSortDescriptors, 0);
}

- (FPProvider)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPProvider;
  return -[FPProviderDomain initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)beginMonitoringProviderChangesWithHandler:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___FPProvider;
  objc_msgSendSuper2(&v4, sel_beginMonitoringProviderDomainChangesWithHandler_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)endMonitoringProviderChanges:(id)a3
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___FPProvider;
  objc_msgSendSuper2(&v3, sel_endMonitoringProviderDomainChanges_, a3);
}

+ (void)fetchProviderForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__FPProvider_fetchProviderForItem_completionHandler___block_invoke;
  v8[3] = &unk_1E444AB08;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "fetchProviderDomainForItem:completionHandler:", a3, v8);

}

uint64_t __53__FPProvider_fetchProviderForItem_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSURL)storageURL
{
  void *v2;
  void *v3;

  -[FPProviderDomain storageURLs](self, "storageURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSArray)supportedSortDescriptors
{
  return self->_supportedSortDescriptors;
}

- (int64_t)type
{
  return self->_type;
}

@end
