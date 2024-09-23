@implementation LNActionMetadata

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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  -[LNActionMetadata identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[LNActionMetadata mangledTypeName](self, "mangledTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v5, CFSTR("mangledTypeName"));

  -[LNActionMetadata effectiveBundleIdentifiers](self, "effectiveBundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v6, CFSTR("effectiveBundleIdentifiers"));

  -[LNActionMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v7, CFSTR("title"));

  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v8, CFSTR("descriptionMetadata"));

  -[LNActionMetadata deprecationMetadata](self, "deprecationMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v9, CFSTR("deprecationMetadata"));

  -[LNActionMetadata parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v10, CFSTR("parameters"));

  -[LNActionMetadata outputType](self, "outputType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v11, CFSTR("outputType"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata outputFlags](self, "outputFlags"), CFSTR("outputFlags"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata openAppWhenRun](self, "openAppWhenRun"), CFSTR("openAppWhenRun"));
  -[LNActionMetadata explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v12, CFSTR("explicitAuthenticationPolicy"));

  -[LNActionMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v13, CFSTR("systemProtocolMetadata"));

  -[LNActionMetadata actionConfiguration](self, "actionConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v14, CFSTR("actionConfiguration"));

  -[LNActionMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v15, CFSTR("typeSpecificMetadata"));

  -[LNActionMetadata customIntentClassName](self, "customIntentClassName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v16, CFSTR("customIntentClassName"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata bundleMetadataVersion](self, "bundleMetadataVersion"), CFSTR("bundleMetadataVersion"));
  -[LNActionMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v17, CFSTR("mangledTypeNameByBundleIdentifier"));

  -[LNActionMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v18, CFSTR("availabilityAnnotations"));

  -[LNActionMetadata shortcutsMetadata](self, "shortcutsMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v19, CFSTR("shortcutsMetadata"));

  -[LNActionMetadata requiredCapabilities](self, "requiredCapabilities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v20, CFSTR("requiredCapabilities"));

  -[LNActionMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v21, CFSTR("attributionBundleIdentifier"));

  -[LNActionMetadata sideEffect](self, "sideEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v22, CFSTR("sideEffect"));

  -[LNActionMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v23, CFSTR("assistantDefinedSchemas"));

  -[LNActionMetadata assistantDefinedSchemaTraits](self, "assistantDefinedSchemaTraits");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v24, CFSTR("assistantDefinedSchemaTraits"));

  -[LNActionMetadata visibilityMetadata](self, "visibilityMetadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v25, CFSTR("visibilityMetadata"));

  -[LNActionMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v26, CFSTR("fullyQualifiedTypeName"));

  -[LNActionMetadata systemProtocols](self, "systemProtocols");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v27, CFSTR("systemProtocols"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata authenticationPolicy](self, "authenticationPolicy"), CFSTR("authenticationPolicy"));
}

- (NSArray)systemProtocols
{
  return self->_systemProtocols;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  LNActionMetadata *v22;
  LNActionMetadata *v23;
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

  v22 = [LNActionMetadata alloc];
  -[LNActionMetadata identifier](self, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata mangledTypeName](self, "mangledTypeName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata effectiveBundleIdentifiers](self, "effectiveBundleIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[LNActionMetadata bundleMetadataVersion](self, "bundleMetadataVersion");
  -[LNActionMetadata title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata deprecationMetadata](self, "deprecationMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[LNActionMetadata openAppWhenRun](self, "openAppWhenRun");
  -[LNActionMetadata explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata outputType](self, "outputType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[LNActionMetadata outputFlags](self, "outputFlags");
  -[LNActionMetadata parameters](self, "parameters");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata actionConfiguration](self, "actionConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata customIntentClassName](self, "customIntentClassName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata shortcutsMetadata](self, "shortcutsMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata requiredCapabilities](self, "requiredCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata sideEffect](self, "sideEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata assistantDefinedSchemaTraits](self, "assistantDefinedSchemaTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata visibilityMetadata](self, "visibilityMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v17;
  v23 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](v22, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v33, v32, v21, v20, v19, v18, v31, v30, v12, v29, v28, v16, v27,
          v26,
          v25,
          v24,
          v15,
          v14,
          v13,
          v4,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10);

  return v23;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)mangledTypeNameByBundleIdentifier
{
  return self->_mangledTypeNameByBundleIdentifier;
}

- (unint64_t)outputFlags
{
  return self->_outputFlags;
}

- (NSString)attributionBundleIdentifier
{
  return self->_attributionBundleIdentifier;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (LNActionDescriptionMetadata)descriptionMetadata
{
  return self->_descriptionMetadata;
}

- (BOOL)openAppWhenRun
{
  return self->_openAppWhenRun;
}

- (LNValueType)outputType
{
  return self->_outputType;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (BOOL)isDiscoverable
{
  return -[LNActionMetadata visibleForUse:](self, "visibleForUse:", 0);
}

- (LNActionDeprecationMetadata)deprecationMetadata
{
  return self->_deprecationMetadata;
}

- (LNActionConfiguration)actionConfiguration
{
  return self->_actionConfiguration;
}

- (NSDictionary)typeSpecificMetadata
{
  return self->_typeSpecificMetadata;
}

- (NSDictionary)systemProtocolMetadata
{
  return self->_systemProtocolMetadata;
}

- (NSDictionary)shortcutsMetadata
{
  return self->_shortcutsMetadata;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (NSString)customIntentClassName
{
  return self->_customIntentClassName;
}

- (int64_t)bundleMetadataVersion
{
  return self->_bundleMetadataVersion;
}

- (int64_t)authenticationPolicy
{
  void *v2;
  int64_t v3;

  -[LNActionMetadata authenticationPolicyAllowingImplicit:](self, "authenticationPolicyAllowingImplicit:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)mangledTypeNameForBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionMetadata.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  -[LNActionMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[LNActionMetadata mangledTypeName](self, "mangledTypeName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_nullableEffectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_explicitAuthenticationPolicy, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedTypeName, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemaTraits, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemas, 0);
  objc_storeStrong((id *)&self->_sideEffect, 0);
  objc_storeStrong((id *)&self->_attributionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_shortcutsMetadata, 0);
  objc_storeStrong((id *)&self->_typeSpecificMetadata, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_customIntentClassName, 0);
  objc_storeStrong((id *)&self->_actionConfiguration, 0);
  objc_storeStrong((id *)&self->_systemProtocols, 0);
  objc_storeStrong((id *)&self->_systemProtocolMetadata, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_deprecationMetadata, 0);
  objc_storeStrong((id *)&self->_descriptionMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionMetadata.m"), 441, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("effectiveBundleIdentifiers"));

  }
  v9 = (_QWORD *)-[LNActionMetadata copy](self, "copy");
  objc_msgSend(v9, "effectiveBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "if_orderedSetByAddingObjectsFromArray:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v9[4];
  v9[4] = v12;

  objc_msgSend(v9, "mangledTypeNameByBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v9[16];
  v9[16] = v15;

  return v9;
}

- (LNActionMetadata)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  LNActionMetadata *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  LNVisibilityMetadata *v61;
  BOOL v62;
  void *v63;
  LNActionMetadata *v64;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v88 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledTypeName"));
  v86 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("effectiveBundleIdentifiers"));
  v85 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v84 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptionMetadata"));
  v83 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deprecationMetadata"));
  v82 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputType"));
  v81 = objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("outputFlags"));
  v76 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("openAppWhenRun"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("explicitAuthenticationPolicy"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("parameters"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v18, CFSTR("systemProtocolMetadata"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v21, CFSTR("mangledTypeNameByBundleIdentifier"));
  v87 = objc_claimAutoreleasedReturnValue();

  v22 = 0;
  if (!v88)
  {
    v64 = self;
    v63 = 0;
    v27 = (void *)v85;
    v23 = (void *)v86;
    v25 = (void *)v83;
    v24 = (void *)v84;
    v26 = (void *)v82;
LABEL_15:
    v28 = (void *)v81;
    v29 = (void *)v87;
    goto LABEL_12;
  }
  v23 = (void *)v86;
  v25 = (void *)v83;
  v24 = (void *)v84;
  v26 = (void *)v82;
  if (!v86)
  {
    v64 = self;
    v63 = (void *)v88;
    v27 = (void *)v85;
    goto LABEL_15;
  }
  v27 = (void *)v85;
  v28 = (void *)v81;
  if (v90 && v89 && v85)
  {
    v29 = (void *)v87;
    if (v87)
    {
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIntentClassName"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionConfiguration"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0C99E60];
      v31 = objc_opt_class();
      v32 = objc_opt_class();
      v33 = objc_opt_class();
      v34 = objc_opt_class();
      objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, objc_opt_class(), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v35, CFSTR("typeSpecificMetadata"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("bundleMetadataVersion"));
      v36 = (void *)MEMORY[0x1E0C99E60];
      v37 = objc_opt_class();
      v38 = objc_opt_class();
      v39 = objc_opt_class();
      v40 = objc_opt_class();
      v41 = objc_opt_class();
      v42 = objc_opt_class();
      objc_msgSend(v36, "setWithObjects:", v37, v38, v39, v40, v41, v42, objc_opt_class(), 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v43, CFSTR("shortcutsMetadata"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)MEMORY[0x1E0C99E60];
      v45 = objc_opt_class();
      v46 = objc_opt_class();
      objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v47, CFSTR("availabilityAnnotations"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = (void *)MEMORY[0x1E0C99E60];
      v49 = objc_opt_class();
      objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v50, CFSTR("requiredCapabilities"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionBundleIdentifier"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sideEffect"));
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x1E0C99E60];
      v54 = objc_opt_class();
      objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v55, CFSTR("assistantDefinedSchemas"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = (void *)MEMORY[0x1E0C99E60];
      v58 = objc_opt_class();
      objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v59, CFSTR("assistantDefinedSchemaTraits"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visibilityMetadata"));
      v61 = (LNVisibilityMetadata *)objc_claimAutoreleasedReturnValue();
      if (!v61)
        v61 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isDiscoverable")), 0);
      v62 = v76 != 0;
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullyQualifiedTypeName"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)v52;
      v67 = v52;
      v28 = (void *)v81;
      LOBYTE(v66) = v62;
      v26 = (void *)v82;
      v25 = (void *)v83;
      v63 = (void *)v88;
      v64 = objc_retain(-[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v88, v86, v87, v85, v69, v84, v83, v82, v66, v80, v81, v78,
                v90,
                v89,
                v74,
                v73,
                v75,
                v71,
                v72,
                v70,
                v51,
                v67,
                v56,
                v60,
                v61,
                v77));

      v24 = (void *)v84;
      v27 = (void *)v85;

      v23 = (void *)v86;
      v29 = (void *)v87;
      v22 = v64;
    }
    else
    {
      v64 = self;
      v63 = (void *)v88;
    }
  }
  else
  {
    v64 = self;
    v29 = (void *)v87;
    v63 = (void *)v88;
  }
LABEL_12:

  return v22;
}

- (LNActionMetadata)actionMetadataWithParameters:(id)a3
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionMetadata.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

  }
  v6 = (_QWORD *)-[LNActionMetadata copy](self, "copy");
  v7 = objc_msgSend(v5, "copy");
  v8 = (void *)v6[17];
  v6[17] = v7;

  return (LNActionMetadata *)v6;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 shortcutsMetadata:(id)a19
{
  uint64_t v20;

  LOBYTE(v20) = a10;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", a3, a4, a5, a6, a7, a8, a9, v20, a11, a12, a13, a14, a15, a16, a17,
           a18,
           0,
           a19);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 availabilityAnnotations:(id)a19 shortcutsMetadata:(id)a20
{
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  LNEmptySystemProtocolMetadata *v34;
  void *v35;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v44;
  LNActionMetadata *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v50 = a4;
  v48 = a5;
  v47 = a6;
  v44 = a8;
  v42 = a9;
  v49 = a12;
  v24 = a14;
  v25 = a15;
  v41 = a16;
  v40 = a17;
  v39 = a18;
  v26 = a19;
  v38 = a20;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v25, "count"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v28 = v25;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v34 = objc_alloc_init(LNEmptySystemProtocolMetadata);
        objc_msgSend(v33, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setValue:forKey:", v34, v35);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v30);
  }

  LOBYTE(v37) = a10;
  v46 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", v51, v50, v48, v47, a7, v44, v42, v37, a11, v49, a13, v24, v27, v41, v40,
          v39,
          v26,
          v38);

  return v46;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocolMetadata:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 availabilityAnnotations:(id)a19 shortcutsMetadata:(id)a20
{
  uint64_t v21;

  LOBYTE(v21) = a10;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", a3, a4, a5, a6, a7, a8, a9, 0, v21, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21
{
  uint64_t v22;

  LOBYTE(v22) = a11;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:", a3, a4, a5, a6, a7, a8, a9, a10, v22, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23
{
  uint64_t v24;

  LOWORD(v24) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, v24, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:", a3, a4, a5, a6, a7, a8);
}

- (id)actionMetadataDescriptionMetadata:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[LNActionMetadata copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[6];
  v5[6] = v6;

  return v5;
}

- (LNActionMetadata)actionMetadataWithAttributionBundleIdentifier:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionDescriptionMetadataWithIcon:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNActionMetadata actionMetadataDescriptionMetadata:](self, "actionMetadataDescriptionMetadata:", v9);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "copy");

  v12 = (void *)v10[21];
  v10[21] = v11;

  return (LNActionMetadata *)v10;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 explicitAuthenticationPolicy:(id)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27 fullyQualifiedTypeName:(id)a28
{
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  LNActionMetadata *v44;
  void *v45;
  uint64_t v46;
  NSString *identifier;
  uint64_t v48;
  NSString *mangledTypeName;
  uint64_t v50;
  NSOrderedSet *effectiveBundleIdentifiers;
  uint64_t v52;
  NSArray *parameters;
  uint64_t v54;
  NSDictionary *systemProtocolMetadata;
  uint64_t v56;
  NSDictionary *typeSpecificMetadata;
  uint64_t v58;
  NSString *customIntentClassName;
  uint64_t v60;
  NSDictionary *mangledTypeNameByBundleIdentifier;
  uint64_t v62;
  NSDictionary *availabilityAnnotations;
  uint64_t v64;
  NSDictionary *shortcutsMetadata;
  uint64_t v66;
  NSArray *requiredCapabilities;
  uint64_t v68;
  NSString *attributionBundleIdentifier;
  void *v70;
  uint64_t v71;
  NSArray *systemProtocols;
  uint64_t v73;
  NSArray *assistantDefinedSchemas;
  uint64_t v75;
  NSArray *assistantDefinedSchemaTraits;
  uint64_t v77;
  LNVisibilityMetadata *visibilityMetadata;
  uint64_t v79;
  NSString *fullyQualifiedTypeName;
  LNActionMetadata *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id obj;
  id v89;
  id v90;
  id v91;
  id v92;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  objc_super v112;

  v111 = a3;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  obj = a8;
  v105 = a8;
  v87 = a9;
  v104 = a9;
  v89 = a10;
  v103 = a10;
  v90 = a12;
  v102 = a12;
  v91 = a13;
  v101 = a13;
  v35 = a15;
  v110 = a16;
  v92 = a17;
  v100 = a17;
  v36 = a18;
  v109 = a19;
  v108 = a20;
  v107 = a21;
  v37 = a22;
  v98 = a23;
  v99 = a24;
  v97 = a25;
  v96 = a26;
  v38 = a27;
  v95 = a28;
  if (!v111)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionMetadata.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"), a9, a8, a10, a12, a13, a17);

  }
  v39 = v37;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionMetadata.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mangledTypeName"));

  }
  v40 = v33;
  v41 = v110;
  v42 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionMetadata.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

  }
  v43 = v36;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionMetadata.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visibilityMetadata"));

  }
  v112.receiver = self;
  v112.super_class = (Class)LNActionMetadata;
  v44 = -[LNActionMetadata init](&v112, sel_init);
  v45 = v32;
  if (v44)
  {
    v46 = objc_msgSend(v111, "copy");
    identifier = v44->_identifier;
    v44->_identifier = (NSString *)v46;

    v48 = objc_msgSend(v32, "copy");
    mangledTypeName = v44->_mangledTypeName;
    v44->_mangledTypeName = (NSString *)v48;

    v50 = objc_msgSend(v34, "copy");
    effectiveBundleIdentifiers = v44->_effectiveBundleIdentifiers;
    v44->_effectiveBundleIdentifiers = (NSOrderedSet *)v50;

    objc_storeStrong((id *)&v44->_title, obj);
    objc_storeStrong((id *)&v44->_descriptionMetadata, v87);
    objc_storeStrong((id *)&v44->_deprecationMetadata, v89);
    v52 = objc_msgSend(v42, "copy");
    parameters = v44->_parameters;
    v44->_parameters = (NSArray *)v52;

    v44->_openAppWhenRun = a11;
    v41 = v110;
    v44->_discoverable = objc_msgSend(v38, "isDiscoverable");
    objc_storeStrong((id *)&v44->_explicitAuthenticationPolicy, v90);
    objc_storeStrong((id *)&v44->_outputType, v91);
    v44->_outputFlags = a14;
    v54 = objc_msgSend(v110, "copy");
    systemProtocolMetadata = v44->_systemProtocolMetadata;
    v44->_systemProtocolMetadata = (NSDictionary *)v54;

    objc_storeStrong((id *)&v44->_actionConfiguration, v92);
    v56 = objc_msgSend(v43, "copy");
    typeSpecificMetadata = v44->_typeSpecificMetadata;
    v44->_typeSpecificMetadata = (NSDictionary *)v56;

    v58 = objc_msgSend(v109, "copy");
    customIntentClassName = v44->_customIntentClassName;
    v44->_customIntentClassName = (NSString *)v58;

    v44->_bundleMetadataVersion = a7;
    v60 = objc_msgSend(v40, "copy");
    mangledTypeNameByBundleIdentifier = v44->_mangledTypeNameByBundleIdentifier;
    v44->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v60;

    v62 = objc_msgSend(v108, "copy");
    availabilityAnnotations = v44->_availabilityAnnotations;
    v44->_availabilityAnnotations = (NSDictionary *)v62;

    v64 = objc_msgSend(v107, "copy");
    shortcutsMetadata = v44->_shortcutsMetadata;
    v44->_shortcutsMetadata = (NSDictionary *)v64;

    v66 = objc_msgSend(v39, "copy");
    requiredCapabilities = v44->_requiredCapabilities;
    v44->_requiredCapabilities = (NSArray *)v66;

    v68 = objc_msgSend(v98, "copy");
    attributionBundleIdentifier = v44->_attributionBundleIdentifier;
    v44->_attributionBundleIdentifier = (NSString *)v68;

    objc_msgSend(v110, "allKeys");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "if_compactMap:", &__block_literal_global_5905);
    v71 = objc_claimAutoreleasedReturnValue();
    systemProtocols = v44->_systemProtocols;
    v44->_systemProtocols = (NSArray *)v71;

    v45 = v32;
    objc_storeStrong((id *)&v44->_sideEffect, a24);
    v73 = objc_msgSend(v97, "copy");
    assistantDefinedSchemas = v44->_assistantDefinedSchemas;
    v44->_assistantDefinedSchemas = (NSArray *)v73;

    v75 = objc_msgSend(v96, "copy");
    assistantDefinedSchemaTraits = v44->_assistantDefinedSchemaTraits;
    v44->_assistantDefinedSchemaTraits = (NSArray *)v75;

    v77 = objc_msgSend(v38, "copy");
    visibilityMetadata = v44->_visibilityMetadata;
    v44->_visibilityMetadata = (LNVisibilityMetadata *)v77;

    v79 = objc_msgSend(v95, "copy");
    fullyQualifiedTypeName = v44->_fullyQualifiedTypeName;
    v44->_fullyQualifiedTypeName = (NSString *)v79;

    v81 = v44;
  }

  return v44;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if ((-[LNActionMetadata outputFlags](self, "outputFlags") & 8) != 0)
  {
    -[LNActionMetadata systemProtocols](self, "systemProtocols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[LNSystemProtocol urlRepresentableProtocol](LNSystemProtocol, "urlRepresentableProtocol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v5 = 1;
  }
  -[LNActionMetadata visibilityMetadata](self, "visibilityMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "visibleForUse:", a3) & v5;

  return v9;
}

- (id)authenticationPolicyAllowingImplicit:(BOOL)a3
{
  NSNumber *explicitAuthenticationPolicy;

  explicitAuthenticationPolicy = self->_explicitAuthenticationPolicy;
  if (!a3 || explicitAuthenticationPolicy)
    return explicitAuthenticationPolicy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithoutMangledTypeNameWithAvailability:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = -[LNActionMetadata copy](self, "copy");
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = &stru_1E39A2988;

  if (v5)
    objc_storeStrong((id *)(v6 + 120), a3);

  return (id)v6;
}

- (NSString)description
{
  objc_class *v3;
  int64_t v4;
  __CFString *v5;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
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
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata identifier](self, "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata effectiveBundleIdentifiers](self, "effectiveBundleIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForKeyPath:", CFSTR("description"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LNActionMetadata bundleMetadataVersion](self, "bundleMetadataVersion");
  v5 = CFSTR("1.0");
  if (!v4)
    v5 = CFSTR("0.0");
  v39 = v5;
  -[LNActionMetadata title](self, "title");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata deprecationMetadata](self, "deprecationMetadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata parameters](self, "parameters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForKeyPath:", CFSTR("description"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LNActionMetadata openAppWhenRun](self, "openAppWhenRun"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata visibilityMetadata](self, "visibilityMetadata");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata outputType](self, "outputType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKeyPath:", CFSTR("description"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata actionConfiguration](self, "actionConfiguration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v18, "count");
  if (v17)
  {
    -[LNActionMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = CFSTR("{}");
  }
  -[LNActionMetadata customIntentClassName](self, "customIntentClassName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata shortcutsMetadata](self, "shortcutsMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata requiredCapabilities](self, "requiredCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata sideEffect](self, "sideEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata assistantDefinedSchemaTraits](self, "assistantDefinedSchemaTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, effectiveBundleIdentifiers: [%@], bundleMetadataVersion: %@, title: %@, description: %@, deprecation: %@,parameters: [%@], openAppWhenRun: %@, visibility: %@, explicitAuthenticationPolicy: %@, outputType: %@, systemProtocolMetadata: [%@], actionConfiguration: %@, typeSpecificMetadata: %@, customIntentClassName: %@, mangledTypeNameByBundleIdentifier: %@, availabilityAnnotations: %@, shortcutsMetadata: %@, requiredCapabilities: %@, attributionBundleIdentifier: %@, sideEffect: %@, assistantDefinedSchemas: %@, assistantDefinedSchemaTraits: %@, fullyQualifiedTypeName: %@>"), v42, self, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v27,
    v28,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  return (NSString *)v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  -[LNActionMetadata identifier](self, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v45, "hash");
  -[LNActionMetadata parameters](self, "parameters");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v44, "hash") ^ v3;
  -[LNActionMetadata title](self, "title");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v43, "hash");
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v42, "hash");
  -[LNActionMetadata deprecationMetadata](self, "deprecationMetadata");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v41, "hash");
  v8 = v6 ^ v7 ^ -[LNActionMetadata openAppWhenRun](self, "openAppWhenRun");
  -[LNActionMetadata visibilityMetadata](self, "visibilityMetadata");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v40, "hash");
  -[LNActionMetadata explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v39, "integerValue");
  -[LNActionMetadata outputType](self, "outputType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v38, "hash");
  -[LNActionMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v11 ^ objc_msgSend(v37, "hash");
  -[LNActionMetadata actionConfiguration](self, "actionConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v36, "hash");
  -[LNActionMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 ^ objc_msgSend(v35, "hash");
  -[LNActionMetadata customIntentClassName](self, "customIntentClassName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v34, "hash");
  -[LNActionMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  v18 = v12 ^ v17 ^ -[LNActionMetadata bundleMetadataVersion](self, "bundleMetadataVersion");
  -[LNActionMetadata shortcutsMetadata](self, "shortcutsMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[LNActionMetadata requiredCapabilities](self, "requiredCapabilities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[LNActionMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  -[LNActionMetadata sideEffect](self, "sideEffect");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ objc_msgSend(v25, "hash");
  -[LNActionMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26 ^ objc_msgSend(v27, "hash");
  -[LNActionMetadata assistantDefinedSchemaTraits](self, "assistantDefinedSchemaTraits");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v18 ^ v28 ^ objc_msgSend(v29, "hash");
  -[LNActionMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v30 ^ objc_msgSend(v31, "hash");

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  LNActionMetadata *v4;
  LNActionMetadata *v5;
  LNActionMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  int v78;
  int64_t v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v108;
  int v109;
  id v110;
  void *v111;
  int v112;
  id v113;
  void *v114;
  int v115;
  id v116;
  void *v117;
  int v118;
  id v119;
  void *v120;
  int v121;
  id v122;
  void *v123;
  int v124;
  id v125;
  void *v126;
  id v127;
  id v128;
  int v129;
  id v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  int v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  int v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  id v152;

  v4 = (LNActionMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_182:

      goto LABEL_183;
    }
    -[LNActionMetadata identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionMetadata identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_180;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_181:

        goto LABEL_182;
      }
    }
    -[LNActionMetadata title](self, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionMetadata title](v6, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_179;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_180:

        goto LABEL_181;
      }
    }
    -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionMetadata descriptionMetadata](v6, "descriptionMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v152 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_178;
      v12 = objc_msgSend(v20, "isEqual:", v24);

      if (!v12)
        goto LABEL_179;
    }
    v151 = v19;
    -[LNActionMetadata deprecationMetadata](self, "deprecationMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionMetadata deprecationMetadata](v6, "deprecationMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v149 = v29;
    v150 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v151;
        goto LABEL_176;
      }
      v30 = v29;
      v19 = v151;
      if (!v29)
      {
LABEL_176:

        goto LABEL_177;
      }
      v31 = objc_msgSend(v28, "isEqual:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v151;
LABEL_177:
        v25 = v149;
        v20 = v150;
LABEL_178:

        v20 = v152;
LABEL_179:

        goto LABEL_180;
      }
    }
    -[LNActionMetadata parameters](self, "parameters");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionMetadata parameters](v6, "parameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v35 = v34;
    if (v28 != v34)
    {
      LOBYTE(v12) = 0;
      v148 = v28;
      v36 = v34;
      if (v28)
      {
        v19 = v151;
        if (v34)
        {
          v37 = v34;
          v38 = objc_msgSend(v28, "isEqualToArray:", v34);
          v147 = v37;

          if (!v38)
            goto LABEL_37;
LABEL_36:
          v39 = -[LNActionMetadata openAppWhenRun](self, "openAppWhenRun");
          if (v39 != -[LNActionMetadata openAppWhenRun](v6, "openAppWhenRun"))
          {
LABEL_37:
            LOBYTE(v12) = 0;
            v19 = v151;
            v30 = v147;
            goto LABEL_176;
          }
          -[LNActionMetadata visibilityMetadata](self, "visibilityMetadata");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNActionMetadata visibilityMetadata](v6, "visibilityMetadata");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v40;
          v43 = v41;
          v145 = v43;
          v146 = v42;
          v148 = v28;
          if (v42 != v43)
          {
            LOBYTE(v12) = 0;
            if (v42)
            {
              v44 = v43;
              v45 = v42;
              v19 = v151;
              if (v43)
              {
                v46 = objc_msgSend(v146, "isEqual:", v43);

                if (!v46)
                {
                  LOBYTE(v12) = 0;
                  v19 = v151;
LABEL_174:
                  v28 = v146;
                  v35 = v147;
                  v36 = v145;
                  goto LABEL_175;
                }
LABEL_46:
                -[LNActionMetadata explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[LNActionMetadata explicitAuthenticationPolicy](v6, "explicitAuthenticationPolicy");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = v47;
                v50 = v48;
                v143 = v50;
                v144 = v49;
                if (v49 != v50)
                {
                  LOBYTE(v12) = 0;
                  if (v49)
                  {
                    v51 = v50;
                    v52 = v49;
                    v19 = v151;
                    if (v50)
                    {
                      v141 = objc_msgSend(v144, "isEqual:", v50);

                      if (!v141)
                      {
                        LOBYTE(v12) = 0;
                        v19 = v151;
LABEL_172:
                        v44 = v143;
                        v45 = v144;
                        goto LABEL_173;
                      }
LABEL_52:
                      -[LNActionMetadata outputType](self, "outputType");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNActionMetadata outputType](v6, "outputType");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v55 = v53;
                      v56 = v54;
                      v140 = v56;
                      v142 = v55;
                      if (v55 != v56)
                      {
                        LOBYTE(v12) = 0;
                        if (v55)
                        {
                          v57 = v56;
                          v58 = v55;
                          v19 = v151;
                          if (v56)
                          {
                            v138 = objc_msgSend(v142, "isEqual:", v56);

                            if (!v138)
                            {
                              LOBYTE(v12) = 0;
                              v19 = v151;
LABEL_170:
                              v52 = v142;
                              v51 = v140;
                              goto LABEL_171;
                            }
LABEL_59:
                            -[LNActionMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            -[LNActionMetadata systemProtocolMetadata](v6, "systemProtocolMetadata");
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            v61 = v59;
                            v62 = v60;
                            v137 = v62;
                            v139 = v61;
                            if (v61 != v62)
                            {
                              LOBYTE(v12) = 0;
                              if (v61)
                              {
                                v63 = v62;
                                v64 = v61;
                                v19 = v151;
                                if (v62)
                                {
                                  v135 = objc_msgSend(v139, "isEqualToDictionary:", v62);

                                  if (!v135)
                                  {
                                    LOBYTE(v12) = 0;
                                    v19 = v151;
LABEL_168:
                                    v57 = v137;
                                    v58 = v139;
                                    goto LABEL_169;
                                  }
LABEL_66:
                                  -[LNActionMetadata actionConfiguration](self, "actionConfiguration");
                                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[LNActionMetadata actionConfiguration](v6, "actionConfiguration");
                                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                                  v67 = v65;
                                  v68 = v66;
                                  v134 = v68;
                                  v136 = v67;
                                  if (v67 != v68)
                                  {
                                    LOBYTE(v12) = 0;
                                    if (v67)
                                    {
                                      v69 = v68;
                                      v132 = v67;
                                      v19 = v151;
                                      if (v68)
                                      {
                                        v133 = objc_msgSend(v136, "isEqual:", v68);

                                        if (!v133)
                                        {
                                          LOBYTE(v12) = 0;
                                          v19 = v151;
LABEL_166:
                                          v63 = v134;
                                          v64 = v136;
                                          goto LABEL_167;
                                        }
LABEL_73:
                                        -[LNActionMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
                                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[LNActionMetadata typeSpecificMetadata](v6, "typeSpecificMetadata");
                                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                                        v72 = v70;
                                        v73 = v71;
                                        v131 = v73;
                                        v132 = v72;
                                        if (v72 != v73)
                                        {
                                          LOBYTE(v12) = 0;
                                          if (v72)
                                          {
                                            v74 = v73;
                                            if (v73)
                                            {
                                              v129 = objc_msgSend(v72, "isEqualToDictionary:", v73);

                                              if (!v129)
                                              {
                                                LOBYTE(v12) = 0;
LABEL_164:
                                                v19 = v151;
                                                v69 = v131;
                                                goto LABEL_165;
                                              }
LABEL_80:
                                              -[LNActionMetadata customIntentClassName](self, "customIntentClassName");
                                              v75 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata customIntentClassName](v6, "customIntentClassName");
                                              v76 = (void *)objc_claimAutoreleasedReturnValue();
                                              v72 = v75;
                                              v128 = v72;
                                              v130 = v76;
                                              if (v72 == v130)
                                              {

                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (!v72)
                                                {
                                                  v77 = 0;

LABEL_161:
                                                  goto LABEL_162;
                                                }
                                                v127 = v130;
                                                v77 = v72;
                                                if (!v130)
                                                {
LABEL_160:

                                                  goto LABEL_161;
                                                }
                                                v78 = objc_msgSend(v72, "isEqualToString:", v130);

                                                if (!v78)
                                                  goto LABEL_93;
                                              }
                                              v79 = -[LNActionMetadata bundleMetadataVersion](self, "bundleMetadataVersion");
                                              if (v79 != -[LNActionMetadata bundleMetadataVersion](v6, "bundleMetadataVersion"))
                                              {
LABEL_93:
                                                LOBYTE(v12) = 0;
                                                v72 = v128;
LABEL_162:
                                                v74 = v130;
                                                goto LABEL_163;
                                              }
                                              -[LNActionMetadata availabilityAnnotations](self, "availabilityAnnotations");
                                              v80 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata availabilityAnnotations](v6, "availabilityAnnotations");
                                              v81 = (void *)objc_claimAutoreleasedReturnValue();
                                              v77 = v80;
                                              v127 = v81;
                                              if (v77 == v127)
                                              {

                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (!v77)
                                                {
                                                  v126 = 0;

LABEL_158:
                                                  goto LABEL_159;
                                                }
                                                v125 = v127;
                                                v126 = v77;
                                                if (!v127)
                                                {
LABEL_157:

                                                  goto LABEL_158;
                                                }
                                                v82 = objc_msgSend(v77, "isEqualToDictionary:", v127);

                                                if (!v82)
                                                {
                                                  LOBYTE(v12) = 0;
LABEL_159:
                                                  v72 = v128;
                                                  goto LABEL_160;
                                                }
                                              }
                                              -[LNActionMetadata shortcutsMetadata](self, "shortcutsMetadata");
                                              v83 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata shortcutsMetadata](v6, "shortcutsMetadata");
                                              v84 = (void *)objc_claimAutoreleasedReturnValue();
                                              v85 = v83;
                                              v125 = v84;
                                              v126 = v85;
                                              if (v85 == v125)
                                              {

                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (!v85)
                                                {
                                                  v123 = 0;

LABEL_156:
                                                  goto LABEL_157;
                                                }
                                                v122 = v125;
                                                v123 = v85;
                                                if (!v125)
                                                {
LABEL_155:

                                                  goto LABEL_156;
                                                }
                                                v124 = objc_msgSend(v85, "isEqualToDictionary:", v125);

                                                if (!v124)
                                                {
                                                  LOBYTE(v12) = 0;
                                                  goto LABEL_157;
                                                }
                                              }
                                              -[LNActionMetadata requiredCapabilities](self, "requiredCapabilities");
                                              v86 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata requiredCapabilities](v6, "requiredCapabilities");
                                              v87 = (void *)objc_claimAutoreleasedReturnValue();
                                              v88 = v86;
                                              v122 = v87;
                                              v123 = v88;
                                              if (v88 == v122)
                                              {

                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (!v88)
                                                {
                                                  v120 = 0;

LABEL_154:
                                                  goto LABEL_155;
                                                }
                                                v119 = v122;
                                                v120 = v88;
                                                if (!v122)
                                                {
LABEL_153:

                                                  goto LABEL_154;
                                                }
                                                v121 = objc_msgSend(v88, "isEqualToArray:", v122);

                                                if (!v121)
                                                {
                                                  LOBYTE(v12) = 0;
                                                  goto LABEL_155;
                                                }
                                              }
                                              -[LNActionMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
                                              v89 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata attributionBundleIdentifier](v6, "attributionBundleIdentifier");
                                              v90 = (void *)objc_claimAutoreleasedReturnValue();
                                              v91 = v89;
                                              v119 = v90;
                                              v120 = v91;
                                              if (v91 == v119)
                                              {

                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (!v91)
                                                {
                                                  v117 = 0;

LABEL_152:
                                                  goto LABEL_153;
                                                }
                                                v116 = v119;
                                                v117 = v91;
                                                if (!v119)
                                                {
LABEL_151:

                                                  goto LABEL_152;
                                                }
                                                v118 = objc_msgSend(v91, "isEqualToString:", v119);

                                                if (!v118)
                                                {
                                                  LOBYTE(v12) = 0;
                                                  goto LABEL_153;
                                                }
                                              }
                                              -[LNActionMetadata sideEffect](self, "sideEffect");
                                              v92 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata sideEffect](v6, "sideEffect");
                                              v93 = (void *)objc_claimAutoreleasedReturnValue();
                                              v94 = v92;
                                              v116 = v93;
                                              v117 = v94;
                                              if (v94 == v116)
                                              {

                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (!v94)
                                                {
                                                  v114 = 0;

LABEL_150:
                                                  goto LABEL_151;
                                                }
                                                v113 = v116;
                                                v114 = v94;
                                                if (!v116)
                                                {
LABEL_149:

                                                  goto LABEL_150;
                                                }
                                                v115 = objc_msgSend(v94, "isEqual:", v116);

                                                if (!v115)
                                                {
                                                  LOBYTE(v12) = 0;
                                                  goto LABEL_151;
                                                }
                                              }
                                              -[LNActionMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
                                              v95 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
                                              v96 = (void *)objc_claimAutoreleasedReturnValue();
                                              v97 = v95;
                                              v113 = v96;
                                              v114 = v97;
                                              if (v97 == v113)
                                              {

                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (!v97)
                                                {
                                                  v111 = 0;

LABEL_148:
                                                  goto LABEL_149;
                                                }
                                                v110 = v113;
                                                v111 = v97;
                                                if (!v113)
                                                {
LABEL_147:

                                                  goto LABEL_148;
                                                }
                                                v112 = objc_msgSend(v97, "isEqualToArray:", v113);

                                                if (!v112)
                                                {
                                                  LOBYTE(v12) = 0;
                                                  goto LABEL_149;
                                                }
                                              }
                                              -[LNActionMetadata assistantDefinedSchemaTraits](self, "assistantDefinedSchemaTraits");
                                              v98 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata assistantDefinedSchemaTraits](self, "assistantDefinedSchemaTraits");
                                              v99 = (void *)objc_claimAutoreleasedReturnValue();
                                              v100 = v98;
                                              v110 = v99;
                                              v111 = v100;
                                              if (v100 != v110)
                                              {
                                                LOBYTE(v12) = 0;
                                                if (v100)
                                                {
                                                  v108 = v110;
                                                  if (v110)
                                                  {
                                                    v109 = objc_msgSend(v100, "isEqualToArray:", v110);

                                                    if (!v109)
                                                    {
                                                      LOBYTE(v12) = 0;
                                                      goto LABEL_147;
                                                    }
                                                    goto LABEL_138;
                                                  }
                                                }
                                                else
                                                {
                                                  v100 = 0;
                                                  v108 = v110;
                                                }
LABEL_146:

                                                goto LABEL_147;
                                              }

LABEL_138:
                                              -[LNActionMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
                                              v101 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[LNActionMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
                                              v102 = (void *)objc_claimAutoreleasedReturnValue();
                                              v100 = v101;
                                              v108 = v102;
                                              if (v100 == v108)
                                              {
                                                LOBYTE(v12) = 1;
                                              }
                                              else
                                              {
                                                LOBYTE(v12) = 0;
                                                if (v100 && v108)
                                                  LOBYTE(v12) = objc_msgSend(v100, "isEqualToString:", v108);
                                              }

                                              goto LABEL_146;
                                            }
                                          }
                                          else
                                          {
                                            v74 = v73;
                                          }
LABEL_163:

                                          goto LABEL_164;
                                        }

                                        goto LABEL_80;
                                      }
                                    }
                                    else
                                    {
                                      v69 = v68;
                                      v132 = 0;
                                      v19 = v151;
                                    }
LABEL_165:

                                    goto LABEL_166;
                                  }

                                  goto LABEL_73;
                                }
                              }
                              else
                              {
                                v63 = v62;
                                v64 = 0;
                                v19 = v151;
                              }
LABEL_167:
                              v103 = v64;

                              goto LABEL_168;
                            }

                            goto LABEL_66;
                          }
                        }
                        else
                        {
                          v57 = v56;
                          v58 = 0;
                          v19 = v151;
                        }
LABEL_169:
                        v104 = v58;

                        goto LABEL_170;
                      }

                      goto LABEL_59;
                    }
                  }
                  else
                  {
                    v51 = v50;
                    v52 = 0;
                    v19 = v151;
                  }
LABEL_171:
                  v105 = v52;

                  goto LABEL_172;
                }

                goto LABEL_52;
              }
            }
            else
            {
              v44 = v43;
              v45 = 0;
              v19 = v151;
            }
LABEL_173:

            goto LABEL_174;
          }

          goto LABEL_46;
        }
      }
      else
      {
        v19 = v151;
      }
LABEL_175:
      v106 = v35;

      v30 = v106;
      v28 = v148;
      goto LABEL_176;
    }
    v147 = v34;

    goto LABEL_36;
  }
  LOBYTE(v12) = 1;
LABEL_183:

  return v12;
}

- (id)copyWithDescriptiveMetadataFromAction:(id)a3 usingLibraryKey:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char isKindOfClass;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  LNStaticDeferredLocalizedString *v31;
  void *v32;
  void *v33;
  void *v34;
  LNActionSummaryString *v35;
  void *v36;
  void *v37;
  void *v38;
  LNActionSummaryString *v39;
  LNActionSummary *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  LNActionDescriptionMetadata *v53;
  void *v54;
  void *v55;
  void *v56;
  LNStaticDeferredLocalizedString *v57;
  LNActionMetadata *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;

  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)-[LNActionMetadata copy](self, "copy");
  v54 = v6;
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v9, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v8[5];
  v8[5] = v10;

  v53 = [LNActionDescriptionMetadata alloc];
  objc_msgSend(v6, "descriptionMetadata");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "descriptionText");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v7;
  -[LNActionMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v55, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "categoryName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchKeywords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resultValueName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self;
  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "icon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[LNActionDescriptionMetadata initWithDescriptionText:categoryName:searchKeywords:resultValueName:icon:](v53, "initWithDescriptionText:categoryName:searchKeywords:resultValueName:icon:", v12, v14, v16, v18, v20);
  v22 = (void *)v8[6];
  v8[6] = v21;

  objc_msgSend(v54, "actionConfiguration");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v27 = 0;
    v26 = v8;
LABEL_7:

    goto LABEL_8;
  }
  v24 = (void *)v23;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v26 = v8;
  if (!v8[12] && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v54, "actionConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "summaryString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "formatString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
    {
      v31 = [LNStaticDeferredLocalizedString alloc];
      objc_msgSend(v27, "summaryString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "formatString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[LNStaticDeferredLocalizedString initWithKey:table:bundleURL:](v31, "initWithKey:table:bundleURL:", v33, 0, 0);

      -[LNActionMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](v58, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v57, v59);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = [LNActionSummaryString alloc];
      objc_msgSend(v34, "key");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "summaryString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "parameterIdentifiers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[LNActionSummaryString initWithFormatString:parameterIdentifiers:](v35, "initWithFormatString:parameterIdentifiers:", v36, v38);

      v40 = [LNActionSummary alloc];
      objc_msgSend(v34, "bundleURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "table");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "otherParameterIdentifiers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[LNActionSummary initWithSummaryString:bundleURL:table:otherParameterIdentifiers:](v40, "initWithSummaryString:bundleURL:table:otherParameterIdentifiers:", v39, v41, v42, v43);
      v45 = (void *)v26[12];
      v26[12] = v44;

    }
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v54, "nameIndexedParameters");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata parameters](v58, "parameters");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __74__LNActionMetadata_copyWithDescriptiveMetadataFromAction_usingLibraryKey___block_invoke;
  v60[3] = &unk_1E39A1A10;
  v61 = v46;
  v62 = v59;
  v48 = v59;
  v49 = v46;
  objc_msgSend(v47, "if_map:", v60);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v26[17];
  v26[17] = v50;

  return v26;
}

- (LNActionMetadata)actionMetadataWithSystemProtocolMetadata:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (_QWORD *)-[LNActionMetadata copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)v5[10];
  v5[10] = v6;

  objc_msgSend(v4, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "if_compactMap:", &__block_literal_global_109);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v5[11];
  v5[11] = v9;

  return (LNActionMetadata *)v5;
}

- (id)nameIndexedParameters
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[LNActionMetadata parameters](self, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__LNActionMetadata_nameIndexedParameters__block_invoke;
  v7[3] = &unk_1E39A1A58;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4
{
  id v5;
  id v6;
  LNStaticDeferredLocalizedString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNStaticDeferredLocalizedString *v12;

  v5 = a4;
  v6 = a3;
  v7 = [LNStaticDeferredLocalizedString alloc];
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@] %@"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///System/Library/Frameworks/AppIntents.framework/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LNStaticDeferredLocalizedString initWithKey:table:bundleURL:](v7, "initWithKey:table:bundleURL:", v10, CFSTR("AssistantSchemas"), v11);

  return v12;
}

- (LNActionSideEffect)sideEffect
{
  return self->_sideEffect;
}

- (NSArray)assistantDefinedSchemas
{
  return self->_assistantDefinedSchemas;
}

- (NSArray)assistantDefinedSchemaTraits
{
  return self->_assistantDefinedSchemaTraits;
}

- (NSString)fullyQualifiedTypeName
{
  return self->_fullyQualifiedTypeName;
}

- (NSNumber)explicitAuthenticationPolicy
{
  return self->_explicitAuthenticationPolicy;
}

- (NSString)nullableEffectiveBundleIdentifier
{
  return self->_nullableEffectiveBundleIdentifier;
}

- (LNVisibilityMetadata)visibilityMetadata
{
  return self->_visibilityMetadata;
}

void __41__LNActionMetadata_nameIndexedParameters__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
}

id __61__LNActionMetadata_actionMetadataWithSystemProtocolMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LNSystemProtocol protocolOrNilWithIdentifier:](LNSystemProtocol, "protocolOrNilWithIdentifier:", a2);
}

id __74__LNActionMetadata_copyWithDescriptiveMetadataFromAction_usingLibraryKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "actionParameterMetadataWithDescriptiveMetadataFromParameter:usingLibraryKey:", v6, *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v4, "copy");
  }
  v8 = (void *)v7;

  return v8;
}

