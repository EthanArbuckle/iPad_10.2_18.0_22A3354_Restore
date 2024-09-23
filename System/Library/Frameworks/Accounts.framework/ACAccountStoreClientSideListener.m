@implementation ACAccountStoreClientSideListener

- (ACAccountStoreClientSideListener)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACAccountStoreClientSideListener;
  return -[ACAccountStoreClientSideListener init](&v3, sel_init);
}

- (void)accountCredentialsDidChangeForAccountWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD block[4];
  NSObject *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__ACAccountStoreClientSideListener_accountCredentialsDidChangeForAccountWithIdentifier___block_invoke;
    block[3] = &unk_1E4892AD8;
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = v8;
  }
  else
  {
    _ACLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A2BCD000, v5, OS_LOG_TYPE_DEFAULT, "\"ACAccountStoreClientSideListener is ignoring credential change notification because no account ID was provided.\", v6, 2u);
    }
  }

}

void __88__ACAccountStoreClientSideListener_accountCredentialsDidChangeForAccountWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = CFSTR("ACAccountIdentifierKey");
  v5[1] = CFSTR("AccountIdentifier");
  v6[0] = v3;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ACAccountCredentialsDidChangeNotification"), 0, v4);

}

@end
