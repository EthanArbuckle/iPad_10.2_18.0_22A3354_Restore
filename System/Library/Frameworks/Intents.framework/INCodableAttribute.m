@implementation INCodableAttribute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__relationshipValueTransformerClass, 0);
  objc_storeStrong((id *)&self->_displayPriorityRank, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_promptDialogs, 0);
  objc_storeStrong((id *)&self->_entityKeypath, 0);
  objc_storeStrong((id *)&self->_unsupportedReasons, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayNameID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_destroyWeak((id *)&self->_internalCodableDescription);
  objc_storeStrong((id *)&self->_arraySizesBySizeClass, 0);
  objc_storeStrong((id *)&self->_promptDialogsByType, 0);
}

- (INCodableAttribute)initWithCoder:(id)a3
{
  id v4;
  INCodableAttribute *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSMutableDictionary *promptDialogsByType;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSDictionary *arraySizesBySizeClass;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)INCodableAttribute;
  v5 = -[INCodableAttribute init](&v48, sel_init);
  if (v5)
  {
    -[INCodableAttribute setModifier:](v5, "setModifier:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modifier")));
    -[INCodableAttribute setFixedSizeArray:](v5, "setFixedSizeArray:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fixedSizeArray")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute setPropertyName:](v5, "setPropertyName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayPriorityRank"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute setDisplayPriorityRank:](v5, "setDisplayPriorityRank:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("displayName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute setDisplayName:](v5, "setDisplayName:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute setDisplayNameID:](v5, "setDisplayNameID:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute setMetadata:](v5, "setMetadata:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relationship"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute setRelationship:](v5, "setRelationship:", v14);

    -[INCodableAttribute setSupportsResolution:](v5, "setSupportsResolution:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsResolution")));
    -[INCodableAttribute setConfigurable:](v5, "setConfigurable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("configurable")));
    -[INCodableAttribute setSupportsDynamicEnumeration:](v5, "setSupportsDynamicEnumeration:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDynamicEnumeration")));
    -[INCodableAttribute setSupportsSearch:](v5, "setSupportsSearch:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSearch")));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("promptDialogs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute _setPromptDialogs:](v5, "_setPromptDialogs:", v18);

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("unsupportedReasons"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute _setUnsupportedReasons:](v5, "_setUnsupportedReasons:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_codableDescription"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute _setCodableDescription:](v5, "_setCodableDescription:", v23);

    v43 = v4;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_typeString"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute _setTypeString:](v5, "_setTypeString:", v24);

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[INCodableAttribute promptDialogs](v5, "promptDialogs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v45;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v29);
          promptDialogsByType = v5->_promptDialogsByType;
          if (!promptDialogsByType)
          {
            v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v33 = v5->_promptDialogsByType;
            v5->_promptDialogsByType = v32;

            promptDialogsByType = v5->_promptDialogsByType;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v30, "type"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](promptDialogsByType, "setObject:forKeyedSubscript:", v30, v34);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v27);
    }

    v4 = v43;
    objc_msgSend(v43, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityKeypath"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute setEntityKeypath:](v5, "setEntityKeypath:", v35);

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "decodeObjectOfClasses:forKey:", v39, CFSTR("_arraySizesBySizeClass"));
    v40 = objc_claimAutoreleasedReturnValue();
    arraySizesBySizeClass = v5->_arraySizesBySizeClass;
    v5->_arraySizesBySizeClass = (NSDictionary *)v40;

    -[INCodableAttribute setWindowSize:](v5, "setWindowSize:", objc_msgSend(v43, "decodeIntegerForKey:", CFSTR("windowSize")));
  }

  return v5;
}

- (void)setWindowSize:(int64_t)a3
{
  self->_windowSize = a3;
}

- (void)setSupportsSearch:(BOOL)a3
{
  self->_supportsSearch = a3;
}

- (void)setSupportsResolution:(BOOL)a3
{
  self->_supportsResolution = a3;
}

- (void)setSupportsDynamicEnumeration:(BOOL)a3
{
  self->_supportsDynamicEnumeration = a3;
}

- (void)setRelationship:(id)a3
{
  objc_storeStrong((id *)&self->_relationship, a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setFixedSizeArray:(BOOL)a3
{
  self->_fixedSizeArray = a3;
}

- (void)setEntityKeypath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setDisplayNameID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setConfigurable:(BOOL)a3
{
  self->_configurable = a3;
}

- (NSArray)promptDialogs
{
  return self->_promptDialogs;
}

- (void)_setUnsupportedReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)_setTypeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)_setPromptDialogs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (INCodableAttributeRelationship)relationship
{
  return self->_relationship;
}

- (void)_setCodableDescription:(id)a3
{
  objc_storeWeak((id *)&self->_internalCodableDescription, a3);
}

