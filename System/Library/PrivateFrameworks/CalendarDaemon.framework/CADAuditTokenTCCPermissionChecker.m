@implementation CADAuditTokenTCCPermissionChecker

- (CADAuditTokenTCCPermissionChecker)initWithAuditToken:(id *)a3
{
  CADAuditTokenTCCPermissionChecker *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CADAuditTokenTCCPermissionChecker;
  result = -[CADAuditTokenTCCPermissionChecker init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (unint64_t)eventAuthorization
{
  return -[CADAuditTokenTCCPermissionChecker _authorizationForService:](self, "_authorizationForService:", *MEMORY[0x1E0DB10E8]);
}

- (unint64_t)remindersAuthorization
{
  return -[CADAuditTokenTCCPermissionChecker _authorizationForService:](self, "_authorizationForService:", *MEMORY[0x1E0DB1198]);
}

- (void)requestAuthorization:(unint64_t)a3 forService:(__CFString *)a4 clientDictionary:(id)a5 completion:(id)a6
{
  id v10;
  __int128 v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __CFString *v17;
  __int128 v18;
  __int128 v19;

  v10 = a6;
  v11 = *(_OWORD *)&self->_auditToken.val[4];
  v18 = *(_OWORD *)self->_auditToken.val;
  v19 = v11;
  v12 = a5;
  v13 = (void *)tcc_credential_create_for_process_with_audit_token();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__CADAuditTokenTCCPermissionChecker_requestAuthorization_forService_clientDictionary_completion___block_invoke;
  v15[3] = &unk_1E6A37088;
  v16 = v10;
  v17 = a4;
  v15[4] = self;
  v14 = v10;
  CalRequestAuthorizationForServiceWithCompletion(a3, v13, (uint64_t)a4, v12, v15);

}

uint64_t __97__CADAuditTokenTCCPermissionChecker_requestAuthorization_forService_clientDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "_authorizationForService:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)_authorizationForService:(__CFString *)a3
{
  return tcc_authorization_check_audit_token();
}

@end
