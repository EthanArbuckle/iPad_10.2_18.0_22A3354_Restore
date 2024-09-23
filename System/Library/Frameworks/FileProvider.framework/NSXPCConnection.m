@implementation NSXPCConnection

void __69__NSXPCConnection_FPAdditions__fp_annotateInvocation_withLogSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = FPPopLogSectionForBlock(WeakRetained);

  if (v5)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 134218498;
      v11 = v5;
      v12 = 2112;
      v13 = CFSTR("(unavailable)");
      v14 = 2080;
      v15 = objc_msgSend(v8, "fileSystemRepresentation");
      _os_log_debug_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s ", buf, 0x20u);

    }
  }
  v7 = (void *)MEMORY[0x1A1B00850](*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setTarget:", v7);

  objc_msgSend(v3, "invoke");
  objc_storeWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
  __fp_pop_log(&v9);

}

@end
