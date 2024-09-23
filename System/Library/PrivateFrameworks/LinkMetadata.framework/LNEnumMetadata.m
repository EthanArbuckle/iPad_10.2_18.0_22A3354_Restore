@implementation LNEnumMetadata

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)cases
{
  return self->_cases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemas, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedTypeName, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_customIntentEnumTypeName, 0);
  objc_storeStrong((id *)&self->_cases, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = (_QWORD *)-[LNEnumMetadata copy](self, "copy");
  objc_msgSend(v8, "effectiveBundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "if_orderedSetByAddingObjectsFromArray:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v8[8];
  v8[8] = v11;

  objc_msgSend(v8, "mangledTypeNameByBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "if_dictionaryByAddingEntriesFromDictionary:", v6);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)v8[7];
  v8[7] = v14;

  return v8;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (NSDictionary)mangledTypeNameByBundleIdentifier
{
  return self->_mangledTypeNameByBundleIdentifier;
}

+ (BOOL)ln_enumIdentifierIsSystem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = sub_19AB82674();
  v5 = static LNEnumMetadata.enumIdentifierIsSystem(enumIdentifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  -[LNEnumMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
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
    -[LNEnumMetadata mangledTypeName](self, "mangledTypeName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12 assistantDefinedSchemas:(id)a13 visibilityMetadata:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  LNEnumMetadata *v31;
  uint64_t v32;
  NSString *identifier;
  uint64_t v34;
  NSString *customIntentEnumTypeName;
  uint64_t v36;
  NSString *mangledTypeName;
  uint64_t v38;
  NSDictionary *mangledTypeNameByBundleIdentifier;
  uint64_t v40;
  NSOrderedSet *effectiveBundleIdentifiers;
  uint64_t v42;
  NSDictionary *availabilityAnnotations;
  uint64_t v44;
  NSString *fullyQualifiedTypeName;
  uint64_t v46;
  NSArray *assistantDefinedSchemas;
  uint64_t v48;
  LNVisibilityMetadata *visibilityMetadata;
  LNEnumMetadata *v50;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id obj;
  id v63;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  objc_super v71;

  v19 = a3;
  v67 = a4;
  v20 = a5;
  v21 = a6;
  obj = a7;
  v22 = a7;
  v63 = a8;
  v69 = a8;
  v23 = a9;
  v24 = a10;
  v68 = a11;
  v66 = a12;
  v25 = a13;
  v26 = a14;
  v70 = v19;
  if (!v19)
  {
    v52 = v26;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    v26 = v52;
  }
  v65 = v22;
  if (!v22)
  {
    v54 = v26;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayRepresentation"));

    v26 = v54;
  }
  v27 = v20;
  v28 = v21;
  if (!v67)
  {
    v56 = v26;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mangledTypeName"));

    v26 = v56;
  }
  v29 = v23;
  if (!v69)
  {
    v58 = v26;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cases"));

    v26 = v58;
  }
  v30 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visibilityMetadata"));

  }
  v71.receiver = self;
  v71.super_class = (Class)LNEnumMetadata;
  v31 = -[LNEnumMetadata init](&v71, sel_init);
  if (v31)
  {
    v32 = objc_msgSend(v70, "copy");
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    objc_storeStrong((id *)&v31->_displayRepresentation, obj);
    objc_storeStrong((id *)&v31->_cases, v63);
    v34 = objc_msgSend(v29, "copy");
    customIntentEnumTypeName = v31->_customIntentEnumTypeName;
    v31->_customIntentEnumTypeName = (NSString *)v34;

    v36 = objc_msgSend(v67, "copy");
    mangledTypeName = v31->_mangledTypeName;
    v31->_mangledTypeName = (NSString *)v36;

    v38 = objc_msgSend(v27, "copy");
    mangledTypeNameByBundleIdentifier = v31->_mangledTypeNameByBundleIdentifier;
    v31->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v38;

    v40 = objc_msgSend(v28, "copy");
    effectiveBundleIdentifiers = v31->_effectiveBundleIdentifiers;
    v31->_effectiveBundleIdentifiers = (NSOrderedSet *)v40;

    v42 = objc_msgSend(v24, "copy");
    availabilityAnnotations = v31->_availabilityAnnotations;
    v31->_availabilityAnnotations = (NSDictionary *)v42;

    objc_storeStrong((id *)&v31->_system, a11);
    v44 = objc_msgSend(v66, "copy");
    fullyQualifiedTypeName = v31->_fullyQualifiedTypeName;
    v31->_fullyQualifiedTypeName = (NSString *)v44;

    v46 = objc_msgSend(v25, "copy");
    assistantDefinedSchemas = v31->_assistantDefinedSchemas;
    v31->_assistantDefinedSchemas = (NSArray *)v46;

    v48 = objc_msgSend(v30, "copy");
    visibilityMetadata = v31->_visibilityMetadata;
    v31->_visibilityMetadata = (LNVisibilityMetadata *)v48;

    v50 = v31;
  }

  return v31;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  void *v4;

  -[LNEnumMetadata visibilityMetadata](self, "visibilityMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "visibleForUse:", a3);

  return a3;
}

- (NSNumber)isSystem
{
  NSNumber *system;
  NSNumber *v3;
  void *v4;
  void *v5;

  system = self->_system;
  if (system)
  {
    v3 = system;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[LNEnumMetadata identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", +[LNEnumMetadata ln_enumIdentifierIsSystem:](LNEnumMetadata, "ln_enumIdentifierIsSystem:", v5));
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata visibilityMetadata](self, "visibilityMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, displayRepresentation: %@, mangledTypeNameByBundleIdentifier: %@, availabilityAnnotations: %@, fullyQualifiedTypeName: %@, assistantDefinedSchemas: %@, visibility: %@>"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  unint64_t v3;
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
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)LNEnumMetadata;
  v3 = -[LNEnumMetadata hash](&v21, sel_hash);
  -[LNEnumMetadata identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNEnumMetadata displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[LNEnumMetadata cases](self, "cases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[LNEnumMetadata customIntentEnumTypeName](self, "customIntentEnumTypeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[LNEnumMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  -[LNEnumMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[LNEnumMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[LNEnumMetadata visibilityMetadata](self, "visibilityMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  LNEnumMetadata *v4;
  LNEnumMetadata *v5;
  LNEnumMetadata *v6;
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
  BOOL v53;
  void *v54;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;

  v4 = (LNEnumMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_69:

      goto LABEL_70;
    }
    -[LNEnumMetadata identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnumMetadata identifier](v6, "identifier");
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
        goto LABEL_67;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_68:

        goto LABEL_69;
      }
    }
    -[LNEnumMetadata displayRepresentation](self, "displayRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnumMetadata displayRepresentation](v6, "displayRepresentation");
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
        goto LABEL_66;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_67:

        goto LABEL_68;
      }
    }
    -[LNEnumMetadata cases](self, "cases");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnumMetadata cases](v6, "cases");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v65 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_65;
      v12 = objc_msgSend(v20, "isEqualToArray:", v24);

      if (!v12)
        goto LABEL_66;
    }
    v64 = v19;
    -[LNEnumMetadata customIntentEnumTypeName](self, "customIntentEnumTypeName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnumMetadata customIntentEnumTypeName](v6, "customIntentEnumTypeName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v62 = v29;
    v63 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v64;
        goto LABEL_63;
      }
      v30 = v29;
      v19 = v64;
      if (!v29)
      {
LABEL_63:

        goto LABEL_64;
      }
      v31 = objc_msgSend(v28, "isEqualToString:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v64;
LABEL_64:
        v25 = v62;
        v20 = v63;
LABEL_65:

        v20 = v65;
LABEL_66:

        goto LABEL_67;
      }
    }
    -[LNEnumMetadata availabilityAnnotations](self, "availabilityAnnotations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnumMetadata availabilityAnnotations](v6, "availabilityAnnotations");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v60 = v28;
    v61 = v34;
    if (v28 != v34)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v35 = v34;
        v19 = v64;
        if (v34)
        {
          v36 = objc_msgSend(v28, "isEqualToDictionary:", v34);

          if (!v36)
          {
            LOBYTE(v12) = 0;
            v19 = v64;
            v30 = v61;
            goto LABEL_63;
          }
LABEL_36:
          -[LNEnumMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEnumMetadata fullyQualifiedTypeName](v6, "fullyQualifiedTypeName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v37;
          v40 = v38;
          v58 = v40;
          v59 = v39;
          if (v39 == v40)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v39)
            {
              v41 = v40;
              v19 = v64;
              goto LABEL_60;
            }
            v41 = v40;
            v19 = v64;
            if (!v40)
            {
LABEL_60:

              goto LABEL_61;
            }
            v42 = objc_msgSend(v39, "isEqualToString:", v40);

            if (!v42)
            {
              LOBYTE(v12) = 0;
              v19 = v64;
LABEL_61:
              v35 = v58;
              v28 = v59;
              goto LABEL_62;
            }
          }
          -[LNEnumMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEnumMetadata assistantDefinedSchemas](v6, "assistantDefinedSchemas");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v43;
          v45 = v44;
          v56 = v39;
          v57 = v45;
          if (v39 == v45)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v39)
            {
              v46 = v45;
              v19 = v64;
              goto LABEL_59;
            }
            v46 = v45;
            v19 = v64;
            if (!v45)
            {
LABEL_59:

              v39 = v56;
              v41 = v57;
              goto LABEL_60;
            }
            v47 = objc_msgSend(v39, "isEqualToArray:", v45);

            if (!v47)
            {
              LOBYTE(v12) = 0;
              v19 = v64;
              v41 = v57;
              goto LABEL_60;
            }
          }
          -[LNEnumMetadata visibilityMetadata](self, "visibilityMetadata", v39);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNEnumMetadata visibilityMetadata](v6, "visibilityMetadata");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v48;
          v51 = v49;
          v52 = v50;
          v53 = v50 == v51;
          v54 = v51;
          if (v53)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v52)
            {
              v19 = v64;
              if (v51)
                LOBYTE(v12) = objc_msgSend(v52, "isEqual:", v51);
              goto LABEL_57;
            }
          }
          v19 = v64;
LABEL_57:

          v46 = v54;
          v39 = v52;
          goto LABEL_59;
        }
      }
      else
      {
        v35 = v34;
        v19 = v64;
      }
LABEL_62:

      v28 = v60;
      v30 = v61;
      goto LABEL_63;
    }

    goto LABEL_36;
  }
  LOBYTE(v12) = 1;
