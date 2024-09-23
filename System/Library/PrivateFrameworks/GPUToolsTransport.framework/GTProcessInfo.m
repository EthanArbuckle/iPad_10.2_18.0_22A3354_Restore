@implementation GTProcessInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTProcessInfo)init
{
  GTProcessInfo *v2;
  void *v3;
  uint64_t v4;
  NSString *processName;
  uint64_t v6;
  NSDictionary *environment;
  uint64_t v8;
  NSArray *arguments;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GTProcessInfo;
  v2 = -[GTProcessInfo init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = objc_claimAutoreleasedReturnValue();
    processName = v2->_processName;
    v2->_processName = (NSString *)v4;

    objc_msgSend(v3, "environment");
    v6 = objc_claimAutoreleasedReturnValue();
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)v6;

    objc_msgSend(v3, "arguments");
    v8 = objc_claimAutoreleasedReturnValue();
    arguments = v2->_arguments;
    v2->_arguments = (NSArray *)v8;

    v2->_processIdentifier = objc_msgSend(v3, "processIdentifier");
    v2->_ppid = getppid();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)v11;

  }
  return v2;
}

- (GTProcessInfo)initWithCoder:(id)a3
{
  id v4;
  GTProcessInfo *v5;
  uint64_t v6;
  NSString *processName;
  NSString *v8;
  uint64_t v9;
  NSArray *arguments;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  NSDictionary *environment;
  NSDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  char isKindOfClass;
  NSDictionary *v27;
  void *v28;
  char v29;
  uint64_t v30;
  NSString *bundleIdentifier;
  NSString *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)GTProcessInfo;
  v5 = -[GTProcessInfo init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processName"));
    v6 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v6;

    if (v5->_processName)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = v5->_processName;
        v5->_processName = 0;

      }
    }
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("arguments"));
    v9 = objc_claimAutoreleasedReturnValue();
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v9;

    if (v5->_arguments)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v11 = v5->_arguments;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v39 != v14)
                objc_enumerationMutation(v11);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v16 = v5->_arguments;
                v5->_arguments = 0;

                goto LABEL_18;
              }
            }
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
            if (v13)
              continue;
            break;
          }
        }
      }
      else
      {
        v11 = v5->_arguments;
        v5->_arguments = 0;
      }
LABEL_18:

    }
    v17 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v17, objc_opt_class(), CFSTR("environment"));
    v18 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (NSDictionary *)v18;

    if (v5->_environment)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v20 = v5->_environment;
        v21 = -[NSDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v35 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v27 = v5->_environment;
              if ((isKindOfClass & 1) == 0)
                goto LABEL_33;
              -[NSDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v25, (_QWORD)v34);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v29 = objc_opt_isKindOfClass();

              if ((v29 & 1) == 0)
              {
                v27 = v5->_environment;
LABEL_33:
                v5->_environment = 0;

                goto LABEL_34;
              }
            }
            v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            if (v22)
              continue;
            break;
          }
        }
      }
      else
      {
        v20 = v5->_environment;
        v5->_environment = 0;
      }
LABEL_34:

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v30 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v30;

    if (v5->_bundleIdentifier)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v32 = v5->_bundleIdentifier;
        v5->_bundleIdentifier = 0;

      }
    }
    v5->_processIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("processIdentifier"), (_QWORD)v34);
    v5->_ppid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ppid"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *processName;
  id v5;

  processName = self->_processName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", processName, CFSTR("processName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arguments, CFSTR("arguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_processIdentifier, CFSTR("processIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_ppid, CFSTR("ppid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  GTProcessInfo *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(GTProcessInfo);
  -[GTProcessInfo setProcessName:](v4, "setProcessName:", self->_processName);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_arguments, 1);
  -[GTProcessInfo setArguments:](v4, "setArguments:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", self->_environment, 1);
  -[GTProcessInfo setEnvironment:](v4, "setEnvironment:", v6);

  -[GTProcessInfo setBundleIdentifier:](v4, "setBundleIdentifier:", self->_bundleIdentifier);
  -[GTProcessInfo setProcessIdentifier:](v4, "setProcessIdentifier:", self->_processIdentifier);
  -[GTProcessInfo setProcessName:](v4, "setProcessName:", self->_processName);
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: processName=%@ arguments=%@ environment=%@ bundleIdentifier=%@ processIdentifier=%d ppid=%d>"), v5, self->_processName, self->_arguments, self->_environment, self->_bundleIdentifier, self->_processIdentifier, self->_ppid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (int)ppid
{
  return self->_ppid;
}

- (void)setPpid:(int)a3
{
  self->_ppid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
