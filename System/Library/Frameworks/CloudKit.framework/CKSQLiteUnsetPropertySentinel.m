@implementation CKSQLiteUnsetPropertySentinel

+ (id)forwardingTargetForSelector:(SEL)a3
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10[16];

  if (ck_log_initialization_predicate != -1)
    goto LABEL_5;
  while (1)
  {
    v3 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_ERROR, "Attempted to access CKSQLiteUnsetPropertySentinel. This probably means a fetch operation did not include a needed property.", v10, 2u);
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("Attempted to access CKSQLiteUnsetPropertySentinel. This probably means a fetch operation did not include a needed property."), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v6, v7, v8, v9);
    _os_crash();
    __break(1u);
LABEL_5:
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
}

@end
