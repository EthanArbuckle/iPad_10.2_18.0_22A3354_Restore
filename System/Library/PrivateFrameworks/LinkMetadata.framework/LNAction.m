@implementation LNAction

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[LNAction parameters](self, "parameters", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction actionWithParameters:](self, "actionWithParameters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitAuthenticationPolicy, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_systemProtocols, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_outputFlags, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 parameters:(id)a6
{
  return -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:outputFlags:outputType:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:outputFlags:outputType:parameters:", a3, a4, a5, 0, 0, a6);
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 parameters:(id)a8
{
  return -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:outputFlags:outputType:systemProtocols:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:outputFlags:outputType:systemProtocols:parameters:", a3, a4, a5, a6, a7, MEMORY[0x1E0C9AA60], a8);
}

- (LNAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  LNAction *v20;
  void *v21;
  void *v22;
  LNAction *v23;
  unsigned int v25;
  uint64_t v26;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledTypeName"));
  v26 = objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("openAppWhenRun"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputFlags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("systemProtocols"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("parameters"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("explicitAuthenticationPolicy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  if (v5 && v18)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)v26;
    v23 = -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:", v5, v26, v25, v19, v6, v7, v14, v18);
    self = v23;
    if (v23)
      objc_storeStrong((id *)&v23->_url, v21);

    v20 = self;
  }
  else
  {
    v22 = (void *)v26;
  }

  return v20;
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 outputFlags:(id)a6 outputType:(id)a7 systemProtocols:(id)a8 parameters:(id)a9
{
  return -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:", a3, a4, a5, &unk_1E39B4BC8, a6, a7, a8, a9);
}

- (BOOL)isEqual:(id)a3
{
  LNAction *v4;
  LNAction *v5;
  LNAction *v6;
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
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  BOOL v54;
  void *v55;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;

  v4 = (LNAction *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_71:

      goto LABEL_72;
    }
    -[LNAction identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAction identifier](v6, "identifier");
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
        goto LABEL_69;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_70:

        goto LABEL_71;
      }
    }
    -[LNAction mangledTypeName](self, "mangledTypeName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAction mangledTypeName](v6, "mangledTypeName");
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
        goto LABEL_68;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
        goto LABEL_19;
    }
    v22 = -[LNAction openAppWhenRun](self, "openAppWhenRun");
    if (v22 != -[LNAction openAppWhenRun](v6, "openAppWhenRun"))
    {
LABEL_19:
      LOBYTE(v12) = 0;
LABEL_69:

      goto LABEL_70;
    }
    -[LNAction outputFlags](self, "outputFlags");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAction outputFlags](v6, "outputFlags");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;
    v25 = v24;
    v19 = v25;
    v66 = v20;
    if (v20 == v25)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v26 = v25;
      if (!v20 || !v25)
        goto LABEL_67;
      v12 = objc_msgSend(v20, "isEqual:", v25);

      if (!v12)
        goto LABEL_68;
    }
    v65 = v19;
    -[LNAction outputType](self, "outputType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAction outputType](v6, "outputType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    v30 = v28;
    v63 = v30;
    v64 = v29;
    if (v29 == v30)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v29)
      {
        v31 = v30;
        v19 = v65;
        goto LABEL_65;
      }
      v31 = v30;
      v19 = v65;
      if (!v30)
      {
LABEL_65:

        goto LABEL_66;
      }
      v32 = objc_msgSend(v29, "isEqual:", v30);

      if (!v32)
      {
        LOBYTE(v12) = 0;
        v19 = v65;
LABEL_66:
        v26 = v63;
        v20 = v64;
LABEL_67:

        v20 = v66;
LABEL_68:

        goto LABEL_69;
      }
    }
    -[LNAction systemProtocols](self, "systemProtocols");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAction systemProtocols](v6, "systemProtocols");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v33;
    v35 = v34;
    v61 = v29;
    v62 = v35;
    if (v29 != v35)
    {
      LOBYTE(v12) = 0;
      if (v29)
      {
        v36 = v35;
        v19 = v65;
        if (v35)
        {
          v37 = objc_msgSend(v29, "isEqualToArray:", v35);

          if (!v37)
          {
            LOBYTE(v12) = 0;
            v19 = v65;
            v31 = v62;
            goto LABEL_65;
          }
LABEL_38:
          -[LNAction parameters](self, "parameters");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNAction parameters](v6, "parameters");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v38;
          v41 = v39;
          v59 = v41;
          v60 = v40;
          if (v40 == v41)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v40)
            {
              v42 = v41;
              v19 = v65;
              goto LABEL_62;
            }
            v42 = v41;
            v19 = v65;
            if (!v41)
            {
LABEL_62:

              goto LABEL_63;
            }
            v43 = objc_msgSend(v40, "isEqualToArray:", v41);

            if (!v43)
            {
              LOBYTE(v12) = 0;
              v19 = v65;
LABEL_63:
              v36 = v59;
              v29 = v60;
              goto LABEL_64;
            }
          }
          -[LNAction url](self, "url");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNAction url](v6, "url");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v44;
          v46 = v45;
          v57 = v40;
          v58 = v46;
          if (v40 == v46)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v40)
            {
              v47 = v46;
              v19 = v65;
              goto LABEL_61;
            }
            v47 = v46;
            v19 = v65;
            if (!v46)
            {
LABEL_61:

              v40 = v57;
              v42 = v58;
              goto LABEL_62;
            }
            v48 = objc_msgSend(v40, "isEqual:", v46);

            if (!v48)
            {
              LOBYTE(v12) = 0;
              v19 = v65;
              v42 = v58;
              goto LABEL_62;
            }
          }
          -[LNAction explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy", v40);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNAction explicitAuthenticationPolicy](v6, "explicitAuthenticationPolicy");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v49;
          v52 = v50;
          v53 = v51;
          v54 = v51 == v52;
          v55 = v52;
          if (v54)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v53)
            {
              v19 = v65;
              if (v52)
                LOBYTE(v12) = objc_msgSend(v53, "isEqual:", v52);
              goto LABEL_59;
            }
          }
          v19 = v65;
