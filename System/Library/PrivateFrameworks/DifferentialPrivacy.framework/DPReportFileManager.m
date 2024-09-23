@implementation DPReportFileManager

void __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v7 = a3;
  v8 = a4;
  +[_DPLog framework](_DPLog, "framework");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_1((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = v7;
    v10 = *(NSObject **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v18;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_2((const char *)a1);
  }

}

void __38___DPReportFileManager_retireReports___block_invoke(const char *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  +[_DPLog framework](_DPLog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __38___DPReportFileManager_retireReports___block_invoke_cold_1((uint64_t)a1, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_2(a1);
  }

}

void __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1D3FAA000, a2, a3, "reportsNotYetSubmittedWithReply: %@", a5, a6, a7, a8, 2u);
}

void __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_2(const char *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)OUTLINED_FUNCTION_5();
  v3 = OUTLINED_FUNCTION_4_2(v2);
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_1D3FAA000, v5, v6, "%@ : %@ : error %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_4();
}

void __38___DPReportFileManager_retireReports___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1D3FAA000, a2, a3, "retireReports: %@", a5, a6, a7, a8, 2u);
}

@end
