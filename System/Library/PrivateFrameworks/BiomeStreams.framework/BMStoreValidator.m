@implementation BMStoreValidator

- (BMStoreValidator)initWithIdentifier:(id)a3 storeConfig:(id)a4
{
  id v7;
  id v8;
  BMStoreValidator *v9;
  BMStoreValidator *v10;
  BPSBiomeStorePublisher *v11;
  BPSBiomeStorePublisher *publisher;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMStoreValidator;
  v9 = -[BMStoreValidator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = -[BPSBiomeStorePublisher initWithStreamId:storeConfig:]([BPSBiomeStorePublisher alloc], "initWithStreamId:storeConfig:", v7, v8);
    publisher = v10->_publisher;
    v10->_publisher = v11;

  }
  return v10;
}

- (int)isChronologicallyValidFromTimestamp:(double)a3
{
  BMStoreValidator *v3;
  void *v4;

  v3 = self;
  -[BPSBiomeStorePublisher withStartTime:](self->_publisher, "withStartTime:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = -[BMStoreValidator isChronologicallyValidWithPublisher:shouldContinue:](v3, "isChronologicallyValidWithPublisher:shouldContinue:", v4, &__block_literal_global_16);

  return (int)v3;
}

uint64_t __56__BMStoreValidator_isChronologicallyValidFromTimestamp___block_invoke()
{
  return 1;
}

- (int)isChronologicallyValidFromBookmark:(id)a3 shouldContinue:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;

  v6 = a4;
  if (a3)
  {
    -[BPSBiomeStorePublisher applyBookmark:](self->_publisher, "applyBookmark:", a3);
    v7 = -[BMStoreValidator isChronologicallyValidWithPublisher:shouldContinue:](self, "isChronologicallyValidWithPublisher:shouldContinue:", self->_publisher, v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMStoreValidator isChronologicallyValidFromBookmark:shouldContinue:].cold.1();

    v7 = 2;
  }

  return v7;
}

- (int)isChronologicallyValidFromTimestamp:(double)a3 shouldContinue:(id)a4
{
  BMStoreValidator *v5;
  BPSBiomeStorePublisher *publisher;
  id v7;
  void *v8;

  v5 = self;
  publisher = self->_publisher;
  v7 = a4;
  -[BPSBiomeStorePublisher withStartTime:](publisher, "withStartTime:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[BMStoreValidator isChronologicallyValidWithPublisher:shouldContinue:](v5, "isChronologicallyValidWithPublisher:shouldContinue:", v8, v7);

  return (int)v5;
}

- (int)isChronologicallyValidWithPublisher:(id)a3 shouldContinue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_3;
    v13[3] = &unk_1E2649518;
    v15 = v17;
    v16 = &v18;
    v13[4] = self;
    v14 = v7;
    v9 = (id)objc_msgSend(v6, "sinkWithCompletion:shouldContinue:", &__block_literal_global_2, v13);
    v10 = *((_DWORD *)v19 + 6);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMStoreValidator isChronologicallyValidWithPublisher:shouldContinue:].cold.1();

    v10 = 2;
  }

  return v10;
}

void __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_cold_1(v2, v4);

  }
}

uint64_t __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "timestamp");
  if (v4 < *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v9 = *(_QWORD *)(a1[4] + 8);
      v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      objc_msgSend(v3, "segmentName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timestamp");
      v13 = v12;
      v14 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
      objc_msgSend(v3, "timestamp");
      v16 = 138413314;
      v17 = v9;
      v18 = 2048;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2048;
      v23 = v13;
      v24 = 2048;
      v25 = v14 - v15;
      _os_log_fault_impl(&dword_18D810000, v5, OS_LOG_TYPE_FAULT, "found unchronological events for stream - %@, last timestamp:%f, current event segment:%@ timestamp:%f diff:%f", (uint8_t *)&v16, 0x34u);

    }
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  objc_msgSend(v3, "timestamp");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
  v7 = (*(uint64_t (**)(void))(a1[5] + 16))();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)isChronologicallyValidFromBookmark:shouldContinue:.cold.1()
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v2, v3, "%@: cannot create enumerator from nil bookmark for stream: %@, giving up .", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)isChronologicallyValidWithPublisher:shouldContinue:.cold.1()
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v2, v3, "%@: failed to create stream publisher for stream %@, giving up.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "Error reading from stream during chronological validation: %@", (uint8_t *)&v4, 0xCu);

}

@end
