@implementation PredictorUtils

+ (int64_t)handleInitException:(exception_ptr)a3
{
  std::exception_ptr v4;
  std::exception_ptr v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)a3.var0)
  {
    std::exception_ptr::exception_ptr(&v5, (const std::exception_ptr *)a3.var0);
    v4.__ptr_ = &v5;
    std::rethrow_exception(v4);
    __break(1u);
  }
  return 0;
}

+ (int64_t)handlePredictException:(exception_ptr)a3
{
  std::exception_ptr v4;
  std::exception_ptr v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)a3.var0)
  {
    std::exception_ptr::exception_ptr(&v5, (const std::exception_ptr *)a3.var0);
    v4.__ptr_ = &v5;
    std::rethrow_exception(v4);
    __break(1u);
  }
  return 0;
}

+ (void)reportInitStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5 locale:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v8 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.Initialization"), a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  AnalyticsSendEventLazy();

}

+ (void)reportPredictStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5 locale:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v8 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.Prediction"), a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  AnalyticsSendEventLazy();

}

+ (id)getInitStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to intialize %@"), v7, *MEMORY[0x1E0CB2D50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v8, a5, v11);

  }
  return (id)a5;
}

+ (id)getPredictStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prediction failed with %@"), v7, *MEMORY[0x1E0CB2D50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v8, a5, v11);

  }
  return (id)a5;
}

id __74__PredictorUtils_reportPredictStatusWithPredictorName_domain_code_locale___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("failed");
  if (!*(_QWORD *)(a1 + 40))
    v2 = CFSTR("success");
  v9[0] = v2;
  v8[0] = CFSTR("outcome");
  v8[1] = CFSTR("statusCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("locale");
  v5 = *(_QWORD *)(a1 + 32);
  v9[1] = v4;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__PredictorUtils_reportInitStatusWithPredictorName_domain_code_locale___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("failed");
  if (!*(_QWORD *)(a1 + 40))
    v2 = CFSTR("success");
  v9[0] = v2;
  v8[0] = CFSTR("outcome");
  v8[1] = CFSTR("statusCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("locale");
  v5 = *(_QWORD *)(a1 + 32);
  v9[1] = v4;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
