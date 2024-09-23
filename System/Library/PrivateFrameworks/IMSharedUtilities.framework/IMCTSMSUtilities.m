@implementation IMCTSMSUtilities

+ (BOOL)IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMMMSEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsEnabledForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (id)IMUniqueIdentifierForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifierForPhoneNumber:simID:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)IMReadMMSUserOverrideForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "readMMSUserOverrideForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (id)IMPhoneNumbersEnabledForMultipleSubscriptionDevice
{
  void *v2;
  void *v3;

  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumbersEnabledForMultipleSubscriptionDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)IMReadEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "readEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMReadDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "readDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMReadDisablePreviewTranscodingQualityOnWRMCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "readDisablePreviewTranscodingQualityOnWRMCarrierValueForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMMMSSupportedAndConfiguredForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsSupportedAndConfiguredForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (unint64_t)IMReadAttachmentPreviewTranscodingQualitySizeCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "readAttachmentPreviewTranscodingQualitySizeCarrierValueForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (int)IMMMSMaximumSlideCountForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsMaximumSlideCountForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (int)IMMMSMaximumMessageByteCountForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsMaximumMessageByteCountForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMMMSGroupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsGroupTextReplicationSupportedForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMMMSGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (int)IMMMSMaxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsMaxRecipientsForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (int)IMMMSMaxImageDimensionForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsMaxImageDimensionForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMMMSSupportsH264VideoForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsSupportsH264VideoForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (double)IMMMSMaximumAudioDurationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mmsMaximumAudioDurationForPhoneNumber:simID:", v6, v5);
  v9 = v8;

  return v9;
}

+ (double)IMMMSMaximumVideoDurationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mmsMaximumVideoDurationForPhoneNumber:simID:", v6, v5);
  v9 = v8;

  return v9;
}

+ (void)IMiMessageMaxTransferFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "iMessageMaxTransferFileSizeForWifiForPhoneNumber:cellSize:serverConfigurationBag:phoneNumber:simID:", a3, a4, v13, v12, v11);

}

+ (unint64_t)IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "iMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:cellSize:serverConfigurationBag:phoneNumber:simID:", a3, a4, v13, v12, v11);

  return v15;
}

+ (unint64_t)IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "iMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:cellSize:serverConfigurationBag:phoneNumber:simID:", a3, a4, v13, v12, v11);

  return v15;
}

+ (id)IMMMSEmailAddressToMatchForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mmsEmailAddressToMatchForPhoneNumber:simID:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)IMShouldShowMMSEmailAddress:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShowMMSEmailAddress:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMIsEagerUploadEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEagerUploadEnabledForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMMMSEagerUploadDisabledInCarrierBundleForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsEagerUploadDisabledInCarrierBundleForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (BOOL)IMMMSRestrictedModeEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mmsRestrictedModeEnabledForPhoneNumber:simID:", v6, v5);

  return v8;
}

+ (void)IMSynchronizeMMSCapabilityToWatch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronizeMMSCapabilityToWatch:", v3);

}

+ (void)IMSynchronizePreferredSubscriptionMMSCapabilityToWatch
{
  id v2;

  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizePreferredSubscriptionMMSCapabilityToWatch");

}

+ (id)IMCountryCodeForSimSlot:(int64_t)a3
{
  void *v4;
  void *v5;

  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCodeForSimSlot:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)IMCountryCodeForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryCodeForPhoneNumber:simID:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)IMMessagesFilteringSettingForPreferedSubscription
{
  void *v2;
  char v3;

  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messagesFilteringSettingForPreferedSubscription");

  return v3;
}

+ (id)carrierBundleValueForKeyHierarchy:(id)a3 phoneNumber:(id)a4 simID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "carrierBundleValueForKeyHierarchy:phoneNumber:simID:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)carrierNameForPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierNameForPhoneNumber:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)SMSAllowCaseSensitiveSenderIDForPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "smsAllowCaseSensitiveSenderIDForPhoneNumber:", v3);

  return v5;
}

+ (BOOL)shouldUploadToMMCS:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldUploadToMMCS:", v3);

  return v5;
}

+ (id)myCTPhoneNumber
{
  void *v2;
  void *v3;

  +[IMCTSMSUtilitiesManager sharedManager](IMCTSMSUtilitiesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "myCTPhoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
