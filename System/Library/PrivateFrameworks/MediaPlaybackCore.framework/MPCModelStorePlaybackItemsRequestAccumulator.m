@implementation MPCModelStorePlaybackItemsRequestAccumulator

- (MPCModelStorePlaybackItemsRequestAccumulator)initWithRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MPCModelStorePlaybackItemsRequestAccumulator *v7;

  v4 = (void *)MEMORY[0x24BDDCBC8];
  v5 = a3;
  objc_msgSend(v4, "sharedServerObjectDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPCModelStorePlaybackItemsRequestAccumulator initWithRequest:serverObjectDatabase:](self, "initWithRequest:serverObjectDatabase:", v5, v6);

  return v7;
}

- (MPCModelStorePlaybackItemsRequestAccumulator)initWithRequest:(id)a3 serverObjectDatabase:(id)a4
{
  id v6;
  id v7;
  MPCModelStorePlaybackItemsRequestAccumulator *v8;
  uint64_t v9;
  MPCModelStorePlaybackItemsRequest *request;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *mutableABCStateDump;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char *v20;
  uint64_t quot;
  lldiv_t v22;
  uint64_t v23;
  const UInt8 *v24;
  CFStringRef v25;
  void *personID;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  lldiv_t v33;
  uint64_t v34;
  const UInt8 *v35;
  CFStringRef v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *v41;
  MPCModelStorePlaybackItemsRequest *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  uint64_t v115;
  MPPropertySet *requestPropertySet;
  uint64_t v117;
  NSMutableArray *importResults;
  void *v119;
  void *v120;
  _BOOL8 v121;
  void *v122;
  NSObject *v123;
  MPMutableSectionedCollection *v124;
  MPMutableSectionedCollection *progressiveContentDescriptors;
  void *v126;
  id v127;
  MPMutableSectionedCollection *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t i;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  id v159;
  void *v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  _QWORD v165[4];
  MPCModelStorePlaybackItemsRequestAccumulator *v166;
  id v167;
  objc_super v168;
  _BYTE v169[128];
  _QWORD v170[6];
  _BYTE buf[24];
  _QWORD v172[4];
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  _QWORD v186[4];

  v186[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v168.receiver = self;
  v168.super_class = (Class)MPCModelStorePlaybackItemsRequestAccumulator;
  v8 = -[MPCModelStorePlaybackItemsRequestAccumulator init](&v168, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (MPCModelStorePlaybackItemsRequest *)v9;

    -[MPCModelStorePlaybackItemsRequest sectionedModelObjects](v8->_request, "sectionedModelObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_requestUsesSectionedModelObjects = v11 != 0;

    objc_storeStrong((id *)&v8->_sod, a4);
    -[MPCModelStorePlaybackItemsRequest abc_siriAssetInfo](v8->_request, "abc_siriAssetInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
      mutableABCStateDump = v8->_mutableABCStateDump;
      v8->_mutableABCStateDump = (NSMutableDictionary *)v14;

    }
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_allowsExplicitContent = objc_msgSend(v16, "allowsExplicitContent");

    objc_msgSend(v6, "playbackRequestEnvironment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegationProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "storeAccountID");

    v159 = v6;
    if (v19)
    {
      v20 = (char *)v172 + 1;
      quot = v19;
      do
      {
        v22 = lldiv(quot, 10);
        quot = v22.quot;
        if (v22.rem >= 0)
          LOBYTE(v23) = v22.rem;
        else
          v23 = -v22.rem;
        *(v20 - 2) = v23 + 48;
        v24 = (const UInt8 *)(v20 - 2);
        --v20;
      }
      while (v22.quot);
      if (v19 < 0)
      {
        *(v20 - 2) = 45;
        v24 = (const UInt8 *)(v20 - 2);
      }
      v25 = CFStringCreateWithBytes(0, v24, (char *)v172 - (char *)v24, 0x8000100u, 0);
      personID = v8->_personID;
      v8->_personID = &v25->isa;
    }
    else
    {
      objc_msgSend(v6, "playbackRequestEnvironment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userIdentity");
      personID = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "DSIDForUserIdentity:outError:", personID, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (personID && v29)
      {
        v30 = objc_msgSend(v29, "longLongValue");
        v31 = v30;
        v32 = (char *)v172 + 1;
        do
        {
          v33 = lldiv(v30, 10);
          v30 = v33.quot;
          if (v33.rem >= 0)
            LOBYTE(v34) = v33.rem;
          else
            v34 = -v33.rem;
          *(v32 - 2) = v34 + 48;
          v35 = (const UInt8 *)(v32 - 2);
          --v32;
        }
        while (v33.quot);
        if (v31 < 0)
        {
          *(v32 - 2) = 45;
          v35 = (const UInt8 *)(v32 - 2);
        }
        v36 = CFStringCreateWithBytes(0, v35, (char *)v172 - (char *)v35, 0x8000100u, 0);
        v37 = v8->_personID;
        v8->_personID = &v36->isa;

        v38 = (void *)MEMORY[0x24BDDC750];
        objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "userMonitorWithUserIdentity:fromUserIdentityStore:", personID, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory") && v40)
          v8->_allowsExplicitContent = objc_msgSend(v40, "isExplicitSettingEnabled");
      }
      else
      {
        v41 = (NSString *)(id)*MEMORY[0x24BEC8730];
        v40 = v8->_personID;
        v8->_personID = v41;
      }

    }
    v42 = v8->_request;
    -[MPCModelStorePlaybackItemsRequest sectionProperties](v42, "sectionProperties");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelStorePlaybackItemsRequest sectionKind](v42, "sectionKind");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v44, "modelClass"), "requiredStoreLibraryPersonalizationProperties");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "propertySetByCombiningWithPropertySet:", v45);
    v160 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCModelStorePlaybackItemsRequest itemProperties](v42, "itemProperties");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v157 = v46;
    objc_msgSend(v46, "relationships");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = *MEMORY[0x24BDDC2F8];
    objc_msgSend(v47, "objectForKey:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    v158 = v7;
    if (v48)
    {
      v50 = v48;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    v51 = v50;

    objc_msgSend((id)objc_opt_class(), "requiredStoreLibraryPersonalizationProperties");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "propertySetByCombiningWithPropertySet:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_alloc(MEMORY[0x24BDDCB30]);
    v186[0] = *MEMORY[0x24BDDC100];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v186, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = *MEMORY[0x24BDDC3B8];
    v55 = (void *)MEMORY[0x24BDDCB30];
    v56 = *MEMORY[0x24BDDC1B8];
    v183 = *MEMORY[0x24BDDC1B8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v183, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "propertySetWithProperties:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = v58;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v53, "initWithProperties:relationships:", v54, v59);

    v153 = (void *)v60;
    objc_msgSend(v52, "propertySetByCombiningWithPropertySet:", v60);
    v152 = (void *)objc_claimAutoreleasedReturnValue();

    v150 = *MEMORY[0x24BDDC2B0];
    objc_msgSend(v47, "objectForKey:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v61)
    {
      v63 = v61;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v63 = (id)objc_claimAutoreleasedReturnValue();
    }
    v64 = v63;

    objc_msgSend((id)objc_opt_class(), "requiredStoreLibraryPersonalizationProperties");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "propertySetByCombiningWithPropertySet:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = objc_alloc(MEMORY[0x24BDDCB30]);
    v182 = *MEMORY[0x24BDDBEA0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v182, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = *MEMORY[0x24BDDC330];
    v179 = v56;
    v180 = v68;
    v69 = (void *)MEMORY[0x24BDDCB30];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v179, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "propertySetWithProperties:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = v71;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v66, "initWithProperties:relationships:", v67, v72);

    v149 = (void *)v73;
    objc_msgSend(v65, "propertySetByCombiningWithPropertySet:", v73);
    v148 = (void *)objc_claimAutoreleasedReturnValue();

    v146 = *MEMORY[0x24BDDC300];
    objc_msgSend(v47, "objectForKey:");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v74)
    {
      v76 = v74;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v76 = (id)objc_claimAutoreleasedReturnValue();
    }
    v77 = v76;

    objc_msgSend((id)objc_opt_class(), "requiredStoreLibraryPersonalizationProperties");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "propertySetByCombiningWithPropertySet:");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = objc_alloc(MEMORY[0x24BDDCB30]);
    v178 = *MEMORY[0x24BDDC1F8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v178, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = *MEMORY[0x24BDDC3E0];
    v175 = v56;
    v176 = v81;
    v82 = (void *)MEMORY[0x24BDDCB30];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v175, 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "propertySetWithProperties:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = v84;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v79, "initWithProperties:relationships:", v80, v85);

    v145 = (void *)v86;
    objc_msgSend(v78, "propertySetByCombiningWithPropertySet:", v86);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v160, "relationships");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = *MEMORY[0x24BDDC278];
    objc_msgSend(v87, "objectForKey:");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88;
    if (v88)
    {
      v90 = v88;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v90 = (id)objc_claimAutoreleasedReturnValue();
    }
    v91 = v90;
    v156 = v47;

    objc_msgSend((id)objc_opt_class(), "requiredStoreLibraryPersonalizationProperties");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "propertySetByCombiningWithPropertySet:");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v93 = (void *)MEMORY[0x24BDDCB30];
    v174 = *MEMORY[0x24BDDBDB0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v174, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "propertySetWithProperties:", v94);
    v95 = objc_claimAutoreleasedReturnValue();

    v141 = (void *)v95;
    objc_msgSend(v92, "propertySetByCombiningWithPropertySet:", v95);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v160, "relationships");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = *MEMORY[0x24BDDC2B8];
    objc_msgSend(v96, "objectForKey:", *MEMORY[0x24BDDC2B8]);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v98;
    if (v98)
    {
      v100 = v98;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v100 = (id)objc_claimAutoreleasedReturnValue();
    }
    v101 = v100;

    objc_msgSend((id)objc_opt_class(), "requiredStoreLibraryPersonalizationProperties");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "propertySetByCombiningWithPropertySet:");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    v103 = (void *)MEMORY[0x24BDDCB30];
    v173 = *MEMORY[0x24BDDBF70];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v173, 1);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "propertySetWithProperties:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v102, "propertySetByCombiningWithPropertySet:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v160, "relationships");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = *MEMORY[0x24BDDC2D8];
    objc_msgSend(v107, "objectForKey:", *MEMORY[0x24BDDC2D8]);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v109;
    if (v109)
    {
      v111 = v109;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v111 = (id)objc_claimAutoreleasedReturnValue();
    }
    v112 = v111;

    v113 = objc_alloc(MEMORY[0x24BDDCB30]);
    v170[0] = v150;
    v170[1] = v146;
    *(_QWORD *)buf = v148;
    *(_QWORD *)&buf[8] = v144;
    v170[2] = v142;
    v170[3] = v97;
    *(_QWORD *)&buf[16] = v140;
    v172[0] = v106;
    v170[4] = v154;
    v170[5] = v108;
    v172[1] = v152;
    v172[2] = v112;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v170, 6);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v113, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v114);

    requestPropertySet = v8->_requestPropertySet;
    v8->_requestPropertySet = (MPPropertySet *)v115;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v117 = objc_claimAutoreleasedReturnValue();
    importResults = v8->_importResults;
    v8->_importResults = (NSMutableArray *)v117;

    -[MPCModelStorePlaybackItemsRequest playbackRequestEnvironment](v8->_request, "playbackRequestEnvironment");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "delegationProperties");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v120 == 0;

    v8->_defaultLibraryPersonalizationStyle = v121;
    v8->_unknownEndpointLibraryPersonalizationStyle = 2 * v121;
    _MPCSPIRCopyFailedStoreIDs();
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v158;
    if (objc_msgSend(v122, "count"))
    {
      v123 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v122;
        _os_log_impl(&dword_210BD8000, v123, OS_LOG_TYPE_DEFAULT, "[PIA] %p will not run requests for itemIdentifiers=%{public}@", buf, 0x16u);
      }

    }
    v124 = (MPMutableSectionedCollection *)objc_alloc_init(MEMORY[0x24BDDCA88]);
    progressiveContentDescriptors = v8->_progressiveContentDescriptors;
    v8->_progressiveContentDescriptors = v124;

    if (v8->_requestUsesSectionedModelObjects)
    {
      -[MPCModelStorePlaybackItemsRequest sectionedModelObjects](v8->_request, "sectionedModelObjects");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v165[0] = MEMORY[0x24BDAC760];
      v165[1] = 3221225472;
      v165[2] = __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke;
      v165[3] = &unk_24CAB4078;
      v166 = v8;
      v167 = v126;
      v127 = v126;
      objc_msgSend(v127, "enumerateSectionsUsingBlock:", v165);

    }
    else
    {
      v128 = v8->_progressiveContentDescriptors;
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMutableSectionedCollection appendSection:](v128, "appendSection:", v129);

      v163 = 0u;
      v164 = 0u;
      v161 = 0u;
      v162 = 0u;
      -[MPCModelStorePlaybackItemsRequest storeIDs](v8->_request, "storeIDs");
      v127 = (id)objc_claimAutoreleasedReturnValue();
      v130 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v161, v169, 16);
      if (v130)
      {
        v131 = v130;
        v132 = *(_QWORD *)v162;
        do
        {
          for (i = 0; i != v131; ++i)
          {
            if (*(_QWORD *)v162 != v132)
              objc_enumerationMutation(v127);
            -[MPMutableSectionedCollection appendItem:](v8->_progressiveContentDescriptors, "appendItem:", *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * i));
          }
          v131 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v161, v169, 16);
        }
        while (v131);
      }
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_mutableABCStateDump, "setObject:forKeyedSubscript:", v134, CFSTR("SOD-Lookups"));

    _MPCSPIRCopyFailedStoreIDs();
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v135, "count"))
    {
      objc_msgSend(v135, "allObjects");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "msv_compactDescription");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_mutableABCStateDump, "setObject:forKeyedSubscript:", v137, CFSTR("permanently-failed-ids"));

    }
    -[MPCModelStorePlaybackItemsRequestAccumulator _resolveContentDescriptorsUsingServerObjectDatabase](v8, "_resolveContentDescriptorsUsingServerObjectDatabase");

    v6 = v159;
  }

  return v8;
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  id v4;
  MPMutableSectionedCollection *progressiveContentDescriptors;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (self->_accumulationError)
    return (MPSectionedCollection *)objc_alloc_init(MEMORY[0x24BDDCBB0]);
  v4 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  progressiveContentDescriptors = self->_progressiveContentDescriptors;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke;
  v9[3] = &unk_24CAB1EE0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[MPMutableSectionedCollection enumerateSectionsUsingBlock:](progressiveContentDescriptors, "enumerateSectionsUsingBlock:", v9);
  v7 = v10;
  v8 = v6;

  return (MPSectionedCollection *)v8;
}

