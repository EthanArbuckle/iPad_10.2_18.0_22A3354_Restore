@implementation HMDCompositeSettingsAccessorySettingsModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_114640 != -1)
    dispatch_once(&hmbProperties_onceToken_114640, &__block_literal_global_114641);
  return (id)hmbProperties_properties_114642;
}

+ (id)allKeyPaths
{
  if (allKeyPaths_onceToken != -1)
    dispatch_once(&allKeyPaths_onceToken, &__block_literal_global_210);
  return (id)allKeyPaths_allKeyPaths;
}

void __57__HMDCompositeSettingsAccessorySettingsModel_allKeyPaths__block_invoke()
{
  void *v0;

  v0 = (void *)allKeyPaths_allKeyPaths;
  allKeyPaths_allKeyPaths = (uint64_t)&unk_24E970EE0;

}

void __59__HMDCompositeSettingsAccessorySettingsModel_hmbProperties__block_invoke()
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
  _QWORD v74[72];
  _QWORD v75[74];

  v75[72] = *MEMORY[0x24BDAC8D0];
  v74[0] = CFSTR("root_siri_soundAlert_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v73;
  v74[1] = CFSTR("root_siri_soundAlert_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v72;
  v74[2] = CFSTR("root_siri_soundAlert_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v71;
  v74[3] = CFSTR("root_siri_lightWhenUsingSiri_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v70;
  v74[4] = CFSTR("root_siri_lightWhenUsingSiri_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v75[4] = v69;
  v74[5] = CFSTR("root_siri_lightWhenUsingSiri_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v75[5] = v68;
  v74[6] = CFSTR("root_siri_siriEnabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v75[6] = v67;
  v74[7] = CFSTR("root_siri_siriEnabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v75[7] = v66;
  v74[8] = CFSTR("root_siri_siriEnabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v75[8] = v65;
  v74[9] = CFSTR("root_siri_language_inputLanguageCodeValueName");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v75[9] = v64;
  v74[10] = CFSTR("root_siri_language_outputLanguageVoiceCodeValueName");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v75[10] = v63;
  v74[11] = CFSTR("root_siri_language_outputLanguageGenderCodeValueName");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v75[11] = v62;
  v74[12] = CFSTR("root_siri_language_voiceNameValueName");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v75[12] = v61;
  v74[13] = CFSTR("root_siri_language_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v75[13] = v60;
  v74[14] = CFSTR("root_siri_language_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v75[14] = v59;
  v74[15] = CFSTR("root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v75[15] = v58;
  v74[16] = CFSTR("root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v75[16] = v57;
  v74[17] = CFSTR("root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v75[17] = v56;
  v74[18] = CFSTR("root_locationServices_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v75[18] = v55;
  v74[19] = CFSTR("root_locationServices_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v75[19] = v54;
  v74[20] = CFSTR("root_locationServices_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v75[20] = v53;
  v74[21] = CFSTR("root_doorbellChime_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v75[21] = v52;
  v74[22] = CFSTR("root_doorbellChime_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v75[22] = v51;
  v74[23] = CFSTR("root_doorbellChime_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v75[23] = v50;
  v74[24] = CFSTR("root_announce_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v75[24] = v49;
  v74[25] = CFSTR("root_announce_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v75[25] = v48;
  v74[26] = CFSTR("root_announce_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v75[26] = v47;
  v74[27] = CFSTR("root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v75[27] = v46;
  v74[28] = CFSTR("root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v75[28] = v45;
  v74[29] = CFSTR("root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v75[29] = v44;
  v74[30] = CFSTR("root_general_accessibility_vision_voiceOver_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v75[30] = v43;
  v74[31] = CFSTR("root_general_accessibility_vision_voiceOver_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v75[31] = v42;
  v74[32] = CFSTR("root_general_accessibility_vision_voiceOver_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v75[32] = v41;
  v74[33] = CFSTR("root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v75[33] = v40;
  v74[34] = CFSTR("root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v75[34] = v39;
  v74[35] = CFSTR("root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v75[35] = v38;
  v74[36] = CFSTR("root_general_accessibility_vision_speakingRateSection_speakingRate_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v75[36] = v37;
  v74[37] = CFSTR("root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v75[37] = v36;
  v74[38] = CFSTR("root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v75[38] = v35;
  v74[39] = CFSTR("root_general_accessibility_interaction_holdDuration_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v75[39] = v34;
  v74[40] = CFSTR("root_general_accessibility_interaction_holdDuration_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v75[40] = v33;
  v74[41] = CFSTR("root_general_accessibility_interaction_holdDuration_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v75[41] = v32;
  v74[42] = CFSTR("root_general_accessibility_interaction_holdDuration_seconds_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v75[42] = v31;
  v74[43] = CFSTR("root_general_accessibility_interaction_holdDuration_seconds_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v75[43] = v30;
  v74[44] = CFSTR("root_general_accessibility_interaction_holdDuration_seconds_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v75[44] = v29;
  v74[45] = CFSTR("root_general_accessibility_interaction_touchAccommodations_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v75[45] = v28;
  v74[46] = CFSTR("root_general_accessibility_interaction_touchAccommodations_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v75[46] = v27;
  v74[47] = CFSTR("root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v75[47] = v26;
  v74[48] = CFSTR("root_general_accessibility_interaction_ignoreRepeat_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75[48] = v25;
  v74[49] = CFSTR("root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v75[49] = v24;
  v74[50] = CFSTR("root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v75[50] = v23;
  v74[51] = CFSTR("root_general_accessibility_interaction_ignoreRepeat_seconds_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v75[51] = v22;
  v74[52] = CFSTR("root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v75[52] = v21;
  v74[53] = CFSTR("root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v75[53] = v20;
  v74[54] = CFSTR("root_general_analytics_shareSiriAnalytics_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v75[54] = v19;
  v74[55] = CFSTR("root_general_analytics_shareSiriAnalytics_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v75[55] = v18;
  v74[56] = CFSTR("root_general_analytics_shareSiriAnalytics_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v75[56] = v17;
  v74[57] = CFSTR("root_general_analytics_shareSpeakerAnalytics_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v75[57] = v16;
  v74[58] = CFSTR("root_general_analytics_shareSpeakerAnalytics_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v75[58] = v15;
  v74[59] = CFSTR("root_general_analytics_shareSpeakerAnalytics_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v75[59] = v14;
  v74[60] = CFSTR("root_music_allowExplicitContent_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v75[60] = v13;
  v74[61] = CFSTR("root_music_allowExplicitContent_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v75[61] = v12;
  v74[62] = CFSTR("root_music_allowExplicitContent_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v75[62] = v11;
  v74[63] = CFSTR("root_airPlay_airPlayEnabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v75[63] = v0;
  v74[64] = CFSTR("root_airPlay_airPlayEnabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v75[64] = v1;
  v74[65] = CFSTR("root_airPlay_airPlayEnabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v75[65] = v2;
  v74[66] = CFSTR("root_siriEndpoint_enabled_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v75[66] = v3;
  v74[67] = CFSTR("root_siriEndpoint_enabled_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v75[67] = v4;
  v74[68] = CFSTR("root_siriEndpoint_enabled_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v75[68] = v5;
  v74[69] = CFSTR("root_general_accessibility_interaction_tapAssistance_selection_value");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v75[69] = v6;
  v74[70] = CFSTR("root_general_accessibility_interaction_tapAssistance_selection_readVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v75[70] = v7;
  v74[71] = CFSTR("root_general_accessibility_interaction_tapAssistance_selection_writeVersion");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v75[71] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 72);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)hmbProperties_properties_114642;
  hmbProperties_properties_114642 = v9;

}

- (id)keyPathsToSettings
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMDCompositeBoolSetting *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HMDCompositeBoolSetting *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDCompositeBoolSetting *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HMDCompositeBoolSetting *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  HMDCompositeBoolSetting *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  HMDCompositeBoolSetting *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  HMDCompositeLanguageSetting *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDCompositeLanguageSetting *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  HMDCompositeBoolSetting *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  HMDCompositeBoolSetting *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  HMDCompositeBoolSetting *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  HMDCompositeBoolSetting *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  HMDCompositeBoolSetting *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  HMDCompositeBoolSetting *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  HMDCompositeBoolSetting *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  HMDCompositeBoolSetting *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  HMDCompositeNumberSetting *v93;
  void *v94;
  void *v95;
  HMDCompositeNumberSetting *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  HMDCompositeBoolSetting *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  HMDCompositeBoolSetting *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  HMDCompositeBoolSetting *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  HMDCompositeBoolSetting *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  HMDCompositeNumberSetting *v122;
  void *v123;
  void *v124;
  HMDCompositeNumberSetting *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  HMDCompositeBoolSetting *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  HMDCompositeBoolSetting *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  HMDCompositeNumberSetting *v141;
  void *v142;
  void *v143;
  HMDCompositeNumberSetting *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  HMDCompositeBoolSetting *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  HMDCompositeBoolSetting *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  HMDCompositeBoolSetting *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  HMDCompositeBoolSetting *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  HMDCompositeNumberSetting *v170;
  void *v171;
  void *v172;
  HMDCompositeNumberSetting *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  HMDCompositeBoolSetting *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  HMDCompositeBoolSetting *v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  HMDCompositeBoolSetting *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  HMDCompositeBoolSetting *v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  HMDCompositeBoolSetting *v199;
  uint64_t v200;
  void *v201;
  void *v202;
  HMDCompositeBoolSetting *v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  HMDCompositeBoolSetting *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  HMDCompositeBoolSetting *v213;
  uint64_t v214;
  void *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  HMDCompositeBoolSetting *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  HMDCompositeBoolSetting *v223;
  void *v224;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_value](self, "root_siri_soundAlert_value");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_readVersion](self, "root_siri_soundAlert_readVersion");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_writeVersion](self, "root_siri_soundAlert_writeVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_6;
      v9 = [HMDCompositeBoolSetting alloc];
      -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_value](self, "root_siri_soundAlert_value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "BOOLValue");
      -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_readVersion](self, "root_siri_soundAlert_readVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_writeVersion](self, "root_siri_soundAlert_writeVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v9, "initWithValue:readVersion:writeVersion:", v10, v11, v12);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("root.siri.soundAlert"));

    }
  }
LABEL_6:
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_value](self, "root_siri_lightWhenUsingSiri_value");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_11;
  v15 = (void *)v14;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_readVersion](self, "root_siri_lightWhenUsingSiri_readVersion");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_writeVersion](self, "root_siri_lightWhenUsingSiri_writeVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_11;
    v19 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_value](self, "root_siri_lightWhenUsingSiri_value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_readVersion](self, "root_siri_lightWhenUsingSiri_readVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_writeVersion](self, "root_siri_lightWhenUsingSiri_writeVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v19, "initWithValue:readVersion:writeVersion:", v20, v21, v22);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("root.siri.lightWhenUsingSiri"));

  }
LABEL_11:
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_value](self, "root_siri_siriEnabled_value");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_16;
  v25 = (void *)v24;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_readVersion](self, "root_siri_siriEnabled_readVersion");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_writeVersion](self, "root_siri_siriEnabled_writeVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_16;
    v29 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_value](self, "root_siri_siriEnabled_value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v25, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_readVersion](self, "root_siri_siriEnabled_readVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_writeVersion](self, "root_siri_siriEnabled_writeVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v29, "initWithValue:readVersion:writeVersion:", v30, v31, v32);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("root.siri.siriEnabled"));

  }
LABEL_16:
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_readVersion](self, "root_siri_language_readVersion");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
    goto LABEL_25;
  v35 = (void *)v34;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_writeVersion](self, "root_siri_language_writeVersion");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_inputLanguageCodeValueName](self, "root_siri_language_inputLanguageCodeValueName");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)v38;
      -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageVoiceCodeValueName](self, "root_siri_language_outputLanguageVoiceCodeValueName");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = (void *)v40;
        -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageGenderCodeValueName](self, "root_siri_language_outputLanguageGenderCodeValueName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
          goto LABEL_25;
        v43 = [HMDCompositeLanguageSetting alloc];
        -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_inputLanguageCodeValueName](self, "root_siri_language_inputLanguageCodeValueName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageVoiceCodeValueName](self, "root_siri_language_outputLanguageVoiceCodeValueName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageGenderCodeValueName](self, "root_siri_language_outputLanguageGenderCodeValueName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_voiceNameValueName](self, "root_siri_language_voiceNameValueName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_readVersion](self, "root_siri_language_readVersion");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_writeVersion](self, "root_siri_language_writeVersion");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[HMDCompositeLanguageSetting initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:](v43, "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:", v35, v37, v39, v44, v45, v46);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("root.siri.language"));

      }
    }

  }
LABEL_25:
  -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
  v48 = objc_claimAutoreleasedReturnValue();
  if (!v48)
    goto LABEL_30;
  v49 = (void *)v48;
  -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
      goto LABEL_30;
    v53 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v49, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v53, "initWithValue:readVersion:writeVersion:", v54, v55, v56);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning"));

  }
LABEL_30:
  -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_value](self, "root_locationServices_enabled_value");
  v58 = objc_claimAutoreleasedReturnValue();
  if (!v58)
    goto LABEL_35;
  v59 = (void *)v58;
  -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_readVersion](self, "root_locationServices_enabled_readVersion");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_writeVersion](self, "root_locationServices_enabled_writeVersion");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v62)
      goto LABEL_35;
    v63 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_value](self, "root_locationServices_enabled_value");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v59, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_readVersion](self, "root_locationServices_enabled_readVersion");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_writeVersion](self, "root_locationServices_enabled_writeVersion");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v63, "initWithValue:readVersion:writeVersion:", v64, v65, v66);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("root.locationServices.enabled"));

  }
LABEL_35:
  -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_value](self, "root_doorbellChime_enabled_value");
  v68 = objc_claimAutoreleasedReturnValue();
  if (!v68)
    goto LABEL_40;
  v69 = (void *)v68;
  -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_readVersion](self, "root_doorbellChime_enabled_readVersion");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = (void *)v70;
    -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_writeVersion](self, "root_doorbellChime_enabled_writeVersion");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v72)
      goto LABEL_40;
    v73 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_value](self, "root_doorbellChime_enabled_value");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v69, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_readVersion](self, "root_doorbellChime_enabled_readVersion");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_writeVersion](self, "root_doorbellChime_enabled_writeVersion");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v73, "initWithValue:readVersion:writeVersion:", v74, v75, v76);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("root.doorbellChime.enabled"));

  }
LABEL_40:
  -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_value](self, "root_announce_enabled_value");
  v78 = objc_claimAutoreleasedReturnValue();
  if (!v78)
    goto LABEL_45;
  v79 = (void *)v78;
  -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_readVersion](self, "root_announce_enabled_readVersion");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_writeVersion](self, "root_announce_enabled_writeVersion");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v82)
      goto LABEL_45;
    v83 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_value](self, "root_announce_enabled_value");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v79, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_readVersion](self, "root_announce_enabled_readVersion");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_writeVersion](self, "root_announce_enabled_writeVersion");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v83, "initWithValue:readVersion:writeVersion:", v84, v85, v86);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("root.announce.enabled"));

  }
LABEL_45:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
  v88 = objc_claimAutoreleasedReturnValue();
  if (!v88)
    goto LABEL_50;
  v89 = (void *)v88;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v92)
      goto LABEL_50;
    v93 = [HMDCompositeNumberSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v93, "initWithValue:readVersion:writeVersion:", v89, v94, v95);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"));

  }
LABEL_50:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_value](self, "root_general_accessibility_vision_voiceOver_enabled_value");
  v97 = objc_claimAutoreleasedReturnValue();
  if (!v97)
    goto LABEL_55;
  v98 = (void *)v97;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_readVersion](self, "root_general_accessibility_vision_voiceOver_enabled_readVersion");
  v99 = objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = (void *)v99;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_enabled_writeVersion");
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v101)
      goto LABEL_55;
    v102 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_value](self, "root_general_accessibility_vision_voiceOver_enabled_value");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v98, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_readVersion](self, "root_general_accessibility_vision_voiceOver_enabled_readVersion");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_enabled_writeVersion");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v102, "initWithValue:readVersion:writeVersion:", v103, v104, v105);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v106, CFSTR("root.general.accessibility.vision.voiceOver.enabled"));

  }
