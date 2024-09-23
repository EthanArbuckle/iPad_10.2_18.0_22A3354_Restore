@implementation HDAnalyticsSubmissionCoordinator

- (void)tinker_pairingDidFinishForConfiguration:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.tinker.%@"), CFSTR("pairing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFinishForConfiguration_duration___block_invoke;
  v9[3] = &unk_1E6CE8138;
  v11 = a4;
  v10 = v6;
  v8 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v7, v9);

}

id __93__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFinishForConfiguration_duration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C9AAB0];
  v6[0] = CFSTR("success");
  v6[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = CFSTR("setupType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "setupType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)tinker_pairingDidFailWithError:(id)a3 configuration:(id)a4 duration:(double)a5 stage:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.tinker.%@"), CFSTR("pairing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFailWithError_configuration_duration_stage___block_invoke;
  v14[3] = &unk_1E6CE8160;
  v17 = a5;
  v15 = v10;
  v16 = v9;
  v12 = v9;
  v13 = v10;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v11, v14);

}

id __104__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFailWithError_configuration_duration_stage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v11[0] = MEMORY[0x1E0C9AAA0];
  v10[0] = CFSTR("success");
  v10[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v10[2] = CFSTR("setupType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "setupType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v3;
  v10[3] = CFSTR("errorDomain");
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("<null>");
  if (v4)
    v6 = (const __CFString *)v4;
  v11[3] = v6;
  v10[4] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)tinker_syncFinishedWithLatency:(id)a3 timeSinceLastSuccessfullPull:(id)a4 configuration:(id)a5
{
  -[HDAnalyticsSubmissionCoordinator _sendTinkerSyncEventWithLatency:timeSinceLastSuccessfullPull:configuration:success:error:](self, a3, a4, a5, 1, 0);
}

- (void)_sendTinkerSyncEventWithLatency:(void *)a3 timeSinceLastSuccessfullPull:(void *)a4 configuration:(char)a5 success:(void *)a6 error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.tinker.%@"), CFSTR("sync"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __133__HDAnalyticsSubmissionCoordinator_Tinker___sendTinkerSyncEventWithLatency_timeSinceLastSuccessfullPull_configuration_success_error___block_invoke;
    v16[3] = &unk_1E6CE8188;
    v17 = v13;
    v21 = a5;
    v18 = v11;
    v19 = v12;
    v20 = v14;
    objc_msgSend(a1, "sendEvent:block:", v15, v16);

  }
}

- (void)tinker_syncFailedWithError:(id)a3 configuration:(id)a4
{
  -[HDAnalyticsSubmissionCoordinator _sendTinkerSyncEventWithLatency:timeSinceLastSuccessfullPull:configuration:success:error:](self, 0, 0, a4, 0, a3);
}

id __133__HDAnalyticsSubmissionCoordinator_Tinker___sendTinkerSyncEventWithLatency_timeSinceLastSuccessfullPull_configuration_success_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryCKContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseForContainer(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v6;
  HDCKDatabaseScopeToString(objc_msgSend(v6, "databaseScope"));
  v7 = objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("container");
  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("primaryContainer"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  v29[1] = v7;
  v26 = (void *)v7;
  v28[1] = CFSTR("database");
  v28[2] = CFSTR("reason");
  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v28[3] = CFSTR("options");
  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("options"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v11;
  v28[4] = CFSTR("group");
  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("group"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v13;
  v28[5] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("latency"));
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("timeSinceLastSuccessfullPull"));
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 56), "domain");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (const __CFString *)v19;
    else
      v21 = CFSTR("<null>");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "code"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("errorCode"));

  }
  return v16;
}

- (void)medicalID_dailyReport:(id)a3 sosContactStatus:(BOOL)a4 profileType:(int64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  BOOL v13;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_dailyReport_sosContactStatus_profileType___block_invoke;
  v10[3] = &unk_1E6CEAED0;
  v13 = a4;
  v11 = v8;
  v12 = a5;
  v9 = v8;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.HealthApp.MedicalID.Daily"), v10);

}

id __98__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_dailyReport_sosContactStatus_profileType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  uint64_t v35;
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
  _QWORD v48[23];
  _QWORD v49[25];

  v49[23] = *MEMORY[0x1E0C80C00];
  v48[0] = CFSTR("allergyInfo");
  objc_msgSend(*(id *)(a1 + 32), "allergyInfo");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "length"))
    v2 = &unk_1E6DFA838;
  else
    v2 = &unk_1E6DFA850;
  v49[0] = v2;
  v48[1] = CFSTR("bloodType");
  if (objc_msgSend(*(id *)(a1 + 32), "bloodType"))
    v3 = &unk_1E6DFA838;
  else
    v3 = &unk_1E6DFA850;
  v49[1] = v3;
  v48[2] = CFSTR("clinicalContacts");
  objc_msgSend(*(id *)(a1 + 32), "clinicalContacts");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "count"))
    v4 = &unk_1E6DFA838;
  else
    v4 = &unk_1E6DFA850;
  v49[2] = v4;
  v48[3] = CFSTR("emergencyContacts");
  objc_msgSend(*(id *)(a1 + 32), "emergencyContacts");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "count"))
    v5 = &unk_1E6DFA838;
  else
    v5 = &unk_1E6DFA850;
  v49[3] = v5;
  v48[4] = CFSTR("gregorianBirthdate");
  objc_msgSend(*(id *)(a1 + 32), "gregorianBirthday");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    v6 = &unk_1E6DFA838;
  else
    v6 = &unk_1E6DFA850;
  v49[4] = v6;
  v48[5] = CFSTR("height");
  objc_msgSend(*(id *)(a1 + 32), "height");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    v7 = &unk_1E6DFA838;
  else
    v7 = &unk_1E6DFA850;
  v49[5] = v7;
  v48[6] = CFSTR("isShownOnLockScreen");
  if (objc_msgSend(*(id *)(a1 + 32), "isDisabled"))
    v8 = &unk_1E6DFA850;
  else
    v8 = &unk_1E6DFA838;
  v49[6] = v8;
  v48[7] = CFSTR("medicalConditions");
  objc_msgSend(*(id *)(a1 + 32), "medicalConditions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "length"))
    v9 = &unk_1E6DFA838;
  else
    v9 = &unk_1E6DFA850;
  v49[7] = v9;
  v48[8] = CFSTR("medicalNotes");
  objc_msgSend(*(id *)(a1 + 32), "medicalNotes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "length"))
    v10 = &unk_1E6DFA838;
  else
    v10 = &unk_1E6DFA850;
  v49[8] = v10;
  v48[9] = CFSTR("medicationInfo");
  objc_msgSend(*(id *)(a1 + 32), "medicationInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "length"))
    v11 = &unk_1E6DFA838;
  else
    v11 = &unk_1E6DFA850;
  v49[9] = v11;
  v48[10] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    v12 = &unk_1E6DFA838;
  else
    v12 = &unk_1E6DFA850;
  v49[10] = v12;
  v48[11] = CFSTR("organDonorStatus");
  objc_msgSend(*(id *)(a1 + 32), "isOrganDonor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    v13 = &unk_1E6DFA838;
  else
    v13 = &unk_1E6DFA850;
  v49[11] = v13;
  v48[12] = CFSTR("picture");
  objc_msgSend(*(id *)(a1 + 32), "pictureData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    v14 = &unk_1E6DFA838;
  else
    v14 = &unk_1E6DFA850;
  v49[12] = v14;
  v48[13] = CFSTR("primaryLanguageCode");
  objc_msgSend(*(id *)(a1 + 32), "primaryLanguageCode");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
    v15 = &unk_1E6DFA838;
  else
    v15 = &unk_1E6DFA850;
  v49[13] = v15;
  v48[14] = CFSTR("shareDuringEmergency");
  if (objc_msgSend(*(id *)(a1 + 32), "shareDuringEmergency", v35))
    v16 = &unk_1E6DFA838;
  else
    v16 = &unk_1E6DFA850;
  v49[14] = v16;
  v48[15] = CFSTR("weight");
  objc_msgSend(*(id *)(a1 + 32), "weight");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = &unk_1E6DFA838;
  else
    v18 = &unk_1E6DFA850;
  if (*(_BYTE *)(a1 + 48))
    v19 = &unk_1E6DFA850;
  else
    v19 = &unk_1E6DFA838;
  v49[15] = v18;
  v49[16] = v19;
  v48[16] = CFSTR("sosContactBug");
  v48[17] = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[17] = v20;
  v48[18] = CFSTR("medicationsList");
  objc_msgSend(*(id *)(a1 + 32), "medicationsList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
    v22 = &unk_1E6DFA838;
  else
    v22 = &unk_1E6DFA850;
  v49[18] = v22;
  v48[19] = CFSTR("allergiesList");
  objc_msgSend(*(id *)(a1 + 32), "allergiesList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
    v24 = &unk_1E6DFA838;
  else
    v24 = &unk_1E6DFA850;
  v49[19] = v24;
  v48[20] = CFSTR("conditionsList");
  objc_msgSend(*(id *)(a1 + 32), "conditionsList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
    v26 = &unk_1E6DFA838;
  else
    v26 = &unk_1E6DFA850;
  v49[20] = v26;
  v48[21] = CFSTR("pregnancyStartDate");
  objc_msgSend(*(id *)(a1 + 32), "pregnancyStartDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v28 = &unk_1E6DFA838;
  else
    v28 = &unk_1E6DFA850;
  v49[21] = v28;
  v48[22] = CFSTR("pregnancyEstimatedDueDate");
  objc_msgSend(*(id *)(a1 + 32), "pregnancyEstimatedDueDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    v30 = &unk_1E6DFA838;
  else
    v30 = &unk_1E6DFA850;
  v49[22] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  if (*(_QWORD *)(a1 + 40) == 3)
    objc_msgSend(v32, "removeObjectForKey:", CFSTR("sosContactBug"));
  v33 = (void *)objc_msgSend(v32, "copy");

  return v33;
}

- (void)medicalID_reportHasBeenSetForProfileType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenSetForProfileType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.MedicalID.hasBeenSet"), v3);
}

id __88__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenSetForProfileType___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)medicalID_reportHasBeenDeletedForProfileType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenDeletedForProfileType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.MedicalID.hasBeenDeleted"), v3);
}

id __92__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenDeletedForProfileType___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)heartDaily_reportHeartDailyAnalytics:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogAnalytics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "Submitting CoreAnalytics heart daily analytics: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__HDAnalyticsSubmissionCoordinator_HeartDaily__heartDaily_reportHeartDailyAnalytics___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.health.HeartRhythm.HeartDailyAnalytics"), v7);

}

id __85__HDAnalyticsSubmissionCoordinator_HeartDaily__heartDaily_reportHeartDailyAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)healthService_reportServiceTypeAdded:(id)a3 profileType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeAdded_profileType___block_invoke;
  v8[3] = &unk_1E6CE8138;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.services"), v8);

}

