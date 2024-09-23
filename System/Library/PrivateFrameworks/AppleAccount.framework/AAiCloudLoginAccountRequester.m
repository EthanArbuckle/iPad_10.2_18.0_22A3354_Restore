@implementation AAiCloudLoginAccountRequester

+ (id)delegateParamsForAllDelegates
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.gamecenter");
  v3[1] = CFSTR("com.apple.mobileme");
  v4[0] = MEMORY[0x1E0C9AA70];
  v4[1] = MEMORY[0x1E0C9AA70];
  v3[2] = CFSTR("com.apple.private.ids");
  v4[2] = &unk_1E41A68A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)delegateParamsForiCloudOnly
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("com.apple.mobileme");
  v4[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)loginWithAccount:(id)a3 forDelegates:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  AALoginAccountRequest *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[AALoginAccountRequest initWithAccount:delegates:]([AALoginAccountRequest alloc], "initWithAccount:delegates:", v9, v8);

  objc_msgSend(v9, "_aa_termsServerInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AALoginAccountRequest setServerInfo:](v10, "setServerInfo:", v11);

  objc_msgSend(v9, "_aa_setTermsServerInfo:", 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__AAiCloudLoginAccountRequester_loginWithAccount_forDelegates_completion___block_invoke;
  v13[3] = &unk_1E416E208;
  v14 = v7;
  v12 = v7;
  -[AARequest performSignedRequestWithHandler:](v10, "performSignedRequestWithHandler:", v13);

}

uint64_t __74__AAiCloudLoginAccountRequester_loginWithAccount_forDelegates_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
