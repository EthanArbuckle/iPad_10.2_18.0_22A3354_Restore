@implementation NTKGreenfieldDecodedRecipe

- (NTKGreenfieldDecodedRecipe)initWithWatchFace:(id)a3 complicationSlotToTemplateMapping:(id)a4 complicationSlotToItemIdMapping:(id)a5 complicationSlotToNameMapping:(id)a6 complicationSlotToBundleIdMapping:(id)a7 isUsingModifiedComplicationsSet:(BOOL)a8 noBorderFacePreviewImagePath:(id)a9 senderBoxedDeviceSize:(id)a10
{
  id v16;
  id v17;
  NTKGreenfieldDecodedRecipe *v18;
  NTKGreenfieldDecodedRecipe *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)NTKGreenfieldDecodedRecipe;
  v18 = -[NTKGreenfieldDecodedRecipe init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_watchFace, a3);
    objc_storeStrong((id *)&v19->_complicationSlotToTemplateMapping, a4);
    objc_storeStrong((id *)&v19->_complicationSlotToItemIdMapping, a5);
    objc_storeStrong((id *)&v19->_complicationSlotToNameMapping, a6);
    objc_storeStrong((id *)&v19->_complicationSlotToBundleIdMapping, a7);
    v19->_isUsingModifiedComplicationsSet = a8;
    objc_storeStrong((id *)&v19->_noBorderFacePreviewImagePath, a9);
    objc_storeStrong((id *)&v19->_senderBoxedDeviceSize, a10);
  }

  return v19;
}

