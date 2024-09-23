@implementation AAAuthenticationErrorHandler

+ (void)handleAuthenticationError:(id)a3 resetAuthenticatedOnAlertFailure:(BOOL)a4 forAccount:(id)a5 inStore:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, id);
  _QWORD v15[4];
  void (**v16)(id, uint64_t, id);

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, uint64_t, id))a7;
  if (objc_msgSend(v11, "ak_isUserCancelError"))
  {
    if (v14)
      v14[2](v14, 1, v11);
  }
  else if (v10)
  {
    objc_msgSend(v12, "setAuthenticated:", 1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __121__AAAuthenticationErrorHandler_handleAuthenticationError_resetAuthenticatedOnAlertFailure_forAccount_inStore_completion___block_invoke;
    v15[3] = &unk_1E416FF88;
    v16 = v14;
    objc_msgSend(v13, "saveAccount:withHandler:", v12, v15);

  }
  else if (v14)
  {
    v14[2](v14, 2, v11);
  }

}

uint64_t __121__AAAuthenticationErrorHandler_handleAuthenticationError_resetAuthenticatedOnAlertFailure_forAccount_inStore_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

@end
