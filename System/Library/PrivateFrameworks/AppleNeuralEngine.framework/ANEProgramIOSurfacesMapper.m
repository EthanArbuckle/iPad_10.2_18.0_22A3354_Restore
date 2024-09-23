@implementation ANEProgramIOSurfacesMapper

void __41___ANEProgramIOSurfacesMapper_initialize__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.ane.programIOSurfacesMapper", v2);
  v1 = (void *)gANEMemoryMapperQueue;
  gANEMemoryMapperQueue = (uint64_t)v0;

}

void __83___ANEProgramIOSurfacesMapper_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "device");
  if (v3 && *(_QWORD *)v3)
    v4 = (*(uint64_t (**)(uint64_t, _QWORD, BOOL))(*(_QWORD *)v3 + 56))(v3, *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 80) != 0);
  else
    v4 = 2;

  +[_ANELog common](_ANELog, "common");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v6;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_1D3352000, v5, OS_LOG_TYPE_INFO, "-----> %@: ANEProgramMemoryMapRequest() ret=0x%x ", (uint8_t *)&v12, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4 == 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors programIOSurfacesMapErrorForMethod:code:](_ANEErrors, "programIOSurfacesMapErrorForMethod:code:", v8, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

LABEL_13:
    return;
  }
  v7 = *(unsigned __int8 *)(a1 + 80);
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 3088));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "setTransactionHandle:", v8);
  if (v7)
    goto LABEL_13;
}

void __70___ANEProgramIOSurfacesMapper_unmapIOSurfacesWithModel_request_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "device");
  if (v3 && *(_QWORD *)v3)
    v4 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v3 + 64))(v3, *(_QWORD *)(a1 + 56));
  else
    v4 = 2;

  +[_ANELog common](_ANELog, "common");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1D3352000, v5, OS_LOG_TYPE_INFO, "-----> %@: ANEProgramMemoryUnMapRequest() ret=0x%x ", (uint8_t *)&v11, 0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 == 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors programIOSurfacesUnmapErrorForMethod:code:](_ANEErrors, "programIOSurfacesUnmapErrorForMethod:code:", v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

@end
