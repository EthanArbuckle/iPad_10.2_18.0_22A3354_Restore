@implementation CLSServerInterfaceConfigurator

- (CLSServerInterfaceConfigurator)init
{
  const char *v2;
  CLSServerInterfaceConfigurator *v3;
  uint64_t v4;
  NSXPCInterface *interface;
  uint64_t v6;
  NSSet *contextsSet;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSSet *arraySet;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CLSServerInterfaceConfigurator;
  v3 = -[CLSServerInterfaceConfigurator init](&v15, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EFE4C108);
    v4 = objc_claimAutoreleasedReturnValue();
    interface = v3->_interface;
    v3->_interface = (NSXPCInterface *)v4;

    CLSProgressClasses();
    v6 = objc_claimAutoreleasedReturnValue();
    contextsSet = v3->_contextsSet;
    v3->_contextsSet = (NSSet *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v8, v11, (uint64_t)v10);
    v12 = objc_claimAutoreleasedReturnValue();
    arraySet = v3->_arraySet;
    v3->_arraySet = (NSSet *)v12;

  }
  return v3;
}

- (id)configureServerInterface
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;

  objc_msgSend_configureQueryAPI(self, a2, v2);
  objc_msgSend_configureSaveAPI(self, v4, v5);
  objc_msgSend_configureDataObserverAPI(self, v6, v7);
  objc_msgSend_configureContextAPI(self, v8, v9);
  objc_msgSend_configureProgressReportingAPI(self, v10, v11);
  objc_msgSend_configureDashboardAppAPI(self, v12, v13);
  objc_msgSend_configureAppsAPI(self, v14, v15);
  objc_msgSend_configureUserNotificationAPI(self, v16, v17);
  objc_msgSend_configureUtilityServerAPI(self, v18, v19);
  objc_msgSend_configureAuthorizationStatusAPI(self, v20, v21);
  objc_msgSend_configureHandoutAPI(self, v22, v23);
  objc_msgSend_configureCollectionsAPI(self, v24, v25);
  objc_msgSend_configureCollaborationStateAPI(self, v26, v27);
  objc_msgSend_configureClassAPI(self, v28, v29);
  objc_msgSend_configureStudentActivityAPI(self, v30, v31);
  objc_msgSend_configureFeatureAvailabilityAPI(self, v32, v33);
  objc_msgSend_configureAssetSupportAPI(self, v34, v35);
  objc_msgSend_configureAdminRequestAPI(self, v36, v37);
  objc_msgSend_configureSurveyAnswerAPI(self, v38, v39);
  objc_msgSend_configureRelayRequestAPI(self, v40, v41);
  objc_msgSend_configureInsightEventsAPI(self, v42, v43);
  return self->_interface;
}

- (void)configureQueryAPI
{
  const char *v3;
  NSXPCInterface *interface;
  uint64_t v5;
  const char *v6;
  NSXPCInterface *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  CLSQueryInterface();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v3, (uint64_t)v10, sel_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_, 0, 0);
  interface = self->_interface;
  v5 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v6, v5, sel_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_, 1, 0);
  v7 = self->_interface;
  v8 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v7, v9, v8, sel_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_, 2, 0);

}

- (void)configureSaveAPI
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  CLSObjectsClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v3, v5, (uint64_t)v4, self->_arraySet, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v6, (uint64_t)v9, sel_remote_saveObjects_saveResponse_completion_, 0, 0);
  CLSSaveResponseInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v7, sel_remote_saveObjects_saveResponse_completion_, 1, 0);

}

- (void)configureDataObserverAPI
{
  const char *v3;
  const char *v4;
  NSXPCInterface *interface;
  uint64_t v6;
  const char *v7;
  id v8;

  v8 = (id)objc_opt_new();
  objc_msgSend_setProtocol_(v8, v3, (uint64_t)&unk_1EFE3B358);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v4, (uint64_t)v8, sel_remote_registerDataObserver_withID_querySpecification_oldChangeTag_completion_, 0, 0);
  interface = self->_interface;
  v6 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v7, v6, sel_remote_registerDataObserver_withID_querySpecification_oldChangeTag_completion_, 2, 0);

}

