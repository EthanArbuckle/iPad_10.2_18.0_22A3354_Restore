@implementation _ANEProcedureData

+ (id)procedureDataWithSymbol:(id)a3 weightArray:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProcedure:weightArray:", v7, v6);

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
  -[_ANEProcedureData procedureSymbol](self, "procedureSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { procedureSymbol=%@ }"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEProcedureData)init
{

  return 0;
}

- (_ANEProcedureData)initWithProcedure:(id)a3 weightArray:(id)a4
{
  id v7;
  id v8;
  _ANEProcedureData *v9;
  _ANEProcedureData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEProcedureData;
  v9 = -[_ANEProcedureData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_procedureSymbol, a3);
    objc_storeStrong((id *)&v10->_weightArray, a4);
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
  NSObject *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[_ANELog common](_ANELog, "common");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_ANEProcedureData encodeWithCoder:].cold.1(a2, self);

  -[_ANEProcedureData procedureSymbol](self, "procedureSymbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("procedureSymbol"));

  -[_ANEProcedureData weightArray](self, "weightArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("weightArray"));

}

- (_ANEProcedureData)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _ANEProcedureData *v12;

  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("procedureSymbol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANELog common](_ANELog, "common");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_ANEProcedureData initWithCoder:].cold.1(a2);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("weightArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_ANEProcedureData initWithProcedure:weightArray:](self, "initWithProcedure:weightArray:", v6, v11);

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

- (NSString)procedureSymbol
{
  return self->_procedureSymbol;
}

- (NSArray)weightArray
{
  return self->_weightArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightArray, 0);
  objc_storeStrong((id *)&self->_procedureSymbol, 0);
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
  objc_msgSend(a2, "procedureSymbol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v4, v5, "%@: procedureSymbol=%@", v6, v7, v8, v9, 2u);

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
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v2, v3, "%@: procedureSymbol=%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)copyWithZone:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1D3352000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);

}

@end
