@implementation LNQueryMetadata

- (NSArray)parameters
{
  return self->_parameters;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_descriptionMetadata, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_sortingOptions, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  -[LNQueryMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
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
    -[LNQueryMetadata mangledTypeName](self, "mangledTypeName");
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
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("effectiveBundleIdentifiers"));

  }
  v9 = (_QWORD *)-[LNQueryMetadata copy](self, "copy");
  objc_msgSend(v9, "effectiveBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "if_orderedSetByAddingObjectsFromArray:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v9[9];
  v9[9] = v12;

  objc_msgSend(v9, "mangledTypeNameByBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v9[8];
  v9[8] = v15;

  return v9;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (NSDictionary)mangledTypeNameByBundleIdentifier
{
  return self->_mangledTypeNameByBundleIdentifier;
}

- (NSString)entityType
{
  return self->_entityType;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13 defaultQueryForEntity:(BOOL)a14 fullyQualifiedIdentifier:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  LNQueryMetadata *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *identifier;
  uint64_t v36;
  NSString *entityType;
  uint64_t v38;
  NSArray *parameters;
  uint64_t v40;
  NSArray *sortingOptions;
  uint64_t v42;
  NSString *mangledTypeName;
  uint64_t v44;
  NSDictionary *mangledTypeNameByBundleIdentifier;
  uint64_t v46;
  NSOrderedSet *effectiveBundleIdentifiers;
  uint64_t v48;
  NSDictionary *availabilityAnnotations;
  uint64_t v50;
  LNActionDescriptionMetadata *descriptionMetadata;
  uint64_t v52;
  LNVisibilityMetadata *visibilityMetadata;
  uint64_t v54;
  NSString *fullyQualifiedIdentifier;
  LNQueryMetadata *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v65;
  id v66;
  id v68;
  void *v69;
  objc_super v70;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v66 = a6;
  v65 = a7;
  v23 = a8;
  v24 = a9;
  v68 = a10;
  v25 = a12;
  v26 = a13;
  v27 = a15;
  v69 = v20;
  if (v20)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v21)
    {
LABEL_3:
      if (v23)
        goto LABEL_4;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

      if (v24)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityType"));

  if (!v23)
    goto LABEL_14;
LABEL_4:
  if (v24)
    goto LABEL_5;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortingOptions"));

LABEL_5:
  v28 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mangledTypeName"));

  }
  v29 = v21;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryMetadata.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visibilityMetadata"));

  }
  v70.receiver = self;
  v70.super_class = (Class)LNQueryMetadata;
  v30 = -[LNQueryMetadata init](&v70, sel_init);
  v31 = v29;
  v32 = v27;
  v33 = v31;
  if (v30)
  {
    v34 = objc_msgSend(v69, "copy");
    identifier = v30->_identifier;
    v30->_identifier = (NSString *)v34;

    v36 = objc_msgSend(v33, "copy");
    entityType = v30->_entityType;
    v30->_entityType = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    parameters = v30->_parameters;
    v30->_parameters = (NSArray *)v38;

    v40 = objc_msgSend(v24, "copy");
    sortingOptions = v30->_sortingOptions;
    v30->_sortingOptions = (NSArray *)v40;

    v42 = objc_msgSend(v28, "copy");
    mangledTypeName = v30->_mangledTypeName;
    v30->_mangledTypeName = (NSString *)v42;

    v44 = objc_msgSend(v66, "copy");
    mangledTypeNameByBundleIdentifier = v30->_mangledTypeNameByBundleIdentifier;
    v30->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v44;

    v46 = objc_msgSend(v65, "copy");
    effectiveBundleIdentifiers = v30->_effectiveBundleIdentifiers;
    v30->_effectiveBundleIdentifiers = (NSOrderedSet *)v46;

    v48 = objc_msgSend(v68, "copy");
    availabilityAnnotations = v30->_availabilityAnnotations;
    v30->_availabilityAnnotations = (NSDictionary *)v48;

    v30->_capabilities = a11;
    v50 = objc_msgSend(v25, "copy");
    descriptionMetadata = v30->_descriptionMetadata;
    v30->_descriptionMetadata = (LNActionDescriptionMetadata *)v50;

    v52 = objc_msgSend(v26, "copy");
    visibilityMetadata = v30->_visibilityMetadata;
    v30->_visibilityMetadata = (LNVisibilityMetadata *)v52;

    v30->_defaultQueryForEntity = a14;
    v54 = objc_msgSend(v32, "copy");
    fullyQualifiedIdentifier = v30->_fullyQualifiedIdentifier;
    v30->_fullyQualifiedIdentifier = (NSString *)v54;

    v56 = v30;
  }

  return v30;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  void *v4;

  -[LNQueryMetadata visibilityMetadata](self, "visibilityMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "visibleForUse:", a3);

  return a3;
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
  id v15;

  v4 = a3;
  -[LNQueryMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNQueryMetadata entityType](self, "entityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("entityType"));

  -[LNQueryMetadata parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parameters"));

  -[LNQueryMetadata sortingOptions](self, "sortingOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sortingOptions"));

  -[LNQueryMetadata mangledTypeName](self, "mangledTypeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("mangledTypeName"));

  -[LNQueryMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("mangledTypeNameByBundleIdentifier"));

  -[LNQueryMetadata effectiveBundleIdentifiers](self, "effectiveBundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("effectiveBundleIdentifiers"));

  -[LNQueryMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("availabilityAnnotations"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNQueryMetadata capabilities](self, "capabilities"), CFSTR("capabilities"));
  -[LNQueryMetadata descriptionMetadata](self, "descriptionMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("descriptionMetadata"));

  -[LNQueryMetadata visibilityMetadata](self, "visibilityMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("visibilityMetadata"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNQueryMetadata defaultQueryForEntity](self, "defaultQueryForEntity"), CFSTR("defaultQueryForEntity"));
  -[LNQueryMetadata fullyQualifiedIdentifier](self, "fullyQualifiedIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("fullyQualifiedIdentifier"));

}

- (LNQueryMetadata)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  LNQueryMetadata *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  LNVisibilityMetadata *v35;
  char v36;
  void *v37;
  LNQueryMetadata *v38;
  uint64_t v39;
  void *v40;
  LNQueryMetadata *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("parameters"));
  v56 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("sortingOptions"));
  v55 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledTypeName"));
  v54 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("effectiveBundleIdentifiers"));
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = v17;
  v20 = (void *)v4;
  objc_msgSend(v16, "setWithObjects:", v19, v18, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v21, CFSTR("mangledTypeNameByBundleIdentifier"));
  v53 = objc_claimAutoreleasedReturnValue();

  v22 = 0;
  if (!v4)
  {
    v41 = self;
    v24 = (void *)v53;
    goto LABEL_12;
  }
  v23 = (void *)v15;
  v24 = (void *)v53;
  if (!v5)
  {
    v41 = self;
    v25 = (void *)v56;
    goto LABEL_18;
  }
  v25 = (void *)v56;
  if (!v56)
  {
    v41 = self;
LABEL_18:
    v26 = (void *)v55;
    goto LABEL_19;
  }
  v26 = (void *)v55;
  if (!v55)
  {
    v41 = self;
LABEL_19:
    v27 = (void *)v54;
    goto LABEL_20;
  }
  v27 = (void *)v54;
  if (!v54 || !v53)
  {
    v41 = self;
LABEL_20:
    v42 = v3;
    v40 = v23;
    goto LABEL_21;
  }
  v15 = (uint64_t)v23;
  if (!v23)
  {
    v41 = self;
LABEL_12:
    v42 = v3;
    v40 = (void *)v15;
    v26 = (void *)v55;
    v25 = (void *)v56;
    v27 = (void *)v54;
    goto LABEL_21;
  }
  v50 = v20;
  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v31, CFSTR("availabilityAnnotations"));
  v32 = objc_claimAutoreleasedReturnValue();

  v33 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("capabilities"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptionMetadata"));
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visibilityMetadata"));
  v35 = (LNVisibilityMetadata *)objc_claimAutoreleasedReturnValue();
  if (!v35)
    v35 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", 1, 0);
  v36 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("defaultQueryForEntity"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullyQualifiedIdentifier"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v47) = v36;
  v46 = v34;
  v44 = v32;
  v45 = v33;
  v49 = (void *)v32;
  v26 = (void *)v55;
  v38 = self;
  v27 = (void *)v54;
  v52 = (void *)v34;
  v24 = (void *)v53;
  v39 = v15;
  v48 = v3;
  v40 = (void *)v15;
  v25 = (void *)v56;
  v41 = -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:defaultQueryForEntity:fullyQualifiedIdentifier:](v38, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:defaultQueryForEntity:fullyQualifiedIdentifier:", v50, v5, v54, v53, v39, v56, v55, v44, v45, v46, v35, v47, v37);

  v20 = v50;
  v42 = v48;

  v22 = v41;
LABEL_21:

  return v22;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryMetadata fullyQualifiedIdentifier](self, "fullyQualifiedIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;
  if (!v21)
  {
    -[LNQueryMetadata identifier](self, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[LNQueryMetadata entityType](self, "entityType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryMetadata parameters](self, "parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKeyPath:", CFSTR("description"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryMetadata sortingOptions](self, "sortingOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryMetadata descriptionMetadata](self, "descriptionMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryMetadata visibilityMetadata](self, "visibilityMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LNQueryMetadata defaultQueryForEntity](self, "defaultQueryForEntity");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, entityType: %@, mangledTypeNameByBundleIdentifier: %@, parameters: [%@], sortingOptions: [%@], availabilityAnnotations: %@, descriptionMetadata: %@, visibility: %@, defaultEntityQuery: %@>"), v22, self, v21, v16, v4, v5, v8, v9, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  return (NSString *)v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  -[LNQueryMetadata identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNQueryMetadata entityType](self, "entityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNQueryMetadata parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNQueryMetadata sortingOptions](self, "sortingOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[LNQueryMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[LNQueryMetadata descriptionMetadata](self, "descriptionMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[LNQueryMetadata visibilityMetadata](self, "visibilityMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = -[LNQueryMetadata defaultQueryForEntity](self, "defaultQueryForEntity");
  -[LNQueryMetadata fullyQualifiedIdentifier](self, "fullyQualifiedIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  LNQueryMetadata *v4;
  LNQueryMetadata *v5;
  LNQueryMetadata *v6;
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
  id v47;
  void *v48;
  int v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;

  v4 = (LNQueryMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_72:

      goto LABEL_73;
    }
    -[LNQueryMetadata identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryMetadata identifier](v6, "identifier");
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
        goto LABEL_70;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_71:

        goto LABEL_72;
      }
    }
    -[LNQueryMetadata entityType](self, "entityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryMetadata entityType](v6, "entityType");
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
        goto LABEL_69;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_70:

        goto LABEL_71;
      }
    }
    -[LNQueryMetadata parameters](self, "parameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryMetadata parameters](v6, "parameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v67 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_68;
      v12 = objc_msgSend(v20, "isEqualToArray:", v24);

      if (!v12)
        goto LABEL_69;
    }
    v66 = v19;
    -[LNQueryMetadata sortingOptions](self, "sortingOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryMetadata sortingOptions](v6, "sortingOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v64 = v29;
    v65 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v66;
        goto LABEL_66;
      }
      v30 = v29;
      v19 = v66;
      if (!v29)
      {
LABEL_66:

        goto LABEL_67;
      }
      v31 = objc_msgSend(v28, "isEqualToArray:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v66;
LABEL_67:
        v25 = v64;
        v20 = v65;
LABEL_68:

        v20 = v67;
LABEL_69:

        goto LABEL_70;
      }
    }
    -[LNQueryMetadata availabilityAnnotations](self, "availabilityAnnotations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryMetadata availabilityAnnotations](v6, "availabilityAnnotations");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v62 = v28;
    v63 = v34;
    if (v28 != v34)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v35 = v34;
        v19 = v66;
        if (v34)
        {
          v36 = objc_msgSend(v28, "isEqualToDictionary:", v34);

          if (!v36)
          {
            LOBYTE(v12) = 0;
            v19 = v66;
            v30 = v63;
            goto LABEL_66;
          }
LABEL_36:
          -[LNQueryMetadata descriptionMetadata](self, "descriptionMetadata");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNQueryMetadata descriptionMetadata](v6, "descriptionMetadata");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v37;
          v40 = v38;
          v60 = v40;
          v61 = v39;
          if (v39 != v40)
          {
            LOBYTE(v12) = 0;
            if (v39)
            {
              v41 = v40;
              v19 = v66;
              if (v40)
              {
                v42 = objc_msgSend(v39, "isEqual:", v40);

                if (!v42)
                {
                  LOBYTE(v12) = 0;
                  v19 = v66;
LABEL_64:
                  v35 = v60;
                  v28 = v61;
                  goto LABEL_65;
                }
LABEL_43:
                -[LNQueryMetadata visibilityMetadata](self, "visibilityMetadata");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[LNQueryMetadata visibilityMetadata](v6, "visibilityMetadata");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v43;
                v45 = v44;
                v59 = v45;
                if (v39 != v45)
                {
                  LOBYTE(v12) = 0;
                  if (v39)
                  {
                    v46 = v45;
                    v47 = v39;
                    v19 = v66;
                    if (v45)
                    {
                      v48 = v45;
                      v49 = objc_msgSend(v39, "isEqual:", v45);

                      if (!v49)
                        goto LABEL_51;
LABEL_50:
                      v50 = -[LNQueryMetadata defaultQueryForEntity](self, "defaultQueryForEntity");
                      if (v50 != -[LNQueryMetadata defaultQueryForEntity](v6, "defaultQueryForEntity"))
                      {
LABEL_51:
                        LOBYTE(v12) = 0;
                        v19 = v66;
LABEL_62:
                        v41 = v59;
                        goto LABEL_63;
                      }
                      -[LNQueryMetadata fullyQualifiedIdentifier](self, "fullyQualifiedIdentifier");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNQueryMetadata fullyQualifiedIdentifier](v6, "fullyQualifiedIdentifier");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      v53 = v51;
                      v54 = v52;
                      v55 = v53;
                      v58 = v54;
                      if (v53 == v54)
                      {
                        LOBYTE(v12) = 1;
                      }
                      else
                      {
                        LOBYTE(v12) = 0;
                        if (v53)
                        {
                          v19 = v66;
                          if (v54)
                            LOBYTE(v12) = objc_msgSend(v55, "isEqualToString:", v54);
                          goto LABEL_60;
                        }
                      }
                      v19 = v66;
LABEL_60:

                      v46 = v58;
                      v47 = v55;
                    }
                  }
                  else
                  {
                    v46 = v45;
                    v47 = 0;
                    v19 = v66;
                  }
                  v56 = v47;

                  goto LABEL_62;
                }

                goto LABEL_50;
              }
            }
            else
            {
              v41 = v40;
              v19 = v66;
            }
LABEL_63:

            goto LABEL_64;
          }

          goto LABEL_43;
        }
      }
      else
      {
        v35 = v34;
        v19 = v66;
      }
LABEL_65:

      v28 = v62;
      v30 = v63;
      goto LABEL_66;
    }

    goto LABEL_36;
  }
  LOBYTE(v12) = 1;
LABEL_73:

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)fullyQualifiedIdentifier
{
  return self->_fullyQualifiedIdentifier;
}

