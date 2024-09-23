@implementation CKDiscoveredUserInfo

- (id)userRecordID
{
  void *v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v5 = v3;
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_fault_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKUserIdentity", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)displayContact
{
  void *v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v5 = v3;
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_fault_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKUserIdentity", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)firstName
{
  void *v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v5 = v3;
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_fault_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKUserIdentity", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)lastName
{
  void *v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v5 = v3;
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_fault_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKUserIdentity", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

@end