LABEL_55:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
  v107 = objc_claimAutoreleasedReturnValue();
  if (!v107)
    goto LABEL_60;
  v108 = (void *)v107;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion");
  v109 = objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    v110 = (void *)v109;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion");
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v111)
      goto LABEL_60;
    v112 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v108, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v112, "initWithValue:readVersion:writeVersion:", v113, v114, v115);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("root.general.accessibility.vision.voiceOver.audioDuckingEnabled"));

  }
LABEL_60:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_value](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
  v117 = objc_claimAutoreleasedReturnValue();
  if (!v117)
    goto LABEL_65;
  v118 = (void *)v117;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion");
  v119 = objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    v120 = (void *)v119;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion");
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v121)
      goto LABEL_65;
    v122 = [HMDCompositeNumberSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_value](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v122, "initWithValue:readVersion:writeVersion:", v118, v123, v124);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("root.general.accessibility.vision.speakingRateSection.speakingRate"));

  }
LABEL_65:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_value](self, "root_general_accessibility_interaction_holdDuration_enabled_value");
  v126 = objc_claimAutoreleasedReturnValue();
  if (!v126)
    goto LABEL_70;
  v127 = (void *)v126;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_readVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_readVersion");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_writeVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_writeVersion");
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v130)
      goto LABEL_70;
    v131 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_value](self, "root_general_accessibility_interaction_holdDuration_enabled_value");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v127, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_readVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_readVersion");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_writeVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_writeVersion");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v131, "initWithValue:readVersion:writeVersion:", v132, v133, v134);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v135, CFSTR("root.general.accessibility.interaction.holdDuration.enabled"));

  }
LABEL_70:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_value](self, "root_general_accessibility_interaction_holdDuration_seconds_value");
  v136 = objc_claimAutoreleasedReturnValue();
  if (!v136)
    goto LABEL_75;
  v137 = (void *)v136;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_readVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_readVersion");
  v138 = objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    v139 = (void *)v138;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_writeVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_writeVersion");
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v140)
      goto LABEL_75;
    v141 = [HMDCompositeNumberSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_value](self, "root_general_accessibility_interaction_holdDuration_seconds_value");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_readVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_readVersion");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_writeVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_writeVersion");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v141, "initWithValue:readVersion:writeVersion:", v137, v142, v143);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v144, CFSTR("root.general.accessibility.interaction.holdDuration.seconds"));

  }
LABEL_75:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_value](self, "root_general_accessibility_interaction_touchAccommodations_enabled_value");
  v145 = objc_claimAutoreleasedReturnValue();
  if (!v145)
    goto LABEL_80;
  v146 = (void *)v145;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_readVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_readVersion");
  v147 = objc_claimAutoreleasedReturnValue();
  if (v147)
  {
    v148 = (void *)v147;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion");
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v149)
      goto LABEL_80;
    v150 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_value](self, "root_general_accessibility_interaction_touchAccommodations_enabled_value");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v146, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_readVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_readVersion");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v150, "initWithValue:readVersion:writeVersion:", v151, v152, v153);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v154, CFSTR("root.general.accessibility.interaction.touchAccommodations.enabled"));

  }
LABEL_80:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_value](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
  v155 = objc_claimAutoreleasedReturnValue();
  if (!v155)
    goto LABEL_85;
  v156 = (void *)v155;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion");
  v157 = objc_claimAutoreleasedReturnValue();
  if (v157)
  {
    v158 = (void *)v157;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion");
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v159)
      goto LABEL_85;
    v160 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_value](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = objc_msgSend(v156, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v160, "initWithValue:readVersion:writeVersion:", v161, v162, v163);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v164, CFSTR("root.general.accessibility.interaction.ignoreRepeat.enabled"));

  }