- (id)__INCodableDescriptionTagKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTagKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *propertyName;
  void *v10;
  NSString *v11;
  NSString *displayName;
  void *v13;
  NSString *v14;
  NSString *displayNameID;
  void *v16;
  NSNumber *v17;
  NSNumber *displayPriorityRank;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  int64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSArray *v64;
  NSArray *unsupportedReasons;
  void *v66;
  void *v67;
  void *v68;
  NSString *v69;
  NSString *typeString;
  void *v71;
  void *v72;
  __CFString *v73;
  __CFString *v74;
  objc_class *v75;
  INCodableAttributeMetadata *v76;
  INCodableAttributeMetadata *metadata;
  INCodableAttributeRelationship *v78;
  void *v79;
  void *v80;
  INCodableAttributeRelationship *relationship;
  void *v82;
  NSString *v83;
  NSString *entityKeypath;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id obj;
  _QWORD v90[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[5];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCodableAttribute __INCodableDescriptionNameKey](self, "__INCodableDescriptionNameKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_stringByLowercasingFirstCharacter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)objc_msgSend(v7, "copy");
  propertyName = self->_propertyName;
  self->_propertyName = v8;

  -[INCodableAttribute __INCodableDescriptionDisplayNameKey](self, "__INCodableDescriptionDisplayNameKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  self->_displayName = v11;

  -[INCodableAttribute __INCodableDescriptionDisplayNameIDKey](self, "__INCodableDescriptionDisplayNameIDKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayNameID = self->_displayNameID;
  self->_displayNameID = v14;

  -[INCodableAttribute __INCodableDescriptionDisplayPriorityKey](self, "__INCodableDescriptionDisplayPriorityKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v16);
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  displayPriorityRank = self->_displayPriorityRank;
  self->_displayPriorityRank = v17;

  -[INCodableAttribute __INCodableDescriptionDefaultKey](self, "__INCodableDescriptionDefaultKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_defaultAttribute = objc_msgSend(v20, "BOOLValue");

  -[INCodableAttribute __INCodableDescriptionSupportsResolutionKey](self, "__INCodableDescriptionSupportsResolutionKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_supportsResolution = objc_msgSend(v22, "BOOLValue");

  -[INCodableAttribute __INCodableDescriptionSupportsDynamicEnumerationKey](self, "__INCodableDescriptionSupportsDynamicEnumerationKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  self->_supportsDynamicEnumeration = objc_msgSend(v24, "BOOLValue");

  -[INCodableAttribute __INCodableDescriptionSupportsSearchKey](self, "__INCodableDescriptionSupportsSearchKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->_supportsSearch = objc_msgSend(v26, "BOOLValue");

  -[INCodableAttribute __INCodableDescriptionConfigurableKey](self, "__INCodableDescriptionConfigurableKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  self->_configurable = objc_msgSend(v28, "BOOLValue");

  -[INCodableAttribute __INCodableDescriptionWindowSizeKey](self, "__INCodableDescriptionWindowSizeKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
  }
  else
  {
    v31 = 0;
  }
  v32 = v31;

  if (objc_msgSend(v32, "integerValue") < 1)
    v33 = 6;
  else
    v33 = objc_msgSend(v32, "integerValue");

  self->_windowSize = v33;
  -[INCodableAttribute __INCodableDescriptionSupportsMultipleValuesKey](self, "__INCodableDescriptionSupportsMultipleValuesKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLValue");

  self->_modifier = v36 ^ 1u;
  -[INCodableAttribute __INCodableDescriptionFixedSizeArrayKey](self, "__INCodableDescriptionFixedSizeArrayKey");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  self->_fixedSizeArray = objc_msgSend(v38, "BOOLValue");

  -[INCodableAttribute __INCodableDescriptionPromptDialogsKey](self, "__INCodableDescriptionPromptDialogsKey");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = v40;
    else
      v41 = 0;
  }
  else
  {
    v41 = 0;
  }
  v42 = v41;

  v43 = MEMORY[0x1E0C809B0];
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __43__INCodableAttribute_updateWithDictionary___block_invoke;
  v95[3] = &unk_1E228D1A8;
  v95[4] = self;
  v88 = v42;
  objc_msgSend(v42, "if_map:", v95);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_promptDialogs, v44);
  -[INCodableAttribute __INCodableDescriptionArraySizesKey](self, "__INCodableDescriptionArraySizesKey");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v47 = v46;
    else
      v47 = 0;
  }
  else
  {
    v47 = 0;
  }
  v48 = v47;

  v87 = v48;
  if (objc_msgSend(v48, "count"))
  {
    v85 = v44;
    v86 = v4;
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v48, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v49 = v48;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v92;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v92 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v53);
          -[INCodableAttribute __INCodableDescriptionArraySizeSizeClassKey](self, "__INCodableDescriptionArraySizeSizeClassKey", v85, v86);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (INCodableAttributeAvailableArraySizeClasses_onceToken != -1)
            dispatch_once(&INCodableAttributeAvailableArraySizeClasses_onceToken, &__block_literal_global_43628);
          if (objc_msgSend((id)INCodableAttributeAvailableArraySizeClasses_codableAvailableArraySizeClasses, "containsObject:", v56))
          {
            -[INCodableAttribute __INCodableDescriptionArraySizeSizeKey](self, "__INCodableDescriptionArraySizeSizeKey");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "if_setObjectIfNonNil:forKey:", v58, v56);

          }
          ++v53;
        }
        while (v51 != v53);
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
      }
      while (v51);
    }

    v44 = v85;
    v4 = v86;
    v59 = obj;
    v43 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v59 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_storeStrong((id *)&self->_arraySizesBySizeClass, v59);
  -[INCodableAttribute __INCodableDescriptionUnsupportedReasonsKey](self, "__INCodableDescriptionUnsupportedReasonsKey");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v62 = v61;
    else
      v62 = 0;
  }
  else
  {
    v62 = 0;
  }
  v63 = v62;

  v90[0] = v43;
  v90[1] = 3221225472;
  v90[2] = __43__INCodableAttribute_updateWithDictionary___block_invoke_2;
  v90[3] = &unk_1E228D1A8;
  v90[4] = self;
  objc_msgSend(v63, "if_map:", v90);
  v64 = (NSArray *)objc_claimAutoreleasedReturnValue();

  unsupportedReasons = self->_unsupportedReasons;
  self->_unsupportedReasons = v64;

  -[INCodableAttribute __INCodableDescriptionMetadataKey](self, "__INCodableDescriptionMetadataKey");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[INCodableAttribute __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v68);
  v69 = (NSString *)objc_claimAutoreleasedReturnValue();
  typeString = self->_typeString;
  self->_typeString = v69;

  -[INCodableAttribute __INCodableDescriptionEnumTypeKey](self, "__INCodableDescriptionEnumTypeKey");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = CFSTR("Enum");
    v74 = CFSTR("Enum");
  }
  else
  {
    INCodableAttributeMetadataTypeNameWithTypeName(self->_typeString);
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v75 = (objc_class *)INCodableAttributeMetadataClassWithMetadataTypeName(v73);
  if (v75)
    v76 = (INCodableAttributeMetadata *)objc_msgSend([v75 alloc], "initWithName:codableAttribute:", v73, self);
  else
    v76 = 0;
  -[INCodableAttributeMetadata updateWithDictionary:](v76, "updateWithDictionary:", v67, v85, v86);
  metadata = self->_metadata;
  self->_metadata = v76;

  v78 = -[INCodableAttributeRelationship initWithCodableAttribute:]([INCodableAttributeRelationship alloc], "initWithCodableAttribute:", self);
  -[INCodableAttribute __INCodableDescriptionRelationshipKey](self, "__INCodableDescriptionRelationshipKey");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeRelationship updateWithDictionary:](v78, "updateWithDictionary:", v80);

  relationship = self->_relationship;
  self->_relationship = v78;

  -[INCodableAttribute __INCodableDescriptionEntityKeypathKey](self, "__INCodableDescriptionEntityKeypathKey");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v82);
  v83 = (NSString *)objc_claimAutoreleasedReturnValue();
  entityKeypath = self->_entityKeypath;
  self->_entityKeypath = v83;

}

- (id)__INCodableDescriptionWindowSizeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeWindowSizeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionUnsupportedReasonsKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionSupportsSearchKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsSearchKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionSupportsResolutionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsResolutionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionSupportsMultipleValuesKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsMultipleValuesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionSupportsDynamicEnumerationKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsDynamicEnumerationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPromptDialogsKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionMetadataKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFixedSizeArrayKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeFixedSizeArrayKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDisplayPriorityKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayPriorityKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (INCodableDescription)_codableDescription
{
  return (INCodableDescription *)objc_loadWeakRetained((id *)&self->_internalCodableDescription);
}

- (id)__INCodableDescriptionDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDefaultKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionConfigurableKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeConfigurableKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionArraySizesKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionRelationshipKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionEntityKeypathKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEntityKeypathKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionEnumTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEnumTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

INCodableAttributeUnsupportedReason *__43__INCodableAttribute_updateWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  INCodableAttributeUnsupportedReason *v4;

  v3 = a2;
  v4 = objc_alloc_init(INCodableAttributeUnsupportedReason);
  -[INCodableAttributeDialog _setCodableAttribute:](v4, "_setCodableAttribute:", *(_QWORD *)(a1 + 32));
  -[INCodableAttributeUnsupportedReason updateWithDictionary:](v4, "updateWithDictionary:", v3);

  return v4;
}

INCodableAttributePromptDialog *__43__INCodableAttribute_updateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  INCodableAttributePromptDialog *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_alloc_init(INCodableAttributePromptDialog);
  -[INCodableAttributeDialog _setCodableAttribute:](v4, "_setCodableAttribute:", *(_QWORD *)(a1 + 32));
  -[INCodableAttributePromptDialog updateWithDictionary:](v4, "updateWithDictionary:", v3);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[INCodableAttributePromptDialog type](v4, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v9);

  return v4;
}

- (void)setPropertyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setModifier:(int64_t)a3
{
  self->_modifier = a3;
}