- (void)configureContextAPI
{
  NSXPCInterface *interface;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  NSXPCInterface *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  NSXPCInterface *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  NSXPCInterface *v24;
  uint64_t v25;
  const char *v26;
  NSXPCInterface *v27;
  const char *v28;
  void *v29;
  const char *v30;
  NSXPCInterface *v31;
  uint64_t v32;
  const char *v33;
  NSXPCInterface *v34;
  uint64_t v35;
  const char *v36;
  NSXPCInterface *v37;
  uint64_t v38;
  const char *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  interface = self->_interface;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v7, v5, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v9, (uint64_t)v8, sel_remote_mainAppContextWithCompletion_, 0, 1);

  v10 = self->_interface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v10, v16, (uint64_t)v15, sel_remote_fetchContextsForContextIDs_completion_, 0, 1);

  v17 = self->_interface;
  v18 = (void *)MEMORY[0x1E0C99E60];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v40, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_contextsMatchingIdentifierPath_parentContextID_completion_, 0, 0);

  v24 = self->_interface;
  v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_contextsMatchingIdentifierPath_parentContextID_completion_, 1, 0);
  v27 = self->_interface;
  objc_msgSend_setWithUnionOfSets_(MEMORY[0x1E0C99E60], v28, (uint64_t)self->_arraySet, self->_contextsSet, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v27, v30, (uint64_t)v29, sel_remote_contextsMatchingIdentifierPath_parentContextID_completion_, 0, 1);

  v31 = self->_interface;
  v32 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v31, v33, v32, sel_remote_fetchThumbnailBlobForContextID_completion_, 0, 0);
  v34 = self->_interface;
  v35 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v34, v36, v35, sel_remote_fetchThumbnailBlobForContextID_completion_, 0, 1);
  v37 = self->_interface;
  v38 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v37, v39, v38, sel_remote_deleteThumbnailBlobForContextID_completion_, 0, 0);
}

- (void)configureProgressReportingAPI
{
  NSXPCInterface *interface;
  uint64_t v4;
  const char *v5;
  NSXPCInterface *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  NSXPCInterface *v13;
  uint64_t v14;
  const char *v15;

  interface = self->_interface;
  v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_fetchProgressReportingCapabilitiesForContextID_completion_, 0, 0);
  v6 = self->_interface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v6, v12, (uint64_t)v11, sel_remote_fetchProgressReportingCapabilitiesForContextID_completion_, 0, 1);

  v13 = self->_interface;
  v14 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v13, v15, v14, sel_remote_deleteProgressReportingCapabilitiesForContextID_completion_, 0, 0);
}

- (void)configureDashboardAppAPI
{
  NSXPCInterface *interface;
  uint64_t v4;
  const char *v5;
  NSXPCInterface *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSXPCInterface *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  NSXPCInterface *v28;
  uint64_t v29;
  const char *v30;
  NSXPCInterface *v31;
  uint64_t v32;
  const char *v33;
  NSXPCInterface *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  id v41;

  interface = self->_interface;
  v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_getServerSyncStatusWithCompletion_, 0, 1);
  v6 = self->_interface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v7, v12, v8, v9, v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v6, v14, (uint64_t)v13, sel_remote_getServerInternalStateInfoWithCompletion_, 0, 1);

  v15 = self->_interface;
  v16 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v15, v17, v16, sel_remote_canSearchRostersWithCompletion_, 0, 1);
  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend_setWithObjects_(v18, v26, v19, v20, v21, v22, v23, v24, v25, 0);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v27, (uint64_t)v41, sel_remote_currentUserWithCompletion_, 0, 1);
  v28 = self->_interface;
  v29 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v28, v30, v29, sel_remote_fetchCountOfActivitiesForContextID_completion_, 0, 0);
  v31 = self->_interface;
  v32 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v31, v33, v32, sel_remote_fetchCountOfActivitiesForContextID_completion_, 0, 1);
  v34 = self->_interface;
  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  objc_msgSend_setWithObjects_(v35, v38, v36, v37, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v34, v40, (uint64_t)v39, sel_remote_fetchCountOfActivitiesForContextID_completion_, 1, 1);

}