- (MPCModelStorePlaybackItemsRequestAccumulatorResult)accumulatorResult
{
  id v2;
  _BOOL4 v3;
  int v4;
  int v5;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  MPMutableSectionedCollection *progressiveContentDescriptors;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  int v25;
  uint64_t v26;
  __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  MPCModelStorePlaybackItemsRequestAccumulator *v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  int v47;
  __int16 v48;
  __CFString *v49;
  _BYTE v50[128];
  _QWORD v51[4];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v3 = 1;
  if (self->_accumulationError)
  {
    v4 = 0;
    v5 = 1;
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1;
    if (self->_requestUsesSectionedModelObjects)
    {
      -[MPCModelStorePlaybackItemsRequest sectionedModelObjects](self->_request, "sectionedModelObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "totalItemCount") > 0;

      if (v8)
      {
        -[MPCModelStorePlaybackItemsRequest playbackPrioritizedIndexPaths](self->_request, "playbackPrioritizedIndexPaths");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v51[0] = v10;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
          v2 = (id)objc_claimAutoreleasedReturnValue();

          v9 = v2;
        }
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __65__MPCModelStorePlaybackItemsRequestAccumulator_accumulatorResult__block_invoke;
        v33[3] = &unk_24CAB1F08;
        v33[4] = self;
        v33[5] = &v34;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v33);
        v4 = *((_BYTE *)v35 + 24) == 0;

      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[MPMutableSectionedCollection allSections](self->_progressiveContentDescriptors, "allSections", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v50, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v30 != v13)
              objc_enumerationMutation(v11);
            v2 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

            }
            else
            {
              v2 = v2;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

LABEL_22:
                v4 = 1;
                goto LABEL_23;
              }
              objc_msgSend(v2, "identifiers");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isPlaceholder");

              if ((v16 & 1) != 0)
                goto LABEL_22;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v50, 16);
          if (v12)
            continue;
          break;
        }
      }
      v4 = 0;
