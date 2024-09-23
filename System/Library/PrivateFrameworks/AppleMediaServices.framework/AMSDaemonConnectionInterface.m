@implementation AMSDaemonConnectionInterface

+ (id)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AMSDaemonConnectionInterface_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEAD078 != -1)
    dispatch_once(&qword_1ECEAD078, block);
  return (id)_MergedGlobals_93;
}

+ (id)_securityServiceInterface
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADF48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_, 0, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_, 1, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_, 2, 0);

  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_, 1, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performDevicePasscodeVerificationWithCompletion_, 1, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_signChallengeForRequest_completion_, 0, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_signChallengeForRequest_completion_, 0, 1);
  objc_msgSend(a1, "_setUpSecurityInterfaceApplePayClassic:", v3);
  objc_msgSend(a1, "_setUpSecurityInterfaceBiometricSelectors:", v3);
  objc_msgSend(a1, "_setUpSecurityInterfaceDeviceIdentitySelectors:", v3);
  objc_msgSend(a1, "_setUpSecurityInterfaceHandleResponseSelector:", v3);
  objc_msgSend(a1, "_setUpSecurityInterfaceSignedHeadersSelector:", v3);
  objc_msgSend(a1, "_setUpSecurityInterfaceSilentEnrollmentSelector:", v3);
  return v3;
}

+ (void)_setUpSecurityInterfaceSilentEnrollmentSelector:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performSilentEnrollmentWithRequest_logKey_completion_, 0, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performSilentEnrollmentWithRequest_logKey_completion_, 1, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performSilentEnrollmentWithRequest_logKey_completion_, 0, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performSilentEnrollmentWithRequest_logKey_completion_, 1, 1);

}

+ (void)_setUpSecurityInterfaceSignedHeadersSelector:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_signedHeadersForRequest_buyParams_completion_, 0, 0);
  objc_msgSend(v4, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_signedHeadersForRequest_buyParams_completion_, 1, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_signedHeadersForRequest_buyParams_completion_, 0, 1);

  objc_msgSend(v4, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_signedHeadersForRequest_buyParams_completion_, 1, 1);
}

+ (void)_setUpSecurityInterfaceHandleResponseSelector:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleResponse_completion_, 0, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleResponse_completion_, 0, 1);

}

+ (void)_setUpSecurityInterfaceDeviceIdentitySelectors:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performClientCertChainRequestWithOptions_completion_, 0, 0);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_performClientCertChainRequestWithOptions_completion_, 0, 1);

  objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performClientCertChainRequestWithOptions_completion_, 1, 1);
}

+ (void)_setUpSecurityInterfaceBiometricSelectors:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deleteAllKeysWithCompletion_, 1, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_isActionSupportedForType_account_options_completion_, 1, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_isActionSupportedForType_account_options_completion_, 2, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_isActionSupportedForType_account_options_completion_, 1, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_isBiometricsAvailableForAccount_completion_, 0, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_isBiometricsAvailableForAccount_completion_, 1, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_isIdentityMapValidWithCompletion_, 1, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_saveIdentityMapWithCompletion_, 0, 1);

}

+ (void)_setUpSecurityInterfaceApplePayClassic:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_shouldAttemptApplePayWithCountryCode_paymentNetworks_completion_, 0, 0);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_shouldAttemptApplePayWithCountryCode_paymentNetworks_completion_, 1, 0);

  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_shouldAttemptApplePayWithCountryCode_paymentNetworks_completion_, 1, 1);
  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_, 0, 0);
  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_, 1, 0);
  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_, 2, 0);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_, 3, 0);

  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_shouldAttemptApplePayWithAccount_options_countryCode_paymentNetworks_completion_, 1, 1);
  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_paymentServicesMerchantURLWithCompletion_, 0, 1);
  objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_paymentServicesMerchantURLWithCompletion_, 1, 1);

}

+ (id)_securityClientInterface
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADEE8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_configureURLPresentationDelegateClasses:", v3);
  return v3;
}

+ (id)_purchaseServiceInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADE88);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cachedFDSForPurchaseIdentifier_logKey_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cachedFDSForPurchaseIdentifier_logKey_completion_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cachedFDSForPurchaseIdentifier_logKey_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cachedFDSForPurchaseIdentifier_logKey_completion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cacheFDS_forPurchaseIdentifier_logKey_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cacheFDS_forPurchaseIdentifier_logKey_completion_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cacheFDS_forPurchaseIdentifier_logKey_completion_, 2, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_cacheFDS_forPurchaseIdentifier_logKey_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_generateFDSWithRequest_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_generateFDSWithRequest_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_generateFDSWithRequest_completion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_partialFDSAssessmentForRequest_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_partialFDSAssessmentForRequest_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_partialFDSAssessmentForRequest_completion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_, 2, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createODISessionWithSessionIdentifier_accountType_bundleIdentifier_completion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getODIAssessmentForSessionIdentifier_clearCache_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getODIAssessmentForSessionIdentifier_clearCache_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getODIAssessmentForSessionIdentifier_clearCache_completion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_provideFeedbackOnPayloadOutcome_sessionIdentifier_clearCache_completion_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_provideFeedbackOnPayloadOutcome_sessionIdentifier_clearCache_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateODIWithAttributes_forSessionIdentifier_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateODIWithAttributes_forSessionIdentifier_completion_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateODIWithAttributes_forSessionIdentifier_completion_, 0, 1);
  return v2;
}

+ (id)_keychainServiceInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADD68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getPublicKeyHeaderWithAccount_options_signatureResult_completion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_testKeychainWithCompletion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_testKeychainWithCompletion_, 1, 1);

  return v2;
}