- (void)configureAppsAPI
{
  NSXPCInterface *interface;
  uint64_t v4;
  const char *v5;
  NSXPCInterface *v6;
  uint64_t v7;
  const char *v8;
  NSXPCInterface *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  NSXPCInterface *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  interface = self->_interface;
  v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_setOverrideBundleIdentifier_completion_, 0, 0);
  v6 = self->_interface;
  v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_deleteAppWithBundleIdentifier_completion_, 0, 0);
  v9 = self->_interface;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)&v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v9, v15, (uint64_t)v14, sel_remote_listAppsWithCompletion_, 0, 1);

  v16 = self->_interface;
  v17 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v16, v18, v17, sel_remote_listAppsWithCompletion_, 1, 1);
}

- (void)configureUserNotificationAPI
{
  NSXPCInterface *interface;
  uint64_t v4;
  const char *v5;
  NSXPCInterface *v6;
  uint64_t v7;
  const char *v8;
  NSXPCInterface *v9;
  uint64_t v10;
  const char *v11;
  NSXPCInterface *v12;
  uint64_t v13;
  const char *v14;
  NSXPCInterface *v15;
  uint64_t v16;
  const char *v17;
  NSXPCInterface *v18;
  uint64_t v19;
  const char *v20;
  NSXPCInterface *v21;
  uint64_t v22;
  const char *v23;
  NSXPCInterface *v24;
  uint64_t v25;
  const char *v26;

  interface = self->_interface;
  v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_triggerUserNotificationReviewDueHandoutsWithReferenceDate_completion_, 0, 0);
  v6 = self->_interface;
  v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_triggerUserNotificationRevisedSubmissionWithAttachmentID_studentName_completion_, 0, 0);
  v9 = self->_interface;
  v10 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v9, v11, v10, sel_remote_triggerUserNotificationHandoutPastDueSummaryWithReferenceDate_completion_, 0, 0);
  v12 = self->_interface;
  v13 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v12, v14, v13, sel_remote_triggerUserNotificationHandoutDueSoonWithReferenceDate_completion_, 0, 0);
  v15 = self->_interface;
  v16 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v15, v17, v16, sel_remote_triggerUserNotificationHandoutAssignedWithHandoutID_completion_, 0, 0);
  v18 = self->_interface;
  v19 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v18, v20, v19, sel_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_, 0, 0);
  v21 = self->_interface;
  v22 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v21, v23, v22, sel_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_, 1, 0);
  v24 = self->_interface;
  v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_, 2, 0);
}

- (void)configureUtilityServerAPI
{
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  NSXPCInterface *interface;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  NSXPCInterface *v14;
  uint64_t v15;
  const char *v16;
  NSXPCInterface *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  NSXPCInterface *v24;
  uint64_t v25;
  const char *v26;
  NSXPCInterface *v27;
  uint64_t v28;
  const char *v29;
  NSXPCInterface *v30;
  uint64_t v31;
  const char *v32;
  NSXPCInterface *v33;
  uint64_t v34;
  const char *v35;
  NSXPCInterface *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  NSXPCInterface *v43;
  uint64_t v44;
  const char *v45;
  NSXPCInterface *v46;
  uint64_t v47;
  const char *v48;
  NSXPCInterface *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[5];

  v54[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_classesForSelector_argumentIndex_ofReply_(self->_interface, a2, (uint64_t)sel_remote_statusWithCompletion_, 0, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend_setByAddingObject_(v52, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v6, (uint64_t)v5, sel_remote_statusWithCompletion_, 0, 1);
  interface = self->_interface;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v54[2] = objc_opt_class();
  v54[3] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v54, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v8, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v13, (uint64_t)v12, sel_remote_syncStatsWithCompletion_, 0, 1);

  v14 = self->_interface;
  v15 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v14, v16, v15, sel_remote_fetchReportsWithPredicate_completion_, 0, 0);
  v17 = self->_interface;
  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend_setWithObjects_(v18, v21, v19, v20, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_fetchReportsWithPredicate_completion_, 1, 1);

  v24 = self->_interface;
  v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_addAdminRequestor_completion_, 0, 0);
  v27 = self->_interface;
  v28 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v27, v29, v28, sel_remote_addAdminRequestor_completion_, 0, 1);
  v30 = self->_interface;
  v31 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v30, v32, v31, sel_remote_addAdminRequestor_completion_, 1, 1);
  v33 = self->_interface;
  v34 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v33, v35, v34, sel_remote_addOrganization_withLocations_completion_, 0, 0);
  v36 = self->_interface;
  v37 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)v53, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v37, v40, (uint64_t)v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v36, v42, (uint64_t)v41, sel_remote_addOrganization_withLocations_completion_, 1, 0);

  v43 = self->_interface;
  v44 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v43, v45, v44, sel_remote_addOrganization_withLocations_completion_, 0, 1);
  v46 = self->_interface;
  v47 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v46, v48, v47, sel_remote_addOrganization_withLocations_completion_, 1, 1);
  v49 = self->_interface;
  v50 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v49, v51, v50, sel_remote_deleteOrganization_completion_, 0, 0);

}

