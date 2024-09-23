@implementation _ANEModelInstanceParameters

+ (id)withProcedureData:(id)a3 procedureArray:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProcedureData:procedureArray:", v7, v6);

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModelInstanceParameters instanceName](self, "instanceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { instanceName=%@ }"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEModelInstanceParameters)init
{

  return 0;
}

- (_ANEModelInstanceParameters)initWithProcedureData:(id)a3 procedureArray:(id)a4
{
  id v7;
  id v8;
  _ANEModelInstanceParameters *v9;
  _ANEModelInstanceParameters *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEModelInstanceParameters;
  v9 = -[_ANEModelInstanceParameters init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_instanceName, a3);
    objc_storeStrong((id *)&v10->_procedureArray, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[_ANEModelInstanceParameters instanceName](self, "instanceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("instanceName"));

  +[_ANELog common](_ANELog, "common");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_ANEModelInstanceParameters encodeWithCoder:].cold.1(a2, self);

  -[_ANEModelInstanceParameters procedureArray](self, "procedureArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("procedureArray"));

}

- (_ANEModelInstanceParameters)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _ANEModelInstanceParameters *v12;

  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANELog common](_ANELog, "common");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_ANEModelInstanceParameters initWithCoder:].cold.1(a2);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("procedureArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_ANEModelInstanceParameters initWithProcedureData:procedureArray:](self, "initWithProcedureData:procedureArray:", v6, v11);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v4;

  +[_ANELog common](_ANELog, "common", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ANEProcedureData copyWithZone:].cold.1(a2, v4);

  return 0;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (NSArray)procedureArray
{
  return self->_procedureArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procedureArray, 0);
  objc_storeStrong((id *)&self->_instanceName, 0);
}

- (void)encodeWithCoder:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "instanceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v4, v5, "%@: instanceName=%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v2, v3, "%@: instanceName=%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
