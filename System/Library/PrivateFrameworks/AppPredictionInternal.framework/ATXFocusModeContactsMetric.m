@implementation ATXFocusModeContactsMetric

- (id)metricName
{
  return CFSTR("com.apple.FocusModeContact");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
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
  id v75;
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
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  _QWORD v105[36];
  _QWORD v106[38];

  v106[36] = *MEMORY[0x1E0C80C00];
  v105[0] = CFSTR("FocusMode");
  -[ATXFocusModeContactsMetric focusMode](self, "focusMode");
  ATXModeToString();
  v3 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v3;
  v106[0] = v3;
  v105[1] = CFSTR("ActiveConfigurationType");
  -[ATXFocusModeContactsMetric activeConfigurationType](self, "activeConfigurationType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v4;
  v106[1] = v4;
  v105[2] = CFSTR("EntityModeEntityScore");
  -[ATXFocusModeContactsMetric entityModeEntityScore](self, "entityModeEntityScore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v6;
  v106[2] = v6;
  v105[3] = CFSTR("ClassConditionalProbability");
  -[ATXFocusModeContactsMetric classConditionalProbability](self, "classConditionalProbability");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v8;
  v106[3] = v8;
  v105[4] = CFSTR("ContactMuted");
  -[ATXFocusModeContactsMetric contactMuted](self, "contactMuted");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v10;
  v106[4] = v10;
  v105[5] = CFSTR("GlobalPopularity");
  -[ATXFocusModeContactsMetric globalPopularity](self, "globalPopularity");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v12;
  v106[5] = v12;
  v105[6] = CFSTR("ModePopularity");
  -[ATXFocusModeContactsMetric modePopularity](self, "modePopularity");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v14;
  v106[6] = v14;
  v105[7] = CFSTR("RatioOfModePopularityToGlobalPopularityOfEntity");
  -[ATXFocusModeContactsMetric ratioOfModePopularityToGlobalPopularityOfEntity](self, "ratioOfModePopularityToGlobalPopularityOfEntity");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v16;
  v106[7] = v16;
  v105[8] = CFSTR("LocalNotificationsClearanceRateForEntity");
  -[ATXFocusModeContactsMetric localNotificationsClearedRateForEntity](self, "localNotificationsClearedRateForEntity");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v18;
  v106[8] = v18;
  v105[9] = CFSTR("GlobalNotificationsClearanceRateForEntity");
  -[ATXFocusModeContactsMetric globalNotificationsClearedRateForEntity](self, "globalNotificationsClearedRateForEntity");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v20;
  v106[9] = v20;
  v105[10] = CFSTR("NotificationsClearedInMode");
  -[ATXFocusModeContactsMetric notificationsClearedInMode](self, "notificationsClearedInMode");
  v22 = objc_claimAutoreleasedReturnValue();
  v104 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v22;
  v106[10] = v22;
  v105[11] = CFSTR("NotificationsClearedGlobally");
  -[ATXFocusModeContactsMetric notificationsClearedGlobally](self, "notificationsClearedGlobally");
  v23 = objc_claimAutoreleasedReturnValue();
  v103 = (void *)v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v23;
  v106[11] = v23;
  v105[12] = CFSTR("PosteriorProbability");
  -[ATXFocusModeContactsMetric posteriorProbability](self, "posteriorProbability");
  v24 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v24;
  v106[12] = v24;
  v105[13] = CFSTR("RatioOfLocalToGlobalNotificationsClearedRateForEntity");
  -[ATXFocusModeContactsMetric ratioOfLocalToGlobalNotificationsClearedRateForEntity](self, "ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  v25 = objc_claimAutoreleasedReturnValue();
  v101 = (void *)v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v25;
  v106[13] = v25;
  v105[14] = CFSTR("ClassConditionalOfNotificationsClearedForEntity");
  -[ATXFocusModeContactsMetric classConditionalOfNotificationsClearedForEntity](self, "classConditionalOfNotificationsClearedForEntity");
  v26 = objc_claimAutoreleasedReturnValue();
  v100 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v26;
  v106[14] = v26;
  v105[15] = CFSTR("NotificationsReceivedGlobally");
  -[ATXFocusModeContactsMetric notificationsReceivedGlobally](self, "notificationsReceivedGlobally");
  v27 = objc_claimAutoreleasedReturnValue();
  v99 = (void *)v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v27;
  v106[15] = v27;
  v105[16] = CFSTR("NotificationsReceivedInMode");
  -[ATXFocusModeContactsMetric notificationsReceivedInMode](self, "notificationsReceivedInMode");
  v28 = objc_claimAutoreleasedReturnValue();
  v98 = (void *)v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v28;
  v106[16] = v28;
  v105[17] = CFSTR("LocalPopularityOfNotificationsReceivedForEntity");
  -[ATXFocusModeContactsMetric localPopularityOfNotificationsReceivedForEntity](self, "localPopularityOfNotificationsReceivedForEntity");
  v29 = objc_claimAutoreleasedReturnValue();
  v97 = (void *)v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v29;
  v106[17] = v29;
  v105[18] = CFSTR("GlobalPopularityOfNotificationsReceivedForEntity");
  -[ATXFocusModeContactsMetric globalPopularityOfNotificationsReceivedForEntity](self, "globalPopularityOfNotificationsReceivedForEntity");
  v30 = objc_claimAutoreleasedReturnValue();
  v96 = (void *)v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v30;
  v106[18] = v30;
  v105[19] = CFSTR("RatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  -[ATXFocusModeContactsMetric ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity](self, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  v31 = objc_claimAutoreleasedReturnValue();
  v95 = (void *)v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v86 = v19;
  v87 = v17;
  v88 = v15;
  v89 = v13;
  v91 = v9;
  v92 = v7;
  v93 = v5;
  v55 = (void *)v31;
  v106[19] = v31;
  v105[20] = CFSTR("ClassConditionalOfNotificationsReceivedForEntity");
  -[ATXFocusModeContactsMetric classConditionalOfNotificationsReceivedForEntity](self, "classConditionalOfNotificationsReceivedForEntity");
  v32 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v85 = v21;
  v90 = v11;
  v54 = (void *)v32;
  v106[20] = v32;
  v105[21] = CFSTR("ContactEngagedGloballyOverLastNDays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactEngagedGloballyOverLastNDays](self, "contactEngagedGloballyOverLastNDays"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v106[21] = v83;
  v105[22] = CFSTR("ContactEngagedInModeOverLastNDays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactEngagedInModeOverLastNDays](self, "contactEngagedInModeOverLastNDays"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v106[22] = v82;
  v105[23] = CFSTR("ContactIsEmergency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactIsEmergency](self, "contactIsEmergency"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v106[23] = v81;
  v105[24] = CFSTR("ContactIsFavorite");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactIsFavorite](self, "contactIsFavorite"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v106[24] = v80;
  v105[25] = CFSTR("ContactIsiCloudFamilyMember");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactIsiCloudFamilyMember](self, "contactIsiCloudFamilyMember"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v106[25] = v79;
  v105[26] = CFSTR("ContactIsPinned");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactIsPinned](self, "contactIsPinned"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v106[26] = v78;
  v105[27] = CFSTR("ContactIsVIP");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactIsVIP](self, "contactIsVIP"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v106[27] = v77;
  v105[28] = CFSTR("ContactMessageHideAlerts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric contactMessageHideAlerts](self, "contactMessageHideAlerts"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v106[28] = v76;
  v105[29] = CFSTR("IsContactCandidateSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric isContactCandidateSuggestion](self, "isContactCandidateSuggestion"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v106[29] = v33;
  v105[30] = CFSTR("IsContactRecommendedSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric isContactRecommendedSuggestion](self, "isContactRecommendedSuggestion"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v106[30] = v34;
  v105[31] = CFSTR("wasContactSuggestedDuringModeSetup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric wasContactSuggestedDuringModeSetup](self, "wasContactSuggestedDuringModeSetup"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v106[31] = v35;
  v105[32] = CFSTR("wasContactSuggestionDuringModeSetupAccepted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeContactsMetric wasContactSuggestionDuringModeSetupAccepted](self, "wasContactSuggestionDuringModeSetupAccepted"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v106[32] = v36;
  v105[33] = CFSTR("TreatmentId");
  -[ATXFocusModeContactsMetric treatmentId](self, "treatmentId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[33] = v38;
  v105[34] = CFSTR("ExperimentId");
  -[ATXFocusModeContactsMetric experimentId](self, "experimentId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[34] = v40;
  v105[35] = CFSTR("DeploymentId");
  -[ATXFocusModeContactsMetric deploymentId](self, "deploymentId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[35] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 36);
  v75 = (id)objc_claimAutoreleasedReturnValue();
  if (!v41)

  if (!v39)
  if (!v37)

  if (!v84)
  v43 = v95;
  if (!v95)
  {

    v43 = 0;
  }

  v44 = v96;
  if (!v96)
  {

    v44 = 0;
  }

  v45 = v97;
  if (!v97)
  {

    v45 = 0;
  }

  v46 = v98;
  if (!v98)
  {

    v46 = 0;
  }

  v47 = v99;
  if (!v99)
  {

    v47 = 0;
  }

  v48 = v100;
  if (!v100)
  {

    v48 = 0;
  }

  v49 = v101;
  if (!v101)
  {

    v49 = 0;
  }

  v50 = v102;
  if (!v102)
  {

    v50 = 0;
  }

  v51 = v103;
  if (!v103)
  {

    v51 = 0;
  }

  v52 = v104;
  if (!v104)
  {

    v52 = 0;
  }

  if (!v85)
  if (!v86)

  if (!v87)
  if (!v88)

  if (!v89)
  if (!v90)

  if (!v91)
  if (!v92)

  if (!v93)
  if (!v94)

  return v75;
}

- (unint64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(unint64_t)a3
{
  self->_focusMode = a3;
}

- (NSString)activeConfigurationType
{
  return self->_activeConfigurationType;
}

- (void)setActiveConfigurationType:(id)a3
{
  objc_storeStrong((id *)&self->_activeConfigurationType, a3);
}

- (NSNumber)entityModeEntityScore
{
  return self->_entityModeEntityScore;
}

- (void)setEntityModeEntityScore:(id)a3
{
  objc_storeStrong((id *)&self->_entityModeEntityScore, a3);
}

- (NSNumber)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (void)setClassConditionalProbability:(id)a3
{
  objc_storeStrong((id *)&self->_classConditionalProbability, a3);
}

- (NSNumber)contactMuted
{
  return self->_contactMuted;
}

- (void)setContactMuted:(id)a3
{
  objc_storeStrong((id *)&self->_contactMuted, a3);
}

- (NSNumber)globalPopularity
{
  return self->_globalPopularity;
}

- (void)setGlobalPopularity:(id)a3
{
  objc_storeStrong((id *)&self->_globalPopularity, a3);
}

- (NSNumber)modePopularity
{
  return self->_modePopularity;
}

- (void)setModePopularity:(id)a3
{
  objc_storeStrong((id *)&self->_modePopularity, a3);
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfEntity, a3);
}

- (NSNumber)localNotificationsClearedRateForEntity
{
  return self->_localNotificationsClearedRateForEntity;
}

- (void)setLocalNotificationsClearedRateForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_localNotificationsClearedRateForEntity, a3);
}

- (NSNumber)globalNotificationsClearedRateForEntity
{
  return self->_globalNotificationsClearedRateForEntity;
}

- (void)setGlobalNotificationsClearedRateForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalNotificationsClearedRateForEntity, a3);
}

- (NSNumber)notificationsClearedInMode
{
  return self->_notificationsClearedInMode;
}

- (void)setNotificationsClearedInMode:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsClearedInMode, a3);
}

- (NSNumber)notificationsClearedGlobally
{
  return self->_notificationsClearedGlobally;
}

- (void)setNotificationsClearedGlobally:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsClearedGlobally, a3);
}

- (NSNumber)posteriorProbability
{
  return self->_posteriorProbability;
}

- (void)setPosteriorProbability:(id)a3
{
  objc_storeStrong((id *)&self->_posteriorProbability, a3);
}

- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity
{
  return self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
}

- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity, a3);
}

- (NSNumber)classConditionalOfNotificationsClearedForEntity
{
  return self->_classConditionalOfNotificationsClearedForEntity;
}

- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsClearedForEntity, a3);
}

- (NSNumber)notificationsReceivedGlobally
{
  return self->_notificationsReceivedGlobally;
}

- (void)setNotificationsReceivedGlobally:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsReceivedGlobally, a3);
}

- (NSNumber)notificationsReceivedInMode
{
  return self->_notificationsReceivedInMode;
}

- (void)setNotificationsReceivedInMode:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsReceivedInMode, a3);
}

