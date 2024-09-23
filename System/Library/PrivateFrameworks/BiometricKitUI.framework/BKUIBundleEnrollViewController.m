@implementation BKUIBundleEnrollViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  OS_os_log *v5;
  OS_os_log *bkui_bundle_enroll_view_controller_log;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIBundleEnrollViewController;
  -[BKUIBundleEnrollViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  self->_shortScanCount = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_maxShortScanCount = objc_msgSend(v4, "integerForKey:", CFSTR("maxShortScanCount"));

  if (!self->_maxShortScanCount)
    self->_maxShortScanCount = 5;
  v5 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "BundleEnrollViewController");
  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  self->bkui_bundle_enroll_view_controller_log = v5;

  +[BKUIBundleSettings synchronize](BKUIBundleSettings, "synchronize");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKUIBundleEnrollViewController;
  -[BKUIBundleEnrollViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[BKUIBundleEnrollViewController bundleAlertView](self, "bundleAlertView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAnimated:", v3);

}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3;
  NSObject *bkui_bundle_enroll_view_controller_log;

  v3 = *(_QWORD *)&a3;
  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_bundle_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIBundleEnrollViewController statusMessage:].cold.1(bkui_bundle_enroll_view_controller_log, v3);
  if ((_DWORD)v3 == 78)
    ++self->_shortScanCount;
}

- (void)afterStatusMessage:(unsigned int)a3
{
  uint64_t v3;
  NSObject *bkui_bundle_enroll_view_controller_log;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = *(_QWORD *)&a3;
  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_bundle_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIBundleEnrollViewController afterStatusMessage:].cold.1(bkui_bundle_enroll_view_controller_log, v3);
  if ((_DWORD)v3 == 64 && self->_shortScanCount == self->_maxShortScanCount)
  {
    self->_shortScanCount = 0;
    -[BKUIBundleEnrollViewController bundleAlertView](self, "bundleAlertView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAlertHidden");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("KEEP_FINGER_TITLE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (MGGetSInt32Answer() == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("KEEP_FINGER_TITLE_FOLLOW_UP"), &stru_1EA281248, CFSTR("Mesa-j307"));
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      -[BKUIBundleEnrollViewController bundleAlertView](self, "bundleAlertView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "show:message:cancelButtonTitle:viewController:", v9, &stru_1EA281248, v14, self);

    }
  }
}

- (id)bundleAlertView
{
  NSObject *bkui_bundle_enroll_view_controller_log;

  bkui_bundle_enroll_view_controller_log = self->bkui_bundle_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_bundle_enroll_view_controller_log, OS_LOG_TYPE_ERROR))
    -[BKUIBundleEnrollViewController bundleAlertView].cold.1(bkui_bundle_enroll_view_controller_log);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bkui_bundle_enroll_view_controller_log, 0);
}

- (void)statusMessage:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  +[BKUIUtils nameForMessage:](BKUIUtils, "nameForMessage:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1DB281000, v5, v6, "statusMessage: status = %3d (%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_2();
}

- (void)afterStatusMessage:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  +[BKUIUtils nameForMessage:](BKUIUtils, "nameForMessage:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1DB281000, v5, v6, "afterStatusMessage: status = %3d (%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_2();
}

- (void)bundleAlertView
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1DB281000, v1, OS_LOG_TYPE_ERROR, "BiometricKitUI: %@ does not override BKUIBundleEnrollViewController.bundleAlertView!", (uint8_t *)&v3, 0xCu);

}

@end