LABEL_70:

  return v12;
}

- (id)copyWithDescriptiveMetadataFromEnum:(id)a3 usingLibraryKey:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  LNTypeDisplayRepresentation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  v8 = (_QWORD *)-[LNEnumMetadata copy](self, "copy");
  v9 = [LNTypeDisplayRepresentation alloc];
  objc_msgSend(v7, "displayRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNEnumMetadata displayRepresentation](self, "displayRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numericFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnumMetadata displayRepresentation](self, "displayRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "synonyms");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[LNTypeDisplayRepresentation initWithName:numericFormat:synonyms:](v9, "initWithName:numericFormat:synonyms:", v12, v14, v16);
  v18 = (void *)v8[3];
  v8[3] = v17;

  return v8;
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

- (LNEnumMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  LNEnumMetadata *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  LNVisibilityMetadata *v33;
  void *v34;
  void *v35;
  LNEnumMetadata *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  LNEnumMetadata *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("cases"));
  v47 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledTypeName"));
  v46 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("effectiveBundleIdentifiers"));
  v45 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("mangledTypeNameByBundleIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v44 = (void *)v5;
  if (v5 && v6)
  {
    v19 = (void *)v46;
    v18 = (void *)v47;
    v20 = (void *)v45;
    if (v47 && v46 && v16 && v45)
    {
      v43 = self;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIntentEnumTypeName"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0C99E60];
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("availabilityAnnotations"));
      v26 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("system"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullyQualifiedTypeName"));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0C99E60];
      v30 = objc_opt_class();
      objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("assistantDefinedSchemas"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visibilityMetadata"));
      v33 = (LNVisibilityMetadata *)objc_claimAutoreleasedReturnValue();
      if (!v33)
        v33 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", 1, 0);
      v40 = v28;
      v38 = v21;
      v39 = v26;
      v41 = (void *)v21;
      v42 = (void *)v26;
      v34 = v44;
      v35 = (void *)v28;
      v19 = (void *)v46;
      v36 = -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:assistantDefinedSchemas:visibilityMetadata:](v43, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:assistantDefinedSchemas:visibilityMetadata:", v44, v46, v16, v45, v6, v47, v38, v39, v27, v40, v32, v33);

      v18 = (void *)v47;
      self = v36;
      v20 = (void *)v45;

      v17 = self;
    }
    else
    {
      v34 = v44;
    }
  }
  else
  {
    v34 = (void *)v5;
    v20 = (void *)v45;
    v19 = (void *)v46;
    v18 = (void *)v47;
  }

  return v17;
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
  id v16;

  v4 = a3;
  -[LNEnumMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNEnumMetadata displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayRepresentation"));

  -[LNEnumMetadata cases](self, "cases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cases"));

  -[LNEnumMetadata customIntentEnumTypeName](self, "customIntentEnumTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("customIntentEnumTypeName"));

  -[LNEnumMetadata mangledTypeName](self, "mangledTypeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("mangledTypeName"));

  -[LNEnumMetadata mangledTypeNameByBundleIdentifier](self, "mangledTypeNameByBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("mangledTypeNameByBundleIdentifier"));

  -[LNEnumMetadata effectiveBundleIdentifiers](self, "effectiveBundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("effectiveBundleIdentifiers"));

  -[LNEnumMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("availabilityAnnotations"));

  -[LNEnumMetadata isSystem](self, "isSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("system"));

  -[LNEnumMetadata fullyQualifiedTypeName](self, "fullyQualifiedTypeName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("fullyQualifiedTypeName"));

  -[LNEnumMetadata assistantDefinedSchemas](self, "assistantDefinedSchemas");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("assistantDefinedSchemas"));

  -[LNEnumMetadata visibilityMetadata](self, "visibilityMetadata");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("visibilityMetadata"));

}

- (LNTypeDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSString)customIntentEnumTypeName
{
  return self->_customIntentEnumTypeName;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (NSString)fullyQualifiedTypeName
{
  return self->_fullyQualifiedTypeName;
}

- (NSArray)assistantDefinedSchemas
{
  return self->_assistantDefinedSchemas;
}

- (LNVisibilityMetadata)visibilityMetadata
{
  return self->_visibilityMetadata;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNStaticDeferredLocalizedString)displayTypeName
{
  void *v2;
  void *v3;

  -[LNEnumMetadata displayRepresentation](self, "displayRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNStaticDeferredLocalizedString *)v3;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12 assistantDefinedSchemas:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  id v24;
  id v26;
  id v27;
  LNVisibilityMetadata *v29;
  id v30;
  id v31;
  LNEnumMetadata *v33;

  v31 = a13;
  v30 = a12;
  v27 = a11;
  v17 = a10;
  v23 = a9;
  v24 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v26 = a4;
  v21 = a3;
  v29 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", 1, 0);
  v33 = -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:assistantDefinedSchemas:visibilityMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:assistantDefinedSchemas:visibilityMetadata:", v21, v26, v20, v19, v18, v24, v23, v17, v27, v30, v31, v29);

  return v33;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12
{
  return -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:assistantDefinedSchemas:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:assistantDefinedSchemas:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0);
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11
{
  return -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:fullyQualifiedTypeName:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10
{
  return -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:system:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9
{
  return -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:availabilityAnnotations:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayTypeName:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  LNTypeDisplayRepresentation *v19;
  LNEnumMetadata *v20;

  v13 = (void *)MEMORY[0x1E0C99E40];
  v14 = a9;
  v15 = a8;
  v16 = a7;
  v17 = a3;
  objc_msgSend(v13, "orderedSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[LNTypeDisplayRepresentation initWithName:numericFormat:]([LNTypeDisplayRepresentation alloc], "initWithName:numericFormat:", v16, 0);

  v20 = -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:cases:customIntentEnumTypeName:", v17, v17, MEMORY[0x1E0C9AA70], v18, v19, v15, v14);
  return v20;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 displayTypeName:(id)a4 cases:(id)a5 customIntentEnumTypeName:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  LNEnumMetadata *v16;

  v10 = (void *)MEMORY[0x1E0C99E40];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "orderedSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[LNEnumMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayTypeName:cases:customIntentEnumTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayTypeName:cases:customIntentEnumTypeName:", v14, v14, MEMORY[0x1E0C9AA70], v15, v13, v12, v11);

  return v16;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 displayTypeName:(id)a4 cases:(id)a5
{
  return -[LNEnumMetadata initWithIdentifier:displayTypeName:cases:customIntentEnumTypeName:](self, "initWithIdentifier:displayTypeName:cases:customIntentEnumTypeName:", a3, a4, a5, 0);
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 cases:(id)a4
{
  id v6;
  id v7;
  LNStaticDeferredLocalizedString *v8;
  LNEnumMetadata *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[LNStaticDeferredLocalizedString initWithLocalizedKey:bundleIdentifier:bundleURL:table:]([LNStaticDeferredLocalizedString alloc], "initWithLocalizedKey:bundleIdentifier:bundleURL:table:", v7, 0, 0, 0);
  v9 = -[LNEnumMetadata initWithIdentifier:displayTypeName:cases:](self, "initWithIdentifier:displayTypeName:cases:", v7, v8, v6);

  return v9;
}

@end
