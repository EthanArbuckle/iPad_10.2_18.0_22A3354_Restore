@implementation UINavigationController

void __72__UINavigationController_GameControllerSupport__pressesEnded_withEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (objc_msgSend(a2, "type") == 5)
  {
    if (!*MEMORY[0x1E0D25460])
      v5 = (id)GKOSLoggers();
    v6 = *MEMORY[0x1E0D25480];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "GameController: UIPressTypeMenu is pressed -> return to previous screen", v8, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_gkExtensionViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "logOnceGameControllerUsedInGameLayer");
    objc_msgSend(*(id *)(a1 + 32), "returnToPreviousScreen");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;

  }
}

void __85__UINavigationController_GameControllerSupport__logOnceGameControllerUsedInGameLayer__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0D25058];
  v1 = *MEMORY[0x1E0D250C0];
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:bundleID:", v0, v1, v3);

}

@end
