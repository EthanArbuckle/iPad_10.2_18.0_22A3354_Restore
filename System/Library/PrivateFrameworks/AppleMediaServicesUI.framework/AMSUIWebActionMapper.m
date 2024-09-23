@implementation AMSUIWebActionMapper

+ (id)actionFromJSObject:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  AMSUIWebActionRunnerAction *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  _QWORD v13[54];
  _QWORD v14[55];

  v14[54] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (+[AMSUIActionRunner canHandle:context:](AMSUIActionRunner, "canHandle:context:", v5, 0))
  {
    v7 = -[AMSUIWebActionRunnerAction initWithJSObject:context:]([AMSUIWebActionRunnerAction alloc], "initWithJSObject:context:", v5, v6);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actionClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    v13[0] = CFSTR("AMSAccountAction");
    v14[0] = objc_opt_class();
    v13[1] = CFSTR("AMSAcknowledgePrivacyAction");
    v14[1] = objc_opt_class();
    v13[2] = CFSTR("AMSApplicationLookupAction");
    v14[2] = objc_opt_class();
    v13[3] = CFSTR("AMSAppOverlayAction");
    v14[3] = objc_opt_class();
    v13[4] = CFSTR("AMSAuthenticateAction");
    v14[4] = objc_opt_class();
    v13[5] = CFSTR("AMSAuthorizeApplePayEnrollmentAction");
    v14[5] = objc_opt_class();
    v13[6] = CFSTR("AMSBagAction");
    v14[6] = objc_opt_class();
    v13[7] = CFSTR("AMSBusinessChatAction");
    v14[7] = objc_opt_class();
    v13[8] = CFSTR("AMSBuyAction");
    v14[8] = objc_opt_class();
    v13[9] = CFSTR("AMSCallbackAction");
    v14[9] = objc_opt_class();
    v13[10] = CFSTR("AMSCampaignAttributionAction");
    v14[10] = objc_opt_class();
    v13[11] = CFSTR("AMSCheckDownloadQueueAction");
    v14[11] = objc_opt_class();
    v13[12] = CFSTR("AMSDelegateAction");
    v14[12] = objc_opt_class();
    v13[13] = CFSTR("AMSDialogAction");
    v14[13] = objc_opt_class();
    v13[14] = CFSTR("AMSEngagementAction");
    v14[14] = objc_opt_class();
    v13[15] = CFSTR("AMSFamilyAction");
    v14[15] = objc_opt_class();
    v13[16] = CFSTR("AMSFetchAttestationVersionAction");
    v14[16] = objc_opt_class();
    v13[17] = CFSTR("AMSFetchCardDataAction");
    v14[17] = objc_opt_class();
    v13[18] = CFSTR("AMSFetchCardMetadataAction");
    v14[18] = objc_opt_class();
    v13[19] = CFSTR("AMSFetchMetricsIdentifierAction");
    v14[19] = objc_opt_class();
    v13[20] = CFSTR("AMSFetchTelephonyAction");
    v14[20] = objc_opt_class();
    v13[21] = CFSTR("AMSFetchTreatmentAreasAction");
    v14[21] = objc_opt_class();
    v13[22] = CFSTR("AMSFetchTreatmentOverridesAction");
    v14[22] = objc_opt_class();
    v13[23] = CFSTR("AMSFetchTreatmentsAction");
    v14[23] = objc_opt_class();
    v13[24] = CFSTR("AMSFlowAction");
    v14[24] = objc_opt_class();
    v13[25] = CFSTR("AMSLoadPluginAction");
    v14[25] = objc_opt_class();
    v13[26] = CFSTR("AMSLocalApproveAction");
    v14[26] = objc_opt_class();
    v13[27] = CFSTR("AMSLogAction");
    v14[27] = objc_opt_class();
    v13[28] = CFSTR("AMSMarketingItemAction");
    v14[28] = objc_opt_class();
    v13[29] = CFSTR("AMSMediaAction");
    v14[29] = objc_opt_class();
    v13[30] = CFSTR("AMSMediaQueryAction");
    v14[30] = objc_opt_class();
    v13[31] = CFSTR("AMSMetricsAction");
    v14[31] = objc_opt_class();
    v13[32] = CFSTR("AMSNetworkAction");
    v14[32] = objc_opt_class();
    v13[33] = CFSTR("AMSODIAssessmentAction");
    v14[33] = objc_opt_class();
    v13[34] = CFSTR("AMSODIAssessmentFeedbackAction");
    v14[34] = objc_opt_class();
    v13[35] = CFSTR("AMSOpenApplicationAction");
    v14[35] = objc_opt_class();
    v13[36] = CFSTR("AMSOpenFamilyCircleAction");
    v14[36] = objc_opt_class();
    v13[37] = CFSTR("AMSOpenSafariAction");
    v14[37] = objc_opt_class();
    v13[38] = CFSTR("AMSOpenURLAction");
    v14[38] = objc_opt_class();
    v13[39] = CFSTR("AMSOTPAction");
    v14[39] = objc_opt_class();
    v13[40] = CFSTR("AMSPaymentSetupAction");
    v14[40] = objc_opt_class();
    v13[41] = CFSTR("AMSPluginAction");
    v14[41] = objc_opt_class();
    v13[42] = CFSTR("AMSPresentPrivacySplashAction");
    v14[42] = objc_opt_class();
    v13[43] = CFSTR("AMSRemoveDeviceOfferAction");
    v14[43] = objc_opt_class();
    v13[44] = CFSTR("AMSRestrictedFeatureAction");
    v14[44] = objc_opt_class();
    v13[45] = CFSTR("AMSOverrideTreatmentsAction");
    v14[45] = objc_opt_class();
    v13[46] = CFSTR("AMSSendSMSAction");
    v14[46] = objc_opt_class();
    v13[47] = CFSTR("AMSSubscriptionAction");
    v14[47] = objc_opt_class();
    v13[48] = CFSTR("AMSSynchronizeTreatmentsAction");
    v14[48] = objc_opt_class();
    v13[49] = CFSTR("AMSItsMeTraceIDAction");
    v14[49] = objc_opt_class();
    v13[50] = CFSTR("AMSWalletPassAction");
    v14[50] = objc_opt_class();
    v13[51] = CFSTR("AMSVerifyCredentialsAction");
    v14[51] = objc_opt_class();
    v13[52] = CFSTR("AMSVerifyPaymentSetupFeatureAction");
    v14[52] = objc_opt_class();
    v13[53] = CFSTR("AMSVerifyPrivacyAcknowledgementAction");
    v14[53] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 54);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)(id)objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    if (v11)
      v7 = (AMSUIWebActionRunnerAction *)objc_msgSend([v11 alloc], "initWithJSObject:context:", v5, v6);
    else
      v7 = 0;

  }
  return v7;
}

@end