- (void)setDisplayPriorityRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int64_t v17;
  char v18;

  v5 = a3;
  if (!objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    v9 = 0;
    goto LABEL_21;
  }
  -[INCodableAttribute propertyName](self, "propertyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[INCodableAttribute propertyName](self, "propertyName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v11 = v8;

    objc_msgSend(v11, "propertyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v3, "isEqual:", v12);
  }
  else
  {
    v10 = 0;
  }

  -[INCodableAttribute displayPriorityRank](self, "displayPriorityRank");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v5, "displayPriorityRank");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v16 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  -[INCodableAttribute displayPriorityRank](self, "displayPriorityRank");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayPriorityRank");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (!v13)
    goto LABEL_16;
LABEL_17:

  v17 = -[INCodableAttribute modifier](self, "modifier");
  if (v17 == objc_msgSend(v5, "modifier"))
    v18 = v10;
  else
    v18 = 0;
  v9 = v18 & v16;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  -[INCodableAttribute propertyName](self, "propertyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INCodableAttribute displayPriorityRank](self, "displayPriorityRank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableAttribute modifier](self, "modifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttribute;
  v9 = v6 ^ -[INCodableAttribute hash](&v11, sel_hash) ^ v8;

  return v9;
}

- (int64_t)modifier
{
  return self->_modifier;
}

