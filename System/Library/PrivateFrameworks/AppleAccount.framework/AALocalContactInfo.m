@implementation AALocalContactInfo

- (AALocalContactInfo)initWithHandle:(id)a3 firstName:(id)a4 lastName:(id)a5
{
  id v9;
  id v10;
  id v11;
  AALocalContactInfo *v12;
  AALocalContactInfo *v13;
  uint64_t v14;
  NSString *fullName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AALocalContactInfo;
  v12 = -[AALocalContactInfo init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handle, a3);
    objc_storeStrong((id *)&v13->_firstName, a4);
    objc_storeStrong((id *)&v13->_lastName, a5);
    -[AALocalContactInfo _fullNameFromFirstName:lastName:](v13, "_fullNameFromFirstName:lastName:", v10, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    fullName = v13->_fullName;
    v13->_fullName = (NSString *)v14;

  }
  return v13;
}

- (AALocalContactInfo)initWithHandle:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AALocalContactInfo *v10;
  uint64_t v11;
  NSData *imageData;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AALocalContactInfo initWithHandle:firstName:lastName:](self, "initWithHandle:firstName:lastName:", v7, v8, v9);

  if (v10)
  {
    objc_msgSend(v6, "thumbnailImageData");
    v11 = objc_claimAutoreleasedReturnValue();
    imageData = v10->_imageData;
    v10->_imageData = (NSData *)v11;

  }
  return v10;
}

- (AALocalContactInfo)initWithFamilyDSID:(id)a3 firstName:(id)a4 lastName:(id)a5 fullName:(id)a6 appleID:(id)a7 familyMemberType:(id)a8 isChild:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  AALocalContactInfo *v19;
  AALocalContactInfo *v20;

  v16 = a3;
  v17 = a6;
  v18 = a8;
  v19 = -[AALocalContactInfo initWithHandle:firstName:lastName:](self, "initWithHandle:firstName:lastName:", a7, a4, a5);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_fullName, a6);
    objc_storeStrong((id *)&v20->_familyDSID, a3);
    objc_storeStrong((id *)&v20->_familyMemberType, a8);
    v20->_contactType |= 0x10uLL;
    v20->_isChild = a9;
  }

  return v20;
}

