@implementation LNActionParameterMetadata

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
  -[LNActionParameterMetadata name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[LNActionParameterMetadata valueType](self, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueType"));

  -[LNActionParameterMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("title"));

  -[LNActionParameterMetadata parameterDescription](self, "parameterDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("parameterDescription"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionParameterMetadata isOptional](self, "isOptional"), CFSTR("optional"));
  -[LNActionParameterMetadata resolvableInputTypes](self, "resolvableInputTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("resolvableInputTypes"));

  -[LNActionParameterMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("typeSpecificMetadata"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionParameterMetadata dynamicOptionsSupport](self, "dynamicOptionsSupport"), CFSTR("dynamicOptionsSupport"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionParameterMetadata inputConnectionBehavior](self, "inputConnectionBehavior"), CFSTR("inputConnectionBehavior"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionParameterMetadata capabilities](self, "capabilities"), CFSTR("capabilities"));
  -[LNActionParameterMetadata queryIdentifier](self, "queryIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("queryIdentifier"));

}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)inputConnectionBehavior
{
  return self->_inputConnectionBehavior;
}

- (int64_t)dynamicOptionsSupport
{
  return self->_dynamicOptionsSupport;
}

- (NSDictionary)typeSpecificMetadata
{
  return self->_typeSpecificMetadata;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (LNStaticDeferredLocalizedString)parameterDescription
{
  return self->_parameterDescription;
}

- (NSArray)resolvableInputTypes
{
  return self->_resolvableInputTypes;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_typeSpecificMetadata, 0);
  objc_storeStrong((id *)&self->_resolvableInputTypes, 0);
  objc_storeStrong((id *)&self->_parameterDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNActionParameterMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  LNActionParameterMetadata *v22;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[10];

  v29[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterDescription"));
    v27 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("optional"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("resolvableInputTypes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v26 = v7;
      LNValueTypeObjectClassesForCoding();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      v29[2] = objc_opt_class();
      v29[3] = objc_opt_class();
      v29[4] = objc_opt_class();
      v29[5] = objc_opt_class();
      v29[6] = objc_opt_class();
      v29[7] = objc_opt_class();
      v29[8] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setByAddingObjectsFromArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("typeSpecificMetadata"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dynamicOptionsSupport"));
        v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputConnectionBehavior"));
        v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capabilities"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v18;
        v24 = v16;
        v21 = (void *)v27;
        v20 = (void *)v28;
        self = -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:queryIdentifier:](self, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:queryIdentifier:", v5, v6, v26, v28, v27, v11, v15, v24, v17, v25, v19);

        v22 = self;
      }
      else
      {
        v22 = 0;
        v21 = (void *)v27;
        v20 = (void *)v28;
      }

    }
    else
    {
      v22 = 0;
      v21 = (void *)v27;
      v20 = (void *)v28;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11 capabilities:(unint64_t)a12 queryIdentifier:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  LNActionParameterMetadata *v24;
  uint64_t v25;
  NSString *name;
  id v27;
  void *v28;
  LNStaticDeferredLocalizedString *v29;
  LNStaticDeferredLocalizedString *title;
  uint64_t v31;
  LNValueType *valueType;
  uint64_t v33;
  NSArray *resolvableInputTypes;
  uint64_t v35;
  NSDictionary *typeSpecificMetadata;
  uint64_t v37;
  NSString *queryIdentifier;
  LNActionParameterMetadata *v39;
  void *v41;
  void *v42;
  id v44;
  id v45;
  objc_super v46;

  v45 = a3;
  v19 = a4;
  v20 = a6;
  v44 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a13;
  if (v21)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionParameterMetadata.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolvableInputTypes"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionParameterMetadata.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));

LABEL_3:
  v46.receiver = self;
  v46.super_class = (Class)LNActionParameterMetadata;
  v24 = -[LNActionParameterMetadata init](&v46, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v45, "copy");
    name = v24->_name;
    v24->_name = (NSString *)v25;

    v27 = v20;
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
    }
    else
    {
      v28 = 0;
    }
    v29 = v28;

    title = v24->_title;
    v24->_title = v29;

    objc_storeStrong((id *)&v24->_parameterDescription, a7);
    v31 = objc_msgSend(v19, "copy");
    valueType = v24->_valueType;
    v24->_valueType = (LNValueType *)v31;

    v24->_optional = a5;
    v33 = objc_msgSend(v21, "copy");
    resolvableInputTypes = v24->_resolvableInputTypes;
    v24->_resolvableInputTypes = (NSArray *)v33;

    v35 = objc_msgSend(v22, "copy");
    typeSpecificMetadata = v24->_typeSpecificMetadata;
    v24->_typeSpecificMetadata = (NSDictionary *)v35;

    v24->_dynamicOptionsSupport = a10;
    v24->_inputConnectionBehavior = a11;
    v24->_capabilities = a12;
    v37 = objc_msgSend(v23, "copy");
    queryIdentifier = v24->_queryIdentifier;
    v24->_queryIdentifier = (NSString *)v37;

    v39 = v24;
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  void *v13;
  LNActionParameterMetadata *v14;
  void *v16;
  LNActionParameterMetadata *v17;

  v17 = [LNActionParameterMetadata alloc];
  -[LNActionParameterMetadata name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata valueType](self, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNActionParameterMetadata isOptional](self, "isOptional");
  -[LNActionParameterMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata parameterDescription](self, "parameterDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata resolvableInputTypes](self, "resolvableInputTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LNActionParameterMetadata dynamicOptionsSupport](self, "dynamicOptionsSupport");
  v11 = -[LNActionParameterMetadata inputConnectionBehavior](self, "inputConnectionBehavior");
  v12 = -[LNActionParameterMetadata capabilities](self, "capabilities");
  -[LNActionParameterMetadata queryIdentifier](self, "queryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:queryIdentifier:](v17, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:queryIdentifier:", v16, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v14;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int64_t v9;
  __CFString *v10;
  __CFString *v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  _BOOL4 v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v25 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata name](self, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata valueType](self, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata resolvableInputTypes](self, "resolvableInputTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKeyPath:", CFSTR("description"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LNActionParameterMetadata isOptional](self, "isOptional");
  -[LNActionParameterMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[LNActionParameterMetadata dynamicOptionsSupport](self, "dynamicOptionsSupport");
  v9 = -[LNActionParameterMetadata inputConnectionBehavior](self, "inputConnectionBehavior");
  v10 = CFSTR("Default");
  if (v9 == 1)
    v10 = CFSTR("Never");
  if (v9 == 2)
    v10 = CFSTR("ConnectToPreviousIntentResult");
  v11 = v10;
  v12 = -[LNActionParameterMetadata capabilities](self, "capabilities");
  -[LNActionParameterMetadata queryIdentifier](self, "queryIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v21 = v7;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = v14;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v14, "addObject:", CFSTR("HasStaticDefault"));
      if ((v12 & 2) == 0)
      {
LABEL_8:
        if ((v12 & 4) == 0)
          goto LABEL_9;
        goto LABEL_19;
      }
    }
    else if ((v12 & 2) == 0)
    {
      goto LABEL_8;
    }
    objc_msgSend(v15, "addObject:", CFSTR("HasDynamicDefault"));
    if ((v12 & 4) == 0)
    {
LABEL_9:
      if ((v12 & 8) == 0)
      {
LABEL_11:
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v7 = v21;
        goto LABEL_13;
      }
LABEL_10:
      objc_msgSend(v15, "addObject:", CFSTR("HasOptionsProvider"));
      goto LABEL_11;
    }
LABEL_19:
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("HasQuery(%@)"), v13);
    objc_msgSend(v15, "addObject:", v20);

    if ((v12 & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v16 = CFSTR("N/A");
LABEL_13:
  if (v7)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");

  objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p, name: %@, valueType: %@, title: %@, resolvableInputTypes: [%@], isOptional: %@, typeSpecificMetadata: %@, dynamicOptionsSupport: %ld, inputConnectionBehavior: %@, capabilities: %@>"), v27, self, v26, v4, v5, v6, v17, v8, v22, v11, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;

  v3 = -[LNActionParameterMetadata isOptional](self, "isOptional");
  -[LNActionParameterMetadata valueType](self, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNActionParameterMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;
  -[LNActionParameterMetadata title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[LNActionParameterMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v7 ^ v11 ^ -[LNActionParameterMetadata dynamicOptionsSupport](self, "dynamicOptionsSupport");
  v13 = -[LNActionParameterMetadata inputConnectionBehavior](self, "inputConnectionBehavior");
  v14 = v13 ^ -[LNActionParameterMetadata capabilities](self, "capabilities");
  -[LNActionParameterMetadata queryIdentifier](self, "queryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  LNActionParameterMetadata *v4;
  LNActionParameterMetadata *v5;
  LNActionParameterMetadata *v6;
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
  _BOOL4 v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  int64_t v32;
  int64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  int v42;
  id v43;
  void *v44;
  id v45;
  id v46;

  v4 = (LNActionParameterMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_49:

      goto LABEL_50;
    }
    -[LNActionParameterMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionParameterMetadata name](v6, "name");
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
        goto LABEL_47;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_48:

        goto LABEL_49;
      }
    }
    -[LNActionParameterMetadata title](self, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionParameterMetadata title](v6, "title");
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
        goto LABEL_46;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    -[LNActionParameterMetadata valueType](self, "valueType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionParameterMetadata valueType](v6, "valueType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v46 = v20;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_45;
      v12 = objc_msgSend(v20, "isEqual:", v24);

      if (!v12)
        goto LABEL_46;
    }
    v26 = -[LNActionParameterMetadata isOptional](self, "isOptional");
    if (v26 != -[LNActionParameterMetadata isOptional](v6, "isOptional"))
    {
      LOBYTE(v12) = 0;
LABEL_46:

      goto LABEL_47;
    }
    v46 = v20;
    -[LNActionParameterMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionParameterMetadata typeSpecificMetadata](v6, "typeSpecificMetadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;
    v28 = v44;
    v45 = v28;
    if (v20 == v28)
    {

      v43 = v20;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v20)
      {
        v29 = v28;
        v30 = 0;
        goto LABEL_43;
      }
      v29 = v28;
      v30 = v20;
      if (!v28)
      {
LABEL_43:
        v40 = v30;

        goto LABEL_44;
      }
      v31 = v28;
      v42 = objc_msgSend(v20, "isEqualToDictionary:", v28);

      v43 = v20;
      if (!v42)
      {
LABEL_39:
        LOBYTE(v12) = 0;
        v20 = v43;
LABEL_44:
        v25 = v45;
LABEL_45:

        v20 = v46;
        goto LABEL_46;
      }
    }
    v32 = -[LNActionParameterMetadata dynamicOptionsSupport](self, "dynamicOptionsSupport");
    if (v32 != -[LNActionParameterMetadata dynamicOptionsSupport](v6, "dynamicOptionsSupport"))
      goto LABEL_39;
    v33 = -[LNActionParameterMetadata inputConnectionBehavior](self, "inputConnectionBehavior");
    if (v33 != -[LNActionParameterMetadata inputConnectionBehavior](v6, "inputConnectionBehavior"))
      goto LABEL_39;
    v34 = -[LNActionParameterMetadata capabilities](self, "capabilities");
    if (v34 != -[LNActionParameterMetadata capabilities](v6, "capabilities"))
      goto LABEL_39;
    -[LNActionParameterMetadata queryIdentifier](self, "queryIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionParameterMetadata queryIdentifier](v6, "queryIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    v38 = v36;
    v39 = v38;
    if (v37 == v38)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v37 && v38)
        LOBYTE(v12) = objc_msgSend(v37, "isEqualToString:", v38);
    }

    v29 = v39;
    v20 = v43;
    v30 = v37;
    goto LABEL_43;
  }
  LOBYTE(v12) = 1;
LABEL_50:

  return v12;
}

- (LNActionParameterMetadata)actionParameterMetadataWithCapabilities:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[LNActionParameterMetadata copy](self, "copy");
  v4[10] = a3;
  return (LNActionParameterMetadata *)v4;
}

- (LNActionParameterMetadata)actionParameterMetadataWithDescriptiveMetadataFromParameter:(id)a3 usingLibraryKey:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)-[LNActionParameterMetadata copy](self, "copy");
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v9, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v8[4];
  v8[4] = v10;

  objc_msgSend(v6, "parameterDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionParameterMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v12, v7);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v8[5];
  v8[5] = v13;

  -[LNActionParameterMetadata typeSpecificMetadata](self, "typeSpecificMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v6, "typeSpecificMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("LNValueTypeMetadataKeyBoolTrueDisplayName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      -[LNActionParameterMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v18, v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("LNValueTypeMetadataKeyBoolTrueDisplayName"));

    }
  }
  objc_msgSend(v6, "typeSpecificMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("LNValueTypeMetadataKeyBoolFalseDisplayName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v23, "key");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      -[LNActionParameterMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v23, v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v26, CFSTR("LNValueTypeMetadataKeyBoolFalseDisplayName"));

    }
  }
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v16);
  v28 = (void *)v8[7];
  v8[7] = v27;

  return (LNActionParameterMetadata *)v8;
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

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11 capabilities:(unint64_t)a12
{
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:queryIdentifier:](self, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:queryIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0);
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11
{
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:](self, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 isInput:(BOOL)a11
{
  uint64_t v11;

  v11 = 2;
  if (!a11)
    v11 = 0;
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:](self, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:", a3, a4, a5, a6, a7, a8, a9, a10, v11);
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:](self, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:", a3, a4, a5, a6, a7, a8, a9, 0, v10);
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 dynamicOptionsSupport:(int64_t)a9 isInput:(BOOL)a10
{
  uint64_t v11;

  LOBYTE(v11) = a10;
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:](self, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:", a3, a4, a5, a6, 0, a7, a8, a9, v11);
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:](self, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:", a3, a4, a5, a6, 0, a7, a8, 0, v9);
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 hasDynamicOptions:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:](self, "initWithName:valueType:optional:title:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 dynamicOptionsSupport:(int64_t)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[LNActionParameterMetadata initWithName:valueType:optional:title:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:](self, "initWithName:valueType:optional:title:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:isInput:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (BOOL)hasDynamicOptions
{
  return -[LNActionParameterMetadata dynamicOptionsSupport](self, "dynamicOptionsSupport") != 0;
}

- (BOOL)isInput
{
  return -[LNActionParameterMetadata inputConnectionBehavior](self, "inputConnectionBehavior") == 2;
}

@end
