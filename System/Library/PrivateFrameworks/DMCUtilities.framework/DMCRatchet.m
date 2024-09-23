@implementation DMCRatchet

+ (BOOL)isEnabled
{
  void *v2;
  char v3;
  NSObject *v5;
  uint8_t v6[16];

  if (getLARatchetManagerClass())
  {
    objc_msgSend(getLARatchetManagerClass(), "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isFeatureEnabled");

    return v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "LARatchetManager is unavailable", v6, 2u);
    }
    return 0;
  }
}

+ (void)isAuthorizedForOperation:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(id, _QWORD);
  uint8_t buf[16];
  _QWORD v28[9];
  _QWORD v29[11];

  v29[9] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  if ((objc_msgSend(a1, "isEnabled") & 1) == 0)
  {
    v16 = *DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "DMCRatchet is authorized because LARatchet is disabled";
      v18 = v16;
      v19 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl(&dword_1A4951000, v18, v19, v17, buf, 2u);
    }
LABEL_11:
    v6[2](v6, 0);
    goto LABEL_15;
  }
  if (!getLARatchetClass())
  {
    v20 = *DMCLogObjects();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "DMCRatchet is authorized because LARatchet is unavailable";
      v18 = v20;
      v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v24 = (void *)objc_msgSend(objc_alloc((Class)getLARatchetClass()), "initWithIdentifier:", CFSTR("com.apple.devicemanagementclient.DMCRatchet"));
  v22 = (void *)MEMORY[0x1E0C99E08];
  v28[0] = &unk_1E4D416A8;
  objc_msgSend(a1, "_ratchetTitleForOperation:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = &unk_1E4D416C0;
  objc_msgSend(a1, "_ratchetTextForOperation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v7;
  v28[2] = &unk_1E4D416D8;
  objc_msgSend(a1, "_ratchetStrictTextForOperation:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  v28[3] = &unk_1E4D416F0;
  objc_msgSend(a1, "_ratchetCountdownForOperation:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v9;
  v28[4] = &unk_1E4D41708;
  objc_msgSend(a1, "_ratchetReasonForOperation:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v10;
  v28[5] = &unk_1E4D41720;
  objc_msgSend(a1, "_ratchetCalloutForOperation:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v11;
  v28[6] = &unk_1E4D41738;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=ManagedConfigurationList"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v12;
  v29[7] = MEMORY[0x1E0C9AAB0];
  v28[7] = &unk_1E4D41750;
  v28[8] = &unk_1E4D41768;
  v29[8] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    if (getLARatchetMaxEnablementGracePeriod())
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", getLARatchetMaxEnablementGracePeriod());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, &unk_1E4D41780);

    }
    else
    {
      v21 = *DMCLogObjects();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4951000, v21, OS_LOG_TYPE_ERROR, "DMCRatchet failed to softlink LARatchetMaxEnablementGracePeriod", buf, 2u);
      }
    }
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __50__DMCRatchet_isAuthorizedForOperation_completion___block_invoke;
  v25[3] = &unk_1E4D37EC8;
  v26 = v6;
  objc_msgSend(v24, "armWithOptions:completion:", v14, v25);

LABEL_15:
}

uint64_t __50__DMCRatchet_isAuthorizedForOperation_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, unint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[DMCRatchet _responseFromRatchetResult:error:](DMCRatchet, "_responseFromRatchetResult:error:", a2, a3));
}

+ (unint64_t)_responseFromRatchetResult:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E4D41720);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v6)
    {
      v13 = *DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = (uint64_t)v5;
        _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_DEFAULT, "DMCRatchet is unauthorized with result: %{public}@", buf, 0xCu);
      }
      goto LABEL_31;
    }
    if (objc_msgSend(v6, "code") == 4)
    {
      v12 = *DMCLogObjects();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_WORD *)buf = 0;
      v9 = "DMCRatchet is authorized because passcode is not set";
LABEL_13:
      v10 = v12;
      v11 = 2;
      goto LABEL_14;
    }
    if (objc_msgSend(v6, "code") == 5)
    {
      v12 = *DMCLogObjects();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_WORD *)buf = 0;
      v9 = "DMCRatchet is authorized because biometry is not enrolled";
      goto LABEL_13;
    }
    if (objc_msgSend(v6, "code") == 1)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v6, "underlyingErrors", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v16);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "code") == -2)
            {
              v27 = *DMCLogObjects();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4951000, v27, OS_LOG_TYPE_DEFAULT, "DMCRatchet canceled by user", buf, 2u);
              }

              v14 = 2;
              goto LABEL_16;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v18)
            continue;
          break;
        }
      }

      v21 = *DMCLogObjects();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      v22 = v21;
      objc_msgSend(v6, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = (uint64_t)v23;
      _os_log_impl(&dword_1A4951000, v22, OS_LOG_TYPE_DEFAULT, "DMCRatchet is unauthorized with generic error user info: %{public}@", buf, 0xCu);

    }
    else
    {
      v24 = *DMCLogObjects();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:
        v14 = 1;
        goto LABEL_16;
      }
      v22 = v24;
      v25 = objc_msgSend(v6, "code");
      objc_msgSend(v6, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v33 = v25;
      v34 = 2114;
      v35 = v26;
      _os_log_impl(&dword_1A4951000, v22, OS_LOG_TYPE_DEFAULT, "DMCRatchet is unauthorized with error code %{public}ld and user info: %{public}@", buf, 0x16u);

    }
    goto LABEL_31;
  }
  v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = (uint64_t)v5;
    v9 = "DMCRatchet is authorized with result: %{public}@";
    v10 = v8;
    v11 = 12;
LABEL_14:
    _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
  }
LABEL_15:
  v14 = 0;
LABEL_16:

  return v14;
}

+ (id)_ratchetTitleForOperation:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_TITLE_INSTALL_PROFILE");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_TITLE_MDM_ENROLL");
LABEL_5:
    DMCLocalizedString(v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_ratchetTextForOperation:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_TEXT_INSTALL_PROFILE");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_TEXT_MDM_ENROLL");
LABEL_5:
    DMCLocalizedString(v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_ratchetStrictTextForOperation:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_STRICT_TEXT_INSTALL_PROFILE");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_STRICT_TEXT_MDM_ENROLL");
LABEL_5:
    DMCLocalizedString(v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_ratchetCountdownForOperation:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_COUNTDOWN_INSTALL_PROFILE");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_COUNTDOWN_MDM_ENROLL");
LABEL_5:
    DMCLocalizedString(v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_ratchetReasonForOperation:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_REASON_INSTALL_PROFILE");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_REASON_MDM_ENROLL");
LABEL_5:
    DMCLocalizedString(v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_ratchetCalloutForOperation:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_CALLOUT_INSTALL_PROFILE");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = CFSTR("DMC_SDP_RATCHET_CALLOUT_MDM_ENROLL");
LABEL_5:
    DMCLocalizedString(v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