LABEL_85:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_value](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
  v165 = objc_claimAutoreleasedReturnValue();
  if (!v165)
    goto LABEL_90;
  v166 = (void *)v165;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion");
  v167 = objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    v168 = (void *)v167;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion");
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v169)
      goto LABEL_90;
    v170 = [HMDCompositeNumberSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_value](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v170, "initWithValue:readVersion:writeVersion:", v166, v171, v172);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v173, CFSTR("root.general.accessibility.interaction.ignoreRepeat.seconds"));

  }
LABEL_90:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_value](self, "root_general_analytics_shareSiriAnalytics_value");
  v174 = objc_claimAutoreleasedReturnValue();
  if (!v174)
    goto LABEL_95;
  v175 = (void *)v174;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_readVersion](self, "root_general_analytics_shareSiriAnalytics_readVersion");
  v176 = objc_claimAutoreleasedReturnValue();
  if (v176)
  {
    v177 = (void *)v176;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_writeVersion](self, "root_general_analytics_shareSiriAnalytics_writeVersion");
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v178)
      goto LABEL_95;
    v179 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_value](self, "root_general_analytics_shareSiriAnalytics_value");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend(v175, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_readVersion](self, "root_general_analytics_shareSiriAnalytics_readVersion");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_writeVersion](self, "root_general_analytics_shareSiriAnalytics_writeVersion");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v179, "initWithValue:readVersion:writeVersion:", v180, v181, v182);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v183, CFSTR("root.general.analytics.shareSiriAnalytics"));

  }
LABEL_95:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_value](self, "root_general_analytics_shareSpeakerAnalytics_value");
  v184 = objc_claimAutoreleasedReturnValue();
  if (!v184)
    goto LABEL_100;
  v185 = (void *)v184;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_readVersion](self, "root_general_analytics_shareSpeakerAnalytics_readVersion");
  v186 = objc_claimAutoreleasedReturnValue();
  if (v186)
  {
    v187 = (void *)v186;
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_writeVersion](self, "root_general_analytics_shareSpeakerAnalytics_writeVersion");
    v188 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v188)
      goto LABEL_100;
    v189 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_value](self, "root_general_analytics_shareSpeakerAnalytics_value");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = objc_msgSend(v185, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_readVersion](self, "root_general_analytics_shareSpeakerAnalytics_readVersion");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_writeVersion](self, "root_general_analytics_shareSpeakerAnalytics_writeVersion");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v189, "initWithValue:readVersion:writeVersion:", v190, v191, v192);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v193, CFSTR("root.general.analytics.shareSpeakerAnalytics"));

  }
LABEL_100:
  -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_value](self, "root_music_allowExplicitContent_value");
  v194 = objc_claimAutoreleasedReturnValue();
  if (!v194)
    goto LABEL_105;
  v195 = (void *)v194;
  -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_readVersion](self, "root_music_allowExplicitContent_readVersion");
  v196 = objc_claimAutoreleasedReturnValue();
  if (v196)
  {
    v197 = (void *)v196;
    -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_writeVersion](self, "root_music_allowExplicitContent_writeVersion");
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v198)
      goto LABEL_105;
    v199 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_value](self, "root_music_allowExplicitContent_value");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_msgSend(v195, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_readVersion](self, "root_music_allowExplicitContent_readVersion");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_writeVersion](self, "root_music_allowExplicitContent_writeVersion");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v199, "initWithValue:readVersion:writeVersion:", v200, v201, v202);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v203, CFSTR("root.music.allowExplicitContent"));

  }
LABEL_105:
  -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_value](self, "root_airPlay_airPlayEnabled_value");
  v204 = objc_claimAutoreleasedReturnValue();
  if (!v204)
    goto LABEL_110;
  v205 = (void *)v204;
  -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_readVersion](self, "root_airPlay_airPlayEnabled_readVersion");
  v206 = objc_claimAutoreleasedReturnValue();
  if (v206)
  {
    v207 = (void *)v206;
    -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_writeVersion](self, "root_airPlay_airPlayEnabled_writeVersion");
    v208 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v208)
      goto LABEL_110;
    v209 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_value](self, "root_airPlay_airPlayEnabled_value");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = objc_msgSend(v205, "BOOLValue");
    -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_readVersion](self, "root_airPlay_airPlayEnabled_readVersion");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_writeVersion](self, "root_airPlay_airPlayEnabled_writeVersion");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v209, "initWithValue:readVersion:writeVersion:", v210, v211, v212);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v213, CFSTR("root.airPlay.airPlayEnabled"));

  }
LABEL_110:
  -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_value](self, "root_siriEndpoint_enabled_value");
  v214 = objc_claimAutoreleasedReturnValue();
  if (v214)
  {
    v215 = (void *)v214;
    -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_readVersion](self, "root_siriEndpoint_enabled_readVersion");
    v216 = objc_claimAutoreleasedReturnValue();
    if (!v216)
    {
LABEL_114:

      goto LABEL_115;
    }
    v217 = (void *)v216;
    -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_writeVersion](self, "root_siriEndpoint_enabled_writeVersion");
    v218 = (void *)objc_claimAutoreleasedReturnValue();

    if (v218)
    {
      v219 = [HMDCompositeBoolSetting alloc];
      -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_value](self, "root_siriEndpoint_enabled_value");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v220 = objc_msgSend(v215, "BOOLValue");
      -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_readVersion](self, "root_siriEndpoint_enabled_readVersion");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_writeVersion](self, "root_siriEndpoint_enabled_writeVersion");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v219, "initWithValue:readVersion:writeVersion:", v220, v221, v222);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v223, CFSTR("root.siriEndpoint.enabled"));

      goto LABEL_114;
    }
  }
LABEL_115:
  v224 = (void *)objc_msgSend(v3, "copy");

  return v224;
}

- (id)keyPathsToSettingMetadata
{
  id v2;
  HMDCompositeSettingPrivileges *v3;
  HMDCompositeSettingMetadata *v4;
  HMDCompositeSettingPrivileges *v5;
  HMDCompositeSettingMetadata *v6;
  HMDCompositeSettingPrivileges *v7;
  HMDCompositeSettingMetadata *v8;
  HMDCompositeSettingPrivileges *v9;
  HMDCompositeSettingMetadata *v10;
  HMDCompositeSettingPrivileges *v11;
  HMDCompositeSettingMetadata *v12;
  HMDCompositeSettingPrivileges *v13;
  HMDCompositeSettingMetadata *v14;
  HMDCompositeSettingPrivileges *v15;
  HMDCompositeSettingMetadata *v16;
  HMDCompositeSettingPrivileges *v17;
  HMDCompositeSettingMetadata *v18;
  HMDCompositeSettingIntegerConstraint *v19;
  HMDCompositeSettingPrivileges *v20;
  HMDCompositeSettingMetadata *v21;
  HMDCompositeSettingPrivileges *v22;
  HMDCompositeSettingMetadata *v23;
  HMDCompositeSettingPrivileges *v24;
  HMDCompositeSettingMetadata *v25;
  HMDCompositeSettingIntegerConstraint *v26;
  HMDCompositeSettingPrivileges *v27;
  HMDCompositeSettingMetadata *v28;
  HMDCompositeSettingPrivileges *v29;
  HMDCompositeSettingMetadata *v30;
  HMDCompositeSettingIntegerConstraint *v31;
  HMDCompositeSettingPrivileges *v32;
  HMDCompositeSettingMetadata *v33;
  HMDCompositeSettingPrivileges *v34;
  HMDCompositeSettingMetadata *v35;
  HMDCompositeSettingPrivileges *v36;
  HMDCompositeSettingMetadata *v37;
  HMDCompositeSettingIntegerConstraint *v38;
  HMDCompositeSettingPrivileges *v39;
  HMDCompositeSettingMetadata *v40;
  HMDCompositeSettingPrivileges *v41;
  HMDCompositeSettingMetadata *v42;
  HMDCompositeSettingPrivileges *v43;
  HMDCompositeSettingMetadata *v44;
  HMDCompositeSettingPrivileges *v45;
  HMDCompositeSettingMetadata *v46;
  HMDCompositeSettingPrivileges *v47;
  HMDCompositeSettingMetadata *v48;
  HMDCompositeSettingPrivileges *v49;
  HMDCompositeSettingMetadata *v50;
  void *v51;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v4 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.siri.soundAlert"), 0, v3);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("root.siri.soundAlert"));

  v5 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v6 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.siri.lightWhenUsingSiri"), 0, v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("root.siri.lightWhenUsingSiri"));

  v7 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v8 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.siri.siriEnabled"), 0, v7);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("root.siri.siriEnabled"));

  v9 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 0);
  v10 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.siri.language"), 0, v9);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("root.siri.language"));

  v11 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v12 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning"), 0, v11);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning"));

  v13 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v14 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.locationServices.enabled"), 0, v13);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("root.locationServices.enabled"));

  v15 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v16 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.doorbellChime.enabled"), 0, v15);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("root.doorbellChime.enabled"));

  v17 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 0);
  v18 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.announce.enabled"), 0, v17);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("root.announce.enabled"));

  v19 = -[HMDCompositeSettingIntegerConstraint initWithMaxValue:minValue:stepValue:]([HMDCompositeSettingIntegerConstraint alloc], "initWithMaxValue:minValue:stepValue:", 50, 20, 5);
  v20 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v21 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"), v19, v20);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"));

  v22 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v23 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.vision.voiceOver.enabled"), 0, v22);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("root.general.accessibility.vision.voiceOver.enabled"));

  v24 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v25 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.vision.voiceOver.audioDuckingEnabled"), 0, v24);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("root.general.accessibility.vision.voiceOver.audioDuckingEnabled"));

  v26 = -[HMDCompositeSettingIntegerConstraint initWithMaxValue:minValue:stepValue:]([HMDCompositeSettingIntegerConstraint alloc], "initWithMaxValue:minValue:stepValue:", 400, 0, 10);
  v27 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v28 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.vision.speakingRateSection.speakingRate"), v26, v27);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("root.general.accessibility.vision.speakingRateSection.speakingRate"));

  v29 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v30 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.interaction.holdDuration.enabled"), 0, v29);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v30, CFSTR("root.general.accessibility.interaction.holdDuration.enabled"));

  v31 = -[HMDCompositeSettingIntegerConstraint initWithMaxValue:minValue:stepValue:]([HMDCompositeSettingIntegerConstraint alloc], "initWithMaxValue:minValue:stepValue:", 400, 10, 10);
  v32 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v33 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.interaction.holdDuration.seconds"), v31, v32);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v33, CFSTR("root.general.accessibility.interaction.holdDuration.seconds"));

  v34 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v35 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.interaction.touchAccommodations.enabled"), 0, v34);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v35, CFSTR("root.general.accessibility.interaction.touchAccommodations.enabled"));

  v36 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v37 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.interaction.ignoreRepeat.enabled"), 0, v36);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v37, CFSTR("root.general.accessibility.interaction.ignoreRepeat.enabled"));

  v38 = -[HMDCompositeSettingIntegerConstraint initWithMaxValue:minValue:stepValue:]([HMDCompositeSettingIntegerConstraint alloc], "initWithMaxValue:minValue:stepValue:", 400, 10, 10);
  v39 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v40 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.accessibility.interaction.ignoreRepeat.seconds"), v38, v39);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v40, CFSTR("root.general.accessibility.interaction.ignoreRepeat.seconds"));

  v41 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v42 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.analytics.shareSiriAnalytics"), 0, v41);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v42, CFSTR("root.general.analytics.shareSiriAnalytics"));

  v43 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v44 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.general.analytics.shareSpeakerAnalytics"), 0, v43);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v44, CFSTR("root.general.analytics.shareSpeakerAnalytics"));

  v45 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v46 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.music.allowExplicitContent"), 0, v45);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v46, CFSTR("root.music.allowExplicitContent"));

  v47 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v48 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.airPlay.airPlayEnabled"), 0, v47);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v48, CFSTR("root.airPlay.airPlayEnabled"));

  v49 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
  v50 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:]([HMDCompositeSettingMetadata alloc], "initWithKeyPath:constraint:privileges:", CFSTR("root.siriEndpoint.enabled"), 0, v49);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v50, CFSTR("root.siriEndpoint.enabled"));

  v51 = (void *)objc_msgSend(v2, "copy");
  return v51;
}