LABEL_59:

          v47 = v55;
          v40 = v53;
          goto LABEL_61;
        }
      }
      else
      {
        v36 = v35;
        v19 = v65;
      }
LABEL_64:

      v29 = v61;
      v31 = v62;
      goto LABEL_65;
    }

    goto LABEL_38;
  }
  LOBYTE(v12) = 1;
LABEL_72:

  return v12;
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
  id v12;

  v4 = a3;
  -[LNAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNAction mangledTypeName](self, "mangledTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mangledTypeName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNAction openAppWhenRun](self, "openAppWhenRun"), CFSTR("openAppWhenRun"));
  -[LNAction explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("explicitAuthenticationPolicy"));

  -[LNAction outputFlags](self, "outputFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("outputFlags"));

  -[LNAction outputType](self, "outputType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("outputType"));

  -[LNAction systemProtocols](self, "systemProtocols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("systemProtocols"));

  -[LNAction parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("parameters"));

  -[LNAction url](self, "url");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("url"));

}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (NSArray)systemProtocols
{
  return self->_systemProtocols;
}

- (LNValueType)outputType
{
  return self->_outputType;
}

- (NSNumber)outputFlags
{
  return self->_outputFlags;
}

- (BOOL)openAppWhenRun
{
  return self->_openAppWhenRun;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (LNAction)initWithMetadata:(id)a3 bundleIdentifier:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  LNAction *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mangledTypeNameForBundleIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "openAppWhenRun");
  objc_msgSend(v10, "authenticationPolicyAllowingImplicit:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "outputFlags"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "outputType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemProtocols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:", v11, v12, v13, v14, v15, v16, v17, v8);
  return v18;
}

- (LNAction)initWithMetadata:(id)a3 mangledTypeName:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  LNAction *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "openAppWhenRun");
  objc_msgSend(v10, "authenticationPolicyAllowingImplicit:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "outputFlags"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "outputType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemProtocols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:", v11, v9, v12, v13, v14, v15, v16, v8);
  return v17;
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 openAppWhenRun:(BOOL)a5 explicitAuthenticationPolicy:(id)a6 outputFlags:(id)a7 outputType:(id)a8 systemProtocols:(id)a9 parameters:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  LNAction *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *mangledTypeName;
  uint64_t v26;
  NSArray *systemProtocols;
  uint64_t v28;
  NSArray *parameters;
  LNAction *v30;
  id v32;
  id v33;
  objc_super v34;

  v16 = a3;
  v17 = a4;
  v33 = a6;
  v32 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v34.receiver = self;
  v34.super_class = (Class)LNAction;
  v21 = -[LNAction init](&v34, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy", v32, v33);
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    mangledTypeName = v21->_mangledTypeName;
    v21->_mangledTypeName = (NSString *)v24;

    v21->_openAppWhenRun = a5;
    objc_storeStrong((id *)&v21->_explicitAuthenticationPolicy, a6);
    objc_storeStrong((id *)&v21->_outputFlags, a7);
    objc_storeStrong((id *)&v21->_outputType, a8);
    v26 = objc_msgSend(v19, "copy");
    systemProtocols = v21->_systemProtocols;
    v21->_systemProtocols = (NSArray *)v26;

    v28 = objc_msgSend(v20, "copy");
    parameters = v21->_parameters;
    v21->_parameters = (NSArray *)v28;

    v30 = v21;
  }

  return v21;
}

- (LNAction)actionWithParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[LNAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction mangledTypeName](self, "mangledTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LNAction openAppWhenRun](self, "openAppWhenRun");
  -[LNAction explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction outputFlags](self, "outputFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction outputType](self, "outputType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction systemProtocols](self, "systemProtocols");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:", v6, v7, v8, v9, v10, v11, v12, v4);

  return (LNAction *)v13;
}

- (LNAction)actionWithByMergingParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[LNAction parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v18, "identifier", (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

  objc_msgSend(v5, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction actionWithParameters:](self, "actionWithParameters:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNAction *)v21;
}

- (LNAction)actionWithNonSecureParameters
{
  void *v3;
  void *v4;
  void *v5;

  -[LNAction parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_objectsPassingTest:", &__block_literal_global_7184);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNAction actionWithParameters:](self, "actionWithParameters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNAction *)v5;
}

- (LNAction)actionWithOpenWhenRun:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[LNAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction mangledTypeName](self, "mangledTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction outputFlags](self, "outputFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction outputType](self, "outputType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction systemProtocols](self, "systemProtocols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction parameters](self, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:", v6, v7, v3, v8, v9, v10, v11, v12);

  return (LNAction *)v13;
}

- (LNAction)actionWithURL:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = -[LNAction copy](self, "copy");
  v7 = (void *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 16), a3);

  return (LNAction *)v7;
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

- (NSString)description
{
  objc_class *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction mangledTypeName](self, "mangledTypeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNAction openAppWhenRun](self, "openAppWhenRun");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v16 = v6;
  -[LNAction outputFlags](self, "outputFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction outputType](self, "outputType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction systemProtocols](self, "systemProtocols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueForKeyPath:", CFSTR("description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAction explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, mangledTypeName: %@, openAppWhenRun: %@, outputFlags: %@, outputType: %@, systemProtocols: %@, parameters: %@, url: %@, explicitAuthenticationPolicy: %@"), v19, self, v18, v4, v16, v7, v8, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (LNAction)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  LNAction *v17;
  void *v18;
  LNAction *v19;
  unsigned int v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledTypeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("openAppWhenRun"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputFlags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("systemProtocols"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  v14 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v14, objc_opt_class(), CFSTR("parameters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("explicitAuthenticationPolicy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (v5 && v15)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:explicitAuthenticationPolicy:outputFlags:outputType:systemProtocols:parameters:", v5, v6, v21, v16, v7, v8, v13, v15);
    self = v19;
    if (v19)
      objc_storeStrong((id *)&v19->_url, v18);

    v17 = self;
  }

  return v17;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[LNAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNAction mangledTypeName](self, "mangledTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mangledTypeName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNAction openAppWhenRun](self, "openAppWhenRun"), CFSTR("openAppWhenRun"));
  -[LNAction explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("explicitAuthenticationPolicy"));

  -[LNAction outputFlags](self, "outputFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("outputFlags"));

  -[LNAction outputType](self, "outputType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("outputType"));

  -[LNAction systemProtocols](self, "systemProtocols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("systemProtocols"));

  -[LNAction parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("parameters"));

  -[LNAction url](self, "url");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("url"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
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

  -[LNAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAction mangledTypeName](self, "mangledTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[LNAction openAppWhenRun](self, "openAppWhenRun");
  -[LNAction outputFlags](self, "outputFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[LNAction outputType](self, "outputType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[LNAction systemProtocols](self, "systemProtocols");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[LNAction parameters](self, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[LNAction url](self, "url");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[LNAction explicitAuthenticationPolicy](self, "explicitAuthenticationPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (void)enumerateParameterValuesOfValueType:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[LNAction parameters](self, "parameters", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "valueType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "enumerateValuesOfValueType:value:block:", v6, v16, v7);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (NSURL)url
{
  return self->_url;
}

- (NSNumber)explicitAuthenticationPolicy
{
  return self->_explicitAuthenticationPolicy;
}

uint64_t __41__LNAction_actionWithNonSecureParameters__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSecure") ^ 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (int64_t)presentationStyle
{
  if (-[LNAction openAppWhenRun](self, "openAppWhenRun"))
    return 2;
  else
    return 0;
}

- (LNAction)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 presentationStyle:(int64_t)a5 parameters:(id)a6
{
  return -[LNAction initWithIdentifier:mangledTypeName:openAppWhenRun:parameters:](self, "initWithIdentifier:mangledTypeName:openAppWhenRun:parameters:", a3, a4, a5 != 0, a6);
}

- (LNAction)initWithIdentifier:(id)a3 presentationStyle:(int64_t)a4 parameters:(id)a5
{
  return -[LNAction initWithIdentifier:mangledTypeName:presentationStyle:parameters:](self, "initWithIdentifier:mangledTypeName:presentationStyle:parameters:", a3, 0, a4, a5);
}

- (LNAction)initWithIdentifier:(id)a3 parameters:(id)a4
{
  return -[LNAction initWithIdentifier:presentationStyle:parameters:](self, "initWithIdentifier:presentationStyle:parameters:", a3, 0, a4);
}

- (LNAction)initWithIdentifier:(id)a3
{
  return -[LNAction initWithIdentifier:parameters:](self, "initWithIdentifier:parameters:", a3, MEMORY[0x1E0C9AA60]);
}

- (LNAction)actionWithPresentationStyle:(int64_t)a3
{
  return -[LNAction actionWithOpenWhenRun:](self, "actionWithOpenWhenRun:", a3 != 0);
}

@end
