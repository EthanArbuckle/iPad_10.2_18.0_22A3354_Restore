@implementation CKSyncEngineFetchChangesContext

- (CKSyncEngineFetchChangesContext)initWithReason:(int64_t)a3 options:(id)a4
{
  id v7;
  CKSyncEngineFetchChangesContext *v8;
  CKSyncEngineFetchChangesContext *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKSyncEngineFetchChangesContext;
  v8 = -[CKSyncEngineFetchChangesContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_reason = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const __CFString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v4 = a3;
  v8 = objc_msgSend_reason(self, v5, v6, v7);
  v10 = CFSTR("Unknown");
  if (v8 == 1)
    v10 = CFSTR("Manual");
  if (v8)
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("reason"), (uint64_t)v10, 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("reason"), (uint64_t)CFSTR("Scheduled"), 0);
  objc_msgSend_options(self, v11, v12, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("options"), (uint64_t)v15, 0);

}

- (CKSyncEngineSyncReason)reason
{
  return self->_reason;
}

- (CKSyncEngineFetchChangesOptions)options
{
  return (CKSyncEngineFetchChangesOptions *)objc_getProperty(self, a2, 16, 1);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchChangesContext *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("FetchChangesContext");
}

- (CKSyncEngineFetchChangesContext)init
{
  CKException *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = [CKException alloc];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, (uint64_t)CFSTR("-[%@ init] is unavailable"), v5);

  objc_exception_throw(v7);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchChangesContext *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

@end
