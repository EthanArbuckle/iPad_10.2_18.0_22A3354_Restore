@implementation PHMediaFormatAssetBundleConversionRequest

- (BOOL)prepareWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PHMediaFormatConversionRequest source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B8]), "initWithAssetBundleAtURL:", v5);
  if (!v6)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 5, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create asset photo bundle with path %@", (uint8_t *)&v9, 0xCu);

    }
  }

  return v6 != 0;
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHMediaFormatConversionCompositeRequest propagateRequestOptionsToSubrequests](self, "propagateRequestOptionsToSubrequests");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PHMediaFormatAssetBundleConversionRequest subrequests](self, "subrequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "enqueueConversionRequest:completionHandler:");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)enumerateSubrequests:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PHMediaFormatAssetBundleConversionRequest subrequests](self, "subrequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)requiresFormatConversion
{
  void *v5;

  if (!-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1879, CFSTR("Request must be preflighted"));

  }
  return 0;
}

- (BOOL)requiresMetadataChanges
{
  return 0;
}

- (id)outputPathExtension
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  if (!-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1922, CFSTR("Request must be preflighted"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1923, CFSTR("Invalid request for output path extension on request without source"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)outputFileType
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  if (!-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1931, CFSTR("Request must be preflighted"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1932, CFSTR("Invalid request for output type identifier on request without source"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)subrequests
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSubrequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrequests, 0);
}

void __83__PHMediaFormatAssetBundleConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Asset Bundle request subrequest finished: %@", (uint8_t *)&v3, 0xCu);
  }
}

@end
