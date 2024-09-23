@implementation CNLoadFirstAssociatedTrack

void ___CNLoadFirstAssociatedTrack_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CNLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___CNLoadFirstAssociatedTrack_block_invoke_cold_2((uint64_t)v6, a1, v7);

    v8 = 2;
    v9 = v6;
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v10, 0);
      goto LABEL_8;
    }
    _CNLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      ___CNLoadFirstAssociatedTrack_block_invoke_cold_1(a1, v12);

    v8 = 3;
    v9 = 0;
  }
  _CNCinematicError(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v10);
LABEL_8:

}

void ___CNLoadFirstAssociatedTrack_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_23307F000, a2, OS_LOG_TYPE_ERROR, "Error: no tracks associated (type %@) with track %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void ___CNLoadFirstAssociatedTrack_block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 138412802;
  v6 = a1;
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_23307F000, log, OS_LOG_TYPE_ERROR, "Error: (%@) loading tracks associated (type %@) with track %@", (uint8_t *)&v5, 0x20u);
}

@end
