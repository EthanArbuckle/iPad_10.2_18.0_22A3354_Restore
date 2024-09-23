@implementation ATXCategoricalFeatureLocationType

- (id)featureNameForRTLocationOfInterestType:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)(a3 + 1) < 5)
    return off_1E82EBBF8[a3 + 1];
  __atxlog_handle_relevance_model();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXCategoricalFeatureLocationType featureNameForRTLocationOfInterestType:].cold.1();

  return CFSTR("<Unexpected Category Value>");
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  v5 = a3;
  objc_msgSend(v5, "locationMotionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLOI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "locationMotionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentLOI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    -[ATXCategoricalFeatureLocationType featureNameForRTLocationOfInterestType:](self, "featureNameForRTLocationOfInterestType:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("LOI Type NA");
  }

  return v11;
}

- (void)featureNameForRTLocationOfInterestType:.cold.1()
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
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v2, v3, "%@ - Invalid loiType attempted to be featurized: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