- (NSNumber)displayPriorityRank
{
  return self->_displayPriorityRank;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t modifier;
  id WeakRetained;
  id v6;

  modifier = self->_modifier;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", modifier, CFSTR("modifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_propertyName, CFSTR("propertyName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayNameID, CFSTR("displayNameID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayPriorityRank, CFSTR("displayPriorityRank"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsResolution, CFSTR("supportsResolution"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsDynamicEnumeration, CFSTR("supportsDynamicEnumeration"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsSearch, CFSTR("supportsSearch"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_configurable, CFSTR("configurable"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_relationship, CFSTR("relationship"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_promptDialogs, CFSTR("promptDialogs"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_unsupportedReasons, CFSTR("unsupportedReasons"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_typeString, CFSTR("_typeString"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalCodableDescription);
  objc_msgSend(v6, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("_codableDescription"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_entityKeypath, CFSTR("entityKeypath"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_fixedSizeArray, CFSTR("fixedSizeArray"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_arraySizesBySizeClass, CFSTR("_arraySizesBySizeClass"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_windowSize, CFSTR("windowSize"));

}

- (BOOL)supportsResolution
{
  return self->_supportsResolution;
}

- (BOOL)supportsDynamicEnumeration
{
  return self->_supportsDynamicEnumeration;
}

- (int64_t)_attributeType
{
  return 1;
}

- (SEL)getter
{
  NSString *v2;
  const char *v3;

  -[INCodableAttribute propertyName](self, "propertyName");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = NSSelectorFromString(v2);

  return v3;
}

- (SEL)setter
{
  void *v2;
  objc_class *v3;
  const char *v4;

  -[INCodableAttribute propertyName](self, "propertyName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  v4 = INSetterFromString(v2, v3);

  return v4;
}

- (int64_t)valueType
{
  return 0;
}

- (Class)objectClass
{
  return 0;
}

- (Class)resolutionResultClass
{
  return 0;
}

- (id)unsupportedReasonWithIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = a3 - 1;
  -[INCodableAttribute unsupportedReasons](self, "unsupportedReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
  {
    v8 = 0;
  }
  else
  {
    -[INCodableAttribute unsupportedReasons](self, "unsupportedReasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (unint64_t)indexForUnsupportedReason:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[INCodableAttribute unsupportedReasons](self, "unsupportedReasons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    v8 = 1;
    while (2)
    {
      v9 = 0;
      v10 = v8 + v6;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "code");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "code");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v6 = v8 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v10;
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)arraySizeForSizeClass:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  char v8;
  const __CFString *v9;
  char v10;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_arraySizesBySizeClass, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INCodableAttribute isFixedSizeArray](self, "isFixedSizeArray"))
  {
    if (v5)
    {
      if (objc_msgSend(v5, "integerValue") >= 1)
      {
        v6 = objc_msgSend(v5, "integerValue");
LABEL_12:
        v7 = v6;
        goto LABEL_19;
      }
LABEL_18:
      v7 = 1;
      goto LABEL_19;
    }
    v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("ExtraLarge"));
    v9 = CFSTR("Large");
    if ((v8 & 1) == 0)
    {
      v10 = objc_msgSend(v4, "isEqualToString:", CFSTR("Large"));
      v9 = CFSTR("Medium");
      if ((v10 & 1) == 0)
      {
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Medium")) & 1) != 0
          || (objc_msgSend(v4, "isEqualToString:", CFSTR("AccessoryCorner")) & 1) != 0)
        {
          v9 = CFSTR("Small");
        }
        else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AccessoryCircular")) & 1) != 0)
        {
          v9 = CFSTR("AccessoryCorner");
        }
        else
        {
          if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AccessoryRectangular")) & 1) == 0
            && !objc_msgSend(v4, "isEqualToString:", CFSTR("AccessoryInline")))
          {
            goto LABEL_18;
          }
          v9 = CFSTR("AccessoryCircular");
        }
      }
    }
    v6 = -[INCodableAttribute arraySizeForSizeClass:](self, "arraySizeForSizeClass:", v9);
    goto LABEL_12;
  }
  v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

  return v7;
}

- (BOOL)isConfigurable
{
  return self->_configurable || -[INCodableAttribute supportsResolution](self, "supportsResolution");
}

- (NSString)description
{
  return (NSString *)-[INCodableAttribute descriptionAtIndent:](self, "descriptionAtIndent:", 1);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttribute;
  -[INCodableAttribute description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttribute dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)localizedDisplayName
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableAttribute localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttribute displayNameID](self, "displayNameID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttribute displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_customLocalizationTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    INLocalizedStringFromCodable(v6, v7, v8, v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "_localizationTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    INLocalizedStringFromCodable(v6, v7, v10, v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)promptDialogWithType:(unint64_t)a3
{
  NSMutableDictionary *promptDialogsByType;
  void *v6;
  INCodableAttributePromptDialog *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;

  promptDialogsByType = self->_promptDialogsByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](promptDialogsByType, "objectForKeyedSubscript:", v6);
  v7 = (INCodableAttributePromptDialog *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = a3 - 2;
    if (a3 == 2
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_promptDialogsByType, "objectForKeyedSubscript:", &unk_1E23E9AC0), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "formatString"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "length"), v10, v9, v11))
    {
      v7 = 0;
    }
    else
    {
      v7 = objc_alloc_init(INCodableAttributePromptDialog);
      -[INCodableAttributeDialog _setCodableAttribute:](v7, "_setCodableAttribute:", self);
      -[INCodableAttributePromptDialog setType:](v7, "setType:", a3);
      -[INCodableAttributeDialog setDefaultDialog:](v7, "setDefaultDialog:", 1);
      if (a3 - 1 > 5)
        v12 = CFSTR("Primary");
      else
        v12 = off_1E2292760[a3 - 1];
      -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("PromptDialog"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableAttributeDialog setFormatStringID:](v7, "setFormatStringID:", v13);

      if (v8 > 3)
        v14 = 0;
      else
        v14 = off_1E2292740[v8];
      v15 = v14;
      -[INCodableAttributeDialog setFormatString:](v7, "setFormatString:", v15);

    }
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableAttribute dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  id v5;
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
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char isKindOfClass;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[15];
  _QWORD v93[15];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[INCodableAttribute promptDialogWithType:](self, "promptDialogWithType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentationWithLocalizer:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_addObjectIfNonNil:", v7);

  -[INCodableAttribute promptDialogWithType:](self, "promptDialogWithType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentationWithLocalizer:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_addObjectIfNonNil:", v9);

  -[INCodableAttribute promptDialogWithType:](self, "promptDialogWithType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentationWithLocalizer:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_addObjectIfNonNil:", v11);

  -[INCodableAttribute promptDialogWithType:](self, "promptDialogWithType:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentationWithLocalizer:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_addObjectIfNonNil:", v13);

  -[INCodableAttribute promptDialogWithType:](self, "promptDialogWithType:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentationWithLocalizer:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_addObjectIfNonNil:", v15);

  -[INCodableAttribute promptDialogWithType:](self, "promptDialogWithType:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentationWithLocalizer:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_addObjectIfNonNil:", v17);

  v18 = (void *)MEMORY[0x1E0C99DE8];
  -[INCodableAttribute unsupportedReasons](self, "unsupportedReasons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[INCodableAttribute unsupportedReasons](self, "unsupportedReasons");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v89 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "dictionaryRepresentationWithLocalizer:", v4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v23);
  }

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v27 = objc_claimAutoreleasedReturnValue();
  -[INCodableAttribute __INCodableDescriptionNameKey](self, "__INCodableDescriptionNameKey");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v85;
  -[INCodableAttribute propertyName](self, "propertyName");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v28;
  v93[0] = v28;
  -[INCodableAttribute __INCodableDescriptionDisplayNameKey](self, "__INCodableDescriptionDisplayNameKey");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v83;
  -[INCodableAttribute localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v4);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v30;
  v93[1] = v30;
  -[INCodableAttribute __INCodableDescriptionDisplayNameIDKey](self, "__INCodableDescriptionDisplayNameIDKey");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v81;
  -[INCodableAttribute displayNameID](self, "displayNameID");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v84 = v29;
  v58 = (void *)v32;
  v93[2] = v32;
  -[INCodableAttribute __INCodableDescriptionDisplayPriorityKey](self, "__INCodableDescriptionDisplayPriorityKey");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v92[3] = v79;
  -[INCodableAttribute displayPriorityRank](self, "displayPriorityRank");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v34;
  v93[3] = v34;
  -[INCodableAttribute __INCodableDescriptionDefaultKey](self, "__INCodableDescriptionDefaultKey");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v92[4] = v77;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableAttribute isDefaultAttribute](self, "isDefaultAttribute"));
  v36 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v36;
  v93[4] = v36;
  -[INCodableAttribute __INCodableDescriptionSupportsMultipleValuesKey](self, "__INCodableDescriptionSupportsMultipleValuesKey");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v92[5] = v75;
  v74 = -[INCodableAttribute modifier](self, "modifier");
  v82 = v31;
  if (v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = MEMORY[0x1E0C9AAB0];
  }
  v61 = (void *)v37;
  v93[5] = v37;
  -[INCodableAttribute __INCodableDescriptionSupportsResolutionKey](self, "__INCodableDescriptionSupportsResolutionKey");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v92[6] = v73;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableAttribute supportsResolution](self, "supportsResolution"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = v72;
  -[INCodableAttribute __INCodableDescriptionConfigurableKey](self, "__INCodableDescriptionConfigurableKey");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v92[7] = v71;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableAttribute isConfigurable](self, "isConfigurable"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v93[7] = v70;
  -[INCodableAttribute __INCodableDescriptionSupportsDynamicEnumerationKey](self, "__INCodableDescriptionSupportsDynamicEnumerationKey");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v92[8] = v69;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableAttribute supportsDynamicEnumeration](self, "supportsDynamicEnumeration"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v93[8] = v68;
  -[INCodableAttribute __INCodableDescriptionPromptDialogsKey](self, "__INCodableDescriptionPromptDialogsKey");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v92[9] = v67;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v39 = (void *)MEMORY[0x1E0C9AA60];
  if ((isKindOfClass & 1) != 0)
    v40 = v5;
  else
    v40 = (id)MEMORY[0x1E0C9AA60];
  v93[9] = v40;
  -[INCodableAttribute __INCodableDescriptionUnsupportedReasonsKey](self, "__INCodableDescriptionUnsupportedReasonsKey");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v92[10] = v66;
  objc_opt_class();
  v86 = (void *)v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v41 = v20;
  else
    v41 = v39;
  v93[10] = v41;
  -[INCodableAttribute __INCodableDescriptionMetadataKey](self, "__INCodableDescriptionMetadataKey");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v92[11] = v65;
  -[INCodableAttribute metadata](self, "metadata");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "dictionaryRepresentationWithLocalizer:", v4);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v78 = v35;
  v80 = v33;
  v87 = v5;
  v55 = (void *)v42;
  v93[11] = v42;
  -[INCodableAttribute __INCodableDescriptionRelationshipKey](self, "__INCodableDescriptionRelationshipKey");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v92[12] = v63;
  -[INCodableAttribute relationship](self, "relationship");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "dictionaryRepresentationWithLocalizer:", v4);
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (!v44)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v93[12] = v44;
  -[INCodableAttribute __INCodableDescriptionEntityKeypathKey](self, "__INCodableDescriptionEntityKeypathKey", v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v92[13] = v46;
  -[INCodableAttribute entityKeypath](self, "entityKeypath");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (!v47)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v93[13] = v48;
  -[INCodableAttribute __INCodableDescriptionWindowSizeKey](self, "__INCodableDescriptionWindowSizeKey");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v92[14] = v49;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableAttribute windowSize](self, "windowSize"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v93[14] = v50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 15);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  if (!v45)

  if (!v43)
  if (v74)

  if (!v76)
  if (!v78)

  if (!v80)
  if (!v82)

  if (!v84)
  objc_msgSend(v51, "if_dictionaryWithNonEmptyValues");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
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

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setModifier:", -[INCodableAttribute modifier](self, "modifier"));
  -[INCodableAttribute propertyName](self, "propertyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertyName:", v5);

  -[INCodableAttribute displayPriorityRank](self, "displayPriorityRank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayPriorityRank:", v6);

  -[INCodableAttribute displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v7);

  -[INCodableAttribute displayNameID](self, "displayNameID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayNameID:", v8);

  -[INCodableAttribute metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v9);

  -[INCodableAttribute relationship](self, "relationship");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelationship:", v10);

  objc_msgSend(v4, "setSupportsResolution:", -[INCodableAttribute supportsResolution](self, "supportsResolution"));
  objc_msgSend(v4, "setSupportsDynamicEnumeration:", -[INCodableAttribute supportsDynamicEnumeration](self, "supportsDynamicEnumeration"));
  objc_msgSend(v4, "setSupportsSearch:", -[INCodableAttribute supportsSearch](self, "supportsSearch"));
  objc_msgSend(v4, "setConfigurable:", -[INCodableAttribute isConfigurable](self, "isConfigurable"));
  -[INCodableAttribute promptDialogs](self, "promptDialogs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPromptDialogs:", v11);

  -[INCodableAttribute unsupportedReasons](self, "unsupportedReasons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setUnsupportedReasons:", v12);

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setCodableDescription:", v13);

  -[INCodableAttribute _typeString](self, "_typeString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTypeString:", v14);

  objc_storeStrong(v4 + 1, self->_promptDialogsByType);
  objc_msgSend(v4, "setFixedSizeArray:", -[INCodableAttribute isFixedSizeArray](self, "isFixedSizeArray"));
  objc_storeStrong(v4 + 2, self->_arraySizesBySizeClass);
  objc_msgSend(v4, "setWindowSize:", -[INCodableAttribute windowSize](self, "windowSize"));
  return v4;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INCodableAttributeRelationship *relationship;
  id v12;
  INCodableAttributeMetadata *metadata;
  NSArray *promptDialogs;
  NSArray *unsupportedReasons;
  id v16;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_modifier, CFSTR("modifier"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_propertyName, CFSTR("propertyName"));
  objc_msgSend(v6, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INCodableAttribute isConfigurable](self, "isConfigurable")
    && v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttribute localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_displayName, "intents_encodeForPlistRepresentationWithParameters:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, CFSTR("displayName"));

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, CFSTR("languageCode"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_displayNameID, CFSTR("displayNameID"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_displayPriorityRank, CFSTR("displayPriorityRank"));
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_supportsResolution, CFSTR("supportsResolution"));
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_supportsDynamicEnumeration, CFSTR("supportsDynamicEnumeration"));
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_supportsSearch, CFSTR("supportsSearch"));
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_configurable, CFSTR("configurable"));
  relationship = self->_relationship;
  v21 = 0;
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:error:", relationship, CFSTR("relationship"), &v21);
  v12 = v21;
  if (v12)
    goto LABEL_10;
  metadata = self->_metadata;
  v20 = 0;
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", metadata, CFSTR("metadata"), v6, &v20);
  v12 = v20;
  if (v12)
    goto LABEL_10;
  promptDialogs = self->_promptDialogs;
  v19 = 0;
  objc_msgSend(v7, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", promptDialogs, CFSTR("promptDialogs"), &v19);
  v12 = v19;
  if (v12
    || (unsupportedReasons = self->_unsupportedReasons,
        v18 = 0,
        objc_msgSend(v7, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", unsupportedReasons, CFSTR("unsupportedReasons"), &v18), (v12 = v18) != 0))
  {
LABEL_10:
    if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      v16 = 0;
      *a4 = v12;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_typeString, CFSTR("_typeString"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_entityKeypath, CFSTR("entityKeypath"));
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_fixedSizeArray, CFSTR("fixedSizeArray"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_arraySizesBySizeClass, CFSTR("_arraySizesBySizeClass"));
    objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_windowSize, CFSTR("windowSize"));
    v16 = v7;
    v12 = 0;
  }

  return v16;
}

- (NSString)_typeString
{
  return self->_typeString;
}

- (BOOL)isFixedSizeArray
{
  return self->_fixedSizeArray;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayNameID
{
  return self->_displayNameID;
}

- (BOOL)isDefaultAttribute
{
  return self->_defaultAttribute;
}

- (void)setDefaultAttribute:(BOOL)a3
{
  self->_defaultAttribute = a3;
}

- (BOOL)supportsSearch
{
  return self->_supportsSearch;
}

- (INCodableAttributeMetadata)metadata
{
  return self->_metadata;
}

- (NSArray)unsupportedReasons
{
  return self->_unsupportedReasons;
}

- (NSString)entityKeypath
{
  return self->_entityKeypath;
}

- (int64_t)windowSize
{
  return self->_windowSize;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (Class)_relationshipValueTransformerClass
{
  return self->__relationshipValueTransformerClass;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setModifier:", objc_msgSend(v6, "intents_intForKey:", CFSTR("modifier")));
  objc_msgSend(v7, "setFixedSizeArray:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("fixedSizeArray")));
  objc_msgSend(v6, "intents_stringForKey:", CFSTR("propertyName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertyName:", v8);

  objc_msgSend(v6, "intents_numberForKey:", CFSTR("displayPriorityRank"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayPriorityRank:", v9);

  objc_msgSend(v6, "intents_stringForKey:", CFSTR("displayName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayName:", v10);

  objc_msgSend(v6, "intents_stringForKey:", CFSTR("displayNameID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayNameID:", v11);

  objc_msgSend(v6, "intents_stringForKey:", CFSTR("_typeString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setTypeString:", v12);

  objc_msgSend(v6, "intents_stringForKey:", CFSTR("languageCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLanguageCode:", v13);

  objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("metadata"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enumType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = CFSTR("Enum");
    v17 = CFSTR("Enum");
  }
  else
  {
    objc_msgSend(v7, "_typeString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    INCodableAttributeMetadataTypeNameWithTypeName(v18);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v65 = 0;
  objc_msgSend(INCodableAttributeMetadataClassWithMetadataTypeName(v16), "makeFromWidgetPlistableRepresentation:error:", v14, &v65);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v65;
  if (!v20)
  {
    objc_msgSend(v19, "setCodableAttribute:", v7);
    objc_msgSend(v7, "setMetadata:", v19);
    v64 = 0;
    +[NSObject intents_widgetPlistRepresentableInDict:key:error:](INCodableAttributeRelationship, "intents_widgetPlistRepresentableInDict:key:error:", v6, CFSTR("relationship"), &v64);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v64;
    if (v24)
    {
      v21 = v24;
      if (a4)
      {
        v21 = objc_retainAutorelease(v24);
        v22 = 0;
        *a4 = v21;
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_33;
    }
    objc_msgSend(v23, "setCodableAttribute:", v7);
    objc_msgSend(v7, "setRelationship:", v23);
    objc_msgSend(v7, "setSupportsResolution:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("supportsResolution")));
    objc_msgSend(v7, "setConfigurable:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("configurable")));
    objc_msgSend(v7, "setSupportsDynamicEnumeration:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("supportsDynamicEnumeration")));
    objc_msgSend(v7, "setSupportsSearch:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("supportsSearch")));
    v63 = 0;
    +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:](INCodableAttributePromptDialog, "intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:", v6, CFSTR("promptDialogs"), &v63, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v63;
    if (v26)
    {
      v21 = v26;
      if (a4)
      {
        v21 = objc_retainAutorelease(v26);
        v22 = 0;
        *a4 = v21;
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_32;
    }
    v53 = v23;
    objc_msgSend(v7, "_setPromptDialogs:", v25);
    v27 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke;
    v61[3] = &unk_1E228D1D0;
    v28 = v7;
    v29 = v25;
    v30 = v28;
    v62 = v28;
    v51 = v29;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v61);
    v60 = 0;
    +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:](INCodableAttributeUnsupportedReason, "intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:", v6, CFSTR("unsupportedReasons"), &v60, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v60;
    v50 = v31;
    if (v52)
    {
      if (a4)
      {
        v21 = v52;
        v22 = 0;
        *a4 = objc_retainAutorelease(v52);
        v23 = v53;
LABEL_31:
        v25 = v51;

LABEL_32:
LABEL_33:

        goto LABEL_34;
      }
      v22 = 0;
    }
    else
    {
      v47 = v19;
      v48 = v14;
      v49 = v6;
      objc_msgSend(v30, "_setUnsupportedReasons:", v31);
      v58[0] = v27;
      v58[1] = 3221225472;
      v58[2] = __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke_2;
      v58[3] = &unk_1E228D1F8;
      v32 = v30;
      v59 = v32;
      objc_msgSend(v31, "enumerateObjectsUsingBlock:", v58);
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v32, "promptDialogs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v55 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            v39 = (void *)v32[1];
            if (!v39)
            {
              v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v41 = (void *)v32[1];
              v32[1] = v40;

              v39 = (void *)v32[1];
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v38, "type"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, v42);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        }
        while (v35);
      }

      v6 = v49;
      objc_msgSend(v49, "intents_stringForKey:", CFSTR("entityKeypath"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setEntityKeypath:", v43);

      objc_msgSend(v49, "intents_safeObjectForKey:ofType:", CFSTR("_arraySizesBySizeClass"), objc_opt_class());
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v32[2];
      v32[2] = v44;

      objc_msgSend(v32, "setWindowSize:", objc_msgSend(v49, "intents_intForKey:", CFSTR("windowSize")));
      v22 = v32;

      v14 = v48;
      v19 = v47;
    }
    v21 = v52;
    v23 = v53;
    goto LABEL_31;
  }
  v21 = v20;
  if (a4)
  {
    v21 = objc_retainAutorelease(v20);
    v22 = 0;
    *a4 = v21;
  }
  else
  {
    v22 = 0;
  }
LABEL_34:

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCodableAttribute:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCodableAttribute:", *(_QWORD *)(a1 + 32));
}

- (id)__INTypeCodableDescriptionWindowSizeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeWindowSizeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionUnsupportedReasonsKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionTagKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTagKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsSearchKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsSearchKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsResolutionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsResolutionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsMultipleValuesKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsMultipleValuesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsDynamicEnumerationKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsDynamicEnumerationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionRelationshipKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionPromptDialogsKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionMetadataKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionFixedSizeArrayKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeFixedSizeArrayKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionEnumTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEnumTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionEntityKeypathKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEntityKeypathKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDisplayPriorityKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayPriorityKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDefaultKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionConfigurableKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeConfigurableKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionArraySizesKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionArraySizeSizeClassKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeClassKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionArraySizeSizeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionWindowSizeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeWindowSizeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionUnsupportedReasonsKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTagKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTagKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsSearchKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsSearchKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsResolutionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsResolutionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsMultipleValuesKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsMultipleValuesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsDynamicEnumerationKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsDynamicEnumerationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionRelationshipKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPromptDialogsKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMetadataKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFixedSizeArrayKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeFixedSizeArrayKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEnumTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEnumTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEntityKeypathKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEntityKeypathKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisplayPriorityKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayPriorityKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDefaultKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionConfigurableKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeConfigurableKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionArraySizesKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionArraySizeSizeClassKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeClassKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionArraySizeSizeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionArraySizeSizeClassKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeClassKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionArraySizeSizeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
