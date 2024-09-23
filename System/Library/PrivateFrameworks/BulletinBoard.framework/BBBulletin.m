@implementation BBBulletin

+ (id)validSortDescriptorsFromSortDescriptors:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        +[BBBulletin vetSortDescriptor:](BBBulletin, "vetSortDescriptor:", v9);
        objc_msgSend(v9, "allowEvaluation");
        objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

+ (void)vetSortDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = v3;
  if (vetSortDescriptor__onceToken != -1)
  {
    dispatch_once(&vetSortDescriptor__onceToken, &__block_literal_global);
    v3 = v10;
  }
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)vetSortDescriptor__sKeyAllowedList, "containsObject:", v4) & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid sort descriptor key passed from BBDataProvider: %@; Only the following keys may be used: %@"),
      v4,
      vetSortDescriptor__sKeyAllowedList);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = CFSTR("sortDescriptor");
    v11[1] = CFSTR("offendingKey");
    v12[0] = v10;
    v12[1] = v4;
    v11[2] = CFSTR("allowedKeys");
    v12[2] = vetSortDescriptor__sKeyAllowedList;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v9);
  }

}

void __32__BBBulletin_vetSortDescriptor___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24C583548);
  v1 = (void *)vetSortDescriptor__sKeyAllowedList;
  vetSortDescriptor__sKeyAllowedList = v0;

}

+ (id)bulletinWithBulletin:(id)a3
{
  id v3;
  BBBulletin *v4;

  v3 = a3;
  v4 = objc_alloc_init(BBBulletin);
  objc_msgSend(v3, "_fillOutCopy:withZone:", v4, MEMORY[0x212B94564]());

  return v4;
}

+ (id)bulletinReferenceDateFromDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDBCE68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDay:", -7);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BBBulletin)init
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BBBulletin;
  v2 = -[BBBulletin init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)*((_QWORD *)v2 + 36);
    *((_QWORD *)v2 + 36) = v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = (void *)*((_QWORD *)v2 + 37);
    *((_QWORD *)v2 + 37) = v5;

    *(_WORD *)(v2 + 13) = 257;
    *((_OWORD *)v2 + 8) = xmmword_20CD37F10;
    *((_DWORD *)v2 + 7) = 0;
  }
  return (BBBulletin *)v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "bulletinID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEBUG, "Deallocating %@", (uint8_t *)&v5, 0xCu);

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  int64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  unint64_t v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
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
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;

  -[BBBulletin bulletinID](self, "bulletinID");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v124, "hash");
  -[BBBulletin bulletinVersionID](self, "bulletinVersionID");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v123, "hash") ^ v3;
  -[BBBulletin sectionID](self, "sectionID");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v122, "hash");
  -[BBBulletin sectionBundlePath](self, "sectionBundlePath");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v121, "hash");
  -[BBBulletin universalSectionID](self, "universalSectionID");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v120, "hash");
  -[BBBulletin parentSectionID](self, "parentSectionID");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v119, "hash");
  -[BBBulletin subsectionIDs](self, "subsectionIDs");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v118, "hash");
  -[BBBulletin recordID](self, "recordID");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v117, "hash");
  -[BBBulletin publisherBulletinID](self, "publisherBulletinID");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v116, "hash");
  -[BBBulletin dismissalID](self, "dismissalID");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v115, "hash");
  -[BBBulletin categoryID](self, "categoryID");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v12 ^ objc_msgSend(v114, "hash");
  -[BBBulletin threadID](self, "threadID");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v113, "hash");
  -[BBBulletin eventBehavior](self, "eventBehavior");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v112, "hash");
  v16 = v15 ^ -[BBBulletin isHighlight](self, "isHighlight");
  v17 = v16 ^ -[BBBulletin sectionSubtype](self, "sectionSubtype");
  -[BBBulletin intentIDs](self, "intentIDs");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13 ^ v17 ^ objc_msgSend(v111, "hash");
  v19 = -[BBBulletin counter](self, "counter");
  v20 = v19 ^ -[BBBulletin interruptionLevel](self, "interruptionLevel");
  v21 = v20 ^ -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting");
  -[BBBulletin content](self, "content");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 ^ objc_msgSend(v110, "hash");
  -[BBBulletin communicationContext](self, "communicationContext");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 ^ objc_msgSend(v109, "hash");
  -[BBBulletin modalAlertContent](self, "modalAlertContent");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 ^ objc_msgSend(v108, "hash");
  -[BBBulletin starkBannerContent](self, "starkBannerContent");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18 ^ v24 ^ objc_msgSend(v107, "hash");
  -[BBBulletin summaryArgument](self, "summaryArgument");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v106, "hash");
  v27 = v26 ^ -[BBBulletin summaryArgumentCount](self, "summaryArgumentCount");
  -[BBBulletin icon](self, "icon");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 ^ objc_msgSend(v105, "hash");
  v29 = v28 ^ -[BBBulletin hasCriticalIcon](self, "hasCriticalIcon");
  v30 = v29 ^ -[BBBulletin hasSubordinateIcon](self, "hasSubordinateIcon");
  v31 = v30 ^ -[BBBulletin hasEventDate](self, "hasEventDate");
  -[BBBulletin date](self, "date");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v25 ^ v31 ^ objc_msgSend(v104, "hash");
  -[BBBulletin endDate](self, "endDate");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v103, "hash");
  -[BBBulletin recencyDate](self, "recencyDate");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 ^ objc_msgSend(v102, "hash");
  v35 = v34 ^ -[BBBulletin dateFormatStyle](self, "dateFormatStyle");
  v36 = v35 ^ -[BBBulletin dateIsAllDay](self, "dateIsAllDay");
  -[BBBulletin timeZone](self, "timeZone");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 ^ objc_msgSend(v101, "hash");
  -[BBBulletin accessoryIconMask](self, "accessoryIconMask");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 ^ objc_msgSend(v100, "hash");
  -[BBBulletin accessoryImage](self, "accessoryImage");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 ^ objc_msgSend(v99, "hash");
  v40 = v32 ^ v39 ^ -[BBBulletin clearable](self, "clearable");
  -[BBBulletin sound](self, "sound");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v98, "hash");
  v42 = v41 ^ -[BBBulletin turnsOnDisplay](self, "turnsOnDisplay");
  -[BBBulletin primaryAttachment](self, "primaryAttachment");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42 ^ objc_msgSend(v97, "hash");
  -[BBBulletin additionalAttachments](self, "additionalAttachments");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 ^ objc_msgSend(v96, "hash");
  -[BBBulletin unlockActionLabelOverride](self, "unlockActionLabelOverride");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 ^ objc_msgSend(v95, "hash");
  v46 = v45 ^ -[BBBulletin wantsFullscreenPresentation](self, "wantsFullscreenPresentation");
  v47 = v46 ^ -[BBBulletin ignoresQuietMode](self, "ignoresQuietMode");
  v48 = v40 ^ v47 ^ -[BBBulletin ignoresDowntime](self, "ignoresDowntime");
  v49 = -[BBBulletin preemptsPresentedAlert](self, "preemptsPresentedAlert");
  v50 = v49 ^ -[BBBulletin displaysActionsInline](self, "displaysActionsInline");
  -[BBBulletin actions](self, "actions");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50 ^ objc_msgSend(v94, "hash");
  -[BBBulletin buttons](self, "buttons");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 ^ objc_msgSend(v93, "hash");
  -[BBBulletin supplementaryActionsByLayout](self, "supplementaryActionsByLayout");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52 ^ objc_msgSend(v92, "hash");
  -[BBBulletin alertSuppressionContexts](self, "alertSuppressionContexts");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53 ^ objc_msgSend(v90, "hash");
  -[BBBulletin context](self, "context");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54 ^ objc_msgSend(v89, "hash");
  -[BBBulletin expirationDate](self, "expirationDate");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 ^ objc_msgSend(v88, "hash");
  v57 = v48 ^ v56 ^ -[BBBulletin expirationEvents](self, "expirationEvents");
  -[BBBulletin lastInterruptDate](self, "lastInterruptDate");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v87, "hash");
  -[BBBulletin publicationDate](self, "publicationDate");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58 ^ objc_msgSend(v86, "hash");
  v60 = v59 ^ -[BBBulletin usesExternalSync](self, "usesExternalSync");
  v61 = v60 ^ -[BBBulletin isLoading](self, "isLoading");
  v62 = v61 ^ -[BBBulletin preventAutomaticRemovalFromLockScreen](self, "preventAutomaticRemovalFromLockScreen");
  v63 = v62 ^ -[BBBulletin lockScreenPriority](self, "lockScreenPriority");
  v64 = v63 ^ -[BBBulletin backgroundStyle](self, "backgroundStyle");
  -[BBBulletin header](self, "header");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v64 ^ objc_msgSend(v65, "hash");
  -[BBBulletin footer](self, "footer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v66 ^ objc_msgSend(v67, "hash");
  -[BBBulletin threadSummary](self, "threadSummary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v68 ^ objc_msgSend(v69, "hash");
  -[BBBulletin spotlightIdentifier](self, "spotlightIdentifier");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v57 ^ v70 ^ objc_msgSend(v71, "hash");
  v72 = -[BBBulletin realertCount](self, "realertCount");
  -[BBBulletin alertSuppressionAppIDs_deprecated](self, "alertSuppressionAppIDs_deprecated");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v72 ^ objc_msgSend(v73, "hash");
  -[BBBulletin contentType](self, "contentType");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v74 ^ objc_msgSend(v75, "hash");
  v77 = v76 ^ -[BBBulletin screenCaptureProhibited](self, "screenCaptureProhibited");
  v78 = (void *)MEMORY[0x24BDD16E0];
  -[BBBulletin relevanceScore](self, "relevanceScore");
  objc_msgSend(v78, "numberWithFloat:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v77 ^ objc_msgSend(v79, "hash");
  -[BBBulletin filterCriteria](self, "filterCriteria");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v80 ^ objc_msgSend(v81, "hash");

  -[BBBulletin speechLanguage](self, "speechLanguage");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v91 ^ v82 ^ objc_msgSend(v83, "hash");

  return v84;
}

- (BOOL)isEqual:(id)a3
{
  BBBulletin *v4;
  BBBulletin *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BBBulletin *v21;
  _BOOL4 v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char v28;
  int v29;
  int v30;
  int v31;
  int v32;
  BBBulletin *v33;
  BBBulletin *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  BBBulletin *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  _BOOL4 v61;
  _BOOL4 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  _BOOL4 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _BOOL4 v71;
  uint64_t v72;
  _BOOL4 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL4 v77;
  _BOOL4 v78;
  _BOOL4 v79;
  _BOOL4 v80;
  _BOOL4 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BOOL4 v91;
  _BOOL4 v92;
  _BOOL4 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _BOOL4 v103;
  float v104;
  float v105;
  float v106;
  uint64_t v107;
  uint64_t v108;
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
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  void *v197;
  void *v198;
  int v199;
  int v200;
  int v201;
  uint64_t v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  _BYTE v211[12];
  uint64_t v212;
  __int128 v213;
  uint64_t v214;
  uint64_t v215;
  _BYTE v216[20];
  BBBulletin *v217;
  __int128 v218;
  int v219;
  id v220;
  id v221;

  v4 = (BBBulletin *)a3;
  if (self == v4)
  {
    v28 = 1;
    goto LABEL_118;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v28 = 0;
    goto LABEL_118;
  }
  v5 = v4;
  -[BBBulletin bulletinID](self, "bulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin bulletinID](v5, "bulletinID");
  v220 = (id)objc_claimAutoreleasedReturnValue();
  v221 = v6;
  v7 = BSEqualObjects();
  v219 = v7;
  if (!v7
    || (-[BBBulletin bulletinVersionID](self, "bulletinVersionID"),
        v9 = objc_claimAutoreleasedReturnValue(),
        -[BBBulletin bulletinVersionID](v5, "bulletinVersionID"),
        v198 = (void *)v9,
        v197 = (void *)objc_claimAutoreleasedReturnValue(),
        (v7 = BSEqualObjects()) == 0))
  {
    v218 = 0uLL;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_22;
  }
  -[BBBulletin sectionID](self, "sectionID");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin sectionID](v5, "sectionID");
  v195 = (void *)v10;
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_QWORD *)((char *)&v218 + 4) = 0;
    LODWORD(v218) = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    HIDWORD(v218) = 1;
    goto LABEL_22;
  }
  -[BBBulletin sectionBundlePath](self, "sectionBundlePath");
  v11 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin sectionBundlePath](v5, "sectionBundlePath");
  v193 = (void *)v11;
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_QWORD *)&v218 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    goto LABEL_22;
  }
  -[BBBulletin universalSectionID](self, "universalSectionID");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin universalSectionID](v5, "universalSectionID");
  v191 = (void *)v12;
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_QWORD *)&v218 = 0x100000000;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    goto LABEL_22;
  }
  -[BBBulletin parentSectionID](self, "parentSectionID");
  v13 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin parentSectionID](v5, "parentSectionID");
  v189 = (void *)v13;
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    goto LABEL_22;
  }
  -[BBBulletin subsectionIDs](self, "subsectionIDs");
  v14 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin subsectionIDs](v5, "subsectionIDs");
  v187 = (void *)v14;
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    v30 = 0;
    v31 = 0;
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    goto LABEL_22;
  }
  -[BBBulletin recordID](self, "recordID");
  v15 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin recordID](v5, "recordID");
  v185 = (void *)v15;
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    v31 = 0;
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    goto LABEL_22;
  }
  -[BBBulletin publisherBulletinID](self, "publisherBulletinID");
  v16 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin publisherBulletinID](v5, "publisherBulletinID");
  v183 = (void *)v16;
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    memset(v216, 0, sizeof(v216));
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    goto LABEL_22;
  }
  -[BBBulletin dismissalID](self, "dismissalID");
  v17 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin dismissalID](v5, "dismissalID");
  v181 = (void *)v17;
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_QWORD *)&v216[4] = 0;
    *(_DWORD *)v216 = 0;
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[12] = 1;
    goto LABEL_22;
  }
  -[BBBulletin categoryID](self, "categoryID");
  v18 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin categoryID](v5, "categoryID");
  v179 = (void *)v18;
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_QWORD *)v216 = 0;
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    goto LABEL_22;
  }
  -[BBBulletin threadID](self, "threadID");
  v19 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin threadID](v5, "threadID");
  v177 = (void *)v19;
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_QWORD *)v216 = 0x100000000;
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v32 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[12] = 1;
    *(_DWORD *)&v216[8] = 1;
    goto LABEL_22;
  }
  v217 = self;
  -[BBBulletin eventBehavior](self, "eventBehavior");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v5;
  -[BBBulletin eventBehavior](v5, "eventBehavior");
  v175 = (void *)v20;
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_130;
  }
  v22 = -[BBBulletin isHighlight](self, "isHighlight");
  if (v22 != -[BBBulletin isHighlight](v5, "isHighlight"))
  {
    v214 = 0;
    memset(v211, 0, sizeof(v211));
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
LABEL_130:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
LABEL_131:
    v5 = v21;
    v32 = 0;
LABEL_132:
    self = v217;
    goto LABEL_22;
  }
  -[BBBulletin peopleIDs](self, "peopleIDs");
  v47 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin peopleIDs](v5, "peopleIDs");
  v173 = (void *)v47;
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();
  if (!v7)
  {
    memset(v211, 0, sizeof(v211));
    LODWORD(v214) = 0;
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
LABEL_152:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    HIDWORD(v214) = 1;
    goto LABEL_131;
  }
  v48 = -[BBBulletin sectionSubtype](self, "sectionSubtype");
  if (v48 != -[BBBulletin sectionSubtype](v5, "sectionSubtype"))
  {
    memset(v211, 0, sizeof(v211));
    LODWORD(v214) = 0;
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
    goto LABEL_152;
  }
  -[BBBulletin intentIDs](self, "intentIDs");
  v49 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin intentIDs](v5, "intentIDs");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = (void *)v49;
  v7 = BSEqualObjects();
  if (!v7)
  {
    LODWORD(v214) = 0;
    *(_QWORD *)&v211[4] = 0;
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
LABEL_155:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    HIDWORD(v214) = 1;
    *(_DWORD *)v211 = 1;
    goto LABEL_131;
  }
  v50 = -[BBBulletin counter](self, "counter");
  if (v50 != -[BBBulletin counter](v5, "counter")
    || (v51 = -[BBBulletin interruptionLevel](self, "interruptionLevel"),
        v51 != -[BBBulletin interruptionLevel](v5, "interruptionLevel"))
    || (v52 = -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting"),
        v52 != -[BBBulletin contentPreviewSetting](v5, "contentPreviewSetting")))
  {
    LODWORD(v214) = 0;
    *(_QWORD *)&v211[4] = 0;
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
    goto LABEL_155;
  }
  -[BBBulletin content](self, "content");
  v53 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin content](v5, "content");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = (void *)v53;
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_QWORD *)&v211[4] = 0;
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    *(_DWORD *)v211 = 1;
    v214 = 0x100000001;
    goto LABEL_131;
  }
  -[BBBulletin modalAlertContent](self, "modalAlertContent");
  v54 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin modalAlertContent](v5, "modalAlertContent");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = (void *)v54;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 1;
    *(_DWORD *)&v211[8] = 1;
    goto LABEL_131;
  }
  -[BBBulletin starkBannerContent](self, "starkBannerContent");
  v55 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin starkBannerContent](v5, "starkBannerContent");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = (void *)v55;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v210 = 0;
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    goto LABEL_131;
  }
  -[BBBulletin communicationContext](self, "communicationContext");
  v56 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin communicationContext](v5, "communicationContext");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = (void *)v56;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v203 = 0;
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    goto LABEL_131;
  }
  -[BBBulletin summaryArgument](self, "summaryArgument");
  v57 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin summaryArgument](v5, "summaryArgument");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = (void *)v57;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
