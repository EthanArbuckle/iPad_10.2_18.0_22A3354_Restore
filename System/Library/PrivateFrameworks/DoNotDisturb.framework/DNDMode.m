@implementation DNDMode

- (NSString)tintColorName
{
  DNDModeSymbolDescriptor *symbolDescriptor;
  void *v4;
  NSString *v5;

  symbolDescriptor = self->_symbolDescriptor;
  if (symbolDescriptor
    && (-[DNDModeSymbolDescriptor primaryTintColorName](symbolDescriptor, "primaryTintColorName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[DNDModeSymbolDescriptor primaryTintColorName](self->_symbolDescriptor, "primaryTintColorName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else if (DNDSupportedSemanticType(self->_semanticType))
  {
    v5 = self->_tintColorName;
  }
  else
  {
    DNDSystemColorNameForModeSemanticType(self->_semanticType);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSString)symbolImageName
{
  DNDModeSymbolDescriptor *symbolDescriptor;
  void *v4;
  NSString *v5;

  symbolDescriptor = self->_symbolDescriptor;
  if (symbolDescriptor
    && (-[DNDModeSymbolDescriptor imageName](symbolDescriptor, "imageName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[DNDModeSymbolDescriptor imageName](self->_symbolDescriptor, "imageName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else if (DNDSupportedSemanticType(self->_semanticType))
  {
    v5 = self->_symbolImageName;
  }
  else
  {
    DNDSystemImageNameForModeSemanticType(self->_semanticType);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSString)name
{
  void *v3;
  void *v4;
  NSString *v5;

  DNDModeLocalizedNameKeyForSemanticType(-[DNDMode semanticType](self, "semanticType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "dnd_doNotDisturbLocalizationBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E39B74A8, 0);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_name;
  }

  return v5;
}

- (int64_t)semanticType
{
  return self->_semanticType;
}

+ (unint64_t)maxUIAddableModes
{
  return 10;
}

+ (id)defaultMode
{
  void *v2;
  void *v3;
  DNDMode *v4;
  void *v5;
  DNDMode *v6;

  DNDModeSemanticTypeToString(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSystemImageNameForModeSemanticType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [DNDMode alloc];
  +[DNDMode defaultTintColorName](DNDMode, "defaultTintColorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:](v4, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:", v2, CFSTR("com.apple.donotdisturb.mode.default"), v3, v5, 0);

  return v6;
}

+ (id)defaultReduceInterruptionsMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DNDMutableModeSymbolDescriptor *v7;
  DNDMode *v8;

  DNDModeSemanticTypeToString(9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSystemImageNameForModeSemanticType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSystemColorNameForModeSemanticType(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSystemImageNameForModeSemanticType(9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSystemColorNamesForModeSemanticType(9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DNDMutableModeSymbolDescriptor initWithTintStyle:tintColorNames:imageName:]([DNDMutableModeSymbolDescriptor alloc], "initWithTintStyle:tintColorNames:imageName:", 1, v6, v5);
  v8 = -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:]([DNDMode alloc], "initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:", v2, CFSTR("com.apple.focus.reduce-interruptions"), v3, v4, v7, 9, 0, 0);

  return v8;
}

+ (id)placeholderModeFromMode:(id)a3
{
  id v3;
  DNDMode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  DNDMode *v12;

  v3 = a3;
  v4 = [DNDMode alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "semanticType");
  objc_msgSend(v3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:](v4, "initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:", v5, v6, v7, v8, v9, v10, 1, v11);
  return v12;
}

- (DNDMode)initWithName:(id)a3 modeIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 semanticType:(int64_t)a7
{
  return -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:](self, "initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:", a3, a4, a5, a6, 0, a7, 0, 0);
}

- (DNDMode)initWithName:(id)a3 modeIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 symbolDescriptor:(id)a7 semanticType:(int64_t)a8 visibility:(unint64_t)a9 identifier:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  DNDMode *v22;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSString *modeIdentifier;
  uint64_t v27;
  NSString *symbolImageName;
  uint64_t v29;
  NSString *tintColorName;
  uint64_t v31;
  DNDModeSymbolDescriptor *symbolDescriptor;
  NSUUID *v33;
  NSUUID *identifier;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)DNDMode;
  v22 = -[DNDMode init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    name = v22->_name;
    v22->_name = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    modeIdentifier = v22->_modeIdentifier;
    v22->_modeIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    symbolImageName = v22->_symbolImageName;
    v22->_symbolImageName = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    tintColorName = v22->_tintColorName;
    v22->_tintColorName = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    symbolDescriptor = v22->_symbolDescriptor;
    v22->_symbolDescriptor = (DNDModeSymbolDescriptor *)v31;

    v22->_semanticType = a8;
    v22->_visibility = a9;
    if (v21)
      v33 = (NSUUID *)v21;
    else
      v33 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v22->_identifier;
    v22->_identifier = v33;

  }
  return v22;
}

- (id)_initWithMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  DNDMode *v13;

  v4 = a3;
  objc_msgSend(v4, "_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_tintColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "semanticType");
  v11 = objc_msgSend(v4, "visibility");
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:](self, "initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

+ (NSString)defaultTintColorName
{
  return (NSString *)CFSTR("systemIndigoColor");
}

- (BOOL)isPlaceholder
{
  return self->_visibility - 1 < 2;
}

- (NSURL)settingsURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[DNDMode modeIdentifier](self, "modeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dnd_settingsURLWithModeIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSURL)setupURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "dnd_setupURLWithSemanticType:", -[DNDMode semanticType](self, "semanticType"));
}

- (id)_name
{
  return self->_name;
}

- (id)_symbolImageName
{
  return self->_symbolImageName;
}

- (id)_tintColorName
{
  return self->_tintColorName;
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
  int64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;

  -[DNDMode _name](self, "_name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDMode modeIdentifier](self, "modeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDMode _symbolImageName](self, "_symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDMode _tintColorName](self, "_tintColorName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDMode symbolDescriptor](self, "symbolDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v12 ^ -[DNDMode semanticType](self, "semanticType");
  v14 = v10 ^ v13 ^ -[DNDMode visibility](self, "visibility");
  -[DNDMode identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  DNDMode *v4;
  DNDMode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
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
  id v61;
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
  void *v74;
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

  v4 = (DNDMode *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDMode _name](self, "_name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDMode _name](v5, "_name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDMode _name](self, "_name");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v85)
        {
          v10 = 0;
          goto LABEL_67;
        }
        -[DNDMode _name](v5, "_name");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v83)
        {
          v10 = 0;
LABEL_66:

          goto LABEL_67;
        }
        -[DNDMode _name](self, "_name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDMode _name](v5, "_name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = 0;
LABEL_65:

          goto LABEL_66;
        }
        v81 = v9;
        v82 = v8;
      }
      -[DNDMode modeIdentifier](self, "modeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDMode modeIdentifier](v5, "modeIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v84)
      {
        -[DNDMode modeIdentifier](self, "modeIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[DNDMode modeIdentifier](v5, "modeIdentifier");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v79 = (void *)v14;
            -[DNDMode modeIdentifier](self, "modeIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDMode modeIdentifier](v5, "modeIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isEqual:", v16) & 1) != 0)
            {
              v75 = v16;
              v77 = v15;
              v76 = v13;
              goto LABEL_16;
            }

          }
        }

LABEL_63:
        v10 = 0;
        goto LABEL_64;
      }
LABEL_16:
      -[DNDMode _symbolImageName](self, "_symbolImageName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDMode _symbolImageName](v5, "_symbolImageName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v17;
      if (v17 == v18)
        goto LABEL_23;
      -[DNDMode _symbolImageName](self, "_symbolImageName");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        -[DNDMode _symbolImageName](v5, "_symbolImageName");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = v18;
          v23 = v20;
          v74 = (void *)v21;
          -[DNDMode _symbolImageName](self, "_symbolImageName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDMode _symbolImageName](v5, "_symbolImageName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
          {
            v69 = v24;
            v73 = v23;
            v18 = v22;
            v17 = v25;
LABEL_23:
            -[DNDMode _tintColorName](self, "_tintColorName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDMode _tintColorName](v5, "_tintColorName");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 == v78)
              goto LABEL_31;
            -[DNDMode _tintColorName](self, "_tintColorName");
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v70 = (void *)v27;
              -[DNDMode _tintColorName](v5, "_tintColorName");
              v28 = objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v65 = (void *)v28;
                v66 = v17;
                -[DNDMode _tintColorName](self, "_tintColorName");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDMode _tintColorName](v5, "_tintColorName");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v29, "isEqual:", v30) & 1) != 0)
                {
                  v62 = v30;
                  v63 = v29;
                  v17 = v66;
LABEL_31:
                  -[DNDMode symbolDescriptor](self, "symbolDescriptor");
                  v31 = objc_claimAutoreleasedReturnValue();
                  -[DNDMode symbolDescriptor](v5, "symbolDescriptor");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v72 = (void *)v31;
                  if ((void *)v31 == v71)
                  {
                    v68 = v26;
                    goto LABEL_43;
                  }
                  -[DNDMode symbolDescriptor](self, "symbolDescriptor");
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    v64 = (void *)v32;
                    -[DNDMode symbolDescriptor](v5, "symbolDescriptor");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v33)
                    {
                      v67 = v17;
                      v61 = v33;
                      -[DNDMode symbolDescriptor](self, "symbolDescriptor");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      -[DNDMode symbolDescriptor](v5, "symbolDescriptor");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v60 = v34;
                      if ((objc_msgSend(v34, "isEqual:", v35) & 1) != 0)
                      {
                        v59 = v35;
                        v68 = v26;
                        v17 = v67;
LABEL_43:
                        v36 = -[DNDMode semanticType](self, "semanticType");
                        if (v36 == -[DNDMode semanticType](v5, "semanticType")
                          && (v37 = -[DNDMode visibility](self, "visibility"),
                              v37 == -[DNDMode visibility](v5, "visibility")))
                        {
                          -[DNDMode identifier](self, "identifier");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          -[DNDMode identifier](v5, "identifier");
                          v39 = objc_claimAutoreleasedReturnValue();
                          if (v38 != (void *)v39)
                          {
                            v58 = (void *)v39;
                            -[DNDMode identifier](self, "identifier");
                            v40 = objc_claimAutoreleasedReturnValue();
                            v41 = v68;
                            if (v40)
                            {
                              v57 = (void *)v40;
                              -[DNDMode identifier](v5, "identifier");
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v42)
                              {
                                v56 = v42;
                                -[DNDMode identifier](self, "identifier");
                                v55 = (void *)objc_claimAutoreleasedReturnValue();
                                -[DNDMode identifier](v5, "identifier");
                                v43 = v38;
                                v44 = (void *)objc_claimAutoreleasedReturnValue();
                                v10 = objc_msgSend(v55, "isEqual:", v44);

                                v38 = v43;
                                v41 = v68;

                                v42 = v56;
                              }
                              else
                              {
                                v10 = 0;
                              }

                            }
                            else
                            {

                              v10 = 0;
                            }
                            v45 = v71;
                            v46 = v72 == v71;
                            goto LABEL_51;
                          }

                          v10 = 1;
                        }
                        else
                        {
                          v10 = 0;
                        }
                        v45 = v71;
                        v46 = v72 == v71;
                        v41 = v68;
LABEL_51:
                        v47 = v73;
                        if (v46)
                        {

                        }
                        else
                        {
                          v48 = v17;
                          v49 = v45;

                          v17 = v48;
                          v47 = v73;
                        }

                        if (v41 != v78)
                        {

                        }
                        if (v80 != v18)
                        {

                        }
                        if (v11 != v84)
                        {

                        }
LABEL_64:
                        v9 = v81;
                        v8 = v82;
                        if (v6 != v7)
                          goto LABEL_65;
LABEL_67:

                        goto LABEL_68;
                      }

                      v33 = v61;
                      v17 = v67;
                    }
                    v54 = v17;

                  }
                  else
                  {
                    v54 = v17;
                  }

                  if (v26 != v78)
                  {

                  }
                  v52 = v77;
                  if (v80 != v18)
                  {

                  }
                  v51 = v84;
                  if (v11 == v84)
                    goto LABEL_62;
                  goto LABEL_61;
                }

                v50 = v80;
                if (v80 != v18)
                {

                  goto LABEL_58;
                }
                goto LABEL_59;
              }

            }
            v50 = v80;
            if (v80 != v18)
            {

LABEL_58:
              goto LABEL_60;
            }
LABEL_59:

LABEL_60:
            v51 = v84;
            v52 = v77;
            if (v11 == v84)
            {
LABEL_62:

              goto LABEL_63;
            }
LABEL_61:

            goto LABEL_62;
          }

LABEL_39:
          if (v11 == v84)
          {

          }
          else
          {

          }
          goto LABEL_63;
        }

      }
      goto LABEL_39;
    }
    v10 = 0;
  }
