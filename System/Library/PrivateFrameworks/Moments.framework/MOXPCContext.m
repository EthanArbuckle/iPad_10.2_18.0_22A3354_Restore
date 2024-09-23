@implementation MOXPCContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOXPCContext)init
{
  MOXPCContext *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *configuration;
  void *v5;
  void *v6;
  MOXPCContext *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOXPCContext;
  v2 = -[MOXPCContext init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_configuration, "setObject:forKeyedSubscript:", v6, CFSTR("ProcessName"));

    v7 = v2;
  }

  return v2;
}

- (MOXPCContext)initWithCoder:(id)a3
{
  id v4;
  MOXPCContext *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *configuration;
  MOXPCContext *v9;

  v4 = a3;
  v5 = -[MOXPCContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProcessName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    configuration = v5->_configuration;
    v5->_configuration = v7;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_configuration, "setObject:forKeyedSubscript:", v6, CFSTR("ProcessName"));
    v9 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *configuration;
  id v4;
  id v5;

  configuration = self->_configuration;
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](configuration, "objectForKeyedSubscript:", CFSTR("ProcessName"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ProcessName"));

}

- (NSString)xpcProcessName
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_configuration, "objectForKey:", CFSTR("ProcessName"));
}

- (id)encodeDictionary:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  SEL v19;
  MOXPCContext *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;

  v5 = a3;
  if (!v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MOXPCContext encodeDictionary:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v18 = CFSTR("Invalid parameter not satisfying: value");
    v19 = a2;
    v20 = self;
    v21 = 62;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MOXPCContext encodeDictionary:].cold.3(v22, v23, v24, v25, v26, v27, v28, v29);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v18 = CFSTR("Invalid parameter not satisfying: [value isKindOfClass:[NSDictionary class]]");
    v19 = a2;
    v20 = self;
    v21 = 63;
LABEL_12:
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("MOXPCContext.m"), v21, v18);
    v8 = 0;
    goto LABEL_17;
  }
  v38 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v38;
  if (v7 || !v6)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[MOXPCContext encodeDictionary:].cold.2((uint64_t)v7, v30, v31, v32, v33, v34, v35, v36);

    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

LABEL_17:
  return v8;
}

- (id)decodeToDictionary:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v5 = a3;
  if (!v5)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOXPCContext decodeToDictionary:].cold.2(v6);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOXPCContext.m"), 83, CFSTR("Object is not of data type (in %s:%d)"), "-[MOXPCContext decodeToDictionary:]", 83);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v19;
    if (v9 || !v8)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MOXPCContext decodeToDictionary:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

      v10 = 0;
    }
    else
    {
      v10 = v8;
    }

  }
  else
  {
LABEL_10:
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)encodeDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, a1, a3, "Invalid parameter not satisfying: value", a5, a6, a7, a8, 0);
}

- (void)encodeDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, a2, a3, "Error when serialization to json, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)encodeDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, a1, a3, "Invalid parameter not satisfying: [value isKindOfClass:[NSDictionary class]]", a5, a6, a7, a8, 0);
}

- (void)decodeToDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, a2, a3, "Error when serialization to dictionary, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)decodeToDictionary:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MOXPCContext decodeToDictionary:]";
  v3 = 1024;
  v4 = 83;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
