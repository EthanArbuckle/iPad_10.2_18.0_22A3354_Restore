@implementation MTLanguageChangeListener

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  -[MTLanguageChangeListener liveDarwinNotifications](self, "liveDarwinNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__MTLanguageChangeListener_handlesNotification_ofType___block_invoke;
  v10[3] = &unk_1E39CB6D0;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

uint64_t __55__MTLanguageChangeListener_handlesNotification_ofType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
}

+ (id)_languageChangeNotification
{
  return CFSTR("com.apple.language.changed");
}

- (void)_handleLanguageChanged
{
  NSObject *v2;
  uint8_t v3[16];

  MTLogForCategory(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "mobiletimerd - System language changed, terminating daemon", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a5;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_languageChangeNotification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    -[MTLanguageChangeListener _handleLanguageChanged](self, "_handleLanguageChanged");
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }

}

- (id)liveDarwinNotifications
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_languageChangeNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