- (void)configureAuthorizationStatusAPI
{
  NSXPCInterface *interface;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  NSXPCInterface *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  NSXPCInterface *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  NSXPCInterface *v24;
  uint64_t v25;
  const char *v26;
  NSXPCInterface *v27;
  uint64_t v28;
  const char *v29;
  NSXPCInterface *v30;
  uint64_t v31;
  const char *v32;
  NSXPCInterface *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  NSXPCInterface *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  NSXPCInterface *v47;
  uint64_t v48;
  const char *v49;
  NSXPCInterface *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[3];

  v62[2] = *MEMORY[0x1E0C80C00];
  interface = self->_interface;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v62, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v9, (uint64_t)v8, sel_remote_addAuthorizationStatus_forContextAtPath_completion_, 1, 0);

  v10 = self->_interface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v61, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v10, v16, (uint64_t)v15, sel_remote_removeAuthorizationStatus_forContextAtPath_completion_, 1, 0);

  v17 = self->_interface;
  v18 = (void *)MEMORY[0x1E0C99E60];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v60, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_authorizationStatusForContextAtPath_completion_, 0, 0);

  v24 = self->_interface;
  v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_authorizationStatusForContextAtPath_completion_, 0, 1);
  v27 = self->_interface;
  v28 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v27, v29, v28, sel_remote_authorizationStatusForHandoutAssignedItem_completion_, 0, 0);
  v30 = self->_interface;
  v31 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v30, v32, v31, sel_remote_authorizationStatusForHandoutAssignedItem_completion_, 0, 1);
  v33 = self->_interface;
  v34 = (void *)MEMORY[0x1E0C99E60];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v59, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v34, v37, (uint64_t)v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v33, v39, (uint64_t)v38, sel_remote_addAuthorizationStatus_forHandoutAssignedItem_completion_, 1, 0);

  v40 = self->_interface;
  v41 = (void *)MEMORY[0x1E0C99E60];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v42, (uint64_t)v58, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v41, v44, (uint64_t)v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v40, v46, (uint64_t)v45, sel_remote_removeAuthorizationStatus_forHandoutAssignedItem_completion_, 1, 0);

  v47 = self->_interface;
  v48 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v47, v49, v48, sel_remote_authTreeWithCompletion_, 0, 1);
  v50 = self->_interface;
  v51 = (void *)MEMORY[0x1E0C99E60];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v52, (uint64_t)v57, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v51, v54, (uint64_t)v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v50, v56, (uint64_t)v55, sel_remote_authTreeForAttachment_withCompletion_, 0, 1);

}

- (void)configureHandoutAPI
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  id v11;

  CLSHandoutClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  objc_msgSend_setByAddingObject_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CLSSurveyClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromSet_(v6, v8, (uint64_t)v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v9, (uint64_t)v11, sel_remote_publishHandoutGraph_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v10, (uint64_t)v11, sel_remote_repairHandoutAttachments_completion_, 0, 0);

}

- (void)configureCollectionsAPI
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v9 = (id)objc_msgSend_initWithObjects_(v3, v7, v4, v5, v6, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v9, sel_remote_deleteCollectionRelatedObjectsWithCompletion_completion_, 0, 0);

}

