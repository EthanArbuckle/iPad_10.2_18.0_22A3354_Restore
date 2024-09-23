@implementation ATXAppEntityFeatures

- (ATXAppEntityFeatures)init
{
  ATXAppEntityFeatures *v2;
  ATXAppEntityFeatures *v3;
  NSNumber *appCategoryScore;
  NSNumber *appCategoryScore_v2;
  NSNumber *globalModeAffinityPrior;
  NSNumber *globalInterruptingPrior;
  NSNumber *notificationsReceivedInLastTwoWeeks;
  NSNumber *modeAppInterruptionsCountByEntity;
  NSNumber *modePopularityOfInterruptingEntity;
  NSNumber *modeAppInterruptionsClassConditionalProbabilityByEntity;
  NSNumber *globalAppInterruptionsCountByEntity;
  NSNumber *globalPopularityOfInterruptingEntity;
  NSNumber *ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
  NSNumber *modeCountOfNotificationsClearedForEntity;
  NSNumber *globalCountOfNotificationsClearedForEntity;
  NSNumber *localNotificationsClearedRateForEntity;
  NSNumber *globalNotificationsClearedRateForEntity;
  NSNumber *ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  NSNumber *classConditionalOfNotificationsClearedForEntity;
  NSNumber *globalCountOfNotificationsReceivedForEntity;
  NSNumber *modeCountOfNotificationsReceivedForEntity;
  NSNumber *localPopularityOfNotificationsReceivedForEntity;
  NSNumber *globalPopularityOfNotificationsReceivedForEntity;
  NSNumber *ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  NSNumber *classConditionalOfNotificationsReceivedForEntity;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)ATXAppEntityFeatures;
  v2 = -[ATXAppEntityFeatures init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    appCategoryScore = v2->_appCategoryScore;
    v2->_appCategoryScore = (NSNumber *)&unk_1E83CBCF8;

    appCategoryScore_v2 = v3->_appCategoryScore_v2;
    v3->_appCategoryScore_v2 = (NSNumber *)&unk_1E83CBCF8;

    globalModeAffinityPrior = v3->_globalModeAffinityPrior;
    v3->_globalModeAffinityPrior = (NSNumber *)&unk_1E83CBCF8;

    globalInterruptingPrior = v3->_globalInterruptingPrior;
    v3->_globalInterruptingPrior = (NSNumber *)&unk_1E83CBCF8;

    notificationsReceivedInLastTwoWeeks = v3->_notificationsReceivedInLastTwoWeeks;
    v3->_notificationsReceivedInLastTwoWeeks = (NSNumber *)&unk_1E83CBCF8;

    modeAppInterruptionsCountByEntity = v3->_modeAppInterruptionsCountByEntity;
    v3->_modeAppInterruptionsCountByEntity = (NSNumber *)&unk_1E83CBCF8;

    modePopularityOfInterruptingEntity = v3->_modePopularityOfInterruptingEntity;
    v3->_modePopularityOfInterruptingEntity = (NSNumber *)&unk_1E83CBCF8;

    modeAppInterruptionsClassConditionalProbabilityByEntity = v3->_modeAppInterruptionsClassConditionalProbabilityByEntity;
    v3->_modeAppInterruptionsClassConditionalProbabilityByEntity = (NSNumber *)&unk_1E83CBCF8;

    globalAppInterruptionsCountByEntity = v3->_globalAppInterruptionsCountByEntity;
    v3->_globalAppInterruptionsCountByEntity = (NSNumber *)&unk_1E83CBCF8;

    globalPopularityOfInterruptingEntity = v3->_globalPopularityOfInterruptingEntity;
    v3->_globalPopularityOfInterruptingEntity = (NSNumber *)&unk_1E83CBCF8;

    ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = v3->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
    v3->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = (NSNumber *)&unk_1E83CBCF8;

    modeCountOfNotificationsClearedForEntity = v3->_modeCountOfNotificationsClearedForEntity;
    v3->_modeCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1E83CBCF8;

    globalCountOfNotificationsClearedForEntity = v3->_globalCountOfNotificationsClearedForEntity;
    v3->_globalCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1E83CBCF8;

    localNotificationsClearedRateForEntity = v3->_localNotificationsClearedRateForEntity;
    v3->_localNotificationsClearedRateForEntity = (NSNumber *)&unk_1E83CBCF8;

    globalNotificationsClearedRateForEntity = v3->_globalNotificationsClearedRateForEntity;
    v3->_globalNotificationsClearedRateForEntity = (NSNumber *)&unk_1E83CBCF8;

    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)&unk_1E83CBCF8;

    classConditionalOfNotificationsClearedForEntity = v3->_classConditionalOfNotificationsClearedForEntity;
    v3->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)&unk_1E83CBCF8;

    globalCountOfNotificationsReceivedForEntity = v3->_globalCountOfNotificationsReceivedForEntity;
    v3->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CBCF8;

    modeCountOfNotificationsReceivedForEntity = v3->_modeCountOfNotificationsReceivedForEntity;
    v3->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CBCF8;

    localPopularityOfNotificationsReceivedForEntity = v3->_localPopularityOfNotificationsReceivedForEntity;
    v3->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CBCF8;

    globalPopularityOfNotificationsReceivedForEntity = v3->_globalPopularityOfNotificationsReceivedForEntity;
    v3->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CBCF8;

    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CBCF8;

    classConditionalOfNotificationsReceivedForEntity = v3->_classConditionalOfNotificationsReceivedForEntity;
    v3->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CBCF8;

  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXAppEntityFeatures *v5;
  uint64_t v6;
  NSNumber *appCategoryScore;
  uint64_t v8;
  NSNumber *appCategoryScore_v2;
  uint64_t v10;
  NSNumber *globalModeAffinityPrior;
  uint64_t v12;
  NSNumber *globalInterruptingPrior;
  uint64_t v14;
  NSNumber *notificationsReceivedInLastTwoWeeks;
  uint64_t v16;
  NSNumber *modeAppInterruptionsCountByEntity;
  uint64_t v18;
  NSNumber *modePopularityOfInterruptingEntity;
  uint64_t v20;
  NSNumber *modeAppInterruptionsClassConditionalProbabilityByEntity;
  uint64_t v22;
  NSNumber *globalAppInterruptionsCountByEntity;
  uint64_t v24;
  NSNumber *globalPopularityOfInterruptingEntity;
  uint64_t v26;
  NSNumber *ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
  uint64_t v28;
  NSNumber *modeCountOfNotificationsClearedForEntity;
  uint64_t v30;
  NSNumber *globalCountOfNotificationsClearedForEntity;
  uint64_t v32;
  NSNumber *localNotificationsClearedRateForEntity;
  uint64_t v34;
  NSNumber *globalNotificationsClearedRateForEntity;
  uint64_t v36;
  NSNumber *ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  uint64_t v38;
  NSNumber *classConditionalOfNotificationsClearedForEntity;
  uint64_t v40;
  NSNumber *globalCountOfNotificationsReceivedForEntity;
  uint64_t v42;
  NSNumber *modeCountOfNotificationsReceivedForEntity;
  uint64_t v44;
  NSNumber *localPopularityOfNotificationsReceivedForEntity;
  uint64_t v46;
  NSNumber *globalPopularityOfNotificationsReceivedForEntity;
  uint64_t v48;
  NSNumber *ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  uint64_t v50;
  NSNumber *classConditionalOfNotificationsReceivedForEntity;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)ATXAppEntityFeatures;
  v5 = -[ATXAppEntityFeatures init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appCategoryScore"));
    v6 = objc_claimAutoreleasedReturnValue();
    appCategoryScore = v5->_appCategoryScore;
    v5->_appCategoryScore = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appCategoryScore_v2"));
    v8 = objc_claimAutoreleasedReturnValue();
    appCategoryScore_v2 = v5->_appCategoryScore_v2;
    v5->_appCategoryScore_v2 = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalModeAffinityPrior"));
    v10 = objc_claimAutoreleasedReturnValue();
    globalModeAffinityPrior = v5->_globalModeAffinityPrior;
    v5->_globalModeAffinityPrior = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalInterruptingPrior"));
    v12 = objc_claimAutoreleasedReturnValue();
    globalInterruptingPrior = v5->_globalInterruptingPrior;
    v5->_globalInterruptingPrior = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationsReceivedInLastTwoWeeks"));
    v14 = objc_claimAutoreleasedReturnValue();
    notificationsReceivedInLastTwoWeeks = v5->_notificationsReceivedInLastTwoWeeks;
    v5->_notificationsReceivedInLastTwoWeeks = (NSNumber *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppInterruptionsCountByEntity"));
    v16 = objc_claimAutoreleasedReturnValue();
    modeAppInterruptionsCountByEntity = v5->_modeAppInterruptionsCountByEntity;
    v5->_modeAppInterruptionsCountByEntity = (NSNumber *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modePopularityOfInterruptingEntity"));
    v18 = objc_claimAutoreleasedReturnValue();
    modePopularityOfInterruptingEntity = v5->_modePopularityOfInterruptingEntity;
    v5->_modePopularityOfInterruptingEntity = (NSNumber *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppInterruptionsClassConditionalProbabilityByEntity"));
    v20 = objc_claimAutoreleasedReturnValue();
    modeAppInterruptionsClassConditionalProbabilityByEntity = v5->_modeAppInterruptionsClassConditionalProbabilityByEntity;
    v5->_modeAppInterruptionsClassConditionalProbabilityByEntity = (NSNumber *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalAppInterruptionsCountByEntity"));
    v22 = objc_claimAutoreleasedReturnValue();
    globalAppInterruptionsCountByEntity = v5->_globalAppInterruptionsCountByEntity;
    v5->_globalAppInterruptionsCountByEntity = (NSNumber *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalPopularityOfInterruptingEntity"));
    v24 = objc_claimAutoreleasedReturnValue();
    globalPopularityOfInterruptingEntity = v5->_globalPopularityOfInterruptingEntity;
    v5->_globalPopularityOfInterruptingEntity = (NSNumber *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ratioOfModePopularityToGlobalPopularityOfInterruptingEntity"));
    v26 = objc_claimAutoreleasedReturnValue();
    ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = v5->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
    v5->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity = (NSNumber *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsClearedForEntity"));
    v28 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsClearedForEntity = v5->_modeCountOfNotificationsClearedForEntity;
    v5->_modeCountOfNotificationsClearedForEntity = (NSNumber *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsClearedForEntity"));
    v30 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsClearedForEntity = v5->_globalCountOfNotificationsClearedForEntity;
    v5->_globalCountOfNotificationsClearedForEntity = (NSNumber *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localNotificationsClearedRateForEntity"));
    v32 = objc_claimAutoreleasedReturnValue();
    localNotificationsClearedRateForEntity = v5->_localNotificationsClearedRateForEntity;
    v5->_localNotificationsClearedRateForEntity = (NSNumber *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalNotificationsClearedRateForEntity"));
    v34 = objc_claimAutoreleasedReturnValue();
    globalNotificationsClearedRateForEntity = v5->_globalNotificationsClearedRateForEntity;
    v5->_globalNotificationsClearedRateForEntity = (NSNumber *)v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ratioOfLocalToGlobalNotificationsClearedRateForEntity"));
    v36 = objc_claimAutoreleasedReturnValue();
    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classConditionalOfNotificationsClearedForEntity"));
    v38 = objc_claimAutoreleasedReturnValue();
    classConditionalOfNotificationsClearedForEntity = v5->_classConditionalOfNotificationsClearedForEntity;
    v5->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsReceivedForEntity"));
    v40 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsReceivedForEntity = v5->_globalCountOfNotificationsReceivedForEntity;
    v5->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)v40;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsReceivedForEntity"));
    v42 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsReceivedForEntity = v5->_modeCountOfNotificationsReceivedForEntity;
    v5->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)v42;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localPopularityOfNotificationsReceivedForEntity"));
    v44 = objc_claimAutoreleasedReturnValue();
    localPopularityOfNotificationsReceivedForEntity = v5->_localPopularityOfNotificationsReceivedForEntity;
    v5->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)v44;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalPopularityOfNotificationsReceivedForEntity"));
    v46 = objc_claimAutoreleasedReturnValue();
    globalPopularityOfNotificationsReceivedForEntity = v5->_globalPopularityOfNotificationsReceivedForEntity;
    v5->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v46;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"));
    v48 = objc_claimAutoreleasedReturnValue();
    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v48;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classConditionalOfNotificationsReceivedForEntity"));
    v50 = objc_claimAutoreleasedReturnValue();
    classConditionalOfNotificationsReceivedForEntity = v5->_classConditionalOfNotificationsReceivedForEntity;
    v5->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)v50;

  }
  return v5;
}

- (id)jsonRepresentation
{
  NSNumber *globalModeAffinityPrior;
  NSNumber *modeAppInterruptionsCountByEntity;
  NSNumber *globalPopularityOfInterruptingEntity;
  NSNumber *localNotificationsClearedRateForEntity;
  NSNumber *ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  NSNumber *globalCountOfNotificationsReceivedForEntity;
  NSNumber *localPopularityOfNotificationsReceivedForEntity;
  NSNumber *ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  _QWORD v11[23];
  __int128 v12;
  NSNumber *v13;
  __int128 v14;
  NSNumber *v15;
  NSNumber *modePopularityOfInterruptingEntity;
  __int128 v17;
  NSNumber *v18;
  __int128 v19;
  NSNumber *globalCountOfNotificationsClearedForEntity;
  NSNumber *v21;
  NSNumber *globalNotificationsClearedRateForEntity;
  NSNumber *v23;
  NSNumber *classConditionalOfNotificationsClearedForEntity;
  NSNumber *v25;
  NSNumber *modeCountOfNotificationsReceivedForEntity;
  NSNumber *v27;
  NSNumber *globalPopularityOfNotificationsReceivedForEntity;
  NSNumber *v29;
  NSNumber *classConditionalOfNotificationsReceivedForEntity;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = *(_OWORD *)&self->_appCategoryScore;
  v11[0] = CFSTR("appCategoryScore");
  v11[1] = CFSTR("appCategoryScore_v2");
  globalModeAffinityPrior = self->_globalModeAffinityPrior;
  v11[2] = CFSTR("globalModeAffinityPrior");
  v11[3] = CFSTR("globalInterruptingPrior");
  v14 = *(_OWORD *)&self->_globalInterruptingPrior;
  v11[4] = CFSTR("notificationsReceivedInLastTwoWeeks");
  v11[5] = CFSTR("modeAppInterruptionsCountByEntity");
  modeAppInterruptionsCountByEntity = self->_modeAppInterruptionsCountByEntity;
  v13 = globalModeAffinityPrior;
  v15 = modeAppInterruptionsCountByEntity;
  v11[6] = CFSTR("modePopularityOfInterruptingEntity");
  v11[7] = CFSTR("modeAppInterruptionsClassConditionalProbabilityByEntity");
  v17 = *(_OWORD *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity;
  v11[8] = CFSTR("globalAppInterruptionsCountByEntity");
  v11[9] = CFSTR("globalPopularityOfInterruptingEntity");
  globalPopularityOfInterruptingEntity = self->_globalPopularityOfInterruptingEntity;
  modePopularityOfInterruptingEntity = self->_modePopularityOfInterruptingEntity;
  v18 = globalPopularityOfInterruptingEntity;
  v19 = *(_OWORD *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
  v11[10] = CFSTR("ratioOfModePopularityToGlobalPopularityOfInterruptingEntity");
  v11[11] = CFSTR("modeCountOfNotificationsClearedForEntity");
  v11[12] = CFSTR("globalCountOfNotificationsClearedForEntity");
  v11[13] = CFSTR("localNotificationsClearedRateForEntity");
  localNotificationsClearedRateForEntity = self->_localNotificationsClearedRateForEntity;
  globalCountOfNotificationsClearedForEntity = self->_globalCountOfNotificationsClearedForEntity;
  v21 = localNotificationsClearedRateForEntity;
  v11[14] = CFSTR("globalNotificationsClearedRateForEntity");
  v11[15] = CFSTR("ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  ratioOfLocalToGlobalNotificationsClearedRateForEntity = self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  globalNotificationsClearedRateForEntity = self->_globalNotificationsClearedRateForEntity;
  v23 = ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  v11[16] = CFSTR("classConditionalOfNotificationsClearedForEntity");
  v11[17] = CFSTR("globalCountOfNotificationsReceivedForEntity");
  globalCountOfNotificationsReceivedForEntity = self->_globalCountOfNotificationsReceivedForEntity;
  classConditionalOfNotificationsClearedForEntity = self->_classConditionalOfNotificationsClearedForEntity;
  v25 = globalCountOfNotificationsReceivedForEntity;
  v11[18] = CFSTR("modeCountOfNotificationsReceivedForEntity");
  v11[19] = CFSTR("localPopularityOfNotificationsReceivedForEntity");
  localPopularityOfNotificationsReceivedForEntity = self->_localPopularityOfNotificationsReceivedForEntity;
  modeCountOfNotificationsReceivedForEntity = self->_modeCountOfNotificationsReceivedForEntity;
  v27 = localPopularityOfNotificationsReceivedForEntity;
  v11[20] = CFSTR("globalPopularityOfNotificationsReceivedForEntity");
  v11[21] = CFSTR("ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  globalPopularityOfNotificationsReceivedForEntity = self->_globalPopularityOfNotificationsReceivedForEntity;
  v29 = ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  v11[22] = CFSTR("classConditionalOfNotificationsReceivedForEntity");
  classConditionalOfNotificationsReceivedForEntity = self->_classConditionalOfNotificationsReceivedForEntity;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, v11, 23);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)appCategoryScore
{
  return self->_appCategoryScore;
}

- (void)setAppCategoryScore:(id)a3
{
  objc_storeStrong((id *)&self->_appCategoryScore, a3);
}

- (NSNumber)appCategoryScore_v2
{
  return self->_appCategoryScore_v2;
}

- (void)setAppCategoryScore_v2:(id)a3
{
  objc_storeStrong((id *)&self->_appCategoryScore_v2, a3);
}

- (NSNumber)globalModeAffinityPrior
{
  return self->_globalModeAffinityPrior;
}

- (void)setGlobalModeAffinityPrior:(id)a3
{
  objc_storeStrong((id *)&self->_globalModeAffinityPrior, a3);
}

- (NSNumber)globalInterruptingPrior
{
  return self->_globalInterruptingPrior;
}

- (void)setGlobalInterruptingPrior:(id)a3
{
  objc_storeStrong((id *)&self->_globalInterruptingPrior, a3);
}

- (NSNumber)notificationsReceivedInLastTwoWeeks
{
  return self->_notificationsReceivedInLastTwoWeeks;
}

- (void)setNotificationsReceivedInLastTwoWeeks:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsReceivedInLastTwoWeeks, a3);
}

- (NSNumber)modeAppInterruptionsCountByEntity
{
  return self->_modeAppInterruptionsCountByEntity;
}

- (void)setModeAppInterruptionsCountByEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountByEntity, a3);
}

- (NSNumber)modeAppInterruptionsClassConditionalProbabilityByEntity
{
  return self->_modeAppInterruptionsClassConditionalProbabilityByEntity;
}

- (void)setModeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity, a3);
}

- (NSNumber)globalAppInterruptionsCountByEntity
{
  return self->_globalAppInterruptionsCountByEntity;
}

- (void)setGlobalAppInterruptionsCountByEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountByEntity, a3);
}

