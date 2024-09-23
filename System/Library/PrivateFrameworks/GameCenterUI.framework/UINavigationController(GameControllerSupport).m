@implementation UINavigationController(GameControllerSupport)

- (void)pressesEnded:()GameControllerSupport withEvent:
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "logOnceGameControllerUsedInGameLayer");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__UINavigationController_GameControllerSupport__pressesEnded_withEvent___block_invoke;
  v9[3] = &unk_1E59C9268;
  v9[4] = a1;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  if (!*((_BYTE *)v11 + 24))
  {
    v8.receiver = a1;
    v8.super_class = (Class)UINavigationController_0;
    objc_msgSendSuper2(&v8, sel_pressesEnded_withEvent_, v6, v7);
  }
  _Block_object_dispose(&v10, 8);

}

- (void)logOnceGameControllerUsedInGameLayer
{
  if (logOnceGameControllerUsedInGameLayer_onceToken_245 != -1)
    dispatch_once(&logOnceGameControllerUsedInGameLayer_onceToken_245, &__block_literal_global_246);
}

- (void)returnToPreviousScreen
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(a1, "popViewControllerAnimated:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25480];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "GameController: Popped to previous screen", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(a1, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
      if (!*MEMORY[0x1E0D25460])
        v7 = (id)GKOSLoggers();
      v8 = *MEMORY[0x1E0D25480];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1AB361000, v8, OS_LOG_TYPE_INFO, "GameController: Dismissed the modal to previous screen", v12, 2u);
      }
    }
    else
    {
      objc_msgSend(a1, "_gkExtensionViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(a1, "_gkExtensionViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dismissWithGameController");

      }
    }

  }
}

@end