LABEL_162:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    goto LABEL_131;
  }
  v58 = -[BBBulletin summaryArgumentCount](self, "summaryArgumentCount");
  if (v58 != -[BBBulletin summaryArgumentCount](v5, "summaryArgumentCount"))
  {
    v200 = 0;
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
    goto LABEL_162;
  }
  -[BBBulletin icon](self, "icon");
  v59 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin icon](v5, "icon");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = (void *)v59;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_164;
  }
  v60 = -[BBBulletin hasCriticalIcon](self, "hasCriticalIcon");
  if (v60 != -[BBBulletin hasCriticalIcon](v5, "hasCriticalIcon")
    || (v61 = -[BBBulletin hasSubordinateIcon](self, "hasSubordinateIcon"),
        v61 != -[BBBulletin hasSubordinateIcon](v5, "hasSubordinateIcon"))
    || (v62 = -[BBBulletin hasEventDate](self, "hasEventDate"), v62 != -[BBBulletin hasEventDate](v5, "hasEventDate")))
  {
    v209 = 0;
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
LABEL_164:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    goto LABEL_131;
  }
  -[BBBulletin date](self, "date");
  v63 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin date](v5, "date");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = (void *)v63;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v207 = 0;
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    goto LABEL_131;
  }
  -[BBBulletin endDate](self, "endDate");
  v64 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin endDate](v5, "endDate");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = (void *)v64;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v201 = 0;
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    goto LABEL_131;
  }
  -[BBBulletin recencyDate](self, "recencyDate");
  v65 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin recencyDate](v21, "recencyDate");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = (void *)v65;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_174;
  }
  v66 = -[BBBulletin dateFormatStyle](self, "dateFormatStyle");
  if (v66 != -[BBBulletin dateFormatStyle](v21, "dateFormatStyle")
    || (v67 = -[BBBulletin dateIsAllDay](self, "dateIsAllDay"), v67 != -[BBBulletin dateIsAllDay](v21, "dateIsAllDay")))
  {
    v208 = 0;
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
LABEL_174:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    goto LABEL_131;
  }
  -[BBBulletin timeZone](self, "timeZone");
  v68 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin timeZone](v21, "timeZone");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = (void *)v68;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v205 = 0;
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    goto LABEL_131;
  }
  -[BBBulletin accessoryIconMask](v217, "accessoryIconMask");
  v69 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin accessoryIconMask](v21, "accessoryIconMask");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = (void *)v69;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v202 = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    goto LABEL_131;
  }
  -[BBBulletin accessoryImage](v217, "accessoryImage");
  v70 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin accessoryImage](v21, "accessoryImage");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = (void *)v70;
  v7 = BSEqualObjects();
  if (!v7)
  {
    HIDWORD(v202) = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_183;
  }
  v71 = -[BBBulletin clearable](v217, "clearable");
  if (v71 != -[BBBulletin clearable](v21, "clearable"))
  {
    HIDWORD(v202) = 0;
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
LABEL_183:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    LODWORD(v202) = 1;
    goto LABEL_131;
  }
  -[BBBulletin sound](v217, "sound");
  v72 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin sound](v21, "sound");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = (void *)v72;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_188;
  }
  v73 = -[BBBulletin turnsOnDisplay](v217, "turnsOnDisplay");
  if (v73 != -[BBBulletin turnsOnDisplay](v21, "turnsOnDisplay"))
  {
    v206 = 0;
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
LABEL_188:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    goto LABEL_131;
  }
  -[BBBulletin primaryAttachment](v217, "primaryAttachment");
  v74 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin primaryAttachment](v21, "primaryAttachment");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)v74;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v204 = 0;
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    goto LABEL_131;
  }
  -[BBBulletin additionalAttachments](v217, "additionalAttachments");
  v75 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin additionalAttachments](v21, "additionalAttachments");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (void *)v75;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v199 = 0;
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    goto LABEL_131;
  }
  -[BBBulletin unlockActionLabelOverride](v217, "unlockActionLabelOverride");
  v76 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin unlockActionLabelOverride](v21, "unlockActionLabelOverride");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = (void *)v76;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_201;
  }
  v77 = -[BBBulletin wantsFullscreenPresentation](v217, "wantsFullscreenPresentation");
  if (v77 != -[BBBulletin wantsFullscreenPresentation](v21, "wantsFullscreenPresentation")
    || (v78 = -[BBBulletin ignoresQuietMode](v217, "ignoresQuietMode"),
        v78 != -[BBBulletin ignoresQuietMode](v21, "ignoresQuietMode"))
    || (v79 = -[BBBulletin ignoresDowntime](v217, "ignoresDowntime"),
        v79 != -[BBBulletin ignoresDowntime](v21, "ignoresDowntime"))
    || (v80 = -[BBBulletin preemptsPresentedAlert](v217, "preemptsPresentedAlert"),
        v80 != -[BBBulletin preemptsPresentedAlert](v21, "preemptsPresentedAlert"))
    || (v81 = -[BBBulletin displaysActionsInline](v217, "displaysActionsInline"),
        v81 != -[BBBulletin displaysActionsInline](v21, "displaysActionsInline")))
  {
    v212 = 0;
    v213 = 0uLL;
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
LABEL_201:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    goto LABEL_131;
  }
  -[BBBulletin actions](v217, "actions");
  v82 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin actions](v21, "actions");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (void *)v82;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v212 = 0x100000000;
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    goto LABEL_131;
  }
  -[BBBulletin buttons](v217, "buttons");
  v83 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin buttons](v21, "buttons");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = (void *)v83;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v213 = 0uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    goto LABEL_131;
  }
  -[BBBulletin supplementaryActionsByLayout](v217, "supplementaryActionsByLayout");
  v84 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin supplementaryActionsByLayout](v21, "supplementaryActionsByLayout");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (void *)v84;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v213 = 1uLL;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    goto LABEL_131;
  }
  -[BBBulletin alertSuppressionContexts](v217, "alertSuppressionContexts");
  v85 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin alertSuppressionContexts](v21, "alertSuppressionContexts");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (void *)v85;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    v213 = 0x100000001uLL;
    goto LABEL_131;
  }
  -[BBBulletin context](v217, "context");
  v86 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin context](v21, "context");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = (void *)v86;
  v7 = BSEqualObjects();
  if (!v7)
  {
    *((_QWORD *)&v213 + 1) = 0x100000000;
    v215 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    goto LABEL_131;
  }
  -[BBBulletin expirationDate](v217, "expirationDate");
  v87 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin expirationDate](v21, "expirationDate");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)v87;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
