@implementation CSEraseDeviceUnblockViewModel

- (id)iconName
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v4 = CFSTR("lock.ipad");
  else
    v4 = CFSTR("lock.iphone");
  return v4;
}

- (id)titleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_ERASE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewModel _localizedProductName](self, "_localizedProductName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bodyTextForTimeout:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CEA508];
    v5 = a3;
    objc_msgSend(v4, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v8 = CFSTR("DASHBOARD_BLOCK_ERASE_MESSAGE_PAD");
    else
      v8 = CFSTR("DASHBOARD_BLOCK_ERASE_MESSAGE_PHONE");
    -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_1E8E30B28;
  }
  return v10;
}

- (id)bodySubtitleText
{
  return -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_ERASE_LINK"));
}

- (id)cancelButtonText
{
  return &stru_1E8E30B28;
}

- (id)primaryButtonText
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
    -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_CONFIRM_ERASE_ACTION"));
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

- (id)secondaryButtonText
{
  return -[CSDeviceUnblockViewModel _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("DASHBOARD_BLOCK_CANCEL_BUTTON"));
}

- (void)primaryButtonAction
{
  id v2;

  -[CSDeviceUnblockViewModel blockViewController](self, "blockViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUnblockViewModelHandleDidRequestErase");

}

- (void)secondaryButtonAction
{
  id v2;

  -[CSDeviceUnblockViewModel blockViewController](self, "blockViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUnblockViewModelHandleDidRequestCancel");

}

- (void)cancelButtonAction
{
  id v2;

  -[CSDeviceUnblockViewModel blockViewController](self, "blockViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUnblockViewModelHandleDidRequestCancel");

}

@end
