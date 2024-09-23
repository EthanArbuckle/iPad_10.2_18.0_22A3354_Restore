@implementation SFSearchResult

void __82__SFSearchResult_VisualCat__processVisualCATResultSynchronouslyUsingPatternClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (PARLogHandleForCategory_onceToken_19 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
  v7 = (id)PARLogHandleForCategory_logHandles_4_21;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_19A825000, v8, OS_SIGNPOST_INTERVAL_END, v9, "execute", ", (uint8_t *)&v16, 2u);
  }

  if (v6 || (objc_msgSend(v5, "visual"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    if (PARLogHandleForCategory_onceToken_19 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
    v10 = (void *)PARLogHandleForCategory_logHandles_4_21;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      objc_msgSend(v6, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v12;
      _os_log_error_impl(&dword_19A825000, v11, OS_LOG_TYPE_ERROR, "Empty VisualCAT output, check DialogEngine logs. Execution error: %@.", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v5, "visual");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setVisualCATOutput:", v15);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