LABEL_23:

      if (-[MPMutableSectionedCollection numberOfItemsInSection:](self->_progressiveContentDescriptors, "numberOfItemsInSection:", 0))
      {
        progressiveContentDescriptors = self->_progressiveContentDescriptors;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPMutableSectionedCollection itemAtIndexPath:](progressiveContentDescriptors, "itemAtIndexPath:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v19, "identifiers"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v2 = (id)objc_msgSend(v20, "isPlaceholder"),
              v20,
              (_DWORD)v2))
        {
          *((_BYTE *)v35 + 24) = 0;
        }

      }
      else
      {
        *((_BYTE *)v35 + 24) = 0;
      }
    }
    v21 = -[NSMutableOrderedSet count](self->_pendingStoreIDs, "count");
    v3 = v21 == 0;
    v22 = -[NSMutableArray count](self->_pendingCollectionItemMetadataRequests, "count")
       || -[NSMutableArray count](self->_pendingCollectionItemTokenRenewalRequests, "count")
       || -[NSMutableArray count](self->_pendingCollectionMetadataRequests, "count")
       || -[NSMutableArray count](self->_pendingCollectionItemAuthorizationTokenRequests, "count") != 0;
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v21 == 0;
      v25 = *((unsigned __int8 *)v35 + 24);
      v26 = -[NSMutableOrderedSet count](self->_pendingStoreIDs, "count");
      if (v26)
      {
        -[NSMutableOrderedSet array](self->_pendingStoreIDs, "array");
        v2 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "msv_compactDescription");
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = CFSTR("{}");
      }
      *(_DWORD *)buf = 134219266;
      v39 = self;
      v40 = 1024;
      v41 = v24;
      v42 = 1024;
      v43 = v25;
      v44 = 1024;
      v45 = v22;
      v46 = 1024;
      v47 = v4;
      v48 = 2114;
      v49 = v27;
      _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[PIA] %p computed accumulatorResult didFinishEntireRequest=%{BOOL}u didFinishPrioritizedBatch=%{BOOL}u hasCollectionItemsWithPlaybackAuthTokens=%{BOOL}u hasPrioritizedItemsToLoad=%{BOOL}u pendingStoreIDs=[%{public}@]", buf, 0x2Eu);
      if (v26)
      {

      }
    }

    v5 = *((unsigned __int8 *)v35 + 24);
    _Block_object_dispose(&v34, 8);
  }
  return (MPCModelStorePlaybackItemsRequestAccumulatorResult)((v5 << 8) | (v4 << 16) | v3);
}

- (MPCModelStorePlaybackItemsRequestAccumulatorResult)handleResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MPServerObjectDatabase *sod;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  ICURLAggregatedPerformanceMetrics *v43;
  void *v44;
  ICURLAggregatedPerformanceMetrics *v45;
  ICURLAggregatedPerformanceMetrics *v46;
  int v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  ICURLAggregatedPerformanceMetrics *performanceMetrics;
  void *v53;
  ICURLAggregatedPerformanceMetrics *v54;
  ICURLAggregatedPerformanceMetrics *v55;
  NSError *v56;
  NSError *accumulationError;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  uint8_t v69[128];
  uint8_t buf[4];
  MPCModelStorePlaybackItemsRequestAccumulator *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  _BYTE v75[18];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1308], -1009);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isRemoteServerReachable"),
        v9,
        (v10 & 1) == 0))
  {
    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "requestItemIdentifiers");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "msv_compactDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v71 = self;
      v72 = 2048;
      v73 = v6;
      v74 = 2114;
      *(_QWORD *)v75 = v50;
      _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_ERROR, "[PIA] %p Handling SP response=%p marking remaining IDs as failed [EnvironmentMonitor.isRemoteServerReachable returned NO] failedIDs=%{public}@", buf, 0x20u);

    }
    v51 = (void *)MEMORY[0x24BEC8A28];
    performanceMetrics = self->_performanceMetrics;
    objc_msgSend(v6, "performanceMetrics");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", performanceMetrics, v53);
    v54 = (ICURLAggregatedPerformanceMetrics *)objc_claimAutoreleasedReturnValue();
    v55 = self->_performanceMetrics;
    self->_performanceMetrics = v54;

    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 56, v7, CFSTR("EnvironmentMonitor.isRemoteServerReachable returned NO"));
    v56 = (NSError *)objc_claimAutoreleasedReturnValue();
    accumulationError = self->_accumulationError;
    self->_accumulationError = v56;

    v47 = (int)-[MPCModelStorePlaybackItemsRequestAccumulator accumulatorResult](self, "accumulatorResult");
  }
  else
  {
    objc_msgSend(v6, "lastBatchStoreItemDictionaries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v11, "count");
      objc_msgSend(v6, "requestItemIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "msv_compactDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v71 = self;
      v72 = 2048;
      v73 = v6;
      v74 = 2048;
      *(_QWORD *)v75 = v13;
      *(_WORD *)&v75[8] = 2112;
      *(_QWORD *)&v75[10] = v15;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[PIA] %p Importing response %p storeDictionaryCount=%ld requestedIDs=[%@]", buf, 0x2Au);

    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCBE0]), "initWithPayload:", v11);
    -[MPCModelStorePlaybackItemsRequestAccumulator _userIdentityWithRequest:](self, "_userIdentityWithRequest:", self->_request);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserIdentity:", v17);

    sod = self->_sod;
    v68 = 0;
    v61 = v16;
    -[MPServerObjectDatabase importObjectsFromRequest:options:error:](sod, "importObjectsFromRequest:options:error:", v16, 0, &v68);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v68;
    v21 = v20;
    if (!v19 || v20)
    {
      v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v71 = self;
        v72 = 2048;
        v73 = v6;
        v74 = 2114;
        *(_QWORD *)v75 = v21;
        _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_ERROR, "[PIA] %p Failed to import response %p. error=%{public}@", buf, 0x20u);
      }

    }
    v62 = v11;
    -[NSMutableArray addObject:](self->_importResults, "addObject:", v19);
    v23 = -[MPCModelStorePlaybackItemsRequestAccumulator _isFatalError:](self, "_isFatalError:", v7);
    if (v7)
    {
      v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v71 = self;
        v72 = 2048;
        v73 = v6;
        v74 = 1024;
        *(_DWORD *)v75 = v23;
        *(_WORD *)&v75[4] = 2114;
        *(_QWORD *)&v75[6] = v7;
        _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_ERROR, "[PIA] %p Handling SP response=%p isFatalError=%{BOOL}u error=%{public}@", buf, 0x26u);
      }

    }
    v59 = v21;
    v60 = (void *)v19;
    v63 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v6, "lastBatchItemIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v65 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v6, "storeItemMetadataForItemIdentifier:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            -[MPCModelStorePlaybackItemsRequestAccumulator _addEquivalencyForMetadata:requestStoreIdentifier:](self, "_addEquivalencyForMetadata:requestStoreIdentifier:", v32, v31);
          }
          else if (v23)
          {
            objc_msgSend(v25, "addObject:", v31);
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      }
      while (v28);
    }

    if (objc_msgSend(v25, "count"))
    {
      v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v71 = self;
        v72 = 2114;
        v73 = v25;
        _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "[PIA] %p Adding identifiers=%{public}@ as permanently failed items", buf, 0x16u);
      }

      _MPCSPIRAddFailedStoreIDs(v25);
    }
    -[MPCModelStorePlaybackItemsRequestAccumulator _resolveContentDescriptorsUsingServerObjectDatabase](self, "_resolveContentDescriptorsUsingServerObjectDatabase");
    v7 = v63;
    if (objc_msgSend(v6, "isFinalResponse"))
    {
      v34 = (void *)MEMORY[0x24BDBCEF0];
      objc_msgSend(v6, "requestItemIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setWithArray:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableOrderedSet set](self->_pendingStoreIDs, "set");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "intersectSet:", v37);

      objc_msgSend(v36, "allObjects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v23 && objc_msgSend(v38, "count"))
      {
        v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v39, "msv_compactDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v71 = self;
          v72 = 2114;
          v73 = v41;
          _os_log_impl(&dword_210BD8000, v40, OS_LOG_TYPE_ERROR, "[PIA] %p Permanently failed items: [fatal final response] identifiers=[%{public}@]", buf, 0x16u);

        }
        _MPCSPIRAddFailedStoreIDs(v39);
      }
      -[NSMutableOrderedSet removeObjectsInArray:](self->_pendingStoreIDs, "removeObjectsInArray:", v39);

    }
    v42 = (void *)MEMORY[0x24BEC8A28];
    v43 = self->_performanceMetrics;
    objc_msgSend(v6, "performanceMetrics");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "aggregatedMetricsFromAggregatedMetrics:addingAggregatedMetrics:", v43, v44);
    v45 = (ICURLAggregatedPerformanceMetrics *)objc_claimAutoreleasedReturnValue();
    v46 = self->_performanceMetrics;
    self->_performanceMetrics = v45;

    v47 = (int)-[MPCModelStorePlaybackItemsRequestAccumulator accumulatorResult](self, "accumulatorResult");
  }

  return (MPCModelStorePlaybackItemsRequestAccumulatorResult)v47;
}