id __100__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeAdded_profileType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("serviceType");
  v5[1] = CFSTR("added");
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)healthService_reportServiceTypeRemoved:(id)a3 profileType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeRemoved_profileType___block_invoke;
  v8[3] = &unk_1E6CE8138;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.services"), v8);

}

id __102__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeRemoved_profileType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("serviceType");
  v5[1] = CFSTR("removed");
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)healthService_reportCountForAllServices:(id)a3 profileType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __103__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportCountForAllServices_profileType___block_invoke;
  v8[3] = &unk_1E6CE8138;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.services"), v8);

}

id __103__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportCountForAllServices_profileType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("servicesCount");
  v6[1] = CFSTR("profileType");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)healthService_reportServiceType:(id)a3 duration:(double)a4 profileType:(int64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;
  int64_t v13;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceType_duration_profileType___block_invoke;
  v10[3] = &unk_1E6CED340;
  v11 = v8;
  v12 = a4;
  v13 = a5;
  v9 = v8;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.services.connection-duration"), v10);

}

id __104__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceType_duration_profileType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = *(_QWORD *)(a1 + 32);
  v6[0] = CFSTR("serviceType");
  v6[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)authorization_reportAuthRequestsFromBundleIdentifier:(id)a3 isExtension:(BOOL)a4 isAppleWatch:(BOOL)a5 shouldPrompt:(BOOL)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;

  v10 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __142__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestsFromBundleIdentifier_isExtension_isAppleWatch_shouldPrompt___block_invoke;
  v12[3] = &unk_1E6CEE4A8;
  v13 = v10;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v11 = v10;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.authorization.request"), v12);

}

id __142__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestsFromBundleIdentifier_isExtension_isAppleWatch_shouldPrompt___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = *(const __CFString **)(a1 + 32);
  if (!v2)
    v2 = CFSTR("Unknown");
  v9[0] = v2;
  v8[0] = CFSTR("bundleIdentifier");
  v8[1] = CFSTR("isExtension");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("isAppleWatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("shouldPrompt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 42));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)authorization_reportAuthRequestPromptedForBundleIdentifer:(id)a3 profileType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __121__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestPromptedForBundleIdentifer_profileType___block_invoke;
  v8[3] = &unk_1E6CE8138;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.authorization.prompt"), v8);

}

id __121__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestPromptedForBundleIdentifer_profileType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v2 = *(const __CFString **)(a1 + 32);
  else
    v2 = CFSTR("Unknown");
  v6[0] = CFSTR("bundleIdentifier");
  v6[1] = CFSTR("profileType");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)attachments_reportDailyAnalytics:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[HDAnalyticsSubmissionCoordinator isImprovedHealthAndActivityEnabled](self, "isImprovedHealthAndActivityEnabled"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyAnalytics___block_invoke;
    v5[3] = &unk_1E6CF67A0;
    v6 = v4;
    -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.health.attachments.daily"), v5);

  }
}

