@implementation CKDPCSIdentityWrapper

- (CKDPCSIdentityWrapper)initWithIdentitySet:(_PCSIdentitySetData *)a3 withPrimaryServiceName:(id)a4
{
  id v7;
  CKDPCSIdentityWrapper *v8;
  CKDPCSIdentityWrapper *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDPCSIdentityWrapper;
  v8 = -[CKDPCSIdentityWrapper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_identitySet = a3;
    if (a3)
      CFRetain(a3);
    objc_storeStrong((id *)&v9->_primaryServiceName, a4);
  }

  return v9;
}

- (void)dealloc
{
  _PCSIdentitySetData *identitySet;
  objc_super v4;

  identitySet = self->_identitySet;
  if (identitySet)
  {
    CFRelease(identitySet);
    self->_identitySet = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSIdentityWrapper;
  -[CKDPCSIdentityWrapper dealloc](&v4, sel_dealloc);
}

- (NSString)identityString
{
  CKDPCSIdentityWrapper *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *identityString;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_identityString)
  {
    objc_msgSend_primaryServiceName(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_identitySet(v2, v6, v7);
    CKBasicStringForIdentitySet(v5, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    identityString = v2->_identityString;
    v2->_identityString = (NSString *)v9;

  }
  objc_sync_exit(v2);

  return v2->_identityString;
}

- (_PCSIdentitySetData)identitySet
{
  return self->_identitySet;
}

- (NSString)primaryServiceName
{
  return self->_primaryServiceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryServiceName, 0);
  objc_storeStrong((id *)&self->_identityString, 0);
}

@end
