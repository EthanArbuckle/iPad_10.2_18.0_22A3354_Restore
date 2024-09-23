@implementation DRSCloudChannelConfig

+ (id)stringForChannelType:(unsigned __int8)a3
{
  if (a3 > 4u)
    return CFSTR("Unknown");
  else
    return off_1EA3D2910[(char)a3];
}

+ (id)stringForEnvironment:(unsigned __int8)a3
{
  if (a3 > 2u)
    return CFSTR("Unknown");
  else
    return off_1EA3D2938[(char)a3];
}

- (id)debugDescription
{
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = -[DRSCloudChannelConfig isNoSubscriptionConfig](self, "isNoSubscriptionConfig");
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    v5 = -[DRSCloudChannelConfig overridesDeviceDefault](self, "overridesDeviceDefault");
    v6 = CFSTR("DEFAULT");
    if (v5)
      v6 = CFSTR("Override");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("No Subscription (%@)"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DRSCloudChannelConfig channelName](self, "channelName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DRSCloudChannelConfig overridesDeviceDefault](self, "overridesDeviceDefault"))
      v9 = CFSTR("Override");
    else
      v9 = CFSTR("DEFAULT");
    -[DRSCloudChannelConfig channelID](self, "channelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@, %@)"), v8, v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (DRSCloudChannelConfig)initWithValidPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4 environment:(unsigned __int8)a5 populationSliceNumber:(id)a6 overridesDeviceDefault:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  DRSCloudChannelConfig *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  unint64_t v24;
  int v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v7 = a7;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = v12;
  v14 = 0;
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 != 5)
    {
      v14 = 0;
      if ((v9 - 1) <= 3u && (v8 - 1) <= 1u)
      {
        if (!v12)
        {
LABEL_9:
          self = (DRSCloudChannelConfig *)-[DRSCloudChannelConfig initNoChecksWithPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:](self, "initNoChecksWithPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:", v10, v9, v8, v13, v7);
          v14 = self;
          goto LABEL_16;
        }
        v15 = objc_msgSend(v12, "unsignedLongLongValue");
        objc_msgSend((id)objc_opt_class(), "sliceCountForPlatform:channelType:", v10, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = objc_msgSend(v16, "unsignedLongLongValue");
          if (v15 < v18)
          {

            goto LABEL_9;
          }
          v24 = v18;
          DPLogHandle_ConfigPersistedStoreError();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v19))
          {
            v26 = 134218240;
            v27 = v15;
            v28 = 2048;
            v29 = v24;
            v20 = "InvalidSlice";
            v21 = "Slice %llu is >= %llu (the slice count for the population)";
            v22 = v19;
            v23 = 22;
            goto LABEL_14;
          }
        }
        else
        {
          DPLogHandle_ConfigPersistedStoreError();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v19))
          {
            LOWORD(v26) = 0;
            v20 = "UnexpectedPopulationSliceNumber";
            v21 = "Tried to specify population slice for a platform/channelType that does not support it";
            v22 = v19;
            v23 = 2;
LABEL_14:
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v20, v21, (uint8_t *)&v26, v23);
          }
        }

        v14 = 0;
      }
    }
  }
LABEL_16:

  return v14;
}

- (id)initNoChecksWithPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4 environment:(unsigned __int8)a5 populationSliceNumber:(id)a6 overridesDeviceDefault:(BOOL)a7
{
  id v13;
  DRSCloudChannelConfig *v14;
  DRSCloudChannelConfig *v15;
  objc_super v17;

  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DRSCloudChannelConfig;
  v14 = -[DRSCloudChannelConfig init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_platform = a3;
    v14->_type = a4;
    v14->_environment = a5;
    objc_storeStrong((id *)&v14->_populationSliceNumber, a6);
    v15->_overridesDeviceDefault = a7;
  }

  return v15;
}

- (id)initNoSubscriptionConfig:(BOOL)a3
{
  DRSCloudChannelConfig *v4;
  DRSCloudChannelConfig *v5;
  NSNumber *populationSliceNumber;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DRSCloudChannelConfig;
  v4 = -[DRSCloudChannelConfig init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_platform = 0;
    v4->_environment = 0;
    populationSliceNumber = v4->_populationSliceNumber;
    v4->_populationSliceNumber = 0;

    v5->_overridesDeviceDefault = a3;
  }
  return v5;
}

- (BOOL)isNoSubscriptionConfig
{
  return !-[DRSCloudChannelConfig platform](self, "platform")
      && !-[DRSCloudChannelConfig type](self, "type")
      && -[DRSCloudChannelConfig environment](self, "environment") == 0;
}

- (BOOL)allowsWildcardBuild
{
  return 1;
}

