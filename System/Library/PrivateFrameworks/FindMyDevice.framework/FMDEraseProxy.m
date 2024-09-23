@implementation FMDEraseProxy

- (void)eraseDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v6 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration eraseDeviceServiceConfiguration](FMNSXPCConnectionConfiguration, "eraseDeviceServiceConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke;
  v18[3] = &unk_1E829C100;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v9, "addFailureBlock:", v18);
  objc_msgSend(v9, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3;
  v15[3] = &unk_1E829C380;
  v16 = v9;
  v17 = v11;
  v13 = v9;
  v14 = v11;
  objc_msgSend(v12, "eraseDeviceWithOptions:completion:", v6, v15);

}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_cold_1(a2, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);

}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "eraseMacDeviceWithCompletion completed", v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9939000, a2, a3, "XPC error for eraseDeviceWithCompletion: %li", a5, a6, a7, a8, 0);
}

void __51__FMDEraseProxy_eraseDeviceWithOptions_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9939000, a2, a3, "eraseMacDeviceWithCompletion encountered an error : %@", a5, a6, a7, a8, 2u);
}

@end