id __82__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyAnalytics___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("numberOfAttachments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfReferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfReferences"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfTombstones"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfTombstones"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalSizeOfFiles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("totalSizeOfFiles"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfUnconfirmedFiles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfUnconfirmedFiles"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedAttachments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfOrphanedAttachments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedReferences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("numberOfOrphanedReferences"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfReferencesCreatedLast24Hours"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("numberOfReferencesCreatedLast24Hours"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachmentsCreatedLast24Hours"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("numberOfAttachmentsCreatedLast24Hours"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfTombstonesCreatedLast24Hours"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("numberOfTombstonesCreatedLast24Hours"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachmentsWithMultipleReferences"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("numberOfAttachmentsWithMultipleReferences"));

  return v2;
}

- (void)attachments_reportDailyCloudAnalytics:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[HDAnalyticsSubmissionCoordinator isImprovedHealthAndActivityEnabled](self, "isImprovedHealthAndActivityEnabled"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __87__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyCloudAnalytics___block_invoke;
    v5[3] = &unk_1E6CF67A0;
    v6 = v4;
    -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.health.sync.cloud.cache.attachments.daily"), v5);

  }
}

id __87__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyCloudAnalytics___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachmentRecords"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("numberOfAttachmentRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfReferenceRecords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfReferenceRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfTombstoneRecords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfTombstoneRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedAttachmentRecords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("numberOfOrphanedAttachmentRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedReferenceRecords"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfOrphanedReferenceRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "percentageOfAttachmentsWithAssetData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("percentageOfAttachmentsWithAssetData"));

  return v2;
}

- (void)heartRate_reportDailyRestingHeartRate:(double)a3 sedentaryHeartRateCount:(int)a4 filteredSedentaryHeartRateCount:(int)a5 profileType:(int64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  float v8;
  _QWORD v9[7];
  int v10;
  int v11;
  float v12;
  uint64_t v13;
  uint64_t v14;

  if (a4 < 1)
    v8 = -1.0;
  else
    v8 = (float)a5 / (float)a4;
  v13 = v6;
  v14 = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __153__HDAnalyticsSubmissionCoordinator_HeartRate__heartRate_reportDailyRestingHeartRate_sedentaryHeartRateCount_filteredSedentaryHeartRateCount_profileType___block_invoke;
  v9[3] = &unk_1E6CF9748;
  v9[4] = self;
  v9[5] = a6;
  *(double *)&v9[6] = a3;
  v10 = a4;
  v11 = a5;
  v12 = v8;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.hid.bghr_rhr_eod"), v9);
}

id __153__HDAnalyticsSubmissionCoordinator_HeartRate__heartRate_reportDailyRestingHeartRate_sedentaryHeartRateCount_filteredSedentaryHeartRateCount_profileType___block_invoke(uint64_t a1)
{
  BOOL v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("pop");
  if (*(_QWORD *)(a1 + 32))
    v2 = *(_QWORD *)(a1 + 40) == 3;
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v18[1] = CFSTR("output_value");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  if (!*(_QWORD *)(a1 + 32))
  {
    v7 = 0;
    goto LABEL_20;
  }
  v6 = *(double *)(a1 + 48);
  if (v6 < 30.0)
    goto LABEL_9;
  if (v6 > 189.0)
  {
    v7 = 3;
    goto LABEL_20;
  }
  if (!objc_msgSend(&unk_1E6DF9170, "count"))
    goto LABEL_9;
  objc_msgSend(&unk_1E6DF9170, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= (double)(int)objc_msgSend(v8, "intValue"))
  {
    v9 = -1;
    while (1)
    {

      if (objc_msgSend(&unk_1E6DF9170, "count") <= (unint64_t)(v9 + 2))
        break;
      objc_msgSend(&unk_1E6DF9170, "objectAtIndexedSubscript:", v9 + 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ++v9;
      if (v6 < (double)(int)objc_msgSend(v8, "intValue"))
        goto LABEL_19;
    }
LABEL_9:
    v7 = 1;
    goto LABEL_20;
  }
  LODWORD(v9) = 0x80000000;
LABEL_19:
  objc_msgSend(&unk_1E6DF9188, "objectAtIndexedSubscript:", (int)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "intValue");

LABEL_20:
  objc_msgSend(v5, "numberWithInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  v18[2] = CFSTR("raw_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  v18[3] = CFSTR("filtered_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 60));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  v18[4] = CFSTR("filtered_frac");
  LODWORD(v14) = *(_DWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)nanoSync_reportResponseStatusCode:(int)a3 profileType:(int64_t)a4
{
  void *v7;
  _QWORD v8[5];
  int v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.nano.%@"), CFSTR("reponse-status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportResponseStatusCode_profileType___block_invoke;
  v8[3] = &__block_descriptor_44_e19___NSDictionary_8__0l;
  v9 = a3;
  v8[4] = a4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v7, v8);

}

id __92__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportResponseStatusCode_profileType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("statusCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("profileType");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)nanoSync_reportSyncSuccessWithReason:(id)a3 options:(unint64_t)a4 duration:(double)a5 profileType:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  double v16;
  int64_t v17;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.nano.%@"), CFSTR("sync.finished"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncSuccessWithReason_options_duration_profileType___block_invoke;
  v13[3] = &unk_1E6CFCAF0;
  v14 = v10;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v12 = v10;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v11, v13);

}

id __112__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncSuccessWithReason_options_duration_profileType___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v15[0] = MEMORY[0x1E0C9AAB0];
  v14[0] = CFSTR("success");
  v14[1] = CFSTR("reason");
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "length");
  if (v3 >= 0x400)
    v4 = 1024;
  else
    v4 = v3;
  objc_msgSend(v2, "substringToIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("optionPullRequest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_DWORD *)(a1 + 40) & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  v14[3] = CFSTR("optionsLastChange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_DWORD *)(a1 + 40) >> 1) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  v14[4] = CFSTR("optionsActiveOnly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_DWORD *)(a1 + 40) >> 2) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v8;
  v14[5] = CFSTR("optionsRequestedByRemote");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_DWORD *)(a1 + 40) >> 3) & 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v9;
  v14[6] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v10;
  v14[7] = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)nanoSync_reportSyncFailureWithReason:(id)a3 options:(unint64_t)a4 duration:(double)a5 profileType:(int64_t)a6 error:(id)a7
{
  unsigned int v9;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
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
  id v28;
  _QWORD v29[4];
  id v30;

  v9 = a4;
  v12 = a7;
  v13 = (objc_class *)MEMORY[0x1E0C99E08];
  v14 = a3;
  v15 = objc_alloc_init(v13);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
  v16 = objc_msgSend(v14, "length");
  if (v16 >= 0x400)
    v17 = 1024;
  else
    v17 = v16;
  objc_msgSend(v14, "substringToIndex:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("reason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("optionPullRequest"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v9 >> 1) & 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("optionsLastChange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v9 >> 2) & 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("optionsActiveOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v9 >> 3) & 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("optionsRequestedByRemote"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("profileType"));

  if (v12)
  {
    objc_msgSend(v12, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "code"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("errorCode"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.nano.%@"), CFSTR("sync.finished"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __118__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncFailureWithReason_options_duration_profileType_error___block_invoke;
  v29[3] = &unk_1E6CF67A0;
  v30 = v15;
  v28 = v15;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v27, v29);

}

id __118__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncFailureWithReason_options_duration_profileType_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (HDAnalyticsSubmissionCoordinator)initWithDaemon:(id)a3
{
  id v4;
  HDAnalyticsSubmissionCoordinator *v5;
  HDAnalyticsSubmissionCoordinator *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  OS_dispatch_queue *timeoutQueue;
  id v11;
  void *v12;
  uint64_t v13;
  HDAnalyticsSubmissionCoordinatorDelegate *observers;
  id WeakRetained;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDAnalyticsSubmissionCoordinator;
  v5 = -[HDAnalyticsSubmissionCoordinator init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    timeoutQueue = v6->_timeoutQueue;
    v6->_timeoutQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogAnalytics();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithName:loggingCategory:", CFSTR("DailyAnalyticEventObservers"), v12);
    observers = v6->_observers;
    v6->_observers = (HDAnalyticsSubmissionCoordinatorDelegate *)v13;

    v6->_dailyAnalyticsObserversLock._os_unfair_lock_opaque = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    objc_msgSend(WeakRetained, "primaryProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerProfileReadyObserver:queue:", v6, v6->_queue);

  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  HDPeriodicActivity *v4;
  void *v5;
  double v6;
  void *v7;
  HDPeriodicActivity *v8;
  HDPeriodicActivity *periodicActivity;
  id WeakRetained;

  v4 = [HDPeriodicActivity alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(uint64_t)*MEMORY[0x1E0C807B8];
  HKLogAnalytics();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDPeriodicActivity initWithProfile:name:interval:delegate:loggingCategory:](v4, "initWithProfile:name:interval:delegate:loggingCategory:", v5, CFSTR("com.apple.healthd.daily-report"), self, v7, v6);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v8;

}

- (void)sendEvent:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  HDAnalyticsSubmissionCoordinator *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  HKLogAnalytics();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    HKLogAnalytics();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Event sent: %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
  AnalyticsSendEventLazy();

}

- (BOOL)isEventUsed:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  char IsEventUsed;
  int v10;
  HDAnalyticsSubmissionCoordinator *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogAnalytics();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    HKLogAnalytics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Checked whether event is used: %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
  IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  -[HDAnalyticsSubmissionCoordinatorDelegate registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeObserver:(id)a3
{
  -[HDAnalyticsSubmissionCoordinatorDelegate unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_logFaultForTimedOutObservers:(id)a3 timeoutSeconds:(double)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  HDAnalyticsSubmissionCoordinator *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB37A0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", CFSTR("["));
  objc_msgSend(v8, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v7, &__block_literal_global_157);

  objc_msgSend(v8, "appendString:", CFSTR("]"));
  _HKInitializeLogging();
  HKLogInfrastructure();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v10 = 138543874;
    v11 = self;
    v12 = 2048;
    v13 = a4;
    v14 = 2114;
    v15 = v8;
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "%{public}@: Timeout (%0.1f) waiting for %{public}@", (uint8_t *)&v10, 0x20u);
  }

}

id __81__HDAnalyticsSubmissionCoordinator__logFaultForTimedOutObservers_timeoutSeconds___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@:%p"), v6, v3);

  return v7;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id, double);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  HDAssertion *v14;
  HDAssertion *dbAssertion;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  HDAnalyticsSubmissionCoordinator *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v5 = (void (**)(id, uint64_t, id, double))a4;
  if (!self)
  {
    v18 = 0;
    goto LABEL_11;
  }
  if (!self->_dbAssertion)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("dailyAnalytics-%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "primaryProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v10, &v19, 300.0);
    v14 = (HDAssertion *)objc_claimAutoreleasedReturnValue();
    dbAssertion = self->_dbAssertion;
    self->_dbAssertion = v14;

    if (self->_dbAssertion)
    {

      v6 = v19;
      goto LABEL_6;
    }
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Daily analytics failed to take database accessibility assertion: %{public}@", buf, 0x16u);
    }

    v18 = v19;
LABEL_11:
    v16 = v18;
    v5[2](v5, 2, v16, 0.0);
    goto LABEL_7;
  }
  v6 = 0;
LABEL_6:
  v16 = v6;
  -[HDAnalyticsSubmissionCoordinator sendDailyAnalyticsWithTimeout:completion:](self, "sendDailyAnalyticsWithTimeout:completion:", v5, 30.0);
LABEL_7:

}

- (void)_locked_sendDailyAnalyticsWithTimeout:(uint64_t)a1
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD block[5];
  id v28;
  double v29;
  _QWORD v30[4];
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  double v35;
  _QWORD v36[5];
  id v37;
  double v38;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 80), "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "primaryProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isProtectedDataAvailable");

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F98]), "initWithQueue:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_204_3);
      v10 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_2;
      v36[3] = &unk_1E6CE9C58;
      v36[4] = a1;
      v11 = v4;
      v37 = v11;
      v38 = a2;
      objc_msgSend(v9, "startWithTimeoutInterval:handler:", v36, a2);
      v12 = *(void **)(a1 + 40);
      v32[0] = v10;
      v32[1] = 3221225472;
      v32[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_3;
      v32[3] = &unk_1E6CFEAD8;
      v32[4] = a1;
      v33 = v9;
      v34 = v11;
      v35 = a2;
      v13 = v9;
      objc_msgSend(v12, "notifyObserver:handler:", v34, v32);

      v14 = v37;
    }
    else
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      v15 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceNow");
      v17 = -v16;
      v18 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

      v19 = (void *)objc_msgSend(*(id *)(a1 + 72), "copy");
      v20 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_5;
      v30[3] = &unk_1E6CEBB00;
      v31 = v19;
      v13 = v19;
      objc_msgSend((id)a1, "sendEvent:block:", CFSTR("com.apple.healthd.daily-report"), v30);
      v21 = _Block_copy(*(const void **)(a1 + 88));
      v22 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = 0;

      v23 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      v24 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

      v25 = *(NSObject **)(a1 + 24);
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_6;
      block[3] = &unk_1E6CFEB00;
      block[4] = a1;
      v28 = v21;
      v29 = v17;
      v26 = v21;
      dispatch_async(v25, block);

      v14 = v31;
    }

  }
}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_logFaultForTimedOutObservers:timeoutSeconds:", v4, *(double *)(a1 + 48));

  if (v2)
    -[HDAnalyticsSubmissionCoordinator _locked_sendDailyAnalyticsWithTimeout:](*(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_4;
  v7[3] = &unk_1E6CFEAB0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "reportDailyAnalyticsWithCoordinator:completion:", v4, v7);

}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_4(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 56));
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addEntriesFromDictionary:", v4);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "containsObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "removeObject:", *(_QWORD *)(a1 + 48));
  if (v3)
    -[HDAnalyticsSubmissionCoordinator _locked_sendDailyAnalyticsWithTimeout:](*(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 56));

}

