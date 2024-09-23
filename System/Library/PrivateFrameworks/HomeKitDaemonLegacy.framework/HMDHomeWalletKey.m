@implementation HMDHomeWalletKey

- (HMDHomeWalletKey)initWithTypeIdentifier:(id)a3 serialNumber:(id)a4 state:(int64_t)a5 walletKeyDescription:(id)a6 homeName:(id)a7 color:(int64_t)a8 nfcInfos:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDHomeWalletKey *v20;
  uint64_t v21;
  NSString *typeIdentifier;
  uint64_t v23;
  NSString *serialNumber;
  uint64_t v25;
  NSString *walletKeyDescription;
  uint64_t v27;
  NSString *homeName;
  uint64_t v29;
  NSArray *nfcInfos;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v32.receiver = self;
  v32.super_class = (Class)HMDHomeWalletKey;
  v20 = -[HMDHomeWalletKey init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    typeIdentifier = v20->_typeIdentifier;
    v20->_typeIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    serialNumber = v20->_serialNumber;
    v20->_serialNumber = (NSString *)v23;

    v20->_state = a5;
    v25 = objc_msgSend(v17, "copy");
    walletKeyDescription = v20->_walletKeyDescription;
    v20->_walletKeyDescription = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    homeName = v20->_homeName;
    v20->_homeName = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    nfcInfos = v20->_nfcInfos;
    v20->_nfcInfos = (NSArray *)v29;

    v20->_color = a8;
  }

  return v20;
}

- (NSString)homeName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[11];

  v32[9] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey typeIdentifier](self, "typeIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Type Identifier"), v31);
  v32[0] = v30;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey serialNumber](self, "serialNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Serial Number"), v29);
  v32[1] = v28;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeWalletKey state](self, "state"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("State"), v27);
  v32[2] = v26;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey walletKeyDescription](self, "walletKeyDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Description"), v25);
  v32[3] = v24;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey homeName](self, "homeName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Home Name"), v23);
  v32[4] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey changeAccessCodeHomeAppCustomURL](self, "changeAccessCodeHomeAppCustomURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Change Access Code Home App URL"), v10);
  v32[5] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("NFC Info"), v13);
  v32[6] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey color](self, "color");
  HMHomeWalletKeyColorAsString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Color"), v16);
  v32[7] = v17;
  v18 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeWalletKey customURL](self, "customURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Custom URL"), v19);
  v32[8] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSArray)nfcInfos
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)color
{
  return self->_color;
}

- (NSString)walletKeyDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)changeAccessCodeHomeAppCustomURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (NSURL)customURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)passColorValue
{
  uint64_t v2;

  v2 = -[HMDHomeWalletKey color](self, "color");
  if (v2 > 14935010)
  {
    if (v2 != 14935011)
    {
      if (v2 == 15521450)
        return (NSString *)CFSTR("gold");
      return (NSString *)CFSTR("tan");
    }
    return (NSString *)CFSTR("silver");
  }
  else
  {
    if (v2)
      return (NSString *)CFSTR("tan");
    return (NSString *)CFSTR("black");
  }
}

- (NSString)labelColorValue
{
  uint64_t v2;

  v2 = -[HMDHomeWalletKey color](self, "color");
  if (v2 > 14935010)
  {
    if (v2 != 14935011)
    {
      if (v2 == 15521450)
        return (NSString *)CFSTR("rgb(141, 125, 100)");
      return (NSString *)CFSTR("rgb(118, 112, 104)");
    }
    return (NSString *)CFSTR("rgb(137, 136, 136)");
  }
  else
  {
    if (v2)
      return (NSString *)CFSTR("rgb(118, 112, 104)");
    return (NSString *)CFSTR("rgb(153, 153, 153)");
  }
}