- (BOOL)defaultQueryForEntity
{
  return self->_defaultQueryForEntity;
}

- (NSArray)sortingOptions
{
  return self->_sortingOptions;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (LNActionDescriptionMetadata)descriptionMetadata
{
  return self->_descriptionMetadata;
}

- (LNVisibilityMetadata)visibilityMetadata
{
  return self->_visibilityMetadata;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)queryType
{
  void *v2;
  void *v3;

  -[LNQueryMetadata identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13 defaultQueryForEntity:(BOOL)a14
{
  uint64_t v15;

  LOBYTE(v15) = a14;
  return -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:defaultQueryForEntity:fullyQualifiedIdentifier:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:defaultQueryForEntity:fullyQualifiedIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, v15, 0);
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13
{
  uint64_t v14;

  LOBYTE(v14) = 0;
  return -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:defaultQueryForEntity:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:defaultQueryForEntity:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, v14);
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  LNVisibilityMetadata *v27;
  LNQueryMetadata *v30;

  v18 = a12;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", 1, 0);
  v30 = -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:visibilityMetadata:", v26, v25, v24, v23, v22, v21, v20, v19, a11, v18, v27);

  return v30;
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11
{
  return -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:descriptionMetadata:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10
{
  return -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:capabilities:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9
{
  return -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:availabilityAnnotations:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 queryType:(id)a4 entityType:(id)a5 mangledTypeName:(id)a6 mangledTypeNameByBundleIdentifier:(id)a7 effectiveBundleIdentifiers:(id)a8 parameters:(id)a9 sortingOptions:(id)a10
{
  return -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:", a3, a5, a6, a7, a8, a9);
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 queryType:(id)a4 entityType:(id)a5 parameters:(id)a6 sortingOptions:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  LNQueryMetadata *v19;

  v12 = (void *)MEMORY[0x1E0C99E40];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "orderedSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[LNQueryMetadata initWithIdentifier:queryType:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:](self, "initWithIdentifier:queryType:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:", v17, v16, v15, v16, MEMORY[0x1E0C9AA70], v18, v14, v13);

  return v19;
}

@end
