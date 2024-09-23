@implementation CXProviderConfiguration

- (CXProviderConfiguration)init
{
  CXProviderConfiguration *v2;
  CXProviderConfiguration *v3;
  NSArray *emergencyHandles;
  NSArray *v5;
  NSArray *emergencyLabeledHandles;
  NSArray *handoffIdentifiers;
  uint64_t v8;
  NSOrderedSet *prioritizedSenderIdentities;
  uint64_t v10;
  NSSet *supportedHandleTypes;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CXProviderConfiguration;
  v2 = -[CXProviderConfiguration init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    emergencyHandles = v2->_emergencyHandles;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_emergencyHandles = (NSArray *)MEMORY[0x1E0C9AA60];

    emergencyLabeledHandles = v3->_emergencyLabeledHandles;
    v3->_emergencyLabeledHandles = v5;

    handoffIdentifiers = v3->_handoffIdentifiers;
    v3->_handoffIdentifiers = v5;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v8 = objc_claimAutoreleasedReturnValue();
    prioritizedSenderIdentities = v3->_prioritizedSenderIdentities;
    v3->_prioritizedSenderIdentities = (NSOrderedSet *)v8;

    *(_OWORD *)&v3->_maximumCallGroups = xmmword_1A40939E0;
    v3->_supportsAudioOnly = 1;
    v3->_includesCallsInRecents = 1;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    supportedHandleTypes = v3->_supportedHandleTypes;
    v3->_supportedHandleTypes = (NSSet *)v10;

    *(_WORD *)&v3->_supportsCurrentPlatform = 257;
  }
  return v3;
}

- (CXProviderConfiguration)initWithLocalizedName:(NSString *)localizedName
{
  NSString *v4;
  CXProviderConfiguration *v5;
  uint64_t v6;
  NSString *v7;

  v4 = localizedName;
  v5 = -[CXProviderConfiguration init](self, "init");
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXProviderConfiguration initWithLocalizedName:]", CFSTR("localizedName"));
    v6 = -[NSString copy](v4, "copy");
    v7 = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXProviderConfiguration localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localizedName=%@"), v4);

  -[CXProviderConfiguration ringtoneSoundURL](self, "ringtoneSoundURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" ringtoneSoundURL=%@"), v5);

  -[CXProviderConfiguration iconTemplateImageData](self, "iconTemplateImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" iconTemplateImageData=%p"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(" maximumCallGroups=%lu"), -[CXProviderConfiguration maximumCallGroups](self, "maximumCallGroups"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" maximumCallsPerCallGroup=%lu"), -[CXProviderConfiguration maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsAudioOnly=%d"), -[CXProviderConfiguration supportsAudioOnly](self, "supportsAudioOnly"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsVideo=%d"), -[CXProviderConfiguration supportsVideo](self, "supportsVideo"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsEmergency=%d"), -[CXProviderConfiguration supportsEmergency](self, "supportsEmergency"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsVoicemail=%d"), -[CXProviderConfiguration supportsVoicemail](self, "supportsVoicemail"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsCurrentPlatform=%d"), -[CXProviderConfiguration supportsCurrentPlatform](self, "supportsCurrentPlatform"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsRinging=%d"), -[CXProviderConfiguration supportsRinging](self, "supportsRinging"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" includesCallsInRecents=%d"), -[CXProviderConfiguration includesCallsInRecents](self, "includesCallsInRecents"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioSessionID=%u"), -[CXProviderConfiguration audioSessionID](self, "audioSessionID"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsDynamicSystemUI=%d"), -[CXProviderConfiguration supportsDynamicSystemUI](self, "supportsDynamicSystemUI"));
  -[CXProviderConfiguration supportedHandleTypes](self, "supportedHandleTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportedHandleTypes=%@"), v9);

  -[CXProviderConfiguration emergencyHandles](self, "emergencyHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[CXProviderConfiguration emergencyHandles](self, "emergencyHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" emergencyHandles=%@"), v13);

  }
  -[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    -[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" emergencyLabeledHandles=%@"), v17);

  }
  -[CXProviderConfiguration handoffIdentifiers](self, "handoffIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[CXProviderConfiguration handoffIdentifiers](self, "handoffIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" handoffIdentifiers=%@"), v21);

  }
  -[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    -[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" prioritizedSenderIdentities=%@"), v26);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)setSenderIdentities:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithSet:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CXProviderConfiguration setPrioritizedSenderIdentities:](self, "setPrioritizedSenderIdentities:", v4);

}

