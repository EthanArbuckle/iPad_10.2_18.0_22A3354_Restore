@implementation MCXPCProtocolInterface

void __MCXPCProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5587E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MCXPCProtocolInterface_interface;
  MCXPCProtocolInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  v8[6] = objc_opt_class();
  v8[7] = objc_opt_class();
  v8[8] = objc_opt_class();
  v8[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_checkInWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_checkCarrierProfileAndForceReinstallation_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_allowedOpenInAppBundleIDs_originatingAppBundleID_originatingIsManaged_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_allowedImportFromAppBundleIDs_importingAppBundleID_importingIsManaged_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_hasMailAccountsWithFilteringEnabled_sourceAccountManagement_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setAutoCorrectionAllowed_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setSmartPunctuationAllowed_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setPredictiveKeyboardAllowed_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setContinuousPathKeyboardAllowed_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setKeyboardShortcutsAllowed_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setSpellCheckAllowed_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setAllowedURLStrings_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_waitForMigrationIncludingPostRestoreMigration_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_notifyDeviceUnlockedAndPasscodeRequiredWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_notifyDeviceUnlockedWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_verifiedMDMProfileIdentifierWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_installProfileData_interactive_options_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_appleConnect_installMDMAssociatedProfileData_interactive_options_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_queueProfileDataForInstallation_originalFileName_originatingBundleID_transitionToUI_completion_, 2, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_popProfileDataFromHeadOfInstallationQueueWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_peekProfileDataFromPurgatoryForDeviceType_withCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_updateProfileIdentifier_interactive_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeProfileWithIdentifier_installationType_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeProtectedProfileWithIdentifier_installationType_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_completion_, 2, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_clearRecoveryPasscodeWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_changePasscode_oldPasscode_isRecovery_skipRecovery_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_clearPasscodeWithEscrowKeybagData_secret_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_isPasscodeCompliantWithNamedPolicy_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeOrphanedClientRestrictionsWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_managedSystemConfigurationServiceIDsWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_managedWiFiNetworkNamesWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_migrateWithContext_passcodeWasSetInBackup_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_migrateCleanupMigratorWithContext_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeBoolSetting_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeValueSetting_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_openSensitiveURL_unlock_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_storeCertificateData_forIPCUIdentifier_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_installProvisioningProfileData_managingProfileIdentifier_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeProvisioningProfileWithUUID_managingProfileIdentifier_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_isBundleBlocked_completion_, 3, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_areBundlesBlocked_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_notifyStartComplianceTimer_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_notifyHaveSeenComplianceMessageWithLastLockDate_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_recomputeUserComplianceWarningWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_recomputeUserComplianceWarningWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_recomputePerClientUserComplianceWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_resetAllSettingsToDefaultsIsUserInitiated_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setUserInfo_forClientUUID_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeExpiredProfilesWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_storeProfileData_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_storedProfileDataWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_markStoredProfileAsInstalledWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_rereadManagedAppAttributesWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_reducedMachineInfoDataWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_cloudConfigurationMachineInfoDataWithAdditionalInfo_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_cloudConfigurationStoreDetails_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_createActivationLockBypassCodeWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_storeActivationRecord_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setUserBookmarks_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_validateAppBundleIDs_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_managingOrganizationInformationWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_debugRescheduleBackgroundActivity_startDate_gracePeriod_repeatingInterval_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_unstageMDMEnrollmentInfoForPairingWatchWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_applyPairingWatchMDMEnrollmentData_completion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_updateMDMEnrollmentInfoForPairingWatch_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removePostSetupAutoInstallSetAsideProfileWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeSetAsideCloudConfigurationProfileWithCompletion_, 0, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_effectiveBoolValueForWatchSetting_pairingID_pairingDataStore_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_effectiveValueForWatchSetting_pairingID_pairingDataStore_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_effectiveValuesForWatchIntersectionSetting_pairingID_pairingDataStore_completion_, 1, 1);
  objc_msgSend((id)MCXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_effectiveValuesForWatchUnionSetting_pairingID_pairingDataStore_completion_, 1, 1);

}

@end
