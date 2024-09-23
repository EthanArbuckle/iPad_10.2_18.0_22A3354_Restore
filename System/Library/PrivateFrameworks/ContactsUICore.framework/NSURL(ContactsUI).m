@implementation NSURL(ContactsUI)

+ (id)_cnui_walletPayURLFutureWithHandle:()ContactsUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__NSURL_ContactsUI___cnui_walletPayURLFutureWithHandle___block_invoke;
  v9[3] = &unk_1EA603AE8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_cnui_messagesURLFutureWithHandle:()ContactsUI contact:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__NSURL_ContactsUI___cnui_messagesURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_1EA603A98;
  v15 = v7;
  v16 = a1;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "lazyFutureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_cnui_telephonyURLFutureWithHandle:()ContactsUI contact:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_1EA603A98;
  v15 = v7;
  v16 = a1;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "lazyFutureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_cnui_mailURLFutureWithHandle:()ContactsUI contact:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__NSURL_ContactsUI___cnui_mailURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_1EA603A98;
  v15 = v7;
  v16 = a1;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "lazyFutureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)log
{
  if (log_cn_once_token_3 != -1)
    dispatch_once(&log_cn_once_token_3, &__block_literal_global_19);
  return (id)log_cn_once_object_3;
}

+ (id)_cnui_faceTimeAudioURLFutureWithHandle:()ContactsUI contact:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__NSURL_ContactsUI___cnui_faceTimeAudioURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_1EA603A98;
  v15 = v7;
  v16 = a1;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "lazyFutureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_cnui_faceTimeVideoURLFutureWithHandle:()ContactsUI contact:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__NSURL_ContactsUI___cnui_faceTimeVideoURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_1EA603A98;
  v15 = v7;
  v16 = a1;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "lazyFutureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_cnui_ttyURLFutureWithHandle:()ContactsUI contact:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_1EA603A98;
  v15 = v7;
  v16 = a1;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "lazyFutureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_cnui_ttyRelayURLFutureWithHandle:()ContactsUI contact:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_1EA603A98;
  v15 = v7;
  v16 = a1;
  v14 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "lazyFutureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_cnui_telephonyURLFutureWithHandle:()ContactsUI contact:channelIdentifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D13A68];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact_channelIdentifier___block_invoke;
  v17[3] = &unk_1EA603AC0;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = a1;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "lazyFutureWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_cnui_ttyURLFutureWithHandle:()ContactsUI contact:channelIdentifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D13A68];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact_channelIdentifier___block_invoke;
  v17[3] = &unk_1EA603AC0;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = a1;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "lazyFutureWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_cnui_ttyRelayURLFutureWithHandle:()ContactsUI contact:channelIdentifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D13A68];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact_channelIdentifier___block_invoke;
  v17[3] = &unk_1EA603AC0;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = a1;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "lazyFutureWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_cnui_skypeTextURLFutureWithHandle:()ContactsUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__NSURL_ContactsUI___cnui_skypeTextURLFutureWithHandle___block_invoke;
  v9[3] = &unk_1EA603AE8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_cnui_skypeVoiceURLFutureWithHandle:()ContactsUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__NSURL_ContactsUI___cnui_skypeVoiceURLFutureWithHandle___block_invoke;
  v9[3] = &unk_1EA603AE8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_cnui_skypeVideoURLFutureWithHandle:()ContactsUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__NSURL_ContactsUI___cnui_skypeVideoURLFutureWithHandle___block_invoke;
  v9[3] = &unk_1EA603AE8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_cnui_expanseURLFutureWithHandle:()ContactsUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__NSURL_ContactsUI___cnui_expanseURLFutureWithHandle___block_invoke;
  v9[3] = &unk_1EA603AE8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)_cnui_telephonyURLWithHandle:()ContactsUI contact:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 0, 0, 0, 0);
}

+ (uint64_t)_cnui_faceTimeAudioURLWithHandle:()ContactsUI contact:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 1, 0, 0, 0);
}

+ (uint64_t)_cnui_faceTimeVideoURLWithHandle:()ContactsUI contact:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 1, 1, 0, 0);
}

+ (uint64_t)_cnui_ttyURLWithHandle:()ContactsUI contact:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 0, 0, 2, 0);
}

+ (uint64_t)_cnui_ttyRelayURLWithHandle:()ContactsUI contact:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 0, 0, 3, 0);
}

+ (uint64_t)_cnui_telephonyURLWithHandle:()ContactsUI contact:channelIdentifier:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 0, 0, 0, a5);
}

+ (uint64_t)_cnui_ttyURLWithHandle:()ContactsUI contact:channelIdentifier:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 0, 0, 2, a5);
}

+ (uint64_t)_cnui_ttyRelayURLWithHandle:()ContactsUI contact:channelIdentifier:
{
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:", a3, a4, 0, 0, 3, a5);
}

+ (id)_cnui_dialRequestURLWithHandle:()ContactsUI contact:faceTime:video:ttyType:channelIdentifier:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;

  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = objc_alloc_init(getTUCallProviderManagerClass());
  v17 = v16;
  if ((a5 & 1) != 0)
    objc_msgSend(v16, "faceTimeProvider");
  else
    objc_msgSend(v16, "telephonyProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(getTUDialRequestClass_1()), "initWithProvider:", v18);
    +[CNHandle tuHandleForHandle:](CNHandle, "tuHandleForHandle:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHandle:", v20);

    if (objc_msgSend(v14, "hasBeenPersisted"))
    {
      objc_msgSend(v14, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setContactIdentifier:", v21);

    }
    objc_msgSend(v19, "setVideo:", a6);
    objc_msgSend(v19, "setTtyType:", a7);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_12;
    objc_msgSend(v19, "provider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isTelephonyProvider"))
    {
      v23 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();

      if ((v23 & 1) != 0)
      {
LABEL_12:
        objc_msgSend(v19, "URL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);
      objc_msgSend(v19, "setLocalSenderIdentityAccountUUID:", v22);
    }

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create TUDialRequest, manager = %@, provider = %@"), v17, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    +[NSURL(ContactsUI) _cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:].cold.1((uint64_t)v25, v26);

  objc_msgSend(MEMORY[0x1E0D13B78], "simulateCrashWithMessage:", CFSTR("%@"), v25);
  softLinkABLogDisplayInternalAlert((uint64_t)v25);

  v24 = 0;
LABEL_16:

  return v24;
}

+ (id)_cnui_skypeTextURLWithHandle:()ContactsUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("skype:%@?chat"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_cnui_skypeVoiceURLWithHandle:()ContactsUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("skype:%@?call"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_cnui_skypeVideoURLWithHandle:()ContactsUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("skype:%@?call&video=true"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_cnui_messagesURLWithHandle:()ContactsUI contact:
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("sms"));
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPath:", v6);
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_cnui_mailURLWithHandle:()ContactsUI contact:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mailto:%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_cnui_walletPayURLWithHandle:()ContactsUI
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIPassKitWrapper urlForPeerPaymentWithHandle:](CNUIPassKitWrapper, "urlForPeerPaymentWithHandle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_cnui_expanseURLWithHandle:()ContactsUI
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  +[CNHandle tuHandleForHandle:](CNHandle, "tuHandleForHandle:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(getTUConversationMemberClass()), "initWithHandle:", v0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(getTUJoinConversationRequestClass()), "initWithRemoteMembers:", v2);
  objc_msgSend(v3, "setOriginatingUIType:", 16);
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_cnui_dialRequestURLWithHandle:()ContactsUI contact:faceTime:video:ttyType:channelIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DD140000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
