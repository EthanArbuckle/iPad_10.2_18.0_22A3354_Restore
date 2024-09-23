@implementation ACHServer

+ (id)serverWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 awardingScheduler:(id)a6 achievementStore:(id)a7 mobileAssetProvider:(id)a8 templateSourceScheduler:(id)a9 monthlyChallengeTemplateSource:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  objc_msgSend(v16, "process");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hasRequiredEntitlement:error:", *MEMORY[0x24BDD3310], a11);

  if (v25)
  {
    v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClient:templateStore:earnedInstanceStore:awardingScheduler:achievementStore:mobileAssetProvider:templateSourceScheduler:monthlyChallengeTemplateSource:", v16, v17, v18, v19, v20, v21, v22, v23);
  }
  else
  {
    v27 = v23;
    ACHLogXPC();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v28, OS_LOG_TYPE_DEFAULT, "ACHServer rejecting client connection missing entitlement.", buf, 2u);
    }

    v26 = 0;
    v23 = v27;
  }

  return v26;
}

+ (id)serverWithTemplateStore:(id)a3 earnedInstanceStore:(id)a4 awardingScheduler:(id)a5 achievementStore:(id)a6 mobileAssetProvider:(id)a7 templateSourceScheduler:(id)a8 monthlyChallengeTemplateSource:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClient:templateStore:earnedInstanceStore:awardingScheduler:achievementStore:mobileAssetProvider:templateSourceScheduler:monthlyChallengeTemplateSource:", 0, v22, v21, v20, v19, v18, v17, v16);

  return v23;
}

- (ACHServer)initWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 awardingScheduler:(id)a6 achievementStore:(id)a7 mobileAssetProvider:(id)a8 templateSourceScheduler:(id)a9 monthlyChallengeTemplateSource:(id)a10
{
  id v17;
  ACHServer *v18;
  ACHServer *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ACHServer;
  v18 = -[ACHServer init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_client, a3);
    objc_storeStrong((id *)&v19->_templateStore, a4);
    objc_storeStrong((id *)&v19->_earnedInstanceStore, a5);
    objc_storeStrong((id *)&v19->_awardingScheduler, a6);
    objc_storeStrong((id *)&v19->_achievementStore, a7);
    objc_storeStrong((id *)&v19->_mobileAssetProvider, a8);
    objc_storeStrong((id *)&v19->_templateSourceScheduler, a9);
    objc_storeStrong((id *)&v19->_monthlyChallengeTemplateSource, a10);
  }

  return v19;
}

- (id)remoteInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  void *v2;
  id v3;

  -[ACHServer client](self, "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)remote_addTemplate:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = a3;
  -[ACHServer templateStore](self, "templateStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addTemplates:", v9);
  v6[2](v6, 1, 0);

}

- (void)remote_removeTemplate:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[ACHServer templateStore](self, "templateStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10 = objc_msgSend(v8, "removeTemplates:error:", v9, &v12);
  v11 = v12;

  v6[2](v6, v10, v11);
}

- (void)remote_removeAllTemplatesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[ACHServer templateStore](self, "templateStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "removeAllTemplates:", &v8);
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_fetchAllTemplatesWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[ACHServer templateStore](self, "templateStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allTemplates");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6, 0);
}

- (void)remote_fetchAllEarnedInstancesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[ACHServer earnedInstanceStore](self, "earnedInstanceStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earnedInstances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)remote_removeAllEarnedInstancesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[ACHServer earnedInstanceStore](self, "earnedInstanceStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "removeAllEarnedInstancesWithError:", &v8);
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_addEarnedInstance:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[ACHServer earnedInstanceStore](self, "earnedInstanceStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v10 = objc_msgSend(v8, "addEarnedInstances:error:", v9, &v12);
  v11 = v12;

  v6[2](v6, v10, v11);
}

- (void)remote_removeEarnedInstance:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[ACHServer earnedInstanceStore](self, "earnedInstanceStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10 = objc_msgSend(v8, "removeEarnedInstances:error:", v9, &v12);
  v11 = v12;

  v6[2](v6, v10, v11);
}

- (void)remote_fetchAllAchievementsWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[ACHServer achievementStore](self, "achievementStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allAchievements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v7, 0);
}

- (void)remote_fetchAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = a3;
  -[ACHServer achievementStore](self, "achievementStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "achievementWithTemplateUniqueName:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9, 0);
}

- (void)remote_fetchEphemeralAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = a3;
  -[ACHServer achievementStore](self, "achievementStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ephemeralAchievementWithTemplateUniqueName:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9, 0);
}

- (void)remote_forceAwardingSchedulerWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACHServer awardingScheduler](self, "awardingScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestAwardingEvaluationWithCompletion:", v4);

}

- (void)remote_fetchActivityChallengeAssetsServerURLWithCompletion:(id)a3
{
  void (**v3)(id, void *, id);
  void *v4;
  id v5;

  v3 = (void (**)(id, void *, id))a3;
  ACHMobileAssetServerURLWithError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v3[2](v3, v4, v5);

}

