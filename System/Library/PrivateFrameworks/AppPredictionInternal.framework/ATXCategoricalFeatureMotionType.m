@implementation ATXCategoricalFeatureMotionType

- (id)featureNameForATXMotionType:(int64_t)a3
{
  NSObject *v4;

  if ((unint64_t)a3 < 5)
    return off_1E82EBC20[a3];
  __atxlog_handle_relevance_model();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXCategoricalFeatureMotionType featureNameForATXMotionType:].cold.1();

  return CFSTR("<Unexpected Category Value>");
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;

  v5 = a3;
  objc_msgSend(v5, "locationMotionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "locationMotionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCategoricalFeatureMotionType featureNameForATXMotionType:](self, "featureNameForATXMotionType:", objc_msgSend(v7, "motionType"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_relevance_model();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXCategoricalFeatureMotionType categoricalFeatureValueForContext:candidate:].cold.1();

    v8 = CFSTR("<Unexpected Category Value>");
  }

  return v8;
}

- (void)featureNameForATXMotionType:.cold.1()
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
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v2, v3, "%@ - Invalid motionType attempted to be featurized: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)categoricalFeatureValueForContext:candidate:.cold.1()
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
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "%@ - Nil locationMotionContext passed in. Returning unexpected category value.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
