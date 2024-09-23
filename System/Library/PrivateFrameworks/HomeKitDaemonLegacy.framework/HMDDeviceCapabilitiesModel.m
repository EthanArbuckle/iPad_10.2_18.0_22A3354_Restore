@implementation HMDDeviceCapabilitiesModel

+ (id)properties
{
  if (properties_onceToken_145861 != -1)
    dispatch_once(&properties_onceToken_145861, &__block_literal_global_616);
  return (id)properties__properties_145862;
}

- (NSNumber)supportsAudioAnalysis
{
  return self->_supportsAudioAnalysis;
}

- (void)setSupportsAudioAnalysis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)supportsDropIn
{
  return self->_supportsDropIn;
}

- (void)setSupportsDropIn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportsDropIn, 0);
  objc_storeStrong((id *)&self->_supportsAudioAnalysis, 0);
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
  _QWORD v61[59];
  _QWORD v62[61];

  v62[59] = *MEMORY[0x1E0C80C00];
  v61[0] = CFSTR("supportsKeychainSync");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v60;
  v61[1] = CFSTR("supportsDeviceSetup");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v59;
  v61[2] = CFSTR("supportsKeyTransferClient");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v58;
  v61[3] = CFSTR("supportsKeyTransferServer");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v57;
  v61[4] = CFSTR("supportsStandaloneMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v56;
  v61[5] = CFSTR("supportsCloudDataSync");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v55;
  v61[6] = CFSTR("supportsWholeHouseAudio");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v54;
  v61[7] = CFSTR("supportsAssistantAccessControl");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v53;
  v61[8] = CFSTR("residentCapable");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v52;
  v61[9] = CFSTR("remoteGatewayCapable");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v51;
  v61[10] = CFSTR("supportsHomeInvitation");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v50;
  v61[11] = CFSTR("supportsTargetControl");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v62[11] = v49;
  v61[12] = CFSTR("supportsMultiUser");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v48;
  v61[13] = CFSTR("supportsHomeLevelLocationServiceSetting");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v62[13] = v47;
  v61[14] = CFSTR("supportsCompanionInitiatedRestart");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[14] = v46;
  v61[15] = CFSTR("supportsCompanionInitiatedObliterate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[15] = v45;
  v61[16] = CFSTR("supportsCameraRecording");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[16] = v44;
  v61[17] = CFSTR("supportsRouterManagement");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[17] = v43;
  v61[18] = CFSTR("supportsShortcutActions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[18] = v42;
  v61[19] = CFSTR("supportsMediaActions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[19] = v41;
  v61[20] = CFSTR("supportsFirmwareUpdate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[20] = v40;
  v61[21] = CFSTR("supportsResidentFirmwareUpdate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[21] = v39;
  v61[22] = CFSTR("supportsCameraActivityZones");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[22] = v38;
  v61[23] = CFSTR("supportsMusicAlarm");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v62[23] = v37;
  v61[24] = CFSTR("supportsFaceClassification");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[24] = v36;
  v61[25] = CFSTR("supportsNaturalLighting");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62[25] = v35;
  v61[26] = CFSTR("supportsIDSActivityMonitorPresence");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v62[26] = v34;
  v61[27] = CFSTR("supportsCameraRecordingReachabilityNotifications");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62[27] = v33;
  v61[28] = CFSTR("supportsAnnounce");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[28] = v32;
  v61[29] = CFSTR("supportsThirdPartyMusic");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62[29] = v31;
  v61[30] = CFSTR("supportsPreferredMediaUser");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62[30] = v30;
  v61[31] = CFSTR("supportsThreadBorderRouter");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[31] = v29;
  v61[32] = CFSTR("supportsSiriEndpointSetup");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62[32] = v28;
  v61[33] = CFSTR("supportsHomeHub");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[33] = v27;
  v61[34] = CFSTR("supportsWakeOnLAN");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[34] = v26;
  v61[35] = CFSTR("supportsLockNotificationContext");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62[35] = v25;
  v61[36] = CFSTR("supportsCoordinationDoorbellChime");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62[36] = v24;
  v61[37] = CFSTR("supportsCoordinationFreeDoorbellChime");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[37] = v23;
  v61[38] = CFSTR("supportsTVOSUpdateManualUpdateAvailableNotification");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[38] = v22;
  v61[39] = CFSTR("supportsAudioReturnChannel");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62[39] = v21;
  v61[40] = CFSTR("supportsWalletKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v62[40] = v20;
  v61[41] = CFSTR("supportsCameraPackageDetection");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62[41] = v19;
  v61[42] = CFSTR("supportsAccessCodes");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[42] = v18;
  v61[43] = CFSTR("supportsCHIP");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62[43] = v17;
  v61[44] = CFSTR("supportsDoorbellChime");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v62[44] = v16;
  v61[45] = CFSTR("supportsUserMediaSettings");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v62[45] = v15;
  v61[46] = CFSTR("supportsUnifiedMediaNotifications");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[46] = v14;
  v61[47] = CFSTR("supportsManagedConfigurationProfile");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62[47] = v13;
  v61[48] = CFSTR("supportsCaptiveNetworks");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[48] = v12;
  v61[49] = CFSTR("supportsModernTransport");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62[49] = v11;
  v61[50] = CFSTR("supportsResidentFirstAccessoryCommunication");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v62[50] = v0;
  v61[51] = CFSTR("supportsMessagedHomePodSettings");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v62[51] = v1;
  v61[52] = CFSTR("supportsCustomMediaApplicationDestination");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v62[52] = v2;
  v61[53] = CFSTR("supportsThreadNetworkCredentialSharing");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v62[53] = v3;
  v61[54] = CFSTR("supportsMatterSharedAdminPairing");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62[54] = v4;
  v61[55] = CFSTR("supportsRMVonAppleTV");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v62[55] = v5;
  v61[56] = CFSTR("supportsJustSiri");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62[56] = v6;
  v61[57] = CFSTR("supportsThreadService");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62[57] = v7;
  v61[58] = CFSTR("supportsMatterOwnerCertFetch");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62[58] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 59);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties_145862;
  properties__properties_145862 = v9;

}

@end
