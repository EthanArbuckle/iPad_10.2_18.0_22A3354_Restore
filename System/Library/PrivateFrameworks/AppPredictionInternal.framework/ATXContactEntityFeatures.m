@implementation ATXContactEntityFeatures

- (ATXContactEntityFeatures)init
{
  ATXContactEntityFeatures *v2;
  ATXContactEntityFeatures *v3;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ATXContactEntityFeatures;
  v2 = -[ATXContactEntityFeatures init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    modeCountOfNotificationsClearedForEntity = v2->_modeCountOfNotificationsClearedForEntity;
    v2->_modeCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1E83CDE70;

    globalCountOfNotificationsClearedForEntity = v3->_globalCountOfNotificationsClearedForEntity;
    v3->_globalCountOfNotificationsClearedForEntity = (NSNumber *)&unk_1E83CDE70;

    localNotificationsClearedRateForEntity = v3->_localNotificationsClearedRateForEntity;
    v3->_localNotificationsClearedRateForEntity = (NSNumber *)&unk_1E83CDE70;

    globalNotificationsClearedRateForEntity = v3->_globalNotificationsClearedRateForEntity;
    v3->_globalNotificationsClearedRateForEntity = (NSNumber *)&unk_1E83CDE70;

    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v3->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)&unk_1E83CDE70;

    classConditionalOfNotificationsClearedForEntity = v3->_classConditionalOfNotificationsClearedForEntity;
    v3->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)&unk_1E83CDE70;

    globalCountOfNotificationsReceivedForEntity = v3->_globalCountOfNotificationsReceivedForEntity;
    v3->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CDE70;

    modeCountOfNotificationsReceivedForEntity = v3->_modeCountOfNotificationsReceivedForEntity;
    v3->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CDE70;

    localPopularityOfNotificationsReceivedForEntity = v3->_localPopularityOfNotificationsReceivedForEntity;
    v3->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CDE70;

    globalPopularityOfNotificationsReceivedForEntity = v3->_globalPopularityOfNotificationsReceivedForEntity;
    v3->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CDE70;

    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v3->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CDE70;

    classConditionalOfNotificationsReceivedForEntity = v3->_classConditionalOfNotificationsReceivedForEntity;
    v3->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)&unk_1E83CDE70;

  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXContactEntityFeatures *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSNumber *modeCountOfNotificationsClearedForEntity;
  uint64_t v12;
  NSNumber *globalCountOfNotificationsClearedForEntity;
  uint64_t v14;
  NSNumber *localNotificationsClearedRateForEntity;
  uint64_t v16;
  NSNumber *globalNotificationsClearedRateForEntity;
  uint64_t v18;
  NSNumber *ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  uint64_t v20;
  NSNumber *classConditionalOfNotificationsClearedForEntity;
  uint64_t v22;
  NSNumber *globalCountOfNotificationsReceivedForEntity;
  uint64_t v24;
  NSNumber *modeCountOfNotificationsReceivedForEntity;
  uint64_t v26;
  NSNumber *localPopularityOfNotificationsReceivedForEntity;
  uint64_t v28;
  NSNumber *globalPopularityOfNotificationsReceivedForEntity;
  uint64_t v30;
  NSNumber *ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
  uint64_t v32;
  NSNumber *classConditionalOfNotificationsReceivedForEntity;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ATXContactEntityFeatures;
  v5 = -[ATXContactEntityFeatures init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFavorite"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isFavoriteContact = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVIP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isVIPContact = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmergency"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEmergencyContact = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isICloudFamilyMember"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isICloudFamilyMember = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsClearedForEntity"));
    v10 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsClearedForEntity = v5->_modeCountOfNotificationsClearedForEntity;
    v5->_modeCountOfNotificationsClearedForEntity = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsClearedForEntity"));
    v12 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsClearedForEntity = v5->_globalCountOfNotificationsClearedForEntity;
    v5->_globalCountOfNotificationsClearedForEntity = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localNotificationsClearedRateForEntity"));
    v14 = objc_claimAutoreleasedReturnValue();
    localNotificationsClearedRateForEntity = v5->_localNotificationsClearedRateForEntity;
    v5->_localNotificationsClearedRateForEntity = (NSNumber *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalNotificationsClearedRateForEntity"));
    v16 = objc_claimAutoreleasedReturnValue();
    globalNotificationsClearedRateForEntity = v5->_globalNotificationsClearedRateForEntity;
    v5->_globalNotificationsClearedRateForEntity = (NSNumber *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ratioOfLocalToGlobalNotificationsClearedRateForEntity"));
    v18 = objc_claimAutoreleasedReturnValue();
    ratioOfLocalToGlobalNotificationsClearedRateForEntity = v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
    v5->_ratioOfLocalToGlobalNotificationsClearedRateForEntity = (NSNumber *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classConditionalOfNotificationsClearedForEntity"));
    v20 = objc_claimAutoreleasedReturnValue();
    classConditionalOfNotificationsClearedForEntity = v5->_classConditionalOfNotificationsClearedForEntity;
    v5->_classConditionalOfNotificationsClearedForEntity = (NSNumber *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsReceivedForEntity"));
    v22 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsReceivedForEntity = v5->_globalCountOfNotificationsReceivedForEntity;
    v5->_globalCountOfNotificationsReceivedForEntity = (NSNumber *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsReceivedForEntity"));
    v24 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsReceivedForEntity = v5->_modeCountOfNotificationsReceivedForEntity;
    v5->_modeCountOfNotificationsReceivedForEntity = (NSNumber *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localPopularityOfNotificationsReceivedForEntity"));
    v26 = objc_claimAutoreleasedReturnValue();
    localPopularityOfNotificationsReceivedForEntity = v5->_localPopularityOfNotificationsReceivedForEntity;
    v5->_localPopularityOfNotificationsReceivedForEntity = (NSNumber *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalPopularityOfNotificationsReceivedForEntity"));
    v28 = objc_claimAutoreleasedReturnValue();
    globalPopularityOfNotificationsReceivedForEntity = v5->_globalPopularityOfNotificationsReceivedForEntity;
    v5->_globalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"));
    v30 = objc_claimAutoreleasedReturnValue();
    ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
    v5->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity = (NSNumber *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classConditionalOfNotificationsReceivedForEntity"));
    v32 = objc_claimAutoreleasedReturnValue();
    classConditionalOfNotificationsReceivedForEntity = v5->_classConditionalOfNotificationsReceivedForEntity;
    v5->_classConditionalOfNotificationsReceivedForEntity = (NSNumber *)v32;

  }
  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *modeCountOfNotificationsClearedForEntity;
  NSNumber *globalCountOfNotificationsClearedForEntity;
  NSNumber *classConditionalOfNotificationsClearedForEntity;
  void *v10;
  _QWORD v12[16];
  _QWORD v13[6];
  __int128 v14;
  NSNumber *ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  NSNumber *v16;
  __int128 v17;
  NSNumber *localPopularityOfNotificationsReceivedForEntity;
  __int128 v19;
  NSNumber *classConditionalOfNotificationsReceivedForEntity;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("isFavorite");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFavoriteContact);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("isVIP");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVIPContact);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("isEmergency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEmergencyContact);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("isICloudFamilyMember");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isICloudFamilyMember);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  modeCountOfNotificationsClearedForEntity = self->_modeCountOfNotificationsClearedForEntity;
  globalCountOfNotificationsClearedForEntity = self->_globalCountOfNotificationsClearedForEntity;
  v13[3] = v6;
  v13[4] = modeCountOfNotificationsClearedForEntity;
  v12[4] = CFSTR("modeCountOfNotificationsClearedForEntity");
  v12[5] = CFSTR("globalCountOfNotificationsClearedForEntity");
  v13[5] = globalCountOfNotificationsClearedForEntity;
  v14 = *(_OWORD *)&self->_localNotificationsClearedRateForEntity;
  v12[6] = CFSTR("localNotificationsClearedRateForEntity");
  v12[7] = CFSTR("globalNotificationsClearedRateForEntity");
  v12[8] = CFSTR("ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  v12[9] = CFSTR("classConditionalOfNotificationsClearedForEntity");
  classConditionalOfNotificationsClearedForEntity = self->_classConditionalOfNotificationsClearedForEntity;
  ratioOfLocalToGlobalNotificationsClearedRateForEntity = self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
  v16 = classConditionalOfNotificationsClearedForEntity;
  v17 = *(_OWORD *)&self->_globalCountOfNotificationsReceivedForEntity;
  v12[10] = CFSTR("globalCountOfNotificationsReceivedForEntity");
  v12[11] = CFSTR("modeCountOfNotificationsReceivedForEntity");
  localPopularityOfNotificationsReceivedForEntity = self->_localPopularityOfNotificationsReceivedForEntity;
  v12[12] = CFSTR("localPopularityOfNotificationsReceivedForEntity");
  v12[13] = CFSTR("globalPopularityOfNotificationsReceivedForEntity");
  v19 = *(_OWORD *)&self->_globalPopularityOfNotificationsReceivedForEntity;
  v12[14] = CFSTR("ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  v12[15] = CFSTR("classConditionalOfNotificationsReceivedForEntity");
  classConditionalOfNotificationsReceivedForEntity = self->_classConditionalOfNotificationsReceivedForEntity;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isFavoriteContact
{
  return self->_isFavoriteContact;
}

- (void)setIsFavoriteContact:(BOOL)a3
{
  self->_isFavoriteContact = a3;
}

- (BOOL)isVIPContact
{
  return self->_isVIPContact;
}

- (void)setIsVIPContact:(BOOL)a3
{
  self->_isVIPContact = a3;
}

- (BOOL)isEmergencyContact
{
  return self->_isEmergencyContact;
}

- (void)setIsEmergencyContact:(BOOL)a3
{
  self->_isEmergencyContact = a3;
}

- (BOOL)isICloudFamilyMember
{
  return self->_isICloudFamilyMember;
}

- (void)setIsICloudFamilyMember:(BOOL)a3
{
  self->_isICloudFamilyMember = a3;
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
}

@end
