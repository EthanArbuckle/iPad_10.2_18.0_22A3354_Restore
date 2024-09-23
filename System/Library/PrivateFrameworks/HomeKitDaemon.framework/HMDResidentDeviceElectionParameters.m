@implementation HMDResidentDeviceElectionParameters

- (HMDResidentDeviceElectionParameters)initWithResident:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  HMDResidentDeviceElectionParameters *v18;
  _QWORD v20[4];
  id v21;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  v8 = a3;
  objc_msgSend(v7, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kEnabledKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE3F150], "BOOLeanWithBool:", objc_msgSend(v10, "BOOLValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kAtHomeStateKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (objc_msgSend(v13, "BOOLValue"))
      v15 = 1;
    else
      v15 = 2;
  }
  else
  {
    v15 = 2;
  }

  objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kAccessoriesListKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __81__HMDResidentDeviceElectionParameters_initWithResident_dictionaryRepresentation___block_invoke;
  v20[3] = &unk_24E796DA0;
  v21 = v9;
  v17 = v9;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v20);

  v18 = -[HMDResidentDeviceElectionParameters initWithResident:enabled:location:accessories:](self, "initWithResident:enabled:location:accessories:", v8, v12, v15, v17);
  return v18;
}

- (HMDResidentDeviceElectionParameters)initWithResident:(id)a3 enabled:(id)a4 location:(int64_t)a5 accessories:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDResidentDeviceElectionParameters *v14;
  HMDResidentDeviceElectionParameters *v15;
  void *v16;
  uint64_t v17;
  HMFProductInfo *productInfo;
  uint64_t v19;
  HMDHomeKitVersion *version;
  uint64_t v21;
  HMFBoolean *enabled;
  uint64_t v23;
  NSSet *accessories;
  HMDResidentDeviceElectionParameters *v25;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    v27.receiver = self;
    v27.super_class = (Class)HMDResidentDeviceElectionParameters;
    v14 = -[HMDResidentDeviceElectionParameters init](&v27, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_resident, a3);
      objc_msgSend(v11, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "productInfo");
      v17 = objc_claimAutoreleasedReturnValue();
      productInfo = v15->_productInfo;
      v15->_productInfo = (HMFProductInfo *)v17;

      objc_msgSend(v16, "version");
      v19 = objc_claimAutoreleasedReturnValue();
      version = v15->_version;
      v15->_version = (HMDHomeKitVersion *)v19;

      v21 = objc_msgSend(v12, "copy");
      enabled = v15->_enabled;
      v15->_enabled = (HMFBoolean *)v21;

      v15->_location = a5;
      v23 = objc_msgSend(v13, "copy");
      accessories = v15->_accessories;
      v15->_accessories = (NSSet *)v23;

    }
    self = v15;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceElectionParameters accessories](self, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addEntriesFromDictionary:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  v23[0] = CFSTR("kEnabledKey");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[HMDResidentDeviceElectionParameters isEnabled](self, "isEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "BOOLValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v23[1] = CFSTR("kAtHomeStateKey");
  v14 = -[HMDResidentDeviceElectionParameters location](self, "location");
  v15 = MEMORY[0x24BDBD1C0];
  if (v14 == 1)
    v15 = MEMORY[0x24BDBD1C8];
  v24[1] = v15;
  v23[2] = CFSTR("kAccessoriesListKey");
  v16 = (void *)objc_msgSend(v4, "copy", (_QWORD)v19);
  v24[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v17;
}

- (int64_t)compare:(id)a3
{
  return -[HMDResidentDeviceElectionParameters compare:outCriteria:](self, "compare:outCriteria:", a3, 0);
}

- (int64_t)compare:(id)a3 outCriteria:(unint64_t *)a4
{
  HMDResidentDeviceElectionParameters *v6;
  HMDResidentDeviceElectionParameters *v7;
  HMDResidentDeviceElectionParameters *v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  int64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = (HMDResidentDeviceElectionParameters *)a3;
  if (self != v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
    if (!v8)
      goto LABEL_35;
    if (a4)
      *a4 = 1;
    -[HMDResidentDeviceElectionParameters isEnabled](self, "isEnabled");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceElectionParameters isEnabled](v8, "isEnabled");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HMFEqualObjects() & 1) == 0)
    {
      if (v9 && v10)
      {
LABEL_33:
        v21 = objc_msgSend(v9, "compare:", v10);
LABEL_60:

        goto LABEL_61;
      }
      if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
        goto LABEL_59;
      if (objc_msgSend(v10, "BOOLValue"))
      {
LABEL_40:
        v21 = -1;
        goto LABEL_60;
      }
    }

    if (a4)
      *a4 = 3;
    v11 = -[HMDResidentDeviceElectionParameters location](self, "location");
    v12 = -[HMDResidentDeviceElectionParameters location](v8, "location");
    if (v11 == v12)
    {
LABEL_12:
      if (a4)
        *a4 = 4;
      -[HMDResidentDeviceElectionParameters productInfo](self, "productInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceElectionParameters productInfo](v8, "productInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "productClass");
      if (v13 != objc_msgSend(v10, "productClass"))
      {
        if (objc_msgSend(v9, "productClass") == 3)
          goto LABEL_40;
        if (objc_msgSend(v10, "productClass") == 3)
          goto LABEL_59;
      }

      if (a4)
        *a4 = 6;
      -[HMDResidentDeviceElectionParameters version](self, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceElectionParameters version](v8, "version");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "majorVersion");
      if (v14 == objc_msgSend(v10, "majorVersion") || !v9)
      {
        if (a4)
          *a4 = 9;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        -[HMDResidentDeviceElectionParameters accessories](self, "accessories");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v36 != v19)
                objc_enumerationMutation(v15);
              v18 += objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "isReachable");
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          }
          while (v17);
        }
        else
        {
          v18 = 0;
        }
        v30 = v10;

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[HMDResidentDeviceElectionParameters accessories](v8, "accessories");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v23)
        {
          v24 = v23;
          v25 = 0;
          v26 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v32 != v26)
                objc_enumerationMutation(v22);
              v25 += objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "isReachable");
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v24);
        }
        else
        {
          v25 = 0;
        }

        if (v18 < v25)
        {
          v21 = -1;
          v10 = v30;
          goto LABEL_60;
        }
        v10 = v30;
        if (v18 <= v25)
        {
          v29 = objc_msgSend(v9, "compare:", v30);
          if (v29)
          {
            v21 = v29;
            if (a4)
              *a4 = 7;
          }
          else
          {
            v21 = 0;
            if (a4)
              *a4 = 0;
          }
          goto LABEL_60;
        }