- (id)keyPathsToSettingsForMigration
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HMDCompositeBoolSetting *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  HMDCompositeBoolSetting *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  HMDCompositeBoolSetting *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  int v51;
  HMDCompositeBoolSetting *v52;
  HMDCompositeBoolSetting *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  HMDCompositeBoolSetting *v59;
  HMDCompositeBoolSetting *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  int v65;
  HMDCompositeBoolSetting *v66;
  HMDCompositeBoolSetting *v67;
  HMDCompositeLanguageSetting *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  HMDCompositeBoolSetting *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  HMDCompositeBoolSetting *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  HMDCompositeBoolSetting *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  HMDCompositeBoolSetting *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  HMDCompositeNumberSetting *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  HMDCompositeBoolSetting *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  HMDCompositeBoolSetting *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  HMDCompositeNumberSetting *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  HMDCompositeBoolSetting *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  HMDCompositeNumberSetting *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  void *v176;
  void *v177;
  HMDCompositeBoolSetting *v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  void *v186;
  void *v187;
  HMDCompositeBoolSetting *v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  void *v196;
  void *v197;
  HMDCompositeNumberSetting *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  void *v206;
  void *v207;
  HMDCompositeBoolSetting *v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  void *v217;
  HMDCompositeBoolSetting *v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  void *v222;
  void *v223;
  void *v224;
  id v225;
  void *v226;
  void *v227;
  HMDCompositeBoolSetting *v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  void *v232;
  void *v233;
  void *v234;
  id v235;
  void *v236;
  void *v237;
  HMDCompositeBoolSetting *v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v243;
  void *v244;
  id v245;
  void *v246;
  void *v247;
  HMDCompositeBoolSetting *v248;
  void *v249;
  void *v251;
  id v252;
  void *v253;
  void *v254;
  int v255;
  HMDCompositeBoolSetting *v256;
  HMDCompositeBoolSetting *v257;
  void *v258;
  id v259;
  void *v260;
  void *v261;
  int v262;
  HMDCompositeBoolSetting *v263;
  HMDCompositeBoolSetting *v264;
  void *v265;
  id v266;
  void *v267;
  void *v268;
  int v269;
  HMDCompositeBoolSetting *v270;
  HMDCompositeBoolSetting *v271;
  void *v272;
  id v273;
  void *v274;
  void *v275;
  int v276;
  HMDCompositeBoolSetting *v277;
  HMDCompositeBoolSetting *v278;
  void *v279;
  id v280;
  void *v281;
  void *v282;
  int v283;
  HMDCompositeNumberSetting *v284;
  HMDCompositeNumberSetting *v285;
  void *v286;
  id v287;
  void *v288;
  void *v289;
  int v290;
  HMDCompositeBoolSetting *v291;
  HMDCompositeBoolSetting *v292;
  void *v293;
  id v294;
  void *v295;
  void *v296;
  int v297;
  HMDCompositeBoolSetting *v298;
  HMDCompositeBoolSetting *v299;
  void *v300;
  id v301;
  void *v302;
  void *v303;
  int v304;
  HMDCompositeNumberSetting *v305;
  HMDCompositeNumberSetting *v306;
  void *v307;
  id v308;
  void *v309;
  void *v310;
  int v311;
  HMDCompositeBoolSetting *v312;
  HMDCompositeBoolSetting *v313;
  void *v314;
  id v315;
  void *v316;
  void *v317;
  int v318;
  HMDCompositeNumberSetting *v319;
  HMDCompositeNumberSetting *v320;
  void *v321;
  id v322;
  void *v323;
  void *v324;
  int v325;
  HMDCompositeBoolSetting *v326;
  HMDCompositeBoolSetting *v327;
  void *v328;
  id v329;
  void *v330;
  void *v331;
  int v332;
  HMDCompositeBoolSetting *v333;
  HMDCompositeBoolSetting *v334;
  void *v335;
  id v336;
  void *v337;
  void *v338;
  int v339;
  HMDCompositeNumberSetting *v340;
  HMDCompositeNumberSetting *v341;
  void *v342;
  id v343;
  void *v344;
  void *v345;
  int v346;
  HMDCompositeBoolSetting *v347;
  HMDCompositeBoolSetting *v348;
  void *v349;
  id v350;
  void *v351;
  void *v352;
  int v353;
  HMDCompositeBoolSetting *v354;
  HMDCompositeBoolSetting *v355;
  void *v356;
  id v357;
  void *v358;
  void *v359;
  int v360;
  HMDCompositeBoolSetting *v361;
  HMDCompositeBoolSetting *v362;
  void *v363;
  id v364;
  void *v365;
  void *v366;
  int v367;
  HMDCompositeBoolSetting *v368;
  HMDCompositeBoolSetting *v369;
  void *v370;
  id v371;
  void *v372;
  void *v373;
  int v374;
  HMDCompositeBoolSetting *v375;
  HMDCompositeBoolSetting *v376;
  void *v377;
  id v378;
  void *v379;
  void *v380;
  int v381;
  HMDCompositeLanguageSetting *v382;
  void *v383;
  void *v384;
  void *v385;
  HMDCompositeLanguageSetting *v386;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_value](self, "root_siri_soundAlert_value");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  v5 = (void *)v4;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_readVersion](self, "root_siri_soundAlert_readVersion");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_7;
  }
  v7 = (void *)v6;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_writeVersion](self, "root_siri_soundAlert_writeVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_7:
    v13 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("root.siri.soundAlert"));
    goto LABEL_8;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v10 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_readVersion](self, "root_siri_soundAlert_readVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithVersionString:", v11);
  if (objc_msgSend(v9, "isGreaterThanVersion:", v12))
  {

  }
  else
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v48 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_writeVersion](self, "root_siri_soundAlert_writeVersion");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v48, "initWithVersionString:", v49);
    v51 = objc_msgSend(v47, "isGreaterThanVersion:", v50);

    if (!v51)
      goto LABEL_9;
  }
  v52 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_soundAlert_value](self, "root_siri_soundAlert_value");
  v13 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v53 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v52, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v13, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("root.siri.soundAlert"));

LABEL_8:
LABEL_9:
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_value](self, "root_siri_lightWhenUsingSiri_value");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_15;
  v15 = (void *)v14;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_readVersion](self, "root_siri_lightWhenUsingSiri_readVersion");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {

    goto LABEL_15;
  }
  v17 = (void *)v16;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_writeVersion](self, "root_siri_lightWhenUsingSiri_writeVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_15:
    v23 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("root.siri.lightWhenUsingSiri"));
    goto LABEL_16;
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v20 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_readVersion](self, "root_siri_lightWhenUsingSiri_readVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithVersionString:", v21);
  if (objc_msgSend(v19, "isGreaterThanVersion:", v22))
  {

  }
  else
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v55 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_writeVersion](self, "root_siri_lightWhenUsingSiri_writeVersion");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v55, "initWithVersionString:", v56);
    v58 = objc_msgSend(v54, "isGreaterThanVersion:", v57);

    if (!v58)
      goto LABEL_17;
  }
  v59 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_lightWhenUsingSiri_value](self, "root_siri_lightWhenUsingSiri_value");
  v23 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v60 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v59, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v23, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("root.siri.lightWhenUsingSiri"));

LABEL_16:
LABEL_17:
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_value](self, "root_siri_siriEnabled_value");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_23;
  v25 = (void *)v24;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_readVersion](self, "root_siri_siriEnabled_readVersion");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {

    goto LABEL_23;
  }
  v27 = (void *)v26;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_writeVersion](self, "root_siri_siriEnabled_writeVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
LABEL_23:
    v33 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("root.siri.siriEnabled"));
