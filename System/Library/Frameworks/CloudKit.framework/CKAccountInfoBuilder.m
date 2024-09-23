@implementation CKAccountInfoBuilder

- (CKAccountInfoBuilder)init
{
  CKAccountInfoBuilder *v2;
  CKAccountInfoBuilder *v3;
  const char *v4;
  uint64_t v5;
  _QWORD v7[4];
  CKAccountInfoBuilder *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKAccountInfoBuilder;
  v2 = -[CKAccountInfoBuilder init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!byte_1EDF6A0E0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_18A6ADF0C;
      v7[3] = &unk_1E1F5F640;
      v8 = v2;
      objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, v4, (uint64_t)v7, v5);

    }
    *(_OWORD *)&v3->_accountStatus = xmmword_18A83B980;
    *(_WORD *)&v3->_hasValidCredentials = 0;
    v3->_needsToVerifyTerms = 0;
    v3->_walrusStatus = 0;
    v3->_accountAccessAuthorization = 0;
    v3->_deviceToDeviceEncryptionAvailability = 0;
  }
  return v3;
}

- (id)build
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKAccountInfo *v6;
  int64_t validationCounter;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t hasValidCredentials;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;

  v6 = [CKAccountInfo alloc];
  if (self)
    validationCounter = self->_validationCounter;
  else
    validationCounter = 0;
  v8 = objc_msgSend_accountStatus(self, v3, v4, v5);
  v12 = objc_msgSend_accountPartition(self, v9, v10, v11);
  hasValidCredentials = objc_msgSend_hasValidCredentials(self, v13, v14, v15);
  v20 = objc_msgSend_bypassPCSEncryption(self, v17, v18, v19);
  v24 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v21, v22, v23);
  v28 = objc_msgSend_walrusStatus(self, v25, v26, v27);
  v32 = objc_msgSend_needsToVerifyTerms(self, v29, v30, v31);
  v36 = objc_msgSend_accountAccessAuthorization(self, v33, v34, v35);
  return (id)objc_msgSend_initWithValidationCounter_accountStatus_accountPartition_hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization_(v6, v37, validationCounter, v8, v12, hasValidCredentials, v20, v24, v28, v32, v36);
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (int64_t)accountPartition
{
  return self->_accountPartition;
}

- (void)setAccountPartition:(int64_t)a3
{
  self->_accountPartition = a3;
}

- (BOOL)hasValidCredentials
{
  return self->_hasValidCredentials;
}

- (void)setHasValidCredentials:(BOOL)a3
{
  self->_hasValidCredentials = a3;
}

- (BOOL)bypassPCSEncryption
{
  return self->_bypassPCSEncryption;
}

- (void)setBypassPCSEncryption:(BOOL)a3
{
  self->_bypassPCSEncryption = a3;
}

- (int64_t)deviceToDeviceEncryptionAvailability
{
  return self->_deviceToDeviceEncryptionAvailability;
}

- (void)setDeviceToDeviceEncryptionAvailability:(int64_t)a3
{
  self->_deviceToDeviceEncryptionAvailability = a3;
}

- (int64_t)walrusStatus
{
  return self->_walrusStatus;
}

- (void)setWalrusStatus:(int64_t)a3
{
  self->_walrusStatus = a3;
}

- (BOOL)needsToVerifyTerms
{
  return self->_needsToVerifyTerms;
}

- (void)setNeedsToVerifyTerms:(BOOL)a3
{
  self->_needsToVerifyTerms = a3;
}

- (int64_t)accountAccessAuthorization
{
  return self->_accountAccessAuthorization;
}

- (void)setAccountAccessAuthorization:(int64_t)a3
{
  self->_accountAccessAuthorization = a3;
}

@end
