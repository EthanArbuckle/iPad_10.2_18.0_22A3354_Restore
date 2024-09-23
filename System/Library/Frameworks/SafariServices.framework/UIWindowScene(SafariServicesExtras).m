@implementation UIWindowScene(SafariServicesExtras)

- (void)_sf_openTelURL:()SafariServicesExtras completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFaceTimeMultiwayURL"))
  {
    objc_msgSend(a1, "_sf_openFaceTimeMultiWayURL:completionHandler:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithURL:", v6);
    if ((objc_msgSend(v8, "isValid") & 1) != 0)
    {
      if ((objc_msgSend(v8, "showUIPrompt") & 1) != 0)
      {
        +[SFTelephonyURLHandler sharedInstance](SFTelephonyURLHandler, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "openURLForDialRequest:withScene:completionHandler:", v8, a1, v7) & 1) == 0)
        {
          v10 = objc_alloc((Class)getTPDialPromptAlertClass());
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __72__UIWindowScene_SafariServicesExtras___sf_openTelURL_completionHandler___block_invoke;
          v12[3] = &unk_1E4AC0DE8;
          v15 = v7;
          v13 = v8;
          v14 = a1;
          v11 = (void *)objc_msgSend(v10, "initWithDialRequest:dialAction:", v13, v12);
          objc_msgSend(v11, "show");

        }
      }
      else
      {
        objc_msgSend(a1, "openURL:options:completionHandler:", v6, 0, v7);
      }
    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
}

- (void)_sf_openFaceTimeMultiWayURL:()SafariServicesExtras completionHandler:
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0DBD308];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithURL:", v8);

  if (v9)
  {
    v10 = objc_alloc((Class)getTPDialPromptAlertClass());
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__UIWindowScene_SafariServicesExtras___sf_openFaceTimeMultiWayURL_completionHandler___block_invoke;
    v12[3] = &unk_1E4AC0DE8;
    v15 = v6;
    v13 = v9;
    v14 = a1;
    v11 = (void *)objc_msgSend(v10, "initWithJoinRequest:dialAction:", v13, v12);
    objc_msgSend(v11, "show");

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)_sf_destroyScene
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0DC3700]);
  v5 = (id)objc_msgSend(v2, "initWithPreferredAnimationType:callbackQueue:completion:", 1, MEMORY[0x1E0C80D38], &__block_literal_global_5);
  objc_msgSend(a1, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendActions:", v4);

}

@end
