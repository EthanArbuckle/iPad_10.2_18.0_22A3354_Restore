@implementation AMSBagDataSourceChange

- (AMSBagDataSourceChange)initWithProfile:(id)a3 profileVersion:(id)a4 originalData:(id)a5 originalExpirationDate:(id)a6 updatedData:(id)a7 updatedExpirationDate:(id)a8 changedKeys:(id)a9 loadedBagIdentifier:(id)a10 loadedBagPartialIdentifier:(id)a11 accountIdentifier:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  AMSBagDataSourceChange *v29;
  uint64_t v30;
  NSString *profile;
  uint64_t v32;
  NSString *profileVersion;
  uint64_t v34;
  NSDictionary *originalData;
  uint64_t v36;
  NSDictionary *updatedData;
  uint64_t v38;
  NSSet *changedKeys;
  uint64_t v40;
  NSString *loadedBagIdentifier;
  uint64_t v42;
  NSString *loadedBagPartialIdentifier;
  uint64_t v44;
  NSString *accountIdentifier;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  id v53;
  id v54;
  id v55;
  objc_super v57;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  obj = a6;
  v20 = a6;
  v21 = v17;
  v55 = v20;
  v22 = a7;
  v53 = a8;
  v54 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBagDataSourceChange.m"), 26, CFSTR("Unexpected nil reference: %s"), "profile");

  }
  v27 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBagDataSourceChange.m"), 27, CFSTR("Unexpected nil reference: %s"), "profileVersion");

  }
  v28 = v23;
  if (v22)
  {
    if (v24)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBagDataSourceChange.m"), 28, CFSTR("Unexpected nil reference: %s"), "updatedData");

    if (v24)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBagDataSourceChange.m"), 29, CFSTR("Unexpected nil reference: %s"), "loadedBagIdentifier");

LABEL_7:
  v57.receiver = self;
  v57.super_class = (Class)AMSBagDataSourceChange;
  v29 = -[AMSBagDataSourceChange init](&v57, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v21, "copy");
    profile = v29->_profile;
    v29->_profile = (NSString *)v30;

    v32 = objc_msgSend(v27, "copy");
    profileVersion = v29->_profileVersion;
    v29->_profileVersion = (NSString *)v32;

    v34 = objc_msgSend(v19, "copy");
    originalData = v29->_originalData;
    v29->_originalData = (NSDictionary *)v34;

    objc_storeStrong((id *)&v29->_originalExpirationDate, obj);
    v36 = objc_msgSend(v22, "copy");
    updatedData = v29->_updatedData;
    v29->_updatedData = (NSDictionary *)v36;

    objc_storeStrong((id *)&v29->_updatedExpirationDate, v53);
    v38 = objc_msgSend(v28, "copy");
    changedKeys = v29->_changedKeys;
    v29->_changedKeys = (NSSet *)v38;

    v40 = objc_msgSend(v24, "copy");
    loadedBagIdentifier = v29->_loadedBagIdentifier;
    v29->_loadedBagIdentifier = (NSString *)v40;

    v42 = objc_msgSend(v25, "copy");
    loadedBagPartialIdentifier = v29->_loadedBagPartialIdentifier;
    v29->_loadedBagPartialIdentifier = (NSString *)v42;

    v44 = objc_msgSend(v26, "copy");
    accountIdentifier = v29->_accountIdentifier;
    v29->_accountIdentifier = (NSString *)v44;

  }
  return v29;
}

- (NSSet)changedKeys
{
  return self->_changedKeys;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDictionary)updatedData
{
  return self->_updatedData;
}

- (NSDate)updatedExpirationDate
{
  return self->_updatedExpirationDate;
}

- (NSString)loadedBagPartialIdentifier
{
  return self->_loadedBagPartialIdentifier;
}

- (NSString)loadedBagIdentifier
{
  return self->_loadedBagIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedKeys, 0);
  objc_storeStrong((id *)&self->_updatedExpirationDate, 0);
  objc_storeStrong((id *)&self->_updatedData, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_originalExpirationDate, 0);
  objc_storeStrong((id *)&self->_originalData, 0);
  objc_storeStrong((id *)&self->_loadedBagPartialIdentifier, 0);
  objc_storeStrong((id *)&self->_loadedBagIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (NSDictionary)originalData
{
  return self->_originalData;
}

- (NSDate)originalExpirationDate
{
  return self->_originalExpirationDate;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

@end