id __545__LNActionMetadata_initWithIdentifier_mangledTypeName_mangledTypeNameByBundleIdentifier_effectiveBundleIdentifiers_bundleMetadataVersion_title_descriptionMetadata_deprecationMetadata_openAppWhenRun_explicitAuthenticationPolicy_outputType_outputFlags_parameters_systemProtocolMetadata_actionConfiguration_typeSpecificMetadata_customIntentClassName_availabilityAnnotations_shortcutsMetadata_requiredCapabilities_attributionBundleIdentifier_sideEffect_assistantDefinedSchemas_assistantDefinedSchemaTraits_visibilityMetadata_fullyQualifiedTypeName___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LNSystemProtocol protocolOrNilWithIdentifier:](LNSystemProtocol, "protocolOrNilWithIdentifier:", a2);
}

- (LNActionMetadata)initWithCoder_Sydro:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  LNActionMetadata *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  LNActionMetadata *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v61;
  void *v62;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledTypeName"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("effectiveBundleIdentifiers"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptionMetadata"));
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputType"));
  v54 = objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("outputFlags"));
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("openAppWhenRun"));
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("parameters"));
  v59 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("systemProtocols"));
  v58 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("mangledTypeNameByBundleIdentifier"));
  v57 = objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = (void *)v4;
  if (v4)
  {
    v20 = (void *)v57;
    if (v62)
    {
      v22 = (void *)v58;
      v21 = (void *)v59;
      if (v59 && v58 && v61 && v57)
      {
        v51 = v8 != 0;
        objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIntentClassName"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionConfiguration"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0C99E60];
        v24 = objc_opt_class();
        v52 = (void *)v4;
        v25 = objc_opt_class();
        v26 = objc_opt_class();
        objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v27, CFSTR("typeSpecificMetadata"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("bundleMetadataVersion"));
        v28 = (void *)MEMORY[0x1E0C99E60];
        v29 = objc_opt_class();
        v30 = objc_opt_class();
        v31 = objc_opt_class();
        v32 = objc_opt_class();
        v33 = objc_opt_class();
        v34 = objc_opt_class();
        objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, v34, objc_opt_class(), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v35, CFSTR("shortcutsMetadata"));
        v36 = objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x1E0C99E60];
        v38 = objc_opt_class();
        v39 = objc_opt_class();
        objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v40, CFSTR("availabilityAnnotations"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = (void *)v36;
        LOBYTE(v47) = v51;
        v43 = (void *)v55;
        v19 = v52;
        v44 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", v55, v47, objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("authenticationPolicy")), v54, v53, v59, v58, v49, v48, v50, v41, v36);

        v45 = (void *)v54;
        v22 = (void *)v58;

        v20 = (void *)v57;
        self = v44;
        v18 = v44;
        v21 = (void *)v59;
      }
      else
      {
        v43 = (void *)v55;
        v45 = (void *)v54;
      }
    }
    else
    {
      v43 = (void *)v55;
      v45 = (void *)v54;
      v22 = (void *)v58;
      v21 = (void *)v59;
    }
  }
  else
  {
    v43 = (void *)v55;
    v45 = (void *)v54;
    v22 = (void *)v58;
    v21 = (void *)v59;
    v20 = (void *)v57;
  }

  return v18;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 presentationStyle:(int64_t)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 parameters:(id)a13 systemProtocols:(id)a14 actionConfiguration:(id)a15 typeSpecificMetadata:(id)a16 iconSystemImageName:(id)a17 customIntentClassName:(id)a18 shortcutsMetadata:(id)a19
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, a13, a14, a15, a16,
           a17,
           a18,
           a19);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 presentationStyle:(int64_t)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 iconSystemImageName:(id)a18 customIntentClassName:(id)a19 shortcutsMetadata:(id)a20
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:shortcutsMetadata:", a3, a4, a5, a6, a7, a8);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 description:(id)a9 presentationStyle:(int64_t)a10 outputType:(id)a11 parameters:(id)a12 systemProtocols:(id)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  LNActionDescriptionMetadata *v31;
  LNActionDescriptionMetadata *v32;
  id v35;
  LNActionMetadata *v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v41 = a3;
  v40 = a4;
  v39 = a5;
  v38 = a6;
  v35 = a8;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  if (a9)
  {
    v30 = a9;
    v31 = [LNActionDescriptionMetadata alloc];
    v32 = -[LNActionDescriptionMetadata initWithDescriptionText:categoryName:searchKeywords:resultValueName:](v31, "initWithDescriptionText:categoryName:searchKeywords:resultValueName:", v30, 0, MEMORY[0x1E0C9AA60], 0);

  }
  else
  {
    v32 = 0;
  }
  v37 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:", v41, v40, v39, v38, a7, v35, v32, a10, 0, v22, v23, v24, v25, v26, v27,
          v29,
          v28);

  return v37;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  LNActionMetadata *v27;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v35;
  id v37;
  id v38;

  v32 = (void *)MEMORY[0x1E0C99E40];
  v33 = a17;
  v31 = a16;
  v38 = a15;
  v37 = a14;
  v19 = a13;
  v20 = a12;
  v21 = a11;
  v22 = a10;
  v23 = a8;
  v24 = a7;
  v30 = a4;
  v25 = a3;
  objc_msgSend(v32, "orderedSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  v27 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v25, v30, MEMORY[0x1E0C9AA70], v35, 0, v24, v23, a9, v22, v21, v20, v19, v37, v38, v31,
          v33);

  return v27;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 sessionStartingAction:(BOOL)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18 requiresMDMChecks:(BOOL)a19
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  LNActionMetadata *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;

  v42 = a3;
  v40 = a4;
  v39 = a5;
  v38 = a7;
  v37 = a8;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v30 = a18;
  v41 = (void *)objc_msgSend(v25, "mutableCopy");
  if (a13)
  {
    +[LNSystemProtocol sessionStartingProtocol](LNSystemProtocol, "sessionStartingProtocol");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v31);

  }
  if (a19)
  {
    +[LNSystemProtocol requiresMDMChecksProtocol](LNSystemProtocol, "requiresMDMChecksProtocol");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v32);

  }
  v36 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v42, v40, MEMORY[0x1E0C9AA70], v39, a6, v38, v37, a9, v23, v24, v25, v26, v27, v28, v29,
          v30);

  return v36;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 sessionStartingAction:(BOOL)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", a3, a4, MEMORY[0x1E0C9AA70], a5, a6, a7);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17
{
  uint64_t v18;

  LOBYTE(v18) = a12;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", a3, a4, a5, 0, a6, a7, a8, a9, a10, a11, v18, a13, a14, a15, a16,
           a17);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  LNEffectiveBundleIdentifier *v25;
  void *v26;
  void *v27;
  LNActionMetadata *v28;
  LNActionMetadata *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  Class v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  LNActionMetadata *v59;
  id v60;

  v19 = a5;
  v55 = (void *)MEMORY[0x1E0C99E40];
  v60 = v19;
  if (v19)
  {
    v39 = a3;
    v46 = a17;
    v44 = a16;
    v20 = a15;
    v21 = a14;
    v42 = a13;
    v48 = a11;
    v22 = a10;
    v23 = a9;
    v24 = a7;
    v37 = a6;
    v38 = a4;
    v51 = v39;
    v25 = -[LNEffectiveBundleIdentifier initWithType:bundleIdentifier:url:]([LNEffectiveBundleIdentifier alloc], "initWithType:bundleIdentifier:url:", 0, v60, 0);
    v26 = v55;
    v56 = v25;
    objc_msgSend(v26, "orderedSetWithObject:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v36) = a12;
    v27 = v24;
    v28 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v51, v38, v54, 0, v37, v24, a8, v23, v22, v48, v36, v42, v21, v20, v44,
            v46);

    v29 = v28;
  }
  else
  {
    v30 = a17;
    v31 = a16;
    v47 = a15;
    v45 = a14;
    v43 = a13;
    v41 = (Class)a11;
    v49 = a10;
    v32 = a9;
    v40 = a7;
    v52 = a6;
    v33 = a4;
    v34 = a3;
    objc_msgSend(v55, "orderedSet");
    LOBYTE(v36) = a12;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v34, v33, a8, v32, v49, v41, v36, v43, v45, v47, v31, v30);

    v29 = v59;
  }

  return v29;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 iconSystemImageName:(id)a14 shortcutsMetadata:(id)a15 customIntentClassName:(id)a16
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  LNEffectiveBundleIdentifier *v24;
  void *v25;
  void *v26;
  LNActionMetadata *v27;
  LNActionMetadata *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  Class v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  LNActionMetadata *v57;
  id v58;

  v18 = a5;
  v53 = (void *)MEMORY[0x1E0C99E40];
  v58 = v18;
  if (v18)
  {
    v44 = a16;
    v42 = a15;
    v19 = a14;
    v20 = a13;
    v40 = a12;
    v46 = a11;
    v21 = a10;
    v22 = a9;
    v23 = a7;
    v37 = a6;
    v36 = a4;
    v49 = a3;
    v24 = -[LNEffectiveBundleIdentifier initWithType:bundleIdentifier:url:]([LNEffectiveBundleIdentifier alloc], "initWithType:bundleIdentifier:url:", 0, v58, 0);
    v25 = v53;
    v54 = v24;
    objc_msgSend(v25, "orderedSetWithObject:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = 0;
    v26 = v23;
    v27 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v49, v36, v51, 0, v37, v23, a8, v22, v21, v46, v35, v40, v20, v19, v42,
            v44);

    v28 = v27;
  }
  else
  {
    v29 = a16;
    v30 = a15;
    v45 = a14;
    v43 = a13;
    v41 = a12;
    v39 = (Class)a11;
    v47 = a10;
    v31 = a9;
    v38 = a7;
    v32 = a6;
    v52 = a4;
    v33 = a3;
    objc_msgSend(v53, "orderedSet");
    LOBYTE(v35) = 0;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v33, v52, a8, v31, v47, v39, v35, v41, v43, v45, v30, v29);

    v28 = v57;
  }

  return v28;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 iconSystemImageName:(id)a14 shortcutsMetadata:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  LNEffectiveBundleIdentifier *v23;
  void *v24;
  void *v25;
  LNActionMetadata *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v45;
  void *v46;
  void *v47;
  LNActionMetadata *v50;
  LNActionMetadata *v51;
  id v52;

  v18 = a5;
  v46 = (void *)MEMORY[0x1E0C99E40];
  v52 = v18;
  if (v18)
  {
    v43 = a15;
    v42 = a13;
    v41 = a12;
    v19 = a11;
    v40 = a10;
    v20 = a9;
    v39 = a7;
    v21 = a6;
    v22 = a4;
    v45 = a3;
    v23 = -[LNEffectiveBundleIdentifier initWithType:bundleIdentifier:url:]([LNEffectiveBundleIdentifier alloc], "initWithType:bundleIdentifier:url:", 0, v52, 0);
    v24 = v46;
    v47 = v23;
    objc_msgSend(v24, "orderedSetWithObject:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v38) = 0;
    v50 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v45, v22, v25, 0, v21, v39, a8, v20, v40, v19, v38, v41, v42, 0, v43,
            0);

    v26 = v50;
  }
  else
  {
    v27 = a15;
    v28 = a13;
    v29 = a12;
    v30 = a11;
    v31 = a10;
    v32 = a9;
    v33 = a7;
    v34 = a6;
    v35 = a4;
    v36 = a3;
    objc_msgSend(v46, "orderedSet");
    LOBYTE(v38) = 0;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v36, v35, a8, v32, v31, v30, v38, v29, v28, 0, v27, 0);

    v26 = v51;
  }

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 iconSystemImageName:(id)a13 shortcutsMetadata:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  LNEffectiveBundleIdentifier *v24;
  void *v25;
  LNActionMetadata *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v44;
  void *v45;
  void *v46;
  LNActionMetadata *v49;
  LNActionMetadata *v50;
  id v51;

  v17 = a4;
  v45 = (void *)MEMORY[0x1E0C99E40];
  v51 = v17;
  if (v17)
  {
    v42 = a14;
    v41 = a13;
    v40 = a12;
    v18 = a11;
    v39 = a10;
    v19 = a9;
    v20 = a8;
    v21 = a6;
    v22 = a5;
    v23 = a3;
    v24 = -[LNEffectiveBundleIdentifier initWithType:bundleIdentifier:url:]([LNEffectiveBundleIdentifier alloc], "initWithType:bundleIdentifier:url:", 0, v51, 0);
    v25 = v45;
    v46 = v24;
    objc_msgSend(v25, "orderedSetWithObject:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v38) = 0;
    v49 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v23, v44, 0, v22, v21, a7, v20, v19, v39, v38, v18, v40, v41, v42,
            0);

    v26 = v49;
  }
  else
  {
    v27 = a14;
    v28 = a13;
    v29 = a12;
    v30 = a11;
    v31 = a10;
    v32 = a9;
    v33 = a8;
    v34 = a6;
    v35 = a5;
    v36 = a3;
    objc_msgSend(v45, "orderedSet");
    LOBYTE(v38) = 0;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v36, v36, a7, v33, v32, v31, v38, v30, v29, v28, v27, 0);

    v26 = v50;
  }

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 shortcutsMetadata:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  LNActionMetadata *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  LNEffectiveBundleIdentifier *v41;
  void *v42;
  LNActionMetadata *v45;
  LNActionMetadata *v46;
  id v47;

  v16 = a4;
  v42 = (void *)MEMORY[0x1E0C99E40];
  v47 = v16;
  if (v16)
  {
    v17 = a13;
    v18 = a12;
    v19 = a11;
    v38 = a10;
    v20 = a9;
    v21 = a8;
    v36 = a6;
    v22 = a5;
    v23 = a3;
    v41 = -[LNEffectiveBundleIdentifier initWithType:bundleIdentifier:url:]([LNEffectiveBundleIdentifier alloc], "initWithType:bundleIdentifier:url:", 0, v47, 0);
    objc_msgSend(v42, "orderedSetWithObject:", v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = 0;
    v45 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v23, v24, 0, v22, v36, a7, v21, v20, v38, v35, v19, v18, 0, v17,
            0);

    v25 = v41;
    v26 = v45;

  }
  else
  {
    v39 = a13;
    v37 = a12;
    v27 = a11;
    v28 = a10;
    v29 = a9;
    v30 = a8;
    v31 = a6;
    v32 = a5;
    v33 = a3;
    objc_msgSend(v42, "orderedSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = 0;
    v46 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v33, v33, v25, 0, v32, v31, a7, v30, v29, v28, v35, v27, v37, 0, v39,
            0);

    v26 = v46;
  }

  return v26;
}

