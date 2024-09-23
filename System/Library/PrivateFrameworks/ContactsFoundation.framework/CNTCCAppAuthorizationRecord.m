@implementation CNTCCAppAuthorizationRecord

+ (int64_t)authorizationStatusFromAuthorizationRight:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 1;
  else
    return qword_18F890E70[a3 - 1];
}

+ (unint64_t)authorizationRightFromAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return qword_18F890EA0[a3];
}

- (CNTCCAppAuthorizationRecord)initWithTCCAuthorizationRecord:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  uint64_t authorization_right;
  CNTCCAppAuthorizationRecord *v13;

  v4 = a3;
  tcc_authorization_record_get_subject_identity();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (tcc_identity_get_type())
  {
    v6 = &stru_1E29BCC70;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", tcc_identity_get_identifier(), 4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  tcc_authorization_record_get_subject_attributed_entity();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  v11 = (void *)objc_opt_class();
  authorization_right = tcc_authorization_record_get_authorization_right();

  v13 = -[CNTCCAppAuthorizationRecord initWithBundleIdentifier:localizedName:recordType:authorizationStatus:](self, "initWithBundleIdentifier:localizedName:recordType:authorizationStatus:", v6, v8, v10, objc_msgSend(v11, "authorizationStatusFromAuthorizationRight:", authorization_right));
  return v13;
}

- (CNTCCAppAuthorizationRecord)initWithBundleIdentifier:(id)a3 localizedName:(id)a4 recordType:(int64_t)a5 authorizationStatus:(int64_t)a6
{
  id v11;
  id v12;
  CNTCCAppAuthorizationRecord *v13;
  CNTCCAppAuthorizationRecord *v14;
  CNTCCAppAuthorizationRecord *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNTCCAppAuthorizationRecord;
  v13 = -[CNTCCAppAuthorizationRecord init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v14->_localizedName, a4);
    v14->_recordType = a5;
    v14->_authorizationStatus = a6;
    v15 = v14;
  }

  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
