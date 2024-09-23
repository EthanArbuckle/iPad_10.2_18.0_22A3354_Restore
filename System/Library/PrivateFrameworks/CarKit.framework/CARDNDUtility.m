@implementation CARDNDUtility

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CARDNDUtility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___utility;
}

void __31__CARDNDUtility_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___utility;
  sharedInstance___utility = (uint64_t)v1;

}

- (CARDNDUtility)init
{
  CARDNDUtility *v2;
  CARAutomaticDNDStatus *v3;
  CARAutomaticDNDStatus *DNDStatus;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CARDNDUtility;
  v2 = -[CARDNDUtility init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CARAutomaticDNDStatus);
    DNDStatus = v2->_DNDStatus;
    v2->_DNDStatus = v3;

    -[CARAutomaticDNDStatus _detachObservers](v2->_DNDStatus, "_detachObservers");
  }
  return v2;
}

- (id)outputFromRhodesUtility
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  _BOOL4 v23;
  const __CFString *v24;
  void *v25;
  unint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  dispatch_semaphore_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  _QWORD v68[4];
  id v69;
  NSObject *v70;
  _QWORD v71[4];
  id v72;
  NSObject *v73;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0CA5700], "isAvailable");
  objc_msgSend(v3, "appendString:", CFSTR("Device State:\n"));
  if (v4)
    v5 = CFSTR("Available");
  else
    v5 = CFSTR("Not Available");
  if (v4)
    v6 = CFSTR("✅ ");
  else
    v6 = CFSTR("❌ ");
  objc_msgSend(CFSTR("Vehicle Queries "), "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  v9 = objc_msgSend(MEMORY[0x1E0CA5700], "vehicularState");
  v10 = objc_msgSend(MEMORY[0x1E0CA5700], "vehicularHints");
  v11 = objc_msgSend(MEMORY[0x1E0CA5700], "vehicularOperatorState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v15 = CFSTR("None");
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v13, "addObject:", CFSTR("Motion"));
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 4) == 0)
        goto LABEL_11;
      goto LABEL_19;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v14, "addObject:", CFSTR("GPS"));
  if ((v10 & 4) == 0)
  {
LABEL_11:
    if ((v10 & 8) == 0)
      goto LABEL_12;
LABEL_20:
    objc_msgSend(v14, "addObject:", CFSTR("Wi-Fi"));
    if ((v10 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  objc_msgSend(v14, "addObject:", CFSTR("Baseband"));
  if ((v10 & 8) != 0)
    goto LABEL_20;
LABEL_12:
  if ((v10 & 0x10) != 0)
LABEL_13:
    objc_msgSend(v14, "addObject:", CFSTR("Bluetooth"));
LABEL_14:
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(";"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("None");
  }

LABEL_24:
  objc_msgSend(v3, "appendFormat:", CFSTR("  Core Motion Vehicular Hints: %@ (%@)\n"), v12, v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v9 > 2)
    v18 = CFSTR("INVALID");
  else
    v18 = off_1E54280C0[v9];
  objc_msgSend(v3, "appendFormat:", CFSTR("  Core Motion Vehicular State: %@ (%@)\n"), v16, v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v11 > 2)
    v21 = CFSTR("INVALID");
  else
    v21 = off_1E54280D8[v11];
  objc_msgSend(v3, "appendFormat:", CFSTR("  Core Motion Operator State: %@ (%@)\n"), v19, v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CRAutomaticDNDLocationServicesStatus());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CRAutomaticDNDLocationServicesEnabled();
  v24 = CFSTR("Disabled");
  if (v23)
    v24 = CFSTR("Enabled");
  objc_msgSend(v3, "appendFormat:", CFSTR("  Location Services Status: %@ (%@)\n"), v22, v24);

  objc_msgSend(v3, "appendString:", CFSTR("User Preferences:\n"));
  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "automaticDNDTriggeringMethod");
  if (v26 > 2)
    v27 = CFSTR("INVALID");
  else
    v27 = off_1E54280F0[v26];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@  %@\n"), v27, CFSTR("CARDNDAutomaticTriggeringMethod"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v28);

  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "hasAdjustedTriggerMethod"))
    v30 = CFSTR("✅ ");
  else
    v30 = CFSTR("❌ ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v30, CFSTR("CARDNDUserHasAdjustedTriggerMethod"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v31);

  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "shouldActivateWithCarPlay"))
    v33 = CFSTR("✅ ");
  else
    v33 = CFSTR("❌ ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v33, CFSTR("CARDNDActivateWithCarPlay"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v34);

  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "disableTimerTimestamp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = CFSTR("CARDNDDisableTimerTimestamp");
  v38 = v36;
  if (CARDatePreferenceDescription_onceToken != -1)
    dispatch_once(&CARDatePreferenceDescription_onceToken, &__block_literal_global_2);
  v39 = (void *)MEMORY[0x1E0CB3940];
  if (v38)
  {
    objc_msgSend((id)CARDatePreferenceDescription__formatter, "stringFromDate:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("     %@: %@\n"), v37, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     %@: %@\n"), v37, CFSTR("None"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "appendString:", v41);
  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "hasMigratedToDriving"))
    v43 = CFSTR("✅ ");
  else
    v43 = CFSTR("❌ ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v43, CFSTR("CARHasMigratedToDriving"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v44);

  objc_msgSend(v3, "appendString:", CFSTR("Internal Preferences:\n"));
  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "isAutomaticDNDInternalForceOverrideEnabledPreference"))
    v46 = CFSTR("✅ ");
  else
    v46 = CFSTR("❌ ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v46, CFSTR("CARDNDMiniInternalForceOverride"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v47);

  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v48, "isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference"))
    v49 = CFSTR("✅ ");
  else
    v49 = CFSTR("❌ ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v49, CFSTR("CARDNDMiniInternalExitConfirmationOverride"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v50);

  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference"))
    v52 = CFSTR("✅ ");
  else
    v52 = CFSTR("❌ ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v52, CFSTR("CARDNDMiniInternalShowGeofencingAlerts"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v53);

  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "isAutomaticDNDInternalShowUserAlertsEnabledPreference"))
    v55 = CFSTR("✅ ");
  else
    v55 = CFSTR("❌ ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@ %@\n"), v55, CFSTR("CARDNDMiniInternalShowInternalAlerts"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v56);

  objc_msgSend(v3, "appendString:", CFSTR("Overall Feature States:\n"));
  v57 = dispatch_semaphore_create(0);
  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __40__CARDNDUtility_outputFromRhodesUtility__block_invoke;
  v71[3] = &unk_1E54280A0;
  v60 = v3;
  v72 = v60;
  v61 = v57;
  v73 = v61;
  objc_msgSend(v58, "fetchAutomaticDNDAssertionWithReply:", v71);

  dispatch_semaphore_wait(v61, 0xFFFFFFFFFFFFFFFFLL);
  -[CARDNDUtility DNDStatus](self, "DNDStatus");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v59;
  v68[1] = 3221225472;
  v68[2] = __40__CARDNDUtility_outputFromRhodesUtility__block_invoke_2;
  v68[3] = &unk_1E54280A0;
  v63 = v60;
  v69 = v63;
  v70 = v61;
  v64 = v61;
  objc_msgSend(v62, "fetchAutomaticDNDExitConfirmationWithReply:", v68);

  dispatch_semaphore_wait(v64, 0xFFFFFFFFFFFFFFFFLL);
  v65 = v70;
  v66 = v63;

  return v66;
}

intptr_t __40__CARDNDUtility_outputFromRhodesUtility__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  const __CFString *v5;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("ERROR fetching Driving state: %@"), a3);
  }
  else
  {
    v5 = CFSTR("❌ ");
    if (a2)
      v5 = CFSTR("✅ ");
    objc_msgSend(v4, "appendFormat:", CFSTR("  %@ Driving Mode \n"), v5);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __40__CARDNDUtility_outputFromRhodesUtility__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  const __CFString *v5;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("ERROR fetching EC state: %@"), a3);
  }
  else
  {
    v5 = CFSTR("❌ ");
    if (a2)
      v5 = CFSTR("✅ ");
    objc_msgSend(v4, "appendFormat:", CFSTR("  %@ Lock Screen Exit Confirmation \n"), v5);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (CARAutomaticDNDStatus)DNDStatus
{
  return self->_DNDStatus;
}

- (void)setDNDStatus:(id)a3
{
  objc_storeStrong((id *)&self->_DNDStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DNDStatus, 0);
}

@end