- (id)newStoreItemMetadataRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MPMutableSectionedCollection *progressiveContentDescriptors;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint8_t buf[4];
  MPCModelStorePlaybackItemsRequestAccumulator *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDDCC48]);
  -[MPCModelStorePlaybackItemsRequest clientIdentifier](self->_request, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentifier:", v4);

  objc_msgSend(v3, "setReason:", 3);
  objc_msgSend(v3, "setTimeoutInterval:", &unk_24CB17560);
  objc_msgSend(v3, "setRetryDelay:", 2.0);
  objc_msgSend(v3, "setAllowLocalEquivalencies:", -[MPCModelStorePlaybackItemsRequest allowLocalEquivalencies](self->_request, "allowLocalEquivalencies"));
  v30 = v3;
  objc_msgSend(v3, "setPersonalizationStyle:", self->_storePersonalizationStyle);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableOrderedSet count](self->_pendingStoreIDs, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMutableOrderedSet mutableCopy](self->_pendingStoreIDs, "mutableCopy");
  progressiveContentDescriptors = self->_progressiveContentDescriptors;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __75__MPCModelStorePlaybackItemsRequestAccumulator_newStoreItemMetadataRequest__block_invoke;
  v37[3] = &unk_24CAB1F30;
  v37[4] = self;
  v8 = v6;
  v38 = v8;
  v31 = v5;
  v39 = v31;
  -[MPMutableSectionedCollection enumerateSectionsUsingBlock:](progressiveContentDescriptors, "enumerateSectionsUsingBlock:", v37);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[MPCModelStorePlaybackItemsRequest playbackPrioritizedIndexPaths](self->_request, "playbackPrioritizedIndexPaths");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[MPCModelStorePlaybackItemsRequest sectionedModelObjects](self->_request, "sectionedModelObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "itemAtIndexPath:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "identifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "preferredStoreStringIdentifierForPersonID:", self->_personID);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v8, "indexOfObject:", v17);
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = v18;
          objc_msgSend(v8, "objectAtIndex:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v20);

          objc_msgSend(v8, "removeObjectAtIndex:", v19);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v31, "count"))
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v31, "msv_compactDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v41 = self;
      v42 = 2112;
      v43 = v22;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[PIA] %p Only requesting prioritized IDs requestedIDs=[%@]", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v8, "array");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v21);
  }

  objc_msgSend(v30, "setItemIdentifiers:", v31);
  -[MPCModelStorePlaybackItemsRequest playbackRequestEnvironment](self->_request, "playbackRequestEnvironment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_createStoreRequestContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "clientInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClientInfo:", v25);

  objc_msgSend(v24, "delegatedIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDelegatedUserIdentity:", v26);

  objc_msgSend(v24, "identity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUserIdentity:", v27);

  objc_msgSend(v24, "identityStore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUserIdentityStore:", v28);

  return v30;
}

- (NSDictionary)abc_stateDump
{
  void *v3;

  if (self->_mutableABCStateDump)
  {
    -[MPCModelStorePlaybackItemsRequestAccumulator _finalizeABCStateDump](self, "_finalizeABCStateDump");
    v3 = (void *)-[NSMutableDictionary copy](self->_mutableABCStateDump, "copy");
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1B8];
  }
  return (NSDictionary *)v3;
}

- (void)_addEquivalencyForMetadata:(id)a3 requestStoreIdentifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  MPStoreItemMetadataStringNormalizeStoreIDValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
    -[NSMutableDictionary setObject:forKey:](self->_equivalencyMapping, "setObject:forKey:", v6, v7);

}

- (_MPCModelStorePlaybackItemEligibility)_eligibilityForItem:(id)a3
{
  id v4;
  int IsRestricted;
  void *v6;
  _BOOL4 allowsExplicitContent;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _MPCModelStorePlaybackItemEligibility result;

  v4 = a3;
  IsRestricted = 0;
  v6 = 0;
  allowsExplicitContent = 1;
  switch(objc_msgSend(v4, "type"))
  {
    case 1:
      objc_msgSend(v4, "song");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      IsRestricted = objc_msgSend(v8, "isExplicitSong");
      allowsExplicitContent = self->_allowsExplicitContent;
      objc_msgSend(v8, "storeAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5:
      objc_msgSend(v4, "playlistEntry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v42 = &v41;
      v43 = 0x3032000000;
      v44 = __Block_byref_object_copy__1766;
      v45 = __Block_byref_object_dispose__1767;
      v46 = 0;
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__1766;
      v39 = __Block_byref_object_dispose__1767;
      v40 = 0;
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__1766;
      v33 = __Block_byref_object_dispose__1767;
      v34 = 0;
      v10 = (void *)MEMORY[0x24BDDC928];
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __68__MPCModelStorePlaybackItemsRequestAccumulator__eligibilityForItem___block_invoke;
      v24 = &unk_24CAB1F58;
      v26 = &v41;
      v8 = v9;
      v25 = v8;
      v27 = &v35;
      v28 = &v29;
      objc_msgSend(v10, "performWithoutEnforcement:", &v21);
      v11 = (void *)v42[5];
      if (v11)
      {
        IsRestricted = objc_msgSend(v11, "isExplicitSong", v21, v22, v23, v24);
        v12 = self->_allowsExplicitContent;
        objc_msgSend((id)v42[5], "storeAsset");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        allowsExplicitContent = v12;
        goto LABEL_13;
      }
      if (v36[5])
      {
        IsRestricted = MPModelTVEpisodeIsRestricted();
        objc_msgSend((id)v36[5], "storeAsset", v21, v22, v23, v24);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v6 = (void *)v15;
        allowsExplicitContent = 0;
        goto LABEL_13;
      }
      if (v30[5])
      {
        IsRestricted = MPModelMovieIsRestricted();
        objc_msgSend((id)v30[5], "storeAsset", v21, v22, v23, v24);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v6 = 0;
      IsRestricted = 0;
      allowsExplicitContent = 1;
LABEL_13:

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(&v41, 8);
LABEL_14:

LABEL_15:
      v16 = objc_msgSend(v6, "endpointType", v21, v22, v23, v24);
      v17 = 64;
      if (!v16)
        v17 = 72;
      v18 = *(int64_t *)((char *)&self->super.isa + v17);

      v19 = allowsExplicitContent | IsRestricted ^ 1u;
      v20 = v18;
      result.var1 = v20;
      result.var0 = v19;
      return result;
    case 6:
      objc_msgSend(v4, "tvEpisode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MPModelTVEpisodeIsRestricted();
      goto LABEL_7;
    case 9:
      objc_msgSend(v4, "movie");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MPModelMovieIsRestricted();
LABEL_7:
      IsRestricted = v14;
      objc_msgSend(v13, "storeAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      allowsExplicitContent = 0;
      goto LABEL_15;
    default:
      goto LABEL_15;
  }
}

- (void)_finalizeABCStateDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  id obj;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[2];
  _QWORD v73[4];

  v73[2] = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableABCStateDump, "objectForKeyedSubscript:", CFSTR("SOD-Lookups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[MPServerObjectDatabase valueForKey:](self->_sod, "valueForKey:", CFSTR("database"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = CFSTR("object-resolution");
    objc_msgSend(v4, "statementWithString:error:", CFSTR("SELECT * FROM objects WHERE identifier = @identifier"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = CFSTR("related-identifiers");
    v73[0] = v5;
    v42 = v4;
    objc_msgSend(v4, "statementWithString:error:", CFSTR("SELECT * FROM object_relationships WHERE parent_identifier = @identifier"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v33 = v3;
    obj = v3;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v37)
    {
      v35 = *(_QWORD *)v65;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(obj);
          v40 = v7;
          v8 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v7);
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifiers"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v8;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reason"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v41 = v9;
          v46 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          if (v46)
          {
            v43 = *(_QWORD *)v61;
            v44 = v10;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v61 != v43)
                  objc_enumerationMutation(v41);
                v48 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v11);
                v49 = v11;
                objc_msgSend(v10, "bindStringValue:toParameterNamed:");
                objc_msgSend(v42, "resultsForStatement:", v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "columnCount");
                objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (v13 >= 1)
                {
                  for (i = 0; i != v13; ++i)
                  {
                    objc_msgSend(v12, "columnNameAtIndex:", i);
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "addObject:", v16);

                  }
                }
                v47 = v14;
                objc_msgSend(v51, "addObject:", v14);
                v58 = 0u;
                v59 = 0u;
                v56 = 0u;
                v57 = 0u;
                v50 = v12;
                v17 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v57;
                  do
                  {
                    for (j = 0; j != v18; ++j)
                    {
                      if (*(_QWORD *)v57 != v19)
                        objc_enumerationMutation(v50);
                      v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
                      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v13);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v13 >= 1)
                      {
                        for (k = 0; k != v13; ++k)
                        {
                          objc_msgSend(v21, "objectValueAtColumnIndex:", k);
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v24, "description");
                          v25 = objc_claimAutoreleasedReturnValue();
                          v26 = (void *)v25;
                          if (v25)
                            v27 = (const __CFString *)v25;
                          else
                            v27 = CFSTR("<null>");
                          objc_msgSend(v22, "addObject:", v27);

                        }
                      }
                      objc_msgSend(v51, "addObject:", v22);

                    }
                    v18 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
                  }
                  while (v18);
                }

                objc_msgSend(v45, "setObject:forKeyedSubscript:", v51, v48);
                v10 = v44;
                objc_msgSend(v44, "reset");

                v11 = v49 + 1;
              }
              while (v49 + 1 != v46);
              v46 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
            }
            while (v46);
          }

          objc_msgSend(v39, "setObject:forKeyedSubscript:", v45, CFSTR("databaseResults"));
          v7 = v40 + 1;
        }
        while (v40 + 1 != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v37);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v36, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v53;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v53 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * m), "invalidate");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
      }
      while (v30);
    }

    v3 = v33;
  }

}

