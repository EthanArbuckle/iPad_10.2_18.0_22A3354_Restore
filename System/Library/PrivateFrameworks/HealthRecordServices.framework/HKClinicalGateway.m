@implementation HKClinicalGateway

- (HKClinicalGateway)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalGateway)initWithExternalID:(id)a3 title:(id)a4 subtitle:(id)a5 displayableDescription:(id)a6 phoneNumber:(id)a7 informationURL:(id)a8 passwordResetURL:(id)a9 patientPortalURL:(id)a10 signupURL:(id)a11 status:(int64_t)a12 type:(int64_t)a13 brand:(id)a14 country:(id)a15 baseURL:(id)a16 FHIRVersion:(id)a17 authSchemas:(id)a18 resourceSchemas:(id)a19 features:(id)a20 gatewayVersions:(id)a21 minCompatibleAPIVersion:(int64_t)a22
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  HKClinicalGateway *v35;
  uint64_t v36;
  NSString *externalID;
  uint64_t v38;
  NSString *title;
  uint64_t v40;
  NSString *subtitle;
  uint64_t v42;
  NSString *displayableDescription;
  uint64_t v44;
  NSString *phoneNumber;
  uint64_t v46;
  NSURL *informationURL;
  uint64_t v48;
  NSURL *passwordResetURL;
  uint64_t v50;
  NSURL *patientPortalURL;
  uint64_t v52;
  NSURL *signupURL;
  uint64_t v54;
  HKClinicalBrand *brand;
  uint64_t v56;
  NSString *country;
  uint64_t v58;
  NSURL *baseURL;
  uint64_t v60;
  HKFHIRVersion *FHIRVersion;
  uint64_t v62;
  NSArray *authSchemas;
  uint64_t v64;
  NSArray *resourceSchemas;
  uint64_t v66;
  NSArray *features;
  uint64_t v68;
  NSArray *gatewayVersions;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  objc_super v81;

  v80 = a3;
  v79 = a4;
  v78 = a5;
  v77 = a6;
  v76 = a7;
  v75 = a8;
  v74 = a9;
  v73 = a10;
  v72 = a11;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v33 = a20;
  v34 = a21;
  v81.receiver = self;
  v81.super_class = (Class)HKClinicalGateway;
  v35 = -[HKClinicalGateway init](&v81, sel_init);
  if (v35)
  {
    v36 = objc_msgSend(v80, "copy");
    externalID = v35->_externalID;
    v35->_externalID = (NSString *)v36;

    v38 = objc_msgSend(v79, "copy");
    title = v35->_title;
    v35->_title = (NSString *)v38;

    v40 = objc_msgSend(v78, "copy");
    subtitle = v35->_subtitle;
    v35->_subtitle = (NSString *)v40;

    v42 = objc_msgSend(v77, "copy");
    displayableDescription = v35->_displayableDescription;
    v35->_displayableDescription = (NSString *)v42;

    v44 = objc_msgSend(v76, "copy");
    phoneNumber = v35->_phoneNumber;
    v35->_phoneNumber = (NSString *)v44;

    v46 = objc_msgSend(v75, "copy");
    informationURL = v35->_informationURL;
    v35->_informationURL = (NSURL *)v46;

    v48 = objc_msgSend(v74, "copy");
    passwordResetURL = v35->_passwordResetURL;
    v35->_passwordResetURL = (NSURL *)v48;

    v50 = objc_msgSend(v73, "copy");
    patientPortalURL = v35->_patientPortalURL;
    v35->_patientPortalURL = (NSURL *)v50;

    v52 = objc_msgSend(v72, "copy");
    signupURL = v35->_signupURL;
    v35->_signupURL = (NSURL *)v52;

    v35->_status = a12;
    v35->_type = a13;
    v54 = objc_msgSend(v27, "copy");
    brand = v35->_brand;
    v35->_brand = (HKClinicalBrand *)v54;

    v56 = objc_msgSend(v28, "copy");
    country = v35->_country;
    v35->_country = (NSString *)v56;

    v58 = objc_msgSend(v29, "copy");
    baseURL = v35->_baseURL;
    v35->_baseURL = (NSURL *)v58;

    v60 = objc_msgSend(v30, "copy");
    FHIRVersion = v35->_FHIRVersion;
    v35->_FHIRVersion = (HKFHIRVersion *)v60;

    v62 = objc_msgSend(v31, "copy");
    authSchemas = v35->_authSchemas;
    v35->_authSchemas = (NSArray *)v62;

    v64 = objc_msgSend(v32, "copy");
    resourceSchemas = v35->_resourceSchemas;
    v35->_resourceSchemas = (NSArray *)v64;

    v66 = objc_msgSend(v33, "copy");
    features = v35->_features;
    v35->_features = (NSArray *)v66;

    v68 = objc_msgSend(v34, "copy");
    gatewayVersions = v35->_gatewayVersions;
    v35->_gatewayVersions = (NSArray *)v68;

    v35->_minCompatibleAPIVersion = a22;
  }

  return v35;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HKClinicalGateway externalID](self, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalGateway title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalGateway subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalGateway displayableDescription](self, "displayableDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p externalID: %@; title: \"%@\"; subtitle: \"%@\"; description: \"%@\"; MCAV: %zd; status: %zd;>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    -[HKClinicalGateway minCompatibleAPIVersion](self, "minCompatibleAPIVersion"),
    -[HKClinicalGateway status](self, "status"),
    0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalGateway *v4;
  HKClinicalGateway *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HKClinicalGateway *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (-[HKClinicalGateway isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[HKClinicalGateway externalID](self, "externalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalGateway externalID](v5, "externalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v11 = 1;
    }
    else
    {
      -[HKClinicalGateway externalID](v5, "externalID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[HKClinicalGateway externalID](self, "externalID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalGateway externalID](v5, "externalID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKClinicalGateway externalID](self, "externalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HKClinicalGatewayReference)newerSupportedGatewayVersion
{
  uint64_t v3;
  int64_t minCompatibleAPIVersion;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = HKProviderServiceMaximumCompatibleAPIVersion();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
  v5 = self->_gatewayVersions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "minCompatibleAPIVersion", (_QWORD)v14) <= v3
          && objc_msgSend(v11, "minCompatibleAPIVersion") > minCompatibleAPIVersion)
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return (HKClinicalGatewayReference *)v8;
}

- (BOOL)isNewerGatewayVersionOfGateway:(id)a3
{
  HKClinicalGateway *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (HKClinicalGateway *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalGateway.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherGateway"));

  }
  if (self == v5)
  {
    v15 = 0;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_gatewayVersions;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "gatewayID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKClinicalGateway externalID](v5, "externalID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            v15 = objc_msgSend(v11, "minCompatibleAPIVersion") < self->_minCompatibleAPIVersion;
            goto LABEL_14;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_14:

  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "encodeInteger:forKey:", -[HKClinicalGateway status](self, "status"), CFSTR("status"));
  objc_msgSend(v21, "encodeInteger:forKey:", -[HKClinicalGateway type](self, "type"), CFSTR("type"));
  -[HKClinicalGateway brand](self, "brand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v4, CFSTR("brand"));

  -[HKClinicalGateway displayableDescription](self, "displayableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v5, CFSTR("displayableDescription"));

  -[HKClinicalGateway externalID](self, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("externalID"));

  -[HKClinicalGateway informationURL](self, "informationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("info"));

  -[HKClinicalGateway passwordResetURL](self, "passwordResetURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("forgot"));

  -[HKClinicalGateway patientPortalURL](self, "patientPortalURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("patientportal"));

  -[HKClinicalGateway phoneNumber](self, "phoneNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("phoneNumber"));

  -[HKClinicalGateway country](self, "country");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("country"));

  -[HKClinicalGateway signupURL](self, "signupURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("signup"));

  -[HKClinicalGateway subtitle](self, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("subtitle"));

  -[HKClinicalGateway title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("title"));

  -[HKClinicalGateway baseURL](self, "baseURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("baseURL"));

  -[HKClinicalGateway FHIRVersion](self, "FHIRVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("FHIRVersion"));

  -[HKClinicalGateway authSchemas](self, "authSchemas");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("authSchemas"));

  -[HKClinicalGateway resourceSchemas](self, "resourceSchemas");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("resourceSchemas"));

  -[HKClinicalGateway features](self, "features");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v19, CFSTR("features"));

  -[HKClinicalGateway gatewayVersions](self, "gatewayVersions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("gatewayVersions"));

  objc_msgSend(v21, "encodeInteger:forKey:", -[HKClinicalGateway minCompatibleAPIVersion](self, "minCompatibleAPIVersion"), CFSTR("minCompatibleAPIVersion"));
}

- (HKClinicalGateway)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HKClinicalGateway *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRVersion"));
            v10 = objc_claimAutoreleasedReturnValue();
            v11 = (void *)v10;
            if (v10)
            {
              v31 = (void *)v10;
              objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
              v12 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("authSchemas"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)v12;
              objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("resourceSchemas"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
              v13 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("gatewayVersions"));
              v14 = objc_claimAutoreleasedReturnValue();
              v32 = v9;
              v33 = (void *)v13;
              if (objc_msgSend(v4, "containsValueForKey:", CFSTR("status"))
                && objc_msgSend(v4, "containsValueForKey:", CFSTR("type"))
                && (objc_msgSend(v4, "containsValueForKey:", CFSTR("minCompatibleAPIVersion")) & 1) != 0)
              {
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayableDescription"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("info"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("forgot"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patientportal"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signup"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
                v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
                v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minCompatibleAPIVersion"));
                v21 = v14;
                v17 = v9;
                v18 = (void *)v14;
                v11 = v31;
                self = objc_retain(-[HKClinicalGateway initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:](self, "initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:", v6, v7, v29, v28, v25, v24, v27, v26, v22, v23, v15, v5, v8, v17,
                           v31,
                           v37,
                           v36,
                           v35,
                           v21,
                           v16));

                v19 = self;
              }
              else
              {
                v18 = (void *)v14;
                objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
                v19 = 0;
                v11 = v31;
              }

              v9 = v32;
            }
            else
            {
              objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
              v19 = 0;
            }

          }
          else
          {
            objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
            v19 = 0;
          }

        }
        else
        {
          objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
          v19 = 0;
        }

      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v19 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v19 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v19 = 0;
  }

  return v19;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)displayableDescription
{
  return self->_displayableDescription;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)informationURL
{
  return self->_informationURL;
}

- (NSURL)passwordResetURL
{
  return self->_passwordResetURL;
}

- (NSURL)patientPortalURL
{
  return self->_patientPortalURL;
}

- (NSURL)signupURL
{
  return self->_signupURL;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)type
{
  return self->_type;
}

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (NSString)country
{
  return self->_country;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (NSArray)authSchemas
{
  return self->_authSchemas;
}

- (NSArray)resourceSchemas
{
  return self->_resourceSchemas;
}

- (NSArray)features
{
  return self->_features;
}

- (NSArray)gatewayVersions
{
  return self->_gatewayVersions;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayVersions, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_resourceSchemas, 0);
  objc_storeStrong((id *)&self->_authSchemas, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_signupURL, 0);
  objc_storeStrong((id *)&self->_patientPortalURL, 0);
  objc_storeStrong((id *)&self->_passwordResetURL, 0);
  objc_storeStrong((id *)&self->_informationURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_displayableDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
}

@end
