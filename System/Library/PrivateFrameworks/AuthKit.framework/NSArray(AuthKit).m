@implementation NSArray(AuthKit)

+ (id)ak_arrayWithJSONResponseData:()AuthKit
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;

  if (a3)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v22);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v22;
    if (v4)
    {
      _AKLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[NSArray(AuthKit) ak_arrayWithJSONResponseData:].cold.3((uint64_t)v4, v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v3;
LABEL_13:

        goto LABEL_14;
      }
      _AKLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[NSArray(AuthKit) ak_arrayWithJSONResponseData:].cold.2(v5, v14, v15, v16, v17, v18, v19, v20);
    }

    v13 = 0;
    goto LABEL_13;
  }
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[NSArray(AuthKit) ak_arrayWithJSONResponseData:].cold.1(v4, v6, v7, v8, v9, v10, v11, v12);
  v13 = 0;
LABEL_14:

  return v13;
}

+ (void)ak_arrayWithJSONResponseData:()AuthKit .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Error: No response data!", a5, a6, a7, a8, 0);
}

+ (void)ak_arrayWithJSONResponseData:()AuthKit .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "The body data was not in the expected (dictionary) format!", a5, a6, a7, a8, 0);
}

+ (void)ak_arrayWithJSONResponseData:()AuthKit .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "There was an error parsing body data! %@", (uint8_t *)&v2, 0xCu);
}

@end
