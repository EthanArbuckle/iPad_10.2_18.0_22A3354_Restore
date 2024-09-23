@implementation HMService(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  char v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v10;

  switch(a3)
  {
    case 0:
      if ((objc_msgSend(a1, "hf_isSensorService") & 1) != 0)
        goto LABEL_8;
      if ((objc_msgSend(a1, "hf_isOnForContextType:", 0) & 1) != 0)
      {
        v3 = 1;
        return v3 & 1;
      }
      v7 = a1;
      v8 = 0;
      goto LABEL_15;
    case 1:
      v3 = 1;
      if ((objc_msgSend(a1, "hf_isOnForContextType:", 1) & 1) != 0)
        return v3 & 1;
      v7 = a1;
      v8 = 1;
LABEL_15:
      v10 = objc_msgSend(v7, "hf_hasSetForContextType:", v8);
      goto LABEL_17;
    case 2:
      if ((objc_msgSend(a1, "hf_isSensorService") & 1) != 0)
        goto LABEL_8;
      v5 = a1;
      v6 = 2;
      return objc_msgSend(v5, "hf_isOnForContextType:", v6);
    case 3:
      if ((objc_msgSend(a1, "hf_isSensorService") & 1) != 0)
      {
LABEL_8:
        v3 = 0;
        return v3 & 1;
      }
      if (!objc_msgSend(a1, "hf_hasSetForContextType:", 3))
      {
        v10 = objc_msgSend(a1, "hf_isProgrammableSwitch");
LABEL_17:
        v3 = v10 ^ 1;
        return v3 & 1;
      }
      v5 = a1;
      v6 = 3;
      return objc_msgSend(v5, "hf_isOnForContextType:", v6);
    default:
      return v3 & 1;
  }
}

- (BOOL)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  BOOL v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataServiceIsFavorite");
      goto LABEL_6;
    case 1:
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataServiceIsVisibleInHomeStatusKey");
      goto LABEL_6;
    case 2:
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataServiceIsFavorite_v2");
      goto LABEL_6;
    case 3:
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataServiceShowInHomeDashboard");
LABEL_6:
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v7 != 0;

      break;
    default:
      return v3;
  }
  return v3;
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t result;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = v3;
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("HFApplicationDataServiceIsFavorite");
      goto LABEL_7;
    case 1:
      objc_msgSend(a1, "applicationData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("HFApplicationDataServiceIsVisibleInHomeStatusKey");
      goto LABEL_7;
    case 2:
      objc_msgSend(a1, "applicationData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("HFApplicationDataServiceIsFavorite_v2");
      goto LABEL_7;
    case 3:
      objc_msgSend(a1, "applicationData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("HFApplicationDataServiceShowInHomeDashboard");
LABEL_7:
      objc_msgSend(v9, "objectForKeyedSubscript:", v11, v6, v5, v4, v15, v7, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      result = v14;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  char v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v11;
  int v12;

  if ((unint64_t)(a3 - 2) < 2)
    goto LABEL_8;
  if (a3 == 1)
  {
    objc_msgSend(a1, "serviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[HFStatusItemProvider hasStatusItemForServiceType:](HFStatusItemProvider, "hasStatusItemForServiceType:", v8);
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_8:
    if (_os_feature_enabled_impl()
      && (objc_msgSend(a1, "accessory"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "home"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "hf_currentUserIsRestrictedGuest"),
          v6,
          v5,
          (v7 & 1) != 0)
      || (objc_msgSend(a1, "hf_isInGroup") & 1) != 0
      || (objc_msgSend(a1, "hf_isSensorService") & 1) != 0
      || (objc_msgSend(a1, "hf_isNetworkRouter") & 1) != 0)
    {
      v3 = 1;
      return v3 & 1;
    }
    objc_msgSend(a1, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hf_isMultiServiceAccessory");

    if (!v12)
    {
      v3 = 0;
      return v3 & 1;
    }
    objc_msgSend(a1, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_showAsIndividualServices");
LABEL_11:
    v3 = v9 ^ 1;

  }
  return v3 & 1;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  NSObject *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v14 = a1;
    v15 = 2080;
    v16 = "-[HMService(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    v17 = 1024;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  switch(a4)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataServiceIsFavorite");
      goto LABEL_8;
    case 1:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataServiceIsVisibleInHomeStatusKey");
      goto LABEL_8;
    case 2:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataServiceIsFavorite_v2");
      goto LABEL_8;
    case 3:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataServiceShowInHomeDashboard");
LABEL_8:
      HFAppDataSetValueIfChanged(v8, v10, v9);

      break;
    default:
      break;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HMService_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke;
  v12[3] = &unk_1EA7268C8;
  v12[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
