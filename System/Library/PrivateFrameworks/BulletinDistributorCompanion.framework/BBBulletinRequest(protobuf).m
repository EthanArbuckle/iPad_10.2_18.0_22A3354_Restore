@implementation BBBulletinRequest(protobuf)

+ (id)bulletinRequestFromProtobuf:()protobuf
{
  id v4;
  id v5;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
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
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  NSObject *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  id v116;
  NSObject *v117;
  id v118;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  id v132;
  _QWORD v133[4];
  NSObject *v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t v140[128];
  uint8_t buf[4];
  id v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  id v146;
  __int16 v147;
  id v148;
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE0FE30]);
  objc_msgSend(v4, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionID:", v6);

  objc_msgSend(v4, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordID:", v7);

  objc_msgSend(v4, "publisherBulletinID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPublisherBulletinID:", v8);

  objc_msgSend(v5, "setSectionSubtype:", (int)objc_msgSend(v4, "sectionSubtype"));
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v9);

  objc_msgSend(v4, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v10);

  objc_msgSend(v4, "messageTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v11);

  objc_msgSend(v5, "setLoading:", objc_msgSend(v4, "loading"));
  objc_msgSend(v5, "setTurnsOnDisplay:", objc_msgSend(v4, "turnsOnDisplay"));
  objc_msgSend(v4, "dismissalID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissalID:", v12);

  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "subsectionIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubsectionIDs:", v15);

  objc_msgSend(v4, "peopleIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPeopleIDs:", v16);

  objc_msgSend(v5, "setIgnoresQuietMode:", objc_msgSend(v4, "ignoresQuietMode"));
  objc_msgSend(v4, "categoryID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategoryID:", v17);

  objc_msgSend(v4, "threadID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThreadID:", v18);

  objc_msgSend(v5, "setPreemptsPresentedAlert:", objc_msgSend(v4, "preemptsPresentedAlert"));
  if (objc_msgSend(v4, "suppressDelayForForwardedBulletins"))
    objc_msgSend(v5, "setContextValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("BLTSuppressDelayForForwardedBulletinsKey"));
  objc_msgSend(v4, "icon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "icon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    BBSectionIconFromBLTPBSectionIcon(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIcon:", v21);

  }
  if (objc_msgSend(v4, "hasDate"))
  {
    v22 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "date");
    objc_msgSend(v22, "dateWithTimeIntervalSince1970:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:", v23);

  }
  objc_msgSend(v5, "setDateFormatStyle:", 1);
  objc_msgSend(v4, "sockPuppetAppBundleID");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v5, "setContextValue:forKey:", v24, CFSTR("BLTSockPuppetAppIdentifierKey"));
  v122 = (void *)v24;
  if (objc_msgSend(v4, "hasRequiredExpirationDate"))
  {
    v25 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "requiredExpirationDate");
    objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExpirationDate:", v26);

  }
  objc_msgSend(MEMORY[0x24BE0FE18], "action");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAcknowledgeAction:", v27);

  objc_msgSend(v4, "snoozeAction");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(MEMORY[0x24BE0FE18], "action");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSnoozeAction:", v29);

  }
  objc_msgSend(MEMORY[0x24BE0FE18], "action");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v5;
  objc_msgSend(v5, "setDismissAction:", v30);

  if (objc_msgSend(v4, "hasAttachmentType"))
  {
    v31 = objc_alloc_init(MEMORY[0x24BE0FE58]);
    objc_msgSend(v31, "setType:", objc_msgSend(v4, "attachmentType"));
    objc_msgSend(v4, "attachmentURLURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setURL:", v32);

    objc_msgSend(v123, "setPrimaryAttachment:", v31);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  objc_msgSend(v4, "additionalAttachments");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v137;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v137 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
        if (objc_msgSend(v39, "hasURL"))
        {
          v40 = objc_alloc_init(MEMORY[0x24BE0FE58]);
          objc_msgSend(v40, "setType:", objc_msgSend(v39, "type"));
          objc_msgSend(v39, "attachmentURLURL");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setURL:", v41);

          objc_msgSend(v33, "addObject:", v40);
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
    }
    while (v36);
  }

  v42 = v123;
  if (objc_msgSend(v33, "count"))
    objc_msgSend(v123, "setAdditionalAttachments:", v33);
  objc_msgSend(v4, "context");
  v43 = objc_claimAutoreleasedReturnValue();
  v121 = (void *)v43;
  if (v43)
  {
    v44 = v43;
    v45 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(a1, "plistTypes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = 0;
    objc_msgSend(v45, "unarchivedObjectOfClasses:fromData:error:", v46, v44, &v135);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v135;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || v48)
    {
      blt_general_log();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v120 = (id)objc_opt_class();
        *(_DWORD *)buf = 138413058;
        v142 = v4;
        v143 = 2112;
        v144 = v47;
        v145 = 2112;
        v146 = v120;
        v147 = 2112;
        v148 = v48;
        _os_log_error_impl(&dword_2173D9000, v49, OS_LOG_TYPE_ERROR, "Bulletin %@ failed to unarchive context dictionary, dict=%@ dictClass=%@ error=%@", buf, 0x2Au);

      }
    }
    else
    {
      v133[0] = MEMORY[0x24BDAC760];
      v133[1] = 3221225472;
      v133[2] = __59__BBBulletinRequest_protobuf__bulletinRequestFromProtobuf___block_invoke;
      v133[3] = &unk_24D762798;
      v134 = v123;
      objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v133);
      v49 = v134;
    }

  }
  objc_msgSend(v4, "alertSuppressionContexts");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v4, "alertSuppressionContexts");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertSuppressionContextsNulls");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = 0;
    +[BLTObjectSerializer unserializeObject:nulls:error:](BLTObjectSerializer, "unserializeObject:nulls:error:", v51, v52, &v132);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v132;

    if (!v54)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "setAlertSuppressionContexts:", v55);

    }
  }
  if (objc_msgSend(v4, "includesSound"))
  {
    if (objc_msgSend(v4, "soundAlertType"))
    {
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB8CA8]), "initWithType:", (int)objc_msgSend(v4, "soundAlertType"));
      objc_msgSend(v4, "soundAccountIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        objc_msgSend(v4, "soundAccountIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setTopic:", v58);

      }
      objc_msgSend(v4, "soundToneIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        objc_msgSend(v4, "soundToneIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setToneIdentifier:", v60);

      }
      if (objc_msgSend(v4, "hasSoundShouldRepeat"))
        objc_msgSend(v56, "setShouldRepeat:", objc_msgSend(v4, "soundShouldRepeat"));
      if (objc_msgSend(v4, "hasSoundShouldIgnoreRingerSwitch"))
        objc_msgSend(v56, "setShouldIgnoreRingerSwitch:", objc_msgSend(v4, "soundShouldIgnoreRingerSwitch"));
      if (objc_msgSend(v4, "hasSoundMaximumDuration"))
      {
        objc_msgSend(v4, "soundMaximumDuration");
        objc_msgSend(v56, "setMaximumDuration:");
      }
      if (objc_msgSend(v4, "hasSoundAudioVolume"))
      {
        objc_msgSend(v4, "soundAudioVolume");
        *(float *)&v61 = v61;
        objc_msgSend(v56, "setAudioVolume:", v61);
      }
      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FEA0]), "initWithToneAlertConfiguration:", v56);

    }
    else
    {
      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FEA0]), "initWithToneAlert:", 17);
    }
    v42 = v123;
    objc_msgSend(v123, "setSound:", v62);

  }
  v63 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "supplementaryActions");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "arrayWithCapacity:", objc_msgSend(v64, "count"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  objc_msgSend(v4, "supplementaryActions");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v129;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v129 != v69)
          objc_enumerationMutation(v66);
        objc_msgSend(a1, "_actionFromBLTPBAction:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addObject:", v71);

      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
    }
    while (v68);
  }

  objc_msgSend(v42, "setSupplementaryActions:", v65);
  objc_msgSend(v4, "categoryID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(v4, "categoryID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setContextValue:forKey:", v73, CFSTR("category"));

  }
  objc_msgSend(v4, "teamID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v4, "teamID");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setContextValue:forKey:", v75, CFSTR("teamID"));

  }
  if (objc_msgSend(v4, "hasHasCriticalIcon"))
    objc_msgSend(v42, "setHasCriticalIcon:", objc_msgSend(v4, "hasCriticalIcon"));
  if (objc_msgSend(v4, "hasHeader"))
  {
    objc_msgSend(v4, "header");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setHeader:", v76);

  }
  if (objc_msgSend(v4, "hasContentType"))
  {
    objc_msgSend(v4, "contentType");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setContentType:", v77);

  }
  if (objc_msgSend(v4, "hasInterruptionLevel"))
    objc_msgSend(v42, "setInterruptionLevel:", objc_msgSend(v4, "interruptionLevel"));
  if (objc_msgSend(v4, "hasCommunicationContext"))
  {
    v78 = (void *)MEMORY[0x24BE0FE38];
    objc_msgSend(v4, "communicationContext");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "communicationContextFromProtobuf:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCommunicationContext:", v80);

  }
  if (objc_msgSend(v4, "hasFilterCriteria"))
  {
    objc_msgSend(v4, "filterCriteria");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFilterCriteria:", v81);

  }
  if (objc_msgSend(v4, "hasFollowActivityAction"))
  {
    v82 = (void *)MEMORY[0x24BE0FE18];
    objc_msgSend(v4, "followActivityAction");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "identifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "followActivityAction");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "appearance");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "title");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "actionWithIdentifier:title:", v84, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v123;
    objc_msgSend(v4, "followActivityAction");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setActivationMode:", (int)objc_msgSend(v89, "activationMode"));

    objc_msgSend(v123, "setFollowActivityAction:", v88);
  }
  if (objc_msgSend(v4, "hasSubordinateIcon"))
    objc_msgSend(v42, "setHasSubordinateIcon:", objc_msgSend(v4, "hasSubordinateIcon"));
  if (objc_msgSend(v4, "hasSummary"))
  {
    v90 = (void *)MEMORY[0x24BDD1620];
    v91 = objc_opt_class();
    objc_msgSend(v4, "summary");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = 0;
    v93 = v91;
    v42 = v123;
    objc_msgSend(v90, "unarchivedObjectOfClass:fromData:error:", v93, v92, &v127);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v127;

    if (v95)
    {
      blt_general_log();
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:].cold.4();

    }
    objc_msgSend(v123, "setSummary:", v94);

  }
  if (objc_msgSend(v4, "hasThreadSummary"))
  {
    v97 = (void *)MEMORY[0x24BDD1620];
    v98 = objc_opt_class();
    objc_msgSend(v4, "threadSummary");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = 0;
    v100 = v98;
    v42 = v123;
    objc_msgSend(v97, "unarchivedObjectOfClass:fromData:error:", v100, v99, &v126);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v126;

    if (v102)
    {
      blt_general_log();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:].cold.3();

    }
    objc_msgSend(v123, "setThreadSummary:", v101);

  }
  if (objc_msgSend(v4, "hasAttributedMessage"))
  {
    v104 = (void *)MEMORY[0x24BDD1620];
    v105 = objc_opt_class();
    objc_msgSend(v4, "attributedMessage");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0;
    v107 = v105;
    v42 = v123;
    objc_msgSend(v104, "unarchivedObjectOfClass:fromData:error:", v107, v106, &v125);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v125;

    if (v109)
    {
      blt_general_log();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:].cold.2();

    }
    objc_msgSend(v123, "setAttributedMessage:", v108);

  }
  if (objc_msgSend(v4, "hasEventBehavior"))
  {
    v111 = (void *)MEMORY[0x24BDD1620];
    v112 = objc_opt_class();
    objc_msgSend(v4, "eventBehavior");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0;
    v114 = v112;
    v42 = v123;
    objc_msgSend(v111, "unarchivedObjectOfClass:fromData:error:", v114, v113, &v124);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v124;

    if (v116)
    {
      blt_general_log();
      v117 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:].cold.1();

    }
    objc_msgSend(v123, "setEventBehavior:", v115);

  }
  v118 = v42;

  return v118;
}

