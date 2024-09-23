@implementation FMFNoNetworkAlert

+ (id)newAlertController
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  _QWORD v19[4];
  id v20;

  v2 = objc_msgSend((id)objc_opt_class(), "reasonForNoInternet");
  objc_msgSend((id)objc_opt_class(), "alertInfoForInternetUnavailableReason:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "actionURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ALERT_NO_NETWORK_ACTION_BUTTON_SETTINGS"), &stru_24C878158, CFSTR("LocalizableUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __39__FMFNoNetworkAlert_newAlertController__block_invoke;
      v19[3] = &unk_24C877C78;
      v20 = v4;
      objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addAction:", v13);
    }
    v14 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_24C878158, CFSTR("LocalizableUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, &__block_literal_global);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v17);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __39__FMFNoNetworkAlert_newAlertController__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "actionURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

+ (unint64_t)reasonForNoInternet
{
  if ((objc_msgSend(a1, "isAirplaneModeEnabled") & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isGlobalCellularEnabled") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE754B8], "deviceSupportsCellularData") & 1) == 0)
  {
    return 3;
  }
  return 2;
}

+ (id)alertInfoForInternetUnavailableReason:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_opt_new();
  switch(a3)
  {
    case 0uLL:
      LogCategory_Daemon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[FMFNoNetworkAlert alertInfoForInternetUnavailableReason:].cold.1(v5);

      v6 = 0;
      goto LABEL_11;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ALERT_NO_NETWORK_TITLE_AIRPLANE_MODE"), &stru_24C878158, CFSTR("LocalizableUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fm_wifiToWLAN");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v9);

      v10 = (void *)MEMORY[0x24BDBCF48];
      v11 = CFSTR("prefs:root=ROOT#AIRPLANE_MODE");
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ALERT_NO_NETWORK_TITLE_CELLULAR_DISABLED"), &stru_24C878158, CFSTR("LocalizableUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fm_wifiToWLAN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v14);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ALERT_NO_NETWORK_MESSAGE_CELLULAR_DISABLED"), &stru_24C878158, CFSTR("LocalizableUI"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fm_wifiToWLAN");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMessage:", v17);

      v10 = (void *)MEMORY[0x24BDBCF48];
      v11 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID");
LABEL_7:
      objc_msgSend(v10, "URLWithString:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setActionURL:", v18);
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ALERT_NO_NETWORK_TITLE_NO_INTERNET"), &stru_24C878158, CFSTR("LocalizableUI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fm_wifiToWLAN");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v20);

LABEL_9:
      break;
    default:
      break;
  }
  v6 = v4;
LABEL_11:

  return v6;
}

+ (BOOL)isGlobalCellularEnabled
{
  uint64_t v2;
  int v3;

  v2 = _CTServerConnectionCreateOnTargetQueue();
  if (v2)
  {
    _CTServerConnectionCopyCellularUsagePolicy();
    CFRelease((CFTypeRef)v2);
    LOBYTE(v2) = 0;
  }
  v3 = objc_msgSend(MEMORY[0x24BE754B8], "isEnabled");
  if (v3)
    LOBYTE(v3) = objc_msgSend(MEMORY[0x24BE754B8], "deviceSupportsCellularData");
  return v2 & v3;
}

+ (BOOL)isAirplaneModeEnabled
{
  id v2;
  char v3;

  v2 = objc_alloc_init(MEMORY[0x24BE04788]);
  objc_msgSend(v2, "refresh");
  v3 = objc_msgSend(v2, "airplaneMode");

  return v3;
}

- (BOOL)isGlobalCellularEnabled
{
  return self->_globalCellularEnabled;
}

- (void)setGlobalCellularEnabled:(BOOL)a3
{
  self->_globalCellularEnabled = a3;
}

+ (void)alertInfoForInternetUnavailableReason:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DD58000, log, OS_LOG_TYPE_ERROR, "No reason to show internet unavailable alert.", v1, 2u);
}

@end
