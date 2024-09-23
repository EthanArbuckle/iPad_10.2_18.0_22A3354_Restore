@implementation DESFederatedBuffer

+ (id)computeApproximateStaleness:(double)a3 stalenessScale:(id)a4 stalenessBias:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v21;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10 - a3;

  if (v11 < 0.0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:].cold.1();
LABEL_23:

    v21 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v7, "doubleValue");
  if (v13 <= 0.0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:].cold.4(v12);
    goto LABEL_23;
  }
  v14 = v13;
  objc_msgSend(v8, "doubleValue");
  v16 = v11 / v14 + v15;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v17 = objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if ((*(uint64_t *)&v16 <= -1 || ((*(_QWORD *)&v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&v16 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(_QWORD *)&v16 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:].cold.3();
    goto LABEL_23;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:].cold.2();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v21;
}

+ (id)computeDownScalingFactor:(id)a3 approximateStaleness:(id)a4
{
  id v5;
  id v6;
  double v7;
  void *v8;
  double v9;
  long double v10;
  long double v11;
  double v12;
  NSObject *v14;
  void *v15;
  NSObject *v16;

  v5 = a3;
  v6 = a4;
  v8 = v6;
  if (!v5)
  {
    v12 = 1.0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "doubleValue");
  v10 = v9 + 1.0;
  objc_msgSend(v5, "doubleValue");
  v12 = pow(v10, v11);
  v7 = fabs(v12);
  if (v12 >= 1.0 && v7 != INFINITY)
  {
LABEL_11:
    +[DESLogging coreChannel](DESLogging, "coreChannel", v7);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[DESFederatedBuffer computeDownScalingFactor:approximateStaleness:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  +[DESLogging coreChannel](DESLogging, "coreChannel", v7);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[DESFederatedBuffer computeDownScalingFactor:approximateStaleness:].cold.2();

  v15 = 0;
LABEL_14:

  return v15;
}

+ (void)computeApproximateStaleness:stalenessScale:stalenessBias:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1B96E5000, v1, v2, "Invalid time delta for approximate staleness: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

+ (void)computeApproximateStaleness:stalenessScale:stalenessBias:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1B96E5000, v1, v2, "Approximate staleness for Federated Buffer: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

+ (void)computeApproximateStaleness:stalenessScale:stalenessBias:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1B96E5000, v1, v2, "Invalid approximate staleness: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

+ (void)computeApproximateStaleness:(os_log_t)log stalenessScale:stalenessBias:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Approximate staleness scale should be greater than zero", v1, 2u);
}

+ (void)computeDownScalingFactor:approximateStaleness:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1B96E5000, v1, v2, "Down-scaling factor for Federated Buffer: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

+ (void)computeDownScalingFactor:approximateStaleness:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1B96E5000, v1, v2, "Invalid down-scaling factor %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

@end
