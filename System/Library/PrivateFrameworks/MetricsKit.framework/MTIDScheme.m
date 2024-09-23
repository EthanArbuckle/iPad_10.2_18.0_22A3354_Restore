@implementation MTIDScheme

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_correlations, 0);
  objc_storeStrong((id *)&self->_idNamespace, 0);
}

- (NSString)idNamespace
{
  return self->_idNamespace;
}

- (NSArray)correlations
{
  return self->_correlations;
}

- (MTIDScheme)initWithNamespace:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  MTIDScheme *v8;
  MTIDScheme *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MTIDScheme;
  v8 = -[MTIDScheme init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MTIDScheme setIdNamespace:](v8, "setIdNamespace:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rotation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(CFSTR("daily"), "compare:options:", v10, 1);

      if (v11)
      {
        -[MTIDScheme setRotationSchedule:](v9, "setRotationSchedule:", 0);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lifespan"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTIDScheme setLifespan:](v9, "setLifespan:", objc_msgSend(v12, "longLongValue"));

      }
      else
      {
        -[MTIDScheme setRotationSchedule:](v9, "setRotationSchedule:", 1);
        -[MTIDScheme setLifespan:](v9, "setLifespan:", 86400);
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("correlations"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");
      -[MTIDScheme setCorrelations:](v9, "setCorrelations:", v14);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDScheme setVersion:](v9, "setVersion:", v15);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(CFSTR("userid"), "caseInsensitiveCompare:", v16))
        {
          if (objc_msgSend(CFSTR("user"), "caseInsensitiveCompare:", v16))
            v17 = 1;
          else
            v17 = 2;
        }
        else
        {
          v17 = 2;
        }
      }
      else
      {
        v17 = 1;
      }
      -[MTIDScheme setIdType:](v9, "setIdType:", v17);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("container"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTIDScheme setContainerIdentifier:](v9, "setContainerIdentifier:", v18);

    }
    else
    {
      -[MTIDScheme setIdType:](v9, "setIdType:", 1);
    }
    -[MTIDScheme overrideLifespanMaybe](v9, "overrideLifespanMaybe");
    -[MTIDScheme setLocalHash:](v9, "setLocalHash:", -[MTIDScheme calculateHash](v9, "calculateHash"));
  }

  return v9;
}

- (void)setLocalHash:(unint64_t)a3
{
  self->_localHash = a3;
}

- (void)setIdType:(int64_t)a3
{
  self->_idType = a3;
}

- (void)setIdNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setTopics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setRotationSchedule:(int64_t)a3
{
  self->_rotationSchedule = a3;
}

- (void)setLifespan:(int64_t)a3
{
  self->_lifespan = a3;
}

- (void)setCorrelations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setCorrelationHash:(unint64_t)a3
{
  self->_correlationHash = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  char v28;
  void *v30;
  void *v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[MTIDScheme hash](self, "hash");
    if (v6 == objc_msgSend(v5, "hash"))
    {
      -[MTIDScheme idNamespace](self, "idNamespace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "idNamespace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8)
        && (v9 = -[MTIDScheme lifespan](self, "lifespan"), v9 == objc_msgSend(v5, "lifespan"))
        && (v10 = -[MTIDScheme idType](self, "idType"), v10 == objc_msgSend(v5, "idType")))
      {
        -[MTIDScheme correlations](self, "correlations");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = MEMORY[0x24BDBD1A8];
        if (v11)
          v14 = (void *)v11;
        else
          v14 = (void *)MEMORY[0x24BDBD1A8];
        objc_msgSend(v5, "correlations");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = v15;
        else
          v17 = v13;
        if (objc_msgSend(v14, "isEqual:", v17))
        {
          -[MTIDScheme version](self, "version");
          v18 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v18;
          if (v18)
            v19 = (__CFString *)v18;
          else
            v19 = &stru_24C7A22D0;
          objc_msgSend(v5, "version");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v20)
            v22 = (const __CFString *)v20;
          else
            v22 = &stru_24C7A22D0;
          if (-[__CFString isEqual:](v19, "isEqual:", v22))
          {
            -[MTIDScheme containerIdentifier](self, "containerIdentifier");
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
              v24 = (__CFString *)v23;
            else
              v24 = &stru_24C7A22D0;
            objc_msgSend(v5, "containerIdentifier", v23, v31);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)v25;
            if (v25)
              v27 = (const __CFString *)v25;
            else
              v27 = &stru_24C7A22D0;
            v28 = -[__CFString isEqual:](v24, "isEqual:", v27);

          }
          else
          {
            v28 = 0;
          }

        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)calculateHash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[MTIDScheme idNamespace](self, "idNamespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[MTIDScheme lifespan](self, "lifespan");
  v6 = v5 ^ -[MTIDScheme rotationSchedule](self, "rotationSchedule") ^ v4;
  -[MTIDScheme version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  v9 = v6 ^ v8 ^ -[MTIDScheme idType](self, "idType");
  -[MTIDScheme containerIdentifier](self, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MTIDScheme correlations](self, "correlations", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v11 ^= objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "hash");
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  return v11;
}

- (int64_t)lifespan
{
  return self->_lifespan;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)containerIdentifier
{
  NSString *containerIdentifier;
  __CFString *v3;
  void *v4;

  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier)
  {
    v3 = containerIdentifier;
  }
  else if (-[MTIDScheme idType](self, "idType") == 2)
  {
    v3 = CFSTR("com.apple.amp-ae.metricskit.identifiers");
  }
  else
  {
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostProcessBundleIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (int64_t)idType
{
  return self->_idType;
}

- (int64_t)rotationSchedule
{
  return self->_rotationSchedule;
}

- (void)overrideLifespanMaybe
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[MTIDScheme idNamespace](self, "idNamespace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("MTIDServiceLifespanOverride~%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v9, "integerForKey:", v7);
    if (!v8)
      v8 = objc_msgSend(v9, "integerForKey:", CFSTR("MTIDServiceLifespanOverride"));
    if (v8 >= 1)
    {
      -[MTIDScheme setRotationSchedule:](self, "setRotationSchedule:", 0);
      -[MTIDScheme setLifespan:](self, "setLifespan:", v8);
    }

  }
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[MTIDScheme localHash](self, "localHash");
  return -[MTIDScheme correlationHash](self, "correlationHash") ^ v3;
}