LABEL_233:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    LODWORD(v213) = 1;
    *(_QWORD *)((char *)&v213 + 4) = 0x100000001;
    HIDWORD(v213) = 1;
    goto LABEL_131;
  }
  v88 = -[BBBulletin expirationEvents](v217, "expirationEvents");
  if (v88 != -[BBBulletin expirationEvents](v21, "expirationEvents"))
  {
    v215 = 0;
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
    goto LABEL_233;
  }
  -[BBBulletin lastInterruptDate](v217, "lastInterruptDate");
  v89 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin lastInterruptDate](v21, "lastInterruptDate");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (void *)v89;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_DWORD *)&v216[16] = 0;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v215 = 0x100000000;
    *(_QWORD *)v211 = 0x100000001;
    v214 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    goto LABEL_131;
  }
  -[BBBulletin publicationDate](v217, "publicationDate");
  v90 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin publicationDate](v21, "publicationDate");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)v90;
  v7 = BSEqualObjects();
  if (!v7)
  {
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
LABEL_237:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    v215 = 0x100000001;
    goto LABEL_131;
  }
  v91 = -[BBBulletin usesExternalSync](v217, "usesExternalSync");
  if (v91 != -[BBBulletin usesExternalSync](v21, "usesExternalSync")
    || (v92 = -[BBBulletin isLoading](v217, "isLoading"), v92 != -[BBBulletin isLoading](v21, "isLoading"))
    || (v93 = -[BBBulletin preventAutomaticRemovalFromLockScreen](v217, "preventAutomaticRemovalFromLockScreen"),
        v93 != -[BBBulletin preventAutomaticRemovalFromLockScreen](v21, "preventAutomaticRemovalFromLockScreen"))
    || (v94 = -[BBBulletin lockScreenPriority](v217, "lockScreenPriority"),
        v94 != -[BBBulletin lockScreenPriority](v21, "lockScreenPriority"))
    || (v95 = -[BBBulletin backgroundStyle](v217, "backgroundStyle"),
        v95 != -[BBBulletin backgroundStyle](v21, "backgroundStyle")))
  {
    *(_DWORD *)&v216[16] = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
    goto LABEL_237;
  }
  -[BBBulletin header](v217, "header");
  v96 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin header](v21, "header");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)v96;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    v215 = 0x100000001;
    *(_DWORD *)&v216[16] = 1;
    goto LABEL_131;
  }
  -[BBBulletin footer](v217, "footer");
  v97 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin footer](v21, "footer");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)v97;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    v215 = 0x100000001;
    *(_DWORD *)&v216[16] = 1;
LABEL_248:
    v5 = v21;
    v32 = 1;
    goto LABEL_132;
  }
  -[BBBulletin threadSummary](v217, "threadSummary");
  v98 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin threadSummary](v21, "threadSummary");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)v98;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    v215 = 0x100000001;
    *(_DWORD *)&v216[16] = 1;
    v23 = 1;
    goto LABEL_248;
  }
  -[BBBulletin spotlightIdentifier](v217, "spotlightIdentifier");
  v99 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin spotlightIdentifier](v21, "spotlightIdentifier");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)v99;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
LABEL_243:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    v215 = 0x100000001;
    *(_DWORD *)&v216[16] = 1;
    v23 = 1;
    v24 = 1;
    goto LABEL_248;
  }
  v100 = -[BBBulletin realertCount](v217, "realertCount");
  if (v100 != -[BBBulletin realertCount](v21, "realertCount"))
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v7 = 0;
    goto LABEL_243;
  }
  -[BBBulletin alertSuppressionAppIDs_deprecated](v217, "alertSuppressionAppIDs_deprecated");
  v101 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin alertSuppressionAppIDs_deprecated](v21, "alertSuppressionAppIDs_deprecated");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (void *)v101;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v26 = 0;
    v27 = 0;
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    v215 = 0x100000001;
    *(_DWORD *)&v216[16] = 1;
    v23 = 1;
    v24 = 1;
    v25 = 1;
    goto LABEL_248;
  }
  -[BBBulletin contentType](v217, "contentType");
  v102 = objc_claimAutoreleasedReturnValue();
  -[BBBulletin contentType](v21, "contentType");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)v102;
  v7 = BSEqualObjects();
  if (!v7)
  {
    v27 = 0;
LABEL_247:
    *((_QWORD *)&v218 + 1) = 0x100000001;
    *(_QWORD *)&v218 = 0x100000001;
    v29 = 1;
    v30 = 1;
    v31 = 1;
    *(_QWORD *)&v216[8] = 0x100000001;
    *(_QWORD *)v216 = 0x100000001;
    v214 = 0x100000001;
    *(_QWORD *)v211 = 0x100000001;
    *(_DWORD *)&v211[8] = 1;
    v210 = 1;
    v203 = 1;
    v200 = 1;
    v209 = 1;
    v207 = 1;
    v201 = 1;
    v208 = 1;
    v205 = 1;
    v202 = 0x100000001;
    v206 = 1;
    v204 = 1;
    v199 = 1;
    v212 = 0x100000001;
    *(_QWORD *)&v213 = 0x100000001;
    *((_QWORD *)&v213 + 1) = 0x100000001;
    v215 = 0x100000001;
    *(_DWORD *)&v216[16] = 1;
    v23 = 1;
    v24 = 1;
    v25 = 1;
    v26 = 1;
    goto LABEL_248;
  }
  v103 = -[BBBulletin screenCaptureProhibited](v217, "screenCaptureProhibited");
  if (v103 != -[BBBulletin screenCaptureProhibited](v21, "screenCaptureProhibited")
    || (-[BBBulletin relevanceScore](v217, "relevanceScore"),
        v105 = v104,
        -[BBBulletin relevanceScore](v21, "relevanceScore"),
        v105 != v106))
  {
    v27 = 0;
    v7 = 0;
    goto LABEL_247;
  }
  self = v217;
  -[BBBulletin filterCriteria](v217, "filterCriteria");
  v107 = objc_claimAutoreleasedReturnValue();
  v5 = v21;
  -[BBBulletin filterCriteria](v21, "filterCriteria");
  v108 = objc_claimAutoreleasedReturnValue();
  v109 = (void *)v107;
  v7 = BSEqualObjects();
  v8 = (void *)v108;
  v27 = 1;
  *((_QWORD *)&v218 + 1) = 0x100000001;
  *(_QWORD *)&v218 = 0x100000001;
  v29 = 1;
  v30 = 1;
  v31 = 1;
  *(_QWORD *)&v216[8] = 0x100000001;
  *(_QWORD *)v216 = 0x100000001;
  v214 = 0x100000001;
  *(_QWORD *)v211 = 0x100000001;
  *(_DWORD *)&v211[8] = 1;
  v210 = 1;
  v203 = 1;
  v200 = 1;
  v209 = 1;
  v207 = 1;
  v201 = 1;
  v208 = 1;
  v205 = 1;
  v202 = 0x100000001;
  v206 = 1;
  v204 = 1;
  v199 = 1;
  v212 = 0x100000001;
  *(_QWORD *)&v213 = 0x100000001;
  *((_QWORD *)&v213 + 1) = 0x100000001;
  v215 = 0x100000001;
  *(_DWORD *)&v216[16] = 1;
  v32 = 1;
  v23 = 1;
  v24 = 1;
  v25 = 1;
  v26 = 1;
LABEL_22:
  LODWORD(v217) = v7;
  if (v27)
  {
    v196 = v32;
    v33 = v4;
    v34 = self;
    v35 = v31;
    v36 = v23;
    v37 = v24;
    v38 = v30;
    v39 = v5;
    v40 = v25;
    v41 = v29;
    v42 = v26;

    v43 = v42;
    v29 = v41;
    v25 = v40;
    v5 = v39;
    v30 = v38;
    v24 = v37;
    v23 = v36;
    v31 = v35;
    self = v34;
    v4 = v33;
    v32 = v196;
    if (!v43)
      goto LABEL_24;
  }
  else if (!v26)
  {
LABEL_24:
    if (v25)
      goto LABEL_25;
    goto LABEL_31;
  }

  if (v25)
  {
LABEL_25:

    if (!v24)
      goto LABEL_26;
    goto LABEL_32;
  }
