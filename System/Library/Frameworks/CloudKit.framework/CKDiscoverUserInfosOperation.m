@implementation CKDiscoverUserInfosOperation

- (CKDiscoverUserInfosOperation)initWithEmailAddresses:(id)a3 userRecordIDs:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDiscoverUserInfosOperation;
  return -[CKOperation init](&v5, sel_init, a3, a4);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v9 = v4;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_fault_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!a3)
      return 0;
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_5:
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, (uint64_t)CFSTR("CKInternalErrorDomain"), 1001, CFSTR("%@ is deprecated, and will be removed in a future release."), v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSArray)userRecordIDs
{
  return self->_userRecordIDs;
}

- (void)setUserRecordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (id)discoverUserInfosCompletionBlock
{
  return self->_discoverUserInfosCompletionBlock;
}

- (void)setDiscoverUserInfosCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoverUserInfosCompletionBlock, 0);
  objc_storeStrong((id *)&self->_userRecordIDs, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end