LABEL_24:

    goto LABEL_25;
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v30 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_readVersion](self, "root_siri_siriEnabled_readVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithVersionString:", v31);
  if (objc_msgSend(v29, "isGreaterThanVersion:", v32))
  {

LABEL_37:
    v66 = [HMDCompositeBoolSetting alloc];
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_value](self, "root_siri_siriEnabled_value");
    v33 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
    v67 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v66, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v33, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("root.siri.siriEnabled"));

    goto LABEL_24;
  }
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v62 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_siriEnabled_writeVersion](self, "root_siri_siriEnabled_writeVersion");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v62, "initWithVersionString:", v63);
  v65 = objc_msgSend(v61, "isGreaterThanVersion:", v64);

  if (v65)
    goto LABEL_37;
LABEL_25:
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_inputLanguageCodeValueName](self, "root_siri_language_inputLanguageCodeValueName");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
LABEL_41:
    v68 = -[HMDCompositeLanguageSetting initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:]([HMDCompositeLanguageSetting alloc], "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:", CFSTR("en-US"), CFSTR("en-US"), CFSTR("f"), 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("root.siri.language"));
    goto LABEL_42;
  }
  v35 = (void *)v34;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_readVersion](self, "root_siri_language_readVersion");
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
LABEL_40:

    goto LABEL_41;
  }
  v37 = (void *)v36;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_writeVersion](self, "root_siri_language_writeVersion");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
LABEL_39:

    goto LABEL_40;
  }
  v39 = (void *)v38;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageVoiceCodeValueName](self, "root_siri_language_outputLanguageVoiceCodeValueName");
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40)
  {

    goto LABEL_39;
  }
  v41 = (void *)v40;
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageGenderCodeValueName](self, "root_siri_language_outputLanguageGenderCodeValueName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_41;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v44 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_readVersion](self, "root_siri_language_readVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v44, "initWithVersionString:", v45);
  if (objc_msgSend(v43, "isGreaterThanVersion:", v46))
  {

  }
  else
  {
    v377 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v378 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_writeVersion](self, "root_siri_language_writeVersion");
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    v380 = (void *)objc_msgSend(v378, "initWithVersionString:", v379);
    v381 = objc_msgSend(v377, "isGreaterThanVersion:", v380);

    if (!v381)
      goto LABEL_43;
  }
  v382 = [HMDCompositeLanguageSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_inputLanguageCodeValueName](self, "root_siri_language_inputLanguageCodeValueName");
  v68 = (HMDCompositeLanguageSetting *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageVoiceCodeValueName](self, "root_siri_language_outputLanguageVoiceCodeValueName");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_outputLanguageGenderCodeValueName](self, "root_siri_language_outputLanguageGenderCodeValueName");
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel root_siri_language_voiceNameValueName](self, "root_siri_language_voiceNameValueName");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v386 = -[HMDCompositeLanguageSetting initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:](v382, "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:", v68, v383, v384, v385, CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v386, CFSTR("root.siri.language"));

LABEL_42:
LABEL_43:
  -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
  v69 = objc_claimAutoreleasedReturnValue();
  if (!v69)
    goto LABEL_49;
  v70 = (void *)v69;
  -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion");
  v71 = objc_claimAutoreleasedReturnValue();
  if (!v71)
  {

    goto LABEL_49;
  }
  v72 = (void *)v71;
  -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
  {
LABEL_49:
    v78 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning"));
    goto LABEL_50;
  }
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v75 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v75, "initWithVersionString:", v76);
  if (objc_msgSend(v74, "isGreaterThanVersion:", v77))
  {

  }
  else
  {
    v251 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v252 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = (void *)objc_msgSend(v252, "initWithVersionString:", v253);
    v255 = objc_msgSend(v251, "isGreaterThanVersion:", v254);

    if (!v255)
      goto LABEL_51;
  }
  v256 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value](self, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
  v78 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v257 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v256, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v78, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v257, CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning"));

LABEL_50:
LABEL_51:
  -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_value](self, "root_locationServices_enabled_value");
  v79 = objc_claimAutoreleasedReturnValue();
  if (!v79)
    goto LABEL_57;
  v80 = (void *)v79;
  -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_readVersion](self, "root_locationServices_enabled_readVersion");
  v81 = objc_claimAutoreleasedReturnValue();
  if (!v81)
  {

    goto LABEL_57;
  }
  v82 = (void *)v81;
  -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_writeVersion](self, "root_locationServices_enabled_writeVersion");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v83)
  {
LABEL_57:
    v88 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("root.locationServices.enabled"));
    goto LABEL_58;
  }
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v85 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_readVersion](self, "root_locationServices_enabled_readVersion");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend(v85, "initWithVersionString:", v86);
  if (objc_msgSend(v84, "isGreaterThanVersion:", v87))
  {

  }
  else
  {
    v258 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v259 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_writeVersion](self, "root_locationServices_enabled_writeVersion");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = (void *)objc_msgSend(v259, "initWithVersionString:", v260);
    v262 = objc_msgSend(v258, "isGreaterThanVersion:", v261);

    if (!v262)
      goto LABEL_59;
  }
  v263 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_locationServices_enabled_value](self, "root_locationServices_enabled_value");
  v88 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v264 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v263, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v88, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v264, CFSTR("root.locationServices.enabled"));

LABEL_58:
LABEL_59:
  -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_value](self, "root_doorbellChime_enabled_value");
  v89 = objc_claimAutoreleasedReturnValue();
  if (!v89)
    goto LABEL_65;
  v90 = (void *)v89;
  -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_readVersion](self, "root_doorbellChime_enabled_readVersion");
  v91 = objc_claimAutoreleasedReturnValue();
  if (!v91)
  {

    goto LABEL_65;
  }
  v92 = (void *)v91;
  -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_writeVersion](self, "root_doorbellChime_enabled_writeVersion");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v93)
  {
LABEL_65:
    v98 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("root.doorbellChime.enabled"));
    goto LABEL_66;
  }
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v95 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_readVersion](self, "root_doorbellChime_enabled_readVersion");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)objc_msgSend(v95, "initWithVersionString:", v96);
  if (objc_msgSend(v94, "isGreaterThanVersion:", v97))
  {

  }
  else
  {
    v265 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v266 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_writeVersion](self, "root_doorbellChime_enabled_writeVersion");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = (void *)objc_msgSend(v266, "initWithVersionString:", v267);
    v269 = objc_msgSend(v265, "isGreaterThanVersion:", v268);

    if (!v269)
      goto LABEL_67;
  }
  v270 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_doorbellChime_enabled_value](self, "root_doorbellChime_enabled_value");
  v98 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v271 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v270, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v98, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v271, CFSTR("root.doorbellChime.enabled"));

LABEL_66:
LABEL_67:
  -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_value](self, "root_announce_enabled_value");
  v99 = objc_claimAutoreleasedReturnValue();
  if (!v99)
    goto LABEL_73;
  v100 = (void *)v99;
  -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_readVersion](self, "root_announce_enabled_readVersion");
  v101 = objc_claimAutoreleasedReturnValue();
  if (!v101)
  {

    goto LABEL_73;
  }
  v102 = (void *)v101;
  -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_writeVersion](self, "root_announce_enabled_writeVersion");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v103)
  {
LABEL_73:
    v108 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("root.announce.enabled"));
    goto LABEL_74;
  }
  v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v105 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_readVersion](self, "root_announce_enabled_readVersion");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (void *)objc_msgSend(v105, "initWithVersionString:", v106);
  if (objc_msgSend(v104, "isGreaterThanVersion:", v107))
  {

  }
  else
  {
    v272 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v273 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_writeVersion](self, "root_announce_enabled_writeVersion");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    v275 = (void *)objc_msgSend(v273, "initWithVersionString:", v274);
    v276 = objc_msgSend(v272, "isGreaterThanVersion:", v275);

    if (!v276)
      goto LABEL_75;
  }
  v277 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_announce_enabled_value](self, "root_announce_enabled_value");
  v108 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v278 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v277, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v108, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v278, CFSTR("root.announce.enabled"));

LABEL_74:
LABEL_75:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
  v109 = objc_claimAutoreleasedReturnValue();
  if (!v109)
    goto LABEL_81;
  v110 = (void *)v109;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion");
  v111 = objc_claimAutoreleasedReturnValue();
  if (!v111)
  {

    goto LABEL_81;
  }
  v112 = (void *)v111;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v113)
  {
LABEL_81:
    v118 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:]([HMDCompositeNumberSetting alloc], "initWithValue:readVersion:writeVersion:", &unk_24E96B510, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v118, CFSTR("root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"));
    goto LABEL_82;
  }
  v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v115 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)objc_msgSend(v115, "initWithVersionString:", v116);
  if (objc_msgSend(v114, "isGreaterThanVersion:", v117))
  {

  }
  else
  {
    v279 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v280 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = (void *)objc_msgSend(v280, "initWithVersionString:", v281);
    v283 = objc_msgSend(v279, "isGreaterThanVersion:", v282);

    if (!v283)
      goto LABEL_83;
  }
  v284 = [HMDCompositeNumberSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value](self, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
  v118 = (HMDCompositeNumberSetting *)objc_claimAutoreleasedReturnValue();
  v285 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v284, "initWithValue:readVersion:writeVersion:", v118, CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v285, CFSTR("root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"));

LABEL_82:
LABEL_83:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_value](self, "root_general_accessibility_vision_voiceOver_enabled_value");
  v119 = objc_claimAutoreleasedReturnValue();
  if (!v119)
    goto LABEL_89;
  v120 = (void *)v119;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_readVersion](self, "root_general_accessibility_vision_voiceOver_enabled_readVersion");
  v121 = objc_claimAutoreleasedReturnValue();
  if (!v121)
  {

    goto LABEL_89;
  }
  v122 = (void *)v121;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_enabled_writeVersion");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v123)
  {
LABEL_89:
    v128 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("root.general.accessibility.vision.voiceOver.enabled"));
    goto LABEL_90;
  }
  v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v125 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_readVersion](self, "root_general_accessibility_vision_voiceOver_enabled_readVersion");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)objc_msgSend(v125, "initWithVersionString:", v126);
  if (objc_msgSend(v124, "isGreaterThanVersion:", v127))
  {

  }
  else
  {
    v286 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v287 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_enabled_writeVersion");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = (void *)objc_msgSend(v287, "initWithVersionString:", v288);
    v290 = objc_msgSend(v286, "isGreaterThanVersion:", v289);

    if (!v290)
      goto LABEL_91;
  }
  v291 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_enabled_value](self, "root_general_accessibility_vision_voiceOver_enabled_value");
  v128 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v292 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v291, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v128, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v292, CFSTR("root.general.accessibility.vision.voiceOver.enabled"));