- (NSNumber)localPopularityOfNotificationsReceivedForEntity
{
  return self->_localPopularityOfNotificationsReceivedForEntity;
}

- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_localPopularityOfNotificationsReceivedForEntity, a3);
}

- (NSNumber)globalPopularityOfNotificationsReceivedForEntity
{
  return self->_globalPopularityOfNotificationsReceivedForEntity;
}

- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalPopularityOfNotificationsReceivedForEntity, a3);
}

- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity
{
  return self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
}

- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity, a3);
}

- (NSNumber)classConditionalOfNotificationsReceivedForEntity
{
  return self->_classConditionalOfNotificationsReceivedForEntity;
}

- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsReceivedForEntity, a3);
}

- (BOOL)contactEngagedGloballyOverLastNDays
{
  return self->_contactEngagedGloballyOverLastNDays;
}

- (void)setContactEngagedGloballyOverLastNDays:(BOOL)a3
{
  self->_contactEngagedGloballyOverLastNDays = a3;
}

- (BOOL)contactEngagedInModeOverLastNDays
{
  return self->_contactEngagedInModeOverLastNDays;
}

- (void)setContactEngagedInModeOverLastNDays:(BOOL)a3
{
  self->_contactEngagedInModeOverLastNDays = a3;
}

- (BOOL)contactIsEmergency
{
  return self->_contactIsEmergency;
}

