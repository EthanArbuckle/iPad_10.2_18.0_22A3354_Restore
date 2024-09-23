@implementation BMStreamConfiguration

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (BMStoreConfig)storeConfig
{
  return self->_storeConfig;
}

- (Class)eventClass
{
  return self->_eventClass;
}

- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5 syncPolicy:(id)a6 alternativeNames:(id)a7 internalMetadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;
  const __CFString *v30;
  BMStreamConfiguration *v31;
  uint64_t v33;
  objc_class *v34;
  BMStreamConfiguration *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v36 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v19)
  {
    v20 = v19;
    v34 = a4;
    v35 = self;
    v21 = *(_QWORD *)v38;
    while (2)
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v22);
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v23);
        if (v24)
        {
          v25 = (void *)v24;
          v27 = (void *)objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v27, "removeObject:", v23);
          v26 = (void *)objc_msgSend(v27, "copy");

          goto LABEL_11;
        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v20)
        continue;
      break;
    }
    v25 = 0;
    v26 = v18;
LABEL_11:
    a4 = v34;
    self = v35;
  }
  else
  {
    v25 = 0;
    v26 = v18;
  }

  v28 = objc_msgSend(v14, "hasPrefix:", CFSTR("SoundAnalysis."));
  v29 = (objc_msgSend(v14, "hasPrefix:", CFSTR("MLSE.")) & 1) == 0
     && (objc_msgSend(v14, "hasPrefix:", CFSTR("ProactiveHarvesting.")) & 1) == 0
     && !objc_msgSend(v14, "hasPrefix:", CFSTR("SoundAnalysis."));
  if ((objc_msgSend(v14, "hasPrefix:", CFSTR("Photos.")) & 1) != 0)
  {
    v30 = CFSTR("com.apple.mobileslideshow");
  }
  else if (objc_msgSend(v14, "hasPrefix:", CFSTR("Safari.")))
  {
    v30 = CFSTR("com.apple.mobilesafari");
  }
  else
  {
    v30 = 0;
  }
  BYTE1(v33) = v29;
  LOBYTE(v33) = v28;
  v31 = (BMStreamConfiguration *)objc_msgSend((id)objc_opt_class(), "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptionSubstream:enableTombstoneSubstream:spaceAttributionOwner:", v25, v14, a4, v36, v15, v26, v17, v33, v30);

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaceAttribution, 0);
  objc_storeStrong((id *)&self->_internalMetadata, 0);
  objc_storeStrong((id *)&self->_syncPolicy, 0);
  objc_storeStrong((id *)&self->_legacyNames, 0);
  objc_storeStrong((id *)&self->_storeConfig, 0);
  objc_storeStrong((id *)&self->_eventClass, 0);
  objc_storeStrong((id *)&self->_streamUUID, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5
{
  id v8;
  id v9;
  BMStreamConfiguration *v10;
  uint64_t v12;

  v8 = a5;
  v9 = a3;
  LOWORD(v12) = 256;
  v10 = (BMStreamConfiguration *)objc_msgSend((id)objc_opt_class(), "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptionSubstream:enableTombstoneSubstream:spaceAttributionOwner:", 0, v9, a4, v8, 0, MEMORY[0x1E0C9AA60], 0, v12, 0);

  return v10;
}

- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5 syncPolicy:(id)a6 alternativeNames:(id)a7
{
  return -[BMStreamConfiguration initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:](self, "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", a3, a4, a5, a6, a7, 0);
}

+ (id)_libraryStreamConfigurationWithUUID:(id)a3 streamIdentifier:(id)a4 eventClass:(Class)a5 storeConfig:(id)a6 syncPolicy:(id)a7 legacyNames:(id)a8 internalMetadata:(id)a9 enableSubscriptionSubstream:(BOOL)a10 enableTombstoneSubstream:(BOOL)a11 spaceAttributionOwner:(id)a12
{
  id v17;
  id v18;
  BMStreamConfiguration *v19;
  BMStreamConfiguration *v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v17 = a3;
  v27 = a4;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v18 = a12;
  v19 = [BMStreamConfiguration alloc];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_streamUUID, a3);
    objc_storeStrong((id *)&v20->_streamIdentifier, a4);
    objc_storeStrong((id *)&v20->_eventClass, a5);
    objc_storeStrong((id *)&v20->_storeConfig, a6);
    objc_storeStrong((id *)&v20->_syncPolicy, a7);
    objc_storeStrong((id *)&v20->_legacyNames, a8);
    objc_storeStrong((id *)&v20->_internalMetadata, a9);
    v20->_enableSubscriptionSubstream = a10;
    v20->_enableTombstoneSubstream = a11;
    objc_storeStrong((id *)&v20->_spaceAttribution, a12);
  }

  return v20;
}

- (id)description
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = CFSTR("YES");
  if (self->_enableSubscriptionSubstream)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (!self->_enableTombstoneSubstream)
    v4 = CFSTR("NO");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("BMStreamConfiguration {\n\tstreamIdentifier = %@\n\tstreamUUID = %@\n\teventClass = %@\n\tstoreConfig = %@\n\tsyncPolicy = %@\n\tlegacyNames = %@\n\tinternalMetadata = %@\n\tenableSubscriptionSubstream = %@\n\tenableTombstoneSubstream = %@\n\tspaceAttribution = %@\n}"), *(_OWORD *)&self->_streamIdentifier, *(_OWORD *)&self->_eventClass, self->_syncPolicy, self->_legacyNames, self->_internalMetadata, v5, v4, self->_spaceAttribution);
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (NSArray)legacyNames
{
  return self->_legacyNames;
}

- (BMStreamSyncPolicy)syncPolicy
{
  return self->_syncPolicy;
}

- (BMStreamInternalMetadata)internalMetadata
{
  return self->_internalMetadata;
}

- (BOOL)enableSubscriptionSubstream
{
  return self->_enableSubscriptionSubstream;
}

- (BOOL)enableTombstoneSubstream
{
  return self->_enableTombstoneSubstream;
}

- (NSString)spaceAttribution
{
  return self->_spaceAttribution;
}

@end
