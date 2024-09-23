@implementation CKVAdministratorFactory

- (CKVAdministratorFactory)initWithServiceProvider:(id)a3
{
  id v5;
  CKVAdministratorFactory *v6;
  CKVAdministratorFactory *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  CKVAdministratorFactory *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKVAdministratorFactory;
  v6 = -[CKVAdministratorFactory init](&v14, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  objc_storeStrong((id *)&v6->_serviceProvider, a3);
  if (v7->_serviceProvider)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("CKVAdministratorQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

LABEL_4:
    v11 = v7;
    goto LABEL_8;
  }
  v12 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CKVAdministratorFactory initWithServiceProvider:]";
    _os_log_error_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_ERROR, "%s Cannot initialize Administrator with nil service provider.", buf, 0xCu);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (CKVAdministratorFactory)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use - initWithServiceProvider"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)administrator
{
  CKVocabularyAdministrator *v3;
  void *v4;
  CKVocabularyAdministrator *v5;

  v3 = [CKVocabularyAdministrator alloc];
  -[CKVAdminServiceProvider adminService](self->_serviceProvider, "adminService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKVocabularyAdministrator initWithAdminService:queue:](v3, "initWithAdminService:queue:", v4, self->_queue);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

+ (id)sharedAdministratorFactory
{
  if (sharedAdministratorFactory_onceToken != -1)
    dispatch_once(&sharedAdministratorFactory_onceToken, &__block_literal_global_628);
  return (id)sharedAdministratorFactory_sharedAdministratorFactory;
}

void __53__CKVAdministratorFactory_sharedAdministratorFactory__block_invoke()
{
  CKVAdministratorFactory *v0;
  uint64_t v1;
  void *v2;
  CKVAdminXPCServiceWrapper *v3;

  v0 = [CKVAdministratorFactory alloc];
  v3 = objc_alloc_init(CKVAdminXPCServiceWrapper);
  v1 = -[CKVAdministratorFactory initWithServiceProvider:](v0, "initWithServiceProvider:", v3);
  v2 = (void *)sharedAdministratorFactory_sharedAdministratorFactory;
  sharedAdministratorFactory_sharedAdministratorFactory = v1;

}

@end
