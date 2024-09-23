@implementation CacheManagementRemove

uint64_t __CacheManagementRemove_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v3;
  void *v4;

  if (*a3)
    a3[1] = 0;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

void __CacheManagementRemove_block_invoke_12(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "UTF8String");
      objc_msgSend(*(id *)(a1 + 32), "relativePath");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = 134218498;
      v11 = a2;
      v12 = 2080;
      v13 = v8;
      v14 = 2080;
      v15 = objc_msgSend(v9, "fileSystemRepresentation");
      _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "container_delete_user_managed_assets error: %llu for %s : %s", (uint8_t *)&v10, 0x20u);

    }
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CacheManagementErrorDomain"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

@end
