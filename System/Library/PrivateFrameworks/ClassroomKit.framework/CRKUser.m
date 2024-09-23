@implementation CRKUser

- (CRKUser)init
{
  return -[CRKUser initWithDictionary:](self, "initWithDictionary:", MEMORY[0x24BDBD1B8]);
}

- (CRKUser)initWithDictionary:(id)a3
{
  id v4;
  CRKUser *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *userIdentifier;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *displayName;
  uint64_t v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *givenName;
  uint64_t v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  void *familyName;
  uint64_t v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *phoneticGivenName;
  uint64_t v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  NSString *v45;
  void *phoneticFamilyName;
  uint64_t v47;
  NSString *v48;
  void *v49;
  void *v50;
  void *v51;
  NSString *v52;
  void *imageURL;
  uint64_t v54;
  NSString *v55;
  void *v56;
  uint64_t v57;
  NSString *imageIdentifier;
  void *v59;
  uint64_t v60;
  NSString *userSource;
  void *v62;
  uint64_t v63;
  NSData *userImageData;
  void *v65;
  void *v66;
  void *v67;
  objc_super v69;

  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)CRKUser;
  v5 = -[CRKUser init](&v69, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      userIdentifier = v5->_userIdentifier;
      v5->_userIdentifier = v9;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Identifier"));
      userIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(userIdentifier, "copy");
      v12 = (void *)v11;
      if (v11)
        v13 = (__CFString *)v11;
      else
        v13 = CFSTR("INVALID_IDENTIFIER");
      objc_storeStrong((id *)&v5->_userIdentifier, v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      displayName = v5->_displayName;
      v5->_displayName = v17;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
      displayName = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(displayName, "copy");
      v20 = v5->_displayName;
      v5->_displayName = (NSString *)v19;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GivenName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    v23 = v22;
    if (v22)
    {
      v24 = v22;
      givenName = v5->_givenName;
      v5->_givenName = v24;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GivenName"));
      givenName = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(givenName, "copy");
      v27 = v5->_givenName;
      v5->_givenName = (NSString *)v26;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FamilyName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    v30 = v29;
    if (v29)
    {
      v31 = v29;
      familyName = v5->_familyName;
      v5->_familyName = v31;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FamilyName"));
      familyName = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(familyName, "copy");
      v34 = v5->_familyName;
      v5->_familyName = (NSString *)v33;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhoneticGivenName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    v37 = v36;
    if (v36)
    {
      v38 = v36;
      phoneticGivenName = v5->_phoneticGivenName;
      v5->_phoneticGivenName = v38;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhoneticGivenName"));
      phoneticGivenName = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(phoneticGivenName, "copy");
      v41 = v5->_phoneticGivenName;
      v5->_phoneticGivenName = (NSString *)v40;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhoneticFamilyName"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    v44 = v43;
    if (v43)
    {
      v45 = v43;
      phoneticFamilyName = v5->_phoneticFamilyName;
      v5->_phoneticFamilyName = v45;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhoneticFamilyName"));
      phoneticFamilyName = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(phoneticFamilyName, "copy");
      v48 = v5->_phoneticFamilyName;
      v5->_phoneticFamilyName = (NSString *)v47;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageURL"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v49, "copy");
    v51 = v50;
    if (v50)
    {
      v52 = v50;
      imageURL = v5->_imageURL;
      v5->_imageURL = v52;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageURL"));
      imageURL = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(imageURL, "copy");
      v55 = v5->_imageURL;
      v5->_imageURL = (NSString *)v54;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageIdentifier"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "copy");
    imageIdentifier = v5->_imageIdentifier;
    v5->_imageIdentifier = (NSString *)v57;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserSource"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "copy");
    userSource = v5->_userSource;
    v5->_userSource = (NSString *)v60;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageData"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "copy");
    userImageData = v5->_userImageData;
    v5->_userImageData = (NSData *)v63;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Role"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Role"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_role = objc_msgSend(v66, "unsignedIntegerValue");

    }
    else
    {
      v5->_role = 0;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UseMeCardIfAvailable"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useMeCardIfAvailable = objc_msgSend(v67, "BOOLValue");

  }
  return v5;
}

+ (id)makeMeCardUserProvider
{
  return (id)objc_opt_new();
}

+ (id)customUserFromMeCardUser:(id)a3
{
  id v3;
  CRKUser *v4;
  void *v5;
  CRKUser *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "isMeCardUser"))
  {
    v4 = [CRKUser alloc];
    objc_msgSend(v3, "dictionaryValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRKUser initWithDictionary:](v4, "initWithDictionary:", v5);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKUser setUserIdentifier:](v6, "setUserIdentifier:", v8);

    -[CRKUser setUserSource:](v6, "setUserSource:", CFSTR("Custom"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSPersonNameComponents)nameComponents
{
  void *v3;
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

  v3 = (void *)objc_opt_new();
  -[CRKUser givenName](self, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    -[CRKUser givenName](self, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGivenName:", v6);

    -[CRKUser familyName](self, "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFamilyName:", v7);
    goto LABEL_5;
  }
  -[CRKUser familyName](self, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  -[CRKUser displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v7);
LABEL_5:

  -[CRKUser phoneticGivenName](self, "phoneticGivenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_8:
    v10 = (void *)objc_opt_new();
    objc_msgSend(v3, "setPhoneticRepresentation:", v10);

    -[CRKUser phoneticGivenName](self, "phoneticGivenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phoneticRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGivenName:", v11);

    -[CRKUser phoneticFamilyName](self, "phoneticFamilyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phoneticRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFamilyName:", v13);

    return (NSPersonNameComponents *)v3;
  }
  -[CRKUser phoneticFamilyName](self, "phoneticFamilyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_8;
  return (NSPersonNameComponents *)v3;
}

- (id)dictionaryValue
{
  void *v3;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = (void *)objc_opt_new();
  -[CRKUser userIdentifier](self, "userIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CRKUser userIdentifier](self, "userIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Identifier"));

  }
  -[CRKUser displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRKUser displayName](self, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Name"));

  }
  -[CRKUser givenName](self, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CRKUser givenName](self, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("GivenName"));

  }
  -[CRKUser familyName](self, "familyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CRKUser familyName](self, "familyName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("FamilyName"));

  }
  -[CRKUser phoneticGivenName](self, "phoneticGivenName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CRKUser phoneticGivenName](self, "phoneticGivenName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("PhoneticGivenName"));

  }
  -[CRKUser phoneticFamilyName](self, "phoneticFamilyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CRKUser phoneticFamilyName](self, "phoneticFamilyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("PhoneticFamilyName"));

  }
  -[CRKUser imageURL](self, "imageURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CRKUser imageURL](self, "imageURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("ImageURL"));

  }
  -[CRKUser userSource](self, "userSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CRKUser userSource](self, "userSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("UserSource"));

  }
  -[CRKUser userImageData](self, "userImageData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CRKUser userImageData](self, "userImageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("ImageData"));

  }
  -[CRKUser imageIdentifier](self, "imageIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CRKUser imageIdentifier](self, "imageIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ImageIdentifier"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKUser role](self, "role"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("Role"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKUser shouldUseMeCardIfAvailable](self, "shouldUseMeCardIfAvailable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("UseMeCardIfAvailable"));

  return v3;
}

- (BOOL)isMeCardUser
{
  void *v2;
  char v3;

  -[CRKUser userSource](self, "userSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("MeCard"));

  return v3;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CRKUser givenName](self, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[CRKUser familyName](self, "familyName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (id)description
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[CRKUser userIdentifier](self, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKUser displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKUser givenName](self, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKUser familyName](self, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[CRKUser imageURL](self, "imageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 1;
  }
  else
  {
    -[CRKUser imageIdentifier](self, "imageIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v2 != 0;
  }
  objc_msgSend(v10, "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p {identifier = %@, displayName = %@, given = %@, family = %@, hasImage = %@ }>"), v5, self, v6, v7, v8, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  void *v22;
  void *v23;

  -[CRKUser userIdentifier](self, "userIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v23, "hash");
  -[CRKUser displayName](self, "displayName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v22, "hash") ^ v3;
  -[CRKUser givenName](self, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[CRKUser familyName](self, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash");
  -[CRKUser phoneticGivenName](self, "phoneticGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[CRKUser phoneticFamilyName](self, "phoneticFamilyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[CRKUser imageURL](self, "imageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");
  -[CRKUser imageIdentifier](self, "imageIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  -[CRKUser userSource](self, "userSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  v19 = v18 ^ -[CRKUser role](self, "role");
  v20 = v14 ^ v19 ^ -[CRKUser shouldUseMeCardIfAvailable](self, "shouldUseMeCardIfAvailable");

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  CRKUser *v4;
  CRKUser *v5;
  BOOL v6;

  v4 = (CRKUser *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CRKUser isEqualToUser:](self, "isEqualToUser:", v5);

  return v6;
}

- (BOOL)isEqualToUser:(id)a3
{
  CRKUser *v3;
  void *v4;
  void *v5;
  id v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  CRKUser *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  CRKUser *v20;
  void *v21;
  CRKUser *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  CRKUser *v28;
  uint64_t v29;
  _BOOL4 v30;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  void *v69;
  void *v70;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = self;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("CRKUser.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

    self = v3;
  }
  -[CRKUser userIdentifier](self, "userIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "userIdentifier"), (v69 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKUser userIdentifier](self, "userIdentifier");
    v3 = (CRKUser *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CRKUser isEqual:](v3, "isEqual:", v4))
    {
      LOBYTE(v11) = 0;
LABEL_87:

      goto LABEL_88;
    }
    v10 = 1;
  }
  else
  {
    v69 = 0;
    v10 = 0;
  }
  -[CRKUser displayName](self, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v8, "displayName"), (v64 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKUser displayName](self, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v13;
    if (!objc_msgSend(v13, "isEqual:", v5))
    {
      LOBYTE(v11) = 0;
      goto LABEL_85;
    }
    v67 = 1;
    v68 = v10;
  }
  else
  {
    v67 = 0;
    v68 = v10;
    v64 = 0;
  }
  -[CRKUser givenName](self, "givenName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || (objc_msgSend(v8, "givenName"), (v59 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = self;
    -[CRKUser givenName](self, "givenName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "givenName");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v16;
    if (!objc_msgSend(v16, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_81;
    }
    v63 = 1;
  }
  else
  {
    v15 = self;
    v59 = 0;
    v63 = 0;
  }
  -[CRKUser familyName](v15, "familyName");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62 || (objc_msgSend(v8, "familyName"), (v54 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKUser familyName](v15, "familyName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "familyName");
    v60 = v17;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_78;
    }
    v58 = 1;
  }
  else
  {
    v54 = 0;
    v58 = 0;
  }
  -[CRKUser phoneticGivenName](v15, "phoneticGivenName");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57 || (objc_msgSend(v8, "phoneticGivenName"), (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKUser phoneticGivenName](v15, "phoneticGivenName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneticGivenName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v18;
    if (!objc_msgSend(v18, "isEqual:"))
    {
      LOBYTE(v11) = 0;
LABEL_75:

      goto LABEL_76;
    }
    v19 = 1;
  }
  else
  {
    v50 = 0;
    v19 = 0;
  }
  v53 = v19;
  v20 = v15;
  -[CRKUser phoneticFamilyName](v15, "phoneticFamilyName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 || (objc_msgSend(v8, "phoneticFamilyName"), (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = v20;
    -[CRKUser phoneticFamilyName](v20, "phoneticFamilyName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneticFamilyName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_38;
    }
    v49 = 1;
  }
  else
  {
    v22 = v20;
    v45 = 0;
    v49 = 0;
  }
  -[CRKUser imageURL](v22, "imageURL");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48 || (objc_msgSend(v8, "imageURL"), (v40 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKUser imageURL](v22, "imageURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v25;
    if (!objc_msgSend(v25, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_45;
    }
    v44 = 1;
  }
  else
  {
    v40 = 0;
    v44 = 0;
  }
  -[CRKUser imageIdentifier](v22, "imageIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43 || (objc_msgSend(v8, "imageIdentifier"), (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKUser imageIdentifier](v22, "imageIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v26;
    if (!objc_msgSend(v26, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      v24 = v53;
      goto LABEL_66;
    }
    v38 = 1;
  }
  else
  {
    v35 = 0;
    v38 = 0;
  }
  -[CRKUser userSource](v22, "userSource");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39 || (objc_msgSend(v8, "userSource"), (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKUser userSource](v22, "userSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v27;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      v24 = v53;
      goto LABEL_63;
    }
    v34 = 1;
  }
  else
  {
    v33 = 0;
    v34 = 0;
  }
  v28 = v22;
  v29 = -[CRKUser role](v22, "role");
  if (v29 != objc_msgSend(v8, "role"))
  {
    LOBYTE(v11) = 0;
    v24 = v53;
    if (!v34)
      goto LABEL_64;
    goto LABEL_63;
  }
  v30 = -[CRKUser shouldUseMeCardIfAvailable](v28, "shouldUseMeCardIfAvailable");
  v11 = v30 ^ objc_msgSend(v8, "shouldUseMeCardIfAvailable") ^ 1;
  v24 = v53;
  if ((v34 & 1) != 0)
  {
LABEL_63:

  }
LABEL_64:
  if (v39)
  {

    if (!v38)
      goto LABEL_67;
    goto LABEL_66;
  }

  if ((v38 & 1) != 0)
  {
LABEL_66:

  }
LABEL_67:
  if (v43)
  {

    if (!v44)
      goto LABEL_70;
    goto LABEL_69;
  }

  if ((v44 & 1) != 0)
  {
LABEL_45:
    v24 = v53;
LABEL_69:

    goto LABEL_70;
  }
  v24 = v53;
LABEL_70:
  if (v48)
  {

    if (!v49)
      goto LABEL_73;
    goto LABEL_72;
  }

  if ((v49 & 1) != 0)
  {
LABEL_38:
    v24 = v53;
LABEL_72:

LABEL_73:
    if (v21)
      goto LABEL_74;
    goto LABEL_104;
  }
  v24 = v53;
  if (v21)
  {
LABEL_74:

    if (!v24)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_104:

  if ((v24 & 1) != 0)
    goto LABEL_75;
LABEL_76:
  if (v57)
  {

    if (!v58)
      goto LABEL_79;
    goto LABEL_78;
  }

  if ((v58 & 1) != 0)
  {
LABEL_78:

  }
LABEL_79:
  if (v62)
  {

    if (!v63)
      goto LABEL_82;
    goto LABEL_81;
  }

  if ((v63 & 1) != 0)
  {
LABEL_81:

  }
LABEL_82:
  if (v14)
  {

    if (v67)
    {
LABEL_84:
      v10 = v68;
LABEL_85:

      if (v12)
        goto LABEL_86;
      goto LABEL_93;
    }
  }
  else
  {

    if ((v67 & 1) != 0)
      goto LABEL_84;
  }
  v10 = v68;
  if (v12)
  {
LABEL_86:

    if (!v10)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_93:

  if ((v10 & 1) != 0)
    goto LABEL_87;
LABEL_88:
  if (!v9)

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[CRKUser userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserIdentifier:", v5);

  -[CRKUser displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v6);

  -[CRKUser givenName](self, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v7);

  -[CRKUser familyName](self, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v8);

  -[CRKUser phoneticGivenName](self, "phoneticGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneticGivenName:", v9);

  -[CRKUser phoneticFamilyName](self, "phoneticFamilyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneticFamilyName:", v10);

  -[CRKUser userImageData](self, "userImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setUserImageData:", v12);

  -[CRKUser imageIdentifier](self, "imageIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageIdentifier:", v13);

  -[CRKUser imageURL](self, "imageURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageURL:", v14);

  -[CRKUser userSource](self, "userSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserSource:", v15);

  objc_msgSend(v4, "setRole:", -[CRKUser role](self, "role"));
  objc_msgSend(v4, "setUseMeCardIfAvailable:", -[CRKUser shouldUseMeCardIfAvailable](self, "shouldUseMeCardIfAvailable"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKUser)initWithCoder:(id)a3
{
  id v5;
  CRKUser *v6;
  void *v7;
  uint64_t v8;
  NSString *userIdentifier;
  void *v10;
  uint64_t v11;
  NSString *displayName;
  void *v13;
  uint64_t v14;
  NSString *givenName;
  void *v16;
  uint64_t v17;
  NSString *familyName;
  void *v19;
  uint64_t v20;
  NSString *phoneticGivenName;
  void *v22;
  uint64_t v23;
  NSString *phoneticFamilyName;
  void *v25;
  uint64_t v26;
  NSString *imageURL;
  void *v28;
  uint64_t v29;
  NSString *imageIdentifier;
  void *v31;
  uint64_t v32;
  NSString *userSource;
  void *v34;
  void *v35;
  void *v37;
  objc_super v38;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKUser.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aDecoder"));

  }
  v38.receiver = self;
  v38.super_class = (Class)CRKUser;
  v6 = -[CRKUser init](&v38, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("userIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v6->_userIdentifier;
    v6->_userIdentifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("displayName"));
    v11 = objc_claimAutoreleasedReturnValue();
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v11;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("givenName"));
    v14 = objc_claimAutoreleasedReturnValue();
    givenName = v6->_givenName;
    v6->_givenName = (NSString *)v14;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v16, CFSTR("familyName"));
    v17 = objc_claimAutoreleasedReturnValue();
    familyName = v6->_familyName;
    v6->_familyName = (NSString *)v17;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("phoneticGivenName"));
    v20 = objc_claimAutoreleasedReturnValue();
    phoneticGivenName = v6->_phoneticGivenName;
    v6->_phoneticGivenName = (NSString *)v20;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v22, CFSTR("phoneticFamilyName"));
    v23 = objc_claimAutoreleasedReturnValue();
    phoneticFamilyName = v6->_phoneticFamilyName;
    v6->_phoneticFamilyName = (NSString *)v23;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v25, CFSTR("imageURL"));
    v26 = objc_claimAutoreleasedReturnValue();
    imageURL = v6->_imageURL;
    v6->_imageURL = (NSString *)v26;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v28, CFSTR("imageIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    imageIdentifier = v6->_imageIdentifier;
    v6->_imageIdentifier = (NSString *)v29;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v31, CFSTR("userSource"));
    v32 = objc_claimAutoreleasedReturnValue();
    userSource = v6->_userSource;
    v6->_userSource = (NSString *)v32;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_role = objc_msgSend(v34, "unsignedIntegerValue");

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useMeCardIfAvailable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_useMeCardIfAvailable = objc_msgSend(v35, "BOOLValue");

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
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

  v17 = a3;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKUser.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aCoder"));

  }
  -[CRKUser userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("userIdentifier"));

  -[CRKUser displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[CRKUser givenName](self, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v7, CFSTR("givenName"));

  -[CRKUser familyName](self, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("familyName"));

  -[CRKUser phoneticGivenName](self, "phoneticGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("phoneticGivenName"));

  -[CRKUser phoneticFamilyName](self, "phoneticFamilyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("phoneticFamilyName"));

  -[CRKUser imageURL](self, "imageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("imageURL"));

  -[CRKUser imageIdentifier](self, "imageIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("imageIdentifier"));

  -[CRKUser userSource](self, "userSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("userSource"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKUser role](self, "role"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("role"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKUser shouldUseMeCardIfAvailable](self, "shouldUseMeCardIfAvailable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("useMeCardIfAvailable"));

}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)userSource
{
  return self->_userSource;
}

- (void)setUserSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (BOOL)shouldUseMeCardIfAvailable
{
  return self->_useMeCardIfAvailable;
}

- (void)setUseMeCardIfAvailable:(BOOL)a3
{
  self->_useMeCardIfAvailable = a3;
}

- (NSData)userImageData
{
  return self->_userImageData;
}

- (void)setUserImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userImageData, 0);
  objc_storeStrong((id *)&self->_userSource, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