LABEL_59:
        v21 = 1;
        goto LABEL_60;
      }
      goto LABEL_33;
    }
    if (v11 != 1)
    {
      if (v12 != 1)
        goto LABEL_12;
      v21 = -1;
    }
    else
    {
LABEL_35:
      v21 = 1;
    }
LABEL_61:

    goto LABEL_62;
  }
  v21 = 0;
  if (a4)
    *a4 = 0;
LABEL_62:

  return v21;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDeviceElectionParameters resident](self, "resident");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    v7 = -[HMDResidentDeviceElectionParameters compare:](self, "compare:", v6) == 0;
  else
    v7 = 0;

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDResidentDeviceElectionParameters resident](self, "resident");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shortDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Resident"), v20);
  v22[0] = v19;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDResidentDeviceElectionParameters version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "versionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Version"), v6);
  v22[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDResidentDeviceElectionParameters isEnabled](self, "isEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Enabled"), v9);
  v22[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDResidentDeviceElectionParameters location](self, "location");
  HMStringFromHomeLocation();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Location"), v12);
  v22[3] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDResidentDeviceElectionParameters accessories](self, "accessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Accessories"), v15);
  v22[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (HMDResidentDevice)resident
{
  return (HMDResidentDevice *)objc_getProperty(self, a2, 8, 1);
}

- (HMFBoolean)isEnabled
{
  return (HMFBoolean *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)location
{
  return self->_location;
}

- (NSSet)accessories
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (HMFProductInfo)productInfo
{
  return (HMFProductInfo *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHomeKitVersion)version
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_resident, 0);
}

void __81__HMDResidentDeviceElectionParameters_initWithResident_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMDAccessoryReachabilityElectionParameter *v7;
  void *v8;
  HMDAccessoryReachabilityElectionParameter *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = [HMDAccessoryReachabilityElectionParameter alloc];
  v10 = v5;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDAccessoryReachabilityElectionParameter initWithDictionaryRepresentation:](v7, "initWithDictionaryRepresentation:", v8);

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

@end
