@implementation EMBusinessExternalID

- (EMBusinessExternalID)initWithGrouping:(int64_t)a3 components:(id)a4 serializedRepresentation:(id)a5
{
  id v9;
  id v10;
  EMBusinessExternalID *v11;
  EMBusinessExternalID *v12;
  id v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMBusinessExternalID;
  v11 = -[EMBusinessExternalID init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_grouping = a3;
    objc_storeStrong((id *)&v11->_components, a4);
    if (v10)
      v13 = (id)EFAtomicObjectSetIfNil();
  }

  return v12;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)EFAtomicObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)EMBusinessExternalID;
  -[EMBusinessExternalID dealloc](&v4, sel_dealloc);
}

+ (id)externalIDForSimpleAddress:(id)a3
{
  id v4;
  _EMBusinessExternalIDComponents *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(_EMBusinessExternalIDComponents);
  v6 = (void *)objc_msgSend(v4, "copy");
  -[_EMBusinessExternalIDComponents setSimpleAddress:](v5, "setSimpleAddress:", v6);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGrouping:components:serializedRepresentation:", 2, v5, 0);
  return v7;
}

+ (id)externalIDForHighLevelDomain:(id)a3
{
  id v4;
  _EMBusinessExternalIDComponents *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(_EMBusinessExternalIDComponents);
  v6 = (void *)objc_msgSend(v4, "copy");
  -[_EMBusinessExternalIDComponents setHighLevelDomain:](v5, "setHighLevelDomain:", v6);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGrouping:components:serializedRepresentation:", 3, v5, 0);
  return v7;
}

+ (id)externalIDForHighLevelDomain:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  _EMBusinessExternalIDComponents *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_EMBusinessExternalIDComponents);
  v9 = (void *)objc_msgSend(v6, "copy");
  -[_EMBusinessExternalIDComponents setHighLevelDomain:](v8, "setHighLevelDomain:", v9);

  v10 = (void *)objc_msgSend(v7, "copy");
  -[_EMBusinessExternalIDComponents setDisplayName:](v8, "setDisplayName:", v10);

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGrouping:components:serializedRepresentation:", 1, v8, 0);
  return v11;
}

+ (id)externalIDForHighLevelDomain:(id)a3 displayNameCommonPrefix:(id)a4
{
  id v6;
  id v7;
  _EMBusinessExternalIDComponents *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_EMBusinessExternalIDComponents);
  v9 = (void *)objc_msgSend(v6, "copy");
  -[_EMBusinessExternalIDComponents setHighLevelDomain:](v8, "setHighLevelDomain:", v9);

  v10 = (void *)objc_msgSend(v7, "copy");
  -[_EMBusinessExternalIDComponents setDisplayName:](v8, "setDisplayName:", v10);

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGrouping:components:serializedRepresentation:", 0, v8, 0);
  return v11;
}

