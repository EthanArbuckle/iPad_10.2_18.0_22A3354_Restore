@implementation CKDFetchServerCertificatesOperation

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/server-certificates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    objc_msgSend_error(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend_fetchServerCertificates(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
  {
    v5 = CFSTR("Fetching Server Certificates");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchServerCertificatesOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)fetchServerCertificates
{
  uint64_t v2;
  NSObject *v4;
  const void *ApplePinned;
  CKDFetchServerCertificatesURLRequest *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  id location;

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  ApplePinned = (const void *)SecPolicyCreateApplePinned();
  v6 = [CKDFetchServerCertificatesURLRequest alloc];
  v8 = (void *)objc_msgSend_initWithOperation_verifyWithPolicy_(v6, v7, (uint64_t)self, ApplePinned);
  if (ApplePinned)
    CFRelease(ApplePinned);
  objc_initWeak(&location, v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEC875A0;
  v15[3] = &unk_1E782E4E0;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  objc_msgSend_setCompletionBlock_(v8, v9, (uint64_t)v15);
  objc_msgSend_setRequest_(self, v10, (uint64_t)v8);
  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v13, v14, (uint64_t)v8);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (NSArray)validatedTrusts
{
  return self->_validatedTrusts;
}

- (void)setValidatedTrusts:(id)a3
{
  objc_storeStrong((id *)&self->_validatedTrusts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedTrusts, 0);
}

@end
