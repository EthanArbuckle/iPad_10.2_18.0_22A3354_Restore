@implementation AOSThreadManager

+ (id)sharedManager
{
  id result;

  result = (id)_sharedMgr;
  if (!_sharedMgr)
  {
    result = objc_alloc_init(AOSThreadManager);
    _sharedMgr = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AOSThreadManager;
  -[AOSThreadManager dealloc](&v2, sel_dealloc);
}

- (void)runAuthThreadWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CFIndex v10;
  CFErrorRef v11;
  int v12;
  const void *v13;
  char v14;
  char v15;
  void *v16;

  v4 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v5 = objc_msgSend(a3, "account");
  v6 = objc_msgSend(a3, "transaction");
  v7 = (void *)objc_msgSend(a3, "info");
  v8 = objc_msgSend(v7, "objectForKey:", kAOSAuthPreviousTokenKey);
  v9 = (void *)objc_msgSend(v7, "objectForKey:", kAOSAuthRequestURLKey);
  if (v5)
  {
    AOSAccountGetUser(v5);
    AOSAccountGetPassword(v5);
  }
  if (!_AOSValidateURL(v9))
  {
    NSLog(CFSTR("AOSKit ERROR: RAF: Invalid url -- %@"), v9);
    v10 = 5001;
    goto LABEL_7;
  }
  if (v8 || (v16 = AOSAccountCopyAuthInfo(v5, v9, 0, 0)) == 0 || (v13 = v16, objc_msgSend(v16, "count") != 2))
  {
    v10 = 5002;
LABEL_7:
    v11 = CFErrorCreate(0, kAOSErrorDomain, v10, 0);
    v12 = 0;
    v13 = 0;
    v14 = v11 == 0;
    goto LABEL_8;
  }
  AOSTransactionSetResult(v6, v13);
  v11 = 0;
  v12 = 1;
  v14 = 1;
LABEL_8:
  AOSTransactionSetError(v6, v11);
  AOSTransactionSetSuccessful(v6, v14);
  AOSTransactionSetIsFinished(v6, 1);
  if ((v14 & 1) == 0)
    CFRelease(v11);
  if (v12)
    CFRelease(v13);
  v15 = objc_msgSend(a3, "scheduleCallback");
  if (a3 && (v15 & 1) == 0)
    CFRelease(a3);
  objc_msgSend(v4, "drain");
}

@end