- (AALocalContactInfo)initWithCoder:(id)a3
{
  id v4;
  AALocalContactInfo *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *fullName;
  uint64_t v10;
  NSString *firstName;
  uint64_t v12;
  NSString *lastName;
  uint64_t v14;
  NSData *imageData;
  uint64_t v16;
  NSNumber *familyDSID;
  uint64_t v18;
  NSString *familyMemberType;
  uint64_t v20;
  NSUUID *custodianID;
  uint64_t v22;
  AAInheritanceContactInfo *inheritanceContactInfo;

  v4 = a3;
  v5 = -[AALocalContactInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fullName"));
    v8 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_firstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageData"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_familyDSID"));
    v16 = objc_claimAutoreleasedReturnValue();
    familyDSID = v5->_familyDSID;
    v5->_familyDSID = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_familyMemberType"));
    v18 = objc_claimAutoreleasedReturnValue();
    familyMemberType = v5->_familyMemberType;
    v5->_familyMemberType = (NSString *)v18;

    v5->_isChild = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isChild"));
    v5->_contactType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_contactType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianID"));
    v20 = objc_claimAutoreleasedReturnValue();
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v20;

    v5->_trustedContactStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_trustedContactStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_inheritanceContactInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    inheritanceContactInfo = v5->_inheritanceContactInfo;
    v5->_inheritanceContactInfo = (AAInheritanceContactInfo *)v22;

    v5->_isAcceptedAndShared = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isAcceptedAndShared"));
    v5->_isIdMSConfirmed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isIdMSConfirmed"));
    v5->_preflightStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_preflightStatus"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("_handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullName, CFSTR("_fullName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("_firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("_lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("_imageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyDSID, CFSTR("_familyDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyMemberType, CFSTR("_familyMemberType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isChild, CFSTR("_isChild"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contactType, CFSTR("_contactType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianID, CFSTR("_custodianID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_trustedContactStatus, CFSTR("_trustedContactStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inheritanceContactInfo, CFSTR("_inheritanceContactInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAcceptedAndShared, CFSTR("_isAcceptedAndShared"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIdMSConfirmed, CFSTR("_isIdMSConfirmed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preflightStatus, CFSTR("_preflightStatus"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int64_t contactType;
  uint64_t v22;
  void *v23;

  v4 = objc_opt_new();
  v5 = -[NSString copy](self->_handle, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_fullName, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSString copy](self->_firstName, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  v11 = -[NSString copy](self->_lastName, "copy");
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  v13 = -[NSData copy](self->_imageData, "copy");
  v14 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v13;

  v15 = -[NSNumber copy](self->_familyDSID, "copy");
  v16 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v15;

  v17 = -[NSString copy](self->_familyMemberType, "copy");
  v18 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v17;

  *(_BYTE *)(v4 + 8) = self->_isChild;
  *(_QWORD *)(v4 + 72) = self->_contactType;
  v19 = -[NSUUID copy](self->_custodianID, "copy");
  v20 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v19;

  *(_QWORD *)(v4 + 88) = self->_trustedContactStatus;
  contactType = self->_contactType;
  if ((contactType & 4) != 0 || (contactType & 8) != 0)
  {
    v22 = -[AAInheritanceContactInfo copy](self->_inheritanceContactInfo, "copy");
    v23 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v22;

  }
  *(_BYTE *)(v4 + 9) = self->_isAcceptedAndShared;
  *(_BYTE *)(v4 + 10) = self->_isIdMSConfirmed;
  *(_QWORD *)(v4 + 96) = self->_preflightStatus;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[AALocalContactInfo _isEqualToLocalContact:](self, "_isEqualToLocalContact:", v4);

  return v5;
}

- (id)displayName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[AALocalContactInfo fullName](self, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[AALocalContactInfo fullName](self, "fullName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AALocalContactInfo handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      -[AALocalContactInfo handle](self, "handle");
    else
      -[AALocalContactInfo firstName](self, "firstName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)firstNameOrHandleForDisplay
{
  void *v3;
  uint64_t v4;

  -[AALocalContactInfo firstName](self, "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[AALocalContactInfo firstName](self, "firstName");
  else
    -[AALocalContactInfo handle](self, "handle");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isFamilyMember
{
  return ((unint64_t)-[AALocalContactInfo contactType](self, "contactType") >> 4) & 1;
}

- (id)_fullNameFromFirstName:(id)a3 lastName:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3850];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setGivenName:", v7);

  objc_msgSend(v8, "setFamilyName:", v6);
  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v8, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_isEqualToLocalContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[AALocalContactInfo handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  return v9;
}

- (id)_detailsTextForContactType
{
  int64_t contactType;
  void *v4;
  void *v5;
  const __CFString *v6;
  int64_t v7;
  void *v8;

  contactType = self->_contactType;
  if ((contactType & 1) != 0)
  {
    v7 = -[AALocalContactInfo trustedContactStatus](self, "trustedContactStatus");
    if (v7 == 3)
      goto LABEL_15;
    if (v7 != 2)
    {
      if (v7 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("ACCOUNT_RECOVERY_CONTACT_STATUS_PENDING");
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    if (!-[AALocalContactInfo preflightStatus](self, "preflightStatus"))
    {
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ACCOUNT_RECOVERY_CONTACT_STATUS_NOT_REACHABLE");
      goto LABEL_17;
    }
    if (!-[AALocalContactInfo isAcceptedAndShared](self, "isAcceptedAndShared")
      || !-[AALocalContactInfo isIdMSConfirmed](self, "isIdMSConfirmed"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ACCOUNT_RECOVERY_CONTACT_STATUS_ACCEPTED_BUT_SHARE_PENDING");
      goto LABEL_17;
    }
LABEL_14:
    v8 = 0;
    return v8;
  }
  if ((contactType & 4) != 0 && -[AALocalContactInfo trustedContactStatus](self, "trustedContactStatus") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("ACCOUNT_BENEFICIARY_CONTACT_STATUS_PENDING");
LABEL_17:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  if (!-[AALocalContactInfo isFamilyMember](self, "isFamilyMember"))
    goto LABEL_14;
  -[AALocalContactInfo familyMemberType](self, "familyMemberType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSNumber)familyDSID
{
  return self->_familyDSID;
}

- (NSString)familyMemberType
{
  return self->_familyMemberType;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)contactType
{
  return self->_contactType;
}

- (void)setContactType:(int64_t)a3
{
  self->_contactType = a3;
}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (void)setCustodianID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)trustedContactStatus
{
  return self->_trustedContactStatus;
}

- (void)setTrustedContactStatus:(int64_t)a3
{
  self->_trustedContactStatus = a3;
}

- (BOOL)isAcceptedAndShared
{
  return self->_isAcceptedAndShared;
}

- (void)setIsAcceptedAndShared:(BOOL)a3
{
  self->_isAcceptedAndShared = a3;
}

- (BOOL)isIdMSConfirmed
{
  return self->_isIdMSConfirmed;
}

- (void)setIsIdMSConfirmed:(BOOL)a3
{
  self->_isIdMSConfirmed = a3;
}

- (int64_t)preflightStatus
{
  return self->_preflightStatus;
}

- (void)setPreflightStatus:(int64_t)a3
{
  self->_preflightStatus = a3;
}

- (AAInheritanceContactInfo)inheritanceContactInfo
{
  return self->_inheritanceContactInfo;
}

- (void)setInheritanceContactInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inheritanceContactInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inheritanceContactInfo, 0);
  objc_storeStrong((id *)&self->_custodianID, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_familyMemberType, 0);
  objc_storeStrong((id *)&self->_familyDSID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
