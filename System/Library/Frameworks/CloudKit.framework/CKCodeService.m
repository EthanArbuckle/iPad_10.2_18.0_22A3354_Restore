@implementation CKCodeService

- (CKCodeService)init
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKCodeService.m"), 120, CFSTR("Use -[CKContainer codeServiceWithName:] or -[CKContainer codeServiceWithName:database:] instead of creating your own"));

  return 0;
}

- (id)initInternalWithImplementation:(id)a3 container:(id)a4
{
  id v7;
  id v8;
  CKCodeService *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKCodeService;
  v9 = -[CKCodeService init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  const char *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend_implementation(self, a2, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v8, v9, v7, v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKCodeService *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSString)serviceName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceName(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSURL)serviceInstanceURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceInstanceURL(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (id)boxedDatabaseScope
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_boxedDatabaseScope(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_wrappingCodeService_convenienceConfiguration_(v17, v16, (uint64_t)v4, (uint64_t)self, v15);

}

- (CKContainer)container
{
  return (CKContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (CKCodeServiceImplementation)implementation
{
  return self->_implementation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
