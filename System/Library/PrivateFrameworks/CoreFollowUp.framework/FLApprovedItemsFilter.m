@implementation FLApprovedItemsFilter

- (unint64_t)approvalStatusForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSSet *approvedItemIdentifiers;
  void *v12;
  FLGroupViewModelImpl *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[FLEnvironment currentEnvironment](FLEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideAllFollowUps");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (-[NSSet containsObject:](self->_approvedClientIdentifiers, "containsObject:", v9)
        || -[NSSet containsObject:](self->_approvedItemIdentifiers, "containsObject:", v8)
        || (approvedItemIdentifiers = self->_approvedItemIdentifiers,
            objc_msgSend(v4, "typeIdentifier"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(approvedItemIdentifiers) = -[NSSet containsObject:](approvedItemIdentifiers, "containsObject:", v12),
            v12,
            (_DWORD)approvedItemIdentifiers))
      {
        v13 = [FLGroupViewModelImpl alloc];
        objc_msgSend(v4, "groupIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[FLGroupViewModelImpl initWithIdentifier:](v13, "initWithIdentifier:", v14);

        if (-[NSObject restrictionEnabled](v15, "restrictionEnabled")
          && !-[FLApprovedItemsFilter overrideGroupRestrictionsForItem:](self, "overrideGroupRestrictionsForItem:", v4))
        {
          _FLLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v30 = 138412290;
            v31 = v4;
            _os_log_impl(&dword_1B8D53000, v16, OS_LOG_TYPE_DEFAULT, "Item rejected due to group restriction: %@", (uint8_t *)&v30, 0xCu);
          }
          v7 = 2;
        }
        else
        {
          _FLLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v30 = 138412290;
            v31 = v4;
            _os_log_impl(&dword_1B8D53000, v16, OS_LOG_TYPE_DEFAULT, "Item approved: %@", (uint8_t *)&v30, 0xCu);
          }
          v7 = 1;
        }

        goto LABEL_20;
      }
      _FLLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[FLApprovedItemsFilter approvalStatusForItem:].cold.2((uint64_t)v4, v15, v24, v25, v26, v27, v28, v29);
    }
    else
    {
      _FLLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[FLApprovedItemsFilter approvalStatusForItem:].cold.1((uint64_t)v4, v15, v17, v18, v19, v20, v21, v22);
    }
    v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v7 = 2;
LABEL_21:

  return v7;
}

+ (id)sharedFilter
{
  if (sharedFilter_onceToken != -1)
    dispatch_once(&sharedFilter_onceToken, &__block_literal_global_14);
  return (id)sharedFilter_filter;
}

void __37__FLApprovedItemsFilter_sharedFilter__block_invoke()
{
  FLApprovedItemsFilter *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc_init(FLApprovedItemsFilter);
  v1 = (void *)sharedFilter_filter;
  sharedFilter_filter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.purplebuddy.revisitSkippedSteps"), CFSTR("DrySpellFollowUpItem"), CFSTR("WifiFollowUpItem"), CFSTR("RestoreFailureFollowUpItem"), CFSTR("com.apple.faceid.CamInterlockError"), CFSTR("com.apple.SoftwareUpdateServices.followup"), CFSTR("com.apple.SoftwareUpdateServices.followup.AutoUpdate"), CFSTR("com.apple.SoftwareUpdateServices.followup.updateAvailable"), CFSTR("com.apple.SoftwareUpdateServices.followup.badgeOnly"), CFSTR("com.apple.SoftwareUpdateServices.followup.RollbackDetected"), CFSTR("com.apple.SoftwareUpdateServices.followup.InsufficientDiskSpace"), CFSTR("com.apple.softwareupdateservicesui.followup.postupdate"), CFSTR("com.apple.Bridge.AppleID-FollowUp"), CFSTR("com.apple.Bridge.iTunesAccount-FollowUp"), CFSTR("com.apple.enhanced-logging-state"), CFSTR("com.apple.NewDeviceOutreach"), CFSTR("com.apple.managedconfiguration.ios-purgatory"),
    CFSTR("com.apple.SensorKit.followup.enableSensorKit"),
    CFSTR("com.apple.identityservicesd.HomeNumberSuccess"),
    CFSTR("com.apple.identityservicesd.HomeNumberNearExpiration"),
    CFSTR("com.apple.identityservicesd.HomeNumberExpiration"),
    CFSTR("com.apple.sharingd.phone-auto-unlock-upsell"),
    CFSTR("com.apple.backupd.prebuddy"),
    CFSTR("com.apple.disembarkui"),
    CFSTR("com.apple.devicemanagementclient.followup.reauth"),
    CFSTR("com.apple.SOS.settingsReset"),
    CFSTR("com.apple.transparency.ValidateSelfFailed"),
    CFSTR("com.apple.transparency.AuditFailure"),
    CFSTR("com.apple.transparency.TreeRollDetected"),
    CFSTR("com.apple.transparency.OptOut"),
    CFSTR("com.apple.Health.MedicalID.followup"),
    CFSTR("com.apple.timed.timefix"),
    CFSTR("com.apple.mdmclient.depenroll"),
    CFSTR("com.apple.siri.assets.corefollowup"),
    CFSTR("com.apple.safetyalerts.enhancedDelivery.onboardPrompt"),
    CFSTR("com.apple.app-distribution.approval-flow"),
    CFSTR("com.apple.SystemEnvironments.updateAvailable"),
    CFSTR("com.apple.mdmclient.purgatory"),
    CFSTR("com.apple.icloud.gm"),
    CFSTR("com.apple.swtransparency.rollback"),
    CFSTR("com.apple.swtransparency.treeFork"),
    CFSTR("com.apple.modelcatalog.out-of-space-cfu"),
    0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(sharedFilter_filter + 8);
  *(_QWORD *)(sharedFilter_filter + 8) = v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.appleaccount.followup"), CFSTR("com.apple.NewDeviceOutreach"), CFSTR("com.apple.authkit"), CFSTR("com.apple.corecdp"), CFSTR("com.apple.icloud.quota"), CFSTR("com.apple.AppleMediaServices"), CFSTR("com.apple.followup.tests"), CFSTR("com.apple.ndoagent"), CFSTR("com.apple.CoreTelephony"), CFSTR("com.apple.mobilerepair"), CFSTR("com.apple.HomeKit"), CFSTR("com.icloud.family"), CFSTR("com.apple.backupd"), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(sharedFilter_filter + 16);
  *(_QWORD *)(sharedFilter_filter + 16) = v4;

}

- (BOOL)overrideGroupRestrictionsForItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("com.apple.AAFollowUpIdentifier.RenewCredentials");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier", v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_approvedClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_approvedItemIdentifiers, 0);
}

- (void)approvalStatusForItem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, a2, a3, "Rejecting item as invalid: %@", a5, a6, a7, a8, 2u);
}

- (void)approvalStatusForItem:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, a2, a3, "Unknown item detected, please file a radar to [Follow Up | Requests] to be approved: %@", a5, a6, a7, a8, 2u);
}

@end
