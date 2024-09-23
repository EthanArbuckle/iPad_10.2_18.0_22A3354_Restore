@implementation FBKLoginWithAppleConnect

void __FBKLoginWithAppleConnect_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __FBKLoginWithAppleConnect_block_invoke_2;
  v5[3] = &unk_24E156DC8;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __FBKLoginWithAppleConnect_block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[FBKLog appleConnect](FBKLog, "appleConnect");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __FBKLoginWithAppleConnect_block_invoke_2_cold_1(v2, v4);

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "serviceTicket");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v8, 0);

  }
}

void __FBKLoginWithAppleConnect_block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "ErrorSignIn: [%{public}@]", (uint8_t *)&v5, 0xCu);

}

@end
