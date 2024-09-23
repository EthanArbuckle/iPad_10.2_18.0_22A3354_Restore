@implementation _DKEventStream

+ (id)eventStreamWithName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "eventStreamWithName:valueType:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)eventStreamWithName:(id)a3 valueType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_CDEventStreams eventStreamPropertiesForKBName:](_CDEventStreams, "eventStreamPropertiesForKBName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
    {
      objc_msgSend(v7, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v6);

      if ((v10 & 1) == 0)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "valueType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412802;
          v18 = v5;
          v19 = 2112;
          v20 = v6;
          v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_INFO, "Event with stream %@ had valueType %@ but should be %@. Overriding.", (uint8_t *)&v17, 0x20u);

        }
      }
    }
    objc_msgSend(v7, "valueType");
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v13;
  }
  +[_DKEventStreamCache sharedCached](_DKEventStreamCache, "sharedCached");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventStreamWithName:valueType:", v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (_DKObjectType)eventValueType
{
  return (_DKObjectType *)objc_getProperty(self, a2, 24, 1);
}

- (_DKEventStream)initWithName:(id)a3 valueType:(id)a4 cache:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _DKEventStream *v13;
  _DKEventStream *v14;
  id *p_isa;
  _DKEventStream *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (!v11
      || (objc_msgSend(v11, "eventStreamWithName:valueType:", v9, v10),
          (v13 = (_DKEventStream *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v26.receiver = self;
      v26.super_class = (Class)_DKEventStream;
      v14 = -[_DKEventStream init](&v26, sel_init);
      p_isa = (id *)&v14->super.isa;
      if (v14)
      {
        objc_storeStrong((id *)&v14->_name, a3);
        objc_storeStrong(p_isa + 3, a4);
      }
      v13 = p_isa;
      self = v13;
    }
    v16 = v13;
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_DKEventStream initWithName:valueType:cache:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventValueType, CFSTR("eventValueType"));

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)toPBCodable
{
  void *v3;
  void *v4;
  char isKindOfClass;
  int v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  _DKPRValueType *v11;
  void *v12;
  _DKPRStream *v13;

  -[_DKEventStream name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventStream eventValueType](self, "eventValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[_DKEventStream eventValueType](self, "eventValueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[_DKEventStream eventValueType](self, "eventValueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v10 = objc_opt_isKindOfClass();

      if ((v10 & 1) != 0)
        v6 = 2;
      else
        v6 = 3;
    }
  }
  v11 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValueType setType:]((uint64_t)v11, v6);
  -[_DKEventStream eventValueType](self, "eventValueType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType setTypeCode:]((uint64_t)v11, objc_msgSend(v12, "typeCode"));

  v13 = objc_alloc_init(_DKPRStream);
  -[_DKPRStream setName:]((uint64_t)v13, v3);
  -[_DKPRStream setType:]((uint64_t)v13, v11);

  return v13;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { name=%@, valueType=%@ }"), v5, self->_name, self->_eventValueType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventValueType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventProperties, 0);
}

- (_DKEventStream)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _DKEventStream *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventValueType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKEventStreamCache sharedCached](_DKEventStreamCache, "sharedCached");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DKEventStream initWithName:valueType:cache:](self, "initWithName:valueType:cache:", v5, v6, v7);

  return v8;
}

- (_CDEventStreamProperties)eventProperties
{
  _DKEventStream *v2;
  _CDEventStreamProperties *eventProperties;
  uint64_t v4;
  _CDEventStreamProperties *v5;
  _CDEventStreamProperties *v6;

  v2 = self;
  objc_sync_enter(v2);
  eventProperties = v2->_eventProperties;
  if (!eventProperties)
  {
    +[_CDEventStreams eventStreamPropertiesForKBName:](_CDEventStreams, "eventStreamPropertiesForKBName:", v2->_name);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_eventProperties;
    v2->_eventProperties = (_CDEventStreamProperties *)v4;

    eventProperties = v2->_eventProperties;
  }
  v6 = eventProperties;
  objc_sync_exit(v2);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_DKEventStream name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DKEventStream eventValueType](self, "eventValueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _DKEventStream *v4;
  _DKEventStream *v5;
  _DKEventStream *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  v4 = (_DKEventStream *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_DKEventStream name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKEventStream name](v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[_DKEventStream eventValueType](self, "eventValueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "typeCode");
      -[_DKEventStream eventValueType](v6, "eventValueType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10 == objc_msgSend(v11, "typeCode");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[_DKPRStream name]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPRStream type]((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_DKPRValueType type]((uint64_t)v6);

    if (v7 > 2)
    {
      v10 = 0;
    }
    else
    {
      v8 = *off_1E26E4F90[v7];
      -[_DKPRStream type]((uint64_t)v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectTypeWithTypeCode:", -[_DKPRValueType typeCode]((uint64_t)v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)initWithName:(uint64_t)a3 valueType:(uint64_t)a4 cache:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "nil name passed to _DKEventStream initializer", a5, a6, a7, a8, 0);
}

@end