- (void)remote_setActivityChallengeAssetsServerURL:(id)a3 completion:(id)a4
{
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a4;
  ACHSetMobileAssetServerURL();
  v4[2](v4, 1, 0);

}

- (void)remote_availableMobileAssetsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACHServer mobileAssetProvider](self, "mobileAssetProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableAssetsWithCompletion:", v4);

}

- (void)remote_runMonthlyChallengesWithCompletion:(id)a3
{
  void (**v4)(id, BOOL, id);
  void *v5;
  id v6;
  id v7;

  v4 = (void (**)(id, BOOL, id))a3;
  -[ACHServer templateSourceScheduler](self, "templateSourceScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v5, "_runSynchronouslyWithError:", &v7);
  v6 = v7;

  if (v4)
    v4[2](v4, v6 == 0, v6);

}

- (void)remote_templateForMonthlyChallengeType:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, id))a4;
  -[ACHServer monthlyChallengeTemplateSource](self, "monthlyChallengeTemplateSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v8 = objc_msgSend(v7, "isMonthlyChallengeOfTypeAvailable:error:", a3, &v31);
  v9 = v31;

  if (!v8)
  {
    v22 = 0;
    if (!v6)
      goto LABEL_8;
LABEL_7:
    v6[2](v6, v22, v9);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 12, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dateFromComponents:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 28, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "hk_startOfMonthForDate:addingMonths:", v13, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v14;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v14, v15);
  -[ACHServer monthlyChallengeTemplateSource](self, "monthlyChallengeTemplateSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v9;
  objc_msgSend(v17, "_goalValueForCurrentMonthForType:error:", a3, &v30);
  v19 = v18;
  v20 = v30;

  -[ACHServer monthlyChallengeTemplateSource](self, "monthlyChallengeTemplateSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_createMonthlyChallengeTemplateWithType:dateCompoonentInterval:goalValue:", a3, v16, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHServer monthlyChallengeTemplateSource](self, "monthlyChallengeTemplateSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v20;
  objc_msgSend(v23, "_suffixForCurrentMonthForType:template:goal:error:", a3, v22, &v29, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;

  if (v24)
  {
    v32[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAvailableSuffixes:", v25);

  }
  if (v6)
    goto LABEL_7;
LABEL_8:

}

- (void)remote_monthlyChallengeForDate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[ACHServer templateStore](self, "templateStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allTemplates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    v12 = (void *)*MEMORY[0x24BE01638];
    v31 = *MEMORY[0x24BE012A8];
    v29 = (void *)*MEMORY[0x24BE01638];
    while (2)
    {
      v13 = 0;
      v32 = v10;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        objc_msgSend(v14, "sourceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v12)
        {
          objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "components:fromDate:", v31, v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uniqueName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("_"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "count") == 3)
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "integerValue");

            objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
            v22 = v11;
            v23 = v8;
            v24 = v6;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v25, "integerValue");

            v6 = v24;
            v8 = v23;
            v11 = v22;
            v26 = v21 == objc_msgSend(v17, "year");
            v12 = v29;
            if (v26 && v30 == objc_msgSend(v17, "month"))
            {
              v27 = v28;
              (*((void (**)(id, void *, _QWORD))v28 + 2))(v28, v14, 0);

              goto LABEL_16;
            }
          }

          v10 = v32;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v10)
        continue;
      break;
    }
  }

  v27 = v28;
  (*((void (**)(id, _QWORD, _QWORD))v28 + 2))(v28, 0, 0);
LABEL_16:

}

- (HDXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
  objc_storeStrong((id *)&self->_templateStore, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceStore, a3);
}

- (ACHAwardingScheduler)awardingScheduler
{
  return self->_awardingScheduler;
}

- (void)setAwardingScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_awardingScheduler, a3);
}

- (ACHAchievementStoring)achievementStore
{
  return self->_achievementStore;
}

- (void)setAchievementStore:(id)a3
{
  objc_storeStrong((id *)&self->_achievementStore, a3);
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, a3);
}

- (ACHTemplateSourceScheduler)templateSourceScheduler
{
  return self->_templateSourceScheduler;
}

- (void)setTemplateSourceScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_templateSourceScheduler, a3);
}

- (ACHMonthlyChallengeTemplateSource)monthlyChallengeTemplateSource
{
  return self->_monthlyChallengeTemplateSource;
}

- (void)setMonthlyChallengeTemplateSource:(id)a3
{
  objc_storeStrong((id *)&self->_monthlyChallengeTemplateSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlyChallengeTemplateSource, 0);
  objc_storeStrong((id *)&self->_templateSourceScheduler, 0);
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_storeStrong((id *)&self->_achievementStore, 0);
  objc_storeStrong((id *)&self->_awardingScheduler, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
