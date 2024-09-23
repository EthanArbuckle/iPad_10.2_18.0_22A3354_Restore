@implementation GKUtilityServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4CF4C0;
}

+ (void)configureInterface:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getStoreBagValuesForKeys_handler_, 0, 0);

  objc_msgSend(a1, "plistClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getStoreBagValuesForKeys_handler_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_reportMetricsEventWithTopic_shouldFlush_metricsFields_, 0, 0);

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_reportPerformanceMetricsEvent_, 0, 0);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_reportMultiplayerActivityMetricsEvent_, 0, 0);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, v26, v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_reportLoadUrlMetricsEvent_, 0, 0);

  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, v31, v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_recordMatchStart_minPlayers_maxPlayers_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_recordMatchServer_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_recordActiveDevices_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_recordSharePlayDevices_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_completeMatchRecording_matchType_, 0, 0);

  v38 = (void *)MEMORY[0x1E0C99E60];
  v39 = objc_opt_class();
  objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_launchContext_, 0, 0);

  v41 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_launchContext_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_launchContext_, 3, 0);

  v45 = (void *)MEMORY[0x1E0C99E60];
  v46 = objc_opt_class();
  objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_, 0, 0);

  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_getBSServiceConnectionEndpointForMachName_service_instance_handler_, 0, 1);

}

@end
