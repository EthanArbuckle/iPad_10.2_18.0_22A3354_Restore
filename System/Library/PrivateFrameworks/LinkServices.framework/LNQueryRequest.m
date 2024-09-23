@implementation LNQueryRequest

- (LNQueryRequest)initWithIdentifiers:(id)a3 entityMangledTypeName:(id)a4
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 0, a3, 0, 0, 0, 0, a4, 0, 0, 0, 0);
}

- (LNQueryRequest)initWithString:(id)a3 entityMangledTypeName:(id)a4
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 1, 0, a3, 0, 0, 0, a4, 0, 0, 0, 0);
}

- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 queryMangledTypeName:(id)a5 sortingOptions:(id)a6
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 2, 0, 0, a3, a4, 0, 0, 0, a5, 0, a6);
}

- (LNQueryRequest)initWithUniqueEntityMangledTypeName:(id)a3
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 3, 0, 0, 0, 0, 0, a3, 0, 0, 0, 0);
}

- (LNQueryRequest)initWithRequestType:(int64_t)a3 identifiersToMatch:(id)a4 stringToMatch:(id)a5 propertyQuery:(id)a6 maximumResultCount:(id)a7 entityIdentifier:(id)a8 entityMangledTypeName:(id)a9 queryIdentifier:(id)a10 queryMangledTypeName:(id)a11 intentMangledTypeNames:(id)a12 sortingOptions:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  LNQueryRequest *v26;
  LNQueryRequest *v27;
  uint64_t v28;
  NSArray *identifiersToMatch;
  uint64_t v30;
  NSString *stringToMatch;
  uint64_t v32;
  NSString *entityIdentifier;
  uint64_t v34;
  NSString *entityMangledTypeName;
  uint64_t v36;
  NSString *queryIdentifier;
  uint64_t v38;
  NSString *queryMangledTypeName;
  uint64_t v40;
  NSArray *intentMangledTypeNames;
  LNQueryRequest *v42;
  id obj;
  id v46;
  id v48;
  id v49;
  objc_super v50;

  v17 = a4;
  v18 = a5;
  obj = a6;
  v49 = a6;
  v46 = a7;
  v48 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = v18;
  v24 = a12;
  v25 = a13;
  v50.receiver = self;
  v50.super_class = (Class)LNQueryRequest;
  v26 = -[LNQueryRequest init](&v50, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_requestType = a3;
    v28 = objc_msgSend(v17, "copy");
    identifiersToMatch = v27->_identifiersToMatch;
    v27->_identifiersToMatch = (NSArray *)v28;

    v30 = objc_msgSend(v23, "copy");
    stringToMatch = v27->_stringToMatch;
    v27->_stringToMatch = (NSString *)v30;

    objc_storeStrong((id *)&v27->_propertyQuery, obj);
    objc_storeStrong((id *)&v27->_maximumResultCount, v46);
    v32 = objc_msgSend(v19, "copy");
    entityIdentifier = v27->_entityIdentifier;
    v27->_entityIdentifier = (NSString *)v32;

    v34 = objc_msgSend(v20, "copy");
    entityMangledTypeName = v27->_entityMangledTypeName;
    v27->_entityMangledTypeName = (NSString *)v34;

    v36 = objc_msgSend(v21, "copy");
    queryIdentifier = v27->_queryIdentifier;
    v27->_queryIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v22, "copy");
    queryMangledTypeName = v27->_queryMangledTypeName;
    v27->_queryMangledTypeName = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    intentMangledTypeNames = v27->_intentMangledTypeNames;
    v27->_intentMangledTypeNames = (NSArray *)v40;

    objc_storeStrong((id *)&v27->_sortingOptions, a13);
    v42 = v27;
  }

  return v27;
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
  id v14;

  v4 = a3;
  -[LNQueryRequest entityIdentifier](self, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityIdentifier"));

  -[LNQueryRequest entityMangledTypeName](self, "entityMangledTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("entityMangledTypeName"));

  -[LNQueryRequest intentMangledTypeNames](self, "intentMangledTypeNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("intentMangledTypeNames"));

  -[LNQueryRequest identifiersToMatch](self, "identifiersToMatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("identifiersToMatch"));

  -[LNQueryRequest maximumResultCount](self, "maximumResultCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("maximumResultCount"));

  -[LNQueryRequest propertyQuery](self, "propertyQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("propertyQuery"));

  -[LNQueryRequest queryIdentifier](self, "queryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("queryIdentifier"));

  -[LNQueryRequest queryMangledTypeName](self, "queryMangledTypeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("queryMangledTypeName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNQueryRequest requestType](self, "requestType"), CFSTR("requestType"));
  -[LNQueryRequest stringToMatch](self, "stringToMatch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("stringToMatch"));

  -[LNQueryRequest sortingOptions](self, "sortingOptions");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("sortingOptions"));

}

- (LNQueryRequest)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  LNQueryRequest *v26;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityMangledTypeName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("intentMangledTypeNames"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("identifiersToMatch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumResultCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyQuery"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryMangledTypeName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("requestType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringToMatch"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v19, CFSTR("sortingOptions"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", v15, v11, v16, v12, v22, v24, v23, v13, v14, v7, v20);
  return v26;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;
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
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  void *v24;

  v3 = -[LNQueryRequest requestType](self, "requestType");
  -[LNQueryRequest entityIdentifier](self, "entityIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash") + v3;
  -[LNQueryRequest identifiersToMatch](self, "identifiersToMatch");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v23, "hash");
  -[LNQueryRequest maximumResultCount](self, "maximumResultCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v4;
  -[LNQueryRequest propertyQuery](self, "propertyQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[LNQueryRequest queryIdentifier](self, "queryIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[LNQueryRequest stringToMatch](self, "stringToMatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[LNQueryRequest intentMangledTypeNames](self, "intentMangledTypeNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[LNQueryRequest sortingOptions](self, "sortingOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[LNQueryRequest entityMangledTypeName](self, "entityMangledTypeName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[LNQueryRequest queryMangledTypeName](self, "queryMangledTypeName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13 ^ v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  LNQueryRequest *v4;
  LNQueryRequest *v5;
  LNQueryRequest *v6;
  int64_t v7;
  void *v8;
  void *v9;
  LNQueryRequest *v10;
  LNQueryRequest *v11;
  LNQueryRequest *v12;
  int v13;
  LNQueryRequest *v14;
  LNQueryRequest *v15;
  int v16;
  void *v17;
  void *v18;
  LNQueryRequest *v19;
  LNQueryRequest *v20;
  LNQueryRequest *v21;
  int v22;
  void *v23;
  void *v24;
  LNQueryRequest *v25;
  LNQueryRequest *v26;
  void *v27;
  void *v28;
  LNQueryRequest *v29;
  LNQueryRequest *v30;
  LNQueryRequest *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  LNQueryRequest *v35;
  LNQueryRequest *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  LNQueryRequest *v40;
  LNQueryRequest *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  LNQueryRequest *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  BOOL v65;
  void *v66;
  id v68;
  void *v69;
  void *v70;
  LNQueryRequest *v71;
  LNQueryRequest *v72;
  void *v73;
  LNQueryRequest *v74;
  LNQueryRequest *v75;
  LNQueryRequest *v76;
  LNQueryRequest *v77;
  LNQueryRequest *v78;
  LNQueryRequest *v79;
  LNQueryRequest *v80;
  LNQueryRequest *v81;

  v4 = (LNQueryRequest *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNQueryRequest requestType](self, "requestType");
        if (v7 != -[LNQueryRequest requestType](v6, "requestType"))
        {
          LOBYTE(v13) = 0;
LABEL_89:

          goto LABEL_90;
        }
        -[LNQueryRequest entityIdentifier](self, "entityIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryRequest entityIdentifier](v6, "entityIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          v14 = v11;
          v15 = v10;
          if (!v10 || !v11)
            goto LABEL_86;
          v16 = -[LNQueryRequest isEqualToString:](v10, "isEqualToString:", v11);

          if (!v16)
          {
            LOBYTE(v13) = 0;
LABEL_87:

            goto LABEL_88;
          }
        }
        -[LNQueryRequest entityMangledTypeName](self, "entityMangledTypeName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryRequest entityMangledTypeName](v6, "entityMangledTypeName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v17;
        v19 = v18;
        v14 = v19;
        if (v15 == v19)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          v20 = v19;
          v21 = v15;
          if (!v15 || !v19)
            goto LABEL_85;
          v22 = -[LNQueryRequest isEqualToString:](v15, "isEqualToString:", v19);

          if (!v22)
          {
            LOBYTE(v13) = 0;
LABEL_86:

            goto LABEL_87;
          }
        }
        -[LNQueryRequest identifiersToMatch](self, "identifiersToMatch");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryRequest identifiersToMatch](v6, "identifiersToMatch");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v23;
        v25 = v24;
        v20 = v25;
        v81 = v21;
        if (v21 == v25)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          v26 = v25;
          if (!v21 || !v25)
            goto LABEL_84;
          v13 = -[LNQueryRequest isEqual:](v21, "isEqual:", v25);

          if (!v13)
            goto LABEL_85;
        }
        v80 = v20;
        -[LNQueryRequest maximumResultCount](self, "maximumResultCount");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryRequest maximumResultCount](v6, "maximumResultCount");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v30 = v28;
        v78 = v30;
        v79 = v29;
        if (v29 == v30)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          if (!v29)
          {
            v31 = v30;
            v20 = v80;
            goto LABEL_82;
          }
          v31 = v30;
          v20 = v80;
          if (!v30)
          {
LABEL_82:

            goto LABEL_83;
          }
          v32 = -[LNQueryRequest isEqual:](v29, "isEqual:", v30);

          if (!v32)
          {
            LOBYTE(v13) = 0;
            v20 = v80;
LABEL_83:
            v26 = v78;
            v21 = v79;
LABEL_84:

            v21 = v81;
LABEL_85:

            goto LABEL_86;
          }
        }
        -[LNQueryRequest propertyQuery](self, "propertyQuery");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryRequest propertyQuery](v6, "propertyQuery");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v33;
        v35 = v34;
        v76 = v29;
        v77 = v35;
        if (v29 != v35)
        {
          LOBYTE(v13) = 0;
          if (v29)
          {
            v36 = v35;
            v20 = v80;
            if (v35)
            {
              v37 = -[LNQueryRequest isEqual:](v29, "isEqual:", v35);

              if (!v37)
              {
                LOBYTE(v13) = 0;
                v20 = v80;
                v31 = v77;
                goto LABEL_82;
              }
LABEL_39:
              -[LNQueryRequest queryIdentifier](self, "queryIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[LNQueryRequest queryIdentifier](v6, "queryIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v38;
              v41 = v39;
              v74 = v41;
              v75 = v40;
              if (v40 == v41)
              {

              }
              else
              {
                LOBYTE(v13) = 0;
                if (!v40)
                {
                  v42 = v41;
                  v20 = v80;
                  goto LABEL_79;
                }
                v42 = v41;
                v20 = v80;
                if (!v41)
                {
LABEL_79:

                  goto LABEL_80;
                }
                v43 = -[LNQueryRequest isEqualToString:](v40, "isEqualToString:", v41);

                if (!v43)
                {
                  LOBYTE(v13) = 0;
                  v20 = v80;
LABEL_80:
                  v36 = (LNQueryRequest *)v74;
                  v29 = v75;
                  goto LABEL_81;
                }
              }
              -[LNQueryRequest queryMangledTypeName](self, "queryMangledTypeName");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[LNQueryRequest queryMangledTypeName](v6, "queryMangledTypeName");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v44;
              v46 = v45;
              v72 = v40;
              v73 = v46;
              if (v40 != v46)
              {
                LOBYTE(v13) = 0;
                if (v40)
                {
                  v47 = v46;
                  v20 = v80;
                  if (v46)
                  {
                    v48 = -[LNQueryRequest isEqualToString:](v40, "isEqualToString:", v46);

                    if (!v48)
                    {
                      LOBYTE(v13) = 0;
                      v20 = v80;
                      v42 = v73;
                      goto LABEL_79;
                    }
LABEL_53:
                    -[LNQueryRequest stringToMatch](self, "stringToMatch");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[LNQueryRequest stringToMatch](v6, "stringToMatch");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = v49;
                    v52 = v50;
                    v70 = v52;
                    v71 = v51;
                    if (v51 == v52)
                    {

                    }
                    else
                    {
                      LOBYTE(v13) = 0;
                      if (!v51)
                      {
                        v53 = v52;
                        v20 = v80;
                        goto LABEL_76;
                      }
                      v53 = v52;
                      v20 = v80;
                      if (!v52)
                      {
LABEL_76:

                        goto LABEL_77;
                      }
                      v54 = objc_msgSend(v51, "isEqualToString:", v52);

                      if (!v54)
                      {
                        LOBYTE(v13) = 0;
                        v20 = v80;
LABEL_77:
                        v47 = v70;
                        v40 = (LNQueryRequest *)v71;
                        goto LABEL_78;
                      }
                    }
                    -[LNQueryRequest sortingOptions](self, "sortingOptions");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    -[LNQueryRequest sortingOptions](v6, "sortingOptions");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = v55;
                    v57 = v56;
                    v68 = v51;
                    v69 = v57;
                    if (v51 != v57)
                    {
                      LOBYTE(v13) = 0;
                      if (v51)
                      {
                        v58 = v57;
                        v20 = v80;
                        if (v57)
                        {
                          v59 = objc_msgSend(v51, "isEqual:", v57);

                          if (!v59)
                          {
                            LOBYTE(v13) = 0;
                            v20 = v80;
                            v53 = v69;
                            goto LABEL_76;
                          }
                          goto LABEL_67;
                        }
                      }
                      else
                      {
                        v58 = v57;
                        v20 = v80;
                      }
LABEL_75:

                      v51 = v68;
                      v53 = v69;
                      goto LABEL_76;
                    }

LABEL_67:
                    -[LNQueryRequest intentMangledTypeNames](self, "intentMangledTypeNames", v51);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    -[LNQueryRequest intentMangledTypeNames](v6, "intentMangledTypeNames");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    v62 = v60;
                    v63 = v61;
                    v64 = v62;
                    v65 = v62 == v63;
                    v66 = v63;
                    if (v65)
                    {
                      LOBYTE(v13) = 1;
                      v20 = v80;
                    }
                    else
                    {
                      LOBYTE(v13) = 0;
                      v20 = v80;
                      if (v64 && v63)
                        LOBYTE(v13) = objc_msgSend(v64, "isEqual:", v63);
                    }

                    v58 = v66;
                    v51 = v64;
                    goto LABEL_75;
                  }
                }
                else
                {
                  v47 = v46;
                  v20 = v80;
                }
LABEL_78:

                v40 = (LNQueryRequest *)v72;
                v42 = v73;
                goto LABEL_79;
              }

              goto LABEL_53;
            }
          }
          else
          {
            v36 = v35;
            v20 = v80;
          }
LABEL_81:

          v29 = v76;
          v31 = v77;
          goto LABEL_82;
        }

        goto LABEL_39;
      }
      LOBYTE(v13) = 0;
      v10 = v6;
      v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v13) = 0;
    }
LABEL_88:

    goto LABEL_89;
  }
  LOBYTE(v13) = 1;
LABEL_90:

  return v13;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (NSArray)identifiersToMatch
{
  return self->_identifiersToMatch;
}

- (NSString)stringToMatch
{
  return self->_stringToMatch;
}

- (LNPropertyQuery)propertyQuery
{
  return self->_propertyQuery;
}

- (NSArray)sortingOptions
{
  return self->_sortingOptions;
}

- (NSNumber)maximumResultCount
{
  return self->_maximumResultCount;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)entityMangledTypeName
{
  return self->_entityMangledTypeName;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (NSString)queryMangledTypeName
{
  return self->_queryMangledTypeName;
}

- (NSArray)intentMangledTypeNames
{
  return self->_intentMangledTypeNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMangledTypeNames, 0);
  objc_storeStrong((id *)&self->_queryMangledTypeName, 0);
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_entityMangledTypeName, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumResultCount, 0);
  objc_storeStrong((id *)&self->_sortingOptions, 0);
  objc_storeStrong((id *)&self->_propertyQuery, 0);
  objc_storeStrong((id *)&self->_stringToMatch, 0);
  objc_storeStrong((id *)&self->_identifiersToMatch, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNQueryRequest)initWithIdentifiers:(id)a3 entityType:(id)a4
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 0, a3, 0, 0, 0, 0, a4, 0, 0, 0, 0);
}

- (LNQueryRequest)initWithString:(id)a3 entityType:(id)a4
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 1, 0, a3, 0, 0, 0, a4, 0, 0, 0, 0);
}

- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 queryType:(id)a5 sortingOptions:(id)a6
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 2, 0, 0, a3, a4, 0, 0, a5, 0, 0, a6);
}

- (LNQueryRequest)initWithPropertyQuery:(id)a3 maximumResultCount:(id)a4 entityType:(id)a5 intentMangledTypeNames:(id)a6 sortingOptions:(id)a7
{
  return -[LNQueryRequest initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:](self, "initWithRequestType:identifiersToMatch:stringToMatch:propertyQuery:maximumResultCount:entityIdentifier:entityMangledTypeName:queryIdentifier:queryMangledTypeName:intentMangledTypeNames:sortingOptions:", 2, 0, 0, a3, a4, a5, 0, 0, 0, a6, a7);
}

@end