- (DRSCloudChannelConfig)initWithMO:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  DRSCloudChannelConfig *v10;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "platform");
    v6 = objc_msgSend(v4, "channelType");
    v7 = objc_msgSend(v4, "environment");
    objc_msgSend(v4, "populationSliceNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "overridesDeviceDefault");

    self = (DRSCloudChannelConfig *)-[DRSCloudChannelConfig initNoChecksWithPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:](self, "initNoChecksWithPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DRSCloudChannelConfig *v5;
  DRSCloudChannelConfig *v6;
  DRSCloudChannelConfig *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 v19;

  v5 = (DRSCloudChannelConfig *)a3;
  v6 = v5;
  if (v5 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[DRSCloudChannelConfig populationSliceNumber](self, "populationSliceNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8
          || (-[DRSCloudChannelConfig populationSliceNumber](v7, "populationSliceNumber"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[DRSCloudChannelConfig populationSliceNumber](v7, "populationSliceNumber");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            -[DRSCloudChannelConfig populationSliceNumber](self, "populationSliceNumber");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v8)
            {

              if (!v11)
                goto LABEL_22;
            }
            else if (!v11)
            {
              goto LABEL_22;
            }
          }
          else
          {

            if (v8)
            {

            }
          }
          -[DRSCloudChannelConfig populationSliceNumber](self, "populationSliceNumber");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12
            || (-[DRSCloudChannelConfig populationSliceNumber](self, "populationSliceNumber"),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                -[DRSCloudChannelConfig populationSliceNumber](v7, "populationSliceNumber"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v13, "isEqualToNumber:", v14),
                v14,
                v13,
                v15))
          {
            v16 = -[DRSCloudChannelConfig platform](self, "platform");
            if (v16 == -[DRSCloudChannelConfig platform](v7, "platform"))
            {
              v17 = -[DRSCloudChannelConfig environment](self, "environment");
              if (v17 == -[DRSCloudChannelConfig environment](v7, "environment"))
              {
                v18 = -[DRSCloudChannelConfig type](self, "type");
                if (v18 == -[DRSCloudChannelConfig type](v7, "type"))
                {
                  v19 = -[DRSCloudChannelConfig overridesDeviceDefault](self, "overridesDeviceDefault");
                  v9 = v19 ^ -[DRSCloudChannelConfig overridesDeviceDefault](v7, "overridesDeviceDefault") ^ 1;
LABEL_23:

                  goto LABEL_24;
                }
              }
            }
          }
        }
        else
        {

        }
LABEL_22:
        LOBYTE(v9) = 0;
        goto LABEL_23;
      }
    }
    LOBYTE(v9) = 0;
  }
LABEL_24:

  return v9;
}

