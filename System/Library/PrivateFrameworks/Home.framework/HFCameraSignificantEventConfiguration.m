@implementation HFCameraSignificantEventConfiguration

+ (id)configurationWithEventTypes:(unint64_t)a3 personFamiliarityOptions:(unint64_t)a4
{
  id v6;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setEventTypes:", a3);
  objc_msgSend(v6, "setPersonFamiliarityOptions:", a4);
  return v6;
}

+ (id)configurationForCameraProfilesNotificationSettings:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "na_filter:", &__block_literal_global_40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_configurationForCameraProfiles:eventTypesTransform:personFamiliarityOptionsTransform:", v4, &__block_literal_global_2_5, &__block_literal_global_3_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __92__HFCameraSignificantEventConfiguration_configurationForCameraProfilesNotificationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smartNotificationBulletin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

uint64_t __92__HFCameraSignificantEventConfiguration_configurationForCameraProfilesNotificationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smartNotificationBulletin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "significantEventTypes");

  return v4;
}

uint64_t __92__HFCameraSignificantEventConfiguration_configurationForCameraProfilesNotificationSettings___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smartNotificationBulletin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "personFamiliarityOptions");

  return v4;
}

+ (id)configurationForCameraProfilesRecordingSettings:(id)a3
{
  return (id)objc_msgSend(a1, "_configurationForCameraProfiles:eventTypesTransform:personFamiliarityOptionsTransform:", a3, &__block_literal_global_4_1, &__block_literal_global_5_1);
}

uint64_t __89__HFCameraSignificantEventConfiguration_configurationForCameraProfilesRecordingSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recordingEventTriggers");

  return v3;
}

uint64_t __89__HFCameraSignificantEventConfiguration_configurationForCameraProfilesRecordingSettings___block_invoke_2()
{
  return 0;
}

+ (id)defaultAnyMotionConfiguration
{
  return (id)objc_msgSend(a1, "configurationWithEventTypes:personFamiliarityOptions:", 31, 0);
}

+ (id)defaultSmartMotionConfiguration
{
  return (id)objc_msgSend(a1, "configurationWithEventTypes:personFamiliarityOptions:", 30, 7);
}

- (BOOL)isFaceDetectionConfiguration
{
  return (-[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes") & 2) != 0
      && -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions") != 0;
}

- (BOOL)containsConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes");
  if ((objc_msgSend(v4, "eventTypes") & ~v5) != 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions");
    v7 = (objc_msgSend(v4, "personFamiliarityOptions") & ~v6) == 0;
  }

  return v7;
}

- (void)addConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  -[HFCameraSignificantEventConfiguration setEventTypes:](self, "setEventTypes:", objc_msgSend(v4, "eventTypes") | -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes"));
  v5 = -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions");
  v6 = objc_msgSend(v4, "personFamiliarityOptions");

  -[HFCameraSignificantEventConfiguration setPersonFamiliarityOptions:](self, "setPersonFamiliarityOptions:", v6 | v5);
}

- (void)removeConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  -[HFCameraSignificantEventConfiguration setEventTypes:](self, "setEventTypes:", -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes") & ~objc_msgSend(v4, "eventTypes"));
  v5 = -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions");
  v6 = objc_msgSend(v4, "personFamiliarityOptions");

  -[HFCameraSignificantEventConfiguration setPersonFamiliarityOptions:](self, "setPersonFamiliarityOptions:", v5 & ~v6);
}

- (id)predicateRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CBA3B8], "predicateForSignificantEventTypes:personFamiliarityOptions:", -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes"), -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions"));
}

- (id)localizedDescription
{
  void *v2;
  void *v3;

  -[HFCameraSignificantEventConfiguration localizationKey](self, "localizationKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizationKey
{
  if (-[HFCameraSignificantEventConfiguration isFaceDetectionConfiguration](self, "isFaceDetectionConfiguration"))
    HFLocalizationKeyFromHMCameraSignificantEventPersonFamiliarityOptions(-[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions"));
  else
    HFLocalizationKeyFromHMCameraMotionDetectionType(-[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7
    && (v8 = -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes"),
        v8 == objc_msgSend(v7, "eventTypes")))
  {
    v9 = -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions");
    v10 = v9 == objc_msgSend(v7, "personFamiliarityOptions");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions");
  return v3 + 131 * -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes");
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[HFCameraSignificantEventConfiguration configurationWithEventTypes:personFamiliarityOptions:](HFCameraSignificantEventConfiguration, "configurationWithEventTypes:personFamiliarityOptions:", -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes", a3), -[HFCameraSignificantEventConfiguration personFamiliarityOptions](self, "personFamiliarityOptions"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_configurationForCameraProfiles:(id)a3 eventTypesTransform:(id)a4 personFamiliarityOptionsTransform:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __127__HFCameraSignificantEventConfiguration__configurationForCameraProfiles_eventTypesTransform_personFamiliarityOptionsTransform___block_invoke;
  v26 = &unk_1EA72B370;
  v13 = v11;
  v27 = v13;
  v29 = v9;
  v14 = v12;
  v28 = v14;
  v30 = v10;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v8, "na_each:", &v23);
  if (objc_msgSend(v13, "count", v23, v24, v25, v26) == 1)
  {
    v17 = objc_msgSend(v13, "firstIndex");
  }
  else
  {
    HFLogForCategory(0x1AuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v13;
      v33 = 2112;
      v34 = v8;
      _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "Mismatched HMCameraSignificantEventTypes:%@ for HMCameraProfiles:%@", buf, 0x16u);
    }

    v17 = 1;
  }
  if (objc_msgSend(v14, "count") == 1)
  {
    v19 = objc_msgSend(v14, "firstIndex");
  }
  else
  {
    HFLogForCategory(0x1AuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v14;
      v33 = 2112;
      v34 = v8;
      _os_log_error_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_ERROR, "Mismatched HMCameraSignificantEventPersonFamiliarityOptions:%@ for HMCameraProfiles:%@", buf, 0x16u);
    }

    v19 = 7;
  }
  objc_msgSend(a1, "configurationWithEventTypes:personFamiliarityOptions:", v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __127__HFCameraSignificantEventConfiguration__configurationForCameraProfiles_eventTypesTransform_personFamiliarityOptionsTransform___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, id);
  id v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)a1[4];
  v4 = a1[6];
  v5 = *(uint64_t (**)(uint64_t, id))(v4 + 16);
  v6 = a2;
  objc_msgSend(v3, "addIndex:", v5(v4, v6));
  v7 = (void *)a1[5];
  v8 = (*(uint64_t (**)(void))(a1[7] + 16))();

  return objc_msgSend(v7, "addIndex:", v8);
}

- (unint64_t)eventTypes
{
  return self->_eventTypes;
}

- (void)setEventTypes:(unint64_t)a3
{
  self->_eventTypes = a3;
}

- (unint64_t)personFamiliarityOptions
{
  return self->_personFamiliarityOptions;
}

- (void)setPersonFamiliarityOptions:(unint64_t)a3
{
  self->_personFamiliarityOptions = a3;
}

@end
