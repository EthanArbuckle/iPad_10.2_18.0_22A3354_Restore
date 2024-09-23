@implementation FBKGroupedDevice

- (FBKGroupedDevice)initWithDevices:(id)a3
{
  id v4;
  FBKGroupedDevice *v5;
  FBKGroupedDevice *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKGroupedDevice;
  v5 = -[FBKGroupedDevice init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FBKGroupedDevice _updateWithDevices:](v5, "_updateWithDevices:", v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_deviceListChanged_, CFSTR("FBKDeviceListDidChange"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBKGroupedDevice;
  -[FBKGroupedDevice dealloc](&v4, sel_dealloc);
}

+ (id)FBKKnownDevices
{
  return (id)objc_msgSend(MEMORY[0x24BE2CA40], "FBKKnownDevices");
}

+ (id)currentGroupedDevice
{
  void *v2;
  void *v3;

  +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thisDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDevicePlatform
{
  return (id)*MEMORY[0x24BE2CA18];
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[FBKGroupedDevice isEqualToDevice:](self, "isEqualToDevice:", v4);

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (self == a3)
    return 1;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKGroupedDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FBKGroupedDevice devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)transportsForDisplay
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[FBKGroupedDevice devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[FBKGroupedDevice devices](self, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ded_mapWithBlock:", &__block_literal_global_4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_24E15EAF8;
  }
  return v9;
}

uint64_t __40__FBKGroupedDevice_transportsForDisplay__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;
  const char *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_msgSend(a2, "integerValue");
  if (v3 > 4)
    v4 = "Unknown";
  else
    v4 = off_24E156C30[v3];
  return objc_msgSend(v2, "stringWithUTF8String:", v4);
}

- (BOOL)isReady
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "status") == 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)needsPairing
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "status") == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)dedIDSDevice
{
  void *v2;
  void *v3;

  -[FBKGroupedDevice devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_24E18CA40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dedSharingDevice
{
  void *v2;
  void *v3;

  -[FBKGroupedDevice devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_24E18CA58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)anyDEDDevice
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKGroupedDevice devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mostReliableDevice
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  if (-[FBKGroupedDevice isCurrentDevice](self, "isCurrentDevice"))
  {
    -[FBKGroupedDevice anyDEDDevice](self, "anyDEDDevice");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBKGroupedDevice dedIDSDevice](self, "dedIDSDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKGroupedDevice dedSharingDevice](self, "dedSharingDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKGroupedDevice anyDEDDevice](self, "anyDEDDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "status");
    v8 = v4;
    if (v7 == 1 || (v9 = objc_msgSend(v5, "status"), v8 = v5, v9 == 1))
      v10 = v8;
    else
      v10 = 0;
    if (v10)
      v11 = v10;
    else
      v11 = v6;
    v3 = v11;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FBKGroupedDevice devices](self, "devices", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ded_mapWithBlock:", &__block_literal_global_22_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDevices:", v5);
  return v6;
}

id __33__FBKGroupedDevice_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (id)inferredPlatform
{
  void *v2;
  uint64_t v3;
  id *v4;
  id v5;

  -[FBKGroupedDevice productType](self, "productType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v4 = (id *)MEMORY[0x24BE2CA00];
  if (v3 && objc_msgSend(v2, "containsString:", CFSTR("AppleTV")))
    v4 = (id *)MEMORY[0x24BE2C9F8];
  v5 = *v4;

  return v5;
}

- (void)addDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FBKGroupedDevice devices](self, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "remoteTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v6, "isMoreCompleteThan:", v9) & 1) == 0)
  {
    -[FBKGroupedDevice devices](self, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "remoteTransport"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

- (BOOL)isLikeDEDDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "isLikeDevice:", v4))
        {
          v15 = 0;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[FBKGroupedDevice devices](self, "devices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "remoteTransport"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

  }
  else
  {
    v15 = 1;
  }
LABEL_12:

  return v15;
}

- (id)deviceDataForSubmissionWithSession:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  -[FBKGroupedDevice mostReliableDevice](self, "mostReliableDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

  v8 = *MEMORY[0x24BE2C9D8];
  v15[0] = *MEMORY[0x24BE2C9E0];
  v15[1] = v8;
  v15[2] = *MEMORY[0x24BE2C9C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsForKeys:", v9);

  v10 = objc_msgSend(v4, "isVisibleToDED");
  v11 = 1;
  if (!a3)
    v11 = 2;
  if (v10)
    v12 = v11;
  else
    v12 = 3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("connectivity"));

  objc_msgSend(v7, "replaceCamelCaseKeysWithSnakeCaseKeys");
  return v7;
}

- (id)identifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          v13 = objc_msgSend(v10, "isTemporaryDevice");
          v14 = v10;
          if (v13)
            v15 = v6;
          else
            v15 = v7;
          if (v13)
            v6 = v14;
          else
            v7 = v14;

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);

    if (v7)
    {
      objc_msgSend(v7, "identifier");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  else
  {

    v6 = 0;
  }
  objc_msgSend(v6, "identifier");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_20:
  if (v16)
    v17 = v16;
  else
    v17 = &stru_24E15EAF8;
  v18 = v17;

  return v18;
}

- (id)platform
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v5 = (void *)*MEMORY[0x24BE2CA00];
  if (!v4)
  {
LABEL_12:

    return v5;
  }
  v6 = v4;
  v7 = *(_QWORD *)v17;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v7)
      objc_enumerationMutation(v3);
    v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
    objc_msgSend(v9, "platform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {

      goto LABEL_10;
    }
    objc_msgSend(v9, "platform");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v5);

    if (!v12)
      break;