- (unint64_t)localHash
{
  return self->_localHash;
}

- (unint64_t)correlationHash
{
  return self->_correlationHash;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (MTIDScheme)initWithNamespace:(id)a3 type:(int64_t)a4
{
  id v6;
  MTIDScheme *v7;
  MTIDScheme *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTIDScheme;
  v7 = -[MTIDScheme init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MTIDScheme setIdNamespace:](v7, "setIdNamespace:", v6);
    -[MTIDScheme setIdType:](v8, "setIdType:", a4);
    -[MTIDScheme overrideLifespanMaybe](v8, "overrideLifespanMaybe");
    -[MTIDScheme setLocalHash:](v8, "setLocalHash:", -[MTIDScheme calculateHash](v8, "calculateHash"));
  }

  return v8;
}

- (double)maxFutureTimeInterval
{
  unint64_t v3;
  double v4;
  double v5;

  if (!-[MTIDScheme lifespan](self, "lifespan"))
    return 1.79769313e308;
  v3 = -[MTIDScheme storagePoolSize](self, "storagePoolSize");
  v4 = (double)(-[MTIDScheme lifespan](self, "lifespan") * v3);
  -[MTIDScheme maxPastTimeInterval](self, "maxPastTimeInterval");
  return v4 - v5;
}

- (double)maxPastTimeInterval
{
  return (double)(2 * -[MTIDScheme lifespan](self, "lifespan"));
}

- (unint64_t)storagePoolSize
{
  unint64_t v3;

  if (!-[MTIDScheme lifespan](self, "lifespan"))
    return 1;
  v3 = 0x2A3000uLL / -[MTIDScheme lifespan](self, "lifespan");
  if (v3 <= 3)
    v3 = 3;
  if (v3 >= 0x20)
    return 32;
  else
    return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MTIDScheme idNamespace](self, "idNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("namespace"));

  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme idType](self, "idType"), CFSTR("type"));
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme rotationSchedule](self, "rotationSchedule"), CFSTR("rotation"));
  objc_msgSend(v9, "encodeInt64:forKey:", -[MTIDScheme lifespan](self, "lifespan"), CFSTR("lifespan"));
  -[MTIDScheme correlations](self, "correlations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("correlations"));

  -[MTIDScheme version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("version"));

  -[MTIDScheme containerIdentifier](self, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("container"));

  -[MTIDScheme topics](self, "topics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("topics"));

  objc_msgSend(v9, "encodeBool:forKey:", -[MTIDScheme isDefault](self, "isDefault"), CFSTR("default"));
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme localHash](self, "localHash"), CFSTR("localHash"));
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme correlationHash](self, "correlationHash"), CFSTR("correlationHash"));

}

- (NSArray)topics
{
  return self->_topics;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDScheme idNamespace](self, "idNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTIDScheme lifespan](self, "lifespan");
  -[MTIDScheme correlations](self, "correlations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, namespace: %@, lifespan: %lld correlations: %@ >"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDScheme idNamespace](self, "idNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("namespace"));

  if (-[MTIDScheme idType](self, "idType") == 2)
    v5 = CFSTR("user");
  else
    v5 = CFSTR("client");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));
  if (-[MTIDScheme rotationSchedule](self, "rotationSchedule") == 1)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("daily"), CFSTR("rotation"));
  }
  else if (-[MTIDScheme lifespan](self, "lifespan") >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[MTIDScheme lifespan](self, "lifespan"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lifespan"));

  }
  -[MTIDScheme correlations](self, "correlations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[MTIDScheme correlations](self, "correlations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("correlations"));

  }
  -[MTIDScheme version](self, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("version"));

  -[MTIDScheme containerIdentifier](self, "containerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("container"));

  -[MTIDScheme topics](self, "topics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[MTIDScheme topics](self, "topics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("topics"));

  }
  if (-[MTIDScheme isDefault](self, "isDefault"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MTIDScheme isDefault](self, "isDefault"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("default"));

  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTIDScheme)initWithCoder:(id)a3
{
  id v4;
  MTIDScheme *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTIDScheme;
  v5 = -[MTIDScheme init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDScheme setIdNamespace:](v5, "setIdNamespace:", v6);

    -[MTIDScheme setIdType:](v5, "setIdType:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type")));
    -[MTIDScheme setRotationSchedule:](v5, "setRotationSchedule:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("rotation")));
    -[MTIDScheme setLifespan:](v5, "setLifespan:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lifespan")));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("correlations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDScheme setCorrelations:](v5, "setCorrelations:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDScheme setVersion:](v5, "setVersion:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("container"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDScheme setContainerIdentifier:](v5, "setContainerIdentifier:", v9);

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("topics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDScheme setTopics:](v5, "setTopics:", v10);

    -[MTIDScheme setIsDefault:](v5, "setIsDefault:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("default")));
    -[MTIDScheme setLocalHash:](v5, "setLocalHash:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("localHash")));
    -[MTIDScheme setCorrelationHash:](v5, "setCorrelationHash:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("correlationHash")));
  }

  return v5;
}

@end
