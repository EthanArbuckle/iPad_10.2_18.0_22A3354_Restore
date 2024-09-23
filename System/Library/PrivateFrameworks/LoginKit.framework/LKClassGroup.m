@implementation LKClassGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKClassGroup)initWithCoder:(id)a3
{
  id v4;
  LKClassGroup *v5;
  uint64_t v6;
  NSString *classGroupName;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *classes;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LKClassGroup;
  v5 = -[LKClassGroup init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classGroupName"));
    v6 = objc_claimAutoreleasedReturnValue();
    classGroupName = v5->_classGroupName;
    v5->_classGroupName = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("classes"));
    v11 = objc_claimAutoreleasedReturnValue();
    classes = v5->_classes;
    v5->_classes = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *classGroupName;
  id v5;

  classGroupName = self->_classGroupName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", classGroupName, CFSTR("classGroupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classes, CFSTR("classes"));

}

- (BOOL)isEqual:(id)a3
{
  LKClassGroup *v4;
  LKClassGroup *v5;
  BOOL v6;

  v4 = (LKClassGroup *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[LKClassGroup isEqualToLKClassGroup:](self, "isEqualToLKClassGroup:", v5);

  return v6;
}

- (BOOL)isEqualToLKClassGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[LKClassGroup classGroupName](self, "classGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[LKClassGroup classes](self, "classes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "classes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToArray:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (LKClassGroup)initWithGroupName:(id)a3 classes:(id)a4
{
  id v7;
  id v8;
  LKClassGroup *v9;
  LKClassGroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LKClassGroup;
  v9 = -[LKClassGroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_classGroupName, a3);
    objc_storeStrong((id *)&v10->_classes, a4);
  }

  return v10;
}

- (LKClassGroup)initWithClassGroupDictionary:(id)a3 classesDictionaryByClassID:(id)a4
{
  id v6;
  id v7;
  LKClassGroup *v8;
  uint64_t v9;
  NSString *classGroupName;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSArray *classes;
  LKClassGroup *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LKRegisterLoginKitLogging();
  v30.receiver = self;
  v30.super_class = (Class)LKClassGroup;
  v8 = -[LKClassGroup init](&v30, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("Name"));
    v9 = objc_claimAutoreleasedReturnValue();
    classGroupName = v8->_classGroupName;
    v24 = v8;
    v8->_classGroupName = (NSString *)v9;

    v11 = (NSArray *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v6;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GroupBeaconIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (!v13)
      goto LABEL_14;
    v14 = v13;
    v15 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v17, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v7, "objectForKey:", v17);
          v19 = objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v11, "addObject:", v19);
        }
        else
        {
          v20 = (void *)LKLogParsing;
          if (!os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEFAULT))
            goto LABEL_12;
          v19 = v20;
          objc_msgSend(v17, "stringValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v21;
          _os_log_impl(&dword_2167FC000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring the classID %@ because there is no class with that id.", buf, 0xCu);

        }
LABEL_12:

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (!v14)
      {
LABEL_14:

        v8 = v24;
        classes = v24->_classes;
        v24->_classes = v11;

        v6 = v25;
        break;
      }
    }
  }

  return v8;
}

- (NSString)classGroupName
{
  return self->_classGroupName;
}

- (NSArray)classes
{
  return self->_classes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_classGroupName, 0);
}

@end
