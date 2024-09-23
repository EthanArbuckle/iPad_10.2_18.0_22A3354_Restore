@implementation HFResidentDeviceStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  HFImageIconDescriptor *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  NSObject *v61;
  NSObject *v62;
  const char *v63;
  NSObject *v64;
  char v65;
  _QWORD v66[5];
  _BYTE buf[18];
  os_activity_scope_state_s state;
  const __CFString *v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionLogger);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFStatusItem home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hf_remoteAccessState");

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "residentProvisioningStatus");

    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v6, "loggerActivity");
      v14 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v14, &state);

      HFLogForCategory(0x29uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@: residentProvisioningStatus = %d", buf, 0x12u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1DD34E000, v61, OS_LOG_TYPE_DEFAULT, "%@: residentProvisioningStatus = %d", buf, 0x12u);
      }

    }
    v16 = (void *)MEMORY[0x1E0C99E60];
    -[HFStatusItem home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "residentDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "na_filter:", &__block_literal_global_161);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __58__HFResidentDeviceStatusItem__subclass_updateWithOptions___block_invoke_2;
    v66[3] = &unk_1EA72E620;
    v66[4] = self;
    objc_msgSend(v7, "na_filter:", v66);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "na_filter:", &__block_literal_global_6_9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 1) != 0)
    {
      if (v10 != 1)
      {
        if (v6)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v6, "loggerActivity");
          v37 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v37, (os_activity_scope_state_t)buf);

          HFLogForCategory(0x29uLL);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)self;
            _os_log_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_DEFAULT, "%@: showing \"Home Hub Not Set Up\" because some resident on the account needs 2FA, but there is some other enabled resident device in the home", (uint8_t *)&state, 0xCu);
          }

          os_activity_scope_leave((os_activity_scope_state_t)buf);
        }
        else
        {
          HFLogForCategory(0x29uLL);
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_1DD34E000, v64, OS_LOG_TYPE_DEFAULT, "%@: showing \"Home Hub Not Set Up\" because some resident on the account needs 2FA, but there is some other enabled resident device in the home", buf, 0xCu);
          }

        }
        v27 = CFSTR("HFStatusTitleResidentDevice_NeedsTwoFactorAuth");
LABEL_29:
        _HFLocalizedStringWithDefaultValue(v27, v27, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
LABEL_30:
          objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("exclamationmark.circle.fill"), v39);
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v40, CFSTR("icon"));

          objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1EA7CCB38, CFSTR("priority"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1EA7CCB50, CFSTR("statusItemCategory"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("title"));
          _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyResidentDevice"), CFSTR("HFStatusSortKeyResidentDevice"), 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v41, CFSTR("sortKey"));

LABEL_37:
          objc_msgSend(v20, "na_flatMap:", &__block_literal_global_32_7);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFStatusItem home](self, "home");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setByAddingObject:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v56, CFSTR("dependentHomeKitClasses"));

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v55, CFSTR("dependentHomeKitObjects"));
          v57 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v57, CFSTR("currentHomeDependency"));
          v58 = (void *)MEMORY[0x1E0D519C0];
          +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v22);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "futureWithResult:", v59);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_38;
        }
LABEL_36:
        objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
        goto LABEL_37;
      }
      if (v6)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v6, "loggerActivity");
        v26 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v26, (os_activity_scope_state_t)buf);

        HFLogForCategory(0x29uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)self;
          v25 = "%@: showing \"No Remote Access\" because some resident on the account needs 2FA and there are no other resident devices";
          goto LABEL_17;
        }
LABEL_18:

        os_activity_scope_leave((os_activity_scope_state_t)buf);
LABEL_19:
        v27 = CFSTR("HFStatusTitleResidentDevice_RemoteAccessUnavailable");
        goto LABEL_29;
      }
      HFLogForCategory(0x29uLL);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        v63 = "%@: showing \"No Remote Access\" because some resident on the account needs 2FA and there are no other resident devices";
        goto LABEL_47;
      }
    }
    else
    {
      if ((v13 & 2) == 0 || v10 != 1)
      {
        if (!objc_msgSend(v7, "count"))
        {
          -[HFStatusItem home](self, "home");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "accessories");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "count"))
          {
            -[HFStatusItem home](self, "home");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v44, "hf_isCurrentLocationHome");

            if ((v65 & 1) == 0)
              goto LABEL_19;
          }
          else
          {

          }
        }
        if (objc_msgSend(v21, "count"))
        {
          if (objc_msgSend(v21, "count") == 1)
          {
            objc_msgSend(v21, "anyObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFStatusItem displayNameForHomeKitObject:](self, "displayNameForHomeKitObject:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            HFLocalizedStringWithFormat(CFSTR("HFStatusTitleResidentDevice_OneLowBattery"), CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v29);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v45 = objc_msgSend(v21, "count");
            HFLocalizedStringWithFormat(CFSTR("HFStatusTitleResidentDevice_MultipleLowBattery"), CFSTR("%lu"), v46, v47, v48, v49, v50, v51, v45);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("representedHomeKitObjects"));
          _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusShortTitleResidentDevice_LowBattery"), CFSTR("HFStatusShortTitleResidentDevice_LowBattery"), 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v52, CFSTR("shortTitle"));

          if (v36)
            goto LABEL_30;
        }
        goto LABEL_36;
      }
      if (v6)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v6, "loggerActivity");
        v23 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v23, (os_activity_scope_state_t)buf);

        HFLogForCategory(0x29uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)self;
          v25 = "%@: showing \"No Remote Access\" because the status is HMHomeManagerKeyTransferStatusNotAtHome and there"
                " are no enabled resident devices on the account";
LABEL_17:
          _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&state, 0xCu);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      HFLogForCategory(0x29uLL);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        v63 = "%@: showing \"No Remote Access\" because the status is HMHomeManagerKeyTransferStatusNotAtHome and there a"
              "re no enabled resident devices on the account";
LABEL_47:
        _os_log_impl(&dword_1DD34E000, v62, OS_LOG_TYPE_DEFAULT, v63, buf, 0xCu);
      }
    }

    goto LABEL_19;
  }
  v5 = (void *)MEMORY[0x1E0D519C0];
  v69 = CFSTR("hidden");
  v70[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v8;
}

uint64_t __58__HFResidentDeviceStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

uint64_t __58__HFResidentDeviceStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "hf_linkedAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "room");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "room");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hf_linkedAccessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "room");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqual:", v8);

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

unint64_t __58__HFResidentDeviceStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "status") >> 3) & 1;
}

id __58__HFResidentDeviceStatusItem__subclass_updateWithOptions___block_invoke_30(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = a2;
  objc_msgSend(v3, "hf_linkedAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
