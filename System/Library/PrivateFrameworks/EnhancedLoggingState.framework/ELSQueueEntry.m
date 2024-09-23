@implementation ELSQueueEntry

- (ELSQueueEntry)init
{
  return -[ELSQueueEntry initWithType:typeName:parameters:executeAfterDuration:retry:platform:](self, "initWithType:typeName:parameters:executeAfterDuration:retry:platform:", &stru_24D173D38, &stru_24D173D38, MEMORY[0x24BDBD1B8], 1, &stru_24D173D38, 0.0);
}

- (ELSQueueEntry)initWithType:(id)a3 typeName:(id)a4 parameters:(id)a5 executeAfterDuration:(double)a6 retry:(BOOL)a7 platform:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ELSQueueEntry *v19;
  ELSQueueEntry *v20;
  objc_super v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)ELSQueueEntry;
  v19 = -[ELSQueueEntry init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_type, a3);
    objc_storeStrong((id *)&v20->_typeName, a4);
    objc_storeStrong((id *)&v20->_parameters, a5);
    v20->_executeAfterDuration = a6;
    v20->_retry = a7;
    objc_storeStrong((id *)&v20->_platform, a8);
  }

  return v20;
}

- (ELSQueueEntry)initWithCoder:(id)a3
{
  id v4;
  ELSQueueEntry *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSDictionary *parameters;
  uint64_t v10;
  NSString *typeName;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  NSString *platform;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ELSQueueEntry;
  v5 = -[ELSQueueEntry init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("parameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("typeName"));
    v10 = objc_claimAutoreleasedReturnValue();
    typeName = v5->_typeName;
    v5->_typeName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("executeAfterDuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "doubleValue");
    else
      v14 = 0.0;
    v5->_executeAfterDuration = v14;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("retry"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = objc_msgSend(v15, "BOOLValue");
    else
      v17 = 1;
    v5->_retry = v17;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("platform"));
    v18 = objc_claimAutoreleasedReturnValue();
    platform = v5->_platform;
    v5->_platform = (NSString *)v18;

  }
  return v5;
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
  id v11;

  v4 = a3;
  -[ELSQueueEntry type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[ELSQueueEntry typeName](self, "typeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("typeName"));

  -[ELSQueueEntry parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parameters"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[ELSQueueEntry executeAfterDuration](self, "executeAfterDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("executeAfterDuration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ELSQueueEntry retry](self, "retry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("retry"));

  -[ELSQueueEntry platform](self, "platform");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("platform"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_typeName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSDictionary copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  *(double *)(v5 + 40) = self->_executeAfterDuration;
  *(_BYTE *)(v5 + 8) = self->_retry;
  objc_storeStrong((id *)(v5 + 48), self->_platform);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ELSQueueEntry type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[ELSQueueEntry typeName](self, "typeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "typeName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[ELSQueueEntry executeAfterDuration](self, "executeAfterDuration");
        v11 = v10;
        objc_msgSend(v5, "executeAfterDuration");
        v13 = v11 == v12;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("type");
  -[ELSQueueEntry type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("typeName");
  -[ELSQueueEntry typeName](self, "typeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("parameters");
  -[ELSQueueEntry parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("executeAfterDuration");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[ELSQueueEntry executeAfterDuration](self, "executeAfterDuration");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  v13[4] = CFSTR("retry");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ELSQueueEntry retry](self, "retry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  v13[5] = CFSTR("platform");
  -[ELSQueueEntry platform](self, "platform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  return v11;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ELSQueueEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setTypeName:(id)a3
{
  objc_storeStrong((id *)&self->_typeName, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (double)executeAfterDuration
{
  return self->_executeAfterDuration;
}

- (void)setExecuteAfterDuration:(double)a3
{
  self->_executeAfterDuration = a3;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