- (void)configureCollaborationStateAPI
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  NSXPCInterface *interface;
  uint64_t v9;
  const char *v10;
  NSXPCInterface *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  NSXPCInterface *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  NSXPCInterface *v22;
  uint64_t v23;
  const char *v24;
  NSXPCInterface *v25;
  uint64_t v26;
  const char *v27;
  NSXPCInterface *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  NSXPCInterface *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  NSXPCInterface *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  id v49;

  CLSCollaborationStateClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_supportedInfoDictionaryClasses(CLSCollaborationState, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromSet_(v3, v7, (uint64_t)v6);
  v49 = (id)objc_claimAutoreleasedReturnValue();

  interface = self->_interface;
  v9 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v10, v9, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 0, 0);
  v11 = self->_interface;
  v12 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v11, v13, v12, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 1, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v14, (uint64_t)v49, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 0, 1);
  v15 = self->_interface;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend_setWithObjects_(v16, v19, v17, v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v15, v21, (uint64_t)v20, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 1, 1);

  v22 = self->_interface;
  v23 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v22, v24, v23, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 0, 0);
  v25 = self->_interface;
  v26 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v25, v27, v26, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 1, 0);
  v28 = self->_interface;
  v29 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v28, v30, v29, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 2, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v31, (uint64_t)v49, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 0, 1);
  v32 = self->_interface;
  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  objc_msgSend_setWithObjects_(v33, v36, v34, v35, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v32, v38, (uint64_t)v37, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 1, 1);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v39, (uint64_t)v49, sel_remote_publishCollaborationStateChanges_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v40, (uint64_t)v49, sel_remote_publishCollaborationStateChanges_completion_, 0, 1);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v41, (uint64_t)v49, sel_remote_publishCollaborationStateChanges_completion_, 1, 1);
  v42 = self->_interface;
  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  objc_msgSend_setWithObjects_(v43, v46, v44, v45, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v42, v48, (uint64_t)v47, sel_remote_publishCollaborationStateChanges_completion_, 2, 1);

}

- (void)configureClassAPI
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  id v12;

  CLSRosterClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  objc_msgSend_setByAddingObject_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend_setByAddingObject_(v6, v8, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v9, (uint64_t)v12, sel_remote_publishClass_membersToInsert_membersToDelete_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v10, (uint64_t)v12, sel_remote_publishClass_membersToInsert_membersToDelete_completion_, 1, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v11, (uint64_t)v12, sel_remote_publishClass_membersToInsert_membersToDelete_completion_, 2, 0);

}

- (void)configureStudentActivityAPI
{
  NSXPCInterface *interface;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  NSXPCInterface *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  NSXPCInterface *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  NSXPCInterface *v24;
  uint64_t v25;
  const char *v26;
  NSXPCInterface *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  NSXPCInterface *v31;
  uint64_t v32;
  const char *v33;
  NSXPCInterface *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  NSXPCInterface *v41;
  uint64_t v42;
  const char *v43;
  NSXPCInterface *v44;
  uint64_t v45;
  const char *v46;
  NSXPCInterface *v47;
  uint64_t v48;
  const char *v49;
  NSXPCInterface *v50;
  uint64_t v51;
  const char *v52;
  NSXPCInterface *v53;
  uint64_t v54;
  const char *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[3];
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  interface = self->_interface;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v59, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v9, (uint64_t)v8, sel_remote_studentActivityForAttachmentsWithIDs_completion_, 0, 0);

  v10 = self->_interface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  v58[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v58, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v10, v16, (uint64_t)v15, sel_remote_studentActivityForAttachmentsWithIDs_completion_, 0, 1);

  v17 = self->_interface;
  v18 = (void *)MEMORY[0x1E0C99E60];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v57, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_fetchAndCompleteActiveAssignedActivitiesForContextPath_withCompletion_, 0, 0);

  v24 = self->_interface;
  v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_triggerUserNotificationRevisionRequestedWithAttachmentID_completion_, 0, 0);
  v27 = self->_interface;
  v28 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v27, v29, v28, sel_remote_validateAndCreateHandoutAssignedItem_withCompletion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v30, (uint64_t)self->_contextsSet, sel_remote_validateAndCreateHandoutAssignedItem_withCompletion_, 0, 1);
  v31 = self->_interface;
  v32 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v31, v33, v32, sel_remote_fetchHandoutAttachmentForDocumentURL_withCompletion_, 0, 0);
  v34 = self->_interface;
  v35 = (void *)MEMORY[0x1E0C99E60];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v36, (uint64_t)v56, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v35, v38, (uint64_t)v37, v56[0]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v34, v40, (uint64_t)v39, sel_remote_fetchHandoutAttachmentForDocumentURL_withCompletion_, 0, 1);

  v41 = self->_interface;
  v42 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v41, v43, v42, sel_remote_startAppActivity_bundleID_activityType_completion_, 0, 0);
  v44 = self->_interface;
  v45 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v44, v46, v45, sel_remote_startAppActivity_bundleID_activityType_completion_, 1, 0);
  v47 = self->_interface;
  v48 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v47, v49, v48, sel_remote_startActivityFailed_completion_, 0, 0);
  v50 = self->_interface;
  v51 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v50, v52, v51, sel_remote_fetchAppBasedAssignmentUsage_completion_, 0, 0);
  v53 = self->_interface;
  v54 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v53, v55, v54, sel_remote_fetchAppBasedAssignmentUsage_completion_, 0, 1);
}