- (id)_playlistEntryForObject:(id)a3 containerUniqueID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  SEL v32;
  _QWORD v33[4];
  id v34;
  MPCModelStorePlaybackItemsRequestAccumulator *v35;
  SEL v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke;
  v39[3] = &unk_24CAB8A40;
  v11 = v8;
  v40 = v11;
  v12 = (void *)objc_msgSend(v9, "copyWithSource:block:", CFSTR("Accumulator-PlaylistEntry"), v39);
  v13 = (void *)objc_msgSend(v7, "copyWithIdentifiers:", v12);

  objc_msgSend(v13, "identifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isPlaceholder"))
  {
    v15 = objc_msgSend(v13, "type");

    if (!v15)
    {
      v16 = v13;
      goto LABEL_9;
    }
  }
  else
  {

  }
  v32 = a2;
  objc_msgSend(v7, "identifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "modelKind");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v13;
  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDDC950];
    v41[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "kindWithKinds:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDC958], "identityKind");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = objc_alloc(MEMORY[0x24BDDC758]);
  v37[0] = v10;
  v37[1] = 3221225472;
  v37[2] = __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_2;
  v37[3] = &unk_24CAB8A40;
  v38 = v11;
  v23 = (void *)objc_msgSend(v22, "initWithSource:modelKind:block:", CFSTR("Accumulator-PlaylistEntry"), v21, v37);
  objc_msgSend(v7, "identifiers");
  v24 = v10;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "unionSet:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDDC890];
  v28 = objc_alloc(MEMORY[0x24BDDC950]);
  v33[0] = v24;
  v33[1] = 3221225472;
  v33[2] = __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_3;
  v33[3] = &unk_24CAB1F80;
  v35 = self;
  v36 = v32;
  v34 = v7;
  v29 = (void *)objc_msgSend(v28, "initWithIdentifiers:block:", v26, v33);
  objc_msgSend(v27, "genericObjectWithModelObject:", v29);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v13 = v31;
LABEL_9:

  return v16;
}