LABEL_31:
  if (!v24)
  {
LABEL_26:
    if (v23)
      goto LABEL_27;
LABEL_33:
    if (!v32)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_32:

  if (!v23)
    goto LABEL_33;
LABEL_27:

  if (v32)
  {
LABEL_34:

  }
LABEL_35:
  if (*(_DWORD *)&v216[16])
  {

  }
  if ((_DWORD)v215)
  {

  }
  if (HIDWORD(v215))
  {

  }
  if (DWORD2(v213))
  {

  }
  if (HIDWORD(v213))
  {

  }
  if (DWORD1(v213))
  {

  }
  if ((_DWORD)v213)
  {

  }
  if ((_DWORD)v212)
  {

  }
  if (HIDWORD(v212))
  {

  }
  if (v199)
  {

  }
  if (v204)
  {

  }
  if (v206)
  {

  }
  if (HIDWORD(v202))
  {

  }
  if ((_DWORD)v202)
  {

  }
  if (v205)
  {

  }
  if (v208)
  {

  }
  if (v201)
  {

  }
  if (v207)
  {

  }
  if (v209)
  {

  }
  if (v200)
  {

  }
  if (v203)
  {

  }
  if (v210)
  {

  }
  if (*(_DWORD *)&v211[4])
  {

  }
  if (*(_DWORD *)&v211[8])
  {

  }
  if ((_DWORD)v214)
  {

  }
  if (*(_DWORD *)v211)
  {

  }
  if (HIDWORD(v214))
  {

  }
  if (*(_DWORD *)v216)
  {

  }
  if (*(_DWORD *)&v216[4])
  {

  }
  if (*(_DWORD *)&v216[8])
  {

  }
  if (*(_DWORD *)&v216[12])
  {

    if (!v31)
      goto LABEL_97;
  }
  else if (!v31)
  {
LABEL_97:
    if (v30)
      goto LABEL_98;
    goto LABEL_102;
  }

  if (v30)
  {
LABEL_98:

    if (!v29)
      goto LABEL_104;
    goto LABEL_103;
  }
LABEL_102:
  if (v29)
  {
LABEL_103:

  }
LABEL_104:
  if ((_DWORD)v218)
  {

  }
  if (DWORD1(v218))
  {

  }
  if (DWORD2(v218))
  {

  }
  if (HIDWORD(v218))
  {

  }
  if (v219)
  {

  }
  if ((_DWORD)v217)
  {
    -[BBBulletin speechLanguage](self, "speechLanguage");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin speechLanguage](v5, "speechLanguage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = BSEqualObjects();

  }
  else
  {
    v28 = 0;
  }

LABEL_118:
  return v28;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[BBBulletin content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[BBBulletin content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)message
{
  void *v2;
  void *v3;

  -[BBBulletin content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)attributedMessage
{
  void *v2;
  void *v3;

  -[BBBulletin content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (NSAttributedString)summary
{
  void *v2;
  void *v3;

  -[BBBulletin content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBBulletin content](self, "content");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBBulletin content](self, "content");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v4);

}

- (void)setMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBBulletin content](self, "content");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v4);

}

- (void)setAttributedMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBBulletin content](self, "content");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedMessage:", v4);

}

- (void)setSummary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBBulletin content](self, "content");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSummary:", v4);

}

- (BBContent)content
{
  BBContent *content;
  BBContent *v4;
  BBContent *v5;

  content = self->_content;
  if (!content)
  {
    v4 = objc_alloc_init(BBContent);
    v5 = self->_content;
    self->_content = v4;

    content = self->_content;
  }
  return content;
}

- (BOOL)isMessagingNotification
{
  return -[NSString isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("BBBulletinContentTypeMessagingDirect"))|| -[NSString isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("BBBulletinContentTypeMessagingGroup"));
}

- (BOOL)isCallNotification
{
  return -[NSString isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("BBBulletinContentTypeIncomingCall"))|| -[NSString isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("BBBulletinContentTypeMissedCall"))|| -[NSString isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("BBBulletinContentTypeVoicemail"))|| -[NSString isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("BBBulletinContentTypeCallOther"));
}

- (void)setAlertSuppressionContexts:(id)a3
{
  id v4;
  NSSet *alertSuppressionContexts;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSSet *v14;
  NSSet *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  alertSuppressionContexts = self->_alertSuppressionContexts;
  self->_alertSuppressionContexts = 0;

  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v16);
            objc_msgSend(v6, "addObject:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v14 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithSet:", v6);
    v15 = self->_alertSuppressionContexts;
    self->_alertSuppressionContexts = v14;

  }
}

- (int64_t)primaryAttachmentType
{
  void *v2;
  int64_t v3;

  -[BBBulletin primaryAttachment](self, "primaryAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (unint64_t)numberOfAdditionalAttachments
{
  void *v2;
  unint64_t v3;

  -[BBBulletin additionalAttachments](self, "additionalAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)numberOfAdditionalAttachmentsOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[BBBulletin additionalAttachments](self, "additionalAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "type", (_QWORD)v13) == a3)
          ++v9;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_actionKeyForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return 0;
  else
    return off_24C562D50[a3 - 1];
}

- (BBAction)defaultAction
{
  return (BBAction *)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("default"));
}

- (void)setDefaultAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 1);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("default"));
}

- (id)dismissAction
{
  return (id)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("dismiss"));
}

- (void)setDismissAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 8);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("dismiss"));
}

- (BBAction)alternateAction
{
  return (BBAction *)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("alternate"));
}

- (void)setAlternateAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 2);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("alternate"));
}

- (BBAction)acknowledgeAction
{
  return (BBAction *)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("acknowledge"));
}

- (void)setAcknowledgeAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 3);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("acknowledge"));
}

- (BBAction)expireAction
{
  return (BBAction *)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("expire"));
}

- (void)setExpireAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 5);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("expire"));
}

- (BBAction)snoozeAction
{
  return (BBAction *)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("snooze"));
}

- (void)setSnoozeAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 6);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("snooze"));
}

- (BBAction)raiseAction
{
  return (BBAction *)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("raise"));
}

- (void)setRaiseAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 9);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("raise"));
}

- (BBAction)followActivityAction
{
  return (BBAction *)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("follow-activity"));
}

- (void)setFollowActivityAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 11);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("follow-activity"));
}

- (id)silenceAction
{
  return (id)-[NSMutableDictionary valueForKey:](self->_actions, "valueForKey:", CFSTR("silence"));
}

- (void)setSilenceAction:(id)a3
{
  id v4;
  NSMutableDictionary *actions;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setActionType:", 10);
  actions = self->_actions;
  v6 = (id)objc_msgSend(v4, "copy");

  -[NSMutableDictionary setValue:forKey:](actions, "setValue:forKey:", v6, CFSTR("silence"));
}

- (id)actionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BBBulletin _allActions](self, "_allActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin _actionWithID:fromActions:](self, "_actionWithID:fromActions:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_actionWithID:(id)a3 fromActions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "actions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBBulletin _actionWithID:fromActions:](self, "_actionWithID:fromActions:", v6, v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14)
            goto LABEL_14;
        }
        else
        {
          objc_msgSend(v12, "identifier", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if (v16)
          {
            v14 = v12;
            if (v14)
              goto LABEL_14;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)supplementaryActions
{
  return -[BBBulletin supplementaryActionsForLayout:](self, "supplementaryActionsForLayout:", 0);
}

- (id)supplementaryActionsForLayout:(int64_t)a3
{
  NSMutableDictionary *supplementaryActionsByLayout;
  void *v4;
  void *v5;

  supplementaryActionsByLayout = self->_supplementaryActionsByLayout;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](supplementaryActionsByLayout, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_allSupplementaryActions
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_supplementaryActionsByLayout, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_flatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_allActions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_actions, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[BBBulletin _allSupplementaryActions](self, "_allSupplementaryActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (void)setButtons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *buttons;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v5);
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(v13, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "copy");

        objc_msgSend(v7, "addObject:", v10);
      }
    }
    else
    {
      v7 = 0;
    }
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v7);
    buttons = self->_buttons;
    self->_buttons = v11;

    v4 = v13;
  }

}