- (void)configureFeatureAvailabilityAPI
{
  NSXPCInterface *interface;
  uint64_t v4;
  const char *v5;
  NSXPCInterface *v6;
  uint64_t v7;
  const char *v8;
  NSXPCInterface *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  NSXPCInterface *v16;
  uint64_t v17;
  const char *v18;
  NSXPCInterface *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  NSXPCInterface *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  NSXPCInterface *v33;
  uint64_t v34;
  const char *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  interface = self->_interface;
  v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_featureIsEnabled_completion_, 0, 0);
  v6 = self->_interface;
  v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_featureIsEnabled_completion_, 0, 1);
  v9 = self->_interface;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v38, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v9, v15, (uint64_t)v14, sel_remote_getUserDefaultsConfigurationDictionaryWithCompletion_, 0, 1);

  v16 = self->_interface;
  v17 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v16, v18, v17, sel_remote_getUserDefaultForDefaultNamed_completion_, 0, 0);
  v19 = self->_interface;
  v20 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v37, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v20, v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v19, v25, (uint64_t)v24, sel_remote_getUserDefaultForDefaultNamed_completion_, 0, 1);

  v26 = self->_interface;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v36, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v27, v30, (uint64_t)v29, v36[0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v26, v32, (uint64_t)v31, sel_remote_setUserDefaultValue_forDefaultNamed_completion_, 0, 0);

  v33 = self->_interface;
  v34 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v33, v35, v34, sel_remote_setUserDefaultValue_forDefaultNamed_completion_, 1, 0);
}