id __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_6(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  (*(void (**)(double))(a1[5] + 16))(0.0);
  _HKInitializeLogging();
  HKLogAnalytics();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    HKLogAnalytics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = a1[4];
      v6 = a1[6];
      v7 = objc_msgSend(*(id *)(v5 + 40), "count");
      v8 = 138543874;
      v9 = v5;
      v10 = 2050;
      v11 = v6;
      v12 = 2050;
      v13 = v7;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "%{public}@: DailyAnalytics took %{public}f seconds with %{public}ld observers", (uint8_t *)&v8, 0x20u);
    }

  }
}

- (void)sendDailyAnalyticsWithTimeout:(double)a3 completion:(id)a4
{
  os_unfair_lock_s *p_dailyAnalyticsObserversLock;
  id v7;
  NSDate *v8;
  NSDate *dailyAnalyticsStartTime;
  NSMutableDictionary *v10;
  NSMutableDictionary *dailyAnalyticsPayload;
  id v12;
  void *v13;
  NSMutableSet *v14;
  NSMutableSet *dailyAnalyticsPendingObservers;
  void *v16;
  id dailyAnalyticsCompletionHandler;

  p_dailyAnalyticsObserversLock = &self->_dailyAnalyticsObserversLock;
  v7 = a4;
  os_unfair_lock_lock(p_dailyAnalyticsObserversLock);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dailyAnalyticsStartTime = self->_dailyAnalyticsStartTime;
  self->_dailyAnalyticsStartTime = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  dailyAnalyticsPayload = self->_dailyAnalyticsPayload;
  self->_dailyAnalyticsPayload = v10;

  v12 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HDAnalyticsSubmissionCoordinatorDelegate allObservers](self->_observers, "allObservers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSMutableSet *)objc_msgSend(v12, "initWithArray:", v13);
  dailyAnalyticsPendingObservers = self->_dailyAnalyticsPendingObservers;
  self->_dailyAnalyticsPendingObservers = v14;

  v16 = (void *)objc_msgSend(v7, "copy");
  dailyAnalyticsCompletionHandler = self->_dailyAnalyticsCompletionHandler;
  self->_dailyAnalyticsCompletionHandler = v16;

  -[HDAnalyticsSubmissionCoordinator _locked_sendDailyAnalyticsWithTimeout:]((uint64_t)self, a3);
  os_unfair_lock_unlock(p_dailyAnalyticsObserversLock);
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  const char *v4;
  const char *v5;
  xpc_object_t xdict;

  v4 = (const char *)*MEMORY[0x1E0C80878];
  v5 = (const char *)*MEMORY[0x1E0C80880];
  xdict = a4;
  xpc_dictionary_set_string(xdict, v4, v5);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808A8], 1);

}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (HDAnalyticsSubmissionCoordinatorDelegate)unitTest_dailyAnalyticsObservers
{
  return self->_observers;
}

- (id)_createHealthStoreForProfileIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB6780];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setProfileIdentifier:", v4);

  objc_msgSend(v5, "resume");
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dailyAnalyticsCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsPendingObservers, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsPayload, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsStartTime, 0);
  objc_storeStrong((id *)&self->_dbAssertion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

- (void)summarySharing_reportSetupOperation:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportSetupOperation_success_error___block_invoke;
  v12[3] = &unk_1E6CFF3C8;
  v15 = a4;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.health.sharing.setup.operational.event"), v12);

}

id __102__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportSetupOperation_success_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[2];
  _QWORD v25[4];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v24[0] = CFSTR("operation");
    v24[1] = CFSTR("success");
    v25[0] = v2;
    v25[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22[0] = CFSTR("operation");
    v22[1] = CFSTR("success");
    v4 = *(void **)(a1 + 40);
    v23[0] = *(_QWORD *)(a1 + 32);
    v23[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v4, "domain", CFSTR("operation"), CFSTR("success"), CFSTR("errorDomain"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("<null>");
    if (v5)
      v7 = (const __CFString *)v5;
    v23[2] = v7;
    v22[3] = CFSTR("errorCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v8;
    v22[4] = CFSTR("errorClass");
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E00]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = CFSTR("<unknown>");
    v23[4] = v12;
    v22[5] = CFSTR("errorMethod");
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E30]);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = CFSTR("<unknown>");
    v23[5] = v16;
    v22[6] = CFSTR("errorParameter");
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E28]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = CFSTR("<unknown>");
    v23[6] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    return v21;
  }
}

- (void)summarySharing_reportDailyAnalytics:(id)a3 activeWatchProductType:(id)a4 age:(int64_t)a5 sex:(id)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  int64_t v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[HDAnalyticsSubmissionCoordinator isImprovedHealthAndActivityEnabled](self, "isImprovedHealthAndActivityEnabled");
  v14 = objc_msgSend(v10, "numberPeopleSharingOut") > 0;
  v15 = objc_msgSend(v10, "numberPeopleSharingIn");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __119__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportDailyAnalytics_activeWatchProductType_age_sex___block_invoke;
  v19[3] = &unk_1E6CFF3F0;
  v25 = v14;
  v26 = v15 > 0;
  v27 = v13;
  v20 = v11;
  v21 = v10;
  v23 = xmmword_1B7F42710;
  v24 = a5;
  v22 = v12;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.health.sharing.daily"), v19);

}

id __119__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportDailyAnalytics_activeWatchProductType_age_sex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double Current;
  void *v10;
  double v11;
  double v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  _BOOL8 v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  _BOOL8 v38;
  _BOOL8 v39;
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
  uint64_t v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  _BOOL8 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[4];
  _QWORD v79[6];

  v79[4] = *MEMORY[0x1E0C80C00];
  v78[0] = CFSTR("isSharingOutEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v2;
  v78[1] = CFSTR("isSharingInEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v3;
  v78[2] = CFSTR("isImproveHealthAndActivityAllowed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 82));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = CFSTR("activeWatchProductType");
  v5 = *(_QWORD *)(a1 + 32);
  v79[2] = v4;
  v79[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "askSomeoneToShareLastSelectedDate");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(a1 + 40), "askSomeoneToShareLastSelectedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = Current - v11;

    v13 = v12 < *(double *)(a1 + 56);
    v8 = v12 < *(double *)(a1 + 64);
  }
  else
  {
    v13 = 0;
  }
  v76[0] = CFSTR("hasInvitedToShareInPastMonth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = CFSTR("hasInvitedToShareInPast6Months");
  v77[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v16);

  if (*(_BYTE *)(a1 + 81))
  {
    v17 = objc_msgSend(*(id *)(a1 + 40), "numberOfAlertNotificationsEnabled") > 0;
    v18 = objc_msgSend(*(id *)(a1 + 40), "numberOfTrendNotificationsEnabled") > 0;
    v19 = objc_msgSend(*(id *)(a1 + 40), "numberOfUpdateNotificationsEnabled") > 0;
    v74[0] = CFSTR("hasAlertsEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v20;
    v74[1] = CFSTR("hasTrendsEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v21;
    v74[2] = CFSTR("hasUpdatesEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v23);

    objc_msgSend(*(id *)(a1 + 40), "sharingContactOptionLastSelectedDate");
    v24 = objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(*(id *)(a1 + 40), "sharingContactOptionLastSelectedDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      v28 = v25 - v27;

      v29 = v28 < *(double *)(a1 + 56);
      v24 = v28 < *(double *)(a1 + 64);
    }
    else
    {
      v29 = 0;
    }
    v72[0] = CFSTR("hasClickedToTextOrCallFromSharingInPastMonth");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = CFSTR("hasClickedToTextOrCallFromSharingInPast6Months");
    v73[0] = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v32);

    objc_msgSend(*(id *)(a1 + 40), "mostRecentIncomingTransactionDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(*(id *)(a1 + 40), "mostRecentIncomingTransactionDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceReferenceDate");
      v37 = v34 - v36;

      v38 = v37 < *(double *)(a1 + 64);
      v39 = v37 < *(double *)(a1 + 56);
      v70[0] = CFSTR("hasReceivedNewDataOnSharedAccountInPast6Months");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = CFSTR("hasReceivedNewDataOnSharedAccountInPastMonth");
      v71[0] = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v42);

    }
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v68[0] = CFSTR("numberAuthorizationsSharingOut");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberAuthorizationsSharingOut"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v43;
    v68[1] = CFSTR("averageNumberAuthorizationsSharedOutPerPerson");
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "averageNumberAuthorizationsSharedOutPerPerson");
    objc_msgSend(v44, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v45;
    v68[2] = CFSTR("maxAuthorizationsSharedOutPerPerson");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "maxAuthorizationsSharedOutPerPerson"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v46;
    v68[3] = CFSTR("minAuthorizationsSharedOutPerPerson");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "minAuthorizationsSharedOutPerPerson"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v47;
    v68[4] = CFSTR("numberPeopleSharingOut");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberPeopleSharingOut"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v49);

    objc_msgSend(*(id *)(a1 + 40), "anySharingWithYouLastViewedDate");
    v50 = objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(*(id *)(a1 + 40), "anySharingWithYouLastViewedDate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "timeIntervalSinceReferenceDate");
      v54 = v51 - v53;

      v55 = v54 < *(double *)(a1 + 56);
      v50 = v54 < *(double *)(a1 + 64);
    }
    else
    {
      v55 = 0;
    }
    v66[0] = CFSTR("hasClickedSharingInAccountInPastMonth");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = CFSTR("hasClickedSharingInAccountInPast6Months");
    v67[0] = v56;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v50);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v58);

  }
  if (*(_BYTE *)(a1 + 82))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberPeopleSharingIn", CFSTR("numberPeopleSharingIn")));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v59;
    v64[1] = CFSTR("age");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = CFSTR("sex");
    v61 = *(_QWORD *)(a1 + 48);
    v65[1] = v60;
    v65[2] = v61;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v62);

  }
  return v7;
}

