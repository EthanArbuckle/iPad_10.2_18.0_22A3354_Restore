@implementation HKHealthStoreServerInterface

void __HKHealthStoreServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EC28);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HKHealthStoreServerInterface_interface;
  HKHealthStoreServerInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion_, 1, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_remote_getRequestStatusForAuthorizationToShareTypes_readTypes_completion_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_remote_getRequestStatusForAuthorizationToShareTypes_readTypes_completion_, 1, 0);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_remote_setCharacteristic_forDataType_handler_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_remote_fetchCharacteristicWithDataType_handler_, 0, 1);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_saveDataObjects_skipInsertionFilter_creationDateOverride_handler_, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_deleteDataObjects_options_handler_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_deleteObjectsWithUUIDs_options_completion_, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel__remote_associateSampleUUIDs_withSampleUUID_completion_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel__remote_saveObjects_deleteObjects_associations_completion_, 0, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel__remote_saveObjects_deleteObjects_associations_completion_, 1, 0);
  v11 = (void *)HKHealthStoreServerInterface_interface;
  objc_msgSend(v9, "setByAddingObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel__remote_saveObjects_deleteObjects_associations_completion_, 2, 0);

  v13 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_relateSamples_withObject_subObject_type_completion_, 0, 0);
  v14 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_relateSamples_withObject_subObject_type_completion_, 1, 0);
  v15 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_relateSamples_withObject_subObject_type_completion_, 2, 0);
  v16 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_unrelateSamples_withObject_subObject_type_completion_, 0, 0);
  v17 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_unrelateSamples_withObject_subObject_type_completion_, 1, 0);
  v18 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_unrelateSamples_withObject_subObject_type_completion_, 2, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_remote_fetchUnitPreferencesForTypes_version_withCompletion_, 0, 0);
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_remote_fetchUnitPreferencesForTypes_version_withCompletion_, 0, 1);
  v23 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addSamples_toWorkout_completion_, 0, 0);
  v24 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion_, 0, 0);
  v25 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion_, 1, 0);
  v26 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion_, 2, 0);
  v27 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion_, 3, 0);
  objc_msgSend((id)HKHealthStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_remote_closeTransactionWithDataTypes_anchor_ackTime_completion_, 0, 0);
  v28 = (id)objc_msgSend((id)HKHealthStoreServerInterface_interface, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_closeTransactionWithDataTypes_anchor_ackTime_completion_, 1, 0);

}

@end
