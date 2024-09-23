@implementation CDPUIWebAccessStatusChangeModel

- (CDPUIWebAccessStatusChangeModel)initWithTargetStatus:(unint64_t)a3 statusProvider:(id)a4 statusUpdater:(id)a5 walrusStatusProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  CDPUIWebAccessStatusChangeModel *v14;
  CDPUIWebAccessStatusChangeModel *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CDPUIWebAccessStatusChangeModel;
  v14 = -[CDPUIWebAccessStatusChangeModel init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_targetStatus = a3;
    objc_storeStrong((id *)&v14->_webAccessStatusProvider, a4);
    objc_storeStrong((id *)&v15->_webAccessStatusUpdater, a5);
    objc_storeStrong((id *)&v15->_walrusStatusProvider, a6);
  }

  return v15;
}

- (void)_checkCurrentStatus:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  CDPWebAccessStatusProvider *webAccessStatusProvider;
  NSObject *v8;
  CDPWalrusStatusProvider *walrusStatusProvider;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[4];
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[4];

  v4 = a3;
  if (self->_targetStatus)
  {
    v5 = dispatch_group_create();
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    dispatch_group_enter(v5);
    v6 = MEMORY[0x24BDAC760];
    webAccessStatusProvider = self->_webAccessStatusProvider;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke;
    v20[3] = &unk_24C854F68;
    v22 = v23;
    v8 = v5;
    v21 = v8;
    -[CDPWebAccessStatusProvider webAccessStatusWithCompletion:](webAccessStatusProvider, "webAccessStatusWithCompletion:", v20);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    dispatch_group_enter(v8);
    walrusStatusProvider = self->_walrusStatusProvider;
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_2;
    v16[3] = &unk_24C854F68;
    v18 = v19;
    v10 = v8;
    v17 = v10;
    -[CDPWalrusStatusProvider walrusStatusWithCompletion:](walrusStatusProvider, "walrusStatusWithCompletion:", v16);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_3;
    v12[3] = &unk_24C854F90;
    v12[4] = self;
    v14 = v23;
    v13 = v4;
    v15 = v19;
    dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], v12);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v23, 8);

  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CDPUIWebAccessStatusChangeModel _checkCurrentStatus:].cold.1((uint64_t)self, v11);

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

_QWORD *__55__CDPUIWebAccessStatusChangeModel__checkCurrentStatus___block_invoke_3(_QWORD *result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result[4] + 32);
  if (v1 == *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24))
    return (_QWORD *)(*(uint64_t (**)(void))(result[5] + 16))();
  v2 = !v1 || v1 == 2;
  if (v2 || v1 == 1)
    return (_QWORD *)(*(uint64_t (**)(void))(result[5] + 16))();
  return result;
}

- (NSString)titleText
{
  void *v2;
  void *v3;

  if (self->_targetStatus == 1)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ENABLE_WEB_ACCESS_PROMPT_TITLE"), CFSTR("Localizable-Walrus"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)messageText
{
  void *v2;
  void *v3;

  if (self->_targetStatus == 1)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ENABLE_WEB_ACCESS_PROMPT_MESSAGE"), CFSTR("Localizable-Walrus"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)primaryButtonText
{
  void *v2;
  void *v3;

  if (self->_targetStatus == 1)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ENABLE_WEB_ACCESS_PROMPT_PRIMARY_BUTTON"), CFSTR("Localizable-Walrus"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)cancelButtonText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_updateUnderlyingValue:(id)a3
{
  -[CDPWebAccessStatusUpdater updateWebAccessStatus:completion:](self->_webAccessStatusUpdater, "updateWebAccessStatus:completion:", self->_targetStatus, a3);
}

- (unint64_t)targetStatus
{
  return self->_targetStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walrusStatusProvider, 0);
  objc_storeStrong((id *)&self->_webAccessStatusUpdater, 0);
  objc_storeStrong((id *)&self->_webAccessStatusProvider, 0);
}

- (void)_checkCurrentStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_ERROR, "@\"Skipping user prompt for %@ because the target status is CDPWebAccessStatusUnknown.\", (uint8_t *)&v2, 0xCu);
}

@end