- (id)_responseForAction:(id)a3
{
  id v4;
  BBResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(BBResponse);
  -[BBBulletin lifeAssertions](self, "lifeAssertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBResponse setLifeAssertions:](v5, "setLifeAssertions:", v6);

  -[BBBulletin responseSendBlock](self, "responseSendBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBResponse setSendBlock:](v5, "setSendBlock:", v7);

  -[BBBulletin bulletinID](self, "bulletinID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBResponse setBulletinID:](v5, "setBulletinID:", v8);

  -[BBResponse setActionActivationMode:](v5, "setActionActivationMode:", objc_msgSend(v4, "activationMode"));
  -[BBResponse setActionBehavior:](v5, "setActionBehavior:", objc_msgSend(v4, "behavior"));
  -[BBResponse setActionType:](v5, "setActionType:", objc_msgSend(v4, "actionType"));
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBResponse setActionID:](v5, "setActionID:", v9);

  objc_msgSend(v4, "launchURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBResponse setActionLaunchURL:](v5, "setActionLaunchURL:", v10);
  return v5;
}

- (id)responseForAction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[BBBulletin _responseForAction:](self, "_responseForAction:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    NSLog(CFSTR("%s ERROR: you can't send a response for an action group"), "-[BBBulletin responseForAction:]");
  }
  v5 = 0;
LABEL_6:

  return v5;
}

- (id)responseForDefaultAction
{
  void *v3;
  void *v4;

  -[BBBulletin defaultAction](self, "defaultAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin responseForAction:](self, "responseForAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)responseForAcknowledgeAction
{
  void *v3;
  void *v4;

  -[BBBulletin acknowledgeAction](self, "acknowledgeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin responseForAction:](self, "responseForAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)responseForButtonActionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[NSArray count](self->_buttons, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_buttons, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin _responseForAction:](self, "_responseForAction:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "setButtonID:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setButtonID:", v10);

    }
  }
  return v7;
}

- (id)responseForSnoozeAction
{
  void *v3;
  void *v4;

  -[BBBulletin snoozeAction](self, "snoozeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin responseForAction:](self, "responseForAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)responseForRaiseAction
{
  void *v3;
  void *v4;

  -[BBBulletin raiseAction](self, "raiseAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin responseForAction:](self, "responseForAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)responseForExpireAction
{
  BBResponse *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(BBResponse);
  -[BBBulletin bulletinID](self, "bulletinID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBResponse setBulletinID:](v3, "setBulletinID:", v4);

  -[BBBulletin expireAction](self, "expireAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBResponse setActionActivationMode:](v3, "setActionActivationMode:", objc_msgSend(v5, "activationMode"));

  -[BBResponse setActionType:](v3, "setActionType:", 5);
  -[BBBulletin expireAction](self, "expireAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBResponse setActionID:](v3, "setActionID:", v7);

  return v3;
}

- (id)responseSendBlock
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__BBBulletin_responseSendBlock__block_invoke;
  v5[3] = &unk_24C562D30;
  v5[4] = self;
  v2 = (void *)MEMORY[0x212B949C0](v5, a2);
  v3 = (void *)MEMORY[0x212B949C0]();

  return v3;
}

void __31__BBBulletin_responseSendBlock__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "firstValidObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendResponse:", v3);

}

- (id)actionForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  unint64_t v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    NSLog(CFSTR("BBBulletin-handleResponse: Error: empty response"));
LABEL_8:
    v12 = 0;
    goto LABEL_28;
  }
  -[BBBulletin bulletinID](self, "bulletinID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    -[BBBulletin bulletinID](self, "bulletinID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bulletinID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("BBBulletin-handleResponse: Error: this isn't the bulletin that generated the response -> '%@' != '%@'"), v13, v14);

    goto LABEL_8;
  }
  -[BBBulletin _actionKeyForType:](self, "_actionKeyForType:", objc_msgSend(v4, "actionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "actionType");
  if (v8)
  {
    if (v9 == 7)
    {
      objc_msgSend(v4, "actionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBBulletin _allSupplementaryActions](self, "_allSupplementaryActions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBBulletin _actionWithID:fromActions:](self, "_actionWithID:fromActions:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("button")))
    {
      v27 = v8;
      objc_msgSend(v4, "buttonID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = self->_buttons;
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
LABEL_13:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v20);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v15);

          if ((v23 & 1) != 0)
            break;
          if (v18 == ++v20)
          {
            v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v18)
              goto LABEL_13;
            goto LABEL_19;
          }
        }
        objc_msgSend(v21, "action");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          goto LABEL_24;
      }
      else
      {
LABEL_19:

      }
      v24 = objc_msgSend(v15, "integerValue");
      if (v24 < -[NSArray count](self->_buttons, "count")
        && (-[NSArray objectAtIndex:](self->_buttons, "objectAtIndex:", v24),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v25, "action"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v25,
            v12))
      {
LABEL_24:

      }
      else
      {
        NSLog(CFSTR("BBBulletin-handleResponse: Error: could not find action for button with ID \"%@\"), v15);

        v12 = 0;
      }
      v8 = v27;
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    NSLog(CFSTR("BBBulletin-handleResponse: Error: no action key found for type %d"), v9);
    v12 = 0;
  }

LABEL_28:
  return v12;
}

- (void)_fillOutCopy:(id)a3 withZone:(_NSZone *)a4
{
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;

  v64 = a3;
  -[BBBulletin sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSectionID:", v6);

  -[BBBulletin sectionBundlePath](self, "sectionBundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSectionBundlePath:", v7);

  -[BBBulletin universalSectionID](self, "universalSectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setUniversalSectionID:", v8);

  -[BBBulletin parentSectionID](self, "parentSectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setParentSectionID:", v9);

  -[BBBulletin subsectionIDs](self, "subsectionIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSubsectionIDs:", v10);

  -[BBBulletin recordID](self, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setRecordID:", v11);

  -[BBBulletin publisherBulletinID](self, "publisherBulletinID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setPublisherBulletinID:", v12);

  -[BBBulletin dismissalID](self, "dismissalID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setDismissalID:", v13);

  -[BBBulletin categoryID](self, "categoryID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setCategoryID:", v14);

  -[BBBulletin threadID](self, "threadID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setThreadID:", v15);

  -[BBBulletin eventBehavior](self, "eventBehavior");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setEventBehavior:", v16);

  objc_msgSend(v64, "setIsHighlight:", -[BBBulletin isHighlight](self, "isHighlight"));
  -[BBBulletin peopleIDs](self, "peopleIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setPeopleIDs:", v17);

  objc_msgSend(v64, "setSectionSubtype:", -[BBBulletin sectionSubtype](self, "sectionSubtype"));
  -[BBBulletin intentIDs](self, "intentIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setIntentIDs:", v18);

  objc_msgSend(v64, "setCounter:", -[BBBulletin counter](self, "counter"));
  objc_msgSend(v64, "setInterruptionLevel:", -[BBBulletin interruptionLevel](self, "interruptionLevel"));
  objc_msgSend(v64, "setContentPreviewSetting:", -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting"));
  -[BBBulletin content](self, "content");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copyWithZone:", a4);
  objc_msgSend(v64, "setContent:", v20);

  -[BBBulletin modalAlertContent](self, "modalAlertContent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copyWithZone:", a4);
  objc_msgSend(v64, "setModalAlertContent:", v22);

  -[BBBulletin starkBannerContent](self, "starkBannerContent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copyWithZone:", a4);
  objc_msgSend(v64, "setStarkBannerContent:", v24);

  -[BBBulletin communicationContext](self, "communicationContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copyWithZone:", a4);
  objc_msgSend(v64, "setCommunicationContext:", v26);

  -[BBBulletin summaryArgument](self, "summaryArgument");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copyWithZone:", a4);
  objc_msgSend(v64, "setSummaryArgument:", v28);

  objc_msgSend(v64, "setSummaryArgumentCount:", -[BBBulletin summaryArgumentCount](self, "summaryArgumentCount"));
  -[BBBulletin icon](self, "icon");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copyWithZone:", a4);
  objc_msgSend(v64, "setIcon:", v30);

  objc_msgSend(v64, "setHasCriticalIcon:", -[BBBulletin hasCriticalIcon](self, "hasCriticalIcon"));
  objc_msgSend(v64, "setHasSubordinateIcon:", -[BBBulletin hasSubordinateIcon](self, "hasSubordinateIcon"));
  objc_msgSend(v64, "setHasEventDate:", -[BBBulletin hasEventDate](self, "hasEventDate"));
  -[BBBulletin date](self, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setDate:", v31);

  -[BBBulletin endDate](self, "endDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setEndDate:", v32);

  -[BBBulletin recencyDate](self, "recencyDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setRecencyDate:", v33);

  objc_msgSend(v64, "setDateFormatStyle:", -[BBBulletin dateFormatStyle](self, "dateFormatStyle"));
  objc_msgSend(v64, "setDateIsAllDay:", -[BBBulletin dateIsAllDay](self, "dateIsAllDay"));
  -[BBBulletin timeZone](self, "timeZone");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setTimeZone:", v34);

  -[BBBulletin accessoryIconMask](self, "accessoryIconMask");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setAccessoryIconMask:", v35);

  -[BBBulletin accessoryImage](self, "accessoryImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setAccessoryImage:", v36);

  objc_msgSend(v64, "setClearable:", -[BBBulletin clearable](self, "clearable"));
  -[BBBulletin sound](self, "sound");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copyWithZone:", a4);
  objc_msgSend(v64, "setSound:", v38);

  objc_msgSend(v64, "setTurnsOnDisplay:", -[BBBulletin turnsOnDisplay](self, "turnsOnDisplay"));
  -[BBBulletin primaryAttachment](self, "primaryAttachment");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setPrimaryAttachment:", v39);

  -[BBBulletin additionalAttachments](self, "additionalAttachments");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setAdditionalAttachments:", v40);

  -[BBBulletin unlockActionLabelOverride](self, "unlockActionLabelOverride");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setUnlockActionLabelOverride:", v41);

  objc_msgSend(v64, "setWantsFullscreenPresentation:", -[BBBulletin wantsFullscreenPresentation](self, "wantsFullscreenPresentation"));
  objc_msgSend(v64, "setIgnoresQuietMode:", -[BBBulletin ignoresQuietMode](self, "ignoresQuietMode"));
  objc_msgSend(v64, "setIgnoresDowntime:", -[BBBulletin ignoresDowntime](self, "ignoresDowntime"));
  objc_msgSend(v64, "setPreemptsPresentedAlert:", -[BBBulletin preemptsPresentedAlert](self, "preemptsPresentedAlert"));
  objc_msgSend(v64, "setDisplaysActionsInline:", -[BBBulletin displaysActionsInline](self, "displaysActionsInline"));
  -[BBBulletin actions](self, "actions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v42, "mutableCopy");
  objc_msgSend(v64, "setActions:", v43);

  -[BBBulletin buttons](self, "buttons");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setButtons:", v44);

  -[BBBulletin supplementaryActionsByLayout](self, "supplementaryActionsByLayout");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSupplementaryActionsByLayout:", v45);

  -[BBBulletin context](self, "context");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setContext:", v46);

  -[BBBulletin expirationDate](self, "expirationDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setExpirationDate:", v47);

  objc_msgSend(v64, "setExpirationEvents:", -[BBBulletin expirationEvents](self, "expirationEvents"));
  -[BBBulletin alertSuppressionContexts](self, "alertSuppressionContexts");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setAlertSuppressionContexts:", v48);

  -[BBBulletin bulletinID](self, "bulletinID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setBulletinID:", v49);

  -[BBBulletin lastInterruptDate](self, "lastInterruptDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setLastInterruptDate:", v50);

  -[BBBulletin publicationDate](self, "publicationDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setPublicationDate:", v51);

  objc_msgSend(v64, "setUsesExternalSync:", -[BBBulletin usesExternalSync](self, "usesExternalSync"));
  objc_msgSend(v64, "setLoading:", -[BBBulletin isLoading](self, "isLoading"));
  objc_msgSend(v64, "setPreventAutomaticRemovalFromLockScreen:", -[BBBulletin preventAutomaticRemovalFromLockScreen](self, "preventAutomaticRemovalFromLockScreen"));
  objc_msgSend(v64, "setLockScreenPriority:", -[BBBulletin lockScreenPriority](self, "lockScreenPriority"));
  objc_msgSend(v64, "setBackgroundStyle:", -[BBBulletin backgroundStyle](self, "backgroundStyle"));
  -[BBBulletin header](self, "header");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setHeader:", v52);

  -[BBBulletin footer](self, "footer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFooter:", v53);

  -[BBBulletin threadSummary](self, "threadSummary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setThreadSummary:", v54);

  -[BBBulletin spotlightIdentifier](self, "spotlightIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSpotlightIdentifier:", v55);

  if (objc_msgSend(v64, "isMemberOfClass:", objc_opt_class()))
  {
    -[BBBulletin bulletinVersionID](self, "bulletinVersionID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setBulletinVersionID:", v56);

    objc_msgSend(v64, "bulletinVersionID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "UUIDString");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setBulletinVersionID:", v59);

    }
  }
  objc_msgSend(v64, "setRealertCount:", -[BBBulletin realertCount](self, "realertCount"));
  -[BBBulletin alertSuppressionAppIDs_deprecated](self, "alertSuppressionAppIDs_deprecated");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setAlertSuppressionAppIDs_deprecated:", v60);

  -[BBBulletin contentType](self, "contentType");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setContentType:", v61);

  objc_msgSend(v64, "setScreenCaptureProhibited:", -[BBBulletin screenCaptureProhibited](self, "screenCaptureProhibited"));
  -[BBBulletin speechLanguage](self, "speechLanguage");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSpeechLanguage:", v62);

  -[BBBulletin relevanceScore](self, "relevanceScore");
  objc_msgSend(v64, "setRelevanceScore:");
  -[BBBulletin filterCriteria](self, "filterCriteria");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFilterCriteria:", v63);

  objc_msgSend(v64, "copyAssociationsForBulletin:", self);
}

- (NSString)publisherMatchID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BBBulletin publisherBulletinID](self, "publisherBulletinID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BBBulletin recordID](self, "recordID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (BOOL)showsMessagePreview
{
  return !-[BBBulletin hasPrivateContent](self, "hasPrivateContent");
}

- (void)setShowsMessagePreview:(BOOL)a3
{
  -[BBBulletin setHasPrivateContent:](self, "setHasPrivateContent:", !a3);
}

- (BOOL)hasPrivateContent
{
  return -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting") == 3;
}

- (void)setHasPrivateContent:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 1;
  -[BBBulletin setContentPreviewSetting:](self, "setContentPreviewSetting:", v3);
}

- (id)toUNCBulletin
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[BBBulletin _fillOutCopy:withZone:](self, "_fillOutCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBBulletin)initWithCoder:(id)a3
{
  id v4;
  BBBulletin *v5;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
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
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
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
  BBMutableAttachmentMetadata *v82;
  uint64_t i;
  void *v84;
  uint64_t j;
  BBMutableAttachmentMetadata *v86;
  objc_super v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[4];
  _QWORD v92[2];
  _QWORD v93[3];
  _QWORD v94[4];

  v94[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)BBBulletin;
  v5 = -[BBBulletin init](&v88, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletinID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setBulletinID:](v5, "setBulletinID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("versionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setBulletinVersionID:](v5, "setBulletinVersionID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSectionID:](v5, "setSectionID:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionBundlePathKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSectionBundlePath:](v5, "setSectionBundlePath:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("universalSectionID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setUniversalSectionID:](v5, "setUniversalSectionID:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentSectionID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setParentSectionID:](v5, "setParentSectionID:", v11);

    v12 = (void *)MEMORY[0x24BDBCF20];
    v94[0] = objc_opt_class();
    v94[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("subsectionIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSubsectionIDs:](v5, "setSubsectionIDs:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publisherRecordID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setRecordID:](v5, "setRecordID:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publisherBulletinID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setPublisherBulletinID:](v5, "setPublisherBulletinID:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dismissalID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setDismissalID:](v5, "setDismissalID:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setCategoryID:](v5, "setCategoryID:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setThreadID:](v5, "setThreadID:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventBehavior"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setEventBehavior:](v5, "setEventBehavior:", v21);

    -[BBBulletin setIsHighlight:](v5, "setIsHighlight:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHighlight")));
    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("peopleIDs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setPeopleIDs:](v5, "setPeopleIDs:", v25);

    -[BBBulletin setSectionSubtype:](v5, "setSectionSubtype:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sectionSubtype")));
    v26 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("intentIDs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setIntentIDs:](v5, "setIntentIDs:", v29);

    -[BBBulletin setCounter:](v5, "setCounter:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("counter")));
    -[BBBulletin setInterruptionLevel:](v5, "setInterruptionLevel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interruptionLevel")));
    -[BBBulletin setContentPreviewSetting:](v5, "setContentPreviewSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentPreviewSetting")));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("relevanceScore"));
    -[BBBulletin setRelevanceScore:](v5, "setRelevanceScore:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterCriteria"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setFilterCriteria:](v5, "setFilterCriteria:", v30);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setContent:](v5, "setContent:", v31);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("communicationContext"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setCommunicationContext:](v5, "setCommunicationContext:", v32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modalAlertContent"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setModalAlertContent:](v5, "setModalAlertContent:", v33);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("starkBannerContent"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setStarkBannerContent:](v5, "setStarkBannerContent:", v34);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summaryArgument"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSummaryArgument:](v5, "setSummaryArgument:", v35);

    -[BBBulletin setSummaryArgumentCount:](v5, "setSummaryArgumentCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("summaryArgumentCount")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setIcon:](v5, "setIcon:", v36);

    -[BBBulletin setHasCriticalIcon:](v5, "setHasCriticalIcon:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCriticalIcon")));
    -[BBBulletin setHasSubordinateIcon:](v5, "setHasSubordinateIcon:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSubordinateIcon")));
    -[BBBulletin setHasEventDate:](v5, "setHasEventDate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasEventDate")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setDate:](v5, "setDate:", v37);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setEndDate:](v5, "setEndDate:", v38);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recencyDate"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setRecencyDate:](v5, "setRecencyDate:", v39);

    -[BBBulletin setDateFormatStyle:](v5, "setDateFormatStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dateFormatStyle")));
    -[BBBulletin setDateIsAllDay:](v5, "setDateIsAllDay:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allDay")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setTimeZone:](v5, "setTimeZone:", v40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryIconMask"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setAccessoryIconMask:](v5, "setAccessoryIconMask:", v41);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryImage"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setAccessoryImage:](v5, "setAccessoryImage:", v42);

    -[BBBulletin setClearable:](v5, "setClearable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clearable")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sound"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSound:](v5, "setSound:", v43);

    -[BBBulletin setTurnsOnDisplay:](v5, "setTurnsOnDisplay:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("turnsOnDisplay")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unlockActionLabelOverride"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setUnlockActionLabelOverride:](v5, "setUnlockActionLabelOverride:", v44);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAttachment"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setPrimaryAttachment:](v5, "setPrimaryAttachment:", v45);

    v46 = (void *)MEMORY[0x24BDBCF20];
    v47 = objc_opt_class();
    objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("additionalAttachments"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setAdditionalAttachments:](v5, "setAdditionalAttachments:", v49);

    -[BBBulletin setWantsFullscreenPresentation:](v5, "setWantsFullscreenPresentation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsFullscreenPresentation")));
    -[BBBulletin setIgnoresQuietMode:](v5, "setIgnoresQuietMode:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresQuietMode")));
    -[BBBulletin setIgnoresDowntime:](v5, "setIgnoresDowntime:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresDowntime")));
    -[BBBulletin setPreemptsPresentedAlert:](v5, "setPreemptsPresentedAlert:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preemptsPresentedAlert")));
    -[BBBulletin setDisplaysActionsInline:](v5, "setDisplaysActionsInline:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displaysActionsInline")));
    v50 = (void *)MEMORY[0x24BDBCF20];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    v93[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setWithArray:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("actions"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setActions:](v5, "setActions:", v53);

    v54 = (void *)MEMORY[0x24BDBCF20];
    v92[0] = objc_opt_class();
    v92[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setWithArray:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("buttons"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setButtons:](v5, "setButtons:", v57);

    v58 = (void *)MEMORY[0x24BDBCF20];
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    v91[2] = objc_opt_class();
    v91[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setWithArray:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v60, CFSTR("supplementaryActionsByLayout"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSupplementaryActionsByLayout:](v5, "setSupplementaryActionsByLayout:", v61);

    v62 = (void *)MEMORY[0x24BDBCF20];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setWithArray:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("alertSuppressionContexts"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setAlertSuppressionContexts:](v5, "setAlertSuppressionContexts:", v65);

    BBAllowedClasses();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("context"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setContext:](v5, "setContext:", v67);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setExpirationDate:](v5, "setExpirationDate:", v68);

    -[BBBulletin setExpirationEvents:](v5, "setExpirationEvents:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("expirationEvents")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastInterruptDate"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setLastInterruptDate:](v5, "setLastInterruptDate:", v69);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicationDate"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setPublicationDate:](v5, "setPublicationDate:", v70);

    -[BBBulletin setUsesExternalSync:](v5, "setUsesExternalSync:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesExternalSync")));
    -[BBBulletin setLoading:](v5, "setLoading:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loading")));
    -[BBBulletin setPreventAutomaticRemovalFromLockScreen:](v5, "setPreventAutomaticRemovalFromLockScreen:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preventAutomaticRemovalFromLockScreen")));
    -[BBBulletin setLockScreenPriority:](v5, "setLockScreenPriority:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lockScreenPriority")));
    -[BBBulletin setBackgroundStyle:](v5, "setBackgroundStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundStyle")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("header"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setHeader:](v5, "setHeader:", v71);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footer"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setFooter:](v5, "setFooter:", v72);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadSummary"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setThreadSummary:](v5, "setThreadSummary:", v73);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spotlightIdentifier"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSpotlightIdentifier:](v5, "setSpotlightIdentifier:", v74);

    -[BBBulletin setRealertCount:](v5, "setRealertCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("realertCount")));
    v75 = (void *)MEMORY[0x24BDBCF20];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setWithArray:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v77, CFSTR("alertSuppressionIDs"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setAlertSuppressionAppIDs_deprecated:](v5, "setAlertSuppressionAppIDs_deprecated:", v78);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setContentType:](v5, "setContentType:", v79);

    -[BBBulletin setScreenCaptureProhibited:](v5, "setScreenCaptureProhibited:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("screenCaptureProhibited")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechLanguage"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin setSpeechLanguage:](v5, "setSpeechLanguage:", v80);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("attachments")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachments"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v81, "primaryType"))
      {
        v82 = objc_alloc_init(BBMutableAttachmentMetadata);
        -[BBMutableAttachmentMetadata setType:](v82, "setType:", objc_msgSend(v81, "primaryType"));
        -[BBBulletin setPrimaryAttachment:](v5, "setPrimaryAttachment:", v82);

      }
      for (i = 1; i != 7; ++i)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        for (j = objc_msgSend(v81, "numberOfAdditionalAttachmentsOfType:", i); j; --j)
        {
          v86 = objc_alloc_init(BBMutableAttachmentMetadata);
          -[BBMutableAttachmentMetadata setType:](v86, "setType:", i);
          objc_msgSend(v84, "addObject:", v86);

        }
        if (objc_msgSend(v84, "count"))
          -[BBBulletin setAdditionalAttachments:](v5, "setAdditionalAttachments:", v84);

      }
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("hasPrivateContent")))
      -[BBBulletin setHasPrivateContent:](v5, "setHasPrivateContent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasPrivateContent")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v51;

  v4 = a3;
  -[BBBulletin bulletinID](self, "bulletinID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bulletinID"));

  -[BBBulletin sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sectionID"));

  -[BBBulletin sectionBundlePath](self, "sectionBundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sectionBundlePathKey"));

  -[BBBulletin universalSectionID](self, "universalSectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("universalSectionID"));

  -[BBBulletin parentSectionID](self, "parentSectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("parentSectionID"));

  -[BBBulletin subsectionIDs](self, "subsectionIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("subsectionIDs"));

  -[BBBulletin recordID](self, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("publisherRecordID"));

  -[BBBulletin publisherBulletinID](self, "publisherBulletinID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("publisherBulletinID"));

  -[BBBulletin dismissalID](self, "dismissalID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("dismissalID"));

  -[BBBulletin categoryID](self, "categoryID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("categoryID"));

  -[BBBulletin threadID](self, "threadID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("threadID"));

  -[BBBulletin eventBehavior](self, "eventBehavior");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("eventBehavior"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin isHighlight](self, "isHighlight"), CFSTR("isHighlight"));
  -[BBBulletin peopleIDs](self, "peopleIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("peopleIDs"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin sectionSubtype](self, "sectionSubtype"), CFSTR("sectionSubtype"));
  -[BBBulletin intentIDs](self, "intentIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("intentIDs"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin counter](self, "counter"), CFSTR("counter"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin interruptionLevel](self, "interruptionLevel"), CFSTR("interruptionLevel"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting"), CFSTR("contentPreviewSetting"));
  -[BBBulletin relevanceScore](self, "relevanceScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("relevanceScore"));
  -[BBBulletin filterCriteria](self, "filterCriteria");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("filterCriteria"));

  -[BBBulletin content](self, "content");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("content"));

  -[BBBulletin modalAlertContent](self, "modalAlertContent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("modalAlertContent"));

  -[BBBulletin starkBannerContent](self, "starkBannerContent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("starkBannerContent"));

  -[BBBulletin communicationContext](self, "communicationContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("communicationContext"));

  -[BBBulletin summaryArgument](self, "summaryArgument");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("summaryArgument"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin summaryArgumentCount](self, "summaryArgumentCount"), CFSTR("summaryArgumentCount"));
  -[BBBulletin icon](self, "icon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("icon"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin hasCriticalIcon](self, "hasCriticalIcon"), CFSTR("hasCriticalIcon"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin hasSubordinateIcon](self, "hasSubordinateIcon"), CFSTR("hasSubordinateIcon"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin hasEventDate](self, "hasEventDate"), CFSTR("hasEventDate"));
  -[BBBulletin date](self, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("date"));

  -[BBBulletin endDate](self, "endDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("endDate"));

  -[BBBulletin recencyDate](self, "recencyDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("recencyDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin dateFormatStyle](self, "dateFormatStyle"), CFSTR("dateFormatStyle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin dateIsAllDay](self, "dateIsAllDay"), CFSTR("allDay"));
  -[BBBulletin timeZone](self, "timeZone");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("timeZone"));

  -[BBBulletin accessoryIconMask](self, "accessoryIconMask");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("accessoryIconMask"));

  -[BBBulletin accessoryImage](self, "accessoryImage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("accessoryImage"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin clearable](self, "clearable"), CFSTR("clearable"));
  -[BBBulletin sound](self, "sound");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("sound"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin turnsOnDisplay](self, "turnsOnDisplay"), CFSTR("turnsOnDisplay"));
  -[BBBulletin unlockActionLabelOverride](self, "unlockActionLabelOverride");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("unlockActionLabelOverride"));

  -[BBBulletin primaryAttachment](self, "primaryAttachment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("primaryAttachment"));

  -[BBBulletin additionalAttachments](self, "additionalAttachments");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("additionalAttachments"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin wantsFullscreenPresentation](self, "wantsFullscreenPresentation"), CFSTR("wantsFullscreenPresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin ignoresQuietMode](self, "ignoresQuietMode"), CFSTR("ignoresQuietMode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin ignoresDowntime](self, "ignoresDowntime"), CFSTR("ignoresDowntime"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin preemptsPresentedAlert](self, "preemptsPresentedAlert"), CFSTR("preemptsPresentedAlert"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin displaysActionsInline](self, "displaysActionsInline"), CFSTR("displaysActionsInline"));
  -[BBBulletin actions](self, "actions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("actions"));

  -[BBBulletin buttons](self, "buttons");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("buttons"));

  -[BBBulletin supplementaryActionsByLayout](self, "supplementaryActionsByLayout");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("supplementaryActionsByLayout"));

  -[BBBulletin alertSuppressionContexts](self, "alertSuppressionContexts");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("alertSuppressionContexts"));

  -[BBBulletin context](self, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("context"));

  -[BBBulletin expirationDate](self, "expirationDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("expirationDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin expirationEvents](self, "expirationEvents"), CFSTR("expirationEvents"));
  -[BBBulletin lastInterruptDate](self, "lastInterruptDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("lastInterruptDate"));

  -[BBBulletin publicationDate](self, "publicationDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("publicationDate"));

  -[BBBulletin bulletinVersionID](self, "bulletinVersionID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("versionID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin usesExternalSync](self, "usesExternalSync"), CFSTR("usesExternalSync"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin isLoading](self, "isLoading"), CFSTR("loading"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin preventAutomaticRemovalFromLockScreen](self, "preventAutomaticRemovalFromLockScreen"), CFSTR("preventAutomaticRemovalFromLockScreen"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin lockScreenPriority](self, "lockScreenPriority"), CFSTR("lockScreenPriority"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin backgroundStyle](self, "backgroundStyle"), CFSTR("backgroundStyle"));
  -[BBBulletin header](self, "header");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, CFSTR("header"));

  -[BBBulletin footer](self, "footer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v46, CFSTR("footer"));

  -[BBBulletin threadSummary](self, "threadSummary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, CFSTR("threadSummary"));

  -[BBBulletin spotlightIdentifier](self, "spotlightIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v48, CFSTR("spotlightIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBBulletin realertCount](self, "realertCount"), CFSTR("realertCount"));
  -[BBBulletin alertSuppressionAppIDs_deprecated](self, "alertSuppressionAppIDs_deprecated");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v49, CFSTR("alertSuppressionIDs"));

  -[BBBulletin contentType](self, "contentType");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, CFSTR("contentType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletin screenCaptureProhibited](self, "screenCaptureProhibited"), CFSTR("screenCaptureProhibited"));
  -[BBBulletin speechLanguage](self, "speechLanguage");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v51, CFSTR("speechLanguage"));

}

- (id)_safeDescription:(BOOL)a3
{
  const __CFString *v5;
  uint64_t v6;
  BOOL v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v26;
  int64_t v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v30 = (void *)MEMORY[0x24BDD17C8];
  v29 = objc_opt_class();
  -[BBBulletin bulletinID](self, "bulletinID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin bulletinVersionID](self, "bulletinVersionID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin sectionID](self, "sectionID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[BBBulletin sectionSubtype](self, "sectionSubtype");
  -[BBBulletin publisherBulletinID](self, "publisherBulletinID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin categoryID](self, "categoryID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v32 = CFSTR("<redacted>");
    v5 = CFSTR("<redacted>");
  }
  else
  {
    -[BBBulletin threadID](self, "threadID");
    v32 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    -[BBBulletin peopleIDs](self, "peopleIDs");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[BBBulletin communicationContext](self, "communicationContext");
  v6 = objc_claimAutoreleasedReturnValue();
  v28 = (__CFString *)v6;
  if (v6)
    v7 = a3;
  else
    v7 = 1;
  if (v6)
    v8 = CFSTR("<redacted>");
  else
    v8 = CFSTR("(null)");
  v26 = v7;
  v31 = v5;
  if (!v7)
  {
    -[BBBulletin communicationContext](self, "communicationContext");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[BBBulletin recordID](self, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin intentIDs](self, "intentIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v11 = CFSTR("<redacted>");
  }
  else
  {
    -[BBBulletin content](self, "content");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[BBBulletin date](self, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin sound](self, "sound");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BBBulletin interruptionLevel](self, "interruptionLevel");
  -[BBBulletin relevanceScore](self, "relevanceScore");
  v16 = v15;
  -[BBBulletin filterCriteria](self, "filterCriteria");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p; ID: %@; versionID: %@> {\n\t%@ / subtype = %ld\n\tPublisher Bulletin ID: %@\n\tCategory ID: %@\n\tThread ID: %@\n\tPeople IDs: %@\n\tCommunication Context: %@\n\tRecord ID: %@\n\tIntent IDs: %@\n\tContent: %@\n\tDate: %@\n\tSound: %@\n\tInterruption Level: %lu\n\t Relevance Score: %.2f\n\t Filteria Criteria: %@"),
    v29,
    self,
    v37,
    v36,
    v35,
    v27,
    v34,
    v33,
    v32,
    v31,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
    v14,
    *(_QWORD *)&v16,
    v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v19 = v28;
  }
  else
  {

    if (!v26)
    v10 = v28;
    v9 = (void *)v31;
    v19 = (__CFString *)v32;
  }

  -[BBBulletin subsectionIDs](self, "subsectionIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    -[BBBulletin subsectionIDs](self, "subsectionIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("\n\tSubsections: %@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v23;
  }
  objc_msgSend(v18, "stringByAppendingString:", CFSTR("\n}"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)description
{
  return -[BBBulletin _safeDescription:](self, "_safeDescription:", BSIsBeingDebugged() ^ 1);
}

- (id)safeDescription
{
  return -[BBBulletin _safeDescription:](self, "_safeDescription:", 1);
}

- (id)shortDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_sectionID || self->_bulletinID)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; [%@] bulletinID: %@; publisherBulletinID: %@, categoryID:%@, threadID:%@, peopleIDs:%@, recordID: %@; intentIDs: %@; revisionID: %@>"),
      objc_opt_class(),
      self,
      self->_sectionID,
      self->_bulletinID,
      self->_publisherBulletinID,
      self->_categoryID,
      self->_threadID,
      self->_peopleIDs,
      self->_publisherRecordID,
      self->_intentIDs,
      self->_bulletinVersionID);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; (no identifying details)>"),
      objc_opt_class(),
      self,
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sectionBundlePath
{
  return self->_sectionBundlePath;
}

- (void)setSectionBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)subsectionIDs
{
  return self->_subsectionIDs;
}

- (void)setSubsectionIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)recordID
{
  return self->_publisherRecordID;
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (void)setDismissalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (NSArray)peopleIDs
{
  return self->_peopleIDs;
}

- (void)setPeopleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)sectionSubtype
{
  return self->_sectionSubtype;
}

- (void)setSectionSubtype:(int64_t)a3
{
  self->_sectionSubtype = a3;
}

- (NSArray)intentIDs
{
  return self->_intentIDs;
}

- (void)setIntentIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)counter
{
  return self->_counter;
}

- (void)setCounter:(unint64_t)a3
{
  self->_counter = a3;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (float)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(float)a3
{
  self->_relevanceScore = a3;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BBContent)modalAlertContent
{
  return self->_modalAlertContent;
}

- (void)setModalAlertContent:(id)a3
{
  objc_storeStrong((id *)&self->_modalAlertContent, a3);
}

- (BBContent)starkBannerContent
{
  return self->_starkBannerContent;
}

- (void)setStarkBannerContent:(id)a3
{
  objc_storeStrong((id *)&self->_starkBannerContent, a3);
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (void)setSummaryArgument:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unint64_t)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

- (void)setSummaryArgumentCount:(unint64_t)a3
{
  self->_summaryArgumentCount = a3;
}

- (BBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)hasCriticalIcon
{
  return self->_hasCriticalIcon;
}

- (void)setHasCriticalIcon:(BOOL)a3
{
  self->_hasCriticalIcon = a3;
}

- (BOOL)hasSubordinateIcon
{
  return self->_hasSubordinateIcon;
}

- (void)setHasSubordinateIcon:(BOOL)a3
{
  self->_hasSubordinateIcon = a3;
}

- (BOOL)hasEventDate
{
  return self->_hasEventDate;
}

- (void)setHasEventDate:(BOOL)a3
{
  self->_hasEventDate = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSDate)recencyDate
{
  return self->_recencyDate;
}

- (void)setRecencyDate:(id)a3
{
  objc_storeStrong((id *)&self->_recencyDate, a3);
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (void)setDateFormatStyle:(int64_t)a3
{
  self->_dateFormatStyle = a3;
}

- (BOOL)dateIsAllDay
{
  return self->_dateIsAllDay;
}

- (void)setDateIsAllDay:(BOOL)a3
{
  self->_dateIsAllDay = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (BBAccessoryIcon)accessoryIconMask
{
  return self->_accessoryIconMask;
}

- (void)setAccessoryIconMask:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIconMask, a3);
}

- (BBImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImage, a3);
}

- (BOOL)clearable
{
  return self->_clearable;
}

- (void)setClearable:(BOOL)a3
{
  self->_clearable = a3;
}

- (BBSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (BOOL)turnsOnDisplay
{
  return self->_turnsOnDisplay;
}

- (void)setTurnsOnDisplay:(BOOL)a3
{
  self->_turnsOnDisplay = a3;
}

- (BBAttachmentMetadata)primaryAttachment
{
  return self->_primaryAttachment;
}

- (void)setPrimaryAttachment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)additionalAttachments
{
  return self->_additionalAttachments;
}

- (void)setAdditionalAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)unlockActionLabelOverride
{
  return self->_unlockActionLabelOverride;
}

- (void)setUnlockActionLabelOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)wantsFullscreenPresentation
{
  return self->_wantsFullscreenPresentation;
}

- (void)setWantsFullscreenPresentation:(BOOL)a3
{
  self->_wantsFullscreenPresentation = a3;
}

- (BOOL)ignoresQuietMode
{
  return self->_ignoresQuietMode;
}

- (void)setIgnoresQuietMode:(BOOL)a3
{
  self->_ignoresQuietMode = a3;
}

- (BOOL)ignoresDowntime
{
  return self->_ignoresDowntime;
}

- (void)setIgnoresDowntime:(BOOL)a3
{
  self->_ignoresDowntime = a3;
}

- (BOOL)preemptsPresentedAlert
{
  return self->_preemptsPresentedAlert;
}

- (void)setPreemptsPresentedAlert:(BOOL)a3
{
  self->_preemptsPresentedAlert = a3;
}

- (BOOL)displaysActionsInline
{
  return self->_displaysActionsInline;
}

- (void)setDisplaysActionsInline:(BOOL)a3
{
  self->_displaysActionsInline = a3;
}

- (NSMutableDictionary)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSMutableDictionary)supplementaryActionsByLayout
{
  return self->_supplementaryActionsByLayout;
}

- (void)setSupplementaryActionsByLayout:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryActionsByLayout, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)expiresOnPublisherDeath
{
  return self->_expiresOnPublisherDeath;
}

