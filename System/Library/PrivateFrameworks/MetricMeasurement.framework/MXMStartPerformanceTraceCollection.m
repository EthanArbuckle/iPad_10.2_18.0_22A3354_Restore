@implementation MXMStartPerformanceTraceCollection

void __MXMStartPerformanceTraceCollection_block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    _MXMGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v11;
LABEL_10:
      _os_log_impl(&dword_214474000, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    _MXMGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v10;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v9)
  {
    _MXMGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v9;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_12:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 ^ 1u;

}

@end
