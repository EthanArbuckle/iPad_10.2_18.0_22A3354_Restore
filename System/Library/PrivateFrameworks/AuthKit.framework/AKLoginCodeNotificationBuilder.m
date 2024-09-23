@implementation AKLoginCodeNotificationBuilder

+ (__CFUserNotification)buildLoginCodeNotificationWithTitle:(id)a3 body:(id)a4 footer:(id)a5 loginCode:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFUserNotification *v14;
  const __CFDictionary *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(MEMORY[0x1E0CF0E90], "deviceIsAudioAccessory"))
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[AKLoginCodeNotificationBuilder buildLoginCodeNotificationWithTitle:body:footer:loginCode:].cold.1(v13);

    v14 = 0;
  }
  else
  {
    +[AKLoginCodeNotificationBuilder buildLoginCodeNotificationOptionsWithTitle:body:footer:loginCode:](AKLoginCodeNotificationBuilder, "buildLoginCodeNotificationOptionsWithTitle:body:footer:loginCode:", v9, v10, v11, v12);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, v15);

  }
  return v14;
}

+ (id)buildLoginCodeNotificationOptionsWithTitle:(id)a3 body:(id)a4 footer:(id)a5 loginCode:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  AKAppleIDAuthenticationContext *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext _setMessage:](v13, "_setMessage:", v12);

  -[AKAppleIDAuthenticationContext setReason:](v13, "setReason:", v11);
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v14, "stringWithFormat:", CFSTR("%06u"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationContext setGeneratedCode:](v13, "setGeneratedCode:", v16);

  -[AKAppleIDAuthenticationContext setNotificationDisclaimer:](v13, "setNotificationDisclaimer:", v10);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LOGIN_CODE_ALERT_OK_BUTTON"), &stru_1E2E647A8, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C9B838]);

  -[AKAppleIDAuthenticationContext _message](v13, "_message");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DABC18]);

  -[AKAppleIDAuthenticationContext _interpolatedReason](v13, "_interpolatedReason");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0DABC28]);

  v22 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "resourceURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0C9B860]);

  objc_msgSend(MEMORY[0x1E0CB35E8], "extensionItemWithAppleIDAuthenticationContext:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB36F8];
  v31[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "archivedDataWithRootObject:requiringSecureCoding:error:", v27, 1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = *MEMORY[0x1E0DABBC0];
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0DABBC0]);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0DABB98]);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0DABBB0]);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0DABBE8]);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, v29);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("com.apple.AuthKitUI.AKSecondFactorAlert"), *MEMORY[0x1E0DABBB8]);

  return v17;
}

+ (void)buildLoginCodeNotificationWithTitle:(os_log_t)log body:footer:loginCode:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Attempted to show login code CFUserNotification on HomePod, AuthKit prompts aren't made for this!", v1, 2u);
}

@end