- (void)configureAssetSupportAPI
{
  NSXPCInterface *interface;
  uint64_t v4;
  const char *v5;
  NSXPCInterface *v6;
  uint64_t v7;
  const char *v8;
  NSXPCInterface *v9;
  uint64_t v10;
  const char *v11;
  NSXPCInterface *v12;
  uint64_t v13;
  const char *v14;
  NSXPCInterface *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  NSXPCInterface *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  NSXPCInterface *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  NSXPCInterface *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  NSXPCInterface *v37;
  uint64_t v38;
  const char *v39;
  NSXPCInterface *v40;
  uint64_t v41;
  const char *v42;
  NSXPCInterface *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  NSXPCInterface *v50;
  uint64_t v51;
  const char *v52;
  NSXPCInterface *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  NSXPCInterface *v57;
  uint64_t v58;
  const char *v59;
  NSXPCInterface *v60;
  uint64_t v61;
  const char *v62;
  NSXPCInterface *v63;
  uint64_t v64;
  const char *v65;
  NSXPCInterface *v66;
  uint64_t v67;
  const char *v68;
  NSXPCInterface *v69;
  uint64_t v70;
  const char *v71;
  NSXPCInterface *v72;
  uint64_t v73;
  const char *v74;
  NSXPCInterface *v75;
  uint64_t v76;
  const char *v77;
  NSXPCInterface *v78;
  uint64_t v79;
  const char *v80;
  NSXPCInterface *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  const char *v87;
  void *v88;
  NSXPCInterface *v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  NSXPCInterface *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  const char *v99;
  NSXPCInterface *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  NSXPCInterface *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  void *v112;
  const char *v113;
  NSXPCInterface *v114;
  uint64_t v115;
  const char *v116;
  NSXPCInterface *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  void *v122;
  const char *v123;
  NSXPCInterface *v124;
  uint64_t v125;
  const char *v126;
  NSXPCInterface *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  void *v132;
  const char *v133;
  _QWORD v134[5];
  _QWORD v135[5];
  _QWORD v136[7];

  v136[5] = *MEMORY[0x1E0C80C00];
  interface = self->_interface;
  v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 0, 0);
  v6 = self->_interface;
  v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 1, 0);
  v9 = self->_interface;
  v10 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v9, v11, v10, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 2, 0);
  v12 = self->_interface;
  v13 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v12, v14, v13, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 3, 0);
  v15 = self->_interface;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v136[0] = objc_opt_class();
  v136[1] = objc_opt_class();
  v136[2] = objc_opt_class();
  v136[3] = objc_opt_class();
  v136[4] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v136, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v16, v19, (uint64_t)v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v15, v21, (uint64_t)v20, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 0, 1);

  v22 = self->_interface;
  v23 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v22, v24, v23, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 1, 1);
  CLSAssetDownloadProgressNotifiableInterface();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self->_interface;
  v27 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v26, v28, v27, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 0, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v29, (uint64_t)v25, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 1, 0);
  v30 = self->_interface;
  v31 = (void *)MEMORY[0x1E0C99E60];
  v135[0] = objc_opt_class();
  v135[1] = objc_opt_class();
  v135[2] = objc_opt_class();
  v135[3] = objc_opt_class();
  v135[4] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v135, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v31, v34, (uint64_t)v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v30, v36, (uint64_t)v35, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 0, 1);

  v37 = self->_interface;
  v38 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v37, v39, v38, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 1, 1);
  v40 = self->_interface;
  v41 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v40, v42, v41, sel_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_, 0, 0);
  v43 = self->_interface;
  v44 = (void *)MEMORY[0x1E0C99E60];
  v134[0] = objc_opt_class();
  v134[1] = objc_opt_class();
  v134[2] = objc_opt_class();
  v134[3] = objc_opt_class();
  v134[4] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v45, (uint64_t)v134, 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v44, v47, (uint64_t)v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v43, v49, (uint64_t)v48, sel_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_, 0, 1);

  v50 = self->_interface;
  v51 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v50, v52, v51, sel_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_, 1, 1);
  v53 = self->_interface;
  v54 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v53, v55, v54, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 0, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v56, (uint64_t)v25, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 1, 0);
  v57 = self->_interface;
  v58 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v57, v59, v58, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 0, 1);
  v60 = self->_interface;
  v61 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v60, v62, v61, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 1, 1);
  v63 = self->_interface;
  v64 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v63, v65, v64, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 2, 1);
  v66 = self->_interface;
  v67 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v66, v68, v67, sel_remote_createShareIfNeededForURL_completion_, 0, 0);
  v69 = self->_interface;
  v70 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v69, v71, v70, sel_remote_createShareIfNeededForURL_completion_, 1, 1);
  v72 = self->_interface;
  v73 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v72, v74, v73, sel_remote_createShareIfNeededForURL_completion_, 2, 1);
  v75 = self->_interface;
  v76 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v75, v77, v76, sel_remote_createShareIfNeededForURL_completion_, 3, 1);
  v78 = self->_interface;
  v79 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v78, v80, v79, sel_remote_deleteBackingStoreForAsset_completion_, 0, 0);
  v81 = self->_interface;
  v82 = (void *)MEMORY[0x1E0C99E60];
  v83 = objc_opt_class();
  v84 = objc_opt_class();
  objc_msgSend_setWithObjects_(v82, v85, v83, v84, 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v81, v87, (uint64_t)v86, sel_remote_deleteBackingStoreForAsset_completion_, 1, 1);

  CLSAssetUploadProgressNotifiableInterface();
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = self->_interface;
  v90 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v89, v91, v90, sel_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_, 0, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v92, (uint64_t)v88, sel_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_, 2, 0);
  v93 = self->_interface;
  v94 = (void *)MEMORY[0x1E0C99E60];
  v95 = objc_opt_class();
  v96 = objc_opt_class();
  objc_msgSend_setWithObjects_(v94, v97, v95, v96, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v93, v99, (uint64_t)v98, sel_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_, 0, 1);

  v100 = self->_interface;
  v101 = (void *)MEMORY[0x1E0C99E60];
  v102 = objc_opt_class();
  v103 = objc_opt_class();
  objc_msgSend_setWithObjects_(v101, v104, v102, v103, 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v100, v106, (uint64_t)v105, sel_remote_fetchOrphanedAssetsWithCompletion_, 0, 1);

  v107 = self->_interface;
  v108 = (void *)MEMORY[0x1E0C99E60];
  v109 = objc_opt_class();
  v110 = objc_opt_class();
  objc_msgSend_setWithObjects_(v108, v111, v109, v110, 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v107, v113, (uint64_t)v112, sel_remote_fetchOrphanedAssetsWithCompletion_, 1, 1);

  v114 = self->_interface;
  v115 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v114, v116, v115, sel_remote_topLevelContentStoreCacheDirectoryURLWithCompletion_, 0, 1);
  v117 = self->_interface;
  v118 = (void *)MEMORY[0x1E0C99E60];
  v119 = objc_opt_class();
  v120 = objc_opt_class();
  objc_msgSend_setWithObjects_(v118, v121, v119, v120, 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v117, v123, (uint64_t)v122, sel_remote_topLevelContentStoreCacheDirectoryURLWithCompletion_, 1, 1);

  v124 = self->_interface;
  v125 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v124, v126, v125, sel_remote_currentUserContentStoreCacheDirectoryURLWithCompletion_, 0, 1);
  v127 = self->_interface;
  v128 = (void *)MEMORY[0x1E0C99E60];
  v129 = objc_opt_class();
  v130 = objc_opt_class();
  objc_msgSend_setWithObjects_(v128, v131, v129, v130, 0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v127, v133, (uint64_t)v132, sel_remote_currentUserContentStoreCacheDirectoryURLWithCompletion_, 1, 1);

}