- (uint64_t)blt_protobuf
{
  return 0;
}

+ (id)_actionFromBLTPBAction:()protobuf
{
  id v3;
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
  uint64_t v18;
  uint64_t v20;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE0FE18], "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);

    objc_msgSend(v4, "setActivationMode:", (int)objc_msgSend(v3, "activationMode"));
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "launchURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLaunchURL:", v8);

    objc_msgSend(v3, "appearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v9, "destructive");

    v10 = (void *)MEMORY[0x24BE0FE20];
    objc_msgSend(v3, "appearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appearanceWithTitle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setStyle:", v7);
    objc_msgSend(v4, "setAppearance:", v13);
    objc_msgSend(v4, "setBehavior:", (int)objc_msgSend(v3, "behavior"));
    objc_msgSend(v3, "behaviorParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "behaviorParameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "behaviorParametersNulls");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      +[BLTObjectSerializer unserializeObject:nulls:error:](BLTObjectSerializer, "unserializeObject:nulls:error:", v15, v16, &v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;

      if (!v18)
        objc_msgSend(v4, "setBehaviorParameters:", v17);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (uint64_t)plistTypes
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "Error decoding eventBehavior: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "Error decoding attributedMessage: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "Error decoding threadSummary attributed string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "Error decoding summary attributed string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
