@implementation CHPostprocessingStep

- (id)process:(id)a3 options:(id)a4
{
  return a3;
}

- (BOOL)modifiesOriginalTokens
{
  return 0;
}

+ (BOOL)shouldAdjustColumnsFromPostprocessingStepOptions:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = a3;
  v8 = v3;
  if (v3)
  {
    objc_msgSend_objectForKey_(v3, v4, CHPostProcessingStepOptionAdjustColumns, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13, v14);
    else
      v15 = 1;

    return v15;
  }
  else
  {

    return 1;
  }
}

@end