- (void)cloudCache_reportWeeklyAnalyticsWithCacheValidation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.cache.%@"), CFSTR("weekly-validation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportWeeklyAnalyticsWithCacheValidation___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v7);

}

id __103__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportWeeklyAnalyticsWithCacheValidation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  _QWORD v52[48];
  _QWORD v53[50];

  v53[48] = *MEMORY[0x1E0C80C00];
  v52[0] = CFSTR("individualSyncZonesInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCloud"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v51;
  v52[1] = CFSTR("masterZonesInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterZonesInCloud"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v50;
  v52[2] = CFSTR("unifiedZonesInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCloud"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v49;
  v52[3] = CFSTR("sharedSummaryZonesInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCloud"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v48;
  v52[4] = CFSTR("individualSyncZonesInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCache"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v47;
  v52[5] = CFSTR("masterZonesInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterZonesInCache"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v46;
  v52[6] = CFSTR("unifiedZonesInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCache"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v45;
  v52[7] = CFSTR("sharedSummaryZonesInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCache"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v44;
  v52[8] = CFSTR("storeRecordsInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCloud"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v43;
  v52[9] = CFSTR("sequenceRecordsInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCloud"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v42;
  v52[10] = CFSTR("medicalIDRecordsInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCloud"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v41;
  v52[11] = CFSTR("changeRecordsInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCloud"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v40;
  v52[12] = CFSTR("registryRecordsInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCloud"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v39;
  v52[13] = CFSTR("masterRecordsInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCloud"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v38;
  v52[14] = CFSTR("dataUploadRequestRecordInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCloud"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v37;
  v52[15] = CFSTR("sharedSummaryAuthRecordInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCloud"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v36;
  v52[16] = CFSTR("sharedSummaryParticipantRecordInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCloud"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[16] = v35;
  v52[17] = CFSTR("sharedSummaryRelationshipRecordInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCloud"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[17] = v34;
  v52[18] = CFSTR("sharedSummaryRecordInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCloud"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[18] = v33;
  v52[19] = CFSTR("sharedSummaryTransactionRecordInCloud");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCloud"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[19] = v32;
  v52[20] = CFSTR("storeRecordsInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCache"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[20] = v31;
  v52[21] = CFSTR("sequenceRecordsInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCache"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[21] = v30;
  v52[22] = CFSTR("medicalIDRecordsInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCache"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[22] = v29;
  v52[23] = CFSTR("changeRecordsInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCache"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[23] = v28;
  v52[24] = CFSTR("registryRecordsInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCache"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[24] = v27;
  v52[25] = CFSTR("masterRecordsInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCache"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[25] = v26;
  v52[26] = CFSTR("dataUploadRequestRecordInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCache"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[26] = v25;
  v52[27] = CFSTR("sharedSummaryAuthRecordInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCache"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[27] = v24;
  v52[28] = CFSTR("sharedSummaryParticipantRecordInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCache"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[28] = v23;
  v52[29] = CFSTR("sharedSummaryRelationshipRecordInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCache"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[29] = v22;
  v52[30] = CFSTR("sharedSummaryRecordInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCache"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[30] = v21;
  v52[31] = CFSTR("sharedSummaryTransactionRecordInCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCache"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[31] = v20;
  v52[32] = CFSTR("deltaIndividualSyncZonesInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCloud")- objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCache"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53[32] = v19;
  v52[33] = CFSTR("deltaMasterZonesInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterZonesInCloud") - objc_msgSend(*(id *)(a1 + 32), "masterZonesInCache"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[33] = v18;
  v52[34] = CFSTR("deltaUnifiedZonesInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCloud") - objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCache"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[34] = v17;
  v52[35] = CFSTR("deltaSharedSummaryZonesInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCache"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[35] = v16;
  v52[36] = CFSTR("deltaStoreRecordsInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCache"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[36] = v15;
  v52[37] = CFSTR("deltaSequenceRecordsInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCache"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[37] = v14;
  v52[38] = CFSTR("deltaMedicalIDRecordsInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCloud")- objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[38] = v13;
  v52[39] = CFSTR("deltaChangeRecordsInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCache"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[39] = v12;
  v52[40] = CFSTR("deltaRegistryRecordsInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v53[40] = v2;
  v52[41] = CFSTR("deltaMasterRecordsInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53[41] = v3;
  v52[42] = CFSTR("deltaDataUploadRequestRecordInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53[42] = v4;
  v52[43] = CFSTR("deltaSharedSummaryAuthRecordInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53[43] = v5;
  v52[44] = CFSTR("deltaSharedSummaryParticipantRecordInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[44] = v6;
  v52[45] = CFSTR("deltaSharedSummaryRelationshipRecordInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[45] = v7;
  v52[46] = CFSTR("deltaSharedSummaryRecordInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[46] = v8;
  v52[47] = CFSTR("deltaSharedSummaryTransactionRecordInCloudCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53[47] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)cloudCache_reportDailyCacheAnalyticsWithPushTargets:(int64_t)a3 pullTargets:(int64_t)a4 sharedDBSummarySharingZones:(int64_t)a5 privateDBSummarySharingZones:(int64_t)a6 unifiedZoneInSharedDB:(BOOL)a7 unifiedZoneInPrivateDB:(BOOL)a8 deviceContexts:(unint64_t)a9 deviceKeys:(unint64_t)a10 nilSyncIdentities:(unint64_t)a11
{
  void *v18;
  _QWORD v19[8];
  __int128 v20;
  unint64_t v21;
  BOOL v22;
  BOOL v23;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.cache.%@"), CFSTR("daily-analytics"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __261__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportDailyCacheAnalyticsWithPushTargets_pullTargets_sharedDBSummarySharingZones_privateDBSummarySharingZones_unifiedZoneInSharedDB_unifiedZoneInPrivateDB_deviceContexts_deviceKeys_nilSyncIdentities___block_invoke;
  v19[3] = &__block_descriptor_90_e19___NSDictionary_8__0l;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a5;
  v19[7] = a6;
  v22 = a7;
  v23 = a8;
  v20 = *(_OWORD *)&a9;
  v21 = a11;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v18, v19);

}

id __261__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportDailyCacheAnalyticsWithPushTargets_pullTargets_sharedDBSummarySharingZones_privateDBSummarySharingZones_unifiedZoneInSharedDB_unifiedZoneInPrivateDB_deviceContexts_deviceKeys_nilSyncIdentities___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("pushTargets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("pullTargets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v14[2] = CFSTR("sharedDBSummarySharingZones");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v4;
  v14[3] = CFSTR("privateDBSummarySharingZones");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (*(_BYTE *)(a1 + 88))
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = MEMORY[0x1E0C9AAA0];
  v15[3] = v5;
  v15[4] = v7;
  v14[4] = CFSTR("unifiedZoneInSharedDB");
  v14[5] = CFSTR("unifiedZoneInPrivateDB");
  if (*(_BYTE *)(a1 + 89))
    v8 = MEMORY[0x1E0C9AAB0];
  else
    v8 = MEMORY[0x1E0C9AAA0];
  v15[5] = v8;
  v14[6] = CFSTR("contextCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("keyCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("nilSyncIdentities");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)cloudCache_reportCacheDiscrepancyForOperation:(id)a3 reason:(id)a4 containerIdentifier:(id)a5 databaseScope:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.cache.%@"), CFSTR("discrepancy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __144__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheDiscrepancyForOperation_reason_containerIdentifier_databaseScope_error___block_invoke;
  v23[3] = &unk_1E6CFFB48;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v28 = v12;
  v18 = v12;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v17, v23);

}

id __144__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheDiscrepancyForOperation_reason_containerIdentifier_databaseScope_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("discrepancyReason");
  v10[1] = CFSTR("container");
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  v12 = v3;
  v10[2] = CFSTR("database");
  v10[3] = CFSTR("errorDomain");
  v11 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  v10[4] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, v10, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "analyticsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dictionaryByAddingEntriesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline:(id)a3 changedZonesCount:(int64_t)a4 deletedZonesCount:(int64_t)a5 changedRecordsCount:(int64_t)a6 deletedRecordsCount:(int64_t)a7
{
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.cache.%@"), CFSTR("fetch"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __184__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline_changedZonesCount_deletedZonesCount_changedRecordsCount_deletedRecordsCount___block_invoke;
  v15[3] = &unk_1E6CFFB70;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v16 = v12;
  v17 = a4;
  v14 = v12;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v13, v15);

}

id __184__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline_changedZonesCount_deletedZonesCount_changedRecordsCount_deletedRecordsCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("changedZonesCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("deletedZonesCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("changedRecordsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("deletedRecordsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dictionaryByAddingEntriesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)cloudCache_reportCacheSyncAnalyticsForPipeline:(id)a3 operationCount:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.cache.%@"), CFSTR("sync"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheSyncAnalyticsForPipeline_operationCount___block_invoke;
  v9[3] = &unk_1E6CE8138;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v7, v9);

}

id __113__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheSyncAnalyticsForPipeline_operationCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("cloudKitOperationsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dictionaryByAddingEntriesFromDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cloudSync_reportDailyAnalyticForProfileType:(int64_t)a3 syncEnabled:(BOOL)a4 syncDisabledError:(id)a5 primaryContainer:(id)a6 restoreComplete:(BOOL)a7 timeSinceRestoreStart:(id)a8 journalSize:(id)a9 oldestJournalAge:(id)a10 timeSinceLastSuccessfulPull:(id)a11 timeSinceLastSuccessfulPush:(id)a12 timeSinceLastSuccessfulLitePush:(id)a13 timeSinceLastPushForwardProgress:(id)a14 storeCount:(int64_t)a15 zoneCount:(int64_t)a16 hasUnifiedZone:(BOOL)a17 hasMasterZone:(BOOL)a18 hasMedicalID:(BOOL)a19 errorRequiringUserAction:(id)a20 childSyncIdentityCount:(int64_t)a21 canUpgradeToSyncIdentity:(BOOL)a22 startedUpgradeToSyncIdentity:(BOOL)a23 completedUpgradeToSyncIdentity:(BOOL)a24 iPhoneCount:(id)a25 iPadCount:(id)a26 watchCount:(id)a27 visionProCount:(id)a28
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v47;
  id v48;
  id v49;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  int64_t v78;
  int64_t v79;
  int64_t v80;
  int64_t v81;
  BOOL v82;
  BOOL v83;
  BOOL v84;
  BOOL v85;
  BOOL v86;

  v62 = a5;
  v61 = a6;
  v60 = a8;
  v59 = a9;
  v30 = a10;
  v31 = a11;
  v32 = a12;
  v33 = a13;
  v34 = a14;
  v44 = a20;
  v43 = a25;
  v35 = a26;
  v36 = a27;
  v37 = a28;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("daily-report"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __570__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportDailyAnalyticForProfileType_syncEnabled_syncDisabledError_primaryContainer_restoreComplete_timeSinceRestoreStart_journalSize_oldestJournalAge_timeSinceLastSuccessfulPull_timeSinceLastSuccessfulPush_timeSinceLastSuccessfulLitePush_timeSinceLastPushForwardProgress_storeCount_zoneCount_hasUnifiedZone_hasMasterZone_hasMedicalID_errorRequiringUserAction_childSyncIdentityCount_canUpgradeToSyncIdentity_startedUpgradeToSyncIdentity_completedUpgradeToSyncIdentity_iPhoneCount_iPadCount_watchCount_visionProCount___block_invoke;
  v63[3] = &unk_1E6D03C60;
  v82 = a4;
  v64 = v62;
  v65 = v61;
  v83 = a7;
  v66 = v60;
  v67 = v59;
  v68 = v30;
  v69 = v31;
  v70 = v32;
  v71 = v33;
  v78 = a3;
  v79 = a15;
  v72 = v34;
  v73 = v44;
  v80 = a16;
  v81 = a21;
  v84 = a22;
  v85 = a23;
  v86 = a24;
  v74 = v43;
  v75 = v35;
  v76 = v36;
  v77 = v37;
  v57 = v37;
  v56 = v36;
  v55 = v35;
  v54 = v43;
  v52 = v44;
  v51 = v34;
  v49 = v33;
  v48 = v32;
  v47 = v31;
  v38 = v30;
  v39 = v59;
  v40 = v60;
  v41 = v61;
  v42 = v62;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v45, v63);

}

id __570__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportDailyAnalyticForProfileType_syncEnabled_syncDisabledError_primaryContainer_restoreComplete_timeSinceRestoreStart_journalSize_oldestJournalAge_timeSinceLastSuccessfulPull_timeSinceLastSuccessfulPush_timeSinceLastSuccessfulLitePush_timeSinceLastPushForwardProgress_storeCount_zoneCount_hasUnifiedZone_hasMasterZone_hasMedicalID_errorRequiringUserAction_childSyncIdentityCount_canUpgradeToSyncIdentity_startedUpgradeToSyncIdentity_completedUpgradeToSyncIdentity_iPhoneCount_iPadCount_watchCount_visionProCount___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
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

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 144));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("profileType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 176));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("syncEnabled"));

  if (!*(_BYTE *)(a1 + 176))
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("syncDisabledErrorDomain"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("syncDisabledErrorCode"));

    }
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("primaryContainer"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 177));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("restoreComplete"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("timeSinceRestoreStart"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("journalSize"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("oldestJournalAge"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 72), CFSTR("timeSinceLastSuccessfulPull"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 80), CFSTR("timeSinceLastSuccessfulPush"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 88), CFSTR("timeSinceLastSuccessfulLitePush"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 96), CFSTR("timeSinceLastPushForwardProgress"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 152));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("storeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 160));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("zoneCount"));

  v11 = *(void **)(a1 + 104);
  if (v11)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("errorRequiringUserActionDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 104), "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("errorRequiringUserActionCode"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 168));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("childSyncIdentities"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 178));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("canUpgradeToSyncIdentity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 179));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("startedUpgradeToSyncIdentity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 180));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("completedUpgradeToSyncIdentity"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 112), CFSTR("countPairediPhone"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 120), CFSTR("countPairediPad"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 128), CFSTR("countPairedWatch"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 136), CFSTR("countPairedVisionPro"));
  return v2;
}

- (void)cloudSync_reportMissingManateeIdentityDuringFetchInContainer:(id)a3 zoneName:(id)a4 databaseScope:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("FetchMissingManateeIdentity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __131__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportMissingManateeIdentityDuringFetchInContainer_zoneName_databaseScope___block_invoke;
  v13[3] = &unk_1E6CE8160;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v10, v13);

}

id __131__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportMissingManateeIdentityDuringFetchInContainer_zoneName_databaseScope___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("container");
  v5[1] = CFSTR("zone");
  v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = v1;
  v5[2] = CFSTR("scope");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)cloudSync_reportOwnershipChangeForMissingManateeIdentityDuringPush
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("OwnershipChangePushMissingManateeIdentity"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v3, &__block_literal_global_193);

}

uint64_t __113__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportOwnershipChangeForMissingManateeIdentityDuringPush__block_invoke()
{
  return MEMORY[0x1E0C9AA70];
}

- (void)cloudSync_reportOwnershipChangeForProfile:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("ownership-change"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportOwnershipChangeForProfile_reason___block_invoke;
  v11[3] = &unk_1E6D03CA8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v8, v11);

}

id __96__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportOwnershipChangeForProfile_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "profileType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("reason");
  v10[0] = v2;
  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0x400)
    v5 = 1024;
  else
    v5 = v4;
  objc_msgSend(v3, "substringToIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)cloudSync_reportPeriodicSyncStartForType:(int64_t)a3
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("periodic.start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncStartForType___block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v6[4] = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v6);

}

id __88__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncStartForType___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)cloudSync_reportPeriodicSyncSuccessAfterDuration:(double)a3 type:(int64_t)a4
{
  void *v7;
  _QWORD v8[6];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("periodic.success"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncSuccessAfterDuration_type___block_invoke;
  v8[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  *(double *)&v8[4] = a3;
  v8[5] = a4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v7, v8);

}

id __101__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncSuccessAfterDuration_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("type");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cloudSync_reportPeriodicSyncFailureWithError:(id)a3 duration:(double)a4 type:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;
  int64_t v14;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("periodic.failure"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncFailureWithError_duration_type___block_invoke;
  v11[3] = &unk_1E6CED340;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v9, v11);

}

id __106__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncFailureWithError_duration_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("errorDomain");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v20[1] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v2;
  v20[2] = CFSTR("errorClass");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E00]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<unknown>");
  v21[2] = v6;
  v20[3] = CFSTR("errorMethod");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E30]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<unknown>");
  v21[3] = v10;
  v20[4] = CFSTR("errorParameter");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E28]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<unknown>");
  v21[4] = v14;
  v20[5] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v15;
  v20[6] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)cloudSync_reportRebaseTriggeredByDeletionByUser:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("rebase-trigger.deletion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRebaseTriggeredByDeletionByUser___block_invoke;
  v6[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v7 = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v6);

}

id __95__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRebaseTriggeredByDeletionByUser___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("byUser");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)cloudSync_reportRestoreForProfile:(id)a3 startDate:(id)a4 endDate:(id)a5 duration:(double)a6 finishedJournalMerge:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  double v23;
  BOOL v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("restore.complete"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __129__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRestoreForProfile_startDate_endDate_duration_finishedJournalMerge___block_invoke;
  v19[3] = &unk_1E6D03D10;
  v20 = v14;
  v21 = v13;
  v23 = a6;
  v24 = a7;
  v22 = v12;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v15, v19);

}

id __129__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRestoreForProfile_startDate_endDate_duration_finishedJournalMerge___block_invoke(uint64_t a1)
{
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
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("pullCompleteDate");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = CFSTR("pullStartDate");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  v16[2] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  v16[3] = CFSTR("finishedJournalMerge");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("dbSize");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = HDDatabaseSizeInMB(*(void **)(a1 + 48));
  objc_msgSend(v8, "numberWithInteger:", HDBucketedDatabaseSizeInMB(v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v10;
  v16[5] = CFSTR("journalCount");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "journalChapterCountForType:", 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)cloudSync_reportPipelineStarted:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("pipeline.started"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineStarted___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v7);

}

uint64_t __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
}

- (void)cloudSync_reportPipelineFinished:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("pipeline.finished"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFinished___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v7);

}

id __80__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFinished___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6DFEF78, "hk_dictionaryByAddingEntriesFromDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)cloudSync_reportPipelineFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("pipeline.finished"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFailed_error___block_invoke;
  v11[3] = &unk_1E6D03CA8;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v8, v11);

}

id __84__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFailed_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v21[0] = MEMORY[0x1E0C9AAA0];
  v20[0] = CFSTR("sucess");
  v20[1] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  v20[2] = CFSTR("errorDomain");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v2;
  v20[3] = CFSTR("errorClass");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E00]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<unknown>");
  v21[3] = v6;
  v20[4] = CFSTR("errorMethod");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E30]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<unknown>");
  v21[4] = v10;
  v20[5] = CFSTR("errorParameter");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E28]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<unknown>");
  v21[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "analyticsDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_dictionaryByAddingEntriesFromDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)cloudSync_operationStarted:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("operation.started"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationStarted___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v7);

}

uint64_t __74__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
}

- (void)cloudSync_operationFinished:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("operation.finished"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFinished___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v7);

}

id __75__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFinished___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6DFEFA0, "hk_dictionaryByAddingEntriesFromDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)cloudSync_operationFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("operation.finished"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFailed_error___block_invoke;
  v11[3] = &unk_1E6D03CA8;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v8, v11);

}

id __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFailed_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v21[0] = MEMORY[0x1E0C9AAA0];
  v20[0] = CFSTR("sucess");
  v20[1] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  v20[2] = CFSTR("errorDomain");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v2;
  v20[3] = CFSTR("errorClass");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E00]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<unknown>");
  v21[3] = v6;
  v20[4] = CFSTR("errorMethod");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E30]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<unknown>");
  v21[4] = v10;
  v20[5] = CFSTR("errorParameter");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E28]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<unknown>");
  v21[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "analyticsDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_dictionaryByAddingEntriesFromDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)cloudSync_newChildAdded:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("newChildAdded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_newChildAdded___block_invoke;
  v6[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v7 = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v6);

}

id __71__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_newChildAdded___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("newChildAdded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)stateSync_recordSize:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("state.push"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_recordSize___block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v6[4] = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v6);

}

id __68__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_recordSize___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("recordSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)stateSync_operationSucceeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("state.push"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationSucceeded___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v7);

}

id __76__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationSucceeded___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6DFEFC8, "hk_dictionaryByAddingEntriesFromDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)stateSync_operationFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("state.push"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationFailed_error___block_invoke;
  v11[3] = &unk_1E6D03CA8;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v8, v11);

}

id __79__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationFailed_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v21[0] = MEMORY[0x1E0C9AAA0];
  v20[0] = CFSTR("success");
  v20[1] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  v20[2] = CFSTR("errorDomain");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v2;
  v20[3] = CFSTR("errorClass");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E00]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<unknown>");
  v21[3] = v6;
  v20[4] = CFSTR("errorMethod");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E30]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<unknown>");
  v21[4] = v10;
  v20[5] = CFSTR("errorParameter");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E28]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<unknown>");
  v21[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "analyticsDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_dictionaryByAddingEntriesFromDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)stateSync_subscriptionTriggeredDomain:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (-[HDAnalyticsSubmissionCoordinator isImprovedHealthAndActivityEnabled](self, "isImprovedHealthAndActivityEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("state.subscription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __85__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_subscriptionTriggeredDomain___block_invoke;
    v6[3] = &unk_1E6CEBB00;
    v7 = v4;
    -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v6);

  }
}

id __85__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_subscriptionTriggeredDomain___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("domain");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)stateSync_triggerDuration:(double)a3
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("state.trigger-gated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_triggerDuration___block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  *(double *)&v6[4] = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v6);

}

id __73__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_triggerDuration___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)contextSync_operationSucceeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("context.push"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_operationSucceeded___block_invoke;
  v7[3] = &unk_1E6CEBB00;
  v8 = v4;
  v6 = v4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v7);

}

id __78__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_operationSucceeded___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "analyticsDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6DFEFF0, "hk_dictionaryByAddingEntriesFromDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)contextSync_triggerDuration:(double)a3
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.sync.cloud.%@"), CFSTR("context.trigger-gated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_triggerDuration___block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  *(double *)&v6[4] = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v5, v6);

}