- (NSDictionary)complicationSlotToTemplateMapping
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_complicationSlotToTemplateMapping);
  if (self->_complicationSlotToTemplateOverrideMapping)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "complicationSlotToTemplateMapping: %@", (uint8_t *)&v6, 0xCu);
  }

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v11;

  v4 = a3;
  -[NTKGreenfieldDecodedRecipe watchFace](self, "watchFace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instanceDescriptor");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("NTKGreenfieldWatchfaceKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_complicationSlotToTemplateMapping, CFSTR("NTKGreenfieldComplicationSlotToTemplateMappingKey"));
  -[NTKGreenfieldDecodedRecipe complicationSlotToItemIdMapping](self, "complicationSlotToItemIdMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kNTKGreenfieldComplicationSlotToItemIdMappingKey"));

  -[NTKGreenfieldDecodedRecipe complicationSlotToBundleIdMapping](self, "complicationSlotToBundleIdMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kNTKGreenfieldComplicationSlotToBundleIdMappingKey"));

  -[NTKGreenfieldDecodedRecipe complicationSlotToNameMapping](self, "complicationSlotToNameMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kNTKGreenfieldComplicationSlotToNameMappingKey"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_isUsingModifiedComplicationsSet, CFSTR("kNTKGreenfieldIsUsingModifiedComplicationsSet"));
  -[NTKGreenfieldDecodedRecipe noBorderFacePreviewImagePath](self, "noBorderFacePreviewImagePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("NTKGreenfieldNoBordersWatchFaceSnapshotPathKey"));

  -[NTKGreenfieldDecodedRecipe senderBoxedDeviceSize](self, "senderBoxedDeviceSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("NTKGreenfieldDeviceSizePathKey"));

}

- (NTKGreenfieldDecodedRecipe)initWithCoder:(id)a3
{
  id v4;
  NTKGreenfieldDecodedRecipe *v5;
  uint64_t v6;
  NTKFace *watchFace;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *complicationSlotToTemplateMapping;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *complicationSlotToItemIdMapping;
  uint64_t v21;
  NSDictionary *complicationSlotToBundleIdMapping;
  uint64_t v23;
  NSDictionary *complicationSlotToNameMapping;
  void *v25;
  uint64_t v26;
  NSString *noBorderFacePreviewImagePath;
  void *v28;
  uint64_t v29;
  NSNumber *senderBoxedDeviceSize;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NTKGreenfieldDecodedRecipe;
  v5 = -[NTKGreenfieldDecodedRecipe init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NTKGreenfieldWatchfaceKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFace faceWithInstanceDescriptor:](NTKFace, "faceWithInstanceDescriptor:", v32);
    v6 = objc_claimAutoreleasedReturnValue();
    watchFace = v5->_watchFace;
    v5->_watchFace = (NTKFace *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("NTKGreenfieldComplicationSlotToTemplateMappingKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    complicationSlotToTemplateMapping = v5->_complicationSlotToTemplateMapping;
    v5->_complicationSlotToTemplateMapping = (NSDictionary *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kNTKGreenfieldComplicationSlotToItemIdMappingKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    complicationSlotToItemIdMapping = v5->_complicationSlotToItemIdMapping;
    v5->_complicationSlotToItemIdMapping = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kNTKGreenfieldComplicationSlotToBundleIdMappingKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    complicationSlotToBundleIdMapping = v5->_complicationSlotToBundleIdMapping;
    v5->_complicationSlotToBundleIdMapping = (NSDictionary *)v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kNTKGreenfieldComplicationSlotToNameMappingKey"));
    v23 = objc_claimAutoreleasedReturnValue();
    complicationSlotToNameMapping = v5->_complicationSlotToNameMapping;
    v5->_complicationSlotToNameMapping = (NSDictionary *)v23;

    v5->_isUsingModifiedComplicationsSet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kNTKGreenfieldIsUsingModifiedComplicationsSet"));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("NTKGreenfieldNoBordersWatchFaceSnapshotPathKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    noBorderFacePreviewImagePath = v5->_noBorderFacePreviewImagePath;
    v5->_noBorderFacePreviewImagePath = (NSString *)v26;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("NTKGreenfieldDeviceSizePathKey"));
    v29 = objc_claimAutoreleasedReturnValue();
    senderBoxedDeviceSize = v5->_senderBoxedDeviceSize;
    v5->_senderBoxedDeviceSize = (NSNumber *)v29;

  }
  return v5;
}

- (id)_overrideTemplateForComplication:(id)a3 atSlot:(id)a4 face:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  NTKGreenfieldDecodedRecipe *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NTKFace complicationVariantForComplication:withSlot:](self->_watchFace, "complicationVariantForComplication:withSlot:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "family");
  objc_opt_class();
  v36 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v8;
    objc_msgSend(v13, "appBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationCollection lsSDKVersionForApplicationID:](NTKComplicationCollection, "lsSDKVersionForApplicationID:", v14);
    v33 = v8;
    v15 = v12;
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedComplicationCollectionForDevice:", v17);
    v34 = v11;
    v35 = v9;
    v18 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientIdentifier");
    v20 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "complicationDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v15;
    v8 = v33;
    objc_msgSend(v19, "sampleTemplateForClientIdentifier:descriptor:applicationID:family:", v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    self = v20;
    v10 = v18;
    v11 = v34;
    v9 = v35;
  }
  else
  {
    objc_msgSend(v10, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationController controllerForComplication:variant:device:](NTKComplicationController, "controllerForComplication:variant:device:", v8, v11, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "sharingTemplate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    else
    {
      v16 = 0;
      v25 = 0;
    }
  }

  v27 = (void *)v16;
  if (v25)
    goto LABEL_8;
  -[NSDictionary objectForKeyedSubscript:](self->_complicationSlotToNameMapping, "objectForKeyedSubscript:", v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_complicationSlotToBundleIdMapping, "objectForKeyedSubscript:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKGreenfieldFallbackTemplateProvider templateForClientIdentifier:displayName:family:device:sdkVersion:](NTKGreenfieldFallbackTemplateProvider, "templateForClientIdentifier:displayName:family:device:sdkVersion:", v29, v28, v36, v30, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
LABEL_8:
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v38 = v8;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_1B72A3000, v31, OS_LOG_TYPE_DEFAULT, "_overrideTemplateForComplication: '%@' at slot '%@': %@", buf, 0x20u);
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[NTKGreenfieldDecodedRecipe _overrideTemplateForComplication:atSlot:face:].cold.1(v31);
    v25 = 0;
  }

  return v25;
}

- (void)collectOverrideTemplates
{
  void *v3;
  NTKFace *watchFace;
  NSDictionary *v5;
  NSDictionary *complicationSlotToTemplateOverrideMapping;
  NSDictionary *v7;
  _QWORD v8[5];
  NSDictionary *v9;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  watchFace = self->_watchFace;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__NTKGreenfieldDecodedRecipe_collectOverrideTemplates__block_invoke;
  v8[3] = &unk_1E6BCF4C8;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  -[NTKFace enumerateComplicationSlotsWithBlock:](watchFace, "enumerateComplicationSlotsWithBlock:", v8);
  complicationSlotToTemplateOverrideMapping = self->_complicationSlotToTemplateOverrideMapping;
  self->_complicationSlotToTemplateOverrideMapping = v5;
  v7 = v5;

}

void __54__NTKGreenfieldDecodedRecipe_collectOverrideTemplates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "complicationForSlot:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "collectOverrideTemplates: original complication '%@' in slot '%@'", (uint8_t *)&v12, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "complicationForSlot:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "complication");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "complicationType"))
  {
    if (objc_msgSend(v4, "complicationType") != 56)
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "preferredComplicationFamilyForComplication:withSlot:", v4, v3);
      if (!v8
        || !objc_msgSend(v8, "isCompatibleWithFamily:", v9)
        || objc_msgSend(*(id *)(a1 + 32), "_template:isUnsupportedForComplication:", v8, v4))
      {
        _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412546;
          v13 = v3;
          v14 = 2112;
          v15 = v8;
          _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "collectOverrideTemplates: slot '%@' has invalid template: %@", (uint8_t *)&v12, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_overrideTemplateForComplication:atSlot:face:", v4, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v3);

      }
    }
  }

}