- (NSNumber)globalPopularityOfInterruptingEntity
{
  return self->_globalPopularityOfInterruptingEntity;
}

- (void)setGlobalPopularityOfInterruptingEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalPopularityOfInterruptingEntity, a3);
}

- (NSNumber)modePopularityOfInterruptingEntity
{
  return self->_modePopularityOfInterruptingEntity;
}

- (void)setModePopularityOfInterruptingEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modePopularityOfInterruptingEntity, a3);
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity, a3);
}

- (NSNumber)modeCountOfNotificationsClearedForEntity
{
  return self->_modeCountOfNotificationsClearedForEntity;
}

- (void)setModeCountOfNotificationsClearedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedForEntity, a3);
}

- (NSNumber)globalCountOfNotificationsClearedForEntity
{
  return self->_globalCountOfNotificationsClearedForEntity;
}

- (void)setGlobalCountOfNotificationsClearedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedForEntity, a3);
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

- (NSNumber)globalCountOfNotificationsReceivedForEntity
{
  return self->_globalCountOfNotificationsReceivedForEntity;
}

- (void)setGlobalCountOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedForEntity, a3);
}

- (NSNumber)modeCountOfNotificationsReceivedForEntity
{
  return self->_modeCountOfNotificationsReceivedForEntity;
}

- (void)setModeCountOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedForEntity, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_localPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_localNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_modePopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInLastTwoWeeks, 0);
  objc_storeStrong((id *)&self->_globalInterruptingPrior, 0);
  objc_storeStrong((id *)&self->_globalModeAffinityPrior, 0);
  objc_storeStrong((id *)&self->_appCategoryScore_v2, 0);
  objc_storeStrong((id *)&self->_appCategoryScore, 0);
}

@end
