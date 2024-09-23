@implementation MODictionaryEncoder

+ (id)encodeDictionary:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v5 = a3;
  if (!v5)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MODictionaryEncoder encodeDictionary:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MODictionaryEncoder.m"), 23, CFSTR("Object is not of dictionary type (in %s:%d)"), "+[MODictionaryEncoder encodeDictionary:]", 23);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v9 || !v8)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[MODictionaryEncoder encodeDictionary:].cold.1((uint64_t)v9, v11);

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

+ (id)decodeToDictionary:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v5 = a3;
  if (!v5)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MODictionaryEncoder decodeToDictionary:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MODictionaryEncoder.m"), 46, CFSTR("Object is not of data type (in %s:%d)"), "+[MODictionaryEncoder decodeToDictionary:]", 46);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v9 || !v8)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[MODictionaryEncoder decodeToDictionary:].cold.1((uint64_t)v9, v11);

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

+ (void)encodeDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_ERROR, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)encodeDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Object is not of dictionary type (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)decodeToDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to dictionary, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)decodeToDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Object is not of data type (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