- (void)_resolveContentDescriptorsUsingServerObjectDatabase
{
  void *v4;
  void *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *pendingStoreIDs;
  NSMutableArray *v8;
  NSMutableArray *pendingCollectionItemMetadataRequests;
  NSMutableArray *v10;
  NSMutableArray *pendingCollectionItemTokenRenewalRequests;
  NSMutableArray *v12;
  NSMutableArray *pendingCollectionItemAuthorizationTokenRequests;
  NSMutableArray *v14;
  NSMutableArray *pendingCollectionMetadataRequests;
  NSMutableDictionary *v16;
  NSMutableDictionary *sectionIndexToTokenRenewalRequestMap;
  NSMutableDictionary *v18;
  NSMutableDictionary *sectionIndexToCollectionItemMetadataRequestMap;
  NSMutableDictionary *v20;
  NSMutableDictionary *sectionIndexToCollectionItemAuthTokenRequestMap;
  NSMutableDictionary *v22;
  NSMutableDictionary *storeIDToCollectionMetadataRequestMap;
  uint64_t v24;
  MPMutableSectionedCollection *progressiveContentDescriptors;
  id v26;
  MPMutableSectionedCollection *v27;
  id v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  MPMutableSectionedCollection *v41;
  void *v42;
  uint64_t j;
  MPMutableSectionedCollection *v44;
  void *v45;
  uint64_t v46;
  NSMutableOrderedSet *v47;
  void *v48;
  SEL v49;
  void *v50;
  id obj;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[6];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  id v65;
  SEL v66;
  _QWORD v67[5];
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (!self->_accumulationError)
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    pendingStoreIDs = self->_pendingStoreIDs;
    self->_pendingStoreIDs = v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    pendingCollectionItemMetadataRequests = self->_pendingCollectionItemMetadataRequests;
    self->_pendingCollectionItemMetadataRequests = v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    pendingCollectionItemTokenRenewalRequests = self->_pendingCollectionItemTokenRenewalRequests;
    self->_pendingCollectionItemTokenRenewalRequests = v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    pendingCollectionItemAuthorizationTokenRequests = self->_pendingCollectionItemAuthorizationTokenRequests;
    self->_pendingCollectionItemAuthorizationTokenRequests = v12;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    pendingCollectionMetadataRequests = self->_pendingCollectionMetadataRequests;
    self->_pendingCollectionMetadataRequests = v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sectionIndexToTokenRenewalRequestMap = self->_sectionIndexToTokenRenewalRequestMap;
    self->_sectionIndexToTokenRenewalRequestMap = v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sectionIndexToCollectionItemMetadataRequestMap = self->_sectionIndexToCollectionItemMetadataRequestMap;
    self->_sectionIndexToCollectionItemMetadataRequestMap = v18;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sectionIndexToCollectionItemAuthTokenRequestMap = self->_sectionIndexToCollectionItemAuthTokenRequestMap;
    self->_sectionIndexToCollectionItemAuthTokenRequestMap = v20;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    storeIDToCollectionMetadataRequestMap = self->_storeIDToCollectionMetadataRequestMap;
    self->_storeIDToCollectionMetadataRequestMap = v22;

    v24 = MEMORY[0x24BDAC760];
    progressiveContentDescriptors = self->_progressiveContentDescriptors;
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke;
    v67[3] = &unk_24CAB1FA8;
    v67[4] = self;
    v26 = v4;
    v68 = v26;
    -[MPMutableSectionedCollection replaceSectionsUsingBlock:](progressiveContentDescriptors, "replaceSectionsUsingBlock:", v67);
    if (!self->_accumulationError)
    {
      v27 = self->_progressiveContentDescriptors;
      v64[0] = v24;
      v64[1] = 3221225472;
      v64[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_85;
      v64[3] = &unk_24CAB1FD0;
      v64[4] = self;
      v28 = v5;
      v65 = v28;
      v66 = a2;
      -[MPMutableSectionedCollection replaceItemsUsingBlock:](v27, "replaceItemsUsingBlock:", v64);
      if (!self->_accumulationError)
      {
        v49 = a2;
        v50 = v5;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        obj = v28;
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v54)
        {
          v29 = 0;
          v52 = *(_QWORD *)v61;
          v53 = v26;
          do
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v61 != v52)
                objc_enumerationMutation(obj);
              v31 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v31, "item", v49), objc_msgSend(v31, "section") + v29);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = -[MPMutableSectionedCollection numberOfItemsInSection:](self->_progressiveContentDescriptors, "numberOfItemsInSection:", objc_msgSend(v32, "section"));
              -[MPMutableSectionedCollection itemAtIndexPath:](self->_progressiveContentDescriptors, "itemAtIndexPath:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v31, "item");
              v36 = objc_msgSend(v32, "section");
              v37 = v36;
              v57 = v32;
              v58 = v29;
              if (v35)
              {
                v37 = v36 + 1;
                -[MPMutableSectionedCollection insertSection:atIndex:](self->_progressiveContentDescriptors, "insertSection:atIndex:", v34, v36 + 1);
                v55 = 1;
              }
              else
              {
                -[MPMutableSectionedCollection replaceSectionAtIndex:withObject:](self->_progressiveContentDescriptors, "replaceSectionAtIndex:withObject:", objc_msgSend(v32, "section"), v34);
                v55 = 0;
              }
              v56 = v34;
              objc_msgSend(v34, "identifiers");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "preferredStoreStringIdentifierForPersonID:", self->_personID);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSMutableOrderedSet addObject:](self->_pendingStoreIDs, "addObject:", v39);
              -[MPMutableSectionedCollection removeItemAtIndexPath:](self->_progressiveContentDescriptors, "removeItemAtIndexPath:", v31);

              v40 = v33 + ~objc_msgSend(v31, "item");
              if (v40 < 1)
              {
                v26 = v53;
                v46 = v55;
              }
              else
              {
                v41 = self->_progressiveContentDescriptors;
                objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[MPMutableSectionedCollection insertSection:atIndex:](v41, "insertSection:atIndex:", v42, v37 + 1);

                for (j = 0; j != v40; ++j)
                {
                  v44 = self->_progressiveContentDescriptors;
                  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", j, v37 + 1);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MPMutableSectionedCollection moveItemFromIndexPath:toIndexPath:](v44, "moveItemFromIndexPath:toIndexPath:", v31, v45);

                }
                v46 = v55 + 1;
                v26 = v53;
              }
              objc_msgSend(v26, "shiftIndexesStartingAtIndex:by:", v37, v46);
              objc_msgSend(v26, "addIndex:", v37);
              v29 = v46 + v58;

            }
            v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          }
          while (v54);
        }

        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_3;
        v59[3] = &unk_24CAB1FF8;
        v59[4] = self;
        v59[5] = v49;
        objc_msgSend(v26, "enumerateIndexesUsingBlock:", v59);
        v47 = self->_pendingStoreIDs;
        _MPCSPIRCopyFailedStoreIDs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet minusSet:](v47, "minusSet:", v48);

        v5 = v50;
      }

    }
  }
}

- (id)_serverObjectFromPlaceholderContentDescriptor:(id)a3 propertySet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  MPCModelStorePlaybackItemsRequestAccumulator *v29;

  v7 = a3;
  if (_NSIsNSString())
  {
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x24BDDC758]);
    objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke;
    v27 = &unk_24CAB4110;
    v28 = v8;
    v29 = self;
    v11 = v8;
    v12 = (void *)objc_msgSend(v9, "initWithSource:modelKind:block:", CFSTR("Accumulator-SODLookup"), v10, &v24);

    v13 = 0;
    if (v12)
      goto LABEL_3;
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_13;
  }
  v13 = v7;
  objc_msgSend(v13, "identifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isPlaceholder");

  if (!v22)
  {
    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v13, "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_13;
LABEL_3:
  -[MPServerObjectDatabase modelObjectMatchingIdentifierSet:propertySet:error:](self->_sod, "modelObjectMatchingIdentifierSet:propertySet:error:", v12, self->_requestPropertySet, a5, v24, v25, v26, v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mutableABCStateDump)
  {
    objc_msgSend(v12, "personalizedStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "length"))
    {
      v17 = (id)*MEMORY[0x24BEC8730];

      v16 = v17;
    }
    objc_msgSend(v12, "prioritizedStoreStringIdentifiersForPersonID:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("object-resolution"), CFSTR("reason"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("personID"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("identifiers"));
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableABCStateDump, "objectForKeyedSubscript:", CFSTR("SOD-Lookups"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v19);

  }
LABEL_14:

  return v14;
}

- (id)_mergedObjectWithRequestedObjectIfNeeded:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && self->_requestUsesSectionedModelObjects)
  {
    v9 = objc_msgSend(v7, "length");
    -[MPCModelStorePlaybackItemsRequest sectionedModelObjects](self->_request, "sectionedModelObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 == 1)
      objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v8, "indexAtPosition:", 0));
    else
      objc_msgSend(v10, "itemAtIndexPath:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "type") == 5)
    {
      objc_msgSend(v14, "playlistEntry");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v6, "anyObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        if (!v18)
          v18 = (objc_class *)objc_opt_class();

        v19 = [v18 alloc];
        objc_msgSend(v14, "identifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v19, "initWithIdentifiers:", v20);

      }
      objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v16);
      v21 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v21;
    }
    objc_msgSend(v14, "mergeWithObject:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v22;
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

- (id)_userIdentityWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "playbackRequestEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "storeAccountID");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BEC8A58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specificAccountWithDSID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identityAllowingDelegation:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "playbackRequestEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)_isFatalError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BDD1308]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code");

    objc_msgSend(v4, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BEC8580]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "code");

    if (v8 == -7100 || v8 == -7003 || v8 == -7007)
      LOBYTE(v11) = 0;
    else
      v11 = ((unint64_t)(v6 + 1009) > 0xA) | (0x2FEu >> (v6 - 15));
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11 & 1;
}

- (NSDictionary)equivalencyMapping
{
  return &self->_equivalencyMapping->super;
}

- (NSError)accumulationError
{
  return self->_accumulationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulationError, 0);
  objc_storeStrong((id *)&self->_mutableABCStateDump, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_progressiveContentDescriptors, 0);
  objc_storeStrong((id *)&self->_pendingCollectionItemAuthorizationTokenRequests, 0);
  objc_storeStrong((id *)&self->_pendingCollectionItemTokenRenewalRequests, 0);
  objc_storeStrong((id *)&self->_pendingCollectionItemMetadataRequests, 0);
  objc_storeStrong((id *)&self->_pendingCollectionMetadataRequests, 0);
  objc_storeStrong((id *)&self->_storeIDToCollectionMetadataRequestMap, 0);
  objc_storeStrong((id *)&self->_sectionIndexToTokenRenewalRequestMap, 0);
  objc_storeStrong((id *)&self->_sectionIndexToCollectionItemAuthTokenRequestMap, 0);
  objc_storeStrong((id *)&self->_sectionIndexToCollectionItemMetadataRequestMap, 0);
  objc_storeStrong((id *)&self->_pendingStoreIDs, 0);
  objc_storeStrong((id *)&self->_equivalencyMapping, 0);
  objc_storeStrong((id *)&self->_importResults, 0);
  objc_storeStrong((id *)&self->_requestPropertySet, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_sod, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_2;
  v12[3] = &unk_24CAB89F0;
  v13 = *(id *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_3;
  v10[3] = &unk_24CAB8A18;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setRadioIdentifiersWithBlock:", v10);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_4;
  v8[3] = &unk_24CAB89A8;
  v9 = v6;
  objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v7, v8);

}