- (void)setExpiresOnPublisherDeath:(BOOL)a3
{
  self->_expiresOnPublisherDeath = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (unint64_t)expirationEvents
{
  return self->_expirationEvents;
}

- (void)setExpirationEvents:(unint64_t)a3
{
  self->_expirationEvents = a3;
}

- (NSSet)alertSuppressionContexts
{
  return self->_alertSuppressionContexts;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSDate)lastInterruptDate
{
  return self->_lastInterruptDate;
}

- (void)setLastInterruptDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastInterruptDate, a3);
}

- (NSDate)publicationDate
{
  return self->_publicationDate;
}

- (void)setPublicationDate:(id)a3
{
  objc_storeStrong((id *)&self->_publicationDate, a3);
}

- (NSString)bulletinVersionID
{
  return self->_bulletinVersionID;
}

- (void)setBulletinVersionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (BOOL)usesExternalSync
{
  return self->_usesExternalSync;
}

- (void)setUsesExternalSync:(BOOL)a3
{
  self->_usesExternalSync = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSString)parentSectionID
{
  return self->_parentSectionID;
}

- (void)setParentSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (int64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  self->_contentPreviewSetting = a3;
}

- (BOOL)preventAutomaticRemovalFromLockScreen
{
  return self->_preventAutomaticRemovalFromLockScreen;
}

