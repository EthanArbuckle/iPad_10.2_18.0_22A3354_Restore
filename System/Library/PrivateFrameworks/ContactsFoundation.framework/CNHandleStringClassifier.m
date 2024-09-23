@implementation CNHandleStringClassifier

+ (id)classificationOfHandleStrings:(id)a3 classificationQuality:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  CNHandleStringsClassificationBuilder *v18;
  void *v19;
  id v20;
  CNHandleStringsClassificationBuilder *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  id v36;
  CNHandleStringsClassificationBuilder *v37;

  v6 = a3;
  +[CNLogging apiUsageLog](CNLogging, "apiUsageLog");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:].cold.4(v7, v8, v9, v10, v11, v12, v13, v14);

  +[CNLogging apiUsageLog](CNLogging, "apiUsageLog");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:].cold.3(v6, v15);

  +[CNLogging apiUsageLog](CNLogging, "apiUsageLog");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:].cold.2(a4, v16, v17);

  v18 = objc_alloc_init(CNHandleStringsClassificationBuilder);
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassificationQuality:", a4);
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __80__CNHandleStringClassifier_classificationOfHandleStrings_classificationQuality___block_invoke;
  v35 = &unk_1E29BC928;
  v20 = v19;
  v36 = v20;
  v21 = v18;
  v37 = v21;
  objc_msgSend(v6, "_cn_each:", &v32);
  -[CNHandleStringsClassificationBuilder build](v21, "build", v32, v33, v34, v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNLogging apiUsageLog](CNLogging, "apiUsageLog");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  return v22;
}

- (CNHandleStringClassifier)initWithClassificationQuality:(unint64_t)a3
{
  void *v4;
  CNHandleStringClassifier *v5;

  objc_msgSend((id)objc_opt_class(), "classificationStrategyForQuality:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNHandleStringClassifier initWithClassificationStrategy:](self, "initWithClassificationStrategy:", v4);

  return v5;
}

- (CNHandleStringClassifier)initWithClassificationStrategy:(id)a3
{
  id v5;
  NSObject *v6;
  CNHandleStringClassifier *v7;
  CNHandleStringClassifier *v8;
  CNHandleStringClassifier *v9;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_90);
    v6 = CNGuardOSLog_cn_once_object_0_7;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      -[CNHandleStringClassifier initWithClassificationStrategy:].cold.1(v6);
  }
  v11.receiver = self;
  v11.super_class = (Class)CNHandleStringClassifier;
  v7 = -[CNHandleStringClassifier init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_classificationStrategy, a3);
    v9 = v8;
  }

  return v8;
}

+ (id)classificationStrategyForQuality:(unint64_t)a3
{
  _CNRegExHandleStringClassificationStrategy *v3;

  if (a3 == 1)
  {
    +[_CNDataDetectorsHandleStringClassificationStrategy assistedDataDetectorsStrategy](_CNDataDetectorsHandleStringClassificationStrategy, "assistedDataDetectorsStrategy");
    v3 = (_CNRegExHandleStringClassificationStrategy *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(_CNRegExHandleStringClassificationStrategy);
  }
  return v3;
}

uint64_t __80__CNHandleStringClassifier_classificationOfHandleStrings_classificationQuality___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "classifyHandleString:builder:", a2, *(_QWORD *)(a1 + 40));
}

- (void)classifyHandleString:(id)a3 builder:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v8))
  {
    v7 = -[CNHandleStringClassifier typeOfHandleString:](self, "typeOfHandleString:", v8);
    if (v7 == 2)
    {
      objc_msgSend(v6, "addPhoneNumber:", v8);
    }
    else if (v7 == 1)
    {
      objc_msgSend(v6, "addEmailAddress:", v8);
    }
    else
    {
      objc_msgSend(v6, "addUnknown:", v8);
    }
  }

}

- (unint64_t)typeOfHandleString:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "_cn_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
    v5 = 0;
  else
    v5 = -[_CNHandleStringClassificationStrategy classificationOfHandleString:](self->_classificationStrategy, "classificationOfHandleString:", v4);

  return v5;
}

+ (id)classificationOfHandleStrings:(id)a3
{
  return (id)objc_msgSend(a1, "classificationOfHandleStrings:classificationQuality:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationStrategy, 0);
}

- (CNHandleStringClassifier)init
{
  return -[CNHandleStringClassifier initWithClassificationQuality:](self, "initWithClassificationQuality:", 0);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("classificationStrategy"), self->_classificationStrategy);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_CNHandleStringClassificationStrategy)classificationStrategy
{
  return self->_classificationStrategy;
}

+ (void)classificationOfHandleStrings:(uint64_t)a3 classificationQuality:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18F80C000, a1, a3, "< +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:]", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

+ (void)classificationOfHandleStrings:(uint64_t)a3 classificationQuality:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_1_6(&dword_18F80C000, a2, a3, "   quality: %lu", (uint8_t *)&v3);
}

+ (void)classificationOfHandleStrings:(void *)a1 classificationQuality:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_6(&dword_18F80C000, a2, v3, "   handleStrings: %lu", (uint8_t *)&v4);
}

+ (void)classificationOfHandleStrings:(uint64_t)a3 classificationQuality:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18F80C000, a1, a3, "> +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:]", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)initWithClassificationStrategy:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F80C000, log, OS_LOG_TYPE_FAULT, "parameter ‘classificationStrategy’ must be nonnull", v1, 2u);
  OUTLINED_FUNCTION_1_2();
}

@end
