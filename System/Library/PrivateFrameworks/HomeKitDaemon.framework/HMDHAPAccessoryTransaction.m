@implementation HMDHAPAccessoryTransaction

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HMDHAPAccessoryTransaction_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_146374 != -1)
    dispatch_once(&properties_onceToken_146374, block);
  return (id)properties__properties_146375;
}

void __40__HMDHAPAccessoryTransaction_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  objc_super v88;
  uint64_t v89;
  _QWORD v90[79];
  _QWORD v91[81];

  v91[79] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCED8];
  v88.receiver = *(id *)(a1 + 32);
  v88.super_class = (Class)&OBJC_METACLASS___HMDHAPAccessoryTransaction;
  objc_msgSendSuper2(&v88, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_146375;
  properties__properties_146375 = v3;

  v71 = (void *)properties__properties_146375;
  v90[0] = CFSTR("uniqueIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v87;
  v90[1] = CFSTR("bridgeUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v86;
  v90[2] = CFSTR("paired");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v85;
  v90[3] = CFSTR("accessoryFlags");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v84;
  v90[4] = CFSTR("certificationStatus");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v83;
  v90[5] = CFSTR("pairingUsername");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v91[5] = v82;
  v90[6] = CFSTR("publicKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v81;
  v90[7] = CFSTR("transportInformation");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v91[7] = v80;
  v90[8] = CFSTR("communicationProtocol");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v91[8] = v79;
  v90[9] = CFSTR("accessorySetupHash");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v91[9] = v78;
  v90[10] = CFSTR("broadcastKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v91[10] = v77;
  v90[11] = CFSTR("keyUpdatedStateNumber");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v91[11] = v76;
  v90[12] = CFSTR("keyUpdatedTime");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v91[12] = v75;
  v90[13] = CFSTR("targetUUIDs");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v91[13] = v74;
  v90[14] = CFSTR("hardwareSupport");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v91[14] = v73;
  v90[15] = CFSTR("connectivityInfo");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v91[15] = v72;
  v90[16] = CFSTR("wiFiTransportCapabilities");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v91[16] = v70;
  v90[17] = CFSTR("sleepInterval");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v91[17] = v69;
  v90[18] = CFSTR("hasOnboardedForNaturalLighting");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v91[18] = v68;
  v90[19] = CFSTR("initialServiceTypeUUIDs");
  v5 = objc_opt_class();
  v89 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:additionalDecodeClasses:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:additionalDecodeClasses:", v5, v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v91[19] = v66;
  v90[20] = CFSTR("needsOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v91[20] = v65;
  v90[21] = CFSTR("suspendedState");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v91[21] = v64;
  v90[22] = CFSTR("preferredMediaUserUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v91[22] = v63;
  v90[23] = CFSTR("preferredUserSelectionType");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v91[23] = v62;
  v90[24] = CFSTR("soundAlertEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v91[24] = v61;
  v90[25] = CFSTR("lightWhenUsingSiriEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v91[25] = v60;
  v90[26] = CFSTR("siriEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v91[26] = v59;
  v90[27] = CFSTR("siriLanguageCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v91[27] = v58;
  v90[28] = CFSTR("siriLanguageVoiceCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v91[28] = v57;
  v90[29] = CFSTR("siriLanguageVoiceGenderCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v91[29] = v56;
  v90[30] = CFSTR("siriLanguageVoiceName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v91[30] = v55;
  v90[31] = CFSTR("hasDismissedHomePodHasNonMemberMediaAccountWarning");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v91[31] = v54;
  v90[32] = CFSTR("doorbellChimeEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v91[32] = v53;
  v90[33] = CFSTR("announceEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v91[33] = v52;
  v90[34] = CFSTR("visionDoubleTapSettingsTimeoutInterval");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v91[34] = v51;
  v90[35] = CFSTR("visionVoiceOverEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v91[35] = v50;
  v90[36] = CFSTR("visionVoiceOverAudioDuckingEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v91[36] = v49;
  v90[37] = CFSTR("visionSpeakingRate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v91[37] = v48;
  v90[38] = CFSTR("interactionHoldDurationEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v91[38] = v47;
  v90[39] = CFSTR("interactionHoldDurationSeconds");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v91[39] = v46;
  v90[40] = CFSTR("interactionTouchAccommodationsEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v91[40] = v45;
  v90[41] = CFSTR("interactionIgnoreRepeatEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v91[41] = v44;
  v90[42] = CFSTR("interactionIgnoreRepeatSeconds");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v91[42] = v43;
  v90[43] = CFSTR("shareSiriAnalytics");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v91[43] = v42;
  v90[44] = CFSTR("shareSpeakerAnalytics");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v91[44] = v41;
  v90[45] = CFSTR("airPlayEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v91[45] = v40;
  v90[46] = CFSTR("siriEndpointEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v91[46] = v39;
  v90[47] = CFSTR("cameraAccessModeAtHome");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v91[47] = v38;
  v90[48] = CFSTR("cameraAccessModeNotAtHome");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v91[48] = v37;
  v90[49] = CFSTR("cameraRecordingEventTriggers");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v91[49] = v36;
  v90[50] = CFSTR("cameraActivityZones");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v91[50] = v35;
  v90[51] = CFSTR("cameraActivityZonesIncludedForSignificantEventDetection");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v91[51] = v34;
  v90[52] = CFSTR("supportsMatterAccessCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v91[52] = v33;
  v90[53] = CFSTR("supportsMatterWalletKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v91[53] = v32;
  v90[54] = CFSTR("supportsMatterWeekDaySchedule");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v91[54] = v31;
  v90[55] = CFSTR("supportsMatterYearDaySchedule");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v91[55] = v30;
  v90[56] = CFSTR("matterWeekDayScheduleCapacity");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v91[56] = v29;
  v90[57] = CFSTR("matterYearDayScheduleCapacity");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v91[57] = v28;
  v90[58] = CFSTR("cameraCurrentAccessMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v91[58] = v27;
  v90[59] = CFSTR("cameraCurrentAccessModeChangeReason");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v91[59] = v26;
  v90[60] = CFSTR("cameraCurrentAccessModeChangeDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v91[60] = v25;
  v90[61] = CFSTR("enhancedAuthMethod");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v91[61] = v24;
  v90[62] = CFSTR("enhancedAuthConfigNumber");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v91[62] = v23;
  v90[63] = CFSTR("supportsNaturalLighting");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v91[63] = v22;
  v90[64] = CFSTR("naturalLightingEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v91[64] = v21;
  v90[65] = CFSTR("chipNodeID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v91[65] = v20;
  v90[66] = CFSTR("chipVendorID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v91[66] = v19;
  v90[67] = CFSTR("chipProductID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v91[67] = v18;
  v90[68] = CFSTR("chipAttributeDatabase");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v91[68] = v17;
  v90[69] = CFSTR("chipPairingsData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v91[69] = v16;
  v90[70] = CFSTR("chipWEDSupport");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91[70] = v15;
  v90[71] = CFSTR("chipExtendedMACAddress");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v91[71] = v6;
  v90[72] = CFSTR("matterSoftwareVersionNumber");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v91[72] = v7;
  v90[73] = CFSTR("supportedLinkLayerTypes");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v91[73] = v8;
  v90[74] = CFSTR("supportsMatCredACP");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v91[74] = v9;
  v90[75] = CFSTR("supportsMatCredACB");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v91[75] = v10;
  v90[76] = CFSTR("matCredRGSI");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v91[76] = v11;
  v90[77] = CFSTR("preexistingMatCredRGI");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v91[77] = v12;
  v90[78] = CFSTR("mfiCertifiedACWG");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v91[78] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 79);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addEntriesFromDictionary:", v14);

}

- (id)dependentUUIDs
{
  HMDHAPAccessoryTransaction *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  HMDHAPAccessoryTransaction *v21;
  NSObject *v22;
  HMDHAPAccessoryTransaction *v23;
  void *v24;
  void *v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)HMDHAPAccessoryTransaction;
  -[HMDAccessoryTransaction dependentUUIDs](&v33, sel_dependentUUIDs);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDHAPAccessoryTransaction bridgeUUID](v2, "bridgeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1880]);
    -[HMDHAPAccessoryTransaction bridgeUUID](v2, "bridgeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);
    objc_msgSend(v4, "addObject:", v8);

  }
  -[HMDHAPAccessoryTransaction targetUUIDs](v2, "targetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v26 = v4;
    v11 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDHAPAccessoryTransaction targetUUIDs](v2, "targetUUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[HMDHAPAccessoryTransaction targetUUIDs](v2, "targetUUIDs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    v14 = 0x24BDD1000uLL;
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v14 + 2176)), "initWithUUIDString:", v18);
          if (v19)
          {
            objc_msgSend(v28, "addObject:", v19);
          }
          else
          {
            v20 = (void *)MEMORY[0x227676638]();
            v21 = v2;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v23 = v2;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v35 = v24;
              v36 = 2112;
              v37 = v18;
              _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@UUID string not well-formed: %@", buf, 0x16u);

              v2 = v23;
              v14 = 0x24BDD1000;
            }

            objc_autoreleasePoolPop(v20);
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v15);
    }

    v4 = v26;
    objc_msgSend(v26, "addObjectsFromArray:", v28);

  }
  return v4;
}

- (NSSet)chipPairings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  HMDHAPAccessoryTransaction *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  -[HMDHAPAccessoryTransaction chipPairingsData](self, "chipPairingsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v14;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize pairings from data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return (NSSet *)v8;
}

- (void)setChipPairings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDHAPAccessoryTransaction *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v5)
    {
      -[HMDHAPAccessoryTransaction setChipPairingsData:](self, "setChipPairingsData:", v5);
    }
    else
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v13 = v10;
        v14 = 2112;
        v15 = v4;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize pairings %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
  else
  {
    -[HMDHAPAccessoryTransaction setChipPairingsData:](self, "setChipPairingsData:", 0);
  }

}

- (HAPAccessory)hapAccessoryLocal
{
  return self->_hapAccessoryLocal;
}

- (void)setHapAccessoryLocal:(id)a3
{
  objc_storeStrong((id *)&self->_hapAccessoryLocal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapAccessoryLocal, 0);
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMDHAPAccessoryTransaction *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  id v31;
  void *v32;
  id v34;
  objc_super v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("cameraActivityZones")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("initialServiceTypeUUIDs")))
    {
      objc_msgSend(v8, "initialServiceTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v34 = v8;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v17 = v15;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v38 != v20)
                objc_enumerationMutation(v17);
              v22 = (void *)MEMORY[0x24BE3F208];
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "UUIDString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "hmf_cachedInstanceForString:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v24);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          }
          while (v19);
        }

        v12 = (void *)objc_msgSend(v16, "copy");
        v8 = v34;
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("chipNodeID")))
      {
        objc_msgSend(v8, "matterNodeID");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("chipVendorID")))
      {
        objc_msgSend(v8, "matterVendorID");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("chipProductID")))
      {
        objc_msgSend(v8, "matterProductID");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("chipPairingsData")))
        {
          objc_msgSend(v8, "matterPairings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v36 = 0;
            objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v36);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v36;
            if (v12)
              goto LABEL_4;
            v26 = (void *)MEMORY[0x227676638]();
            v27 = self;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v44 = v29;
              v45 = 2112;
              v46 = v13;
              v30 = "%{public}@Failed to encode matter pairings: %@";
              goto LABEL_21;
            }
LABEL_22:

            objc_autoreleasePoolPop(v26);
            goto LABEL_23;
          }
LABEL_32:
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("chipWEDSupport")))
        {
          objc_msgSend(v8, "matterWEDSupport");
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("chipExtendedMACAddress")))
          {
            v35.receiver = self;
            v35.super_class = (Class)HMDHAPAccessoryTransaction;
            -[HMDAccessoryTransaction cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v35, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_43;
          }
          objc_msgSend(v8, "matterExtendedMACAddress");
          v25 = objc_claimAutoreleasedReturnValue();
        }
      }
      v15 = (void *)v25;
      v32 = (void *)*MEMORY[0x24BDBD430];
      if (v25)
        v32 = (void *)v25;
      v31 = v32;
    }
    v12 = v31;
LABEL_42:

    goto LABEL_43;
  }
  objc_msgSend(v8, "cameraActivityZones");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_32;
  v41 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v41;
  if (!v12)
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v29;
      v45 = 2112;
      v46 = v13;
      v30 = "%{public}@Failed to encode activity zones: %@";
LABEL_21:
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0x16u);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
LABEL_4:
  v14 = v12;
LABEL_23:

LABEL_33:
LABEL_43:

  return v12;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  HMDHAPAccessoryTransaction *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("cameraActivityZones")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("cameraActivityZones")))
    {
      -[HMDHAPAccessoryTransaction cameraActivityZones](self, "cameraActivityZones");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDD1620];
        v13 = (void *)MEMORY[0x24BDBCF20];
        v35[0] = objc_opt_class();
        v35[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v15, v11, &v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v30;

        if (v16)
        {
          v18 = v16;
        }
        else
        {
          v22 = (void *)MEMORY[0x227676638]();
          v23 = self;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = v25;
            v33 = 2112;
            v34 = v17;
            _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode activity zones: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v22);
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = v18;

        goto LABEL_37;
      }
      goto LABEL_13;
    }
    goto LABEL_38;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("initialServiceTypes")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("matterNodeID")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipNodeID")))
        goto LABEL_38;
      -[HMDHAPAccessoryTransaction chipNodeID](self, "chipNodeID");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("matterVendorID")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipVendorID")))
        goto LABEL_38;
      -[HMDHAPAccessoryTransaction chipVendorID](self, "chipVendorID");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("matterProductID")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipProductID")))
        goto LABEL_38;
      -[HMDHAPAccessoryTransaction chipProductID](self, "chipProductID");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("matterPairings")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipPairingsData")))
        goto LABEL_38;
      -[HMDHAPAccessoryTransaction chipPairings](self, "chipPairings");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("matterWEDSupport")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipWEDSupport")))
        goto LABEL_38;
      -[HMDHAPAccessoryTransaction chipWEDSupport](self, "chipWEDSupport");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("matterExtendedMACAddress")))
      {
        v29.receiver = self;
        v29.super_class = (Class)HMDHAPAccessoryTransaction;
        -[HMDAccessoryTransaction cd_generateValueForProperty:managedObjectField:context:](&v29, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipExtendedMACAddress")))
        goto LABEL_38;
      -[HMDHAPAccessoryTransaction chipExtendedMACAddress](self, "chipExtendedMACAddress");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v21;
    v27 = (void *)*MEMORY[0x24BDBD430];
    if (v21)
      v27 = (void *)v21;
    v20 = v27;
    goto LABEL_36;
  }
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("initialServiceTypeUUIDs")))
  {
LABEL_38:
    v26 = 0;
    goto LABEL_39;
  }
  -[HMDHAPAccessoryTransaction initialServiceTypeUUIDs](self, "initialServiceTypeUUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (!v19)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  HMDSortedServiceTypeUUIDsFromStrings(v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
  v26 = v20;
LABEL_37:

LABEL_39:
  return v26;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)cd_getMKFServiceFromAccessoryUUID:(id)a3 serviceInstanceId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_18:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_18;
  objc_msgSend(a1, "cd_getMKFHAPAccessoryFromAccessory:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v9, "services", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "instanceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v8);

          if (v17)
          {
            v12 = v15;
            goto LABEL_14;
          }
        }
        v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)cd_getMKFHAPAccessoryFromAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
  if (v5)
  {
    objc_msgSend(a1, "cd_getMKFHAPAccessoryFromAccessoryUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid accessory UUID string '%@'", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return v6;
}

+ (id)cd_getMKFHAPAccessoryFromAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v16 = 0;
  +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v4, objc_opt_class(), &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v14 = v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFHAPAccessory for HAP accessory with UUID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }

  return v14;
}

@end
