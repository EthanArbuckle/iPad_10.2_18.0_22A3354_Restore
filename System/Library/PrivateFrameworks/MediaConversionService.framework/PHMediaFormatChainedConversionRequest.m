@implementation PHMediaFormatChainedConversionRequest

+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The constructor %@ is unavailable for %@"), v7, v9);

  return 0;
}

+ (id)chainedRequestForRequest:(id)a3 dependingOnRequest:(id)a4 error:(id *)a5 successUpdateHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v12)
  {
    if (v11)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 1952, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dependentRequest"));

    if (v13)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 1953, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 1951, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("independentRequest"));

  if (!v11)
    goto LABEL_6;
LABEL_3:
  if (!v13)
    goto LABEL_7;
LABEL_4:
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setIndependentRequest:", v12);
  objc_msgSend(v12, "setParentRequest:", v14);
  objc_msgSend(v14, "setDependentRequest:", v11);
  objc_msgSend(v11, "setParentRequest:", v14);
  objc_msgSend(v14, "setSuccessUpdateHandler:", v13);
  objc_msgSend(v14, "compositeRequestCommonInitWithError:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)chainedRequestForAdjustmentRenderRequest:(id)a3 dependingOnRequest:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PHMediaFormatChainedConversionRequest_chainedRequestForAdjustmentRenderRequest_dependingOnRequest_error___block_invoke;
  v14[3] = &unk_1E9953840;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a1, "chainedRequestForRequest:dependingOnRequest:error:successUpdateHandler:", v10, v11, a5, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __107__PHMediaFormatChainedConversionRequest_chainedRequestForAdjustmentRenderRequest_dependingOnRequest_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get output file signature of previous request %@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRenderOriginatingSignature:", v3);

}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  -[PHMediaFormatChainedConversionRequest independentRequest](self, "independentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke;
  v9[3] = &unk_1E9953C20;
  v9[4] = self;
  objc_msgSend(v4, "enqueueConversionRequest:completionHandler:", v5, v9);

  -[PHMediaFormatChainedConversionRequest dependentRequest](self, "dependentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_706;
  v8[3] = &unk_1E9953C20;
  v8[4] = self;
  objc_msgSend(v4, "enqueueConversionRequest:completionHandler:", v7, v8);

}

- (void)enumerateSubrequests:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[PHMediaFormatChainedConversionRequest independentRequest](self, "independentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

  -[PHMediaFormatChainedConversionRequest dependentRequest](self, "dependentRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v7);

}

- (void)postProcessSuccessfulCompositeRequest
{
  void *v3;
  id v4;

  -[PHMediaFormatChainedConversionRequest dependentRequest](self, "dependentRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionRequest setDestination:](self, "setDestination:", v3);

}

- (PHMediaFormatConversionRequest)independentRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 240, 1);
}

- (void)setIndependentRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (PHMediaFormatConversionRequest)dependentRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDependentRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (id)successUpdateHandler
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setSuccessUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_successUpdateHandler, 0);
  objc_storeStrong((id *)&self->_dependentRequest, 0);
  objc_storeStrong((id *)&self->_independentRequest, 0);
}

uint64_t __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void (**v5)(void);
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "independentRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Chained request independent request finished: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "independentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "successUpdateHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "dependentRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Chained request independent request unsuccessful, cancelling dependent request %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "dependentRequest");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markAsCancelled");
  }

  return objc_msgSend(*(id *)(a1 + 32), "setSuccessUpdateHandler:", 0);
}

void __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_706(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "dependentRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Chained request dependent request finished: %@", (uint8_t *)&v3, 0xCu);

  }
}

@end