id __75__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_triggerDuration___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)workout_reportWorkoutCondenserEventWithReason:(int64_t)a3 batchSize:(int64_t)a4 hasWatchSource:(BOOL)a5 duration:(double)a6 success:(BOOL)a7 error:(id)a8 workoutsToCondense:(int64_t)a9 workoutsToRecondense:(int64_t)a10 condensedWorkouts:(int64_t)a11 processedWorkouts:(int64_t)a12 createdSeries:(int64_t)a13 deletedSamples:(int64_t)a14
{
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  int64_t v26;
  int64_t v27;
  double v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  int64_t v32;
  BOOL v33;
  BOOL v34;

  v21 = a8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.workout.%@"), CFSTR("workout-condenser"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __244__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutCondenserEventWithReason_batchSize_hasWatchSource_duration_success_error_workoutsToCondense_workoutsToRecondense_condensedWorkouts_processedWorkouts_createdSeries_deletedSamples___block_invoke;
  v24[3] = &unk_1E6D042B0;
  v26 = a3;
  v27 = a4;
  v33 = a5;
  v28 = a6;
  v34 = a7;
  v25 = v21;
  v29 = a9;
  v30 = *(_OWORD *)&a10;
  v31 = *(_OWORD *)&a12;
  v32 = a14;
  v23 = v21;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v22, v24);

}