- (LNStaticDeferredLocalizedString)actionDescription
{
  void *v2;
  void *v3;

  -[LNActionMetadata descriptionMetadata](self, "descriptionMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNStaticDeferredLocalizedString *)v3;
}

- (NSString)effectiveBundleIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[LNActionMetadata effectiveBundleIdentifiers](self, "effectiveBundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E39A2988;
  v6 = v4;

  return v6;
}

- (int64_t)presentationStyle
{
  if (-[LNActionMetadata openAppWhenRun](self, "openAppWhenRun"))
    return 2;
  else
    return 0;
}

- (NSString)iconSystemImageName
{
  return 0;
}

- (BOOL)isSessionStartingAction
{
  void *v2;
  void *v3;
  char v4;

  -[LNActionMetadata systemProtocols](self, "systemProtocols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[LNSystemProtocol sessionStartingProtocol](LNSystemProtocol, "sessionStartingProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)requiresMDMChecks
{
  void *v2;
  void *v3;
  char v4;

  -[LNActionMetadata systemProtocols](self, "systemProtocols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[LNSystemProtocol requiresMDMChecksProtocol](LNSystemProtocol, "requiresMDMChecksProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27 fullyQualifiedTypeName:(id)a28
{
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v41;
  id v42;
  id v45;
  void *v47;
  LNActionMetadata *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;

  v39 = (void *)MEMORY[0x1E0CB37E8];
  v42 = a27;
  v29 = a26;
  v38 = a25;
  v37 = a24;
  v36 = a23;
  v35 = a22;
  v52 = a21;
  v51 = a20;
  v60 = a19;
  v59 = a18;
  v58 = a17;
  v57 = a16;
  v56 = a15;
  v55 = a13;
  v54 = a10;
  v53 = a9;
  v41 = a8;
  v30 = a6;
  v31 = a5;
  v45 = a4;
  v32 = a3;
  objc_msgSend(v39, "numberWithInteger:", a12);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v34) = a11;
  v50 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v32, v45, v31, v30, a7, v41, v53, v54, v34, v47, v55, a14, v56,
          v57,
          v58,
          v59,
          v60,
          v51,
          v52,
          v35,
          v36,
          v37,
          v38,
          v29,
          v42,
          0);

  return v50;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27
{
  uint64_t v28;

  LOBYTE(v28) = a11;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", a3, a4, a5, a6, a7, a8, a9, a10, v28, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25 assistantDefinedSchemas:(id)a26 assistantDefinedSchemaTraits:(id)a27
{
  id v27;
  id v28;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v40;
  id v42;
  LNVisibilityMetadata *v43;
  void *v44;
  LNActionMetadata *v47;
  id v49;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;

  v42 = a27;
  v27 = a26;
  v38 = a25;
  v37 = a24;
  v36 = a23;
  v33 = a22;
  v32 = a21;
  v31 = a20;
  v58 = a19;
  v57 = a18;
  v56 = a17;
  v53 = a16;
  v52 = a14;
  v55 = a10;
  v54 = a9;
  v35 = a8;
  v51 = a6;
  v49 = a5;
  v40 = a4;
  v28 = a3;
  v43 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", a12, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a13);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = a11;
  v47 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v28, v40, v49, v51, a7, v35, v54, v55, v30, v44, v52, a15, v53,
          v56,
          v57,
          v58,
          v31,
          v32,
          v33,
          v36,
          v37,
          v38,
          v27,
          v42,
          v43,
          0);

  return v47;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25 assistantDefinedSchemas:(id)a26
{
  uint64_t v27;

  LOWORD(v27) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:", a3, a4, a5, a6, a7, a8, a9, a10, v27, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25
{
  uint64_t v26;

  LOWORD(v26) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:", a3, a4, a5, a6, a7, a8, a9, a10, v26, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24
{
  uint64_t v25;

  LOWORD(v25) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:", a3, a4, a5, a6, a7, a8, a9, a10, v25, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 openAppWhenRun:(BOOL)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 outputFlags:(unint64_t)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v32;
  LNActionMetadata *v36;

  v28 = (void *)MEMORY[0x1E0C99E40];
  v30 = a15;
  v29 = a14;
  v27 = a13;
  v18 = a12;
  v19 = a11;
  v20 = a9;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v28, "orderedSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = a7;
  v36 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", v24, v23, v21, v26, a8, v20, a10, v19, v18, v27, v29, v30, 0, MEMORY[0x1E0C9AA70]);

  return v36;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 presentationStyle:(int64_t)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 outputFlags:(unint64_t)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:", a3, a4, a5, a6, a7 != 0, a8);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 presentationStyle:(int64_t)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:", a3, a4, a5, a6, a7, a8, a9, 0, a10, a11, a12, a13, a14);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 customIntentClassName:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  void *v25;
  id v27;
  id v28;
  void *v30;
  LNActionMetadata *v33;

  v25 = (void *)MEMORY[0x1E0C99E40];
  v28 = a13;
  v27 = a12;
  v24 = a11;
  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v25, "orderedSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v22, v21, v19, a7, v18, v17, v16, v24, v27, 0, MEMORY[0x1E0C9AA70], v28);

  return v33;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v30;
  LNActionMetadata *v33;

  v25 = (void *)MEMORY[0x1E0C99E40];
  v27 = a14;
  v26 = a13;
  v24 = a12;
  v16 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a7;
  v20 = a6;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v25, "orderedSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v22, v21, v19, a8, v18, v17, v16, v24, v26, 0, MEMORY[0x1E0C9AA70], v27);

  return v33;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v31;
  LNActionMetadata *v34;

  v26 = (void *)MEMORY[0x1E0C99E40];
  v28 = a15;
  v27 = a14;
  v25 = a13;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v26, "orderedSet");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v22, v20, a8, v19, v18, v17, v25, v27, 0, MEMORY[0x1E0C9AA70], v28);

  return v34;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v31;
  LNActionMetadata *v34;

  v26 = (void *)MEMORY[0x1E0C99E40];
  v28 = a15;
  v27 = a14;
  v25 = a13;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v26, "orderedSet");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v22, v20, a8, v19, v18, v17, v25, v27, 0, MEMORY[0x1E0C9AA70], v28);

  return v34;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v30;
  LNActionMetadata *v33;

  v25 = (void *)MEMORY[0x1E0C99E40];
  v27 = a14;
  v26 = a13;
  v24 = a12;
  v16 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a7;
  v20 = a6;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v25, "orderedSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v22, v21, v19, a8, v18, v17, v16, v24, v26, 0, MEMORY[0x1E0C9AA70], v27);

  return v33;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v27;
  LNActionMetadata *v31;

  v27 = (void *)MEMORY[0x1E0C99E40];
  v16 = a13;
  v17 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a7;
  v22 = a6;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v27, "orderedSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v24, v23, v21, a8, v20, v19, v18, v17, v16, 0, MEMORY[0x1E0C9AA70], 0);

  return v31;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  LNActionMetadata *v26;

  v16 = (void *)MEMORY[0x1E0C99E40];
  v17 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  objc_msgSend(v16, "orderedSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v24, v24, v22, a7, v21, v20, v19, v18, v17, 0, MEMORY[0x1E0C9AA70], 0);

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 title:(id)a4 description:(id)a5 presentationStyle:(int64_t)a6 outputType:(id)a7 parameters:(id)a8 systemProtocols:(id)a9 actionConfiguration:(id)a10
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  LNActionMetadata *v26;

  v17 = (void *)MEMORY[0x1E0C99E40];
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v17, "orderedSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v24, v24, v22, a6, v21, v20, v19, v18, MEMORY[0x1E0C9AA70], 0, MEMORY[0x1E0C9AA70], 0);

  return v26;
}

@end
