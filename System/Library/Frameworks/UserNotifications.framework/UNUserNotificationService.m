@implementation UNUserNotificationService

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_5);
  return (id)clientInterface___interface;
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_50);
  return (id)serverInterface___interface;
}

void __44__UNUserNotificationService_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
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
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
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
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
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
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  id v138;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB910C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface___interface;
  serverInterface___interface = v0;

  v2 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_setObservingUserNotifications_forBundleIdentifier_, 1, 0);

  v4 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler_, 1, 0);

  v6 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler_, 1, 1);

  v8 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_requestRemoveAuthorizationForBundleIdentifier_completionHandler_, 0, 0);

  v10 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestRemoveAuthorizationForBundleIdentifier_completionHandler_, 1, 1);

  v12 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getNotificationSettingsForBundleIdentifier_withCompletionHandler_, 0, 0);

  v14 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getNotificationSettingsForBundleIdentifier_withCompletionHandler_, 0, 1);

  v16 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getNotificationCategoriesForBundleIdentifier_withCompletionHandler_, 0, 0);

  v18 = (void *)serverInterface___interface;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getNotificationCategoriesForBundleIdentifier_withCompletionHandler_, 0, 1);

  v22 = (void *)serverInterface___interface;
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_setNotificationCategories_forBundleIdentifier_, 0, 0);

  v26 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_setNotificationCategories_forBundleIdentifier_, 1, 0);

  v28 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_addNotificationRequest_forBundleIdentifier_withCompletionHandler_, 0, 0);

  v30 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_addNotificationRequest_forBundleIdentifier_withCompletionHandler_, 1, 0);

  v32 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_addNotificationRequest_forBundleIdentifier_withCompletionHandler_, 0, 1);

  v34 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_, 0, 0);

  v36 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_, 1, 0);

  v38 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_, 2, 0);

  v40 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_, 0, 1);

  v42 = (void *)serverInterface___interface;
  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_setNotificationRequests_forBundleIdentifier_, 0, 0);

  v46 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_setNotificationRequests_forBundleIdentifier_, 1, 0);

  v48 = (void *)serverInterface___interface;
  v49 = (void *)MEMORY[0x1E0C99E60];
  v50 = objc_opt_class();
  objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_setNotificationRequests_forBundleIdentifier_completionHandler_, 0, 0);

  v52 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_setNotificationRequests_forBundleIdentifier_completionHandler_, 1, 0);

  v54 = (void *)serverInterface___interface;
  v55 = (void *)MEMORY[0x1E0C99E60];
  v56 = objc_opt_class();
  objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_setNotificationRequests_forBundleIdentifier_completionHandler_, 0, 1);

  v58 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler_, 0, 0);

  v60 = (void *)serverInterface___interface;
  v61 = (void *)MEMORY[0x1E0C99E60];
  v62 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler_, 0, 1);

  v64 = (void *)serverInterface___interface;
  v65 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setClasses:forSelector:argumentIndex:ofReply:", v67, sel_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler_, 0, 0);

  v68 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler_, 1, 0);

  v70 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler_, 1, 1);

  v72 = (void *)serverInterface___interface;
  v73 = (void *)MEMORY[0x1E0C99E60];
  v74 = objc_opt_class();
  objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setClasses:forSelector:argumentIndex:ofReply:", v75, sel_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler_, 0, 0);

  v76 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler_, 1, 0);

  v78 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v79, sel_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler_, 1, 1);

  v80 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler_, 0, 0);

  v82 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler_, 1, 1);

  v84 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setClasses:forSelector:argumentIndex:ofReply:", v85, sel_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler_, 0, 0);

  v86 = (void *)serverInterface___interface;
  v87 = (void *)MEMORY[0x1E0C99E60];
  v88 = objc_opt_class();
  objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setClasses:forSelector:argumentIndex:ofReply:", v89, sel_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler_, 0, 1);

  v90 = (void *)serverInterface___interface;
  v91 = (void *)MEMORY[0x1E0C99E60];
  v92 = objc_opt_class();
  objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setClasses:forSelector:argumentIndex:ofReply:", v93, sel_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler_, 0, 0);

  v94 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler_, 1, 0);

  v96 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setClasses:forSelector:argumentIndex:ofReply:", v97, sel_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler_, 1, 1);

  v98 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler_, 0, 0);

  v100 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler_, 1, 1);

  v102 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setClasses:forSelector:argumentIndex:ofReply:", v103, sel_getBadgeNumberForBundleIdentifier_withCompletionHandler_, 0, 0);

  v104 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setClasses:forSelector:argumentIndex:ofReply:", v105, sel_getBadgeNumberForBundleIdentifier_withCompletionHandler_, 0, 1);

  v106 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setClasses:forSelector:argumentIndex:ofReply:", v107, sel_setBadgeNumber_forBundleIdentifier_withCompletionHandler_, 0, 0);

  v108 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setClasses:forSelector:argumentIndex:ofReply:", v109, sel_setBadgeNumber_forBundleIdentifier_withCompletionHandler_, 1, 0);

  v110 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_setBadgeNumber_forBundleIdentifier_withCompletionHandler_, 0, 1);

  v112 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setClasses:forSelector:argumentIndex:ofReply:", v113, sel_setBadgeString_forBundleIdentifier_withCompletionHandler_, 0, 0);

  v114 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setClasses:forSelector:argumentIndex:ofReply:", v115, sel_setBadgeString_forBundleIdentifier_withCompletionHandler_, 1, 0);

  v116 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setClasses:forSelector:argumentIndex:ofReply:", v117, sel_setBadgeString_forBundleIdentifier_withCompletionHandler_, 0, 1);

  v118 = (void *)serverInterface___interface;
  v119 = (void *)MEMORY[0x1E0C99E60];
  v120 = objc_opt_class();
  objc_msgSend(v119, "setWithObjects:", v120, objc_opt_class(), 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setClasses:forSelector:argumentIndex:ofReply:", v121, sel_setNotificationTopics_forBundleIdentifier_withCompletionHandler_, 0, 0);

  v122 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setClasses:forSelector:argumentIndex:ofReply:", v123, sel_setNotificationTopics_forBundleIdentifier_withCompletionHandler_, 1, 0);

  v124 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setClasses:forSelector:argumentIndex:ofReply:", v125, sel_setNotificationTopics_forBundleIdentifier_withCompletionHandler_, 0, 1);

  v126 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setClasses:forSelector:argumentIndex:ofReply:", v127, sel_getNotificationTopicsForBundleIdentifier_withCompletionHandler_, 0, 0);

  v128 = (void *)serverInterface___interface;
  v129 = (void *)MEMORY[0x1E0C99E60];
  v130 = objc_opt_class();
  objc_msgSend(v129, "setWithObjects:", v130, objc_opt_class(), 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setClasses:forSelector:argumentIndex:ofReply:", v131, sel_getNotificationTopicsForBundleIdentifier_withCompletionHandler_, 0, 1);

  v132 = (void *)serverInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setClasses:forSelector:argumentIndex:ofReply:", v133, sel_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler_, 0, 0);

  v134 = (void *)serverInterface___interface;
  v135 = (void *)MEMORY[0x1E0C99E60];
  v136 = objc_opt_class();
  v137 = objc_opt_class();
  objc_msgSend(v135, "setWithObjects:", v136, v137, objc_opt_class(), 0);
  v138 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setClasses:forSelector:argumentIndex:ofReply:", v138, sel_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler_, 0, 1);

}

void __44__UNUserNotificationService_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB908F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface;
  clientInterface___interface = v0;

  v2 = (void *)clientInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_didReceiveDeviceToken_forBundleIdentifier_, 0, 0);

  v4 = (void *)clientInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didReceiveDeviceToken_forBundleIdentifier_, 1, 0);

}

@end
