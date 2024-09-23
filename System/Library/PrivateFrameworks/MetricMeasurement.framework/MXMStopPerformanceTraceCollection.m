@implementation MXMStopPerformanceTraceCollection

void __MXMStopPerformanceTraceCollection_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a3);
  v23 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v23 + 24) || !*(_QWORD *)(v23 + 40))
  {
    if (v21)
    {
      _MXMGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        v27 = v21;
LABEL_19:
        _os_log_impl(&dword_214474000, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
      }
    }
    else if (v19)
    {
      _MXMGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        v27 = v19;
        goto LABEL_19;
      }
    }
    else if (v22)
    {
      _MXMGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        v27 = v22;
        goto LABEL_19;
      }
    }
    else if (v20)
    {
      _MXMGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        v27 = v20;
        goto LABEL_19;
      }
    }
    else
    {
      if (!v18)
      {
LABEL_21:
        v24 = 3;
        goto LABEL_22;
      }
      _MXMGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        v27 = v18;
        goto LABEL_19;
      }
    }

    goto LABEL_21;
  }
  v24 = 2;
LABEL_22:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v24;

}

@end