- (NSSet)senderIdentities
{
  void *v2;
  void *v3;

  -[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSString)ringtoneSound
{
  void *v2;
  void *v3;
  void *v4;

  -[CXProviderConfiguration ringtoneSoundURL](self, "ringtoneSoundURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setRingtoneSound:(NSString *)ringtoneSound
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CXSandboxExtendedURL *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  CXSandboxExtendedURL *v24;
  id v25;

  v4 = ringtoneSound;
  -[CXProviderConfiguration setRingtoneSoundURL:](self, "setRingtoneSoundURL:", 0);
  if (-[NSString length](v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLsForDirectory:inDomains:", 5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Sounds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v13, "attributesOfItemAtPath:error:", v14, &v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v25;

      if (v15)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B18]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)*MEMORY[0x1E0CB2B30];

        if (v17 != v18)
        {
          v19 = -[CXSandboxExtendedURL initWithURL:]([CXSandboxExtendedURL alloc], "initWithURL:", v9);
          -[CXProviderConfiguration setRingtoneSoundURL:](self, "setRingtoneSoundURL:", v19);

        }
      }
      if (v16)
      {
        CXDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CXProviderConfiguration setRingtoneSound:].cold.1((uint64_t)v16, v20);

      }
    }
    -[CXProviderConfiguration ringtoneSoundURL](self, "ringtoneSoundURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLForResource:withExtension:", v4, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = -[CXSandboxExtendedURL initWithURL:]([CXSandboxExtendedURL alloc], "initWithURL:", v23);
        -[CXProviderConfiguration setRingtoneSoundURL:](self, "setRingtoneSoundURL:", v24);

      }
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXProviderConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  int v18;
  NSUInteger v19;
  NSUInteger v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char v28;
  unsigned int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;

  v4 = a3;
  -[CXProviderConfiguration emergencyHandles](self, "emergencyHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emergencyHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToArray:", v6))
  {
    -[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emergencyLabeledHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToArray:", v8))
    {
      -[CXProviderConfiguration handoffIdentifiers](self, "handoffIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handoffIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToArray:", v10))
      {
        -[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "prioritizedSenderIdentities");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToOrderedSet:", v12))
        {
          v38 = v12;
          -[CXProviderConfiguration ringtoneSoundURL](self, "ringtoneSoundURL");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "ringtoneSoundURL");
          v14 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v13;
          if (v13 | v14 && (v15 = v14, v16 = objc_msgSend(v39, "isEqual:", v14), v14 = v15, !v16))
          {
            v28 = 0;
            v12 = v38;
          }
          else
          {
            v37 = v14;
            -[CXProviderConfiguration iconTemplateImageData](self, "iconTemplateImageData");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "iconTemplateImageData");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v17;
            v18 = objc_msgSend(v17, "isEqualToData:");
            v12 = v38;
            if (v18)
            {
              v34 = v11;
              v19 = -[CXProviderConfiguration maximumCallGroups](self, "maximumCallGroups");
              if (v19 != objc_msgSend(v4, "maximumCallGroups"))
                goto LABEL_17;
              v20 = -[CXProviderConfiguration maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup");
              if (v20 != objc_msgSend(v4, "maximumCallsPerCallGroup"))
                goto LABEL_17;
              v21 = -[CXProviderConfiguration supportsAudioOnly](self, "supportsAudioOnly");
              if (v21 == objc_msgSend(v4, "supportsAudioOnly")
                && (v22 = -[CXProviderConfiguration supportsVideo](self, "supportsVideo"),
                    v22 == objc_msgSend(v4, "supportsVideo"))
                && (v23 = -[CXProviderConfiguration supportsEmergency](self, "supportsEmergency"),
                    v23 == objc_msgSend(v4, "supportsEmergency"))
                && (v24 = -[CXProviderConfiguration supportsCurrentPlatform](self, "supportsCurrentPlatform"),
                    v24 == objc_msgSend(v4, "supportsCurrentPlatform"))
                && (v25 = -[CXProviderConfiguration supportsVoicemail](self, "supportsVoicemail"),
                    v25 == objc_msgSend(v4, "supportsVoicemail"))
                && (v26 = -[CXProviderConfiguration supportsRinging](self, "supportsRinging"),
                    v26 == objc_msgSend(v4, "supportsRinging"))
                && (v27 = -[CXProviderConfiguration includesCallsInRecents](self, "includesCallsInRecents"),
                    v27 == objc_msgSend(v4, "includesCallsInRecents")))
              {
                v30 = -[CXProviderConfiguration audioSessionID](self, "audioSessionID");
                if (v30 == objc_msgSend(v4, "audioSessionID")
                  && (v31 = -[CXProviderConfiguration supportsDynamicSystemUI](self, "supportsDynamicSystemUI"),
                      v31 == objc_msgSend(v4, "supportsDynamicSystemUI")))
                {
                  -[CXProviderConfiguration supportedHandleTypes](self, "supportedHandleTypes");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "supportedHandleTypes");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v32, "isEqualToSet:", v33);

                }
                else
                {
                  v28 = 0;
                }
                v11 = v34;
                v12 = v38;
              }
              else
              {
LABEL_17:
                v28 = 0;
                v11 = v34;
              }
            }
            else
            {
              v28 = 0;
            }

            v14 = v37;
          }

        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v33;

  -[CXProviderConfiguration emergencyHandles](self, "emergencyHandles");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v33, "hash");
  -[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[CXProviderConfiguration handoffIdentifiers](self, "handoffIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[CXProviderConfiguration ringtoneSoundURL](self, "ringtoneSoundURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[CXProviderConfiguration iconTemplateImageData](self, "iconTemplateImageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  v14 = v9 ^ v13 ^ -[CXProviderConfiguration maximumCallGroups](self, "maximumCallGroups");
  v15 = -[CXProviderConfiguration maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup");
  if (-[CXProviderConfiguration supportsAudioOnly](self, "supportsAudioOnly"))
    v16 = 1231;
  else
    v16 = 1237;
  v17 = v15 ^ v16;
  if (-[CXProviderConfiguration supportsVideo](self, "supportsVideo"))
    v18 = 1231;
  else
    v18 = 1237;
  v19 = v14 ^ v17 ^ v18;
  if (-[CXProviderConfiguration supportsEmergency](self, "supportsEmergency"))
    v20 = 1231;
  else
    v20 = 1237;
  if (-[CXProviderConfiguration supportsCurrentPlatform](self, "supportsCurrentPlatform"))
    v21 = 1231;
  else
    v21 = 1237;
  v22 = v20 ^ v21;
  if (-[CXProviderConfiguration supportsVoicemail](self, "supportsVoicemail"))
    v23 = 1231;
  else
    v23 = 1237;
  v24 = v22 ^ v23;
  if (-[CXProviderConfiguration supportsRinging](self, "supportsRinging"))
    v25 = 1231;
  else
    v25 = 1237;
  v26 = v19 ^ v24 ^ v25;
  if (-[CXProviderConfiguration includesCallsInRecents](self, "includesCallsInRecents"))
    v27 = 1231;
  else
    v27 = 1237;
  if (-[CXProviderConfiguration supportsDynamicSystemUI](self, "supportsDynamicSystemUI"))
    v28 = 1231;
  else
    v28 = 1237;
  v29 = v27 ^ v28 ^ -[CXProviderConfiguration audioSessionID](self, "audioSessionID");
  -[CXProviderConfiguration supportedHandleTypes](self, "supportedHandleTypes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v26 ^ v29 ^ objc_msgSend(v30, "hash");

  return v31;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setAudioSessionID:", -[CXProviderConfiguration audioSessionID](self, "audioSessionID"));
  -[CXProviderConfiguration ringtoneSoundURL](self, "ringtoneSoundURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRingtoneSoundURL:", v5);

  -[CXProviderConfiguration iconTemplateImageData](self, "iconTemplateImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIconTemplateImageData:", v6);

  objc_msgSend(v8, "setMaximumCallGroups:", -[CXProviderConfiguration maximumCallGroups](self, "maximumCallGroups"));
  objc_msgSend(v8, "setMaximumCallsPerCallGroup:", -[CXProviderConfiguration maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  objc_msgSend(v8, "setSupportsVideo:", -[CXProviderConfiguration supportsVideo](self, "supportsVideo"));
  objc_msgSend(v8, "setIncludesCallsInRecents:", -[CXProviderConfiguration includesCallsInRecents](self, "includesCallsInRecents"));
  -[CXProviderConfiguration supportedHandleTypes](self, "supportedHandleTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSupportedHandleTypes:", v7);

  objc_msgSend(v8, "setSupportsDynamicSystemUI:", -[CXProviderConfiguration supportsDynamicSystemUI](self, "supportsDynamicSystemUI"));
}

- (id)sanitizedCopy
{
  return -[CXProviderConfiguration sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXProviderConfiguration updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v5, a3);
  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CXProviderConfiguration updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v10, a4);
  -[CXProviderConfiguration emergencyHandles](self, "emergencyHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEmergencyHandles:", v6);

  -[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEmergencyLabeledHandles:", v7);

  -[CXProviderConfiguration handoffIdentifiers](self, "handoffIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHandoffIdentifiers:", v8);

  -[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrioritizedSenderIdentities:", v9);

  objc_msgSend(v10, "setSupportsAudioOnly:", -[CXProviderConfiguration supportsAudioOnly](self, "supportsAudioOnly"));
  objc_msgSend(v10, "setSupportsEmergency:", -[CXProviderConfiguration supportsEmergency](self, "supportsEmergency"));
  objc_msgSend(v10, "setSupportsVoicemail:", -[CXProviderConfiguration supportsVoicemail](self, "supportsVoicemail"));
  objc_msgSend(v10, "setSupportsCurrentPlatform:", -[CXProviderConfiguration supportsCurrentPlatform](self, "supportsCurrentPlatform"));
  objc_msgSend(v10, "setSupportsRinging:", -[CXProviderConfiguration supportsRinging](self, "supportsRinging"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXProviderConfiguration updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXProviderConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CXProviderConfiguration *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *emergencyHandles;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *emergencyLabeledHandles;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *handoffIdentifiers;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *localizedName;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSOrderedSet *prioritizedSenderIdentities;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSData *iconTemplateImageData;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSSet *supportedHandleTypes;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  NSObject *v61;
  id v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("CXProviderConfiguration cannot be decoded by non-XPC coders."), 0);
    v63 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v63);
  }
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CXProviderConfiguration init](self, "init");
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_emergencyHandles);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    emergencyHandles = v6->_emergencyHandles;
    v6->_emergencyHandles = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_emergencyLabeledHandles);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    emergencyLabeledHandles = v6->_emergencyLabeledHandles;
    v6->_emergencyLabeledHandles = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_handoffIdentifiers);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    handoffIdentifiers = v6->_handoffIdentifiers;
    v6->_handoffIdentifiers = (NSArray *)v23;

    v25 = objc_opt_class();
    NSStringFromSelector(sel_localizedName);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    localizedName = v6->_localizedName;
    v6->_localizedName = (NSString *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_prioritizedSenderIdentities);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    prioritizedSenderIdentities = v6->_prioritizedSenderIdentities;
    v6->_prioritizedSenderIdentities = (NSOrderedSet *)v33;

    v35 = objc_opt_class();
    NSStringFromSelector(sel_iconTemplateImageData);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    iconTemplateImageData = v6->_iconTemplateImageData;
    v6->_iconTemplateImageData = (NSData *)v37;

    NSStringFromSelector(sel_maximumCallGroups);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_maximumCallGroups = objc_msgSend(v4, "decodeIntegerForKey:", v39);

    NSStringFromSelector(sel_maximumCallsPerCallGroup);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_maximumCallsPerCallGroup = objc_msgSend(v4, "decodeIntegerForKey:", v40);

    NSStringFromSelector(sel_supportsAudioOnly);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsAudioOnly = objc_msgSend(v4, "decodeBoolForKey:", v41);

    NSStringFromSelector(sel_supportsVideo);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsVideo = objc_msgSend(v4, "decodeBoolForKey:", v42);

    NSStringFromSelector(sel_supportsEmergency);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsEmergency = objc_msgSend(v4, "decodeBoolForKey:", v43);

    NSStringFromSelector(sel_supportsCurrentPlatform);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsCurrentPlatform = objc_msgSend(v4, "decodeBoolForKey:", v44);

    NSStringFromSelector(sel_supportsVoicemail);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsVoicemail = objc_msgSend(v4, "decodeBoolForKey:", v45);

    NSStringFromSelector(sel_supportsRinging);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsRinging = objc_msgSend(v4, "decodeBoolForKey:", v46);

    NSStringFromSelector(sel_supportsDynamicSystemUI);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsDynamicSystemUI = objc_msgSend(v4, "decodeBoolForKey:", v47);

    NSStringFromSelector(sel_includesCallsInRecents);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_includesCallsInRecents = objc_msgSend(v4, "decodeBoolForKey:", v48);

    NSStringFromSelector(sel_audioSessionID);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", v49);

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_supportedHandleTypes);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    supportedHandleTypes = v6->_supportedHandleTypes;
    v6->_supportedHandleTypes = (NSSet *)v54;

    v56 = objc_opt_class();
    NSStringFromSelector(sel_ringtoneSoundURL);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58 && v5)
    {
      objc_msgSend(v58, "URL");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v5, "cx_clientSandboxCanAccessFileURL:", v59);

      if (v60)
      {
        objc_storeStrong((id *)&v6->_ringtoneSoundURL, v58);
      }
      else
      {
        CXDefaultLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v58;
          _os_log_impl(&dword_1A402D000, v61, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring ringtone sound URL because CXProviderConfiguration client did not have access to it: %@", buf, 0xCu);
        }

      }
    }

  }
  return v6;
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
  void *v18;
  NSUInteger v19;
  void *v20;
  NSUInteger v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  id v42;

  v4 = a3;
  -[CXProviderConfiguration localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXProviderConfiguration emergencyHandles](self, "emergencyHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_emergencyHandles);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_emergencyLabeledHandles);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[CXProviderConfiguration handoffIdentifiers](self, "handoffIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handoffIdentifiers);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_prioritizedSenderIdentities);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[CXProviderConfiguration ringtoneSoundURL](self, "ringtoneSoundURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ringtoneSoundURL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[CXProviderConfiguration iconTemplateImageData](self, "iconTemplateImageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconTemplateImageData);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  v19 = -[CXProviderConfiguration maximumCallGroups](self, "maximumCallGroups");
  NSStringFromSelector(sel_maximumCallGroups);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v19, v20);

  v21 = -[CXProviderConfiguration maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup");
  NSStringFromSelector(sel_maximumCallsPerCallGroup);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v21, v22);

  v23 = -[CXProviderConfiguration supportsAudioOnly](self, "supportsAudioOnly");
  NSStringFromSelector(sel_supportsAudioOnly);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

  v25 = -[CXProviderConfiguration supportsVideo](self, "supportsVideo");
  NSStringFromSelector(sel_supportsVideo);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v25, v26);

  v27 = -[CXProviderConfiguration supportsEmergency](self, "supportsEmergency");
  NSStringFromSelector(sel_supportsEmergency);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v27, v28);

  v29 = -[CXProviderConfiguration supportsVoicemail](self, "supportsVoicemail");
  NSStringFromSelector(sel_supportsVoicemail);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v29, v30);

  v31 = -[CXProviderConfiguration supportsCurrentPlatform](self, "supportsCurrentPlatform");
  NSStringFromSelector(sel_supportsCurrentPlatform);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v31, v32);

  v33 = -[CXProviderConfiguration supportsRinging](self, "supportsRinging");
  NSStringFromSelector(sel_supportsRinging);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v33, v34);

  v35 = -[CXProviderConfiguration includesCallsInRecents](self, "includesCallsInRecents");
  NSStringFromSelector(sel_includesCallsInRecents);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v35, v36);

  v37 = -[CXProviderConfiguration audioSessionID](self, "audioSessionID");
  NSStringFromSelector(sel_audioSessionID);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v37, v38);

  -[CXProviderConfiguration supportedHandleTypes](self, "supportedHandleTypes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedHandleTypes);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, v40);

  v41 = -[CXProviderConfiguration supportsDynamicSystemUI](self, "supportsDynamicSystemUI");
  NSStringFromSelector(sel_supportsDynamicSystemUI);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v41, v42);

}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)iconTemplateImageData
{
  return self->_iconTemplateImageData;
}

