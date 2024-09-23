@implementation ATXCategoricalFeatureMode

- (id)featureNameForBMUserFocusInferredModeType:(int)a3
{
  NSObject *v4;

  if ((a3 - 1) < 0x11)
    return off_1E82EBAE0[a3 - 1];
  __atxlog_handle_relevance_model();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXCategoricalFeatureMode featureNameForBMUserFocusInferredModeType:].cold.1();

  return CFSTR("<Unexpected Category Value>");
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  v5 = a3;
  objc_msgSend(v5, "inferredModeEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "inferredModeEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "modeType");

    -[ATXCategoricalFeatureMode featureNameForBMUserFocusInferredModeType:](self, "featureNameForBMUserFocusInferredModeType:", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("Mode NA");
  }

  return v9;
}

- (void)featureNameForBMUserFocusInferredModeType:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v2, v3, "%@ - Invalid modeType attempted to be featurized: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