LABEL_68:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  uint64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_class();
  -[DNDMode _name](self, "_name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDMode modeIdentifier](self, "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDMode _symbolImageName](self, "_symbolImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDMode _tintColorName](self, "_tintColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDMode symbolDescriptor](self, "symbolDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DNDMode semanticType](self, "semanticType");
  v9 = -[DNDMode visibility](self, "visibility");
  -[DNDMode identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DNDMode isPlaceholder](self, "isPlaceholder");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p; name: %@; modeIdentifier: %@; symbolImageName: %@; tintColorName: %@; symbolDescriptor: %@; semanticType: %zd; visibility: %lu; identifier: %@; isPlaceHolder: %@>"),
    v16,
    self,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v11,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDMode _initWithMode:]([DNDMutableMode alloc], "_initWithMode:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDMode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  DNDMode *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolImageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColorName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("semanticType")))
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("semanticType"));
  else
    v10 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("visibility")))
    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("visibility"));
  else
    v11 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("identifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:](self, "initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[DNDMode _name](self, "_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[DNDMode modeIdentifier](self, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modeIdentifier"));

  -[DNDMode _symbolImageName](self, "_symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("symbolImageName"));

  -[DNDMode _tintColorName](self, "_tintColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("tintColorName"));

  -[DNDMode symbolDescriptor](self, "symbolDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("symbolDescriptor"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDMode semanticType](self, "semanticType"), CFSTR("semanticType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDMode visibility](self, "visibility"), CFSTR("visibility"));
  -[DNDMode identifier](self, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("identifier"));

}

- (DNDModeSymbolDescriptor)symbolDescriptor
{
  return self->_symbolDescriptor;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_symbolDescriptor, 0);
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