- (BOOL)_template:(id)a3 isUnsupportedForComplication:(id)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;

  v5 = a3;
  v6 = objc_msgSend(a4, "complicationType");
  v7 = 0;
  if (v6 > 15)
  {
    if (v6 != 16)
    {
      if (v6 != 18)
        goto LABEL_15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_14;
LABEL_12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_13;
      goto LABEL_14;
    }
LABEL_11:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_14;
    goto LABEL_12;
  }
  if (v6 == 1)
    goto LABEL_11;
  if (v6 == 8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = 0;
        goto LABEL_15;
      }
    }
LABEL_14:
    v7 = 1;
  }
LABEL_15:

  return v7;
}

- (BOOL)wasModifiedForThisDevice
{
  return self->_isUsingModifiedComplicationsSet;
}

- (NTKFace)watchFace
{
  return self->_watchFace;
}

- (NSDictionary)complicationSlotToItemIdMapping
{
  return self->_complicationSlotToItemIdMapping;
}

- (NSDictionary)complicationSlotToNameMapping
{
  return self->_complicationSlotToNameMapping;
}

- (NSDictionary)complicationSlotToBundleIdMapping
{
  return self->_complicationSlotToBundleIdMapping;
}

- (NSString)noBorderFacePreviewImagePath
{
  return self->_noBorderFacePreviewImagePath;
}

- (NSNumber)senderBoxedDeviceSize
{
  return self->_senderBoxedDeviceSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderBoxedDeviceSize, 0);
  objc_storeStrong((id *)&self->_noBorderFacePreviewImagePath, 0);
  objc_storeStrong((id *)&self->_complicationSlotToBundleIdMapping, 0);
  objc_storeStrong((id *)&self->_complicationSlotToNameMapping, 0);
  objc_storeStrong((id *)&self->_complicationSlotToItemIdMapping, 0);
  objc_storeStrong((id *)&self->_watchFace, 0);
  objc_storeStrong((id *)&self->_complicationSlotToTemplateOverrideMapping, 0);
  objc_storeStrong((id *)&self->_complicationSlotToTemplateMapping, 0);
}

- (void)_overrideTemplateForComplication:(os_log_t)log atSlot:face:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "_overrideTemplateForComplication: unable to provide fallback template. This should not be happening.", v1, 2u);
}

@end
