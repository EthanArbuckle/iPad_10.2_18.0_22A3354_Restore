@implementation MADComputeService

void __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 40), "deregisterProgressHandlerForRequestID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "deregisterResultsHandlerForRequestID:", *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);

}

void __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_241256000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@[Finish] %@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "deregisterProgressHandlerForRequestID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "deregisterResultsHandlerForRequestID:", *(_QWORD *)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

}

void __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = (id)objc_msgSend(v3, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke_150(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_241256000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@[Finish] %@", (uint8_t *)&v10, 0x16u);
  }
  if ((a2 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 56))
      **(_QWORD **)(a1 + 56) = (id)objc_msgSend(v5, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_241256000, MEMORY[0x24BDACB70], v0, "%@ Error connecting to compute service - %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