LABEL_90:
LABEL_91:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
  v129 = objc_claimAutoreleasedReturnValue();
  if (!v129)
    goto LABEL_97;
  v130 = (void *)v129;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion");
  v131 = objc_claimAutoreleasedReturnValue();
  if (!v131)
  {

    goto LABEL_97;
  }
  v132 = (void *)v131;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v133)
  {
LABEL_97:
    v138 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v138, CFSTR("root.general.accessibility.vision.voiceOver.audioDuckingEnabled"));
    goto LABEL_98;
  }
  v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v135 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (void *)objc_msgSend(v135, "initWithVersionString:", v136);
  if (objc_msgSend(v134, "isGreaterThanVersion:", v137))
  {

  }
  else
  {
    v293 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v294 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = (void *)objc_msgSend(v294, "initWithVersionString:", v295);
    v297 = objc_msgSend(v293, "isGreaterThanVersion:", v296);

    if (!v297)
      goto LABEL_99;
  }
  v298 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value](self, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
  v138 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v299 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v298, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v138, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v299, CFSTR("root.general.accessibility.vision.voiceOver.audioDuckingEnabled"));

LABEL_98:
LABEL_99:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_value](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
  v139 = objc_claimAutoreleasedReturnValue();
  if (!v139)
    goto LABEL_105;
  v140 = (void *)v139;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion");
  v141 = objc_claimAutoreleasedReturnValue();
  if (!v141)
  {

    goto LABEL_105;
  }
  v142 = (void *)v141;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion");
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v143)
  {
LABEL_105:
    v148 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:]([HMDCompositeNumberSetting alloc], "initWithValue:readVersion:writeVersion:", &unk_24E96B528, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v148, CFSTR("root.general.accessibility.vision.speakingRateSection.speakingRate"));
    goto LABEL_106;
  }
  v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v145 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = (void *)objc_msgSend(v145, "initWithVersionString:", v146);
  if (objc_msgSend(v144, "isGreaterThanVersion:", v147))
  {

  }
  else
  {
    v300 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v301 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    v303 = (void *)objc_msgSend(v301, "initWithVersionString:", v302);
    v304 = objc_msgSend(v300, "isGreaterThanVersion:", v303);

    if (!v304)
      goto LABEL_107;
  }
  v305 = [HMDCompositeNumberSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_vision_speakingRateSection_speakingRate_value](self, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
  v148 = (HMDCompositeNumberSetting *)objc_claimAutoreleasedReturnValue();
  v306 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v305, "initWithValue:readVersion:writeVersion:", v148, CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v306, CFSTR("root.general.accessibility.vision.speakingRateSection.speakingRate"));

LABEL_106:
LABEL_107:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_value](self, "root_general_accessibility_interaction_holdDuration_enabled_value");
  v149 = objc_claimAutoreleasedReturnValue();
  if (!v149)
    goto LABEL_113;
  v150 = (void *)v149;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_readVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_readVersion");
  v151 = objc_claimAutoreleasedReturnValue();
  if (!v151)
  {

    goto LABEL_113;
  }
  v152 = (void *)v151;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_writeVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_writeVersion");
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v153)
  {
LABEL_113:
    v158 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v158, CFSTR("root.general.accessibility.interaction.holdDuration.enabled"));
    goto LABEL_114;
  }
  v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v155 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_readVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_readVersion");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = (void *)objc_msgSend(v155, "initWithVersionString:", v156);
  if (objc_msgSend(v154, "isGreaterThanVersion:", v157))
  {

  }
  else
  {
    v307 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v308 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_writeVersion](self, "root_general_accessibility_interaction_holdDuration_enabled_writeVersion");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    v310 = (void *)objc_msgSend(v308, "initWithVersionString:", v309);
    v311 = objc_msgSend(v307, "isGreaterThanVersion:", v310);

    if (!v311)
      goto LABEL_115;
  }
  v312 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_enabled_value](self, "root_general_accessibility_interaction_holdDuration_enabled_value");
  v158 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v313 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v312, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v158, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v313, CFSTR("root.general.accessibility.interaction.holdDuration.enabled"));

LABEL_114:
LABEL_115:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_value](self, "root_general_accessibility_interaction_holdDuration_seconds_value");
  v159 = objc_claimAutoreleasedReturnValue();
  if (!v159)
    goto LABEL_121;
  v160 = (void *)v159;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_readVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_readVersion");
  v161 = objc_claimAutoreleasedReturnValue();
  if (!v161)
  {

    goto LABEL_121;
  }
  v162 = (void *)v161;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_writeVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_writeVersion");
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v163)
  {
LABEL_121:
    v168 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:]([HMDCompositeNumberSetting alloc], "initWithValue:readVersion:writeVersion:", &unk_24E96B540, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v168, CFSTR("root.general.accessibility.interaction.holdDuration.seconds"));
    goto LABEL_122;
  }
  v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v165 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_readVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_readVersion");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = (void *)objc_msgSend(v165, "initWithVersionString:", v166);
  if (objc_msgSend(v164, "isGreaterThanVersion:", v167))
  {

  }
  else
  {
    v314 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v315 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_writeVersion](self, "root_general_accessibility_interaction_holdDuration_seconds_writeVersion");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    v317 = (void *)objc_msgSend(v315, "initWithVersionString:", v316);
    v318 = objc_msgSend(v314, "isGreaterThanVersion:", v317);

    if (!v318)
      goto LABEL_123;
  }
  v319 = [HMDCompositeNumberSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_holdDuration_seconds_value](self, "root_general_accessibility_interaction_holdDuration_seconds_value");
  v168 = (HMDCompositeNumberSetting *)objc_claimAutoreleasedReturnValue();
  v320 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v319, "initWithValue:readVersion:writeVersion:", v168, CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v320, CFSTR("root.general.accessibility.interaction.holdDuration.seconds"));

LABEL_122:
LABEL_123:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_value](self, "root_general_accessibility_interaction_touchAccommodations_enabled_value");
  v169 = objc_claimAutoreleasedReturnValue();
  if (!v169)
    goto LABEL_129;
  v170 = (void *)v169;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_readVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_readVersion");
  v171 = objc_claimAutoreleasedReturnValue();
  if (!v171)
  {

    goto LABEL_129;
  }
  v172 = (void *)v171;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion");
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v173)
  {
LABEL_129:
    v178 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v178, CFSTR("root.general.accessibility.interaction.touchAccommodations.enabled"));
    goto LABEL_130;
  }
  v174 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v175 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_readVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_readVersion");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = (void *)objc_msgSend(v175, "initWithVersionString:", v176);
  if (objc_msgSend(v174, "isGreaterThanVersion:", v177))
  {

  }
  else
  {
    v321 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v322 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion](self, "root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion");
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    v324 = (void *)objc_msgSend(v322, "initWithVersionString:", v323);
    v325 = objc_msgSend(v321, "isGreaterThanVersion:", v324);

    if (!v325)
      goto LABEL_131;
  }
  v326 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_touchAccommodations_enabled_value](self, "root_general_accessibility_interaction_touchAccommodations_enabled_value");
  v178 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v327 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v326, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v178, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v327, CFSTR("root.general.accessibility.interaction.touchAccommodations.enabled"));

LABEL_130:
LABEL_131:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_value](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
  v179 = objc_claimAutoreleasedReturnValue();
  if (!v179)
    goto LABEL_137;
  v180 = (void *)v179;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion");
  v181 = objc_claimAutoreleasedReturnValue();
  if (!v181)
  {

    goto LABEL_137;
  }
  v182 = (void *)v181;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion");
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v183)
  {
LABEL_137:
    v188 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v188, CFSTR("root.general.accessibility.interaction.ignoreRepeat.enabled"));
    goto LABEL_138;
  }
  v184 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v185 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = (void *)objc_msgSend(v185, "initWithVersionString:", v186);
  if (objc_msgSend(v184, "isGreaterThanVersion:", v187))
  {

  }
  else
  {
    v328 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v329 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    v331 = (void *)objc_msgSend(v329, "initWithVersionString:", v330);
    v332 = objc_msgSend(v328, "isGreaterThanVersion:", v331);

    if (!v332)
      goto LABEL_139;
  }
  v333 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_enabled_value](self, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
  v188 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v334 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v333, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v188, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v334, CFSTR("root.general.accessibility.interaction.ignoreRepeat.enabled"));

LABEL_138:
LABEL_139:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_value](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
  v189 = objc_claimAutoreleasedReturnValue();
  if (!v189)
    goto LABEL_145;
  v190 = (void *)v189;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion");
  v191 = objc_claimAutoreleasedReturnValue();
  if (!v191)
  {

    goto LABEL_145;
  }
  v192 = (void *)v191;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion");
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v193)
  {
LABEL_145:
    v198 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:]([HMDCompositeNumberSetting alloc], "initWithValue:readVersion:writeVersion:", &unk_24E96B540, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v198, CFSTR("root.general.accessibility.interaction.ignoreRepeat.seconds"));
    goto LABEL_146;
  }
  v194 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v195 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = (void *)objc_msgSend(v195, "initWithVersionString:", v196);
  if (objc_msgSend(v194, "isGreaterThanVersion:", v197))
  {

  }
  else
  {
    v335 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v336 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion");
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    v338 = (void *)objc_msgSend(v336, "initWithVersionString:", v337);
    v339 = objc_msgSend(v335, "isGreaterThanVersion:", v338);

    if (!v339)
      goto LABEL_147;
  }
  v340 = [HMDCompositeNumberSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_accessibility_interaction_ignoreRepeat_seconds_value](self, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
  v198 = (HMDCompositeNumberSetting *)objc_claimAutoreleasedReturnValue();
  v341 = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v340, "initWithValue:readVersion:writeVersion:", v198, CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v341, CFSTR("root.general.accessibility.interaction.ignoreRepeat.seconds"));

