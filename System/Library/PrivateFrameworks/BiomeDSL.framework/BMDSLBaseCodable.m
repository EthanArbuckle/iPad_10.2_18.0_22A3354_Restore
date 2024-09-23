@implementation BMDSLBaseCodable

+ (NSString)name
{
  return (NSString *)CFSTR("base");
}

- (BMDSLBaseCodable)initWithName:(id)a3 version:(unsigned int)a4
{
  id v6;
  BMDSLBaseCodable *v7;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMDSLBaseCodable;
  v7 = -[BMDSLBaseCodable init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_version = a4;
    v7->_evaluationBlocked = 0;
  }

  return v7;
}

- (BMDSLBaseCodable)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  Class v8;
  Class v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  BMDSLBaseCodable *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NSClassFromString(CFSTR("BMDSLStreamPublisher"));
  if (v8)
  {
    v9 = v8;
    +[BMDSLFilter name](BMDSLFilter, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = CFSTR("streamPublisher");
    v18[0] = objc_opt_class();
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v7);
    v12 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMDSLBaseCodable initWithDictionary:error:].cold.1(v11);
    v12 = 0;
  }

  if (v12)
  {
    v13 = (BMDSLBaseCodable *)objc_msgSend([v12 alloc], "initWithDictionary:error:", v6, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no operator for name %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    BMDSLDecodeError((uint64_t)v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v15);

    v13 = 0;
  }

  return v13;
}

- (void)allowEvaluation
{
  -[BMDSLBaseCodable setEvaluationBlocked:](self, "setEvaluationBlocked:", 0);
}

- (BOOL)allowsEvaluation
{
  return !-[BMDSLBaseCodable isEvaluationBlocked](self, "isEvaluationBlocked");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", -[BMDSLBaseCodable version](self, "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("version"));

  -[BMDSLBaseCodable name](self, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("name"));

}

- (BMDSLBaseCodable)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BMDSLBaseCodable *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedShortValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BMDSLBaseCodable initWithName:version:](self, "initWithName:version:", v7, v6);
  -[BMDSLBaseCodable setEvaluationBlocked:](v8, "setEvaluationBlocked:", 1);

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)isEvaluationBlocked
{
  return self->_evaluationBlocked;
}

- (void)setEvaluationBlocked:(BOOL)a3
{
  self->_evaluationBlocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithDictionary:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AEB18000, log, OS_LOG_TYPE_ERROR, "must link BiomeStreams to use BMDSL dictionary coding/decoding", v1, 2u);
}

@end
