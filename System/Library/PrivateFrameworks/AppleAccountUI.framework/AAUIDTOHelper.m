@implementation AAUIDTOHelper

- (AAUIDTOHelper)initWithDTOController:(id)a3
{
  id v5;
  AAUIDTOHelper *v6;
  AAUIDTOHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIDTOHelper;
  v6 = -[AAUIDTOHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (BOOL)isDTOGatingEnabled
{
  return -[AKBiometricRatchetController isDTOEnabled](self->_controller, "isDTOEnabled");
}

- (void)shouldGateUsingRatchetForAltDSID:(id)a3 completion:(id)a4
{
  -[AKBiometricRatchetController isCriticalEditAllowedForAltDSID:completion:](self->_controller, "isCriticalEditAllowedForAltDSID:completion:", a3, a4);
}

+ (BOOL)_shouldAllowOpForRatchetState:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "rawState") == 3 || objc_msgSend(v3, "rawState") == 4;

  return v4;
}

- (id)makeRatchetContextWithPresentationContext:(id)a3 DTOContextType:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_FALLBACK_TEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_BODY"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE_DELETE_RC"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_COUNTDOWN_TEXT_DELETE_RC"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("BIOMETRIC_RATCHET_CALLOUT_REASON_DELETE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE_ADD_RC"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_COUNTDOWN_TEXT_ADD_RC"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("BIOMETRIC_RATCHET_CALLOUT_REASON_ADD");
    }
    else
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_COUNTDOWN_TEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("BIOMETRIC_RATCHET_CALLOUT_REASON");
    }
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1EA2E2A18, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc(MEMORY[0x1E0D00328]);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=accountRecovery"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = 0;
  v24 = (void *)objc_msgSend(v22, "initWithReason:calloutReason:deeplinkURL:presentationContext:fallbackToNoAuth:useShortExpiration:beginRatchetTitle:beginRatchetBody:showsLocationWarning:countdownText:findMyErrorTitle:findMyErrorMessage:metaContext:", v8, v21, v23, v6, 0, 0, v12, v10, v26, v14, &stru_1EA2E2A18, &stru_1EA2E2A18, 0);

  return v24;
}

- (void)shouldAllowOpForContext:(id)a3 completion:(id)a4
{
  id v6;
  AKBiometricRatchetController *controller;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  controller = self->_controller;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke;
  v9[3] = &unk_1EA2DCDC8;
  v10 = v6;
  v8 = v6;
  -[AKBiometricRatchetController armWithContext:completion:](controller, "armWithContext:completion:", a3, v9);

}

void __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke_cold_1((uint64_t)v6, v7);

  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    objc_msgSend(v5, "ratchetState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[AAUIDTOHelper _shouldAllowOpForRatchetState:](AAUIDTOHelper, "_shouldAllowOpForRatchetState:", v9);
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, _BOOL8, _QWORD))(v11 + 16))(v11, v10, 0);

  }
}

- (id)makeCustodianDeleteOpNotAllowedAlert
{
  return -[AAUIDTOHelper _makeOpNotAllowedAlertForAddCustodian:](self, "_makeOpNotAllowedAlertForAddCustodian:", 0);
}

- (id)makeCustodianAddOpNotAllowedAlert
{
  return -[AAUIDTOHelper _makeOpNotAllowedAlertForAddCustodian:](self, "_makeOpNotAllowedAlertForAddCustodian:", 1);
}

- (id)_makeOpNotAllowedAlertForAddCustodian:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RATCHET_RC_EDIT_NOT_ALLOWED_ALERT_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("RATCHET_RC_ADD_NOT_ALLOWED_ALERT_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1EA2E2A18, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RATCHET_RC_ADD_NOT_ALLOWED_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(MEMORY[0x1E0CF0E90], "isVirtualMachine"))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("RATCHET_RC_ADD_NOT_ALLOWED_MESSAGE_VM");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("RATCHET_RC_DELETE_NOT_ALLOWED_ALERT_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v14, &stru_1EA2E2A18, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RATCHET_RC_DELETE_NOT_ALLOWED_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(MEMORY[0x1E0CF0E90], "isVirtualMachine"))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("RATCHET_RC_DELETE_NOT_ALLOWED_MESSAGE_VM");
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1EA2E2A18, CFSTR("Localizable"));
  v16 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v16;
LABEL_7:
  _AAUILogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[AAUIDTOHelper _makeOpNotAllowedAlertForAddCustodian:].cold.1((uint64_t)v8, (uint64_t)v10, v17);

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:buttonTitle:", v8, v10, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)makeGenericRatchetFailedAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RATCHET_RC_EDIT_NOT_ALLOWED_ALERT_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RATCHET_RC_EDIT_GENERIC_RATCHET_FAILURE_ALERT_DESCRIPTION"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RATCHET_RC_EDIT_GENERIC_RATCHET_FAILURE_ALERT_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertWithTitle:message:buttonTitle:", v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

void __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Calling armed ratchet error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_makeOpNotAllowedAlertForAddCustodian:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "title: %@, message: %@", (uint8_t *)&v3, 0x16u);
}

@end