LABEL_146:
LABEL_147:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_value](self, "root_general_analytics_shareSiriAnalytics_value");
  v199 = objc_claimAutoreleasedReturnValue();
  if (!v199)
    goto LABEL_153;
  v200 = (void *)v199;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_readVersion](self, "root_general_analytics_shareSiriAnalytics_readVersion");
  v201 = objc_claimAutoreleasedReturnValue();
  if (!v201)
  {

    goto LABEL_153;
  }
  v202 = (void *)v201;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_writeVersion](self, "root_general_analytics_shareSiriAnalytics_writeVersion");
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v203)
  {
LABEL_153:
    v208 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("9.0"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v208, CFSTR("root.general.analytics.shareSiriAnalytics"));
    goto LABEL_154;
  }
  v204 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v205 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_readVersion](self, "root_general_analytics_shareSiriAnalytics_readVersion");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = (void *)objc_msgSend(v205, "initWithVersionString:", v206);
  if (objc_msgSend(v204, "isGreaterThanVersion:", v207))
  {

  }
  else
  {
    v342 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("9.0"));
    v343 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_writeVersion](self, "root_general_analytics_shareSiriAnalytics_writeVersion");
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    v345 = (void *)objc_msgSend(v343, "initWithVersionString:", v344);
    v346 = objc_msgSend(v342, "isGreaterThanVersion:", v345);

    if (!v346)
      goto LABEL_155;
  }
  v347 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSiriAnalytics_value](self, "root_general_analytics_shareSiriAnalytics_value");
  v208 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v348 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v347, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v208, "BOOLValue"), CFSTR("7.1"), CFSTR("9.0"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v348, CFSTR("root.general.analytics.shareSiriAnalytics"));

LABEL_154:
LABEL_155:
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_value](self, "root_general_analytics_shareSpeakerAnalytics_value");
  v209 = objc_claimAutoreleasedReturnValue();
  if (!v209)
    goto LABEL_161;
  v210 = (void *)v209;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_readVersion](self, "root_general_analytics_shareSpeakerAnalytics_readVersion");
  v211 = objc_claimAutoreleasedReturnValue();
  if (!v211)
  {

    goto LABEL_161;
  }
  v212 = (void *)v211;
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_writeVersion](self, "root_general_analytics_shareSpeakerAnalytics_writeVersion");
  v213 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v213)
  {
LABEL_161:
    v218 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v218, CFSTR("root.general.analytics.shareSpeakerAnalytics"));
    goto LABEL_162;
  }
  v214 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v215 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_readVersion](self, "root_general_analytics_shareSpeakerAnalytics_readVersion");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = (void *)objc_msgSend(v215, "initWithVersionString:", v216);
  if (objc_msgSend(v214, "isGreaterThanVersion:", v217))
  {

  }
  else
  {
    v349 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v350 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_writeVersion](self, "root_general_analytics_shareSpeakerAnalytics_writeVersion");
    v351 = (void *)objc_claimAutoreleasedReturnValue();
    v352 = (void *)objc_msgSend(v350, "initWithVersionString:", v351);
    v353 = objc_msgSend(v349, "isGreaterThanVersion:", v352);

    if (!v353)
      goto LABEL_163;
  }
  v354 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_general_analytics_shareSpeakerAnalytics_value](self, "root_general_analytics_shareSpeakerAnalytics_value");
  v218 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v355 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v354, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v218, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v355, CFSTR("root.general.analytics.shareSpeakerAnalytics"));

LABEL_162:
LABEL_163:
  -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_value](self, "root_music_allowExplicitContent_value");
  v219 = objc_claimAutoreleasedReturnValue();
  if (!v219)
    goto LABEL_169;
  v220 = (void *)v219;
  -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_readVersion](self, "root_music_allowExplicitContent_readVersion");
  v221 = objc_claimAutoreleasedReturnValue();
  if (!v221)
  {

    goto LABEL_169;
  }
  v222 = (void *)v221;
  -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_writeVersion](self, "root_music_allowExplicitContent_writeVersion");
  v223 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v223)
  {
LABEL_169:
    v228 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v228, CFSTR("root.music.allowExplicitContent"));
    goto LABEL_170;
  }
  v224 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v225 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_readVersion](self, "root_music_allowExplicitContent_readVersion");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = (void *)objc_msgSend(v225, "initWithVersionString:", v226);
  if (objc_msgSend(v224, "isGreaterThanVersion:", v227))
  {

  }
  else
  {
    v356 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v357 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_writeVersion](self, "root_music_allowExplicitContent_writeVersion");
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    v359 = (void *)objc_msgSend(v357, "initWithVersionString:", v358);
    v360 = objc_msgSend(v356, "isGreaterThanVersion:", v359);

    if (!v360)
      goto LABEL_171;
  }
  v361 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_music_allowExplicitContent_value](self, "root_music_allowExplicitContent_value");
  v228 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v362 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v361, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v228, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v362, CFSTR("root.music.allowExplicitContent"));

LABEL_170:
LABEL_171:
  -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_value](self, "root_airPlay_airPlayEnabled_value");
  v229 = objc_claimAutoreleasedReturnValue();
  if (!v229)
    goto LABEL_177;
  v230 = (void *)v229;
  -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_readVersion](self, "root_airPlay_airPlayEnabled_readVersion");
  v231 = objc_claimAutoreleasedReturnValue();
  if (!v231)
  {

    goto LABEL_177;
  }
  v232 = (void *)v231;
  -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_writeVersion](self, "root_airPlay_airPlayEnabled_writeVersion");
  v233 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v233)
  {
LABEL_177:
    v238 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v238, CFSTR("root.airPlay.airPlayEnabled"));
    goto LABEL_178;
  }
  v234 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v235 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_readVersion](self, "root_airPlay_airPlayEnabled_readVersion");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = (void *)objc_msgSend(v235, "initWithVersionString:", v236);
  if (objc_msgSend(v234, "isGreaterThanVersion:", v237))
  {

  }
  else
  {
    v363 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v364 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_writeVersion](self, "root_airPlay_airPlayEnabled_writeVersion");
    v365 = (void *)objc_claimAutoreleasedReturnValue();
    v366 = (void *)objc_msgSend(v364, "initWithVersionString:", v365);
    v367 = objc_msgSend(v363, "isGreaterThanVersion:", v366);

    if (!v367)
      goto LABEL_179;
  }
  v368 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_airPlay_airPlayEnabled_value](self, "root_airPlay_airPlayEnabled_value");
  v238 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v369 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v368, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v238, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v369, CFSTR("root.airPlay.airPlayEnabled"));

LABEL_178:
LABEL_179:
  -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_value](self, "root_siriEndpoint_enabled_value");
  v239 = objc_claimAutoreleasedReturnValue();
  if (!v239)
    goto LABEL_185;
  v240 = (void *)v239;
  -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_readVersion](self, "root_siriEndpoint_enabled_readVersion");
  v241 = objc_claimAutoreleasedReturnValue();
  if (!v241)
  {

    goto LABEL_185;
  }
  v242 = (void *)v241;
  -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_writeVersion](self, "root_siriEndpoint_enabled_writeVersion");
  v243 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v243)
  {
LABEL_185:
    v248 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.1"), CFSTR("7.1"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v248, CFSTR("root.siriEndpoint.enabled"));
    goto LABEL_186;
  }
  v244 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
  v245 = objc_alloc(MEMORY[0x24BE3F2A8]);
  -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_readVersion](self, "root_siriEndpoint_enabled_readVersion");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v247 = (void *)objc_msgSend(v245, "initWithVersionString:", v246);
  if (objc_msgSend(v244, "isGreaterThanVersion:", v247))
  {

  }
  else
  {
    v370 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("7.1"));
    v371 = objc_alloc(MEMORY[0x24BE3F2A8]);
    -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_writeVersion](self, "root_siriEndpoint_enabled_writeVersion");
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    v373 = (void *)objc_msgSend(v371, "initWithVersionString:", v372);
    v374 = objc_msgSend(v370, "isGreaterThanVersion:", v373);

    if (!v374)
      goto LABEL_187;
  }
  v375 = [HMDCompositeBoolSetting alloc];
  -[HMDCompositeSettingsAccessorySettingsModel root_siriEndpoint_enabled_value](self, "root_siriEndpoint_enabled_value");
  v248 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
  v376 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v375, "initWithValue:readVersion:writeVersion:", -[HMDCompositeBoolSetting BOOLValue](v248, "BOOLValue"), CFSTR("7.1"), CFSTR("7.1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v376, CFSTR("root.siriEndpoint.enabled"));

LABEL_186:
LABEL_187:
  v249 = (void *)objc_msgSend(v3, "copy");

  return v249;
}

- (void)setSetting:(id)a3 forKeyPath:(id)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;

  v127 = a3;
  v8 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", &stru_24E79DB48))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.siri.soundAlert")))
    {
      v11 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_soundAlert_value:](self, "setRoot_siri_soundAlert_value:", v14);

        objc_msgSend(v13, "writeVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "versionString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_soundAlert_writeVersion:](self, "setRoot_siri_soundAlert_writeVersion:", v16);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_soundAlert_readVersion:](self, "setRoot_siri_soundAlert_readVersion:", v18);
LABEL_137:

LABEL_140:
        goto LABEL_141;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.siri.lightWhenUsingSiri")))
    {
      v19 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v13 = v20;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_lightWhenUsingSiri_value:](self, "setRoot_siri_lightWhenUsingSiri_value:", v21);

        objc_msgSend(v13, "writeVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "versionString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_lightWhenUsingSiri_writeVersion:](self, "setRoot_siri_lightWhenUsingSiri_writeVersion:", v23);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_lightWhenUsingSiri_readVersion:](self, "setRoot_siri_lightWhenUsingSiri_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.siri.siriEnabled")))
    {
      v24 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v13 = v25;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_siriEnabled_value:](self, "setRoot_siri_siriEnabled_value:", v26);

        objc_msgSend(v13, "writeVersion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "versionString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_siriEnabled_writeVersion:](self, "setRoot_siri_siriEnabled_writeVersion:", v28);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_siriEnabled_readVersion:](self, "setRoot_siri_siriEnabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.siri.language")))
    {
      v29 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
      v13 = v30;

      if (v13)
      {
        objc_msgSend(v13, "inputLanguageCode");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_inputLanguageCodeValueName:](self, "setRoot_siri_language_inputLanguageCodeValueName:", v31);

        objc_msgSend(v13, "outputVoiceGenderCode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_outputLanguageGenderCodeValueName:](self, "setRoot_siri_language_outputLanguageGenderCodeValueName:", v32);

        objc_msgSend(v13, "outputVoiceLanguageCode");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_outputLanguageVoiceCodeValueName:](self, "setRoot_siri_language_outputLanguageVoiceCodeValueName:", v33);

        objc_msgSend(v13, "voiceName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_voiceNameValueName:](self, "setRoot_siri_language_voiceNameValueName:", v34);

        objc_msgSend(v13, "writeVersion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "versionString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_writeVersion:](self, "setRoot_siri_language_writeVersion:", v36);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_readVersion:](self, "setRoot_siri_language_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.home.dismissedHomePodHasNonMemberMediaAccountWarning")))
    {
      v37 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
      v13 = v38;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:](self, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:", v39);

        objc_msgSend(v13, "writeVersion");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "versionString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion:](self, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion:", v41);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion:](self, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.locationServices.enabled")))
    {
      v42 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v43 = v42;
      else
        v43 = 0;
      v13 = v43;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_locationServices_enabled_value:](self, "setRoot_locationServices_enabled_value:", v44);

        objc_msgSend(v13, "writeVersion");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "versionString");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_locationServices_enabled_writeVersion:](self, "setRoot_locationServices_enabled_writeVersion:", v46);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_locationServices_enabled_readVersion:](self, "setRoot_locationServices_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.doorbellChime.enabled")))
    {
      v47 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v48 = v47;
      else
        v48 = 0;
      v13 = v48;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_doorbellChime_enabled_value:](self, "setRoot_doorbellChime_enabled_value:", v49);

        objc_msgSend(v13, "writeVersion");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "versionString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_doorbellChime_enabled_writeVersion:](self, "setRoot_doorbellChime_enabled_writeVersion:", v51);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_doorbellChime_enabled_readVersion:](self, "setRoot_doorbellChime_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.announce.enabled")))
    {
      v52 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v53 = v52;
      else
        v53 = 0;
      v13 = v53;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_announce_enabled_value:](self, "setRoot_announce_enabled_value:", v54);

        objc_msgSend(v13, "writeVersion");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "versionString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_announce_enabled_writeVersion:](self, "setRoot_announce_enabled_writeVersion:", v56);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_announce_enabled_readVersion:](self, "setRoot_announce_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval")))
    {
      v57 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v58 = v57;
      else
        v58 = 0;
      v13 = v58;

      if (v13)
      {
        objc_msgSend(v13, "numberValue");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:](self, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:", v59);

        objc_msgSend(v13, "writeVersion");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "versionString");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion:](self, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion:", v61);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion:](self, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.vision.voiceOver.enabled")))
    {
      v62 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v63 = v62;
      else
        v63 = 0;
      v13 = v63;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_enabled_value:](self, "setRoot_general_accessibility_vision_voiceOver_enabled_value:", v64);

        objc_msgSend(v13, "writeVersion");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "versionString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_enabled_writeVersion:](self, "setRoot_general_accessibility_vision_voiceOver_enabled_writeVersion:", v66);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_enabled_readVersion:](self, "setRoot_general_accessibility_vision_voiceOver_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.vision.voiceOver.audioDuckingEnabled")))
    {
      v67 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v68 = v67;
      else
        v68 = 0;
      v13 = v68;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:](self, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:", v69);

        objc_msgSend(v13, "writeVersion");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "versionString");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion:](self, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion:", v71);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion:](self, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.vision.speakingRateSection.speakingRate")))
    {
      v72 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v73 = v72;
      else
        v73 = 0;
      v13 = v73;

      if (v13)
      {
        objc_msgSend(v13, "numberValue");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:](self, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:", v74);

        objc_msgSend(v13, "writeVersion");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "versionString");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion:](self, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion:", v76);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_speakingRateSection_speakingRate_readVersion:](self, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.interaction.holdDuration.enabled")))
    {
      v77 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v78 = v77;
      else
        v78 = 0;
      v13 = v78;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_enabled_value:](self, "setRoot_general_accessibility_interaction_holdDuration_enabled_value:", v79);

        objc_msgSend(v13, "writeVersion");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "versionString");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_enabled_writeVersion:](self, "setRoot_general_accessibility_interaction_holdDuration_enabled_writeVersion:", v81);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_enabled_readVersion:](self, "setRoot_general_accessibility_interaction_holdDuration_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.interaction.holdDuration.seconds")))
    {
      v82 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v83 = v82;
      else
        v83 = 0;
      v13 = v83;

      if (v13)
      {
        objc_msgSend(v13, "numberValue");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_seconds_value:](self, "setRoot_general_accessibility_interaction_holdDuration_seconds_value:", v84);

        objc_msgSend(v13, "writeVersion");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "versionString");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_seconds_writeVersion:](self, "setRoot_general_accessibility_interaction_holdDuration_seconds_writeVersion:", v86);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_seconds_readVersion:](self, "setRoot_general_accessibility_interaction_holdDuration_seconds_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.interaction.touchAccommodations.enabled")))
    {
      v87 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v88 = v87;
      else
        v88 = 0;
      v13 = v88;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:](self, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:", v89);

        objc_msgSend(v13, "writeVersion");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "versionString");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_touchAccommodations_enabled_writeVersion:](self, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_writeVersion:", v91);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_touchAccommodations_enabled_readVersion:](self, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.interaction.ignoreRepeat.enabled")))
    {
      v92 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v93 = v92;
      else
        v93 = 0;
      v13 = v93;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:](self, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:", v94);

        objc_msgSend(v13, "writeVersion");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "versionString");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion:](self, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion:", v96);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_enabled_readVersion:](self, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.accessibility.interaction.ignoreRepeat.seconds")))
    {
      v97 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v98 = v97;
      else
        v98 = 0;
      v13 = v98;

      if (v13)
      {
        objc_msgSend(v13, "numberValue");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:](self, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:", v99);

        objc_msgSend(v13, "writeVersion");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "versionString");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion:](self, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion:", v101);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_seconds_readVersion:](self, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.analytics.shareSiriAnalytics")))
    {
      v102 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v103 = v102;
      else
        v103 = 0;
      v13 = v103;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSiriAnalytics_value:](self, "setRoot_general_analytics_shareSiriAnalytics_value:", v104);

        objc_msgSend(v13, "writeVersion");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "versionString");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSiriAnalytics_writeVersion:](self, "setRoot_general_analytics_shareSiriAnalytics_writeVersion:", v106);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSiriAnalytics_readVersion:](self, "setRoot_general_analytics_shareSiriAnalytics_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.general.analytics.shareSpeakerAnalytics")))
    {
      v107 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v108 = v107;
      else
        v108 = 0;
      v13 = v108;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSpeakerAnalytics_value:](self, "setRoot_general_analytics_shareSpeakerAnalytics_value:", v109);

        objc_msgSend(v13, "writeVersion");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "versionString");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSpeakerAnalytics_writeVersion:](self, "setRoot_general_analytics_shareSpeakerAnalytics_writeVersion:", v111);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSpeakerAnalytics_readVersion:](self, "setRoot_general_analytics_shareSpeakerAnalytics_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.music.allowExplicitContent")))
    {
      v112 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v113 = v112;
      else
        v113 = 0;
      v13 = v113;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_music_allowExplicitContent_value:](self, "setRoot_music_allowExplicitContent_value:", v114);

        objc_msgSend(v13, "writeVersion");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "versionString");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_music_allowExplicitContent_writeVersion:](self, "setRoot_music_allowExplicitContent_writeVersion:", v116);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_music_allowExplicitContent_readVersion:](self, "setRoot_music_allowExplicitContent_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("root.airPlay.airPlayEnabled")))
    {
      v117 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v118 = v117;
      else
        v118 = 0;
      v13 = v118;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_airPlay_airPlayEnabled_value:](self, "setRoot_airPlay_airPlayEnabled_value:", v119);

        objc_msgSend(v13, "writeVersion");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "versionString");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_airPlay_airPlayEnabled_writeVersion:](self, "setRoot_airPlay_airPlayEnabled_writeVersion:", v121);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_airPlay_airPlayEnabled_readVersion:](self, "setRoot_airPlay_airPlayEnabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("root.siriEndpoint.enabled")))
      {
        if (!a5)
          goto LABEL_141;
        v9 = (void *)MEMORY[0x24BDD1540];
        v10 = 5;
        goto LABEL_4;
      }
      v122 = v127;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v123 = v122;
      else
        v123 = 0;
      v13 = v123;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siriEndpoint_enabled_value:](self, "setRoot_siriEndpoint_enabled_value:", v124);

        objc_msgSend(v13, "writeVersion");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "versionString");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siriEndpoint_enabled_writeVersion:](self, "setRoot_siriEndpoint_enabled_writeVersion:", v126);

        objc_msgSend(v13, "readVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeSettingsAccessorySettingsModel setRoot_siriEndpoint_enabled_readVersion:](self, "setRoot_siriEndpoint_enabled_readVersion:", v18);
        goto LABEL_137;
      }
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_140;
  }
  if (a5)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = 3;
LABEL_4:
    objc_msgSend(v9, "hmfErrorWithCode:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_141:

}

@end