- (void)setContactIsEmergency:(BOOL)a3
{
  self->_contactIsEmergency = a3;
}

- (BOOL)contactIsFavorite
{
  return self->_contactIsFavorite;
}

- (void)setContactIsFavorite:(BOOL)a3
{
  self->_contactIsFavorite = a3;
}

- (BOOL)contactIsiCloudFamilyMember
{
  return self->_contactIsiCloudFamilyMember;
}

- (void)setContactIsiCloudFamilyMember:(BOOL)a3
{
  self->_contactIsiCloudFamilyMember = a3;
}

- (BOOL)contactIsPinned
{
  return self->_contactIsPinned;
}

- (void)setContactIsPinned:(BOOL)a3
{
  self->_contactIsPinned = a3;
}

- (BOOL)contactIsVIP
{
  return self->_contactIsVIP;
}

- (void)setContactIsVIP:(BOOL)a3
{
  self->_contactIsVIP = a3;
}

- (BOOL)contactMessageHideAlerts
{
  return self->_contactMessageHideAlerts;
}

- (void)setContactMessageHideAlerts:(BOOL)a3
{
  self->_contactMessageHideAlerts = a3;
}

- (BOOL)isContactCandidateSuggestion
{
  return self->_isContactCandidateSuggestion;
}

- (void)setIsContactCandidateSuggestion:(BOOL)a3
{
  self->_isContactCandidateSuggestion = a3;
}

