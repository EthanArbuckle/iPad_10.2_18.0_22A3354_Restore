@implementation PHMediaFormatConversionImplementation

void __112__PHMediaFormatConversionImplementation_MediaConversionService_performImageConversionRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDestination:", *(_QWORD *)(a1 + 40));
    v9 = *(void **)(a1 + 32);
    v10 = 4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image format conversion failed: %@", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setError:", v8);
    v9 = *(void **)(a1 + 32);
    v10 = 5;
  }
  objc_msgSend(v9, "setStatus:", v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __133__PHMediaFormatConversionImplementation_MediaConversionService_submitSinglePassVideoConversionRequest_destination_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "stopObserving");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      objc_msgSend(WeakRetained, "setStatus:", 4);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video format conversion failed: %@", buf, 0xCu);
      }
      objc_msgSend(v8, "setStatus:", 5);
      if (a2 == 4)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB3388];
        v13 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 3, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v11;
      }
      objc_msgSend(v8, "setError:", v6);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __136__PHMediaFormatConversionImplementation_MediaConversionService_submitNonSinglePassVideoConversionRequest_destination_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      objc_msgSend(WeakRetained, "setDestination:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v8, "setStatus:", 4);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video format conversion failed: %@", buf, 0xCu);
      }
      objc_msgSend(v8, "setStatus:", 5);
      if (a2 == 4)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB3388];
        v13 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 3, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v11;
      }
      objc_msgSend(v8, "setError:", v6);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