- (void)setPreventAutomaticRemovalFromLockScreen:(BOOL)a3
{
  self->_preventAutomaticRemovalFromLockScreen = a3;
}

- (int64_t)lockScreenPriority
{
  return self->_lockScreenPriority;
}

- (void)setLockScreenPriority:(int64_t)a3
{
  self->_lockScreenPriority = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSAttributedString)threadSummary
{
  return self->_threadSummary;
}

- (void)setThreadSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setSpotlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (unint64_t)realertCount
{
  return self->realertCount;
}

- (void)setRealertCount:(unint64_t)a3
{
  self->realertCount = a3;
}

- (NSSet)alertSuppressionAppIDs_deprecated
{
  return self->alertSuppressionAppIDs_deprecated;
}

- (void)setAlertSuppressionAppIDs_deprecated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (BBCommunicationContext)communicationContext
{
  return self->_communicationContext;
}

- (void)setCommunicationContext:(id)a3
{
  objc_storeStrong((id *)&self->_communicationContext, a3);
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->_screenCaptureProhibited = a3;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (void)setSpeechLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);
  objc_storeStrong((id *)&self->alertSuppressionAppIDs_deprecated, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_threadSummary, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_parentSectionID, 0);
  objc_storeStrong((id *)&self->_bulletinVersionID, 0);
  objc_storeStrong((id *)&self->_publicationDate, 0);
  objc_storeStrong((id *)&self->_lastInterruptDate, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContexts, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_supplementaryActionsByLayout, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_unlockActionLabelOverride, 0);
  objc_storeStrong((id *)&self->_additionalAttachments, 0);
  objc_storeStrong((id *)&self->_primaryAttachment, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_accessoryIconMask, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_recencyDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_starkBannerContent, 0);
  objc_storeStrong((id *)&self->_modalAlertContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_intentIDs, 0);
  objc_storeStrong((id *)&self->_peopleIDs, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_publisherRecordID, 0);
  objc_storeStrong((id *)&self->_subsectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionBundlePath, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

+ (id)_lifeAssertionAssociationSet
{
  if (_lifeAssertionAssociationSet___onceToken != -1)
    dispatch_once(&_lifeAssertionAssociationSet___onceToken, &__block_literal_global_5);
  return (id)_lifeAssertionAssociationSet___lifeAssertionAssociationSet;
}

void __56__BBBulletin_Associations___lifeAssertionAssociationSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[BBAssociationSet setWithStrongAssociation](BBAssociationSet, "setWithStrongAssociation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_lifeAssertionAssociationSet___lifeAssertionAssociationSet;
  _lifeAssertionAssociationSet___lifeAssertionAssociationSet = v0;

}

- (id)lifeAssertions
{
  id v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_lifeAssertionAssociationSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(v3, "associatedObjectsForObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addLifeAssertion:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_lifeAssertionAssociationSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend(v4, "associateObject:withObject:", v5, self);
  objc_sync_exit(v4);

}

+ (id)_observerAssociationSet
{
  if (_observerAssociationSet___onceToken != -1)
    dispatch_once(&_observerAssociationSet___onceToken, &__block_literal_global_1);
  return (id)_observerAssociationSet___observerAssociationSet;
}

void __51__BBBulletin_Associations___observerAssociationSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[BBAssociationSet setWithWeakAssociation](BBAssociationSet, "setWithWeakAssociation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_observerAssociationSet___observerAssociationSet;
  _observerAssociationSet___observerAssociationSet = v0;

}

- (id)firstValidObserver
{
  id v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_observerAssociationSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(v3, "associatedObjectsForObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_observerAssociationSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend(v4, "associateObject:withObject:", v5, self);
  objc_sync_exit(v4);

}

- (void)copyAssociationsForBulletin:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_lifeAssertionAssociationSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_observerAssociationSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_sync_enter(v6);
  objc_msgSend(v6, "copyAssociationsForObject:toObject:", v8, self);
  objc_sync_exit(v6);

  v7 = v5;
  objc_sync_enter(v7);
  objc_msgSend(v7, "copyAssociationsForObject:toObject:", v8, self);
  objc_sync_exit(v7);

}

- (NSString)sectionDisplayName
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BBSectionIcon)sectionIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BBSectionIcon *v11;

  -[BBBulletin icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIconOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icon");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v5;
  else
    v9 = (void *)v7;
  if (v3)
    v10 = v3;
  else
    v10 = v9;
  v11 = v10;

  return v11;
}

- (BOOL)showsSubtitle
{
  void *v2;
  char v3;

  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsSubtitle");

  return v3;
}

- (unint64_t)messageNumberOfLines
{
  void *v2;
  unint64_t v3;

  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messageNumberOfLines");

  return v3;
}

- (BOOL)usesVariableLayout
{
  void *v2;
  char v3;

  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesVariableLayout");

  return v3;
}

- (BOOL)orderSectionUsingRecencyDate
{
  void *v2;
  char v3;

  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orderSectionUsingRecencyDate");

  return v3;
}

- (BOOL)showsDateInFloatingLockScreenAlert
{
  void *v2;
  char v3;

  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDateInFloatingLockScreenAlert");

  return v3;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hiddenPreviewsBodyPlaceholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subtypeSummaryFormat
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtypeSummaryFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)topic
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)missedBannerDescriptionFormat
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "missedBannerDescriptionFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fullUnlockActionLabel
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullUnlockActionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unlockActionLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BBBulletin unlockActionLabelOverride](self, "unlockActionLabelOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unlockActionLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)fullAlternateActionLabel
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullAlternateActionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)alternateActionLabel
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternateActionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSSet)alertSuppressionAppIDs
{
  void *v3;
  void *v4;
  void *v5;

  if (-[BBBulletin suppressesAlertsWhenAppIsActive](self, "suppressesAlertsWhenAppIsActive"))
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    -[BBBulletin sectionID](self, "sectionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSSet *)v5;
}

- (BOOL)suppressesAlertsWhenAppIsActive
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressesAlertsWhenAppIsActive");

  return v3;
}