- (void)configureAdminRequestAPI
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  NSXPCInterface *interface;
  uint64_t v10;
  const char *v11;
  NSXPCInterface *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  NSXPCInterface *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  NSXPCInterface *v29;
  uint64_t v30;
  const char *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v33, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v7, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 0, 0);
  interface = self->_interface;
  v10 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v11, v10, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 1, 0);
  v12 = self->_interface;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v32, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v13, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v12, v18, (uint64_t)v17, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 2, 0);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v19, (uint64_t)v7, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 0, 1);
  v20 = self->_interface;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend_setWithObjects_(v21, v26, v22, v23, v24, v25, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v20, v28, (uint64_t)v27, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 1, 1);

  v29 = self->_interface;
  v30 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v29, v31, v30, sel_remote_deleteAdminRequestID_completion_, 0, 0);

}

- (void)configureSurveyAnswerAPI
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  NSXPCInterface *interface;
  uint64_t v9;
  const char *v10;
  const char *v11;
  NSXPCInterface *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v27, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  interface = self->_interface;
  v9 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v10, v9, sel_remote_publishSurveyAnswers_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v11, (uint64_t)v7, sel_remote_publishSurveyAnswers_completion_, 0, 1);
  v12 = self->_interface;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend_setWithObjects_(v13, v16, v14, v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v12, v18, (uint64_t)v17, sel_remote_publishSurveyAnswers_completion_, 1, 1);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v19, v22, (uint64_t)v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v24, (uint64_t)v23, sel_remote_fetchSurveyAnswer_responderIDs_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v25, (uint64_t)v23, sel_remote_fetchSurveyAnswer_responderIDs_completion_, 1, 0);

}

- (void)configureRelayRequestAPI
{
  NSXPCInterface *interface;
  uint64_t v4;
  const char *v5;
  NSXPCInterface *v6;
  uint64_t v7;
  const char *v8;
  NSXPCInterface *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  id v14;

  interface = self->_interface;
  v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_relayRequestWithData_requestType_fileHandle_completion_, 0, 0);
  v6 = self->_interface;
  v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_relayRequestWithData_requestType_fileHandle_completion_, 2, 0);
  v9 = self->_interface;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v10, v12, v11, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v9, v13, (uint64_t)v14, sel_remote_relayRequestWithData_requestType_fileHandle_completion_, 1, 1);

}

- (void)configureInsightEventsAPI
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  NSXPCInterface *interface;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v7, sel_remote_saveInsightEvents_completion_, 0, 0);
  interface = self->_interface;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend_setWithObjects_(v10, v13, v11, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v15, (uint64_t)v14, sel_remote_saveInsightEvents_completion_, 1, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arraySet, 0);
  objc_storeStrong((id *)&self->_contextsSet, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
