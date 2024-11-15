@implementation HMDDeviceCapabilitiesModel

+ (id)properties
{
  if (properties_onceToken_202917 != -1)
    dispatch_once(&properties_onceToken_202917, &__block_literal_global_628);
  return (id)properties__properties_202918;
}

+ (id)schemaHashRoot
{
  return (id)objc_msgSend(CFSTR("D1529AFE-D6F2-4562-AFD9-33A176868B4E"), "copy");
}

void __40__HMDDeviceCapabilitiesModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[61];
  _QWORD v64[63];

  v64[61] = *MEMORY[0x24BDAC8D0];
  v63[0] = CFSTR("supportsKeychainSync");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v62;
  v63[1] = CFSTR("supportsDeviceSetup");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v61;
  v63[2] = CFSTR("supportsKeyTransferClient");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v60;
  v63[3] = CFSTR("supportsKeyTransferServer");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v59;
  v63[4] = CFSTR("supportsStandaloneMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v58;
  v63[5] = CFSTR("supportsCloudDataSync");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v57;
  v63[6] = CFSTR("supportsWholeHouseAudio");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v56;
  v63[7] = CFSTR("supportsAssistantAccessControl");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v55;
  v63[8] = CFSTR("residentCapable");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v54;
  v63[9] = CFSTR("remoteGatewayCapable");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v53;
  v63[10] = CFSTR("supportsHomeInvitation");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v52;
  v63[11] = CFSTR("supportsTargetControl");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v51;
  v63[12] = CFSTR("supportsMultiUser");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v64[12] = v50;
  v63[13] = CFSTR("supportsHomeLevelLocationServiceSetting");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[13] = v49;
  v63[14] = CFSTR("supportsCompanionInitiatedRestart");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v64[14] = v48;
  v63[15] = CFSTR("supportsCompanionInitiatedObliterate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[15] = v47;
  v63[16] = CFSTR("supportsCameraRecording");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[16] = v46;
  v63[17] = CFSTR("supportsRouterManagement");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v64[17] = v45;
  v63[18] = CFSTR("supportsShortcutActions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[18] = v44;
  v63[19] = CFSTR("supportsMediaActions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v64[19] = v43;
  v63[20] = CFSTR("supportsFirmwareUpdate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v64[20] = v42;
  v63[21] = CFSTR("supportsResidentFirmwareUpdate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v64[21] = v41;
  v63[22] = CFSTR("supportsCameraActivityZones");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64[22] = v40;
  v63[23] = CFSTR("supportsMusicAlarm");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64[23] = v39;
  v63[24] = CFSTR("supportsFaceClassification");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[24] = v38;
  v63[25] = CFSTR("supportsNaturalLighting");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[25] = v37;
  v63[26] = CFSTR("supportsIDSActivityMonitorPresence");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[26] = v36;
  v63[27] = CFSTR("supportsCameraRecordingReachabilityNotifications");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[27] = v35;
  v63[28] = CFSTR("supportsAnnounce");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[28] = v34;
  v63[29] = CFSTR("supportsAudioAnalysis");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[29] = v33;
  v63[30] = CFSTR("supportsDropIn");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v64[30] = v32;
  v63[31] = CFSTR("supportsThirdPartyMusic");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v64[31] = v31;
  v63[32] = CFSTR("supportsPreferredMediaUser");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[32] = v30;
  v63[33] = CFSTR("supportsThreadBorderRouter");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64[33] = v29;
  v63[34] = CFSTR("supportsSiriEndpointSetup");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v64[34] = v28;
  v63[35] = CFSTR("supportsHomeHub");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v64[35] = v27;
  v63[36] = CFSTR("supportsWakeOnLAN");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64[36] = v26;
  v63[37] = CFSTR("supportsLockNotificationContext");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64[37] = v25;
  v63[38] = CFSTR("supportsCoordinationDoorbellChime");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64[38] = v24;
  v63[39] = CFSTR("supportsCoordinationFreeDoorbellChime");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v64[39] = v23;
  v63[40] = CFSTR("supportsTVOSUpdateManualUpdateAvailableNotification");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v64[40] = v22;
  v63[41] = CFSTR("supportsAudioReturnChannel");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64[41] = v21;
  v63[42] = CFSTR("supportsWalletKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v64[42] = v20;
  v63[43] = CFSTR("supportsCameraPackageDetection");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64[43] = v19;
  v63[44] = CFSTR("supportsAccessCodes");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64[44] = v18;
  v63[45] = CFSTR("supportsCHIP");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v64[45] = v17;
  v63[46] = CFSTR("supportsDoorbellChime");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64[46] = v16;
  v63[47] = CFSTR("supportsUserMediaSettings");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[47] = v15;
  v63[48] = CFSTR("supportsUnifiedMediaNotifications");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[48] = v14;
  v63[49] = CFSTR("supportsManagedConfigurationProfile");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64[49] = v13;
  v63[50] = CFSTR("supportsCaptiveNetworks");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64[50] = v12;
  v63[51] = CFSTR("supportsModernTransport");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64[51] = v11;
  v63[52] = CFSTR("supportsResidentFirstAccessoryCommunication");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v64[52] = v0;
  v63[53] = CFSTR("supportsMessagedHomePodSettings");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v64[53] = v1;
  v63[54] = CFSTR("supportsCustomMediaApplicationDestination");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v64[54] = v2;
  v63[55] = CFSTR("supportsThreadNetworkCredentialSharing");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v64[55] = v3;
  v63[56] = CFSTR("supportsMatterSharedAdminPairing");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v64[56] = v4;
  v63[57] = CFSTR("supportsRMVonAppleTV");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64[57] = v5;
  v63[58] = CFSTR("supportsJustSiri");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v64[58] = v6;
  v63[59] = CFSTR("supportsThreadService");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v64[59] = v7;
  v63[60] = CFSTR("supportsMatterOwnerCertFetch");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[60] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 61);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties_202918;
  properties__properties_202918 = v9;

}

@end
