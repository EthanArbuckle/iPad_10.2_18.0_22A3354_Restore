@implementation NSDictionary(TypeSafeAccess)

- (id)stringValueForKey:()TypeSafeAccess
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSDictionary(TypeSafeAccess) stringValueForKey:].cold.1();

    goto LABEL_7;
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (id)dataValueForKey:()TypeSafeAccess
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSDictionary(TypeSafeAccess) dataValueForKey:].cold.1();

    goto LABEL_7;
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (uint64_t)BOOLValueForKey:()TypeSafeAccess
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSDictionary(TypeSafeAccess) dataValueForKey:].cold.1();

    goto LABEL_7;
  }
  v6 = objc_msgSend(v5, "BOOLValue");
LABEL_8:

  return v6;
}

- (void)stringValueForKey:()TypeSafeAccess .cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3_2();
  v1 = OUTLINED_FUNCTION_0_4(v0);
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "@\"Querying for string value for key '%@' yielded value of unexpected class '%@'\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)dataValueForKey:()TypeSafeAccess .cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3_2();
  v1 = OUTLINED_FUNCTION_0_4(v0);
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "@\"Querying for data value for key '%@' yielded value of unexpected class '%@'\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

@end
