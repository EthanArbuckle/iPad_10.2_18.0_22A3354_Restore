void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

TypeWithIdentifier:(id)a3
{
  return MEMORY[0x24BEDD108](a3, sel_isEqualToString_, *MEMORY[0x24BDB4170]);
}

- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8
{
  void (**v9)(id, uint64_t, _QWORD);
  const char *v10;
  const char *v11;
  uint64_t hasEntitlement;
  id v13;

  v13 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a8;
  if ((objc_msgSend_hasEntitlement_(v13, v10, *MEMORY[0x24BDB44D0]) & 1) != 0)
    hasEntitlement = 1;
  else
    hasEntitlement = objc_msgSend_hasEntitlement_(v13, v11, *MEMORY[0x24BDB4450]);
  v9[2](v9, hasEntitlement, 0);

}

- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  uint64_t v7;
  const char *v8;
  uint64_t hasEntitlement;
  void (**v10)(id, uint64_t, _QWORD);

  v7 = *MEMORY[0x24BDB44D0];
  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  hasEntitlement = objc_msgSend_hasEntitlement_(a4, v8, v7);
  v10[2](v10, hasEntitlement, 0);

}

- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  uint64_t v7;
  const char *v8;
  uint64_t hasEntitlement;
  void (**v10)(id, uint64_t, _QWORD);

  v7 = *MEMORY[0x24BDB44D0];
  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  hasEntitlement = objc_msgSend_hasEntitlement_(a4, v8, v7);
  v10[2](v10, hasEntitlement, 0);

}

- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

@end
