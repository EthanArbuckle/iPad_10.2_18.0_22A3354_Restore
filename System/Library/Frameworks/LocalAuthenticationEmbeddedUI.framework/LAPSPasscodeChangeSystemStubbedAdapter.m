@implementation LAPSPasscodeChangeSystemStubbedAdapter

- (id)oldPasscodeRequest
{
  LAPSFetchOldPasscodeRequest *v2;
  void *v3;

  v2 = objc_alloc_init(LAPSFetchOldPasscodeRequest);
  -[LAPSFetchOldPasscodeRequest setFailedAttempts:](v2, "setFailedAttempts:", 0);
  +[LAPSPasscodeType numericSixDigitsType](LAPSPasscodeType, "numericSixDigitsType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeRequest setPasscodeType:](v2, "setPasscodeType:", v3);

  -[LAPSFetchOldPasscodeRequest setBackoffTimeout:](v2, "setBackoffTimeout:", 0);
  return v2;
}

- (id)newPasscodeRequest
{
  LAPSFetchNewPasscodeRequest *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(LAPSFetchNewPasscodeRequest);
  __60__LAPSPasscodeChangeSystemStubbedAdapter_newPasscodeRequest__block_invoke();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeRequest setAllowedPasscodeTypes:](v2, "setAllowedPasscodeTypes:", v3);

  +[LAPSPasscodeType numericSixDigitsType](LAPSPasscodeType, "numericSixDigitsType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeRequest setPasscodeType:](v2, "setPasscodeType:", v4);

  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoverySupported:](v2, "setIsPasscodeRecoverySupported:", 1);
  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoveryRestricted:](v2, "setIsPasscodeRecoveryRestricted:", 0);
  -[LAPSFetchNewPasscodeRequest setIsPasscodeRecoveryEnabled:](v2, "setIsPasscodeRecoveryEnabled:", 1);
  return v2;
}

id __60__LAPSPasscodeChangeSystemStubbedAdapter_newPasscodeRequest__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF00];
  +[LAPSPasscodeType numericFourDigitsType](LAPSPasscodeType, "numericFourDigitsType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  +[LAPSPasscodeType numericSixDigitsType](LAPSPasscodeType, "numericSixDigitsType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  +[LAPSPasscodeType numericCustomDigitsType](LAPSPasscodeType, "numericCustomDigitsType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  +[LAPSPasscodeType alphanumericType](LAPSPasscodeType, "alphanumericType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastPasscodeChange
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -86400.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasPasscode
{
  return 1;
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_time(0, 1000000000);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__LAPSPasscodeChangeSystemStubbedAdapter_verifyPasscode_completion___block_invoke;
  v10[3] = &unk_24FDCDB38;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], v10);

}

void __68__LAPSPasscodeChangeSystemStubbedAdapter_verifyPasscode_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "passcode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("111111"));

  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:](LAPSErrorBuilder, "invalidPasscodeErrorWithFailedAttemptsCount:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__LAPSPasscodeChangeSystemStubbedAdapter_verifyNewPasscode_completion___block_invoke;
  block[3] = &unk_24FDCDB60;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

}

uint64_t __71__LAPSPasscodeChangeSystemStubbedAdapter_verifyNewPasscode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return 1;
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a5;
  v6 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__LAPSPasscodeChangeSystemStubbedAdapter_changePasscode_to_completion___block_invoke;
  block[3] = &unk_24FDCDB60;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

uint64_t __71__LAPSPasscodeChangeSystemStubbedAdapter_changePasscode_to_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
