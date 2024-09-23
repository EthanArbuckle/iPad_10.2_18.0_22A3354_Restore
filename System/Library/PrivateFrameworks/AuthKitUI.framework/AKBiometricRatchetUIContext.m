@implementation AKBiometricRatchetUIContext

- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  AKBiometricRatchetUIContext *v15;
  AKBiometricRatchetUIContext *v16;
  objc_super v18;

  v8 = a8;
  v9 = a7;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AKBiometricRatchetUIContext;
  v15 = -[AKBiometricRatchetContext initWithReason:calloutReason:deeplinkURL:fallbackToNoAuth:useShortExpiration:](&v18, sel_initWithReason_calloutReason_deeplinkURL_fallbackToNoAuth_useShortExpiration_, a3, a4, a5, v9, v8);
  v16 = v15;
  if (v15)
    objc_storeWeak((id *)&v15->_presentingViewController, v14);

  return v16;
}

- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8 beginRatchetTitle:(id)a9 beginRatchetBody:(id)a10 showsLocationWarning:(BOOL)a11 countdownText:(id)a12 findMyErrorTitle:(id)a13 findMyErrorMessage:(id)a14 metaContext:(id)a15
{
  id v19;
  AKBiometricRatchetUIContext *v20;
  AKBiometricRatchetUIContext *v21;
  _BOOL4 v24;
  _BOOL4 v25;
  objc_super v26;

  v24 = a7;
  v25 = a8;
  v19 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AKBiometricRatchetUIContext;
  v20 = -[AKBiometricRatchetContext initWithReason:calloutReason:deeplinkURL:fallbackToNoAuth:useShortExpiration:beginRatchetTitle:beginRatchetBody:showsLocationWarning:countdownText:findMyErrorTitle:findMyErrorMessage:metaContext:](&v26, sel_initWithReason_calloutReason_deeplinkURL_fallbackToNoAuth_useShortExpiration_beginRatchetTitle_beginRatchetBody_showsLocationWarning_countdownText_findMyErrorTitle_findMyErrorMessage_metaContext_, a3, a4, a5, v24, v25, a9, a10, a11, a12, a13, a14, a15);
  v21 = v20;
  if (v20)
    objc_storeWeak((id *)&v20->_presentingViewController, v19);

  return v21;
}

- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8 beginRatchetTitle:(id)a9 beginRatchetBody:(id)a10 showsLocationWarning:(BOOL)a11 countdownText:(id)a12 findMyErrorTitle:(id)a13 findMyErrorMessage:(id)a14 metaContext:(id)a15 embeddedUIPresentationMode:(id)a16 embeddedUIRightNavButtonTitle:(id)a17
{
  id v19;
  id v20;
  AKBiometricRatchetUIContext *v21;
  AKBiometricRatchetUIContext *v22;
  _BOOL4 v27;
  _BOOL4 v28;
  id v29;
  objc_super v30;

  v27 = a7;
  v28 = a8;
  v19 = a6;
  v29 = a16;
  v20 = a17;
  v30.receiver = self;
  v30.super_class = (Class)AKBiometricRatchetUIContext;
  v21 = -[AKBiometricRatchetContext initWithReason:calloutReason:deeplinkURL:fallbackToNoAuth:useShortExpiration:beginRatchetTitle:beginRatchetBody:showsLocationWarning:countdownText:findMyErrorTitle:findMyErrorMessage:metaContext:](&v30, sel_initWithReason_calloutReason_deeplinkURL_fallbackToNoAuth_useShortExpiration_beginRatchetTitle_beginRatchetBody_showsLocationWarning_countdownText_findMyErrorTitle_findMyErrorMessage_metaContext_, a3, a4, a5, v27, v28, a9, a10, a11, a12, a13, a14, a15);
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_presentingViewController, v19);
    objc_storeStrong((id *)&v22->_embeddedUIPresentationMode, a16);
    objc_storeStrong((id *)&v22->_embeddedUIRightNavButtonTitle, a17);
  }

  return v22;
}

