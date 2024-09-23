@implementation CSForgotDevicePasscodeUnblockViewModel

- (id)iconName
{
  return CFSTR("dots.below.lock.fill");
}

- (id)titleText
{
  return -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_TITLE"));
}

- (id)bodyTextForTimeout:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;

  v4 = a3;
  -[CSDeviceUnblockViewModel unblockPolicy](self, "unblockPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canUnblockDevice");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("No unlock methods found"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodeCreationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDateInToday:", v8);

  if (v10)
  {
    v11 = CFSTR("DASHBOARD_BLOCK_FORGOT_PASSCODE_CHANGED_TODAY");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDateInYesterday:", v8);

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "components:fromDate:toDate:options:", 16, v8, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "day");
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_FORGOT_PASSCODE_CHANGED_DAYS_AGO"), &stru_1E8E30B28, CFSTR("CoverSheetPlurals"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v21, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v11 = CFSTR("DASHBOARD_BLOCK_FORGOT_PASSCODE_CHANGED_YESTERDAY");
  }
  -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v14;
}

- (id)bodySubtitleText
{
  return -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_ERASE_LINK"));
}

- (id)cancelButtonText
{
  return -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_CANCEL"));
}

- (id)primaryButtonText
{
  void *v3;
  int v4;
  void *v5;

  -[CSDeviceUnblockViewModel unblockPolicy](self, "unblockPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUnblockDeviceUsingRecovery");

  if (v4)
  {
    -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_RECOVERY_ACTION"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)secondaryButtonText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CSDeviceUnblockViewModel unblockPolicy](self, "unblockPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUnblockDeviceUsingErase");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_ERASE_ACTION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceUnblockViewModel _localizedProductName](self, "_localizedProductName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)primaryButtonAction
{
  id v2;

  -[CSDeviceUnblockViewModel blockViewController](self, "blockViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUnblockViewModelHandleDidRequestRecovery");

}

- (void)secondaryButtonAction
{
  id v2;

  -[CSDeviceUnblockViewModel blockViewController](self, "blockViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUnblockViewModelHandleDidRequestErase");

}

- (void)cancelButtonAction
{
  id v2;

  -[CSDeviceUnblockViewModel blockViewController](self, "blockViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUnblockViewModelHandleDidRequestCancel");

}

@end