LABEL_10:
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        goto LABEL_3;
      goto LABEL_12;
    }
  }
  v13 = v9;

  if (v13)
  {
    objc_msgSend(v13, "platform");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  return v5;
}

- (BOOL)isCurrentDevice
{
  void *v2;
  char v3;

  -[FBKGroupedDevice anyDEDDevice](self, "anyDEDDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

- (id)publicLogDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
  {
LABEL_12:

    goto LABEL_15;
  }
  v6 = v5;
  v7 = *(_QWORD *)v18;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
    objc_msgSend(v9, "productType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {

      goto LABEL_10;
    }
    objc_msgSend(v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
      break;
LABEL_10:
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        goto LABEL_3;
      goto LABEL_12;
    }
  }
  v13 = v9;

  if (v13)
  {
    v14 = v13;
    goto LABEL_16;
  }
LABEL_15:
  -[FBKGroupedDevice anyDEDDevice](self, "anyDEDDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
LABEL_16:
  objc_msgSend(v14, "publicLogDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)build
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE312C8];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE312C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (FBKIsEmptyString(v5))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[FBKGroupedDevice devices](self, "devices", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(v11, "build");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
          break;
        if (v8 == (id)++v10)
        {
          v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_15;
        }
      }
      v16 = objc_msgSend(v11, "isVisibleToDED");
      v8 = v11;
      if ((v16 & 1) == 0)
        goto LABEL_15;

      if (v8)
      {
        objc_msgSend(v8, "build");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else
    {
LABEL_15:

    }
    objc_msgSend(v8, "build");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "build");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = &stru_24E15EAF8;
    }

LABEL_20:
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v4);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)color
{
  return -[FBKGroupedDevice bestStringForKey:](self, "bestStringForKey:", CFSTR("color"));
}

- (id)deviceClass
{
  return -[FBKGroupedDevice bestStringForKey:](self, "bestStringForKey:", CFSTR("deviceClass"));
}

- (id)name
{
  return -[FBKGroupedDevice bestStringForKey:](self, "bestStringForKey:", CFSTR("name"));
}

- (id)productType
{
  return -[FBKGroupedDevice bestStringForKey:](self, "bestStringForKey:", CFSTR("productType"));
}

- (id)serialize
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[FBKGroupedDevice devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasCapabilities:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FBKGroupedDevice readyDevice](self, "readyDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCapabilities:", v4);

  return v6;
}