- (NSString)accessCode
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customURL, 0);
  objc_storeStrong((id *)&self->_changeAccessCodeHomeAppCustomURL, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_nfcInfos, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_walletKeyDescription, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (HMDHomeWalletKey)initWithPKPass:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  HMDHomeWalletKey *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "passTypeIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialNumber");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fieldForKey:", CFSTR("homeName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fieldForKey:", CFSTR("arbitrary_supplementary_field_changeAccessCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "devicePaymentApplications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __40__HMDHomeWalletKey_initWithPKPass_flow___block_invoke;
  v32[3] = &unk_1E89A8478;
  v14 = v7;
  v33 = v14;
  objc_msgSend(v13, "na_map:", v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "secureElementPass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "devicePrimaryPaymentApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "state");

  v19 = objc_msgSend(v6, "homeKeyLiveRenderType") - 1;
  if (v19 > 3)
    v20 = *MEMORY[0x1E0CB9320];
  else
    v20 = qword_1CDB8F030[v19];
  objc_msgSend(v9, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMDHomeWalletKey initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:](self, "initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:", v31, v30, v18, v8, v21, v20, v15);

  objc_msgSend(v6, "fieldForKey:", CFSTR("arbitrary_supplementary_field_accessCode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "link");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "link");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLWithString:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v23, "value");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setAccessCode:](v22, "setAccessCode:", v27);

  -[HMDHomeWalletKey setChangeAccessCodeHomeAppCustomURL:](v22, "setChangeAccessCodeHomeAppCustomURL:", v24);
  objc_msgSend(v6, "passURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setCustomURL:](v22, "setCustomURL:", v28);

  return v22;
}

- (NSUUID)uuid
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

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HMDHomeWalletKey serialNumber](self, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  v6 = (void *)MEMORY[0x1E0CB3A28];
  -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subCredentialIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v11;
}

- (id)xpcWalletKeyWithExpressEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[HMDHomeWalletKey customURL](self, "customURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDHomeWalletKey uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0CBA570]);
    -[HMDHomeWalletKey customURL](self, "customURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUID:customURL:expressEnabled:uwbUnlockEnabled:color:", v6, v8, v3, 0, -[HMDHomeWalletKey color](self, "color"));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)isMissingNFCInfo
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) != 0)
    return 1;
  -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_29512);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  char v20;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDHomeWalletKey serialNumber](self, "serialNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[HMDHomeWalletKey typeIdentifier](self, "typeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "typeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[HMDHomeWalletKey homeName](self, "homeName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "homeName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          -[HMDHomeWalletKey walletKeyDescription](self, "walletKeyDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "walletKeyDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            v29 = v13;
            v14 = -[HMDHomeWalletKey state](self, "state");
            if (v14 != objc_msgSend(v6, "state"))
              goto LABEL_20;
            -[HMDHomeWalletKey accessCode](self, "accessCode");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "accessCode");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = HMFEqualObjects();

            if (!v23)
              goto LABEL_20;
            -[HMDHomeWalletKey changeAccessCodeHomeAppCustomURL](self, "changeAccessCodeHomeAppCustomURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "changeAccessCodeHomeAppCustomURL");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = HMFEqualObjects();

            if (v24)
            {
              -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "nfcInfos");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v17;
              if (objc_msgSend(v17, "isEqual:")
                && (v18 = -[HMDHomeWalletKey color](self, "color"), v18 == objc_msgSend(v6, "color")))
              {
                -[HMDHomeWalletKey customURL](self, "customURL");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "customURL");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = HMFEqualObjects();

              }
              else
              {
                v20 = 0;
              }
              v13 = v29;

            }
            else
            {
LABEL_20:
              v20 = 0;
              v13 = v29;
            }
          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  unint64_t v20;

  -[HMDHomeWalletKey serialNumber](self, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDHomeWalletKey typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDHomeWalletKey homeName](self, "homeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMDHomeWalletKey walletKeyDescription](self, "walletKeyDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  v11 = -[HMDHomeWalletKey state](self, "state");
  -[HMDHomeWalletKey accessCode](self, "accessCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");

  -[HMDHomeWalletKey changeAccessCodeHomeAppCustomURL](self, "changeAccessCodeHomeAppCustomURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10 ^ v13 ^ objc_msgSend(v14, "hash");

  -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  v18 = v17 ^ -[HMDHomeWalletKey color](self, "color");
  -[HMDHomeWalletKey customURL](self, "customURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v15 ^ v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableHomeWalletKey *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  HMDMutableHomeWalletKey *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = [HMDMutableHomeWalletKey alloc];
  -[HMDHomeWalletKey typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeWalletKey state](self, "state");
  -[HMDHomeWalletKey walletKeyDescription](self, "walletKeyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey homeName](self, "homeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHomeWalletKey color](self, "color");
  -[HMDHomeWalletKey nfcInfos](self, "nfcInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDHomeWalletKey initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:](v4, "initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:", v5, v6, v7, v8, v9, v10, v11);

  -[HMDHomeWalletKey accessCode](self, "accessCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setAccessCode:](v12, "setAccessCode:", v13);

  -[HMDHomeWalletKey changeAccessCodeHomeAppCustomURL](self, "changeAccessCodeHomeAppCustomURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setChangeAccessCodeHomeAppCustomURL:](v12, "setChangeAccessCodeHomeAppCustomURL:", v14);

  -[HMDHomeWalletKey customURL](self, "customURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKey setCustomURL:](v12, "setCustomURL:", v15);

  return v12;
}

- (void)setWalletKeyDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setHomeName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setNfcInfos:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setAccessCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void)setChangeAccessCodeHomeAppCustomURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
}

- (void)setCustomURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

BOOL __36__HMDHomeWalletKey_isMissingNFCInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  objc_msgSend(v2, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "subCredentialIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v2, "secureElementIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v2, "pairedReaderIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

HMDHomeWalletKeySecureElementInfo *__40__HMDHomeWalletKey_initWithPKPass_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDHomeWalletKeySecureElementInfo *v4;

  v3 = a2;
  v4 = -[HMDHomeWalletKeySecureElementInfo initWithPaymentApplication:flow:]([HMDHomeWalletKeySecureElementInfo alloc], "initWithPaymentApplication:flow:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

@end
