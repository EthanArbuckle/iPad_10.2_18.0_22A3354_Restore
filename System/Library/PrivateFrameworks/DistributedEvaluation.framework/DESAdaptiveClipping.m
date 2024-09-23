@implementation DESAdaptiveClipping

+ (BOOL)computeClippingIndicator:(id)a3 clippingBound:(float)a4 scale:(float)a5 clippingIndicator:(float *)a6
{
  id v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  id v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  unint64_t v28;
  double v29;
  float v30;
  float v31;
  BOOL v32;
  void *v33;
  void *v34;

  v9 = a3;
  v10 = v9;
  if (!a6)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[DESAdaptiveClipping computeClippingIndicator:clippingBound:scale:clippingIndicator:].cold.1(v14);
    goto LABEL_33;
  }
  v11 = (LODWORD(a5) & 0x7FFFFFFFu) - 1 < 0x7FFFFF;
  v12 = ((LODWORD(a5) & 0x7FFFFFFFu) - 0x800000) >> 24 < 0x7F;
  if (a5 >= 0.0)
  {
    v12 = 0;
    v11 = 0;
  }
  if ((LODWORD(a5) & 0x7FFFFFFF) == 0)
    v11 = 1;
  v13 = (LODWORD(a5) & 0x7FFFFFFF) == 0x7F800000 || v11;
  if ((v13 | v12) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed scale for clipping indicator, should be a positive floating point number"));
    v14 = objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    goto LABEL_32;
  }
  v22 = sqrt(a4 * a4 - a5 * a5);
  if (v22 == INFINITY || *(_QWORD *)&v22 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed deltaClippingBound for clipping indicator, should be a positive floating point number"));
    v14 = objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    goto LABEL_32;
  }
  v24 = objc_retainAutorelease(v9);
  v25 = objc_msgSend(v24, "bytes");
  v26 = objc_msgSend(v24, "length");
  v27 = 0.0;
  if (v26 >= 4)
  {
    v28 = 0;
    v29 = 0.0;
    do
    {
      v29 = v29 + (float)(*(float *)(v25 + 4 * v28) * *(float *)(v25 + 4 * v28));
      ++v28;
    }
    while (v28 < (unint64_t)objc_msgSend(v24, "length") >> 2);
    v27 = v29;
  }
  v30 = sqrtf(v27);
  if (fabsf(v30) == INFINITY)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Failed to calculate L2 norm from result: %@"), v34);
    v14 = objc_claimAutoreleasedReturnValue();

    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
LABEL_31:
      +[DESAdaptiveClipping computeClippingIndicator:clippingBound:scale:clippingIndicator:].cold.2((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_32:

LABEL_33:
    v32 = 0;
    goto LABEL_34;
  }
  if (v22 < v30)
    v31 = -a5;
  else
    v31 = a5;
  *a6 = v31;
  v32 = 1;
LABEL_34:

  return v32;
}

+ (void)computeClippingIndicator:(os_log_t)log clippingBound:scale:clippingIndicator:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Unexpected null pointer passed in for adaptive clipping indicator", v1, 2u);
}

+ (void)computeClippingIndicator:(uint64_t)a3 clippingBound:(uint64_t)a4 scale:(uint64_t)a5 clippingIndicator:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