+ (id)externalIDForSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a3;
  v10 = 0;
  objc_msgSend(a1, "_groupingForSerializedRepresentation:components:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGrouping:components:serializedRepresentation:", objc_msgSend(v5, "integerValue"), v6, v4);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  EMBusinessExternalID *v4;
  EMBusinessExternalID *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (EMBusinessExternalID *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if ((-[EMBusinessExternalID isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    v6 = -[EMBusinessExternalID grouping](self, "grouping");
    if (v6 == -[EMBusinessExternalID grouping](v5, "grouping"))
    {
      -[EMBusinessExternalID components](self, "components");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMBusinessExternalID components](v5, "components");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = EFObjectsAreEqual();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[EMBusinessExternalID grouping](self, "grouping");
  -[EMBusinessExternalID components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 33 * v3 + objc_msgSend(v4, "hash") + 1089;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[EMBusinessExternalID grouping](self, "grouping");
  -[EMBusinessExternalID components](self, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[EMBusinessExternalID serializedRepresentation](self, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithGrouping:components:serializedRepresentation:", v5, v7, v8);

  return v9;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;

  -[EMBusinessExternalID serializedRepresentation](self, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBusinessExternalID _loggingDescriptionForSerializedRepresentation:](self, "_loggingDescriptionForSerializedRepresentation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)_loggingDescriptionForSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternal");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBusinessExternalID _redactComponent:](self, "_redactComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUser:", v9);

    objc_msgSend(v7, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBusinessExternalID _redactComponent:](self, "_redactComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHost:", v11);

    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13 >= 3)
    {
      objc_msgSend(v7, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "substringFromIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMBusinessExternalID _redactComponent:](self, "_redactComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("/%@"), v16);
      objc_msgSend(v7, "setPath:", v17);

    }
    objc_msgSend(v7, "queryItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      objc_msgSend(v7, "queryItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __71__EMBusinessExternalID__loggingDescriptionForSerializedRepresentation___block_invoke;
      v25[3] = &unk_1E70F2378;
      v25[4] = self;
      objc_msgSend(v20, "ef_map:", v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setQueryItems:", v21);

    }
    objc_msgSend(v7, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ef_stringByReplacingPercentEscapesUsingEncoding:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

id __71__EMBusinessExternalID__loggingDescriptionForSerializedRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_redactComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_redactComponent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") > 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "substringToIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%lu"), v6, objc_msgSend(v3, "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (NSString)highLevelDomain
{
  void *v2;
  void *v3;

  -[EMBusinessExternalID components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highLevelDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[EMBusinessExternalID components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)simpleAddress
{
  void *v2;
  void *v3;

  -[EMBusinessExternalID components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)serializedRepresentation
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  EFAtomicObjectLoad();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)objc_opt_class();
    v5 = -[EMBusinessExternalID grouping](self, "grouping");
    -[EMBusinessExternalID components](self, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_serializedRepresentationForGrouping:components:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    EFAtomicObjectSetIfNil();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

+ (id)_serializedRepresentationForGrouping:(int64_t)a3 components:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0:
      objc_msgSend(v6, "highLevelDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_serializedRepresentationUsingScheme:highLevelDomain:andDisplayName:", CFSTR("business-hld-cp"), v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 1:
      objc_msgSend(v6, "highLevelDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_serializedRepresentationUsingScheme:highLevelDomain:andDisplayName:", CFSTR("business-hld-dn"), v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v11 = (void *)v10;

      goto LABEL_8;
    case 2:
      objc_msgSend(v6, "simpleAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_serializedRepresentationUsingSimpleAddress:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(v6, "highLevelDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_serializedRepresentationUsingHighLevelDomain:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v12;
LABEL_8:

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

+ (id)_serializedRepresentationUsingSimpleAddress:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("business-addr"));
  objc_msgSend(v3, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v5, "localPart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUser:", v7);

  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHost:", v8);

  objc_msgSend(v4, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_3:
    objc_msgSend(v4, "setUser:", 0);
    objc_msgSend(v4, "setHost:", 0);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("invalid-addr"), v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v11);

    objc_msgSend(v4, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_serializedRepresentationUsingHighLevelDomain:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("business-hld"));
  objc_msgSend(v4, "setHost:", v3);
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "setHost:", 0);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("invalid-hld"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v7);

    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_serializedRepresentationUsingScheme:(id)a3 highLevelDomain:(id)a4 andDisplayName:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v10, "setScheme:", v7);
  objc_msgSend(v10, "setHost:", v8);
  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("/%@"), v9);
    objc_msgSend(v10, "setPath:", v11);

  }
  objc_msgSend(v10, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v10, "setHost:", 0);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("invalid-hld"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setQueryItems:", v14);

    objc_msgSend(v10, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_groupingForSerializedRepresentation:(id)a3 components:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "scheme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("business-addr")))
      {
        if (!a4)
        {
          v11 = &unk_1E711F2D8;
LABEL_17:

          goto LABEL_22;
        }
        objc_msgSend(a1, "_componentsForSimpleAddressURL:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = &unk_1E711F2D8;
LABEL_16:
        *a4 = v10;
        goto LABEL_17;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("business-hld")))
      {
        if (!a4)
        {
          v11 = &unk_1E711F2F0;
          goto LABEL_17;
        }
        objc_msgSend(a1, "_componentsForHighLevelDomainURL:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = &unk_1E711F2F0;
        goto LABEL_16;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("business-hld-dn")))
      {
        if (!a4)
        {
          v11 = &unk_1E711F308;
          goto LABEL_17;
        }
        objc_msgSend(a1, "_componentsForHighLevelDomainDisplayNameURL:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = &unk_1E711F308;
        goto LABEL_16;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("business-hld-cp")))
      {
        if (!a4)
        {
          v11 = &unk_1E711F320;
          goto LABEL_17;
        }
        objc_msgSend(a1, "_componentsForHighLevelDomainDisplayNameURL:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = &unk_1E711F320;
        goto LABEL_16;
      }

    }
  }
  v11 = 0;
  if (a4)
    *a4 = 0;
LABEL_22:

  return v11;
}

+ (id)_componentsForSimpleAddressURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _EMBusinessExternalIDComponents *v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  objc_msgSend(a1, "_queryItemValueForName:fromURLComponents:", CFSTR("invalid-addr"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_3;
  v7 = objc_alloc_init(MEMORY[0x1E0D1E6C0]);
  objc_msgSend(v5, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalPart:", v8);

  objc_msgSend(v5, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDomain:", v9);

  objc_msgSend(v7, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_3:
    v10 = objc_alloc_init(_EMBusinessExternalIDComponents);
    -[_EMBusinessExternalIDComponents setSimpleAddress:](v10, "setSimpleAddress:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_componentsForHighLevelDomainURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _EMBusinessExternalIDComponents *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  objc_msgSend(a1, "_queryItemValueForName:fromURLComponents:", CFSTR("invalid-hld"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (objc_msgSend(v5, "host"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = objc_alloc_init(_EMBusinessExternalIDComponents);
    -[_EMBusinessExternalIDComponents setHighLevelDomain:](v7, "setHighLevelDomain:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_componentsForHighLevelDomainDisplayNameURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _EMBusinessExternalIDComponents *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  objc_msgSend(a1, "_queryItemValueForName:fromURLComponents:", CFSTR("invalid-hld"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_EMBusinessExternalIDComponents *)objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v5, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringFromIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (v6 && v10)
    {
      v8 = objc_alloc_init(_EMBusinessExternalIDComponents);
      -[_EMBusinessExternalIDComponents setHighLevelDomain:](v8, "setHighLevelDomain:", v6);
      -[_EMBusinessExternalIDComponents setDisplayName:](v8, "setDisplayName:", v10);
    }
  }
  else
  {
    v10 = 0;
  }

  return v8;
}

+ (id)_queryItemValueForName:(id)a3 fromURLComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "count");

  if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "queryItems", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if (v14)
          {
            objc_msgSend(v12, "value");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v8 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v8;
}

- (int64_t)grouping
{
  return self->_grouping;
}

- (_EMBusinessExternalIDComponents)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

@end