- (BOOL)coalescesWhenLocked
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "coalescesWhenLocked");

  return v3;
}

- (BOOL)suppressesMessageForPrivacy
{
  return -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting") == 3;
}

- (BOOL)inertWhenLocked
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inertWhenLocked");

  return v3;
}

- (BOOL)preservesUnlockActionCase
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preservesUnlockActionCase");

  return v3;
}

- (BOOL)visuallyIndicatesWhenDateIsInFuture
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visuallyIndicatesWhenDateIsInFuture");

  return v3;
}

- (BOOL)canBeSilencedByMenuButtonPress
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBeSilencedByMenuButtonPress");

  return v3;
}

- (BOOL)preventLock
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preventLock");

  return v3;
}

- (BOOL)suppressesTitle
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressesTitle");

  return v3;
}

- (BOOL)showsUnreadIndicatorForNoticesFeed
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsUnreadIndicatorForNoticesFeed");

  return v3;
}

- (BOOL)showsContactPhoto
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsContactPhoto");

  return v3;
}

- (BOOL)playsSoundForModify
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playsSoundForModify");

  return v3;
}

- (unint64_t)subtypePriority
{
  void *v2;
  unint64_t v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subtypePriority");

  return v3;
}

- (int64_t)iPodOutAlertType
{
  void *v2;
  int64_t v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iPodOutAlertType");

  return v3;
}

- (NSString)bannerAccessoryRemoteViewControllerClassName
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerAccessoryRemoteViewControllerClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bannerAccessoryRemoteServiceBundleIdentifier
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerAccessoryRemoteServiceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)secondaryContentRemoteViewControllerClassName
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryContentRemoteViewControllerClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)secondaryContentRemoteServiceBundleIdentifier
{
  void *v2;
  void *v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryContentRemoteServiceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_sectionParameters
{
  void *v3;
  void *v4;
  void *v5;

  -[BBBulletin firstValidObserver](self, "firstValidObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin sectionID](self, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parametersForSectionID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sectionSubtypeParameters
{
  void *v3;
  void *v4;

  -[BBBulletin _sectionParameters](self, "_sectionParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parametersForSubtype:", -[BBBulletin sectionSubtype](self, "sectionSubtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)allowsAutomaticRemovalFromLockScreen
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsAutomaticRemovalFromLockScreen");

  return v3;
}

- (BOOL)allowsAddingToLockScreenWhenUnlocked
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsAddingToLockScreenWhenUnlocked");

  return v3;
}

- (BOOL)prioritizeAtTopOfLockScreen
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prioritizeAtTopOfLockScreen");

  return v3;
}

- (BOOL)revealsAdditionalContentOnPresentation
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "revealsAdditionalContentOnPresentation");

  return v3;
}

- (BOOL)allowsPersistentBannersInCarPlay
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsPersistentBannersInCarPlay");

  return v3;
}

- (BOOL)allowsSupplementaryActionsInCarPlay
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsSupplementaryActionsInCarPlay");

  return v3;
}

- (unint64_t)privacySettings
{
  void *v2;
  unint64_t v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "privacySettings");

  return v3;
}

- (BOOL)shouldDismissBulletinWhenClosed
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDismissBulletinWhenClosed");

  return v3;
}

- (BOOL)playsMediaWhenRaised
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playsMediaWhenRaised");

  return v3;
}

- (BOOL)suppressDelayForForwardedBulletins
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressDelayForForwardedBulletins");

  return v3;
}

- (BOOL)hideDismissActionInCarPlay
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hideDismissActionInCarPlay");

  return v3;
}

- (BOOL)suppressPresentationInAmbient
{
  void *v2;
  char v3;

  -[BBBulletin _sectionSubtypeParameters](self, "_sectionSubtypeParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressPresentationInAmbient");

  return v3;
}

- (id)syncHash
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[BBBulletin title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "appendString:", v4);
  -[BBBulletin subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "appendString:", v5);
  -[BBBulletin message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "appendString:", v6);
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_MD5((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), md);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 32);
  for (i = 0; i != 16; ++i)
    objc_msgSend(v8, "appendFormat:", CFSTR("%02x"), md[i]);

  return v8;
}

@end