id __244__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutCondenserEventWithReason_batchSize_hasWatchSource_duration_success_error_workoutsToCondense_workoutsToRecondense_condensedWorkouts_processedWorkouts_createdSeries_deletedSamples___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[5];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v21;
  v22[1] = CFSTR("batchSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  v22[2] = CFSTR("hasWatchSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 112));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v19;
  v22[3] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v18;
  v22[4] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 113));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v2;
  v22[5] = CFSTR("errorDomain");
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v15 = v4;
    v31 = (void *)v4;
    v23 = CFSTR("errorCode");
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
    }
    else
    {
      v6 = &unk_1E6DFE618;
      v17 = 1;
    }
  }
  else
  {
    v6 = &unk_1E6DFE618;
    v31 = &unk_1E6DFE618;
    v23 = CFSTR("errorCode");
    v17 = 1;
  }
  v32 = v6;
  v24 = CFSTR("workoutsToCondense");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64), v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  v25 = CFSTR("workoutsToRecondense");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v8;
  v26 = CFSTR("condensedWorkouts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v9;
  v27 = CFSTR("processedWorkouts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 88));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v10;
  v28 = CFSTR("createdSeries");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 96));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  v29 = CFSTR("deletedSamples");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 104));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v22, 13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v17 & 1) == 0)
  if (v3)

  return v13;
}

- (void)workout_reportGymKitWorkoutWithFitnessMachineType:(id)a3 manufacturer:(id)a4 timeToBeginExperience:(int64_t)a5 workoutEndError:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.workout.%@"), CFSTR("gymkit-workout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __146__HDAnalyticsSubmissionCoordinator_Workout__workout_reportGymKitWorkoutWithFitnessMachineType_manufacturer_timeToBeginExperience_workoutEndError___block_invoke;
  v15[3] = &unk_1E6D042D8;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v12, v15);

}

