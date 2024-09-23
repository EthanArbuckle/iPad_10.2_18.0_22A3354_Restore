@implementation EKLocalTCCPermissionChecker

- (unint64_t)eventAuthorization
{
  return -[EKLocalTCCPermissionChecker _authorizationForService:](self, "_authorizationForService:", *MEMORY[0x1E0DB10E8]);
}

- (unint64_t)remindersAuthorization
{
  return -[EKLocalTCCPermissionChecker _authorizationForService:](self, "_authorizationForService:", *MEMORY[0x1E0DB1198]);
}

- (void)requestAuthorization:(unint64_t)a3 forService:(__CFString *)a4 clientDictionary:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a6;
  v8 = a5;
  tcc_credential_singleton_for_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  CalRequestAuthorizationForServiceWithCompletion();

}

uint64_t __91__EKLocalTCCPermissionChecker_requestAuthorization_forService_clientDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "_authorizationForService:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)_authorizationForService:(__CFString *)a3
{
  return tcc_authorization_preflight();
}

@end
