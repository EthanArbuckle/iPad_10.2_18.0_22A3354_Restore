@implementation HMFConnectivityInfo

- (HMFConnectivityInfo)initWithAccessoryIdentifier:(id)a3 woBLEInfo:(id)a4 woWLANInfos:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMFConnectivityInfo *v13;
  HMFConnectivityInfo *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  NSArray *woWLANInfos;
  HMFConnectivityInfo *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9 && (v10 || objc_msgSend(v11, "count")))
  {
    v33.receiver = self;
    v33.super_class = (Class)HMFConnectivityInfo;
    v13 = -[HMFConnectivityInfo init](&v33, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_accessoryIdentifier, a3);
      objc_storeStrong((id *)&v14->_woBLEInfo, a4);
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v16 = v12;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
              if ((objc_msgSend(v15, "containsObject:", v21, (_QWORD)v29) & 1) == 0)
                objc_msgSend(v15, "addObject:", v21);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v18);
        }

        v22 = objc_msgSend(v15, "copy");
        woWLANInfos = v14->_woWLANInfos;
        v14->_woWLANInfos = (NSArray *)v22;

      }
    }
    self = v14;
    v24 = self;
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Returning nil for the invalid woBLEInfo and woWLANInfo of accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

- (HMFWoWLANInfo)woWLANInfo
{
  void *v2;
  void *v3;

  -[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFWoWLANInfo *)v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMFConnectivityInfo *v4;
  HMFConnectivityInfo *v5;
  HMFConnectivityInfo *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (HMFConnectivityInfo *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_9;
    -[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFConnectivityInfo accessoryIdentifier](v6, "accessoryIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_9;
    -[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFConnectivityInfo woBLEInfo](v6, "woBLEInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (v12)
    {
      -[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFConnectivityInfo woWLANInfos](v6, "woWLANInfos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = HMFEqualObjects();

    }
    else
    {
LABEL_9:
      v15 = 0;
    }

  }
  return v15;
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
  id v11;

  v11 = a3;
  -[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("HMFCI.ID"));

  -[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("HMFCI.woBLE"));

  }
  -[HMFConnectivityInfo woWLANInfo](self, "woWLANInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMFConnectivityInfo woWLANInfo](self, "woWLANInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("HMFCI.woWLAN"));

  }
  -[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("HMFCI.All.woWLAN"));

  }
}

- (HMFConnectivityInfo)initWithCoder:(id)a3
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
  uint64_t v18;
  HMFConnectivityInfo *v19;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFCI.ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HMFCI.woBLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("HMFCI.woWLAN"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDBCF20];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("HMFCI.All.woWLAN"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v17, "count") && v13)
  {
    v21 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  v19 = -[HMFConnectivityInfo initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:](self, "initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:", v5, v9, v17);

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMFConnectivityInfo accessoryIdentifier](self, "accessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFConnectivityInfo woBLEInfo](self, "woBLEInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFConnectivityInfo woWLANInfos](self, "woWLANInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Identifier: %@ BLEInfo: %@, WLANInfos: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (HMFWoBLEInfo)woBLEInfo
{
  return self->_woBLEInfo;
}

- (void)setWoBLEInfo:(id)a3
{
  objc_storeStrong((id *)&self->_woBLEInfo, a3);
}

- (NSArray)woWLANInfos
{
  return self->_woWLANInfos;
}

- (void)setWoWLANInfos:(id)a3
{
  objc_storeStrong((id *)&self->_woWLANInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_woWLANInfos, 0);
  objc_storeStrong((id *)&self->_woBLEInfo, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

+ (HMFConnectivityInfo)connectivityInfoWithAccessoryIdentifier:(id)a3 wakeConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMFWoBLEInfo *v9;
  void *v10;
  void *v11;
  HMFWoBLEInfo *v12;
  void *v13;
  void *v14;
  HMFWoWLANInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMFWoWLANInfo *v20;
  HMFConnectivityInfo *v21;
  void *v22;
  HMFConnectivityInfo *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "custom1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [HMFWoBLEInfo alloc];
    objc_msgSend(v6, "custom1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMFWoBLEInfo initWithBLEIdentifier:](v9, "initWithBLEIdentifier:", v11);

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "custom2");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v21 = [HMFConnectivityInfo alloc];
    goto LABEL_8;
  }
  v15 = [HMFWoWLANInfo alloc];
  objc_msgSend(v6, "custom2");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "custom2");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "secondaryIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMFWoWLANInfo initWithPrimaryIdentifier:wifiIdentifiers:](v15, "initWithPrimaryIdentifier:wifiIdentifiers:", v17, v19);

  v21 = [HMFConnectivityInfo alloc];
  if (!v20)
  {
LABEL_8:
    v23 = -[HMFConnectivityInfo initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:](v21, "initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:", v5, v12, 0);
    goto LABEL_9;
  }
  v25[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMFConnectivityInfo initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:](v21, "initWithAccessoryIdentifier:woBLEInfo:woWLANInfos:", v5, v12, v22);

LABEL_9:
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