id __146__HDAnalyticsSubmissionCoordinator_Workout__workout_reportGymKitWorkoutWithFitnessMachineType_manufacturer_timeToBeginExperience_workoutEndError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("fitnessMachineType");
  v7[1] = CFSTR("manufacturer");
  v2 = a1[5];
  v8[0] = a1[4];
  v8[1] = v2;
  v7[2] = CFSTR("timeToBeginExperience");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  v7[3] = CFSTR("errorReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)workout_reportMirroringEventWithStartDuration:(double)a3 stopDuration:(double)a4 mirroringDuration:(double)a5 numOfSendDataRequests:(int64_t)a6 maxTimeToSendData:(double)a7 minTimeToSendData:(double)a8 avgTimeToSendData:(double)a9 isFirstParty:(BOOL)a10
{
  BOOL v19;
  void *v20;
  _QWORD v21[11];
  BOOL v22;
  BOOL v23;

  v19 = -[HDAnalyticsSubmissionCoordinator isImprovedHealthAndActivityEnabled](self, "isImprovedHealthAndActivityEnabled");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.workout.%@"), CFSTR("mirroring"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __211__HDAnalyticsSubmissionCoordinator_Workout__workout_reportMirroringEventWithStartDuration_stopDuration_mirroringDuration_numOfSendDataRequests_maxTimeToSendData_minTimeToSendData_avgTimeToSendData_isFirstParty___block_invoke;
  v21[3] = &__block_descriptor_90_e26___NSMutableDictionary_8__0l;
  *(double *)&v21[4] = a3;
  *(double *)&v21[5] = a4;
  v21[6] = a6;
  *(double *)&v21[7] = a7;
  *(double *)&v21[8] = a8;
  v22 = a10;
  v23 = v19;
  *(double *)&v21[9] = a9;
  *(double *)&v21[10] = a5;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v20, v21);

}

id __211__HDAnalyticsSubmissionCoordinator_Workout__workout_reportMirroringEventWithStartDuration_stopDuration_mirroringDuration_numOfSendDataRequests_maxTimeToSendData_minTimeToSendData_avgTimeToSendData_isFirstParty___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("timeToStartMirroring");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("timeToStopMirroring");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v2;
  v16[2] = CFSTR("countArbitraryDataRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v3;
  v16[3] = CFSTR("timeToSendArbitraryDataMax");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v4;
  v16[4] = CFSTR("timeToSendArbitraryDataMin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v5;
  v16[5] = CFSTR("timeToSendArbitraryDataMean");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v6;
  v16[6] = CFSTR("isFirstParty");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (*(_BYTE *)(a1 + 89))
  {
    v14 = CFSTR("mirroringSessionDuration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v11);

  }
  return v9;
}

- (void)workout_reportWorkoutEventWithHeartBeatFailures:(int64_t)a3 workoutDuration:(double)a4 isFirstParty:(BOOL)a5
{
  BOOL v9;
  _QWORD v10[6];
  BOOL v11;
  BOOL v12;

  v9 = -[HDAnalyticsSubmissionCoordinator isImprovedHealthAndActivityEnabled](self, "isImprovedHealthAndActivityEnabled");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __122__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutEventWithHeartBeatFailures_workoutDuration_isFirstParty___block_invoke;
  v10[3] = &__block_descriptor_50_e26___NSMutableDictionary_8__0l;
  v10[4] = a3;
  v11 = a5;
  v12 = v9;
  *(double *)&v10[5] = a4;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", CFSTR("com.apple.healthd.workout"), v10);
}

id __122__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutEventWithHeartBeatFailures_workoutDuration_isFirstParty___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("countDataLinkFailures");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("isFirstParty");
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (*(_BYTE *)(a1 + 49))
  {
    v9 = CFSTR("workoutDuration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  }
  return v5;
}

- (void)database_reportSQLiteCorruptionWithExtendedErrorCode:(int)a3 type:(int64_t)a4 profile:(id)a5 description:(id)a6 sqlStatement:(id)a7 failedObliterationAttempt:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int v26;
  BOOL v27;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.database.%@"), CFSTR("corruption.sqlite"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __163__HDAnalyticsSubmissionCoordinator_Database__database_reportSQLiteCorruptionWithExtendedErrorCode_type_profile_description_sqlStatement_failedObliterationAttempt___block_invoke;
  v21[3] = &unk_1E6D0ED60;
  v26 = a3;
  v22 = v15;
  v23 = v14;
  v24 = v16;
  v25 = a4;
  v27 = a8;
  v18 = v16;
  v19 = v14;
  v20 = v15;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v17, v21);

}

id __163__HDAnalyticsSubmissionCoordinator_Database__database_reportSQLiteCorruptionWithExtendedErrorCode_type_profile_description_sqlStatement_failedObliterationAttempt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("databaseType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("description");
  v4 = objc_msgSend(*(id *)(a1 + 32), "length");
  v5 = *(void **)(a1 + 32);
  if (v4 >= 0x401)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringToIndex:", 1024);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v5;
  v12[3] = CFSTR("profileType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "profileType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("sqlStatement");
  v7 = objc_msgSend(*(id *)(a1 + 48), "length");
  v8 = *(void **)(a1 + 48);
  if (v7 >= 0x401)
  {
    objc_msgSend(*(id *)(a1 + 48), "substringToIndex:", 1024);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[4] = v8;
  v12[5] = CFSTR("failedObliteration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 >= 0x401)
  if (v4 >= 0x401)

  return v10;
}

- (void)database_reportUnprotectedDatabaseIdentifier:(id)a3 doesNotMatchProtectedDatabaseIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.database.%@"), CFSTR("identifier-mismatch"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __131__HDAnalyticsSubmissionCoordinator_Database__database_reportUnprotectedDatabaseIdentifier_doesNotMatchProtectedDatabaseIdentifier___block_invoke;
  v11[3] = &unk_1E6D03CA8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v8, v11);

}

id __131__HDAnalyticsSubmissionCoordinator_Database__database_reportUnprotectedDatabaseIdentifier_doesNotMatchProtectedDatabaseIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("has-unprotected-identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(a1 + 32) != 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("has-protected-identifier");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(a1 + 40) != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)database_reportJournalEntryInsertedForJournal:(int64_t)a3 entryClass:(id)a4 entrySize:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.database.%@"), CFSTR("journal-inserted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalEntryInsertedForJournal_entryClass_entrySize___block_invoke;
  v13[3] = &unk_1E6CE8160;
  v15 = v9;
  v16 = a3;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v10, v13);

}

id __113__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalEntryInsertedForJournal_entryClass_entrySize___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = a1[5];
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("class");
  v7[2] = CFSTR("size");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)database_reportDatabaseMigrationStatus:(int64_t)a3 database:(id)a4 schemaVersion:(int64_t)a5 error:(id)a6 profileType:(int64_t)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99E08];
  v14 = a4;
  v15 = objc_alloc_init(v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("databaseStatus"));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("databaseName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("schemaVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("profileType"));

  if (v12)
  {
    objc_msgSend(v12, "hd_errorForAnalytics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "code"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("errorCode"));

    objc_msgSend(v19, "localizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("errorDescription"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.database.%@"), CFSTR("migration-status"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __126__HDAnalyticsSubmissionCoordinator_Database__database_reportDatabaseMigrationStatus_database_schemaVersion_error_profileType___block_invoke;
  v25[3] = &unk_1E6CF67A0;
  v26 = v15;
  v24 = v15;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v23, v25);

}

id __126__HDAnalyticsSubmissionCoordinator_Database__database_reportDatabaseMigrationStatus_database_schemaVersion_error_profileType___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)database_reportCachedQueryEvent:(id)a3 cacheHits:(int64_t)a4 cacheMisses:(int64_t)a5 estimatedTotalBuckets:(unint64_t)a6
{
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;

  v10 = a3;
  if (-[HDAnalyticsSubmissionCoordinator isImprovedHealthAndActivityEnabled](self, "isImprovedHealthAndActivityEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.database.%@"), CFSTR("resumable-query"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __122__HDAnalyticsSubmissionCoordinator_Database__database_reportCachedQueryEvent_cacheHits_cacheMisses_estimatedTotalBuckets___block_invoke;
    v12[3] = &unk_1E6CFCAF0;
    v13 = v10;
    v14 = a4;
    v15 = a5;
    v16 = a6;
    -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v11, v12);

  }
}

id __122__HDAnalyticsSubmissionCoordinator_Database__database_reportCachedQueryEvent_cacheHits_cacheMisses_estimatedTotalBuckets___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  v9[0] = a1[4];
  v8[0] = CFSTR("identifier");
  v8[1] = CFSTR("cacheHits");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("cacheMisses");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("totalBuckets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)database_reportJournalMergeActivityResult:(int64_t)a3 duration:(double)a4 interruptions:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[9];
  _QWORD v15[7];
  _QWORD v16[4];
  _QWORD v17[5];
  __CFString *v18;
  _QWORD v19[4];

  v10 = a5;
  v11 = a6;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__193;
  v17[4] = __Block_byref_object_dispose__193;
  v18 = CFSTR("nil");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke;
  v15[3] = &unk_1E6D0ED88;
  v15[4] = v19;
  v15[5] = v16;
  v15[6] = v17;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthd.database.%@"), CFSTR("secondary-journal-merge-activity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke_2;
  v14[3] = &unk_1E6D0EDB0;
  *(double *)&v14[8] = a4;
  v14[4] = v19;
  v14[5] = v17;
  v14[6] = v16;
  v14[7] = a3;
  -[HDAnalyticsSubmissionCoordinator sendEvent:block:](self, "sendEvent:block:", v13, v14);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(v19, 8);
}

void __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += objc_msgSend(v6, "unsignedIntValue");
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) < (unint64_t)objc_msgSend(v6, "unsignedIntValue"))
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v6, "unsignedIntValue");
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

id __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("totalInterruptionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("topInterruptor");
  v5 = *(_QWORD *)(a1 + 48);
  v10[3] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9[4] = CFSTR("topInterruptionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
