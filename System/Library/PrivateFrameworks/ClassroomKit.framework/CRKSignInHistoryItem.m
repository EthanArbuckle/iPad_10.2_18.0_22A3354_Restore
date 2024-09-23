@implementation CRKSignInHistoryItem

- (CRKSignInHistoryItem)initWithIdentifier:(id)a3 appleID:(id)a4 date:(id)a5 deviceName:(id)a6 deviceSerialNumber:(id)a7 userGivenName:(id)a8 userFamilyName:(id)a9 userFullName:(id)a10 userMonogram:(id)a11
{
  id v18;
  CRKSignInHistoryItem *v19;
  CRKSignInHistoryItem *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)CRKSignInHistoryItem;
  v19 = -[CRKSignInHistoryItem init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_appleID, a4);
    objc_storeStrong((id *)&v20->_date, a5);
    objc_storeStrong((id *)&v20->_deviceName, a6);
    objc_storeStrong((id *)&v20->_deviceSerialNumber, a7);
    objc_storeStrong((id *)&v20->_userGivenName, a8);
    objc_storeStrong((id *)&v20->_userFamilyName, a9);
    objc_storeStrong((id *)&v20->_userFullName, a10);
    objc_storeStrong((id *)&v20->_userMonogram, a11);
  }

  return v20;
}