- (void)setIconTemplateImageData:(NSData *)iconTemplateImageData
{
  objc_setProperty_nonatomic_copy(self, a2, iconTemplateImageData, 32);
}

- (NSUInteger)maximumCallGroups
{
  return self->_maximumCallGroups;
}

- (void)setMaximumCallGroups:(NSUInteger)maximumCallGroups
{
  self->_maximumCallGroups = maximumCallGroups;
}

- (NSUInteger)maximumCallsPerCallGroup
{
  return self->_maximumCallsPerCallGroup;
}

- (void)setMaximumCallsPerCallGroup:(NSUInteger)maximumCallsPerCallGroup
{
  self->_maximumCallsPerCallGroup = maximumCallsPerCallGroup;
}

- (BOOL)includesCallsInRecents
{
  return self->_includesCallsInRecents;
}

- (void)setIncludesCallsInRecents:(BOOL)includesCallsInRecents
{
  self->_includesCallsInRecents = includesCallsInRecents;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (void)setSupportsVideo:(BOOL)supportsVideo
{
  self->_supportsVideo = supportsVideo;
}

- (NSSet)supportedHandleTypes
{
  return self->_supportedHandleTypes;
}

- (void)setSupportedHandleTypes:(NSSet *)supportedHandleTypes
{
  objc_setProperty_nonatomic_copy(self, a2, supportedHandleTypes, 56);
}

- (NSArray)emergencyHandles
{
  return self->_emergencyHandles;
}

- (void)setEmergencyHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)emergencyLabeledHandles
{
  return self->_emergencyLabeledHandles;
}

