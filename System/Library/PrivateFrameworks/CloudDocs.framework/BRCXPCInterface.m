@implementation BRCXPCInterface

void __BRCXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  int v2;
  void **v3;
  _QWORD *v4;
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
  int v21;
  _QWORD *v22;
  int v23;
  char **v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  Class CKRecordIDClass;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  Class v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  Class CKRecordZoneIDClass;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  Class v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  Class CKUserIdentityLookupInfoClass;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  Class CKShareParticipantClass;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  _QWORD v165[3];
  _QWORD v166[2];
  _QWORD v167[3];
  _QWORD v168[3];
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[8];
  _QWORD v173[2];
  _QWORD v174[3];
  _QWORD v175[5];
  _QWORD v176[5];
  _QWORD v177[9];
  _QWORD v178[6];

  v178[4] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)BRCXPCInterface_iface;
  BRCXPCInterface_iface = v0;

  v2 = FPIsCloudDocsWithFPFSEnabled();
  v3 = (void **)&protocolRef_BRProtocolFPFS;
  v4 = &protocolRef_BRProtocolLegacy;
  if (v2)
    v4 = &protocolRef_BRProtocolFPFS;
  objc_msgSend((id)BRCXPCInterface_iface, "setProtocol:", *v4);
  v178[0] = objc_opt_class();
  v178[1] = objc_opt_class();
  v178[2] = objc_opt_class();
  v178[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)BRCXPCInterface_iface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setupInstanceWithDict_reply_, 0, 0);

  if ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
  {
    BRCSetupGenericOperations(&unk_1EE457300, (void *)BRCXPCInterface_iface);
    v3 = (void **)&protocolRef_BRShareOperationLegacyProtocol;
  }
  BRCSetupGenericOperations(*v3, (void *)BRCXPCInterface_iface);
  BRCSetupGenericOperations(&unk_1EE452238, (void *)BRCXPCInterface_iface);
  BRCSetupGenericOperations(&unk_1EE450E30, (void *)BRCXPCInterface_iface);
  v177[0] = objc_opt_class();
  v177[1] = objc_opt_class();
  v177[2] = objc_opt_class();
  v177[3] = objc_opt_class();
  v177[4] = objc_opt_class();
  v177[5] = objc_opt_class();
  v177[6] = objc_opt_class();
  v177[7] = objc_opt_class();
  v177[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setProtocol:", &unk_1EE439628);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_receiveUpdates_logicalExtensions_physicalExtensions_reply_, 0, 0);

  v176[0] = objc_opt_class();
  v176[1] = objc_opt_class();
  v176[2] = objc_opt_class();
  v176[3] = objc_opt_class();
  v176[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_receiveUpdates_logicalExtensions_physicalExtensions_reply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_receiveUpdates_logicalExtensions_physicalExtensions_reply_, 2, 0);

  v175[0] = objc_opt_class();
  v175[1] = objc_opt_class();
  v175[2] = objc_opt_class();
  v175[3] = objc_opt_class();
  v175[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_receiveProgressUpdates_reply_, 0, 0);

  v164 = v9;
  objc_msgSend((id)BRCXPCInterface_iface, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_getItemUpdateSenderWithReceiver_reply_, 0, 0);
  v174[0] = objc_opt_class();
  v174[1] = objc_opt_class();
  v174[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)BRCXPCInterface_iface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getItemUpdateSenderWithReceiver_reply_, 1, 1);

  v19 = (void *)objc_opt_new();
  v21 = BRIsFPFSEnabled(v19, v20);
  v22 = &protocolRef_BRItemNotificationSending;
  if (!v21)
    v22 = &protocolRef_BRItemNotificationSendingLegacy;
  objc_msgSend(v19, "setProtocol:", *v22);
  v163 = v19;
  objc_msgSend((id)BRCXPCInterface_iface, "setInterface:forSelector:argumentIndex:ofReply:", v19, sel_getItemUpdateSenderWithReceiver_reply_, 0, 1);
  v23 = FPIsCloudDocsWithFPFSEnabled();
  v24 = &selRef_getAttributeValues_forItemIdentifier_reply_;
  if (!v23)
    v24 = &selRef_getAttributeValues_forItemAtURL_reply_;
  v25 = *v24;
  v173[0] = objc_opt_class();
  v173[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)BRCXPCInterface_iface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v28, v25, 0, 0);

  v172[0] = objc_opt_class();
  v172[1] = objc_opt_class();
  v172[2] = objc_opt_class();
  v172[3] = objc_opt_class();
  v172[4] = objc_opt_class();
  v172[5] = objc_opt_class();
  v172[6] = objc_opt_class();
  CKRecordIDClass = getCKRecordIDClass();
  if (!CKRecordIDClass)
    CKRecordIDClass = (Class)objc_opt_class();
  v172[7] = CKRecordIDClass;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 8);
  v30 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)BRCXPCInterface_iface;
  v158 = (void *)v30;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setClasses:forSelector:argumentIndex:ofReply:", v32, v25, 0, 1);

  +[BRContainer classesForDecoding](BRContainer, "classesForDecoding");
  v33 = objc_claimAutoreleasedReturnValue();
  v171[0] = objc_opt_class();
  v171[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v33, "setByAddingObjectsFromArray:", v34);
  v35 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_getContainersNeedingUpload_, 0, 1);
  v162 = (void *)v35;
  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_getContainersByID_, 0, 1);
  LOBYTE(v33) = FPIsCloudDocsWithFPFSEnabled();
  v36 = (void *)MEMORY[0x1E0C99E60];
  v37 = getCKRecordIDClass();
  v38 = (uint64_t)v37;
  if ((v33 & 1) != 0)
  {
    if (!v37)
      v38 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_copyShareIDForItemIdentifier_reply_, 0, 1);
    v40 = (void *)MEMORY[0x1E0C99E60];
    v170[0] = objc_opt_class();
    v41 = objc_opt_class();
    if (!v41)
      v41 = objc_opt_class();
    v170[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_listNonLocalVersionsWithItemIdentifier_reply_, 0, 1);
  }
  else
  {
    if (!v37)
      v38 = objc_opt_class();
    CKRecordZoneIDClass = getCKRecordZoneIDClass();
    if (!CKRecordZoneIDClass)
      CKRecordZoneIDClass = (Class)objc_opt_class();
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v38, CKRecordZoneIDClass, v45, v46, v47, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_copyBulkShareIDsAtURLs_reply_, 0, 1);
    v48 = (void *)BRCXPCInterface_iface;
    v49 = (void *)MEMORY[0x1E0C99E60];
    v50 = objc_opt_class();
    v156 = objc_opt_class();
    objc_msgSend(v49, "setWithObjects:", v50, v156, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_copyBulkShareIDsAtURLs_reply_, 0, 0);
  }

  v51 = (void *)MEMORY[0x1E0C99E60];
  v169[0] = objc_opt_class();
  v169[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setWithArray:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x1E0C99E60];
  v168[0] = objc_opt_class();
  v168[1] = objc_opt_class();
  v55 = getCKRecordIDClass();
  if (!v55)
    v55 = (Class)objc_opt_class();
  v168[2] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setWithArray:", v56);
  v57 = objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0C99E60];
  v167[0] = objc_opt_class();
  v167[1] = objc_opt_class();
  v167[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setWithArray:", v59);
  v60 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_, 0, 0);
  v161 = (void *)v57;
  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_, 0, 1);
  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_, 1, 1);
  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_, 2, 1);
  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_, 3, 1);
  v160 = (void *)v60;
  objc_msgSend((id)BRCXPCInterface_iface, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_, 4, 1);
  v61 = (void *)BRCXPCInterface_iface;
  v62 = (void *)MEMORY[0x1E0C99E60];
  CKUserIdentityLookupInfoClass = getCKUserIdentityLookupInfoClass();
  if (!CKUserIdentityLookupInfoClass)
    CKUserIdentityLookupInfoClass = (Class)objc_opt_class();
  v64 = objc_opt_class();
  objc_msgSend(v62, "setWithObjects:", CKUserIdentityLookupInfoClass, v64, objc_opt_class(), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_startOperation_toLookupShareParticipants_reply_, 1, 0);

  v66 = (void *)BRCXPCInterface_iface;
  v67 = (void *)MEMORY[0x1E0C99E60];
  CKShareParticipantClass = getCKShareParticipantClass();
  if (!CKShareParticipantClass)
    CKShareParticipantClass = (Class)objc_opt_class();
  v69 = objc_opt_class();
  objc_msgSend(v67, "setWithObjects:", CKShareParticipantClass, v69, objc_opt_class(), 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setClasses:forSelector:argumentIndex:ofReply:", v70, sel_startOperation_toLookupShareParticipants_reply_, 0, 1);

  v166[0] = objc_opt_class();
  v166[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = (void *)BRCXPCInterface_iface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v71);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setClasses:forSelector:argumentIndex:ofReply:", v73, sel_getLoggedInUserPropertyValuesForKeys_reply_, 0, 0);

  v165[0] = objc_opt_class();
  v165[1] = objc_opt_class();
  v165[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 3);
  v74 = objc_claimAutoreleasedReturnValue();

  v75 = (void *)BRCXPCInterface_iface;
  v159 = (void *)v74;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v74);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v76, sel_getLoggedInUserPropertyValuesForKeys_reply_, 0, 1);

  v77 = (void *)BRCXPCInterface_iface;
  v78 = (void *)MEMORY[0x1E0C99E60];
  v79 = objc_opt_class();
  v80 = objc_opt_class();
  objc_msgSend(v78, "setWithObjects:", v79, v80, objc_opt_class(), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_queryEligibleAccountDescriptorsWithReply_, 0, 1);

  v82 = (void *)BRCXPCInterface_iface;
  v83 = (void *)MEMORY[0x1E0C99E60];
  v84 = objc_opt_class();
  v85 = objc_opt_class();
  objc_msgSend(v83, "setWithObjects:", v84, v85, objc_opt_class(), 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setClasses:forSelector:argumentIndex:ofReply:", v86, sel_queryPathsForPersona_reply_, 0, 1);

  v87 = (void *)BRCXPCInterface_iface;
  v88 = (void *)MEMORY[0x1E0C99E60];
  v89 = objc_opt_class();
  v90 = objc_opt_class();
  objc_msgSend(v88, "setWithObjects:", v89, v90, objc_opt_class(), 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setClasses:forSelector:argumentIndex:ofReply:", v91, sel_enumerateWorkingSetChangesFromChangeToken_limit_completion_, 0, 1);

  v92 = (void *)BRCXPCInterface_iface;
  v93 = (void *)MEMORY[0x1E0C99E60];
  v94 = objc_opt_class();
  objc_msgSend(v93, "setWithObjects:", v94, objc_opt_class(), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_enumerateWorkingSetChangesFromChangeToken_limit_completion_, 1, 1);

  v96 = (void *)BRCXPCInterface_iface;
  v97 = (void *)MEMORY[0x1E0C99E60];
  v98 = objc_opt_class();
  v99 = objc_opt_class();
  objc_msgSend(v97, "setWithObjects:", v98, v99, objc_opt_class(), 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setClasses:forSelector:argumentIndex:ofReply:", v100, sel_enumerateItemsInFolder_sortOrder_offset_limit_completion_, 0, 1);

  v101 = (void *)BRCXPCInterface_iface;
  v102 = (void *)MEMORY[0x1E0C99E60];
  v103 = objc_opt_class();
  v104 = objc_opt_class();
  objc_msgSend(v102, "setWithObjects:", v103, v104, objc_opt_class(), 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setClasses:forSelector:argumentIndex:ofReply:", v105, sel_enumerateAllFoldersWithSortOrder_offset_limit_completion_, 0, 1);

  if (FPIsCloudDocsWithFPFSEnabled())
  {
    objc_msgSend((id)BRCXPCInterface_iface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler_, 0, 0);
    v106 = (void *)BRCXPCInterface_iface;
    v107 = (void *)MEMORY[0x1E0C99E60];
    v108 = objc_opt_class();
    v109 = objc_opt_class();
    objc_msgSend(v107, "setWithObjects:", v108, v109, objc_opt_class(), 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setClasses:forSelector:argumentIndex:ofReply:", v110, sel_createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler_, 1, 1);

    objc_msgSend((id)BRCXPCInterface_iface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler_, 0, 0);
    v111 = (void *)BRCXPCInterface_iface;
    v112 = (void *)MEMORY[0x1E0C99E60];
    v113 = objc_opt_class();
    v114 = objc_opt_class();
    objc_msgSend(v112, "setWithObjects:", v113, v114, objc_opt_class(), 0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setClasses:forSelector:argumentIndex:ofReply:", v115, sel_modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler_, 1, 1);

    v116 = (void *)BRCXPCInterface_iface;
    v117 = (void *)MEMORY[0x1E0C99E60];
    v118 = objc_opt_class();
    v119 = objc_opt_class();
    objc_msgSend(v117, "setWithObjects:", v118, v119, objc_opt_class(), 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setClasses:forSelector:argumentIndex:ofReply:", v120, sel_deleteItemWithIdentifier_baseVersion_options_completionHandler_, 0, 1);

    v121 = (void *)BRCXPCInterface_iface;
    v122 = (void *)MEMORY[0x1E0C99E60];
    v123 = objc_opt_class();
    v124 = objc_opt_class();
    v125 = objc_opt_class();
    objc_msgSend(v122, "setWithObjects:", v123, v124, v125, objc_opt_class(), 0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setClasses:forSelector:argumentIndex:ofReply:", v126, sel_startDownloadFileObject_options_etagIfLoser_reply_, 0, 1);

    v127 = (void *)BRCXPCInterface_iface;
    v128 = (void *)MEMORY[0x1E0C99E60];
    v129 = objc_opt_class();
    v130 = objc_opt_class();
    objc_msgSend(v128, "setWithObjects:", v129, v130, objc_opt_class(), 0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setClasses:forSelector:argumentIndex:ofReply:", v131, sel_enumerateTrashItemsFromRank_limit_completion_, 0, 1);

    v132 = (void *)BRCXPCInterface_iface;
    v133 = (void *)MEMORY[0x1E0C99E60];
    v134 = objc_opt_class();
    v135 = objc_opt_class();
    objc_msgSend(v133, "setWithObjects:", v134, v135, objc_opt_class(), 0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setClasses:forSelector:argumentIndex:ofReply:", v136, sel_getQueryItemForBRFileObjectID_reply_, 0, 1);

    v137 = (void *)objc_opt_new();
    objc_msgSend(v137, "setProtocol:", &unk_1EE4573C0);
    objc_msgSend((id)BRCXPCInterface_iface, "setInterface:forSelector:argumentIndex:ofReply:", v137, sel_validateConnectionDomainWithDomainIdentifier_databaseID_backChannel_reply_, 2, 0);
  }
  else
  {
    v137 = (void *)objc_opt_new();
    objc_msgSend(v137, "setProtocol:", &unk_1EE43C2C8);
    objc_msgSend((id)BRCXPCInterface_iface, "setInterface:forSelector:argumentIndex:ofReply:", v137, sel_getPausedFilesList_reply_, 0, 0);
    v138 = (void *)BRCXPCInterface_iface;
    v139 = (void *)MEMORY[0x1E0C99E60];
    v140 = objc_opt_class();
    v141 = objc_opt_class();
    objc_msgSend(v139, "setWithObjects:", v140, v141, objc_opt_class(), 0);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setClasses:forSelector:argumentIndex:ofReply:", v142, sel_getBackReferencingContainerIDsForURLs_reply_, 0, 0);

    v157 = (void *)BRCXPCInterface_iface;
    v143 = (void *)MEMORY[0x1E0C99E60];
    v144 = objc_opt_class();
    v145 = objc_opt_class();
    v146 = objc_opt_class();
    v147 = objc_opt_class();
    v148 = objc_opt_class();
    objc_msgSend(v143, "setWithObjects:", v144, v145, v146, v147, v148, objc_opt_class(), 0);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "setClasses:forSelector:argumentIndex:ofReply:", v149, sel_getBackReferencingContainerIDsForURLs_reply_, 0, 1);

    v150 = (void *)BRCXPCInterface_iface;
    v151 = (void *)MEMORY[0x1E0C99E60];
    v152 = objc_opt_class();
    objc_msgSend(v151, "setWithObjects:", v152, objc_opt_class(), 0);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setClasses:forSelector:argumentIndex:ofReply:", v153, sel_startDownloadItemsAtURLs_options_reply_, 0, 0);

    v154 = (void *)objc_opt_new();
    objc_msgSend(v154, "setProtocol:", &unk_1EE438DA0);
    objc_msgSend((id)BRCXPCInterface_iface, "setInterface:forSelector:argumentIndex:ofReply:", v154, sel_getNonLocalVersionSenderWithReceiver_documentURL_includeCachedVersions_reply_, 0, 0);
    v155 = (void *)objc_opt_new();
    objc_msgSend(v155, "setProtocol:", &unk_1EE457420);
    objc_msgSend((id)BRCXPCInterface_iface, "setInterface:forSelector:argumentIndex:ofReply:", v155, sel_getNonLocalVersionSenderWithReceiver_documentURL_includeCachedVersions_reply_, 0, 1);

  }
}

@end
