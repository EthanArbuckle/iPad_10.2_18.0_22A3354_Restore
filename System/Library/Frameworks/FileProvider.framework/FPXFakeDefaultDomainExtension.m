@implementation FPXFakeDefaultDomainExtension

- (FPXFakeDefaultDomainExtension)initWithDomain:(id)a3
{
  id v5;
  FPXFakeDefaultDomainExtension *v6;
  FPXFakeDefaultDomainExtension *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPXFakeDefaultDomainExtension;
  v6 = -[FPXFakeDefaultDomainExtension init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_domain, a3);

  return v7;
}

- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1000, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v7, 0, v8);

  return (id)objc_opt_new();
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    -[FPXFakeDefaultDomainExtension domain](self, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHidden");

    if (v11)
      v12 = -2011;
    else
      v12 = -1000;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), v12, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a7;
  v14 = a8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling createItem on fake extension instance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    v17 = 138543362;
    v18 = v15;
    _os_log_fault_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v17, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 61, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
}

- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling deleteItem on fake extension instance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v16 = 138543362;
    v17 = v14;
    _os_log_fault_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v16, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension deleteItemWithIdentifier:baseVersion:options:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 70, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling fetchContent on fake extension instance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    v15 = 138543362;
    v16 = v13;
    _os_log_fault_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v15, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 80, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
}

- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a8;
  v16 = a9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling modifyItem on fake extension instance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    v19 = 138543362;
    v20 = v17;
    _os_log_fault_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v19, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 92, (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