- (void)setEmergencyLabeledHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)handoffIdentifiers
{
  return self->_handoffIdentifiers;
}

- (void)setHandoffIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSOrderedSet)prioritizedSenderIdentities
{
  return self->_prioritizedSenderIdentities;
}

- (void)setPrioritizedSenderIdentities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CXSandboxExtendedURL)ringtoneSoundURL
{
  return self->_ringtoneSoundURL;
}

- (void)setRingtoneSoundURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)supportsAudioOnly
{
  return self->_supportsAudioOnly;
}

- (void)setSupportsAudioOnly:(BOOL)a3
{
  self->_supportsAudioOnly = a3;
}

- (BOOL)supportsEmergency
{
  return self->_supportsEmergency;
}

- (void)setSupportsEmergency:(BOOL)a3
{
  self->_supportsEmergency = a3;
}

- (BOOL)supportsVoicemail
{
  return self->_supportsVoicemail;
}

- (void)setSupportsVoicemail:(BOOL)a3
{
  self->_supportsVoicemail = a3;
}

- (BOOL)supportsCurrentPlatform
{
  return self->_supportsCurrentPlatform;
}

- (void)setSupportsCurrentPlatform:(BOOL)a3
{
  self->_supportsCurrentPlatform = a3;
}

- (BOOL)supportsRinging
{
  return self->_supportsRinging;
}

- (void)setSupportsRinging:(BOOL)a3
{
  self->_supportsRinging = a3;
}

- (BOOL)supportsDynamicSystemUI
{
  return self->_supportsDynamicSystemUI;
}

- (void)setSupportsDynamicSystemUI:(BOOL)a3
{
  self->_supportsDynamicSystemUI = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringtoneSoundURL, 0);
  objc_storeStrong((id *)&self->_prioritizedSenderIdentities, 0);
  objc_storeStrong((id *)&self->_handoffIdentifiers, 0);
  objc_storeStrong((id *)&self->_emergencyLabeledHandles, 0);
  objc_storeStrong((id *)&self->_emergencyHandles, 0);
  objc_storeStrong((id *)&self->_supportedHandleTypes, 0);
  objc_storeStrong((id *)&self->_iconTemplateImageData, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (void)setRingtoneSound:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Error while querying file attributes: %@", (uint8_t *)&v2, 0xCu);
}

@end
