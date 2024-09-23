@implementation DMFProfile

- (DMFProfile)initWithUUID:(id)a3 type:(unint64_t)a4 identifier:(id)a5 profileVersion:(int64_t)a6 displayName:(id)a7 organization:(id)a8 profileDescription:(id)a9 isManaged:(BOOL)a10 isLocked:(BOOL)a11 hasRemovalPasscode:(BOOL)a12 isEncrypted:(BOOL)a13 signerCertificates:(id)a14 payloads:(id)a15 restrictions:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  DMFProfile *v25;
  uint64_t v26;
  NSString *UUID;
  uint64_t v28;
  NSString *identifier;
  uint64_t v30;
  NSString *organization;
  uint64_t v32;
  NSString *profileDescription;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v39 = a3;
  v38 = a5;
  v21 = a7;
  v37 = a8;
  v22 = a9;
  v23 = a14;
  v24 = a15;
  v36 = a16;
  v40.receiver = self;
  v40.super_class = (Class)DMFProfile;
  v25 = -[DMFProfile init](&v40, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v39, "copy");
    UUID = v25->_UUID;
    v25->_UUID = (NSString *)v26;

    v25->_type = a4;
    v28 = objc_msgSend(v38, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v28;

    v25->_profileVersion = a6;
    objc_storeStrong((id *)&v25->_displayName, a7);
    v30 = objc_msgSend(v37, "copy");
    organization = v25->_organization;
    v25->_organization = (NSString *)v30;

    v32 = objc_msgSend(v22, "copy");
    profileDescription = v25->_profileDescription;
    v25->_profileDescription = (NSString *)v32;

    v25->_isManaged = a10;
    v25->_isLocked = a11;
    v25->_hasRemovalPasscode = a12;
    v25->_isEncrypted = a13;
    objc_storeStrong((id *)&v25->_signerCertificates, a14);
    objc_storeStrong((id *)&v25->_payloads, a15);
    objc_storeStrong((id *)&v25->_restrictions, a16);
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  int64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;

  v21 = objc_alloc((Class)objc_opt_class());
  -[DMFProfile UUID](self, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[DMFProfile type](self, "type");
  -[DMFProfile identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[DMFProfile profileVersion](self, "profileVersion");
  -[DMFProfile displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfile organization](self, "organization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfile profileDescription](self, "profileDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMFProfile isManaged](self, "isManaged");
  v8 = -[DMFProfile isLocked](self, "isLocked");
  v9 = -[DMFProfile hasRemovalPasscode](self, "hasRemovalPasscode");
  v10 = -[DMFProfile isEncrypted](self, "isEncrypted");
  -[DMFProfile signerCertificates](self, "signerCertificates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfile payloads](self, "payloads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfile restrictions](self, "restrictions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE3(v16) = v10;
  BYTE2(v16) = v9;
  BYTE1(v16) = v8;
  LOBYTE(v16) = v7;
  v14 = (void *)objc_msgSend(v21, "initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:", v20, v19, v18, v17, v4, v5, v6, v16, v11, v12, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFProfile)initWithCoder:(id)a3
{
  id v4;
  DMFProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *UUID;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *displayName;
  void *v17;
  uint64_t v18;
  NSString *organization;
  void *v20;
  uint64_t v21;
  NSString *profileDescription;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *signerCertificates;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *payloads;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSDictionary *restrictions;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)DMFProfile;
  v5 = -[DMFProfile init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("UUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_profileVersion = objc_msgSend(v13, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("displayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("organization"));
    v18 = objc_claimAutoreleasedReturnValue();
    organization = v5->_organization;
    v5->_organization = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("profileDescription"));
    v21 = objc_claimAutoreleasedReturnValue();
    profileDescription = v5->_profileDescription;
    v5->_profileDescription = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isManaged"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isManaged = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isLocked"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isLocked = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasRemovalPasscode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasRemovalPasscode = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isEncrypted"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEncrypted = objc_msgSend(v26, "BOOLValue");

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("signerCertificates"));
    v30 = objc_claimAutoreleasedReturnValue();
    signerCertificates = v5->_signerCertificates;
    v5->_signerCertificates = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("payloads"));
    v35 = objc_claimAutoreleasedReturnValue();
    payloads = v5->_payloads;
    v5->_payloads = (NSArray *)v35;

    v51 = (void *)MEMORY[0x1E0C99E60];
    v50 = objc_opt_class();
    v49 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v50, v49, v37, v38, v39, v40, v41, v42, v43, v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("restrictions"));
    v46 = objc_claimAutoreleasedReturnValue();
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSDictionary *)v46;

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
  void *v17;
  id v18;

  v4 = a3;
  -[DMFProfile UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFProfile type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("type"));

  -[DMFProfile identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DMFProfile profileVersion](self, "profileVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("profileVersion"));

  -[DMFProfile displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("displayName"));

  -[DMFProfile organization](self, "organization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("organization"));

  -[DMFProfile profileDescription](self, "profileDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("profileDescription"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFProfile isManaged](self, "isManaged"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("isManaged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFProfile isLocked](self, "isLocked"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("isLocked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFProfile hasRemovalPasscode](self, "hasRemovalPasscode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("hasRemovalPasscode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFProfile isEncrypted](self, "isEncrypted"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("isEncrypted"));

  -[DMFProfile signerCertificates](self, "signerCertificates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("signerCertificates"));

  -[DMFProfile payloads](self, "payloads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("payloads"));

  -[DMFProfile restrictions](self, "restrictions");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("restrictions"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;

  -[DMFProfile UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DMFProfile type](self, "type") ^ v4;
  -[DMFProfile identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[DMFProfile profileVersion](self, "profileVersion");
  -[DMFProfile displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[DMFProfile organization](self, "organization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[DMFProfile profileDescription](self, "profileDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");
  v15 = -[DMFProfile isManaged](self, "isManaged");
  v16 = v15 ^ -[DMFProfile isLocked](self, "isLocked");
  v17 = v14 ^ v16 ^ -[DMFProfile hasRemovalPasscode](self, "hasRemovalPasscode");
  v18 = -[DMFProfile isEncrypted](self, "isEncrypted");
  -[DMFProfile signerCertificates](self, "signerCertificates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[DMFProfile payloads](self, "payloads");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[DMFProfile restrictions](self, "restrictions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17 ^ v22 ^ objc_msgSend(v23, "hash");

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  DMFProfile *v4;
  DMFProfile *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  unint64_t v39;
  int64_t v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  BOOL v45;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  int v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;

  v4 = (DMFProfile *)a3;
  if (self == v4)
  {
    v45 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFProfile UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFProfile UUID](v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if ((!(v8 | v9) || (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, v10))
        && (v11 = -[DMFProfile type](self, "type"), v11 == -[DMFProfile type](v5, "type")))
      {
        -[DMFProfile identifier](self, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFProfile identifier](v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v15 = v13;
        if (v14 | v15
          && (v16 = objc_msgSend((id)v14, "isEqual:", v15), (id)v15, (id)v14, !v16))
        {
          v45 = 0;
        }
        else
        {
          -[DMFProfile displayName](self, "displayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[DMFProfile displayName](v5, "displayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v17;
          v61 = v18;
          if (v19 | v61
            && (v20 = objc_msgSend((id)v19, "isEqual:", v61), (id)v61, (id)v19, !v20))
          {
            v45 = 0;
          }
          else
          {
            v59 = v19;
            -[DMFProfile organization](self, "organization");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[DMFProfile organization](v5, "organization");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v21;
            v60 = v22;
            if (v23 | v60
              && (v24 = objc_msgSend((id)v23, "isEqual:", v60), (id)v60, (id)v23, !v24))
            {
              v45 = 0;
              v19 = v59;
            }
            else
            {
              v57 = v23;
              -[DMFProfile profileDescription](self, "profileDescription");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[DMFProfile profileDescription](v5, "profileDescription");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v25;
              v28 = v26;
              v29 = (void *)v27;
              v58 = (void *)v28;
              if (v27 | v28
                && (v30 = objc_msgSend((id)v27, "isEqual:", v28), v58, v29, !v30))
              {
                v45 = 0;
                v19 = v59;
              }
              else
              {
                v55 = v29;
                -[DMFProfile signerCertificates](self, "signerCertificates");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[DMFProfile signerCertificates](v5, "signerCertificates");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v31;
                v34 = v32;
                v56 = (void *)v34;
                if (v33 | v34
                  && (v35 = (void *)v34,
                      v36 = objc_msgSend((id)v33, "isEqual:", v34),
                      v35,
                      (id)v33,
                      !v36))
                {
                  v45 = 0;
                  v19 = v59;
                  v29 = v55;
                }
                else
                {
                  -[DMFProfile payloads](self, "payloads");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DMFProfile payloads](v5, "payloads");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = v37;
                  v53 = v38;
                  v54 = (void *)v39;
                  if (v39 | v53
                    && (v51 = objc_msgSend((id)v39, "isEqual:", v53), (id)v53, (id)v39, !v51))
                  {
                    v45 = 0;
                    v19 = v59;
                    v29 = v55;
                  }
                  else
                  {
                    v40 = -[DMFProfile profileVersion](self, "profileVersion");
                    v29 = v55;
                    if (v40 == -[DMFProfile profileVersion](v5, "profileVersion")
                      && (v41 = -[DMFProfile isManaged](self, "isManaged"),
                          v41 == -[DMFProfile isManaged](v5, "isManaged"))
                      && (v42 = -[DMFProfile isLocked](self, "isLocked"), v42 == -[DMFProfile isLocked](v5, "isLocked"))
                      && (v43 = -[DMFProfile hasRemovalPasscode](self, "hasRemovalPasscode"),
                          v43 == -[DMFProfile hasRemovalPasscode](v5, "hasRemovalPasscode"))
                      && (v44 = -[DMFProfile isEncrypted](self, "isEncrypted"),
                          v44 == -[DMFProfile isEncrypted](v5, "isEncrypted")))
                    {
                      -[DMFProfile restrictions](self, "restrictions");
                      v47 = objc_claimAutoreleasedReturnValue();
                      -[DMFProfile restrictions](v5, "restrictions");
                      v48 = objc_claimAutoreleasedReturnValue();
                      v19 = v59;
                      v52 = (void *)v47;
                      if (v47 | v48)
                      {
                        v50 = v48;
                        v49 = objc_msgSend((id)v47, "isEqual:", v48);
                        v48 = v50;
                        v45 = v49;
                      }
                      else
                      {
                        v45 = 1;
                      }

                    }
                    else
                    {
                      v45 = 0;
                      v19 = v59;
                    }
                  }

                }
              }
              v23 = v57;

            }
          }

        }
      }
      else
      {
        v45 = 0;
      }

    }
    else
    {
      v45 = 0;
    }
  }

  return v45;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n\tVersion      : %zd"), objc_opt_class(), self, -[DMFProfile profileVersion](self, "profileVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFProfile displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[DMFProfile displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tDisplay Name : “%@”"), v6);

  }
  -[DMFProfile profileDescription](self, "profileDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[DMFProfile profileDescription](self, "profileDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tDescription  : “%@”"), v9);

  }
  if (-[DMFProfile type](self, "type"))
    v10 = CFSTR("\n\tType         : User");
  else
    v10 = CFSTR("\n\tType         : System");
  objc_msgSend(v3, "appendFormat:", v10);
  -[DMFProfile identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[DMFProfile identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tIdentifier   : %@"), v13);

  }
  -[DMFProfile UUID](self, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[DMFProfile UUID](self, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tUUID         : %@"), v16);

  }
  -[DMFProfile organization](self, "organization");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    -[DMFProfile organization](self, "organization");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tOrganization : %@"), v19);

  }
  if (-[DMFProfile isLocked](self, "isLocked"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tLocked       : %@"), v20);
  if (-[DMFProfile hasRemovalPasscode](self, "hasRemovalPasscode"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tRemoval passcode present"));
  if (-[DMFProfile isEncrypted](self, "isEncrypted"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tEncrypted    : %@"), v21);
  -[DMFProfile signerCertificates](self, "signerCertificates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSigned       : %@"), v23);

  -[DMFProfile restrictions](self, "restrictions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tRestrictions : %@"), v24);

  objc_msgSend(v3, "appendString:", CFSTR("\n}>"));
  v25 = (void *)objc_msgSend(v3, "copy");

  return v25;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)profileVersion
{
  return self->_profileVersion;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (BOOL)hasRemovalPasscode
{
  return self->_hasRemovalPasscode;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (NSArray)signerCertificates
{
  return self->_signerCertificates;
}

- (NSArray)payloads
{
  return self->_payloads;
}

- (NSDictionary)restrictions
{
  return self->_restrictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_signerCertificates, 0);
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
