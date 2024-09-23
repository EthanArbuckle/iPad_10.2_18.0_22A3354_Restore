@implementation HMAccessory(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  char v5;
  uint64_t result;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v4 = a1;
  if ((objc_msgSend(a1, "hf_isPureBridge") & 1) != 0
    || objc_msgSend(v4, "_areAllSensorServices")
    && !objc_msgSend(v4, "hf_isNonServiceBasedAccessory"))
  {
    LOBYTE(v4) = 0;
    return v4 & 1;
  }
  else
  {
    switch(a3)
    {
      case 0:
        if ((objc_msgSend(v4, "hf_isOnForContextType:", 0) & 1) != 0
          || (objc_msgSend(v4, "hf_anyNonSensorServiceIsOnForContextType:", 0) & 1) != 0)
        {
          goto LABEL_13;
        }
        v5 = objc_msgSend(v4, "hf_hasSetForContextType:", 0);
        goto LABEL_20;
      case 1:
        if (objc_msgSend(v4, "hf_hasSetForContextType:", 1))
        {
          v7 = v4;
          v8 = 1;
          return objc_msgSend(v7, "hf_isOnForContextType:", v8);
        }
        if ((objc_msgSend(v4, "hf_isNonServiceBasedAccessory") & 1) != 0)
        {
          v5 = objc_msgSend(v4, "hf_shouldHideForContextType:", 1);
          goto LABEL_20;
        }
        objc_msgSend(v4, "hf_visibleServices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __70__HMAccessory_HFIncludedContextProtocol__hf_shouldBeOnForContextType___block_invoke;
        v10[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
        v10[4] = 1;
        LOBYTE(v4) = objc_msgSend(v9, "na_any:", v10);

        return v4 & 1;
      case 2:
        v7 = v4;
        v8 = 2;
        return objc_msgSend(v7, "hf_isOnForContextType:", v8);
      case 3:
        if (!objc_msgSend(v4, "hf_hasSetForContextType:", 3))
        {
          v5 = objc_msgSend(v4, "hf_isProgrammableSwitch");
LABEL_20:
          LOBYTE(v4) = v5 ^ 1;
          return v4 & 1;
        }
        if ((objc_msgSend(v4, "hf_isOnForContextType:", 3) & 1) != 0)
        {
LABEL_13:
          LOBYTE(v4) = 1;
          return v4 & 1;
        }
        result = objc_msgSend(v4, "hf_anyNonSensorServiceIsOnForContextType:", 3);
        break;
      default:
        return v4 & 1;
    }
  }
  return result;
}

- (uint64_t)_areAllSensorServices
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_visibleServices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_26_0);

  return v2;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  void *v5;
  void *v6;
  const __CFString *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("HFApplicationDataAccessoryIsFavoriteKey");
      goto LABEL_11;
    case 1:
      objc_msgSend(a1, "applicationData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HFApplicationDataAccessoryIsVisibleInHomeStatusKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;

      return v11;
    case 2:
      if (objc_msgSend(a1, "hf_isCamera"))
      {
        HFLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[HMAccessory(HFIncludedContextProtocol) hf_hasSetForContextType:]";
          _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "(%s) Trying to check if Favorite was set or not for Camera, which can't be done.", buf, 0xCu);
        }

        return 0;
      }
      else
      {
        objc_msgSend(a1, "applicationData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("HFApplicationDataAccessoryIsFavoriteKey_v2");
LABEL_11:
        objc_msgSend(v5, "objectForKeyedSubscript:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13 != 0;

LABEL_12:
        objc_msgSend(a1, "services");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __66__HMAccessory_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke;
        v17[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
        v17[4] = a3;
        v15 = objc_msgSend(v14, "na_any:", v17);

        return v8 | v15;
      }
    case 3:
      objc_msgSend(a1, "applicationData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("HFApplicationDataAccessoryShowInHomeDashboard");
      goto LABEL_11;
    default:
      v8 = 0;
      goto LABEL_12;
  }
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t result;
  void *v8;
  uint64_t v9;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataAccessoryIsFavoriteKey");
      goto LABEL_8;
    case 1:
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataAccessoryIsVisibleInHomeStatusKey");
      goto LABEL_8;
    case 2:
      if ((objc_msgSend(a1, "hf_isCamera") & 1) != 0)
        goto LABEL_5;
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataAccessoryIsFavoriteKey_v2");
LABEL_8:
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      result = v9;
      break;
    case 3:
      objc_msgSend(a1, "applicationData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HFApplicationDataAccessoryShowInHomeDashboard");
      goto LABEL_8;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  id v4;
  uint64_t (**v5)(_QWORD);
  char v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = val;
  objc_initWeak(&location, val);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __70__HMAccessory_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke;
  v11 = &unk_1EA735F50;
  objc_copyWeak(&v12, &location);
  v5 = (uint64_t (**)(_QWORD))_Block_copy(&v8);
  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_2;
    case 1:
      if ((objc_msgSend(v4, "hf_isAppleTV", v8, v9, v10, v11) & 1) != 0
        || (objc_msgSend(v4, "hf_isCamera") & 1) != 0
        || (objc_msgSend(v4, "hf_isHomePod") & 1) != 0
        || (objc_msgSend(v4, "hf_isRemoteControl") & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        v6 = objc_msgSend(v4, "hf_isMatterOnlyAccessory");
      }
      LOBYTE(v4) = v6 ^ 1;
      break;
    case 2:
      if ((objc_msgSend(v4, "hf_isCamera", v8, v9, v10, v11) & 1) != 0)
        LOBYTE(v4) = 1;
      else
LABEL_2:
        LOBYTE(v4) = v5[2](v5);
      break;
    default:
      break;
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v4 & 1;
}

- (uint64_t)hf_anyNonSensorServiceIsOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  objc_msgSend(a1, "hf_visibleServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__HMAccessory_HFIncludedContextProtocol__hf_anyNonSensorServiceIsOnForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v26 = a1;
    v27 = 2080;
    v28 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    v29 = 1024;
    *(_DWORD *)v30 = a3;
    *(_WORD *)&v30[4] = 2048;
    *(_QWORD *)&v30[6] = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(a1, "hf_updateValueForCurrentObjectOnly:forContextType:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);
  if ((objc_msgSend(a1, "hf_showAsIndividualServices") & 1) == 0)
  {
    v20 = v9;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(a1, "hf_visibleServices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "hf_isOnForContextType:", a4) != (_DWORD)a3
            || objc_msgSend(v15, "hf_shouldBeOnForContextType:", a4) != (_DWORD)a3)
          {
            HFLogForCategory(0);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413314;
              v26 = v15;
              v27 = 2112;
              v28 = (const char *)a1;
              v29 = 2080;
              *(_QWORD *)v30 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
              *(_WORD *)&v30[8] = 1024;
              *(_DWORD *)&v30[10] = a3;
              v31 = 2048;
              v32 = a4;
              _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Also update service:%@ parentAccessory: %@ in %s to %{BOOL}d for context %lu", buf, 0x30u);
            }

            objc_msgSend(v15, "hf_updateValue:forContextType:", a3, a4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v17);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v12);
    }

    v9 = v20;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)hf_updateValueForCurrentObjectOnly:()HFIncludedContextProtocol forContextType:
{
  NSObject *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v18 = a1;
    v19 = 2080;
    v20 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValueForCurrentObjectOnly:forContextType:]";
    v21 = 1024;
    v22 = a3;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  switch(a4)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataAccessoryIsFavoriteKey");
      goto LABEL_17;
    case 1:
      if ((objc_msgSend(a1, "hf_shouldHideForContextType:", 1) & 1) == 0)
      {
        objc_msgSend(a1, "applicationData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("HFApplicationDataAccessoryIsVisibleInHomeStatusKey");
        goto LABEL_17;
      }
      HFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "hf_prettyDescription");
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v18 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValueForCurrentObjectOnly:forContextType:]";
        v19 = 2112;
        v20 = v15;
        _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "(%s) Attempting to update unsupported accessory's include in status value: %@", buf, 0x16u);

      }
      goto LABEL_13;
    case 2:
      if (objc_msgSend(a1, "hf_isCamera"))
      {
        HFLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValueForCurrentObjectOnly:forContextType:]";
          _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "(%s) Attempting to update camera accessory's favorite value.", buf, 0xCu);
        }

LABEL_13:
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(a1, "applicationData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("HFApplicationDataAccessoryIsFavoriteKey_v2");
LABEL_17:
        HFAppDataSetValueIfChanged(v8, v10, v9);

LABEL_18:
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __92__HMAccessory_HFIncludedContextProtocol__hf_updateValueForCurrentObjectOnly_forContextType___block_invoke;
        v16[3] = &unk_1EA7268C8;
        v16[4] = a1;
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v13;
    case 3:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataAccessoryShowInHomeDashboard");
      goto LABEL_17;
    default:
      goto LABEL_18;
  }
}

@end
