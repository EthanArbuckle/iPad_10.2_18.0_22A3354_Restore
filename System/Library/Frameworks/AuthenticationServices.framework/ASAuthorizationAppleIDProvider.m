@implementation ASAuthorizationAppleIDProvider

+ (void)initialize
{
  ASAuthorizationAppleIDProvider *v2;
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ASAuthorizationAppleIDProvider;
  objc_msgSendSuper2(&v3, sel_initialize);
  v2 = objc_alloc_init(ASAuthorizationAppleIDProvider);
  objc_msgSend(MEMORY[0x24BE0AD10], "startServiceWithNotificationHandler:", v2);

}

- (ASAuthorizationAppleIDRequest)createRequest
{
  ASAuthorizationAppleIDProvider *v2;
  ASAuthorizationAppleIDRequest *v3;

  v2 = objc_alloc_init(ASAuthorizationAppleIDProvider);
  v3 = -[ASAuthorizationRequest initWithProvider:]([ASAuthorizationAppleIDRequest alloc], "initWithProvider:", v2);

  return v3;
}

- (void)getCredentialStateForUserID:(NSString *)userID completion:(void *)completion
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = completion;
  v6 = (objc_class *)MEMORY[0x24BE0AD00];
  v7 = userID;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setUserID:", v7);

  v9 = objc_alloc_init(MEMORY[0x24BE0ACF0]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__ASAuthorizationAppleIDProvider_getCredentialStateForUserID_completion___block_invoke;
  v11[3] = &unk_24C950940;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "getCredentialStateForRequest:completion:", v8, v11);

}

void __73__ASAuthorizationAppleIDProvider_getCredentialStateForUserID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  switch(a2)
  {
    case 0:
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_7;
    case 1:
    case 4:
    case 5:
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_7;
    case 2:
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1000, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_8;
    case 3:
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_7:
      v6();
LABEL_8:
      v5 = v8;
      break;
    default:
      break;
  }

}

- (void)credentialStateDidChange:(int64_t)a3 completion:(id)a4
{
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;

  if (a3)
  {
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = (void (**)(id, uint64_t, _QWORD))a4;
    objc_msgSend(v4, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("ASAuthorizationAppleIDCredentialRevokedNotification"), 0);

    v5[2](v5, 1, 0);
  }

}

@end