void __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v3, "longLongValue"));
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(v4, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(v4, "setGlobalPlaylistID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setUniversalCloudLibraryID:", *(_QWORD *)(a1 + 32));

}

uint64_t __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStationStringID:", *(_QWORD *)(a1 + 32));
}

void __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "longLongValue"));

}

id __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  v7 = v6[5];
  v24 = 0;
  objc_msgSend(v6, "_serverObjectFromPlaceholderContentDescriptor:propertySet:error:", v5, v7, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 69, v9, CFSTR("Found non-playable section: %@"), v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 192);
    *(_QWORD *)(v11 + 192) = v10;

    v13 = v5;
LABEL_3:

    goto LABEL_4;
  }
  if (v8)
  {
    v15 = objc_msgSend(v8, "type");
    if (v15 > 0xD || ((1 << v15) & 0x2014) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218498;
        v26 = v23;
        v27 = 2114;
        v28 = v13;
        v29 = 2114;
        v30 = v8;
        _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_ERROR, "[PIA] %p using UUID [section object is not a section type] uuid=%{public}@ section=%{public}@", buf, 0x20u);
      }

      goto LABEL_3;
    }
    v17 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_mergedObjectWithRequestedObjectIfNeeded:forIndexPath:", v8, v18);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "numberOfItemsInSection:", a3))
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      objc_msgSend(v13, "identifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredStoreStringIdentifierForPersonID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v21);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "numberOfItemsInSection:", a3))
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    }
    else if (_NSIsNSString())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v5);
    }
    v13 = v5;
  }
LABEL_4:

  return v13;
}

id __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  dispatch_semaphore_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  dispatch_semaphore_t v34;
  id v35;
  _QWORD v36[8];

  v36[6] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[5];
  v35 = 0;
  objc_msgSend(v7, "_serverObjectFromPlaceholderContentDescriptor:propertySet:error:", v5, v8, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_mergedObjectWithRequestedObjectIfNeeded:forIndexPath:", v9, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(v15, "type");
      if (v16 <= 9)
      {
        if (((1 << v16) & 0x260) != 0)
        {
LABEL_11:
          v17 = v15;
          v15 = v17;
LABEL_16:
          v14 = v17;
          goto LABEL_17;
        }
        if (((1 << v16) & 0x14) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
          goto LABEL_11;
        }
        if (v16 == 1)
          goto LABEL_11;
      }
      v18 = dispatch_semaphore_create(0);
      v30 = (void *)MEMORY[0x24BE65C38];
      v29 = *MEMORY[0x24BE65AB0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "description");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v32;
      objc_msgSend(v6, "description");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v31;
      objc_msgSend(v15, "description");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = CFSTR("null");
      if (v19)
        v21 = (const __CFString *)v19;
      v36[2] = v21;
      objc_msgSend(v5, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v28;
      objc_msgSend(v15, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36[4] = v22;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "type"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36[5] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_2;
      v33[3] = &unk_24CABA2D0;
      v34 = v18;
      v25 = v18;
      objc_msgSend(v30, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v29, CFSTR("Bug"), CFSTR("UnplayableObjectInSOD"), CFSTR("progressiveContentDescriptors"), 0, v24, v33);

      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("MPCModelStorePlaybackItemsRequestAccumulator.m"), 791, CFSTR("Found unplayable object in SOD: %@"), v15);

    }
    else if (_NSIsNSString())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v5);
    }
    v17 = v5;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 69, v10, CFSTR("Found non-playable item: %@"), v5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 192);
  *(_QWORD *)(v12 + 192) = v11;

  v14 = v5;
  v15 = v9;
LABEL_17:

  return v14;
}

void __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  dispatch_semaphore_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
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
  uint64_t v61;
  void *v62;
  _QWORD v63[4];
  dispatch_semaphore_t v64;
  id v65;
  id v66;
  _QWORD v67[6];

  v2 = a2;
  v67[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "sectionAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MPCModelStorePlaybackItemsRequestAccumulator.m"), 849, CFSTR("Attempting to populate items for non model object: %@"), v4);

  }
  v5 = objc_msgSend(v4, "type");
  v6 = (id *)MEMORY[0x24BDDBD68];
  if (v5 != 4)
    v6 = (id *)MEMORY[0x24BDDBD60];
  v7 = *v6;
  objc_msgSend(v4, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "relatedIdentifierSetsForParentIdentifierSet:childKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v9;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184))
  {
    objc_msgSend(v8, "personalizedStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "length"))
    {
      v12 = (id)*MEMORY[0x24BEC8730];

      v11 = v12;
    }
    objc_msgSend(v8, "prioritizedStoreStringIdentifiersForPersonID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("related-identifiers"), CFSTR("reason"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("personID"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("identifiers"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", CFSTR("SOD-Lookups"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

    v9 = v62;
  }
  v58 = v8;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v4, "identifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredStoreStringIdentifierForPersonID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", v17);
    v9 = v62;
  }
  v60 = v4;
  if (objc_msgSend(v9, "count"))
  {
    v18 = 0;
    v19 = 0x24BDD1000uLL;
    v56 = *MEMORY[0x24BE65AB0];
    v57 = (void *)*MEMORY[0x24BEC8730];
    v61 = v2;
    do
    {
      objc_msgSend(*(id *)(v19 + 1496), "indexPathForItem:inSection:", v18, v2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 24);
      v24 = *(_QWORD *)(v22 + 40);
      v66 = 0;
      objc_msgSend(v23, "modelObjectMatchingIdentifierSet:propertySet:error:", v21, v24, &v66);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v66;
      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 69, v26, CFSTR("Found non-playable item: %@"), v21);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(void **)(v28 + 192);
        *(_QWORD *)(v28 + 192) = v27;
      }
      else
      {
        v30 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v30 + 184))
        {
          objc_msgSend(v21, "personalizedStore");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "personID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v32, "length"))
          {
            v33 = v57;

            v32 = v33;
          }
          objc_msgSend(v21, "prioritizedStoreStringIdentifiersForPersonID:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", CFSTR("object-resolution"), CFSTR("reason"));
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v32, CFSTR("personID"));
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("identifiers"));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", CFSTR("SOD-Lookups"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v35);

          v30 = *(_QWORD *)(a1 + 32);
          v2 = v61;
          v9 = v62;
          v19 = 0x24BDD1000;
        }
        objc_msgSend(v21, "preferredStoreStringIdentifierForPersonID:", *(_QWORD *)(v30 + 32));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v37 = objc_msgSend(v25, "type");
          if (v37 > 9 || ((1 << v37) & 0x242) == 0)
          {
            v39 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
            v65 = 0;
            objc_msgSend(v39, "payloadDataForIdentifierSet:outError:", v21, &v65);
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = v65;
            v54 = (void *)v40;
            v55 = v41;
            if (v41)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v41);
              v42 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v42 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v40, 4);
            }
            v43 = v42;
            v53 = (void *)v42;
            v44 = dispatch_semaphore_create(0);
            v50 = (void *)MEMORY[0x24BE65C38];
            objc_msgSend(v9, "description");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v67[0] = v52;
            objc_msgSend(v21, "description");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v67[1] = v51;
            objc_msgSend(v25, "description");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v67[2] = v45;
            v67[3] = v43;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 4);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v63[0] = MEMORY[0x24BDAC760];
            v63[1] = 3221225472;
            v63[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_4;
            v63[3] = &unk_24CABA2D0;
            v64 = v44;
            v47 = v44;
            objc_msgSend(v50, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v56, CFSTR("Bug"), CFSTR("UnplayableObjectInSOD"), CFSTR("childIdentifierSets"), 0, v46, v63);

            dispatch_semaphore_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MPCModelStorePlaybackItemsRequestAccumulator.m"), 918, CFSTR("Found unplayable object in SOD: %@"), v25);

            v9 = v62;
            v2 = v61;
            v19 = 0x24BDD1000;
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "insertItem:atIndexPath:", v25, v20);
          }
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "insertItem:atIndexPath:", v29, v20);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v29);
        }
      }

      if (v26)
        break;
      ++v18;
    }
    while (v18 < objc_msgSend(v9, "count"));
  }

}