- (AKBiometricRatchetUIContext)initWithAttributes:(id)a3 presentationContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  AKBiometricRatchetUIContext *v46;
  AKBiometricRatchetUIContext *v47;
  void *v49;
  id v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;

  v6 = a3;
  v50 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fallback"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
    v9 = objc_msgSend(v8, "BOOLValue");
  else
    v9 = 0;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fallbackText"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v55 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_FALLBACK_TEXT"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_COUNTDOWN_TEXT"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calloutReason"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_CALLOUT_REASON"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deeplink"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deeplinkType"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;

  v53 = v22;
  if (v20 && v22)
  {
    -[AKBiometricRatchetUIContext _findMappedDeeplinkFor:withKey:](self, "_findMappedDeeplinkFor:withKey:", v20, v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("prefs:root=APPLE_ACCOUNT"));
  }
  v49 = (void *)v23;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("beginRatchetTitle"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v54 = v20;

  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("beginRatchetBody"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v56 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = v27;
  else
    v28 = 0;

  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_BODY"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disableFM"));
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v31 = v30;
  else
    v31 = 0;

  v52 = v31;
  if (v31)
    v51 = objc_msgSend(v31, "BOOLValue");
  else
    v51 = 0;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disableFMErrorTitle"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v59 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v32;
  else
    v33 = 0;

  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_FIND_MY_ERROR_TITLE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disableFMErrorMessage"));
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v60 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;

  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_FIND_MY_ERROR_MESSAGE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metaContext"));
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v57 = v25;
  v58 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v39 = v38;
  else
    v39 = 0;

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("presentationMode"));
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v41 = v40;
  else
    v41 = 0;

  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_EMBEDDEDUI_PRESENTATION_MODE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v41 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightNavBarButtonTitle"));
  v43 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = v43;
  else
    v44 = 0;

  if (!v44)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_EMBEDDEDUI_RIGHT_NAVBUTTON_TITLE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v44 = (id)objc_claimAutoreleasedReturnValue();

  }
  v61.receiver = self;
  v61.super_class = (Class)AKBiometricRatchetUIContext;
  v46 = -[AKBiometricRatchetContext initWithReason:calloutReason:deeplinkURL:fallbackToNoAuth:useShortExpiration:beginRatchetTitle:beginRatchetBody:showsLocationWarning:countdownText:findMyErrorTitle:findMyErrorMessage:metaContext:](&v61, sel_initWithReason_calloutReason_deeplinkURL_fallbackToNoAuth_useShortExpiration_beginRatchetTitle_beginRatchetBody_showsLocationWarning_countdownText_findMyErrorTitle_findMyErrorMessage_metaContext_, v58, v59, v49, v55, 0, v57, v28, v51, v60, v33, v36, v39);
  v47 = v46;
  if (v46)
  {
    objc_storeWeak((id *)&v46->_presentingViewController, v50);
    objc_storeStrong((id *)&v47->_embeddedUIPresentationMode, v41);
    objc_storeStrong((id *)&v47->_embeddedUIRightNavButtonTitle, v44);
  }

  return v47;
}

- (AKBiometricRatchetUIProvider)bioRatchetUIProvider
{
  AKBiometricRatchetUIProvider *bioRatchetUIProvider;
  NSObject *v4;
  AKBiometricRatchetiOSUIProvider *v5;
  AKBiometricRatchetUIProvider *v6;
  uint8_t v8[16];

  bioRatchetUIProvider = self->_bioRatchetUIProvider;
  if (!bioRatchetUIProvider)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Bio Ratchet UI Provider initialized", v8, 2u);
    }

    v5 = -[AKBiometricRatchetiOSUIProvider initWithContext:]([AKBiometricRatchetiOSUIProvider alloc], "initWithContext:", self);
    v6 = self->_bioRatchetUIProvider;
    self->_bioRatchetUIProvider = (AKBiometricRatchetUIProvider *)v5;

    bioRatchetUIProvider = self->_bioRatchetUIProvider;
  }
  return bioRatchetUIProvider;
}

- (void)_assertValidPresentingViewController
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "Presenting view controller is missing! Things don't look good!", v1, 2u);
}

- (void)presentRatchetUIWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetUIContext presentRatchetUIWithCompletion:].cold.1(v5);

  -[AKBiometricRatchetUIContext bioRatchetUIProvider](self, "bioRatchetUIProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentRatchetUIWithCompletion:", v4);

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKBiometricRatchetUIContext;
  -[AKBiometricRatchetContext debugDescription](&v8, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ \tpresentationContext: %@,\n"), v3, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_findMappedDeeplinkFor:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("url")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("urlBagKey")))
    {
      objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "urlAtKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_9;
      _AKLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AKBiometricRatchetUIContext _findMappedDeeplinkFor:withKey:].cold.1((uint64_t)v6, v9);

    }
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v7;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (NSString)embeddedUIPresentationMode
{
  return self->_embeddedUIPresentationMode;
}

- (NSString)embeddedUIRightNavButtonTitle
{
  return self->_embeddedUIRightNavButtonTitle;
}

- (void)setBioRatchetUIProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bioRatchetUIProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioRatchetUIProvider, 0);
  objc_storeStrong((id *)&self->_embeddedUIRightNavButtonTitle, 0);
  objc_storeStrong((id *)&self->_embeddedUIPresentationMode, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (void)presentRatchetUIWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "Calling bioRatchetUIProvider to present the ratchet arming UI", v1, 2u);
}

- (void)_findMappedDeeplinkFor:(uint64_t)a1 withKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "URL not found for key: %@", (uint8_t *)&v2, 0xCu);
}

@end
