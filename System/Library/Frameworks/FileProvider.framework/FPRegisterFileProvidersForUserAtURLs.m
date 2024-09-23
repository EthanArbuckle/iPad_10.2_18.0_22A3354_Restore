@implementation FPRegisterFileProvidersForUserAtURLs

void __FPRegisterFileProvidersForUserAtURLs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(uint64_t, id, _QWORD *);
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a2;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __FPRegisterFileProvidersForUser_block_invoke_cold_1();

  v8 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __FPRegisterFileProvidersForUserAtURLs_block_invoke_12;
  v11[3] = &unk_1E444A308;
  v12 = v5;
  v9 = *(void (**)(uint64_t, id, _QWORD *))(v8 + 16);
  v10 = v5;
  v9(v8, v6, v11);

}

@end