- (id)debugDetails
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[FBKGroupedDevice devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("debugDetails"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deviceDefaults
{
  return (id)objc_msgSend(MEMORY[0x24BE2CA40], "deviceDefaults");
}

+ (id)deviceDefaults
{
  return (id)objc_msgSend(MEMORY[0x24BE2CA40], "deviceDefaults");
}

+ (id)inspectFBKPairing
{
  return (id)objc_msgSend(MEMORY[0x24BE2CA40], "inspectFBKPairing");
}

- (void)fetchIconImageDataForScale:(float)a3 completionCompletion:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v10 = a4;
  -[FBKGroupedDevice devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24E18CA70);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[FBKGroupedDevice devices](self, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", &unk_24E18CA40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[FBKGroupedDevice anyDEDDevice](self, "anyDEDDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  *(float *)&v8 = a3;
  objc_msgSend(v7, "fetchIconImageDataForScale:completionCompletion:", v10, v8);

}

- (id)imageData
{
  NSObject *v2;

  +[FBKLog ded](FBKLog, "ded");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[FBKGroupedDevice imageData].cold.1(v2);

  return 0;
}

- (BOOL)isFBKPaired
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isFBKPaired") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)displayName
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = &stru_24E15EAF8;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "displayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v9, "displayName");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = &stru_24E15EAF8;
  }
LABEL_12:

  return v7;
}

- (id)displayType
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = &stru_24E15EAF8;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "displayType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v9, "displayType");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = &stru_24E15EAF8;
  }
LABEL_12:

  return v7;
}

- (void)pairToFBK
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "pairToFBK");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[FBKGroupedDevice _postDeviceChangeNotification](self, "_postDeviceChangeNotification");
}

- (void)updateStoredCopyIfNeeded
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_21D9A9000, a4, OS_LOG_TYPE_DEBUG, "updating stored copy of device [%@]", a1, 0xCu);

}

- (void)removeFBKPairing
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFBKPairing");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[FBKGroupedDevice _postDeviceChangeNotification](self, "_postDeviceChangeNotification");
}

- (BOOL)isVisibleToDED
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isVisibleToDED") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)diffableHashWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[FBKGroupedDevice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKGroupedDevice identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_updateWithDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  -[FBKGroupedDevice setDevices:](self, "setDevices:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[FBKGroupedDevice devices](self, "devices", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "remoteTransport"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)deviceListChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[FBKGroupedDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("configured"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __38__FBKGroupedDevice_deviceListChanged___block_invoke;
  v12[3] = &unk_24E156BD0;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "ded_findWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "devices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKGroupedDevice setDevices:](self, "setDevices:", v11);

  }
}

uint64_t __38__FBKGroupedDevice_deviceListChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)bestStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBKGroupedDevice devices](self, "devices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "valueForKey:", v4);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v11, "length"))
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  if (v11)
    v12 = v11;
  else
    v12 = &stru_24E15EAF8;
  v13 = v12;

  return v13;
}

- (id)readyDevice
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKGroupedDevice devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ded_findWithBlock:", &__block_literal_global_50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __31__FBKGroupedDevice_readyDevice__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 1;
}

- (void)_postDeviceChangeNotification
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("device");
  v6[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("FBKDeviceStateDidChange"), 0, v4);

}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

- (int64_t)hash
{
  FBKGroupedDevice *v2;
  id v3;
  int64_t v4;

  v2 = self;
  v3 = -[FBKGroupedDevice identifier](v2, sel_identifier);
  sub_21DAC481C();

  v4 = sub_21DAC490C();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)sortedDevices:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v7;
  uint64_t v8;

  sub_21DA3BF58(0, &qword_255399B70);
  v3 = sub_21DAC496C();
  swift_getObjCClassMetadata();
  if (v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    v7 = swift_bridgeObjectRetain();
    v4 = (uint64_t)sub_21DAB9654(v7, (void (*)(_QWORD *, uint64_t, unint64_t))sub_21DAB6FBC);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v8 = v4;
  sub_21DAB7EB8(&v8);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_21DAC4960();
  swift_release();
  return v5;
}

- (void)imageData
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "imageData is not used in FBK", v1, 2u);
}

@end
