@implementation CalGeocoder

- (CalGeocoder)initWithLocationString:(id)a3 andCompletionBlock:(id)a4
{
  id v6;
  id v7;
  CalGeocoder *v8;
  CalGeocoder *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CalGeocoder;
  v8 = -[CalGeocoder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CalGeocoder setLocationString:](v8, "setLocationString:", v6);
    -[CalGeocoder setCompletionBlock:](v9, "setCompletionBlock:", v7);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CalGeocoder cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CalGeocoder;
  -[CalGeocoder dealloc](&v3, sel_dealloc);
}

- (void)startGeocoding
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "URL location string given: [%@].  Will not geocode.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __29__CalGeocoder_startGeocoding__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    EKWeakLinkStringConstant("MKErrorDomain", 0xFuLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
    {
      v10 = objc_msgSend(v7, "code");

      if (v10 == 4)
      {

        v11 = 0;
        v7 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v5, "mapItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 == 1)
  {
    objc_msgSend(v12, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __29__CalGeocoder_startGeocoding__block_invoke_cold_3(a1, (uint64_t)v11, v14);
  }
  else
  {
    if (v13)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __29__CalGeocoder_startGeocoding__block_invoke_cold_1(v12, v14);
    }
    else
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __29__CalGeocoder_startGeocoding__block_invoke_cold_2(a1, v14);
    }
    v11 = 0;
  }

LABEL_16:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callCompletionBlockWithResult:error:", v11, v7);

}

- (void)cancel
{
  void *v3;

  -[CalGeocoder search](self, "search");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CalGeocoder setSearch:](self, "setSearch:", 0);
}

+ (void)geocodeLocationString:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __57__CalGeocoder_geocodeLocationString_withCompletionBlock___block_invoke;
  v17 = &unk_1E2A851F0;
  v18 = v8;
  v19 = v5;
  v9 = v8;
  v10 = v5;
  v11 = (void *)MEMORY[0x19400A168](&v14);
  v12 = objc_alloc((Class)objc_opt_class());
  v13 = (void *)objc_msgSend(v12, "initWithLocationString:andCompletionBlock:", v7, v11, v14, v15, v16, v17);

  objc_msgSend(v9, "addObject:", v13);
  objc_msgSend(v13, "startGeocoding");

}

uint64_t __57__CalGeocoder_geocodeLocationString_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

- (void)_callCompletionBlockWithResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[CalGeocoder completionBlock](self, "completionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CalGeocoder completionBlock](self, "completionBlock");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

    -[CalGeocoder setCompletionBlock:](self, "setCompletionBlock:", 0);
  }

}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
  objc_storeStrong((id *)&self->_locationString, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MKLocalSearch)search
{
  return self->_search;
}

- (void)setSearch:(id)a3
{
  objc_storeStrong((id *)&self->_search, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
}

void __29__CalGeocoder_startGeocoding__block_invoke_cold_1(void *a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218242;
  v5 = objc_msgSend(a1, "count");
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Expected 0 or 1 geocoding results.  Got %lu.  Map items: [%@]", (uint8_t *)&v4, 0x16u);
}

void __29__CalGeocoder_startGeocoding__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_18FC12000, a2, OS_LOG_TYPE_DEBUG, "No geocoding results found for location string: [%@]", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __29__CalGeocoder_startGeocoding__block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_18FC12000, log, OS_LOG_TYPE_DEBUG, "Found one result for location string: [%@].  Result: [%@]", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
