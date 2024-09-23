@implementation FulfillOnDemandResource

void ___FulfillOnDemandResource_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  NSObject *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to fulfill on-demand resource: %@"), *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] %@, error: %@", buf, 0x16u);
    }

    _PHResourceLocalAvailabilityRequestError(1, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    PLPhotoKitGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Did fulfill on-demand resource: %@", buf, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