- (CRKSignInHistoryItem)initWithDictionary:(id)a3
{
  id v4;
  CRKSignInHistoryItem *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *identifier;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *appleID;
  void *v14;
  void *v15;
  NSDate *v16;
  NSDate *date;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *deviceName;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *deviceSerialNumber;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *userGivenName;
  void *v30;
  void *v31;
  NSString *v32;
  NSString *userFamilyName;
  void *v34;
  void *v35;
  NSString *v36;
  NSString *userFullName;
  void *v38;
  void *v39;
  NSString *v40;
  NSString *userMonogram;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CRKSignInHistoryItem;
  v5 = -[CRKSignInHistoryItem init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    identifier = v5->_identifier;
    v5->_identifier = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    appleID = v5->_appleID;
    v5->_appleID = v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    date = v5->_date;
    v5->_date = v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    deviceName = v5->_deviceName;
    v5->_deviceName = v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceSerialNumber"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userGivenName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    userGivenName = v5->_userGivenName;
    v5->_userGivenName = v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFamilyName"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    v32 = v31;

    userFamilyName = v5->_userFamilyName;
    v5->_userFamilyName = v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFullName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v36 = v35;

    userFullName = v5->_userFullName;
    v5->_userFullName = v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userMonogram"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
    v40 = v39;

    userMonogram = v5->_userMonogram;
    v5->_userMonogram = v40;

  }
  return v5;
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

  v3 = (void *)objc_opt_new();
  -[CRKSignInHistoryItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  -[CRKSignInHistoryItem appleID](self, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appleID"));

  -[CRKSignInHistoryItem date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("date"));

  -[CRKSignInHistoryItem deviceName](self, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceName"));

  -[CRKSignInHistoryItem deviceSerialNumber](self, "deviceSerialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceSerialNumber"));

  -[CRKSignInHistoryItem userGivenName](self, "userGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("userGivenName"));

  -[CRKSignInHistoryItem userFamilyName](self, "userFamilyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("userFamilyName"));

  -[CRKSignInHistoryItem userFullName](self, "userFullName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("userFullName"));

  -[CRKSignInHistoryItem userMonogram](self, "userMonogram");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("userMonogram"));

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSignInHistoryItem)initWithCoder:(id)a3
{
  id v4;
  CRKSignInHistoryItem *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *appleID;
  void *v12;
  uint64_t v13;
  NSDate *date;
  void *v15;
  uint64_t v16;
  NSString *deviceName;
  void *v18;
  uint64_t v19;
  NSString *deviceSerialNumber;
  void *v21;
  uint64_t v22;
  NSString *userGivenName;
  void *v24;
  uint64_t v25;
  NSString *userFamilyName;
  void *v27;
  uint64_t v28;
  NSString *userFullName;
  void *v30;
  uint64_t v31;
  NSString *userMonogram;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CRKSignInHistoryItem;
  v5 = -[CRKSignInHistoryItem init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("appleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("date"));
    v13 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("deviceName"));
    v16 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("deviceSerialNumber"));
    v19 = objc_claimAutoreleasedReturnValue();
    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = (NSString *)v19;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("userGivenName"));
    v22 = objc_claimAutoreleasedReturnValue();
    userGivenName = v5->_userGivenName;
    v5->_userGivenName = (NSString *)v22;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("userFamilyName"));
    v25 = objc_claimAutoreleasedReturnValue();
    userFamilyName = v5->_userFamilyName;
    v5->_userFamilyName = (NSString *)v25;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("userFullName"));
    v28 = objc_claimAutoreleasedReturnValue();
    userFullName = v5->_userFullName;
    v5->_userFullName = (NSString *)v28;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("userMonogram"));
    v31 = objc_claimAutoreleasedReturnValue();
    userMonogram = v5->_userMonogram;
    v5->_userMonogram = (NSString *)v31;

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
  id v13;

  v4 = a3;
  -[CRKSignInHistoryItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[CRKSignInHistoryItem appleID](self, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("appleID"));

  -[CRKSignInHistoryItem date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("date"));

  -[CRKSignInHistoryItem deviceName](self, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("deviceName"));

  -[CRKSignInHistoryItem deviceSerialNumber](self, "deviceSerialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("deviceSerialNumber"));

  -[CRKSignInHistoryItem userGivenName](self, "userGivenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("userGivenName"));

  -[CRKSignInHistoryItem userFamilyName](self, "userFamilyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("userFamilyName"));

  -[CRKSignInHistoryItem userFullName](self, "userFullName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("userFullName"));

  -[CRKSignInHistoryItem userMonogram](self, "userMonogram");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("userMonogram"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CRKSignInHistoryItem dictionaryValue](self, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (id)description
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
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_opt_class();
  -[CRKSignInHistoryItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem appleID](self, "appleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem deviceSerialNumber](self, "deviceSerialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem userGivenName](self, "userGivenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem userFamilyName](self, "userFamilyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem userFullName](self, "userFullName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem userMonogram](self, "userMonogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, appleID = %@, date = %@, deviceName = %@, deviceSerialNumber = %@, userGivenName = %@, userFamilyName = %@, userFullName = %@, userMonogram = %@ }>"), v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CRKSignInHistoryItem *v4;
  BOOL v5;

  v4 = (CRKSignInHistoryItem *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[CRKSignInHistoryItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[CRKSignInHistoryItem isEqualToHistoryItem:](self, "isEqualToHistoryItem:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToHistoryItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CRKSignInHistoryItem *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  CRKSignInHistoryItem *v65;

  v8 = (CRKSignInHistoryItem *)a3;
  if (v8 == self)
  {
    v11 = 1;
    goto LABEL_91;
  }
  -[CRKSignInHistoryItem identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[CRKSignInHistoryItem identifier](v8, "identifier"), (v64 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKSignInHistoryItem identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKSignInHistoryItem identifier](v8, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
    {

      v11 = 0;
      goto LABEL_88;
    }
    v10 = 1;
  }
  else
  {
    v64 = 0;
    v10 = 0;
  }
  -[CRKSignInHistoryItem appleID](self, "appleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[CRKSignInHistoryItem appleID](v8, "appleID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v59)
    {
      v65 = v8;
      v62 = v10;
      v63 = 0;
      v59 = 0;
      goto LABEL_19;
    }
  }
  -[CRKSignInHistoryItem appleID](self, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSignInHistoryItem appleID](v8, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v65 = v8;
    v62 = v10;
    v63 = 1;
LABEL_19:
    -[CRKSignInHistoryItem date](self, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (-[CRKSignInHistoryItem date](v65, "date"), (v54 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKSignInHistoryItem date](self, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSignInHistoryItem date](v65, "date");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v14;
      if (!objc_msgSend(v14, "isEqual:"))
      {
        v11 = 0;
        v8 = v65;
        goto LABEL_79;
      }
      v57 = 1;
    }
    else
    {
      v54 = 0;
      v57 = 0;
    }
    -[CRKSignInHistoryItem deviceName](self, "deviceName");
    v8 = v65;
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58
      || (-[CRKSignInHistoryItem deviceName](v65, "deviceName"),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKSignInHistoryItem deviceName](self, "deviceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSignInHistoryItem deviceName](v65, "deviceName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v15;
      if (!objc_msgSend(v15, "isEqual:", v55))
      {
        v11 = 0;
        goto LABEL_75;
      }
      v52 = 1;
    }
    else
    {
      v49 = 0;
      v52 = 0;
    }
    -[CRKSignInHistoryItem deviceSerialNumber](self, "deviceSerialNumber");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v53
      || (-[CRKSignInHistoryItem deviceSerialNumber](v65, "deviceSerialNumber"),
          (v44 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKSignInHistoryItem deviceSerialNumber](self, "deviceSerialNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSignInHistoryItem deviceSerialNumber](v65, "deviceSerialNumber");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v16;
      if (!objc_msgSend(v16, "isEqual:", v50))
      {
        v11 = 0;
        goto LABEL_71;
      }
      v47 = 1;
    }
    else
    {
      v44 = 0;
      v47 = 0;
    }
    -[CRKSignInHistoryItem userGivenName](self, "userGivenName");
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48
      || (-[CRKSignInHistoryItem userGivenName](v65, "userGivenName"),
          (v39 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKSignInHistoryItem userGivenName](self, "userGivenName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSignInHistoryItem userGivenName](v65, "userGivenName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v17;
      if (!objc_msgSend(v17, "isEqual:", v45))
      {
        v11 = 0;
        goto LABEL_67;
      }
      v42 = 1;
    }
    else
    {
      v39 = 0;
      v42 = 0;
    }
    -[CRKSignInHistoryItem userFamilyName](self, "userFamilyName");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43
      || (-[CRKSignInHistoryItem userFamilyName](v65, "userFamilyName"),
          (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKSignInHistoryItem userFamilyName](self, "userFamilyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSignInHistoryItem userFamilyName](v65, "userFamilyName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v18;
      if (!objc_msgSend(v18, "isEqual:", v40))
      {
        v11 = 0;
        goto LABEL_63;
      }
      v37 = 1;
    }
    else
    {
      v34 = 0;
      v37 = 0;
    }
    -[CRKSignInHistoryItem userFullName](self, "userFullName");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38
      || (-[CRKSignInHistoryItem userFullName](v65, "userFullName"),
          (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKSignInHistoryItem userFullName](self, "userFullName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSignInHistoryItem userFullName](v65, "userFullName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v19;
      if (!objc_msgSend(v19, "isEqual:", v35))
      {
        v11 = 0;
        goto LABEL_59;
      }
      v33 = 1;
    }
    else
    {
      v30 = 0;
      v33 = 0;
    }
    -[CRKSignInHistoryItem userMonogram](self, "userMonogram");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20
      || (-[CRKSignInHistoryItem userMonogram](v65, "userMonogram"), (v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKSignInHistoryItem userMonogram](self, "userMonogram");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSignInHistoryItem userMonogram](v65, "userMonogram");
      v32 = (void *)v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v31, "isEqual:");

      if (v32)
      {

        if (!v33)
          goto LABEL_60;
        goto LABEL_59;
      }
      v28 = (void *)v29;
    }
    else
    {
      v28 = 0;
      v11 = 1;
    }

    if ((v33 & 1) == 0)
    {
LABEL_60:
      v22 = (void *)v38;
      if (!v38)
      {

        v22 = 0;
      }

      if (!v37)
      {
LABEL_64:
        v23 = (void *)v43;
        if (!v43)
        {

          v23 = 0;
        }

        if (!v42)
        {
LABEL_68:
          v24 = (void *)v48;
          if (!v48)
          {

            v24 = 0;
          }

          if (!v47)
          {
LABEL_72:
            v25 = (void *)v53;
            if (!v53)
            {

              v25 = 0;
            }

            if (!v52)
            {
LABEL_76:
              v26 = (void *)v58;
              if (!v58)
              {

                v26 = 0;
              }

              if (!v57)
              {
LABEL_80:
                if (!v13)

                if (v63)
                {

                }
                if (!v12)

                if (!v62)
                  goto LABEL_88;
                goto LABEL_87;
              }
LABEL_79:

              goto LABEL_80;
            }
LABEL_75:

            goto LABEL_76;
          }
LABEL_71:

          goto LABEL_72;
        }
LABEL_67:

        goto LABEL_68;
      }
LABEL_63:

      goto LABEL_64;
    }
LABEL_59:

    goto LABEL_60;
  }

  if (v12)
  else

  v11 = 0;
  if ((v10 & 1) != 0)
  {
LABEL_87:

  }
LABEL_88:
  if (!v9)

LABEL_91:
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (NSString)userGivenName
{
  return self->_userGivenName;
}

- (NSString)userFamilyName
{
  return self->_userFamilyName;
}

- (NSString)userFullName
{
  return self->_userFullName;
}

- (NSString)userMonogram
{
  return self->_userMonogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userMonogram, 0);
  objc_storeStrong((id *)&self->_userFullName, 0);
  objc_storeStrong((id *)&self->_userFamilyName, 0);
  objc_storeStrong((id *)&self->_userGivenName, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
