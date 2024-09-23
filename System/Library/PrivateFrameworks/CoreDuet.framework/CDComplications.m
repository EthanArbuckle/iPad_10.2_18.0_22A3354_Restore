@implementation CDComplications

void __38___CDComplications_sharedComplication__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initForComplications");
  v2 = (void *)sharedInstance;
  sharedInstance = v1;

  if (!sharedInstance)
  {
    +[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38___CDComplications_sharedComplication__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

uint64_t __40___CDComplications_initForComplications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readOutActiveComplications");
}

uint64_t __40___CDComplications_initForComplications__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readOutActiveComplications");
}

uint64_t __40___CDComplications_initForComplications__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readOutActiveComplications");
}

void __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  _BYTE buf[24];
  void *v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeComplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "unsignedIntegerValue") == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "%@ is not in %@", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = MEMORY[0x1E0C809B0];
    v9 = *(void **)(v7 + 8);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke_15;
    v21[3] = &unk_1E26E2F20;
    v21[4] = v7;
    v10 = v21;
    v11 = v9;
    v12 = (void *)os_transaction_create();
    *(_QWORD *)buf = v8;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_2;
    v23 = &unk_1E26E3380;
    v24 = v12;
    v25 = v10;
    v13 = v12;
    dispatch_async(v11, buf);

    goto LABEL_6;
  }
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_6;
  if (objc_msgSend(*(id *)(a1 + 32), "watchIsCharging"))
  {
LABEL_15:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_6;
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "remainingPushesOnComplication:andReduceBy:", *(_QWORD *)(a1 + 40), &unk_1E272A9C0);
  +[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v14;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v16;
    _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_INFO, "Found %d complication pushes remaining for %@ today\n", buf, 0x12u);
  }

  +[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14 >= 1)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEFAULT, "Approved guaranteed complication push for %@\n", buf, 0xCu);
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v20;
    _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_INFO, "No more complication pushes for %@ for today, denying\n", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_6:

}

uint64_t __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readOutActiveComplications");
}

void __47___CDComplications_isBundleActiveComplication___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "activeComplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;
}

void __38___CDComplications_sharedComplication__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "error: unable to obtain a valid shared complication object\n", a5, a6, a7, a8, 0);
}

@end
