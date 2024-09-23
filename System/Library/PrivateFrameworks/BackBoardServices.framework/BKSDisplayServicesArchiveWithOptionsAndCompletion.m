@implementation BKSDisplayServicesArchiveWithOptionsAndCompletion

void __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BKLogDisplayArchive();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_ERROR, "error talking to service : %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }

}

void __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    BKLogDisplayArchive();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEFAULT, "received name layers and dump all response from service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }

}

void __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    BKLogDisplayArchive();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEFAULT, "received dump all response from service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }

}

@end