- (BOOL)isContactRecommendedSuggestion
{
  return self->_isContactRecommendedSuggestion;
}

- (void)setIsContactRecommendedSuggestion:(BOOL)a3
{
  self->_isContactRecommendedSuggestion = a3;
}

- (BOOL)wasContactSuggestedDuringModeSetup
{
  return self->_wasContactSuggestedDuringModeSetup;
}

- (void)setWasContactSuggestedDuringModeSetup:(BOOL)a3
{
  self->_wasContactSuggestedDuringModeSetup = a3;
}

- (BOOL)wasContactSuggestionDuringModeSetupAccepted
{
  return self->_wasContactSuggestionDuringModeSetupAccepted;
}

- (void)setWasContactSuggestionDuringModeSetupAccepted:(BOOL)a3
{
  self->_wasContactSuggestionDuringModeSetupAccepted = a3;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSNumber)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_localPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInMode, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedGlobally, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_posteriorProbability, 0);
  objc_storeStrong((id *)&self->_notificationsClearedGlobally, 0);
  objc_storeStrong((id *)&self->_notificationsClearedInMode, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_localNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfEntity, 0);
  objc_storeStrong((id *)&self->_modePopularity, 0);
  objc_storeStrong((id *)&self->_globalPopularity, 0);
  objc_storeStrong((id *)&self->_contactMuted, 0);
  objc_storeStrong((id *)&self->_classConditionalProbability, 0);
  objc_storeStrong((id *)&self->_entityModeEntityScore, 0);
  objc_storeStrong((id *)&self->_activeConfigurationType, 0);
}

@end
