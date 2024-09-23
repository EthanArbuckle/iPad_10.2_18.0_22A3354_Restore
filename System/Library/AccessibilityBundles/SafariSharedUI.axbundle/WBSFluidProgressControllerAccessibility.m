@implementation WBSFluidProgressControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WBSFluidProgressController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSFluidProgressController"), CFSTR("finishFluidProgressWithProgressStateSource:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSFluidProgressController"), CFSTR("_updateFluidProgressWithProgressStateSource:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSFluidProgressController"), CFSTR("_sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:"), "v", "@", "@", "@", "B", 0);

}

- (void)_sendUpdateFluidProgressToObservers:(id)a3 progressState:(id)a4 source:(id)a5 updateAnimationPhase:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  AXLogAppAccessibility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[WBSFluidProgressControllerAccessibility _sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  v21.receiver = self;
  v21.super_class = (Class)WBSFluidProgressControllerAccessibility;
  -[WBSFluidProgressControllerAccessibility _sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:](&v21, sel__sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase_, v12, v11, v10, v6);

  -[WBSFluidProgressControllerAccessibility _axHandleProgressUpdate:](self, "_axHandleProgressUpdate:", v11);
}

- (void)finishFluidProgressWithProgressStateSource:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WBSFluidProgressControllerAccessibility;
  v4 = a3;
  -[WBSFluidProgressControllerAccessibility finishFluidProgressWithProgressStateSource:](&v14, sel_finishFluidProgressWithProgressStateSource_, v4);
  AXLogAppAccessibility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WBSFluidProgressControllerAccessibility finishFluidProgressWithProgressStateSource:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(v4, "progressState", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSFluidProgressControllerAccessibility _axHandleProgressUpdate:](self, "_axHandleProgressUpdate:", v13);
}

- (void)_updateFluidProgressWithProgressStateSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  AXLogAppAccessibility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WBSFluidProgressControllerAccessibility _updateFluidProgressWithProgressStateSource:].cold.1(v4, v5);

  v7.receiver = self;
  v7.super_class = (Class)WBSFluidProgressControllerAccessibility;
  -[WBSFluidProgressControllerAccessibility _updateFluidProgressWithProgressStateSource:](&v7, sel__updateFluidProgressWithProgressStateSource_, v4);
  objc_msgSend(v4, "progressState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFluidProgressControllerAccessibility _axHandleProgressUpdate:](self, "_axHandleProgressUpdate:", v6);

}

- (void)_axHandleProgressUpdate:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "updateFluidProgressValue");
    AXLogAppAccessibility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "fluidProgressValue");
      objc_msgSend(v6, "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "hasCompletedLoad"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v4;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_232963000, v5, OS_LOG_TYPE_INFO, "Update fluid progress: %@ %@ %@ ", buf, 0x20u);

    }
    if ((objc_msgSend(v4, "hasCompletedLoad") & 1) != 0)
    {
      v9 = &unk_250332020;
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "fluidProgressValue");
      objc_msgSend(v10, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "loadURL", CFSTR("progress"), CFSTR("url"), v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_250331D68;
    if (v11)
      v13 = (const __CFString *)v11;
    v16[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0x430u, v14);

    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1F8], v9);
  }

}

- (void)_sendUpdateFluidProgressToObservers:(uint64_t)a3 progressState:(uint64_t)a4 source:(uint64_t)a5 updateAnimationPhase:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_232963000, a1, a3, "_sendUpdateFluidProgressToObservers", a5, a6, a7, a8, 0);
}

- (void)finishFluidProgressWithProgressStateSource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_232963000, a1, a3, "finishFluidProgressWithProgressStateSource", a5, a6, a7, a8, 0);
}

- (void)_updateFluidProgressWithProgressStateSource:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "estimatedProgress");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_232963000, a2, OS_LOG_TYPE_DEBUG, "_updateFluidProgressWithProgressStateSource %@", (uint8_t *)&v5, 0xCu);

}

@end