+ (id)_fraudReportServiceInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADD08);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performFraudReportRefreshWithAccount_transactionID_nameSpace_fsrData_keyID_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performFraudReportRefreshWithAccount_transactionID_nameSpace_fsrData_keyID_completion_, 1, 1);
  return v2;
}

+ (id)_dismissQRDialogServiceInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADCA8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_observeQRDialogDismissalNotificationForIdentifier_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeQRDialogDismissalObserverForIdentifier_completion_, 0, 0);
  return v2;
}

+ (id)_deviceMessengerServiceInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADC48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getMessagesWithPurpose_completion_, 0, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getMessagesWithPurpose_completion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendMessage_completion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendMessage_completion_, 1, 1);
  return v2;
}

+ (id)_deviceMessengerClientInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE077700);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deviceMessengerDidClearMessage_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deviceMessengerDidReceiveReply_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deviceMessengerDidReceiveMessage_, 0, 0);
  return v2;
}

+ (id)_cookieServiceInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE070CE0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clearDanglingCookieDatabasesWithCompletion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCookieDatabasePathForAccount_withCompletion_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCookieDatabasePathForAccount_withCompletion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCookieDatabasePathForAccount_withCompletion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCookiePropertiesForAccount_withCompletion_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C92C00], "ams_propertyXPCClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getCookiePropertiesForAccount_withCompletion_, 0, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCookiePropertiesForAccount_withCompletion_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCookiePropertiesForAccount_cookieDatabaseOnly_withCompletion_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C92C00], "ams_propertyXPCClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getCookiePropertiesForAccount_cookieDatabaseOnly_withCompletion_, 0, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getCookiePropertiesForAccount_cookieDatabaseOnly_withCompletion_, 1, 1);
  objc_msgSend(MEMORY[0x1E0C92C00], "ams_propertyXPCClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C92C00], "ams_propertyXPCClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_, 1, 0);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_, 2, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion_, 1, 1);
  return v2;
}

+ (void)_configureURLPresentationDelegateClasses:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleAuthenticateRequest_completion_, 0, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleAuthenticateRequest_completion_, 0, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleAuthenticateRequest_completion_, 1, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleDialogRequest_completion_, 0, 0);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleDialogRequest_completion_, 0, 1);
  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleDialogRequest_completion_, 1, 1);

}

+ (id)_accountSignOutInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADBE8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performAccountSignOutTasksForAccountWithID_, 0, 0);
  return v2;
}

+ (id)_accountCachedServerDataInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADA68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getDataForAccountIDs_reply_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7, v10[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getDataForAccountIDs_reply_, 0, 0);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setAutoPlayState_forAccountID_reply_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setAutoPlayState_forAccountID_reply_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setPersonalizationState_forAccountID_reply_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setPersonalizationState_forAccountID_reply_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_queueMetricsEventNotingExpiry_appID_reply_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_queueMetricsEventNotingExpiry_appID_reply_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_queueMetricsEventNotingExpiry_appID_reply_, 1, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_manualSyncForAccountID_reply_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_manualSyncForAccountID_reply_, 1, 1);
  return v2;
}

void __41__AMSDaemonConnectionInterface_interface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADB28);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_93;
  _MergedGlobals_93 = v2;

  v4 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_accountCachedServerDataInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getAccountCachedServerDataServiceProxyWithReplyHandler_, 0, 1);

  v6 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_accountSignOutInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_getAccountSignOutServiceProxyWithReplyHandler_, 0, 1);

  v8 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_cookieServiceInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_getCookieServiceProxyWithReplyHandler_, 0, 1);

  v10 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_deviceMessengerClientInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_getDeviceMessengerServiceProxyWithDelegate_replyHandler_, 0, 0);

  v12 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_deviceMessengerServiceInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_getDeviceMessengerServiceProxyWithDelegate_replyHandler_, 0, 1);

  v14 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_dismissQRDialogServiceInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_getDismissQRDialogServiceProxyWithReplyHandler_, 0, 1);

  v16 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_fraudReportServiceInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_getFraudReportServiceProxyWithReplyHandler_, 0, 1);

  v18 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_keychainServiceInterface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInterface:forSelector:argumentIndex:ofReply:", v19, sel_getKeychainServiceProxyWithReplyHandler_, 0, 1);

  v20 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_paymentConfirmationInterface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInterface:forSelector:argumentIndex:ofReply:", v21, sel_getPaymentConfirmationServiceProxyWithReplyHandler_, 0, 1);

  v22 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_paymentValidationServiceInterface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInterface:forSelector:argumentIndex:ofReply:", v23, sel_getPaymentValidationServiceProxyWithReplyHandler_, 0, 1);

  v24 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_purchaseServiceInterface");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", v25, sel_getPurchaseServiceProxyWithReplyHandler_, 0, 1);

  v26 = (void *)_MergedGlobals_93;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADB88);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setInterface:forSelector:argumentIndex:ofReply:", v27, sel_getPushNotificationServiceProxyWithReplyHandler_, 0, 1);

  v28 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_securityClientInterface");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInterface:forSelector:argumentIndex:ofReply:", v29, sel_getSecurityServiceProxyWithDelegate_replyHandler_, 0, 0);

  v30 = (void *)_MergedGlobals_93;
  objc_msgSend(*(id *)(a1 + 32), "_securityServiceInterface");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setInterface:forSelector:argumentIndex:ofReply:", v31, sel_getSecurityServiceProxyWithDelegate_replyHandler_, 0, 1);

}

+ (id)_paymentConfirmationInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADDC8);
}

+ (id)_paymentValidationServiceInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADE28);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_paymentHardwareStatusHeaderWithCompletion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_paymentHardwareStatusHeaderWithCompletion_, 1, 1);

  return v2;
}

@end
