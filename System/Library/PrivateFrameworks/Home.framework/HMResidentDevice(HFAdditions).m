@implementation HMResidentDevice(HFAdditions)

- (id)hf_linkedAccessory
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HMResidentDevice_HFAdditions__hf_linkedAccessory__block_invoke;
  v6[3] = &unk_1EA727840;
  v6[4] = a1;
  objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_displayName
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "hf_linkedAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "name");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (!objc_msgSend(v3, "length"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFResidentDeviceUnknownName"), CFSTR("HFResidentDeviceUnknownName"), 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (uint64_t)hf_isEnabled
{
  uint64_t result;

  result = objc_msgSend(a1, "isEnabled");
  if ((_DWORD)result)
    return objc_msgSend(a1, "capabilities") & 1;
  return result;
}

- (uint64_t)hf_isReachable
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "status") & 1) != 0)
    return 1;
  objc_msgSend(a1, "hf_linkedAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isInstallingSoftwareUpdate");

  if (v3)
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = a1;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Resident is installing a software update; not treating it as unreachable: %@",
        (uint8_t *)&v6,
        0xCu);
    }

    return 1;
  }
  return 0;
}

- (BOOL)hf_isResidentiPad
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "device");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") == 3;

  return v3;
}

- (BOOL)hf_isResidentAppleTV
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "device");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") == 4;

  return v3;
}

@end