intptr_t __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContainerUniqueID:", *(_QWORD *)(a1 + 32));
}

uint64_t __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContainerUniqueID:", *(_QWORD *)(a1 + 32));
}

void __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "type");
  switch(v3)
  {
    case 9:
      objc_msgSend(*(id *)(a1 + 32), "movie");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMovie:", v4);
      break;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTvEpisode:", v4);
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "song");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSong:", v4);
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("MPCModelStorePlaybackItemsRequestAccumulator.m"), 700, CFSTR("Unknown playlist entry: %@"), *(_QWORD *)(a1 + 32));
      break;
  }

}

void __68__MPCModelStorePlaybackItemsRequestAccumulator__eligibilityForItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "movie");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __75__MPCModelStorePlaybackItemsRequestAccumulator_newStoreItemMetadataRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (_NSIsNSString())
  {
    v3 = v9;
    if (!v3)
      goto LABEL_9;
LABEL_6:
    v5 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v3);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v6);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredStoreStringIdentifierForPersonID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_6;
LABEL_9:

}

void __65__MPCModelStorePlaybackItemsRequestAccumulator_accumulatorResult__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "sectionAtIndex:", objc_msgSend(v13, "section"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_5;
  }
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  objc_msgSend(v7, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPlaceholder");

  if (v9)
  {
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_11;
  }
LABEL_5:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "itemAtIndexPath:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v10, "identifiers"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isPlaceholder"),
        v11,
        v12))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

LABEL_11:
}

void __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t v32;
  BOOL v33;

  v28 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 16))
      goto LABEL_4;
    v6 = (void *)MEMORY[0x24BDDC890];
    objc_msgSend(*(id *)(v5 + 8), "sectionedModelObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "genericObjectWithModelObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copyWithPropertySet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

    if (!v10)
    {
LABEL_4:
      v11 = objc_alloc(MEMORY[0x24BDDC890]);
      objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "initWithIdentifiers:block:", v12, &__block_literal_global_1782);
LABEL_8:

    }
  }
  else
  {
    v10 = v28;
    if (_NSIsNSString())
    {
      v13 = *(_QWORD *)(a1 + 32);
      v10 = v28;
      if (*(_BYTE *)(v13 + 16))
      {
        objc_msgSend(*(id *)(v13 + 8), "sectionedModelObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sectionAtIndex:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "identifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copyWithSource:block:", CFSTR("Accumulator-SectionPlaceholder"), &__block_literal_global_25);
        v17 = (void *)objc_msgSend(v12, "copyWithIdentifiers:", v16);

        objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v18, "copyWithPropertySet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

        goto LABEL_8;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(v10, "copyWithPropertySet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC58]), "initWithModel:personalizationStyle:", v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(*(id *)(a1 + 40), "appendSection:", v20);
    v21 = objc_msgSend(v19, "type");
    v22 = v21 == 4;
    if (v21 == 4)
    {
      objc_msgSend(MEMORY[0x24BDD14E0], "setWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "numberOfItemsInSection:", a3));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(a1 + 40);
    v26 = *(void **)(v24 + 168);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_4;
    v29[3] = &unk_24CAB1EB8;
    v32 = a3;
    v33 = v22;
    v29[4] = v24;
    v30 = v23;
    v31 = v25;
    v27 = v23;
    objc_msgSend(v26, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v29);

    v10 = v19;
  }

}

void __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  _BYTE *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[4];
  _QWORD v36[3];
  char v37;
  _BYTE buf[32];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (_NSIsNSString())
  {
    v6 = v5;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
    {
      _MPCSPIRCopyFailedStoreIDs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v5);

      if (v8)
      {
        v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v5;
          _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "[PIA] %p skipping item [store lookup failed] itemID=%{public}@", buf, 0x16u);
        }
        v6 = v5;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sectionedModelObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "itemAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copyWithSource:block:", CFSTR("Accumulator-ItemPlaceholder"), &__block_literal_global_32);
      v6 = (void *)objc_msgSend(v14, "copyWithIdentifiers:propertySet:", v16, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_eligibilityForItem:", v6) & 1) != 0)
    {
      v20 = v17;
      if (*(_BYTE *)(a1 + 64) && objc_msgSend(v6, "type") != 5)
      {
        v21 = v6;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        *(_QWORD *)&buf[24] = 8;
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x2020000000;
        v37 = 0;
        v35[0] = 0;
        v35[1] = v35;
        v35[2] = 0x2020000000;
        v35[3] = 3;
        v22 = (void *)MEMORY[0x24BDDC928];
        v27 = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_2_34;
        v30 = &unk_24CAB1F58;
        v23 = v21;
        v31 = v23;
        v32 = buf;
        v33 = v36;
        v34 = v35;
        objc_msgSend(v22, "performWithoutEnforcement:", &v27);
        objc_msgSend(v23, "identifiers", v27, v28, v29, v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        MPContainerUniqueIDPrefix();
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        MEMORY[0x212BD17DC](v25, objc_msgSend(*(id *)(a1 + 40), "countForObject:", v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v25);
        objc_msgSend(*(id *)(a1 + 32), "_playlistEntryForObject:containerUniqueID:", v23, v26);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(v35, 8);
        _Block_object_dispose(v36, 8);
        _Block_object_dispose(buf, 8);

      }
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDDCC58]), "initWithModel:personalizationStyle:", v6, v20);
      objc_msgSend(*(id *)(a1 + 48), "appendItem:", v9);
    }
    else
    {
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(unsigned __int8 *)(v18 + 56);
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v19;
        *(_WORD *)&buf[18] = 2114;
        *(_QWORD *)&buf[20] = v6;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[PIA] %p skipping item [not eligible] allowExplicitContent=%{BOOL}u item=%{public}@ ", buf, 0x1Cu);
      }
    }
    goto LABEL_16;
  }
LABEL_17:

}

void __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_2_34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  switch(v2)
  {
    case 9:
      objc_msgSend(*(id *)(a1 + 32), "movie");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "isLibraryAdded");

      objc_msgSend(*(id *)(a1 + 32), "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "isLibraryAdded");

      objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "song");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "cloudStatus");

      objc_msgSend(*(id *)(a1 + 32), "song");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "isLibraryAdded");

      objc_msgSend(*(id *)(a1 + 32), "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return;
  }
  v9 = v5;
  objc_msgSend(v5, "storeAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "endpointType");

}

uint64_t __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_31(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaceholder:", 1);
}

uint64_t __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaceholder:", 1);
}

void __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalCloudLibraryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  objc_msgSend(v5, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredStoreStringIdentifierForPersonID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modelKind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identityKind");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC8B0], "identityKind");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v15)
  {

LABEL_8:
    v18 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v5, "identifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "opaqueID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithUUIDString:", v20);

    if (v21)
    {
LABEL_15:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "appendSection:", v21);

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v30 = v23;
      v31 = 2114;
      v32 = v21;
      v33 = 2114;
      v34 = v5;
      v24 = "[PIA] %p using UUID [section is Group, but opaqueID was not a valid UUID] uuid=%{public}@ section=%{public}@";
LABEL_13:
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);
    }
LABEL_14:

    goto LABEL_15;
  }
  v16 = v15;
  v17 = objc_msgSend(v14, "isEqual:", v15);

  if ((v17 & 1) != 0)
    goto LABEL_8;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v30 = v25;
      v31 = 2114;
      v32 = v21;
      v33 = 2114;
      v34 = v5;
      v24 = "[PIA] %p using UUID [section object has no preferred storeID] uuid=%{public}@ section=%{public}@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "appendSection:", v11);
LABEL_16:
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke_12;
  v27[3] = &unk_24CAB4050;
  v26 = *(void **)(a1 + 40);
  v28 = *(id *)(a1 + 32);
  objc_msgSend(v26, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v27);

}

void __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalCloudLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  objc_msgSend(v3, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredStoreStringIdentifierForPersonID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "appendItem:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 134218498;
      v14 = v12;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[PIA] %p using UUID [item object has no preferred storeID] uuid=%{public}@ item=%{public}@", (uint8_t *)&v13, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "appendItem:", v10);
  }

}

@end
