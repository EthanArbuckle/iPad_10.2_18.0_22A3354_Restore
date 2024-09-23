@implementation LNEntityMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedTypeName, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemas, 0);
  objc_storeStrong((id *)&self->_attributionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_transferableContentTypes, 0);
  objc_storeStrong((id *)&self->_systemProtocolMetadata, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_customIntentTypeClassName, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  -[LNEntityMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
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
    -[LNEntityMetadata mangledTypeName](self, "mangledTypeName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
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
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("effectiveBundleIdentifiers"));

  }
  v9 = (_QWORD *)-[LNEntityMetadata copy](self, "copy");
  objc_msgSend(v9, "effectiveBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "if_orderedSetByAddingObjectsFromArray:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v9[5];
  v9[5] = v12;

  objc_msgSend(v9, "mangledTypeNameByBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v9[4];
  v9[4] = v15;

  return v9;
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
  id v19;

  v4 = a3;
  -[LNEntityMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntityMetadata isTransient](self, "isTransient"), CFSTR("transient"));
  -[LNEntityMetadata displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayRepresentation"));

  -[LNEntityMetadata properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("properties"));

  -[LNEntityMetadata mangledTypeName](self, "mangledTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("mangledTypeName"));

  -[LNEntityMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("mangledTypeNameByBundleIdentifier"));

  -[LNEntityMetadata effectiveBundleIdentifiers](self, "effectiveBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("effectiveBundleIdentifiers"));

  -[LNEntityMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("availabilityAnnotations"));

  -[LNEntityMetadata requiredCapabilities](self, "requiredCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("requiredCapabilities"));

  -[LNEntityMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("systemProtocolMetadata"));

  -[LNEntityMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("attributionBundleIdentifier"));

  -[LNEntityMetadata transferableContentTypes](self, "transferableContentTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("transferableContentTypes"));

  -[LNEntityMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("assistantDefinedSchemas"));

  -[LNEntityMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("fullyQualifiedTypeName"));

  -[LNEntityMetadata visibilityMetadata](self, "visibilityMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("visibilityMetadata"));

  -[LNEntityMetadata defaultQueryIdentifier](self, "defaultQueryIdentifier");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("defaultQueryIdentifier"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)properties
{
  return self->_properties;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (NSDictionary)mangledTypeNameByBundleIdentifier
{
  return self->_mangledTypeNameByBundleIdentifier;
}

- (NSString)attributionBundleIdentifier
{
  return self->_attributionBundleIdentifier;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (NSDictionary)systemProtocolMetadata
{
  return self->_systemProtocolMetadata;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (LNTypeDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (LNEntityMetadata)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  LNEntityMetadata *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  LNVisibilityMetadata *v43;
  void *v44;
  void *v45;
  LNEntityMetadata *v46;
  void *v47;
  void *v48;
  void *v50;
  id v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("properties"));
  v61 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledTypeName"));
  v60 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("effectiveBundleIdentifiers"));
  v59 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("mangledTypeNameByBundleIdentifier"));
  v58 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v20, CFSTR("systemProtocolMetadata"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = (void *)MEMORY[0x1E0C9AA70];
  if (v21)
    v23 = (void *)v21;
  v56 = v23;

  v24 = 0;
  if (!v4)
  {
    v4 = 0;
    v46 = self;
    v26 = (void *)v60;
    v48 = (void *)v61;
    v25 = (void *)v59;
LABEL_17:
    v27 = (void *)v58;
    goto LABEL_13;
  }
  v25 = (void *)v59;
  if (!v5)
  {
    v46 = self;
    v26 = (void *)v60;
    v48 = (void *)v61;
    goto LABEL_17;
  }
  v26 = (void *)v60;
  v27 = (void *)v58;
  if (!v61 || !v60 || !v58 || !v59)
  {
    v48 = (void *)v61;
    v46 = self;
LABEL_13:
    v47 = v56;
    goto LABEL_14;
  }
  v53 = v5;
  v52 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("transient"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIntentTypeClassName"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v31, CFSTR("availabilityAnnotations"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0C99E60];
  v33 = objc_opt_class();
  objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v34, CFSTR("requiredCapabilities"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionBundleIdentifier"));
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferableContentTypes"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0C99E60];
  v39 = objc_opt_class();
  objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v40, CFSTR("assistantDefinedSchemas"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullyQualifiedTypeName"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visibilityMetadata"));
  v43 = (LNVisibilityMetadata *)objc_claimAutoreleasedReturnValue();
  if (!v43)
    v43 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", 1, 0);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultQueryIdentifier"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v36;
  v51 = v3;
  v45 = (void *)v37;
  v46 = objc_retain(-[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:", v4, v52, v60, v58, v59, v53, v61, v55, v54, v35, v56, v36, v37,
            v41,
            v42,
            v43,
            v44));

  v27 = (void *)v58;
  v25 = (void *)v59;

  v26 = (void *)v60;
  v47 = v56;
  v48 = (void *)v61;

  v3 = v51;
  v5 = v53;

  v24 = v46;
LABEL_14:

  return v24;
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17 visibilityMetadata:(id)a18 defaultQueryIdentifier:(id)a19
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
  void *v33;
  LNEntityMetadata *v34;
  uint64_t v35;
  NSString *identifier;
  uint64_t v37;
  NSString *mangledTypeName;
  uint64_t v39;
  NSDictionary *mangledTypeNameByBundleIdentifier;
  uint64_t v41;
  NSOrderedSet *effectiveBundleIdentifiers;
  uint64_t v43;
  NSArray *properties;
  uint64_t v45;
  NSDictionary *availabilityAnnotations;
  uint64_t v47;
  NSArray *requiredCapabilities;
  uint64_t v49;
  NSDictionary *systemProtocolMetadata;
  uint64_t v51;
  NSString *attributionBundleIdentifier;
  uint64_t v53;
  LNContentTypeMetadata *transferableContentTypes;
  uint64_t v55;
  NSArray *assistantDefinedSchemas;
  uint64_t v57;
  NSString *fullyQualifiedTypeName;
  uint64_t v59;
  LNVisibilityMetadata *visibilityMetadata;
  uint64_t v61;
  NSString *defaultQueryIdentifier;
  LNEntityMetadata *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id obj;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  objc_super v84;

  v23 = a3;
  v24 = a5;
  v77 = a6;
  v82 = a7;
  obj = a8;
  v83 = a8;
  v25 = a9;
  v76 = a10;
  v80 = a11;
  v79 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v75 = a16;
  v29 = a17;
  v30 = a18;
  v74 = a19;
  v81 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mangledTypeName"));

  }
  v31 = v77;
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayRepresentation"));

  }
  v32 = v28;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("properties"));

  }
  v33 = v27;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visibilityMetadata"));

    v31 = v77;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityMetadata.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visibilityMetadata"));

  }
  v84.receiver = self;
  v84.super_class = (Class)LNEntityMetadata;
  v34 = -[LNEntityMetadata init](&v84, sel_init);
  if (v34)
  {
    v35 = objc_msgSend(v81, "copy");
    identifier = v34->_identifier;
    v34->_identifier = (NSString *)v35;

    v34->_transient = a4;
    v37 = objc_msgSend(v24, "copy");
    mangledTypeName = v34->_mangledTypeName;
    v34->_mangledTypeName = (NSString *)v37;

    v39 = objc_msgSend(v31, "copy");
    mangledTypeNameByBundleIdentifier = v34->_mangledTypeNameByBundleIdentifier;
    v34->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v39;

    v41 = objc_msgSend(v82, "copy");
    effectiveBundleIdentifiers = v34->_effectiveBundleIdentifiers;
    v34->_effectiveBundleIdentifiers = (NSOrderedSet *)v41;

    objc_storeStrong((id *)&v34->_displayRepresentation, obj);
    v43 = objc_msgSend(v25, "copy");
    properties = v34->_properties;
    v34->_properties = (NSArray *)v43;

    objc_storeStrong((id *)&v34->_customIntentTypeClassName, a10);
    v45 = objc_msgSend(v80, "copy");
    availabilityAnnotations = v34->_availabilityAnnotations;
    v34->_availabilityAnnotations = (NSDictionary *)v45;

    v47 = objc_msgSend(v79, "copy");
    requiredCapabilities = v34->_requiredCapabilities;
    v34->_requiredCapabilities = (NSArray *)v47;

    v49 = objc_msgSend(v26, "copy");
    systemProtocolMetadata = v34->_systemProtocolMetadata;
    v34->_systemProtocolMetadata = (NSDictionary *)v49;

    v51 = objc_msgSend(v33, "copy");
    attributionBundleIdentifier = v34->_attributionBundleIdentifier;
    v34->_attributionBundleIdentifier = (NSString *)v51;

    v53 = objc_msgSend(v32, "copy");
    transferableContentTypes = v34->_transferableContentTypes;
    v34->_transferableContentTypes = (LNContentTypeMetadata *)v53;

    v55 = objc_msgSend(v75, "copy");
    assistantDefinedSchemas = v34->_assistantDefinedSchemas;
    v34->_assistantDefinedSchemas = (NSArray *)v55;

    v57 = objc_msgSend(v29, "copy");
    fullyQualifiedTypeName = v34->_fullyQualifiedTypeName;
    v34->_fullyQualifiedTypeName = (NSString *)v57;

    v59 = objc_msgSend(v30, "copy");
    visibilityMetadata = v34->_visibilityMetadata;
    v34->_visibilityMetadata = (LNVisibilityMetadata *)v59;

    v61 = objc_msgSend(v74, "copy");
    defaultQueryIdentifier = v34->_defaultQueryIdentifier;
    v34->_defaultQueryIdentifier = (NSString *)v61;

    v63 = v34;
  }

  return v34;
}

- (LNEntityMetadata)entityMetadataWithAttributionBundleIdentifier:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[LNEntityMetadata copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[14];
  v5[14] = v6;

  return (LNEntityMetadata *)v5;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  void *v4;

  -[LNEntityMetadata visibilityMetadata](self, "visibilityMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "visibleForUse:", a3);

  return a3;
}

- (NSString)description
{
  objc_class *v3;
  _BOOL4 v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LNEntityMetadata isTransient](self, "isTransient");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  v16 = v5;
  -[LNEntityMetadata displayRepresentation](self, "displayRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata properties](self, "properties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKeyPath:", CFSTR("description"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata requiredCapabilities](self, "requiredCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata visibilityMetadata](self, "visibilityMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata defaultQueryIdentifier](self, "defaultQueryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, transient: %@, displayRepresentation: %@, mangledTypeNameByBundleIdentifier: %@, properties: [%@], availabilityAnnotations: %@, requiredCapabilities: %@, systemProtocolMetadata: %@, attributionBundleIdentifier: %@, assistantDefinedSchemas: %@, fullyQualifiedTypeName: %@, visibility: %@, query: %@>"), v18, self, v17, v16, v24, v23, v6, v15, v7, v8, v9, v10, v11, v12, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  -[LNEntityMetadata identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v30, "hash");
  v4 = -[LNEntityMetadata isTransient](self, "isTransient");
  -[LNEntityMetadata displayRepresentation](self, "displayRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v29, "hash") ^ v4;
  -[LNEntityMetadata properties](self, "properties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v28, "hash");
  -[LNEntityMetadata customIntentTypeClassName](self, "customIntentTypeClassName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 ^ objc_msgSend(v27, "hash");
  -[LNEntityMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v7 ^ objc_msgSend(v26, "hash");
  -[LNEntityMetadata requiredCapabilities](self, "requiredCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[LNEntityMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[LNEntityMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[LNEntityMetadata transferableContentTypes](self, "transferableContentTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8 ^ v14 ^ objc_msgSend(v15, "hash");
  -[LNEntityMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[LNEntityMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[LNEntityMetadata visibilityMetadata](self, "visibilityMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[LNEntityMetadata defaultQueryIdentifier](self, "defaultQueryIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16 ^ v22 ^ objc_msgSend(v23, "hash");

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  LNEntityMetadata *v4;
  LNEntityMetadata *v5;
  LNEntityMetadata *v6;
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
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;

  v4 = (LNEntityMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_103:

      goto LABEL_104;
    }
    -[LNEntityMetadata identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityMetadata identifier](v6, "identifier");
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
        goto LABEL_101;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_102:

        goto LABEL_103;
      }
    }
    -[LNEntityMetadata displayRepresentation](self, "displayRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityMetadata displayRepresentation](v6, "displayRepresentation");
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
        goto LABEL_100;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_101:

        goto LABEL_102;
      }
    }
    -[LNEntityMetadata properties](self, "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityMetadata properties](v6, "properties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v93 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_99;
      v12 = objc_msgSend(v20, "isEqualToArray:", v24);

      if (!v12)
        goto LABEL_100;
    }
    v92 = v19;
    -[LNEntityMetadata customIntentTypeClassName](self, "customIntentTypeClassName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityMetadata customIntentTypeClassName](v6, "customIntentTypeClassName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v90 = v29;
    v91 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v92;
        goto LABEL_97;
      }
      v30 = v29;
      v19 = v92;
      if (!v29)
      {
LABEL_97:

        goto LABEL_98;
      }
      v31 = objc_msgSend(v28, "isEqualToString:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v92;
LABEL_98:
        v20 = v91;
        v25 = v90;
LABEL_99:

        v20 = v93;
LABEL_100:

        goto LABEL_101;
      }
    }
    -[LNEntityMetadata availabilityAnnotations](self, "availabilityAnnotations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityMetadata availabilityAnnotations](v6, "availabilityAnnotations");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v88 = v28;
    v89 = v34;
    if (v28 != v34)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v35 = v34;
        v19 = v92;
        if (v34)
        {
          v36 = objc_msgSend(v28, "isEqualToDictionary:", v34);

          if (!v36)
          {
            LOBYTE(v12) = 0;
            v19 = v92;
            v30 = v89;
            goto LABEL_97;
          }
LABEL_36:
          -[LNEntityMetadata requiredCapabilities](self, "requiredCapabilities");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEntityMetadata requiredCapabilities](v6, "requiredCapabilities");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v37;
          v40 = v38;
          v86 = v40;
          v87 = v39;
          if (v39 == v40)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v39)
            {
              v41 = v40;
              v19 = v92;
              goto LABEL_94;
            }
            v41 = v40;
            v19 = v92;
            if (!v40)
            {
LABEL_94:

              goto LABEL_95;
            }
            v42 = objc_msgSend(v39, "isEqualToArray:", v40);

            if (!v42)
            {
              LOBYTE(v12) = 0;
              v19 = v92;
LABEL_95:
              v35 = v86;
              v28 = v87;
              goto LABEL_96;
            }
          }
          -[LNEntityMetadata systemProtocolMetadata](self, "systemProtocolMetadata");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEntityMetadata systemProtocolMetadata](v6, "systemProtocolMetadata");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v43;
          v45 = v44;
          v84 = v39;
          v85 = v45;
          if (v39 != v45)
          {
            LOBYTE(v12) = 0;
            if (v39)
            {
              v46 = v45;
              v19 = v92;
              if (v45)
              {
                v47 = objc_msgSend(v39, "isEqualToDictionary:", v45);

                if (!v47)
                {
                  LOBYTE(v12) = 0;
                  v19 = v92;
                  v41 = v85;
                  goto LABEL_94;
                }
LABEL_50:
                -[LNEntityMetadata attributionBundleIdentifier](self, "attributionBundleIdentifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[LNEntityMetadata attributionBundleIdentifier](v6, "attributionBundleIdentifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v48;
                v51 = v49;
                v82 = v51;
                v83 = v50;
                if (v50 == v51)
                {

                }
                else
                {
                  LOBYTE(v12) = 0;
                  if (!v50)
                  {
                    v52 = v51;
                    v19 = v92;
                    goto LABEL_91;
                  }
                  v52 = v51;
                  v19 = v92;
                  if (!v51)
                  {
LABEL_91:

                    goto LABEL_92;
                  }
                  v53 = objc_msgSend(v50, "isEqualToString:", v51);

                  if (!v53)
                  {
                    LOBYTE(v12) = 0;
                    v19 = v92;
LABEL_92:
                    v46 = v82;
                    v39 = v83;
                    goto LABEL_93;
                  }
                }
                -[LNEntityMetadata transferableContentTypes](self, "transferableContentTypes");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[LNEntityMetadata transferableContentTypes](v6, "transferableContentTypes");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v54;
                v56 = v55;
                v80 = v50;
                v81 = v56;
                if (v50 != v56)
                {
                  LOBYTE(v12) = 0;
                  if (v50)
                  {
                    v57 = v56;
                    v19 = v92;
                    if (v56)
                    {
                      v58 = objc_msgSend(v50, "isEqual:", v56);

                      if (!v58)
                      {
                        LOBYTE(v12) = 0;
                        v19 = v92;
                        v52 = v81;
                        goto LABEL_91;
                      }
LABEL_64:
                      -[LNEntityMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNEntityMetadata assistantDefinedSchemas](v6, "assistantDefinedSchemas");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      v61 = v59;
                      v62 = v60;
                      v78 = v62;
                      v79 = v61;
                      if (v61 == v62)
                      {

                      }
                      else
                      {
                        LOBYTE(v12) = 0;
                        if (!v61)
                        {
                          v63 = v62;
                          v19 = v92;
                          goto LABEL_88;
                        }
                        v63 = v62;
                        v19 = v92;
                        if (!v62)
                        {
LABEL_88:

                          goto LABEL_89;
                        }
                        v64 = objc_msgSend(v61, "isEqualToArray:", v62);

                        if (!v64)
                        {
                          LOBYTE(v12) = 0;
                          v19 = v92;
LABEL_89:
                          v57 = v78;
                          v50 = v79;
                          goto LABEL_90;
                        }
                      }
                      -[LNEntityMetadata visibilityMetadata](self, "visibilityMetadata");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNEntityMetadata visibilityMetadata](v6, "visibilityMetadata");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v61 = v65;
                      v67 = v66;
                      v76 = v61;
                      v77 = v67;
                      if (v61 == v67)
                      {

                      }
                      else
                      {
                        LOBYTE(v12) = 0;
                        if (!v61)
                        {
                          v68 = v67;
                          v19 = v92;
                          goto LABEL_87;
                        }
                        v68 = v67;
                        v19 = v92;
                        if (!v67)
                        {
LABEL_87:

                          v61 = v76;
                          v63 = v77;
                          goto LABEL_88;
                        }
                        v69 = objc_msgSend(v61, "isEqual:", v67);

                        if (!v69)
                        {
                          LOBYTE(v12) = 0;
                          v19 = v92;
                          v63 = v77;
                          goto LABEL_88;
                        }
                      }
                      -[LNEntityMetadata defaultQueryIdentifier](self, "defaultQueryIdentifier", v61);
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNEntityMetadata defaultQueryIdentifier](v6, "defaultQueryIdentifier");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      v72 = v70;
                      v73 = v71;
                      v74 = v73;
                      if (v72 == v73)
                      {
                        LOBYTE(v12) = 1;
                      }
                      else
                      {
                        LOBYTE(v12) = 0;
                        if (v72)
                        {
                          v19 = v92;
                          if (v73)
                            LOBYTE(v12) = objc_msgSend(v72, "isEqualToString:", v73);
                          goto LABEL_85;
                        }
                      }
                      v19 = v92;
LABEL_85:

                      v68 = v74;
                      v61 = v72;
                      goto LABEL_87;
                    }
                  }
                  else
                  {
                    v57 = v56;
                    v19 = v92;
                  }
LABEL_90:

                  v50 = v80;
                  v52 = v81;
                  goto LABEL_91;
                }

                goto LABEL_64;
              }
            }
            else
            {
              v46 = v45;
              v19 = v92;
            }
LABEL_93:

            v39 = v84;
            v41 = v85;
            goto LABEL_94;
          }

          goto LABEL_50;
        }
      }
      else
      {
        v35 = v34;
        v19 = v92;
      }
LABEL_96:

      v28 = v88;
      v30 = v89;
      goto LABEL_97;
    }

    goto LABEL_36;
  }
  LOBYTE(v12) = 1;
LABEL_104:

  return v12;
}

- (id)copyWithDescriptiveMetadataFromEntity:(id)a3 usingLibraryKey:(id)a4
{
  id v6;
  _QWORD *v7;
  LNTypeDisplayRepresentation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v25 = a4;
  v6 = a3;
  v7 = (_QWORD *)-[LNEntityMetadata copy](self, "copy");
  v8 = [LNTypeDisplayRepresentation alloc];
  objc_msgSend(v6, "displayRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v9, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata displayRepresentation](self, "displayRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numericFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityMetadata displayRepresentation](self, "displayRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synonyms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[LNTypeDisplayRepresentation initWithName:numericFormat:synonyms:](v8, "initWithName:numericFormat:synonyms:", v10, v12, v14);
  v16 = (void *)v7[7];
  v7[7] = v15;

  objc_msgSend(v6, "identifierIndexedProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNEntityMetadata properties](self, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__LNEntityMetadata_copyWithDescriptiveMetadataFromEntity_usingLibraryKey___block_invoke;
  v26[3] = &unk_1E39A0FA0;
  v27 = v17;
  v28 = v25;
  v19 = v25;
  v20 = v17;
  objc_msgSend(v18, "if_map:", v26);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v7[6];
  v7[6] = v21;

  return v7;
}

- (id)copyWithAdditionalTransferableContentTypes:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  LNContentTypeMetadata *v21;
  void *v22;

  v4 = a3;
  v5 = (_QWORD *)-[LNEntityMetadata copy](self, "copy");
  objc_msgSend(v5, "transferableContentTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exportableTypes");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v10 = (void *)v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;

  objc_msgSend(v5, "transferableContentTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "importableTypes");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v9;
  v16 = v15;

  objc_msgSend(v4, "exportableTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "importableTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[LNContentTypeMetadata initWithExportableTypes:importableTypes:]([LNContentTypeMetadata alloc], "initWithExportableTypes:importableTypes:", v18, v20);
  v22 = (void *)v5[12];
  v5[12] = v21;

  return v5;
}

- (id)identifierIndexedProperties
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[LNEntityMetadata properties](self, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__LNEntityMetadata_identifierIndexedProperties__block_invoke;
  v7[3] = &unk_1E39A0FC8;
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

- (NSString)customIntentTypeClassName
{
  return self->_customIntentTypeClassName;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (LNContentTypeMetadata)transferableContentTypes
{
  return self->_transferableContentTypes;
}

- (NSString)defaultQueryIdentifier
{
  return self->_defaultQueryIdentifier;
}

- (NSArray)assistantDefinedSchemas
{
  return self->_assistantDefinedSchemas;
}

- (NSString)fullyQualifiedTypeName
{
  return self->_fullyQualifiedTypeName;
}

- (LNVisibilityMetadata)visibilityMetadata
{
  return self->_visibilityMetadata;
}

void __47__LNEntityMetadata_identifierIndexedProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
}

id __74__LNEntityMetadata_copyWithDescriptiveMetadataFromEntity_usingLibraryKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v4, "copyWithDescriptiveMetadataFromProperty:usingLibraryKey:", v6, *(_QWORD *)(a1 + 40));
  else
    v7 = objc_msgSend(v4, "copy");
  v8 = (void *)v7;

  return v8;
}

- (LNStaticDeferredLocalizedString)displayTypeName
{
  void *v2;
  void *v3;

  -[LNEntityMetadata displayRepresentation](self, "displayRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNStaticDeferredLocalizedString *)v3;
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17 visibilityMetadata:(id)a18
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           0);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17
{
  id v19;
  id v20;
  LNEntityMetadata *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v28;
  id v29;
  id v31;
  id v32;
  id v33;
  LNVisibilityMetadata *v35;
  id v36;
  _BOOL4 v38;
  id v39;
  id v40;

  v38 = a4;
  v36 = a17;
  v33 = a16;
  v32 = a15;
  v29 = a14;
  v23 = a13;
  v26 = a12;
  v25 = a11;
  v40 = a10;
  v39 = a9;
  v24 = a8;
  v28 = a7;
  v31 = a6;
  v19 = a5;
  v20 = a3;
  v35 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", 1, 0);
  v21 = -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:", v20, v38, v19, v31, v28, v24, v39, v40, v25, v26, v23, v29, v32, v33,
          v36,
          v35);

  return v21;
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, 0);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, 0);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 systemProtocolMetadata:(id)a12 attributionBundleIdentifier:(id)a13
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12, 0);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 systemProtocolMetadata:(id)a12
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:systemProtocolMetadata:attributionBundleIdentifier:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:systemProtocolMetadata:attributionBundleIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:systemProtocolMetadata:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:systemProtocolMetadata:", a3, a4, a5, a6, a7, a8, a9, a10, a11, MEMORY[0x1E0C9AA70]);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayTypeName:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  LNTypeDisplayRepresentation *v23;
  LNEntityMetadata *v24;
  _BOOL4 v26;

  v26 = a4;
  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v23 = -[LNTypeDisplayRepresentation initWithName:numericFormat:]([LNTypeDisplayRepresentation alloc], "initWithName:numericFormat:", v18, 0);

  v24 = -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:", v22, v26, v21, v20, v19, v23, v17, v16);
  return v24;
}

- (LNEntityMetadata)initWithTypeName:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayTypeName:(id)a7 properties:(id)a8 customIntentTypeClassName:(id)a9
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayTypeName:properties:customIntentTypeClassName:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayTypeName:properties:customIntentTypeClassName:", a3, 0, a4, a5, a6, a7, a8, a9);
}

- (LNEntityMetadata)initWithTypeName:(id)a3 displayTypeName:(id)a4 properties:(id)a5 customIntentTypeClassName:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  LNEntityMetadata *v16;

  v10 = (void *)MEMORY[0x1E0C99E40];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "orderedSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[LNEntityMetadata initWithTypeName:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayTypeName:properties:customIntentTypeClassName:](self, "initWithTypeName:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayTypeName:properties:customIntentTypeClassName:", v14, v14, MEMORY[0x1E0C9AA70], v15, v13, v12, v11);

  return v16;
}

- (LNEntityMetadata)initWithTypeName:(id)a3 displayTypeName:(id)a4 properties:(id)a5
{
  return -[LNEntityMetadata initWithTypeName:displayTypeName:properties:customIntentTypeClassName:](self, "initWithTypeName:displayTypeName:properties:customIntentTypeClassName:", a3, a4, a5, 0);
}

- (LNEntityMetadata)initWithTypeName:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  LNStaticDeferredLocalizedString *v8;
  LNEntityMetadata *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[LNStaticDeferredLocalizedString initWithLocalizedKey:bundleIdentifier:bundleURL:table:]([LNStaticDeferredLocalizedString alloc], "initWithLocalizedKey:bundleIdentifier:bundleURL:table:", v7, 0, 0, 0);
  v9 = -[LNEntityMetadata initWithTypeName:displayTypeName:properties:](self, "initWithTypeName:displayTypeName:properties:", v7, v8, v6);

  return v9;
}

@end
