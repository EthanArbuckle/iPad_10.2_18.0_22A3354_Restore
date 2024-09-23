@implementation LKUser

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)setAutogeneratesPhoneticNameWithLocale:(id)a3
{
  objc_storeStrong((id *)&gPhoneticNameLocale, a3);
}

- (LKUser)initWithCoder:(id)a3
{
  id v4;
  LKUser *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)LKUser;
  v5 = -[LKUser init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setIdentifier:](v5, "setIdentifier:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("givenName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setGivenName:](v5, "setGivenName:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("familyName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setFamilyName:](v5, "setFamilyName:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("phoneticGivenName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setPhoneticGivenName:](v5, "setPhoneticGivenName:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("phoneticFamilyName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setPhoneticFamilyName:](v5, "setPhoneticFamilyName:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("mediumImageURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setMediumImageURL:](v5, "setMediumImageURL:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("largeImageURL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setLargeImageURL:](v5, "setLargeImageURL:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("displayName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setDisplayName:](v5, "setDisplayName:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("username"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setUsername:](v5, "setUsername:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("passwordType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setPasswordType:](v5, "setPasswordType:", objc_msgSend(v21, "integerValue"));

    -[LKUser setPasscodeType:](v5, "setPasscodeType:", +[LKUser UMUserPasscodeTypeFromLKPasswordType:](LKUser, "UMUserPasscodeTypeFromLKPasswordType:", -[LKUser passwordType](v5, "passwordType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("lastOnlineAuth"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setLastOnlineAuth:](v5, "setLastOnlineAuth:", v22);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v8, v10, v11, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("namingSimilarityInfoByClassID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setNamingSimilarityInfoByClassID:](v5, "setNamingSimilarityInfoByClassID:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[LKUser setTokenizedPhoneticDisplayName:](v5, "setTokenizedPhoneticDisplayName:", v25);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[LKUser identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LKUser givenName](self, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("givenName"));

  -[LKUser familyName](self, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("familyName"));

  -[LKUser phoneticGivenName](self, "phoneticGivenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("phoneticGivenName"));

  -[LKUser phoneticFamilyName](self, "phoneticFamilyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("phoneticFamilyName"));

  -[LKUser mediumImageURL](self, "mediumImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("mediumImageURL"));

  -[LKUser largeImageURL](self, "largeImageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("largeImageURL"));

  -[LKUser displayName](self, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("displayName"));

  -[LKUser username](self, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("username"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[LKUser passwordType](self, "passwordType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("passwordType"));

  -[LKUser lastOnlineAuth](self, "lastOnlineAuth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("lastOnlineAuth"));

  -[LKUser namingSimilarityInfoByClassID](self, "namingSimilarityInfoByClassID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("namingSimilarityInfoByClassID"));

  -[LKUser tokenizedPhoneticDisplayName](self, "tokenizedPhoneticDisplayName");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("phoneticName"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LKUser identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LKUser *v4;
  LKUser *v5;
  BOOL v6;

  v4 = (LKUser *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[LKUser isEqualToLKUser:](self, "isEqualToLKUser:", v5);

  return v6;
}

- (BOOL)isEqualToLKUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  char v33;

  v4 = a3;
  -[LKUser identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_23;
  -[LKUser givenName](self, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_23;
  -[LKUser familyName](self, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_23;
  -[LKUser mediumImageURL](self, "mediumImageURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || (objc_msgSend(v4, "mediumImageURL"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[LKUser mediumImageURL](self, "mediumImageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediumImageURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v14)
    {

      if (!v17)
        goto LABEL_23;
    }
    else
    {

      if ((v17 & 1) == 0)
        goto LABEL_23;
    }
  }
  -[LKUser largeImageURL](self, "largeImageURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v4, "largeImageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_16;
  }
  -[LKUser largeImageURL](self, "largeImageURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "largeImageURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if (v18)
  {

    if (!v21)
      goto LABEL_23;
LABEL_16:
    -[LKUser displayName](self, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (!v24)
      goto LABEL_23;
    -[LKUser username](self, "username");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqualToString:", v26);

    if (!v27)
      goto LABEL_23;
    v28 = -[LKUser passwordType](self, "passwordType");
    if (v28 != objc_msgSend(v4, "passwordType"))
      goto LABEL_23;
    -[LKUser lastOnlineAuth](self, "lastOnlineAuth");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 || (objc_msgSend(v4, "lastOnlineAuth"), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[LKUser lastOnlineAuth](self, "lastOnlineAuth");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastOnlineAuth");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31) ^ 1;

      if (v29)
      {
LABEL_27:

        v33 = v32 ^ 1;
        goto LABEL_24;
      }
    }
    else
    {
      LOBYTE(v32) = 0;
    }

    goto LABEL_27;
  }

  if ((v21 & 1) != 0)
    goto LABEL_16;
LABEL_23:
  v33 = 0;
LABEL_24:

  return v33;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)LKUser;
  v5 = -[LKUser copyWithZone:](&v18, sel_copyWithZone_);
  +[LKUser userFromUMUser:](LKUser, "userFromUMUser:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasswordType:", -[LKUser passwordType](self, "passwordType"));
  -[LKUser identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  objc_msgSend(v6, "setIdentifier:", v8);

  -[LKUser phoneticGivenName](self, "phoneticGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  objc_msgSend(v6, "setPhoneticGivenName:", v10);

  -[LKUser phoneticFamilyName](self, "phoneticFamilyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  objc_msgSend(v6, "setPhoneticFamilyName:", v12);

  -[LKUser mediumImageURL](self, "mediumImageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  objc_msgSend(v6, "setMediumImageURL:", v14);

  -[LKUser largeImageURL](self, "largeImageURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  objc_msgSend(v6, "setLargeImageURL:", v16);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)LKUser;
  v5 = -[LKUser mutableCopyWithZone:](&v18, sel_mutableCopyWithZone_);
  +[LKUser userFromUMUser:](LKUser, "userFromUMUser:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasswordType:", -[LKUser passwordType](self, "passwordType"));
  -[LKUser identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  objc_msgSend(v6, "setIdentifier:", v8);

  -[LKUser phoneticGivenName](self, "phoneticGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  objc_msgSend(v6, "setPhoneticGivenName:", v10);

  -[LKUser phoneticFamilyName](self, "phoneticFamilyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  objc_msgSend(v6, "setPhoneticFamilyName:", v12);

  -[LKUser mediumImageURL](self, "mediumImageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  objc_msgSend(v6, "setMediumImageURL:", v14);

  -[LKUser largeImageURL](self, "largeImageURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  objc_msgSend(v6, "setLargeImageURL:", v16);

  return v6;
}

+ (id)userFromUMUser:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v4, "setUid:", objc_msgSend(v3, "uid"));
    objc_msgSend(v4, "setGid:", objc_msgSend(v3, "gid"));
    objc_msgSend(v3, "alternateDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlternateDSID:", v5);

    objc_msgSend(v3, "homeDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHomeDirectoryURL:", v6);

    objc_msgSend(v3, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsername:", v7);

    objc_msgSend(v3, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGivenName:", v8);

    objc_msgSend(v3, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFamilyName:", v9);

    objc_msgSend(v3, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayName:", v10);

    objc_msgSend(v3, "photoURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPhotoURL:", v11);

    objc_msgSend(v3, "photoURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalMediumImageURL:", v12);

    objc_msgSend(v3, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCreationDate:", v13);

    objc_msgSend(v3, "lastLoginDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastLoginDate:", v14);

    objc_msgSend(v3, "lastRemoteAuthDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastRemoteAuthDate:", v15);

    objc_msgSend(v4, "setIsLoginUser:", objc_msgSend(v3, "isLoginUser"));
    objc_msgSend(v4, "setIsAuditor:", objc_msgSend(v3, "isAuditor"));
    objc_msgSend(v4, "setIsDisabled:", objc_msgSend(v3, "isDisabled"));
    objc_msgSend(v4, "setPasscodeLockGracePeriod:", objc_msgSend(v3, "passcodeLockGracePeriod"));
    objc_msgSend(v3, "languages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLanguages:", v16);

    objc_msgSend(v4, "setHasManagedCredentials:", objc_msgSend(v3, "hasManagedCredentials"));
    objc_msgSend(v4, "setRetryCount:", 0);
    objc_msgSend(v4, "setPasscodeType:", objc_msgSend(v3, "passcodeType"));
    objc_msgSend(v4, "setPasswordType:", +[LKUser LKPasswordTypeFromUMUserPasscodeType:](LKUser, "LKPasswordTypeFromUMUserPasscodeType:", objc_msgSend(v3, "passcodeType")));
  }

  return v4;
}

+ (id)userFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  id v50;

  v4 = a3;
  LKRegisterLoginKitLogging();
  v5 = (void *)objc_opt_new();
  if (!v5)
    goto LABEL_37;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GivenName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FamilyName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFamilyName:", v9);

  objc_msgSend(v5, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {

    goto LABEL_6;
  }
  objc_msgSend(v5, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
LABEL_6:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v13);
    goto LABEL_7;
  }
  objc_msgSend(v5, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "givenName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[LKUser fullNameWithFamilyName:givenName:](LKUser, "fullNameWithFamilyName:givenName:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v15);

LABEL_7:
  objc_msgSend(v5, "givenName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "familyName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !v17)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v5, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "personNameComponentsFromString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (v16)
      {
        if (v17)
          goto LABEL_20;
        objc_msgSend(v5, "givenName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "givenName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if (!v23)
          goto LABEL_20;
        goto LABEL_18;
      }
      if (!v17)
      {
        objc_msgSend(v20, "givenName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setGivenName:", v28);

LABEL_18:
        objc_msgSend(v20, "familyName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setFamilyName:", v27);
        goto LABEL_19;
      }
      objc_msgSend(v5, "familyName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "familyName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (v26)
      {
        objc_msgSend(v20, "givenName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setGivenName:", v27);
LABEL_19:

      }
    }
LABEL_20:

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhoneticGivenName"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhoneticGivenName:", v29);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhoneticFamilyName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhoneticFamilyName:", v30);

  objc_msgSend(v5, "phoneticGivenName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v5, "setIsPhoneticInfoProvidedInConfiguration:", 1);
  }
  else
  {
    objc_msgSend(v5, "phoneticFamilyName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsPhoneticInfoProvidedInConfiguration:", v32 != 0);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageURL"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediumImageURL:", v34);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "BOOLForKey:", CFSTR("LUIAllowNonHttpsUrls"));

    if ((v36 & 1) == 0)
    {
      objc_msgSend(v5, "mediumImageURL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "scheme");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("https"));

      if ((v39 & 1) == 0)
      {
        v40 = (void *)LKLogParsing;
        if (os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEBUG))
          +[LKUser userFromDictionary:].cold.1(v40, v5);
        objc_msgSend(v5, "setMediumImageURL:", 0);
      }
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FullScreenImageURL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLargeImageURL:", v42);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "BOOLForKey:", CFSTR("LUIAllowNonHttpsUrls"));

    if ((v44 & 1) == 0)
    {
      objc_msgSend(v5, "largeImageURL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "scheme");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("https"));

      if ((v47 & 1) == 0)
      {
        v48 = (void *)LKLogParsing;
        if (os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEBUG))
          +[LKUser userFromDictionary:].cold.1(v48, v5);
        objc_msgSend(v5, "setLargeImageURL:", 0);
      }
    }
  }
  objc_msgSend(v5, "setLocalLargeImageURL:", 0);
  objc_msgSend(v5, "setLocalMediumImageURL:", 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PasscodeType"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasswordType:", objc_msgSend(a1, "passwordTypeFromPasswordTypeString:", v49));

  objc_msgSend(v5, "setPasscodeType:", +[LKUser UMUserPasscodeTypeFromLKPasswordType:](LKUser, "UMUserPasscodeTypeFromLKPasswordType:", objc_msgSend(v5, "passwordType")));
  v50 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "setNamingSimilarityInfoByClassID:", v50);

  objc_msgSend(v5, "setRetryCount:", 0);
LABEL_37:

  return v5;
}

- (void)setDiffUMUserPropertiesFromUMUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self)
  {
    if (a3)
    {
      v4 = a3;
      -[LKUser setUid:](self, "setUid:", objc_msgSend(v4, "uid"));
      -[LKUser setGid:](self, "setGid:", objc_msgSend(v4, "gid"));
      objc_msgSend(v4, "alternateDSID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LKUser setAlternateDSID:](self, "setAlternateDSID:", v5);

      objc_msgSend(v4, "homeDirectoryURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LKUser setHomeDirectoryURL:](self, "setHomeDirectoryURL:", v6);

      objc_msgSend(v4, "creationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LKUser setCreationDate:](self, "setCreationDate:", v7);

      objc_msgSend(v4, "lastLoginDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LKUser setLastLoginDate:](self, "setLastLoginDate:", v8);

      objc_msgSend(v4, "lastRemoteAuthDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LKUser setLastRemoteAuthDate:](self, "setLastRemoteAuthDate:", v9);

      -[LKUser setIsLoginUser:](self, "setIsLoginUser:", objc_msgSend(v4, "isLoginUser"));
      -[LKUser setIsDisabled:](self, "setIsDisabled:", objc_msgSend(v4, "isDisabled"));
      -[LKUser setIsAuditor:](self, "setIsAuditor:", objc_msgSend(v4, "isAuditor"));
      -[LKUser setPasscodeLockGracePeriod:](self, "setPasscodeLockGracePeriod:", objc_msgSend(v4, "passcodeLockGracePeriod"));
      objc_msgSend(v4, "languages");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[LKUser setLanguages:](self, "setLanguages:", v10);
    }
  }
}

- (void)setLocalLargeImageURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;

  v5 = (NSURL *)a3;
  if (self->_localLargeImageURL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_localLargeImageURL, a3);
    v5 = v6;
  }

}

- (void)setLocalMediumImageURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;

  v5 = (NSURL *)a3;
  if (self->_localMediumImageURL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_localMediumImageURL, a3);
    -[LKUser setPhotoURL:](self, "setPhotoURL:", self->_localMediumImageURL);
    v5 = v6;
  }

}

- (NSString)tokenizedPhoneticDisplayName
{
  __CFString *v3;
  void *v4;
  __CFStringTokenizer *v5;
  void *v6;
  void *v7;
  NSString *v9;
  NSString *tokenizedPhoneticDisplayName;
  CFRange v11;

  if (gPhoneticNameLocale)
  {
    if (!-[LKUser isAttemptedPhoneticTranscription](self, "isAttemptedPhoneticTranscription")
      && !self->_tokenizedPhoneticDisplayName)
    {
      -[LKUser setIsAttemptedPhoneticTranscription:](self, "setIsAttemptedPhoneticTranscription:", 1);
      -[LKUser displayName](self, "displayName");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[LKUser displayName](self, "displayName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11.length = objc_msgSend(v4, "length");
      v11.location = 0;
      v5 = CFStringTokenizerCreate(0, v3, v11, 0, (CFLocaleRef)gPhoneticNameLocale);

      if (v5)
      {
        v6 = (void *)objc_opt_new();
        while (CFStringTokenizerAdvanceToNextToken(v5))
        {
          v7 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(v5, 0x1000000uLL);
          if (v7)
            objc_msgSend(v6, "appendString:", v7);

        }
        v9 = (NSString *)objc_msgSend(v6, "copy");
        tokenizedPhoneticDisplayName = self->_tokenizedPhoneticDisplayName;
        self->_tokenizedPhoneticDisplayName = v9;

        CFRelease(v5);
      }
    }
  }
  return self->_tokenizedPhoneticDisplayName;
}

- (CNContact)contact
{
  CNContact *contact;
  CNContact *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNContact *v12;

  contact = self->_contact;
  if (!contact)
  {
    v4 = (CNContact *)objc_opt_new();
    if (!-[LKUser isPhoneticInfoProvidedInConfiguration](self, "isPhoneticInfoProvidedInConfiguration"))
    {
      -[LKUser tokenizedPhoneticDisplayName](self, "tokenizedPhoneticDisplayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[LKUser tokenizedPhoneticDisplayName](self, "tokenizedPhoneticDisplayName");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
        v7 = (void *)v6;
        -[CNContact setGivenName:](v4, "setGivenName:", v6);
LABEL_10:

        v12 = self->_contact;
        self->_contact = v4;

        contact = self->_contact;
        return contact;
      }
    }
    -[LKUser givenName](self, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (-[LKUser familyName](self, "familyName"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if (!-[LKUser isPhoneticInfoProvidedInConfiguration](self, "isPhoneticInfoProvidedInConfiguration"))
    {
      -[LKUser displayName](self, "displayName");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    -[LKUser givenName](self, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact setGivenName:](v4, "setGivenName:", v9);

    -[LKUser familyName](self, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact setFamilyName:](v4, "setFamilyName:", v10);

    -[LKUser phoneticGivenName](self, "phoneticGivenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact setPhoneticGivenName:](v4, "setPhoneticGivenName:", v11);

    -[LKUser phoneticFamilyName](self, "phoneticFamilyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact setPhoneticFamilyName:](v4, "setPhoneticFamilyName:", v7);
    goto LABEL_10;
  }
  return contact;
}

+ (id)fullNameWithFamilyName:(id)a3 givenName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setGivenName:", v5);

  objc_msgSend(v7, "setFamilyName:", v6);
  objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v7, 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)passwordTypeFromPasswordTypeString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("four")) & 1) != 0)
      v5 = 2;
    else
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("six"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (unint64_t)LKPasswordTypeFromUMUserPasscodeType:(unint64_t)a3
{
  if (a3)
    return a3 == 1;
  else
    return 2;
}

+ (unint64_t)UMUserPasscodeTypeFromLKPasswordType:(unint64_t)a3
{
  unint64_t v3;

  v3 = 3;
  if (a3 == 1)
    v3 = 1;
  if (a3 == 2)
    return 0;
  else
    return v3;
}

- (unint64_t)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(unint64_t)a3
{
  self->_passwordType = a3;
}

- (NSURL)mediumImageURL
{
  return self->_mediumImageURL;
}

- (void)setMediumImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_mediumImageURL, a3);
}

- (NSURL)largeImageURL
{
  return self->_largeImageURL;
}

- (void)setLargeImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_largeImageURL, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticGivenName, a3);
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticFamilyName, a3);
}

- (NSDate)lastOnlineAuth
{
  return self->_lastOnlineAuth;
}

- (void)setLastOnlineAuth:(id)a3
{
  objc_storeStrong((id *)&self->_lastOnlineAuth, a3);
}

- (NSURL)localMediumImageURL
{
  return self->_localMediumImageURL;
}

- (NSURL)localLargeImageURL
{
  return self->_localLargeImageURL;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSMutableDictionary)namingSimilarityInfoByClassID
{
  return self->_namingSimilarityInfoByClassID;
}

- (void)setNamingSimilarityInfoByClassID:(id)a3
{
  objc_storeStrong((id *)&self->_namingSimilarityInfoByClassID, a3);
}

- (BOOL)isPhoneticInfoProvidedInConfiguration
{
  return self->_isPhoneticInfoProvidedInConfiguration;
}

- (void)setIsPhoneticInfoProvidedInConfiguration:(BOOL)a3
{
  self->_isPhoneticInfoProvidedInConfiguration = a3;
}

- (void)setTokenizedPhoneticDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizedPhoneticDisplayName, a3);
}

- (BOOL)isAttemptedPhoneticTranscription
{
  return self->_isAttemptedPhoneticTranscription;
}

- (void)setIsAttemptedPhoneticTranscription:(BOOL)a3
{
  self->_isAttemptedPhoneticTranscription = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizedPhoneticDisplayName, 0);
  objc_storeStrong((id *)&self->_namingSimilarityInfoByClassID, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_localLargeImageURL, 0);
  objc_storeStrong((id *)&self->_localMediumImageURL, 0);
  objc_storeStrong((id *)&self->_lastOnlineAuth, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_largeImageURL, 0);
  objc_storeStrong((id *)&self->_mediumImageURL, 0);
}

+ (void)userFromDictionary:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = a1;
  objc_msgSend(a2, "mediumImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2167FC000, v7, v8, "Ignoring image url (%{private}@) for user (%{private}@). Https URLs are required.", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2();
}

@end