- (id)jsonDictionaryRepresentation
{
  __CFString *v2;
  __CFString *v3;
  _BOOL4 v5;
  BOOL v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = -[DRSCloudChannelConfig isNoSubscriptionConfig](self, "isNoSubscriptionConfig");
  v6 = v5;
  v21 = CFSTR("platform");
  if (v5)
  {
    v29 = CFSTR("(None)");
    v30 = CFSTR("(None)");
    v22 = CFSTR("channelType");
    v23 = CFSTR("environment");
    v7 = MEMORY[0x1E0C9AAA0];
    v8 = CFSTR("(None)");
  }
  else
  {
    DRSSystemProfilePlatformStringForPlatform(-[DRSCloudChannelConfig platform](self, "platform"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = v2;
    v22 = CFSTR("channelType");
    objc_msgSend((id)objc_opt_class(), "stringForChannelType:", -[DRSCloudChannelConfig type](self, "type"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = v3;
    v23 = CFSTR("environment");
    objc_msgSend((id)objc_opt_class(), "stringForEnvironment:", -[DRSCloudChannelConfig environment](self, "environment"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C9AAB0];
  }
  v31 = v8;
  v32 = v7;
  v24 = CFSTR("isSubscribed");
  v25 = CFSTR("populationSliceNumber");
  -[DRSCloudChannelConfig populationSliceNumber](self, "populationSliceNumber");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("(None)");
  v33 = v11;
  v26 = CFSTR("overridesDeviceDefault");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSCloudChannelConfig overridesDeviceDefault](self, "overridesDeviceDefault"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v12;
  v27 = CFSTR("channelName");
  -[DRSCloudChannelConfig channelName](self, "channelName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("(None)");
  v35 = v15;
  v28 = CFSTR("channelID");
  -[DRSCloudChannelConfig channelID](self, "channelID");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("(None)");
  v36 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v21, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

  }
  return v19;
}

+ (id)channelNameForPlatform:(unsigned __int8)a3 type:(unsigned __int8)a4 sliceNum:(id)a5
{
  uint64_t v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  if (v6 - 1 < 4 || v6 == 6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    DRSSystemProfilePlatformStringForPlatform(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[DRSCloudChannelConfig stringForChannelType:](DRSCloudChannelConfig, "stringForChannelType:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v7)
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@_%@"), v9, v10, v7);
    else
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@"), v9, v10, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)channelName
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  v4 = -[DRSCloudChannelConfig platform](self, "platform");
  v5 = -[DRSCloudChannelConfig type](self, "type");
  -[DRSCloudChannelConfig populationSliceNumber](self, "populationSliceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelNameForPlatform:type:sliceNum:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (id)channelIDForName:(id)a3
{
  return _base64EncodedMD5Digest((uint64_t)a3);
}

- (NSString)channelID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[DRSCloudChannelConfig channelName](self, "channelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelIDForName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (unsigned)channelTypeForIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isQA:(BOOL)a5 isCarrier:(BOOL)a6
{
  unsigned __int8 v6;

  if (a4)
    v6 = 3;
  else
    v6 = 4;
  if (a3)
    v6 = 2;
  if (a5 || a6)
    return !a6;
  else
    return v6;
}

+ (id)staticSnapshotDeviceDefaultCloudChannelConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__DRSCloudChannelConfig_staticSnapshotDeviceDefaultCloudChannelConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (staticSnapshotDeviceDefaultCloudChannelConfig_onceToken != -1)
    dispatch_once(&staticSnapshotDeviceDefaultCloudChannelConfig_onceToken, block);
  return (id)staticSnapshotDeviceDefaultCloudChannelConfig_defaultConfig;
}

void __70__DRSCloudChannelConfig_staticSnapshotDeviceDefaultCloudChannelConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "currentDeviceDefaultCloudChannelConfig");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)staticSnapshotDeviceDefaultCloudChannelConfig_defaultConfig;
  staticSnapshotDeviceDefaultCloudChannelConfig_defaultConfig = v1;

}

+ (id)currentDeviceDefaultCloudChannelConfig
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  DRSCloudChannelConfig *v9;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "channelTypeForIsInternal:isSeed:isQA:isCarrier:", objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), 0, objc_msgSend(v3, "isCarrier"));
  if ((_DWORD)v4)
  {
    v5 = v4;
    objc_msgSend(a1, "sliceCountForPlatform:channelType:", objc_msgSend(v3, "platform"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", +[DRSCloudChannelConfig populationSliceForDevice:](DRSCloudChannelConfig, "populationSliceForDevice:", objc_msgSend(v6, "unsignedShortValue")));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v9 = -[DRSCloudChannelConfig initWithValidPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:]([DRSCloudChannelConfig alloc], "initWithValidPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:", objc_msgSend(v3, "platform"), v5, 2, v8, 0);

  }
  else
  {
    v9 = -[DRSCloudChannelConfig initNoSubscriptionConfig:]([DRSCloudChannelConfig alloc], "initNoSubscriptionConfig:", 0);
  }

  return v9;
}

+ (unsigned)populationSliceForDevice:(unsigned __int16)a3
{
  unsigned int v3;
  void *v4;

  v3 = a3;
  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v3) = objc_msgSend(v4, "deviceHash") % (unint64_t)v3;

  return v3;
}

+ (id)_smallPopulationCountDict
{
  if (_smallPopulationCountDict_onceToken != -1)
    dispatch_once(&_smallPopulationCountDict_onceToken, &__block_literal_global_11);
  return (id)_smallPopulationCountDict_kCountDict;
}

void __50__DRSCloudChannelConfig__smallPopulationCountDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA3E39B0;
  v2[1] = &unk_1EA3E39E0;
  v3[0] = &unk_1EA3E39C8;
  v3[1] = &unk_1EA3E39C8;
  v2[2] = &unk_1EA3E39F8;
  v2[3] = &unk_1EA3E3A28;
  v3[2] = &unk_1EA3E3A10;
  v3[3] = &unk_1EA3E3A10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_smallPopulationCountDict_kCountDict;
  _smallPopulationCountDict_kCountDict = v0;

}

+ (id)_iOSSliceCountDict
{
  if (_iOSSliceCountDict_onceToken != -1)
    dispatch_once(&_iOSSliceCountDict_onceToken, &__block_literal_global_190);
  return (id)_iOSSliceCountDict_kCountDict;
}

void __43__DRSCloudChannelConfig__iOSSliceCountDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA3E39B0;
  v2[1] = &unk_1EA3E39E0;
  v3[0] = &unk_1EA3E39C8;
  v3[1] = &unk_1EA3E39C8;
  v2[2] = &unk_1EA3E39F8;
  v2[3] = &unk_1EA3E3A28;
  v3[2] = &unk_1EA3E3A10;
  v3[3] = &unk_1EA3E3A40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_iOSSliceCountDict_kCountDict;
  _iOSSliceCountDict_kCountDict = v0;

}

+ (id)sliceCountForPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4
{
  int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    switch(v4)
    {
      case 1:
        objc_msgSend(a1, "_macOSSliceCountDict");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 2:
        objc_msgSend(a1, "_iOSSliceCountDict");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3:
        objc_msgSend(a1, "_watchOSSliceCountDict");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4:
        objc_msgSend(a1, "_tvOSSliceCountDict");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 6:
        objc_msgSend(a1, "_smallPopulationCountDict");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v9 = v8;
        objc_msgSend(v8, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        break;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unsigned)platform
{
  return self->_platform;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)environment
{
  return self->_environment;
}

- (BOOL)overridesDeviceDefault
{
  return self->_overridesDeviceDefault;
}

- (NSNumber)populationSliceNumber
{
  return self->_populationSliceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_populationSliceNumber, 0);
}

@end
