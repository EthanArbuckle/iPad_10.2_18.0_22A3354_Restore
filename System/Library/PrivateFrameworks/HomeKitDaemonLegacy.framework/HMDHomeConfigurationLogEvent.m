@implementation HMDHomeConfigurationLogEvent

- (void)setHomeConfigurationBitMasks
{
  self->_homeCategoryBitMask = 0;
  self->_appleMediaCategoryBitMask = 0;
  self->_thirdPartyMediaCategoryBitMask = 0;
  self->_homeCategoryBitMask |= 1uLL;
  if (-[HMDHomeConfigurationLogEvent numSmartHomeAccessories](self, "numSmartHomeAccessories"))
    self->_homeCategoryBitMask |= 8uLL;
  if (-[HMDHomeConfigurationLogEvent numThirdPartyMediaAccessories](self, "numThirdPartyMediaAccessories"))
  {
    self->_homeCategoryBitMask |= 2uLL;
    if (-[HMDHomeConfigurationLogEvent numTelevisionServiceAccessories](self, "numTelevisionServiceAccessories"))
      self->_thirdPartyMediaCategoryBitMask |= 1uLL;
    if (-[HMDHomeConfigurationLogEvent numThirdPartyAudioAccessories](self, "numThirdPartyAudioAccessories"))
      self->_thirdPartyMediaCategoryBitMask |= 2uLL;
  }
  if (-[HMDHomeConfigurationLogEvent numAppleMediaAccessories](self, "numAppleMediaAccessories"))
  {
    self->_homeCategoryBitMask |= 4uLL;
    if (-[HMDHomeConfigurationLogEvent numAppleTVAccessories](self, "numAppleTVAccessories"))
      self->_appleMediaCategoryBitMask |= 1uLL;
    if (-[HMDHomeConfigurationLogEvent numHomePods](self, "numHomePods")
      || -[HMDHomeConfigurationLogEvent numHomePodMinis](self, "numHomePodMinis")
      || -[HMDHomeConfigurationLogEvent numHomePod2ndGen](self, "numHomePod2ndGen"))
    {
      self->_appleMediaCategoryBitMask |= 2uLL;
    }
  }
}

- (int64_t)daysSinceDate:(id)a3 trimAtMaximumValue:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;

  if (!a3)
    return -1;
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  objc_msgSend(v5, "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  v10 = (uint64_t)v9 / 0x15180uLL;
  if ((uint64_t)v9 < 0)
    v10 = -1;
  if (v10 >= a4)
    v11 = a4;
  else
    v11 = v10;
  if (a4)
    return v11;
  else
    return v10;
}

- (int64_t)weeksSinceDate:(id)a3 trimAtMaximumValue:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;

  v5 = -[HMDHomeConfigurationLogEvent daysSinceDate:trimAtMaximumValue:](self, "daysSinceDate:trimAtMaximumValue:", a3, 0);
  if ((v5 & 0x8000000000000000) != 0)
    return -1;
  if (v5)
    v6 = (int)(v5 / 7 + 1);
  else
    v6 = 0;
  if (v6 >= a4)
    v8 = a4;
  else
    v8 = v6;
  if (a4)
    return v8;
  else
    return v6;
}

- (HMDHomeConfigurationLogEvent)initWithHome:(id)a3 configuredWidgetsCount:(int64_t)a4
{
  return -[HMDHomeConfigurationLogEvent initWithDataSource:home:configuredWidgetsCount:](self, "initWithDataSource:home:configuredWidgetsCount:", a3, a3, a4);
}

- (HMDHomeConfigurationLogEvent)initWithDataSource:(id)a3 home:(id)a4 configuredWidgetsCount:(int64_t)a5
{
  void *v8;
  HMDHomeConfigurationLogEvent *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  uint64_t v25;
  NSNumber *numBSPs;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  HMDAnalyticsMultiUserSettings *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSArray *multiUserSettings;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  HMDAnalyticsHAPServiceData *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  HMDAnalyticsHAPServiceData *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t n;
  HMDAnalyticsHAPServiceData *v66;
  uint64_t v67;
  NSArray *hapServices;
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
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  HMDAnalyticsEventTriggerData *v89;
  uint64_t v90;
  uint64_t ii;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t jj;
  uint64_t v97;
  NSArray *eventTriggers;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t kk;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  HMDHomeConfigurationLogEvent *v111;
  uint64_t v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id obj;
  _BOOL4 v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  uint64_t v130;
  unsigned int v131;
  void *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  objc_super v169;
  _QWORD v170[5];
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t (*v174)(uint64_t, uint64_t);
  void (*v175)(uint64_t);
  id v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  uint64_t v191;

  v191 = *MEMORY[0x1E0C80C00];
  v119 = a3;
  v120 = a4;
  objc_msgSend(v119, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v169.receiver = self;
  v169.super_class = (Class)HMDHomeConfigurationLogEvent;
  v9 = -[HMMHomeLogEvent initWithHomeUUID:](&v169, sel_initWithHomeUUID_, v8);

  if (v9)
  {
    v9->_numConfiguredWidgets = a5;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v127 = (id)objc_claimAutoreleasedReturnValue();
    v9->_isCurrentDeviceResidentEnabled = 0;
    objc_msgSend(v119, "enabledResidents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numResidentsEnabled = objc_msgSend(v10, "count");
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v165, v189, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v166;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v166 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
          v9->_enabledResidentsDeviceCapabilities |= objc_msgSend(v14, "legacyResidentCapabilities");
          if (objc_msgSend(v14, "isCurrentDevice"))
            v9->_isCurrentDeviceResidentEnabled = 1;
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v165, v189, 16);
      }
      while (v11);
    }

    v9->_isResidentAvailable = objc_msgSend(v120, "_residentDeviceAvailable");
    v9->_isResidentFirstEnabled = objc_msgSend(v119, "isResidentFirstAccessoryCommunicationEnabled");
    objc_msgSend(v120, "residentDeviceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isResidentElectionV2Enabled = objc_msgSend(v15, "isResidentElectionV2Enabled");

    objc_msgSend(v119, "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "capabilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isCurrentDeviceResidentCapable = objc_msgSend(v16, "isResidentCapable");

    objc_msgSend(v120, "primaryResident");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isCurrentDevicePrimaryResident = objc_msgSend(v18, "isEqual:", v118);

    v9->_primaryReportingDevice = objc_msgSend(v120, "awdPrimaryReportingDevice");
    v9->_isCurrentDeviceLocalToHome = objc_msgSend(v120, "homeLocation") == 1;
    v9->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = objc_msgSend(v120, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
    objc_msgSend(v120, "availableBorderRouters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numThreadBorderRouters = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v119, "triggerOwnedActionSets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numTriggerOwnedConfiguredScenes = objc_msgSend(v20, "count");

    objc_msgSend(v119, "actionSets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numScenes = objc_msgSend(v21, "count");

    objc_msgSend(v120, "rooms");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numRooms = objc_msgSend(v22, "count") + 1;

    objc_msgSend(v120, "zones");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numZones = objc_msgSend(v23, "count");

    objc_msgSend(v120, "serviceGroups");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numAccessoryServiceGroups = objc_msgSend(v24, "count");

    objc_msgSend(v120, "availableBSPsCount");
    v25 = objc_claimAutoreleasedReturnValue();
    numBSPs = v9->_numBSPs;
    v9->_numBSPs = (NSNumber *)v25;

    v131 = objc_msgSend(v120, "isOwnerUser");
    if ((objc_msgSend(v120, "networkRouterSupport") & 1) != 0)
    {
      v27 = objc_msgSend(v120, "protectionMode");
      v125 = v27 == 1;
      v28 = v131;
      if (v27 != 1)
        v28 = 0;
      if (v28 == 1)
      {
        v9->_networkProtectionStatus = 2;
        v125 = 1;
      }
    }
    else
    {
      v125 = 0;
    }
    v9->_userPrivilegeBitMask = 0;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    objc_msgSend(v119, "users");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v161, v188, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v162;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v162 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v32);
          if ((objc_msgSend(v33, "isRemoteGateway") & 1) == 0)
          {
            v34 = objc_msgSend(v33, "privilege");
            v35 = 8;
            v36 = 2;
            switch(v34)
            {
              case 1:
                goto LABEL_25;
              case 2:
                v36 = 4;
LABEL_25:
                v9->_userPrivilegeBitMask |= v36;
                goto LABEL_29;
              case 3:
                goto LABEL_27;
              case 4:
                v35 = 16;
LABEL_27:
                v9->_userPrivilegeBitMask |= v35;
                goto LABEL_28;
              default:
                v9->_userPrivilegeBitMask |= 1uLL;
                if ((unint64_t)(v34 - 3) > 1)
                  goto LABEL_29;
LABEL_28:
                ++v9->_numAdmins;
LABEL_29:
                ++v9->_numUsers;
                objc_msgSend(v33, "accessCode");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (v37)
                  ++v9->_ownerPerspectiveNumUsersWithAccessCode;
                break;
            }
          }
          ++v32;
        }
        while (v30 != v32);
        v38 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v161, v188, 16);
        v30 = v38;
      }
      while (v38);
    }

    objc_msgSend(v119, "users");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v122 = v39;
    v41 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v177, v190, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v178;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v178 != v42)
            objc_enumerationMutation(v122);
          v44 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * j);
          v45 = objc_alloc_init(HMDAnalyticsMultiUserSettings);
          -[HMDAnalyticsMultiUserSettings setIsOwner:](v45, "setIsOwner:", objc_msgSend(v44, "isCurrentUser"));
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAnalyticsMultiUserSettings setMultiUserSettingsValuesByKeyPaths:](v45, "setMultiUserSettingsValuesByKeyPaths:", v46);

          objc_msgSend(v44, "privateSettingValuesByKeyPath");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v47, "mutableCopy");

          objc_msgSend(v44, "sharedSettingValuesByKeyPath");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addEntriesFromDictionary:", v49);

          if (objc_msgSend(v48, "count"))
          {
            v171 = 0;
            v172 = &v171;
            v173 = 0x3032000000;
            v174 = __Block_byref_object_copy__64693;
            v175 = __Block_byref_object_dispose__64694;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v176 = (id)objc_claimAutoreleasedReturnValue();
            v170[0] = MEMORY[0x1E0C809B0];
            v170[1] = 3221225472;
            v170[2] = ___legacyMultiUserSettings_block_invoke;
            v170[3] = &unk_1E89AD980;
            v170[4] = &v171;
            objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v170);
            v50 = (void *)objc_msgSend((id)v172[5], "copy");
            -[HMDAnalyticsMultiUserSettings setMultiUserSettingsValuesByKeyPaths:](v45, "setMultiUserSettingsValuesByKeyPaths:", v50);

            objc_msgSend(v40, "addObject:", v45);
            _Block_object_dispose(&v171, 8);

          }
        }
        v41 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v177, v190, 16);
      }
      while (v41);
    }

    v51 = objc_msgSend(v40, "copy");
    multiUserSettings = v9->_multiUserSettings;
    v9->_multiUserSettings = (NSArray *)v51;

    v9->_ownerUser = objc_msgSend(v119, "isOwnerUser");
    objc_msgSend(v119, "currentUser");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_currentUserPrivilege = objc_msgSend(v53, "privilege");

    v9->_accessToHomeAllowed = objc_msgSend(v119, "isAccessToHomeAllowed");
    objc_msgSend(v119, "accessories");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numAccessories = objc_msgSend(v54, "count");
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v123 = v54;
    v55 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v157, v187, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v158;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v158 != v56)
            objc_enumerationMutation(v123);
          -[HMDHomeConfigurationLogEvent updateConfigWithAccessory:reportNetworkProtectionMetrics:networkProtectionEnabled:hapServiceTypes:primaryHAPServiceTypes:](v9, "updateConfigWithAccessory:reportNetworkProtectionMetrics:networkProtectionEnabled:hapServiceTypes:primaryHAPServiceTypes:", *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * k), v131, v125, v129, v127);
        }
        v55 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v157, v187, 16);
      }
      while (v55);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v129, "count") + 1);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v129, "count"))
    {
      v58 = -[HMDAnalyticsHAPServiceData initWithServiceType:isPrimary:ownerUser:]([HMDAnalyticsHAPServiceData alloc], "initWithServiceType:isPrimary:ownerUser:", CFSTR("_HomeWithHAPServices_"), 0, v9->_ownerUser);
      objc_msgSend(v132, "addObject:", v58);

    }
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v128 = v127;
    v59 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v153, v186, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v154;
      do
      {
        for (m = 0; m != v59; ++m)
        {
          if (*(_QWORD *)v154 != v60)
            objc_enumerationMutation(v128);
          v62 = -[HMDAnalyticsHAPServiceData initWithServiceType:isPrimary:ownerUser:]([HMDAnalyticsHAPServiceData alloc], "initWithServiceType:isPrimary:ownerUser:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * m), 1, v9->_ownerUser);
          objc_msgSend(v132, "addObject:", v62);

        }
        v59 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v153, v186, 16);
      }
      while (v59);
    }

    objc_msgSend(v129, "minusSet:", v128);
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v126 = v129;
    v63 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v149, v185, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v150;
      do
      {
        for (n = 0; n != v63; ++n)
        {
          if (*(_QWORD *)v150 != v64)
            objc_enumerationMutation(v126);
          v66 = -[HMDAnalyticsHAPServiceData initWithServiceType:isPrimary:ownerUser:]([HMDAnalyticsHAPServiceData alloc], "initWithServiceType:isPrimary:ownerUser:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * n), 0, v9->_ownerUser);
          objc_msgSend(v132, "addObject:", v66);

        }
        v63 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v149, v185, 16);
      }
      while (v63);
    }

    v67 = objc_msgSend(v132, "copy");
    hapServices = v9->_hapServices;
    v9->_hapServices = (NSArray *)v67;

    objc_msgSend(v119, "accessories");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "na_filter:", &__block_literal_global_64697);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numHomePodMinis = objc_msgSend(v70, "count");

    objc_msgSend(v119, "accessories");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "na_filter:", &__block_literal_global_10_64698);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numHomePod2ndGen = objc_msgSend(v72, "count");

    objc_msgSend(v119, "accessories");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "na_filter:", &__block_literal_global_11_64699);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numHomePods = objc_msgSend(v74, "count");

    objc_msgSend(v120, "mediaSystems");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numMediaSystems = objc_msgSend(v75, "count");

    objc_msgSend(v120, "mediaSystems");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "na_filter:", &__block_literal_global_13_64700);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numHomePodMiniStereoPairs = objc_msgSend(v77, "count");

    objc_msgSend(v120, "mediaSystems");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "na_filter:", &__block_literal_global_15_64701);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numHomePod2ndGenStereoPairs = objc_msgSend(v79, "count");

    objc_msgSend(v120, "mediaSystems");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "na_filter:", &__block_literal_global_17_64702);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numHomePodStereoPairs = objc_msgSend(v81, "count");

    objc_msgSend(v119, "triggers");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numTriggers += objc_msgSend(v82, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v82, "count"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v115 = v82;
    v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v145, v184, 16);
    if (v117)
    {
      v113 = *(_QWORD *)v146;
      do
      {
        v83 = 0;
        do
        {
          if (*(_QWORD *)v146 != v113)
          {
            v84 = v83;
            objc_enumerationMutation(v115);
            v83 = v84;
          }
          v116 = v83;
          v85 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v83);
          if (objc_msgSend(v85, "active"))
            ++v9->_numActiveTriggers;
          if (objc_msgSend(v85, "triggerType") == 1)
          {
            ++v9->_numEventTriggers;
            v86 = v85;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v87 = v86;
            else
              v87 = 0;
            v88 = v87;

            v89 = -[HMDAnalyticsEventTriggerData initWithEventTrigger:isAdding:]([HMDAnalyticsEventTriggerData alloc], "initWithEventTrigger:isAdding:", v88, 0);
            if (v89)
              objc_msgSend(v114, "addObject:", v89);

          }
          else if (objc_msgSend(v85, "triggerType") == 2)
          {
            ++v9->_numTimerTriggers;
          }
          objc_msgSend(v85, "actionSets");
          v121 = (id)objc_claimAutoreleasedReturnValue();
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v90 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v141, v183, 16);
          if (v90)
          {
            v130 = *(_QWORD *)v142;
            do
            {
              for (ii = 0; ii != v90; ++ii)
              {
                if (*(_QWORD *)v142 != v130)
                  objc_enumerationMutation(v121);
                v92 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * ii);
                v137 = 0u;
                v138 = 0u;
                v139 = 0u;
                v140 = 0u;
                objc_msgSend(v92, "actions");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v137, v182, 16);
                if (v94)
                {
                  v95 = *(_QWORD *)v138;
                  do
                  {
                    for (jj = 0; jj != v94; ++jj)
                    {
                      if (*(_QWORD *)v138 != v95)
                        objc_enumerationMutation(v93);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        ++v9->_numShortcuts;
                    }
                    v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v137, v182, 16);
                  }
                  while (v94);
                }

              }
              v90 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v141, v183, 16);
            }
            while (v90);
          }

          v83 = v116 + 1;
        }
        while (v116 + 1 != v117);
        v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v145, v184, 16);
      }
      while (v117);
    }

    v97 = objc_msgSend(v114, "copy");
    eventTriggers = v9->_eventTriggers;
    v9->_eventTriggers = (NSArray *)v97;

    objc_msgSend(v119, "actionSets");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)objc_msgSend(v99, "copy");

    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v101 = v100;
    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v133, v181, 16);
    if (v102)
    {
      v103 = *(_QWORD *)v134;
      do
      {
        for (kk = 0; kk != v102; ++kk)
        {
          if (*(_QWORD *)v134 != v103)
            objc_enumerationMutation(v101);
          objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * kk), "actions");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v105, "count");

          if (v106)
            ++v9->_numConfiguredScenes;
        }
        v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v133, v181, 16);
      }
      while (v102);
    }

    -[HMDHomeConfigurationLogEvent setHomeConfigurationBitMasks](v9, "setHomeConfigurationBitMasks");
    objc_msgSend(v120, "creationDate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_homeCreationCohortWeek = -[HMDHomeConfigurationLogEvent weeksSinceDate:trimAtMaximumValue:](v9, "weeksSinceDate:trimAtMaximumValue:", v107, 13);

    objc_msgSend(v120, "firstHAPAccessoryAddedDate");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_firstHAPAccessoryAddedCohortWeek = -[HMDHomeConfigurationLogEvent weeksSinceDate:trimAtMaximumValue:](v9, "weeksSinceDate:trimAtMaximumValue:", v108, 13);

    objc_msgSend(v120, "accessoriesWithWalletKeySupport");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numAccessoriesWithWalletKeySupported = objc_msgSend(v109, "count");

    objc_msgSend(v120, "walletKeyManager");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_hasHomeKeyInWallet = objc_msgSend(v110, "hasHomeKeyInWallet");

    v9->_isSmokeAlarmEnabled = objc_msgSend(v119, "isSmokeAlarmEnabled");
    v9->_isSiriPhraseOptionsHeySiriEnabled = objc_msgSend(v119, "isSiriPhraseOptionsHeySiriEnabled");
    v9->_isSiriPhraseOptionsJustSiriEnabled = objc_msgSend(v119, "isSiriPhraseOptionsJustSiriEnabled");
    v111 = v9;

  }
  return v9;
}

- (void)updateConfigWithAccessory:(id)a3 reportNetworkProtectionMetrics:(BOOL)a4 networkProtectionEnabled:(BOOL)a5 hapServiceTypes:(id)a6 primaryHAPServiceTypes:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  int *v33;
  void *v34;
  int *v35;
  void *v36;
  unsigned int v37;
  int *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  int *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  char v91;
  int *v92;
  int64_t v93;
  void *v94;
  HMDHomeConfigurationLogEvent *v95;
  NSObject *v96;
  id v97;
  id v98;
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v9 = a5;
  v10 = a4;
  v121 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v106 = v19;

  v20 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v105 = v21;

  if (v17)
  {
    objc_msgSend(v17, "hostAccessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
    v24 = v23;

    if (v24)
      goto LABEL_163;
  }
  if (v10)
  {
    if (objc_msgSend(v20, "wiFiCredentialType") == 3)
      ++self->_numAccessoriesWiFiPPSKCredential;
    if (v9)
    {
      v25 = v20;
      if ((objc_msgSend(v25, "supportsNetworkProtection") & 1) != 0)
      {
        objc_msgSend(v25, "networkClientIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = objc_msgSend(v25, "targetNetworkProtectionMode");
          v28 = objc_msgSend(v25, "currentNetworkProtectionMode");
          if (!v27 && v28 == 4)
          {

            v29 = 368;
            goto LABEL_147;
          }
          if (!v27 && v28 == 2)
          {
            v85 = objc_msgSend(v25, "networkClientLAN");

            if (v85 == 3)
              v29 = 384;
            else
              v29 = 376;
LABEL_147:
            ++*(Class *)((char *)&self->super.super.super.isa + v29);
            if (!v17)
              goto LABEL_148;
LABEL_29:
            v32 = objc_msgSend(v17, "certificationStatus");
            if (v32 == 2)
            {
              v33 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numCertifiedAccessories;
            }
            else
            {
              if (objc_msgSend(v17, "certificationStatus") != 1)
                goto LABEL_34;
              v33 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numNotCertifiedAccessories;
            }
            ++*(Class *)((char *)&self->super.super.super.isa + *v33);
LABEL_34:
            if (objc_msgSend(v17, "supportsHAP"))
            {
              ++self->_numHAPAccessories;
              objc_msgSend(v17, "firmwareUpdateProfile");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
                ++self->_numHAPAccessoriesFirmwareUpdateEligible;
              if (objc_msgSend(v17, "hasIPLink") && (objc_msgSend(v17, "isPrimary") & 1) != 0)
              {
                v35 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numHAPIPAccessories;
LABEL_46:
                ++*(Class *)((char *)&self->super.super.super.isa + *v35);
                goto LABEL_47;
              }
              if (objc_msgSend(v17, "hasBTLELink") && (objc_msgSend(v17, "isPrimary") & 1) != 0)
              {
                v35 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numHAPBTAccessories;
                goto LABEL_46;
              }
            }
            else if (objc_msgSend(v17, "supportsCHIP"))
            {
              ++self->_numCHIPAccessories;
              objc_msgSend(v17, "firmwareUpdateProfile");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                v35 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numCHIPAccessoriesFirmwareUpdateEligible;
                goto LABEL_46;
              }
            }
LABEL_47:
            v37 = objc_msgSend(v17, "metric_threadCapabilities");
            if (objc_msgSend(v17, "hasIPLink") && objc_msgSend(v17, "isPrimary"))
            {
              ++self->_numIPAccessories;
            }
            else if (objc_msgSend(v17, "hasBTLELink") && objc_msgSend(v17, "isPrimary"))
            {
              ++self->_numBTAccessories;
              if (!v37)
              {
                v38 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numBTOnlyAccessories;
                v39 = 1;
LABEL_56:
                *(Class *)((char *)&self->super.super.super.isa + *v38) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                           + *v38)
                                                                                + v39);
LABEL_57:
                v101 = v20;
                if ((objc_msgSend(v17, "isPrimary") & 1) == 0)
                  ++self->_numBridgedAccessories;
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                objc_msgSend(v17, "services");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
                if (v41)
                {
                  v42 = v41;
                  v43 = *(_QWORD *)v112;
                  do
                  {
                    for (i = 0; i != v42; ++i)
                    {
                      if (*(_QWORD *)v112 != v43)
                        objc_enumerationMutation(v40);
                      objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i), "type");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v13, "addObject:", v45);

                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
                  }
                  while (v42);
                }

                +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:](HMDMetricsUtilities, "primaryServiceTypeForHAPAccessory:", v17);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (v46)
                  objc_msgSend(v14, "addObject:", v46);
                objc_msgSend(v17, "findServiceWithServiceType:", *MEMORY[0x1E0CB99B8]);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                if (v47)
                  ++self->_numHAPBatteryServiceAccessories;
                if (objc_msgSend(v17, "supportsWoL"))
                  ++self->_numWoLAccessories;
                if (objc_msgSend(v17, "supportsTargetController"))
                {
                  ++self->_numTargetControllers;
                  if (v32 == 2)
                    ++self->_numCertifiedTargetControllers;
                  if ((objc_msgSend(v17, "isPrimary") & 1) == 0)
                  {
                    ++self->_numBridgedTargetControllers;
                    if (v32 == 2)
                      ++self->_numCertifiedBridgedTargetControllers;
                  }
                }
                v104 = v17;
                if (objc_msgSend(v17, "hasCameraStreamService"))
                {
                  ++self->_numCameraAccessories;
                  if (objc_msgSend(v17, "isCameraRecordingFeatureSupported"))
                    ++self->_numCameraAccessoriesSupportRecording;
                  objc_msgSend(v17, "cameraProfileSettingsManager");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v48, "isRecordingEnabled"))
                    ++self->_numCameraAccessoriesRecordingEnabled;
                  objc_msgSend(v48, "currentSettings");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "notificationSettings");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v50, "isReachabilityEventNotificationEnabled");

                  if (v51)
                    ++self->_numCameraAccessoriesReachabilityNotificationEnabled;
                  objc_msgSend(v48, "currentSettings");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "activityZones");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = objc_msgSend(v53, "count");

                  if (v54)
                    ++self->_numCameraAccessoriesWithActivityZonesEnabled;

                  v17 = v104;
                }
                if (!objc_msgSend(v17, "hasTelevisionService"))
                {
                  v59 = 1;
                  goto LABEL_98;
                }
                objc_msgSend(v17, "category");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "categoryType");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v56, "isEqualToString:", *MEMORY[0x1E0CB7AC8]);

                if ((v57 & 1) != 0)
                {
                  v58 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionAccessories;
                }
                else
                {
                  objc_msgSend(v17, "category");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "categoryType");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0CB7AD8]);

                  if ((v62 & 1) != 0)
                  {
                    v58 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionSetTopBoxAccessories;
                  }
                  else
                  {
                    objc_msgSend(v17, "category");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "categoryType");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = objc_msgSend(v64, "isEqualToString:", *MEMORY[0x1E0CB7AE0]);

                    if (!v65)
                    {
LABEL_97:
                      v59 = 3;
LABEL_98:
                      if (objc_msgSend(v17, "hasSmartSpeakerService"))
                      {
                        ++self->_numHAPSpeakerServiceAccessories;
                        if (objc_msgSend(v46, "isEqual:", CFSTR("00000228-0000-1000-8000-0026BB765291")))
                        {
                          ++self->_numPrimaryHAPSpeakerServiceAccessories;
                          v59 = 3;
                        }
                      }
                      if (objc_msgSend(v17, "hasSiriEndpointService"))
                        ++self->_numCapableSiriEndpointAccessories;
                      v103 = v13;
                      if (self->_isCurrentDevicePrimaryResident)
                      {
                        objc_msgSend(v17, "siriEndpointProfile");
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        v67 = v66;
                        if (v66
                          && (objc_msgSend(v66, "siriTouchToUse") == 1 || objc_msgSend(v67, "siriListening") == 1))
                        {
                          ++self->_numEnabledSiriEndpointAccessories;
                        }

                      }
                      v102 = v14;
                      v109 = 0u;
                      v110 = 0u;
                      v107 = 0u;
                      v108 = 0u;
                      objc_msgSend(v17, "lightProfiles", v59);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
                      if (v69)
                      {
                        v70 = v69;
                        v71 = *(_QWORD *)v108;
                        do
                        {
                          for (j = 0; j != v70; ++j)
                          {
                            if (*(_QWORD *)v108 != v71)
                              objc_enumerationMutation(v68);
                            v73 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
                            if (objc_msgSend(v73, "isNaturalLightingSupported"))
                              ++self->_numLightProfilesWithNaturalLightingSupported;
                            objc_msgSend(MEMORY[0x1E0C99D68], "date");
                            v74 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v74, "dateByAddingTimeInterval:", -86400.0);
                            v75 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v73, "mostRecentNaturalLightingEnabledDate");
                            v76 = (void *)objc_claimAutoreleasedReturnValue();
                            v77 = objc_msgSend(v76, "compare:", v75);

                            if (v77 == 1)
                              ++self->_numLightProfilesWithNaturalLightingEnabled;
                            objc_msgSend(v73, "mostRecentNaturalLightingUsedDate");
                            v78 = (void *)objc_claimAutoreleasedReturnValue();
                            v79 = objc_msgSend(v78, "compare:", v75);

                            if (v79 == 1)
                              ++self->_numLightProfilesWithNaturalLightingUsed;

                          }
                          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
                        }
                        while (v70);
                      }

                      v17 = v104;
                      objc_msgSend(v104, "category");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v80, "categoryType");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = objc_msgSend(v81, "isEqualToString:", *MEMORY[0x1E0CB7A38]);

                      v14 = v102;
                      v13 = v103;
                      v20 = v101;
                      if (v82)
                      {
                        if (objc_msgSend(v104, "supportsHAP"))
                          ++self->_numHAPLocks;
                        if (objc_msgSend(v104, "supportsCHIP"))
                          ++self->_numMatterLocks;
                        if (objc_msgSend(v104, "supportsAccessCode"))
                          ++self->_numLocksWithAccessCodeSupported;
                        if (objc_msgSend(v104, "supportsWalletKey"))
                          ++self->_numLocksWithWalletKeySupported;
                      }
                      objc_msgSend(v104, "services");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      self->_numServices += objc_msgSend(v83, "count");

                      switch(v100)
                      {
                        case 3:
                          goto LABEL_154;
                        case 2:
LABEL_161:
                          v84 = 168;
                          goto LABEL_162;
                        case 1:
                          v84 = 152;
LABEL_162:
                          ++*(Class *)((char *)&self->super.super.super.isa + v84);
                          goto LABEL_163;
                      }
                      goto LABEL_163;
                    }
                    v58 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionStreamingStickAccessories;
                  }
                }
                ++*(Class *)((char *)&self->super.super.super.isa + *v58);
                goto LABEL_97;
              }
LABEL_55:
              ++self->_numThreadAccessories;
              self->_numThreadAccessoryMinCapable += v37 & 1;
              self->_numThreadAccessorySleepCapable += (v37 >> 1) & 1;
              self->_numThreadAccessoryFullCapable += (v37 >> 2) & 1;
              self->_numThreadAccessoryRouterCapable += (v37 >> 3) & 1;
              v39 = (v37 >> 4) & 1;
              v38 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numThreadAccessoryBorderRouterCapable;
              goto LABEL_56;
            }
            if (!v37)
              goto LABEL_57;
            goto LABEL_55;
          }
          if (v27 == 1 && v28 == 1)
          {

            v29 = 400;
            goto LABEL_147;
          }
          if (v27 == 3 && v28 == 3)
          {

            v29 = 392;
            goto LABEL_147;
          }
        }

        v29 = 360;
        goto LABEL_147;
      }

    }
    else
    {
      objc_msgSend(v17, "category");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isWiFiRouterAccessoryCategory");

      if (v31)
      {
        self->_networkProtectionStatus = 1;
        if (!v17)
          goto LABEL_148;
        goto LABEL_29;
      }
    }
  }
  if (v17)
    goto LABEL_29;
LABEL_148:
  if (v106)
  {
    v86 = v14;
    objc_msgSend(v106, "category");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "categoryType");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = HMFEqualObjects();

    if (v89)
    {
      ++self->_numAppleTVAccessories;
      objc_msgSend(v106, "capabilities");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "supportsThreadBorderRouter");

      if ((v91 & 1) != 0)
      {
        v92 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numAppleTV4K2ndGenAccessories;
LABEL_157:
        ++*(Class *)((char *)&self->super.super.super.isa + *v92);
      }
    }
    else if (objc_msgSend(v106, "isHomePod"))
    {
      v92 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numAppleAudioAccessories;
      goto LABEL_157;
    }
    v14 = v86;
    if (objc_msgSend(v106, "isCurrentAccessory"))
    {
      v93 = objc_msgSend(v106, "fallbackMediaUserType");
      if ((unint64_t)(v93 - 1) < 3)
        self->_currentMediaAccessoryFallbackMediaUserType = v93;
    }
    goto LABEL_161;
  }
  if (v105)
  {
    ++self->_numWholeHouseAudioAccessories;
LABEL_154:
    v84 = 160;
    goto LABEL_162;
  }
  v94 = (void *)MEMORY[0x1D17BA0A0]();
  v95 = self;
  HMFGetOSLogHandle();
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v97 = v20;
    v98 = v14;
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v116 = v99;
    v117 = 2112;
    v118 = v97;
    _os_log_impl(&dword_1CD062000, v96, OS_LOG_TYPE_ERROR, "%{public}@Accessory was not matched to any type for configuration reporting: %@", buf, 0x16u);

    v14 = v98;
    v20 = v97;
  }

  objc_autoreleasePoolPop(v94);
LABEL_163:

}

- (unint64_t)numTelevisionServiceAccessories
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HMDHomeConfigurationLogEvent numTelevisionAccessories](self, "numTelevisionAccessories");
  v4 = -[HMDHomeConfigurationLogEvent numTelevisionSetTopBoxAccessories](self, "numTelevisionSetTopBoxAccessories") + v3;
  return v4
       + -[HMDHomeConfigurationLogEvent numTelevisionStreamingStickAccessories](self, "numTelevisionStreamingStickAccessories");
}

- (unint64_t)numThirdPartyAudioAccessories
{
  unint64_t v3;

  v3 = -[HMDHomeConfigurationLogEvent numPrimaryHAPSpeakerServiceAccessories](self, "numPrimaryHAPSpeakerServiceAccessories");
  return -[HMDHomeConfigurationLogEvent numWholeHouseAudioAccessories](self, "numWholeHouseAudioAccessories") + v3;
}

- (unint64_t)currentUserPrivilegeBitMask
{
  unint64_t v2;

  v2 = -[HMDHomeConfigurationLogEvent currentUserPrivilege](self, "currentUserPrivilege");
  if (v2 - 1 > 3)
    return 1;
  else
    return qword_1CDB8F330[v2 - 1];
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.config.home");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent homeIndex](self, "homeIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("homeIndex"));

  -[HMMHomeLogEvent homeUUIDString](self, "homeUUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homeUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent homeCategoryBitMask](self, "homeCategoryBitMask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homeCategoryBitMask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent appleMediaCategoryBitMask](self, "appleMediaCategoryBitMask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appleMediaCategoryBitMask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent thirdPartyMediaCategoryBitMask](self, "thirdPartyMediaCategoryBitMask"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("thirdPartyMediaCategoryBitMask"));

  if (-[HMDHomeConfigurationLogEvent isOwnerUser](self, "isOwnerUser"))
    v9 = &unk_1E8B33210;
  else
    v9 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isOwnerUser"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isOwnerUser](self, "isOwnerUser"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isOwnerUserBool"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent currentUserPrivilege](self, "currentUserPrivilege"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("currentUserPrivilege"));

  if (-[HMDHomeConfigurationLogEvent isAccessToHomeAllowed](self, "isAccessToHomeAllowed"))
    v12 = &unk_1E8B33210;
  else
    v12 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isAccessToHomeAllowed"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isAccessToHomeAllowed](self, "isAccessToHomeAllowed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isAccessToHomeAllowedBool"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDHomeConfigurationLogEvent networkProtectionStatus](self, "networkProtectionStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("networkProtectionStatus"));

  if (-[HMDHomeConfigurationLogEvent isResidentAvailable](self, "isResidentAvailable"))
    v15 = &unk_1E8B33210;
  else
    v15 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isResidentAvailable"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentAvailable](self, "isResidentAvailable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isResidentAvailableBool"));

  if (-[HMDHomeConfigurationLogEvent isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](self, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"))
  {
    v17 = &unk_1E8B33210;
  }
  else
  {
    v17 = &unk_1E8B33228;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](self, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isAutomaticThirdPartyAccessorySoftwareUpdateEnabledBool"));

  if (-[HMDHomeConfigurationLogEvent primaryReportingDevice](self, "primaryReportingDevice"))
    v19 = &unk_1E8B33210;
  else
    v19 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("primaryReportingDevice"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent primaryReportingDevice](self, "primaryReportingDevice"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("primaryReportingDeviceBool"));

  if (-[HMDHomeConfigurationLogEvent isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
    v21 = &unk_1E8B33210;
  else
    v21 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isPrimaryResident"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isPrimaryResidentBool"));

  if (-[HMDHomeConfigurationLogEvent isCurrentDeviceResidentEnabled](self, "isCurrentDeviceResidentEnabled"))
    v23 = &unk_1E8B33210;
  else
    v23 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isCurrentDeviceResidentEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDeviceResidentEnabled](self, "isCurrentDeviceResidentEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isCurrentDeviceResidentEnabledBool"));

  if (-[HMDHomeConfigurationLogEvent isCurrentDeviceLocalToHome](self, "isCurrentDeviceLocalToHome"))
    v25 = &unk_1E8B33210;
  else
    v25 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("isCurrentDeviceLocalToHome"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDeviceLocalToHome](self, "isCurrentDeviceLocalToHome"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isCurrentDeviceLocalToHomeBool"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentFirstEnabled](self, "isResidentFirstEnabled"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("isResidentFirstEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentFirstEnabled](self, "isResidentFirstEnabled"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("isResidentFirstEnabledBool"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentElectionV2Enabled](self, "isResidentElectionV2Enabled"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("isResidentElectionV2Enabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentElectionV2Enabled](self, "isResidentElectionV2Enabled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isResidentElectionV2EnabledBool"));

  if (-[HMDHomeConfigurationLogEvent networkProtectionEnabled](self, "networkProtectionEnabled"))
    v31 = &unk_1E8B33210;
  else
    v31 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("networkProtectionEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent networkProtectionEnabled](self, "networkProtectionEnabled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("networkProtectionEnabledBool"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessories](self, "numAccessories"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("numAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCertifiedAccessories](self, "numCertifiedAccessories"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("numCertifiedAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBridgedAccessories](self, "numBridgedAccessories"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("numBridgedAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numNotCertifiedAccessories](self, "numNotCertifiedAccessories"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("numNotCertifiedAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numSmartHomeAccessories](self, "numSmartHomeAccessories"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("numSmartHomeAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThirdPartyMediaAccessories](self, "numThirdPartyMediaAccessories"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("numThirdPartyMediaAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleMediaAccessories](self, "numAppleMediaAccessories"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("numAppleMediaAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleAudioAccessories](self, "numAppleAudioAccessories"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("numAppleAudioAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePods](self, "numHomePods"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("numHomePods"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePodStereoPairs](self, "numHomePodStereoPairs"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("numHomePodStereoPairs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePodMinis](self, "numHomePodMinis"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("numHomePodMinis"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePodMiniStereoPairs](self, "numHomePodMiniStereoPairs"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("numHomePodMiniStereoPairs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePod2ndGen](self, "numHomePod2ndGen"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("numVoeAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePod2ndGenStereoPairs](self, "numHomePod2ndGenStereoPairs"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("numVoe2Accessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numMediaSystems](self, "numMediaSystems"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("numMediaSystems"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleTVAccessories](self, "numAppleTVAccessories"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("numAppleTVAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleTV4K2ndGenAccessories](self, "numAppleTV4K2ndGenAccessories"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("numAppleTV4K2ndGenAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeConfigurationLogEvent currentMediaAccessoryFallbackMediaUserType](self, "currentMediaAccessoryFallbackMediaUserType"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("currentMediaAccessoryFallbackMediaUserType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionServiceAccessories](self, "numTelevisionServiceAccessories"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("numTelevisionServiceAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionAccessories](self, "numTelevisionAccessories"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("numTelevisionAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionSetTopBoxAccessories](self, "numTelevisionSetTopBoxAccessories"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("numTelevisionSetTopBoxAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionStreamingStickAccessories](self, "numTelevisionStreamingStickAccessories"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("numTelevisionStreamingStickAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThirdPartyAudioAccessories](self, "numThirdPartyAudioAccessories"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("numThirdPartyAudioAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPSpeakerServiceAccessories](self, "numHAPSpeakerServiceAccessories"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("numHAPSpeakerServiceAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numPrimaryHAPSpeakerServiceAccessories](self, "numPrimaryHAPSpeakerServiceAccessories"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("numPrimaryHAPSpeakerServiceAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numWholeHouseAudioAccessories](self, "numWholeHouseAudioAccessories"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("numWholeHouseAudioAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCapableSiriEndpointAccessories](self, "numCapableSiriEndpointAccessories"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("numCapableSiriEndpointAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numEnabledSiriEndpointAccessories](self, "numEnabledSiriEndpointAccessories"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("numEnabledSiriEndpointAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesWiFiPPSKCredential](self, "numAccessoriesWiFiPPSKCredential"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("numAccessoriesWiFiPPSKCredential"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionUnprotected](self, "numAccessoriesNetworkProtectionUnprotected"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("numAccessoriesNetworkProtectionUnprotected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionAutoFullAccess](self, "numAccessoriesNetworkProtectionAutoFullAccess"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("numAccessoriesNetworkProtectionAutoFullAccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionAutoProtectedMainLAN](self, "numAccessoriesNetworkProtectionAutoProtectedMainLAN"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("numAccessoriesNetworkProtectionAutoProtectedMainLAN"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN](self, "numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionFullAccess](self, "numAccessoriesNetworkProtectionFullAccess"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("numAccessoriesNetworkProtectionFullAccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionHomeKitOnly](self, "numAccessoriesNetworkProtectionHomeKitOnly"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("numAccessoriesNetworkProtectionHomeKitOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPAccessories](self, "numHAPAccessories"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("numHAPAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCHIPAccessories](self, "numCHIPAccessories"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("numMatterAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPAccessoriesFirmwareUpdateEligible](self, "numHAPAccessoriesFirmwareUpdateEligible"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("numHAPAccessoriesFirmwareUpdateEligible"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCHIPAccessoriesFirmwareUpdateEligible](self, "numCHIPAccessoriesFirmwareUpdateEligible"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("numMatterAccessoriesFirmwareUpdateEligible"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numIPAccessories](self, "numIPAccessories"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("numIPAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBTAccessories](self, "numBTAccessories"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("numBTAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBTOnlyAccessories](self, "numBTOnlyAccessories"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("numBTOnlyAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessories](self, "numThreadAccessories"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("numThreadAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPIPAccessories](self, "numHAPIPAccessories"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("numHAPIPAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPBTAccessories](self, "numHAPBTAccessories"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("numHAPBTAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPBatteryServiceAccessories](self, "numHAPBatteryServiceAccessories"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("numHAPBatteryServiceAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadBorderRouters](self, "numThreadBorderRouters"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("numThreadBorderRouters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryMinCapable](self, "numThreadAccessoryMinCapable"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("numThreadAccessoryMinCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessorySleepCapable](self, "numThreadAccessorySleepCapable"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("numThreadAccessorySleepCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryFullCapable](self, "numThreadAccessoryFullCapable"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("numThreadAccessoryFullCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryRouterCapable](self, "numThreadAccessoryRouterCapable"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("numThreadAccessoryRouterCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryBorderRouterCapable](self, "numThreadAccessoryBorderRouterCapable"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("numThreadAccessoryBorderRouterCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessories](self, "numCameraAccessories"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("numCameraAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesSupportRecording](self, "numCameraAccessoriesSupportRecording"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("numCameraAccessoriesSupportRecording"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesRecordingEnabled](self, "numCameraAccessoriesRecordingEnabled"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("numCameraAccessoriesRecordingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesReachabilityNotificationEnabled](self, "numCameraAccessoriesReachabilityNotificationEnabled"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("numCameraAccessoriesReachabilityNotificationEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesWithActivityZonesEnabled](self, "numCameraAccessoriesWithActivityZonesEnabled"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("numCameraAccessoriesWithActivityZonesEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLightProfilesWithNaturalLightingSupported](self, "numLightProfilesWithNaturalLightingSupported"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("numLightProfilesWithNaturalLightingSupported"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLightProfilesWithNaturalLightingEnabled](self, "numLightProfilesWithNaturalLightingEnabled"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v91, CFSTR("numLightProfilesWithNaturalLightingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLightProfilesWithNaturalLightingUsed](self, "numLightProfilesWithNaturalLightingUsed"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("numLightProfilesWithNaturalLightingUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numResidentsEnabled](self, "numResidentsEnabled"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("numResidentsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent enabledResidentsDeviceCapabilities](self, "enabledResidentsDeviceCapabilities"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("enabledResidentsDeviceCapabilities"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTriggers](self, "numTriggers"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("numTriggers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numActiveTriggers](self, "numActiveTriggers"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("numActiveTriggers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numEventTriggers](self, "numEventTriggers"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("numEventTriggers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTimerTriggers](self, "numTimerTriggers"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("numTimerTriggers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numShortcuts](self, "numShortcuts"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("numShortcuts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numScenes](self, "numScenes"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("numScenes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numConfiguredScenes](self, "numConfiguredScenes"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("numConfiguredScenes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTriggerOwnedConfiguredScenes](self, "numTriggerOwnedConfiguredScenes"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("numTriggerOwnedConfiguredScenes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTargetControllers](self, "numTargetControllers"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("numTargetControllers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCertifiedTargetControllers](self, "numCertifiedTargetControllers"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("numCertifiedTargetControllers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBridgedTargetControllers](self, "numBridgedTargetControllers"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("numBridgedTargetControllers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCertifiedBridgedTargetControllers](self, "numCertifiedBridgedTargetControllers"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v106, CFSTR("numCertifiedBridgedTargetControllers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeConfigurationLogEvent numUsers](self, "numUsers"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("numUsers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeConfigurationLogEvent numAdmins](self, "numAdmins"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("numAdmins"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeConfigurationLogEvent numRestrictedGuests](self, "numRestrictedGuests"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v109, CFSTR("numRestrictedGuests"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent userPrivilegeBitMask](self, "userPrivilegeBitMask"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("userPrivilegeBitMask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numRooms](self, "numRooms"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("numRooms"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numZones](self, "numZones"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v112, CFSTR("numZones"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numServices](self, "numServices"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("numServices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoryServiceGroups](self, "numAccessoryServiceGroups"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("numAccessoryServiceGroups"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeConfigurationLogEvent homeCreationCohortWeek](self, "homeCreationCohortWeek"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v115, CFSTR("homeCreationCohortWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeConfigurationLogEvent firstHAPAccessoryAddedCohortWeek](self, "firstHAPAccessoryAddedCohortWeek"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("firstHAPAccessoryAddedCohortWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeConfigurationLogEvent numConfiguredWidgets](self, "numConfiguredWidgets"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("numHomeWidgetsEnabled"));

  -[HMDHomeConfigurationLogEvent numBSPs](self, "numBSPs");
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    -[HMDHomeConfigurationLogEvent numBSPs](self, "numBSPs");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("numBSPs"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numWoLAccessories](self, "numWoLAccessories"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("numWoLAccessories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDHomeConfigurationLogEvent databaseSize](self, "databaseSize"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v121, CFSTR("databaseSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDHomeConfigurationLogEvent metadataVersion](self, "metadataVersion"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("metadataVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPLocks](self, "numHAPLocks"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("numHAPLocks"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numMatterLocks](self, "numMatterLocks"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v124, CFSTR("numMatterLocks"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLocksWithAccessCodeSupported](self, "numLocksWithAccessCodeSupported"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("numLocksWithAccessCodeSupported"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLocksWithWalletKeySupported](self, "numLocksWithWalletKeySupported"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("numLocksWithWalletKeySupported"));

  if (-[HMDHomeConfigurationLogEvent isOwnerUser](self, "isOwnerUser"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent ownerPerspectiveNumUsersWithAccessCode](self, "ownerPerspectiveNumUsersWithAccessCode"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v127, CFSTR("ownerPerspectiveNumUsersWithAccessCode"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("ownerPerspectiveNumUsersWithAccessCode"));
  }
  if (-[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"))
    v128 = &unk_1E8B33210;
  else
    v128 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("isWalletKeyProvisioned"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("isWalletKeyProvisionedBool"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesWithWalletKeySupported](self, "numAccessoriesWithWalletKeySupported"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v130, CFSTR("numRoeAccessories"));

  if (-[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"))
    v131 = &unk_1E8B33210;
  else
    v131 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("isUserRoeProvisioned"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v132, CFSTR("isUserRoeProvisionedBool"));

  if (-[HMDHomeConfigurationLogEvent isSmokeAlarmEnabled](self, "isSmokeAlarmEnabled"))
    v133 = &unk_1E8B33210;
  else
    v133 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v133, CFSTR("isXoeEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isSmokeAlarmEnabled](self, "isSmokeAlarmEnabled"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v134, CFSTR("isXoeEnabledBool"));

  if (-[HMDHomeConfigurationLogEvent isSiriPhraseOptionsHeySiriEnabled](self, "isSiriPhraseOptionsHeySiriEnabled"))
    v135 = &unk_1E8B33210;
  else
    v135 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v135, CFSTR("isSiriPhraseOptionsHeySiriEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isSiriPhraseOptionsHeySiriEnabled](self, "isSiriPhraseOptionsHeySiriEnabled"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v136, CFSTR("isSiriPhraseOptionsHeySiriEnabledBool"));

  if (-[HMDHomeConfigurationLogEvent isSiriPhraseOptionsJustSiriEnabled](self, "isSiriPhraseOptionsJustSiriEnabled"))
    v137 = &unk_1E8B33210;
  else
    v137 = &unk_1E8B33228;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v137, CFSTR("isSiriPhraseOptionsJustSiriEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeConfigurationLogEvent isSiriPhraseOptionsJustSiriEnabled](self, "isSiriPhraseOptionsJustSiriEnabled"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v138, CFSTR("isSiriPhraseOptionsJustSiriEnabledBool"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent residentElectionBitMask](self, "residentElectionBitMask"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v139, CFSTR("residentElectionBitMask"));

  v140 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v140;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)isSubmitted
{
  return 0;
}

- (id)initForUnitTesting
{
  void *v3;
  HMDHomeConfigurationLogEvent *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)HMDHomeConfigurationLogEvent;
  v4 = -[HMMHomeLogEvent initWithHomeUUID:](&v6, sel_initWithHomeUUID_, v3);

  return v4;
}

- (HMDHomeConfigurationLogEvent)initWithIsOwnerUser:(BOOL)a3 isResidentAvailable:(BOOL)a4 isPrimaryReportingDevice:(BOOL)a5 isCurrentDeviceResidentEnabled:(BOOL)a6 isPrimaryResident:(BOOL)a7 isCurrentDeviceLocalToHome:(BOOL)a8 isNetworkProtectionEnabled:(BOOL)a9 isUserRoeProvisioned:(BOOL)a10 isResidentFirstEnabled:(BOOL)a11 isResidentElectionV2Enabled:(BOOL)a12 isSmokeAlarmEnabled:(BOOL)a13
{
  HMDHomeConfigurationLogEvent *result;

  result = -[HMDHomeConfigurationLogEvent initForUnitTesting](self, "initForUnitTesting");
  if (result)
  {
    result->_ownerUser = a3;
    result->_isResidentAvailable = a4;
    result->_primaryReportingDevice = a5;
    result->_isCurrentDeviceResidentEnabled = a6;
    result->_isCurrentDevicePrimaryResident = a7;
    result->_isCurrentDeviceLocalToHome = a8;
    result->_networkProtectionEnabled = a9;
    result->_hasHomeKeyInWallet = a10;
    result->_isResidentFirstEnabled = a11;
    result->_isResidentElectionV2Enabled = a12;
    result->_isSmokeAlarmEnabled = a13;
  }
  return result;
}

- (unint64_t)homeIndex
{
  return self->_homeIndex;
}

- (void)setHomeIndex:(unint64_t)a3
{
  self->_homeIndex = a3;
}

- (BOOL)isOwnerUser
{
  return self->_ownerUser;
}

- (unint64_t)currentUserPrivilege
{
  return self->_currentUserPrivilege;
}

- (BOOL)isAccessToHomeAllowed
{
  return self->_accessToHomeAllowed;
}

- (int)networkProtectionStatus
{
  return self->_networkProtectionStatus;
}

- (BOOL)isResidentAvailable
{
  return self->_isResidentAvailable;
}

- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled
{
  return self->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
}

- (BOOL)primaryReportingDevice
{
  return self->_primaryReportingDevice;
}

- (BOOL)isCurrentDeviceResidentCapable
{
  return self->_isCurrentDeviceResidentCapable;
}

- (BOOL)isCurrentDeviceResidentEnabled
{
  return self->_isCurrentDeviceResidentEnabled;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_isCurrentDevicePrimaryResident;
}

- (BOOL)isCurrentDeviceLocalToHome
{
  return self->_isCurrentDeviceLocalToHome;
}

- (BOOL)isResidentFirstEnabled
{
  return self->_isResidentFirstEnabled;
}

- (BOOL)isResidentElectionV2Enabled
{
  return self->_isResidentElectionV2Enabled;
}

- (BOOL)networkProtectionEnabled
{
  return self->_networkProtectionEnabled;
}

- (unint64_t)homeCategoryBitMask
{
  return self->_homeCategoryBitMask;
}

- (unint64_t)appleMediaCategoryBitMask
{
  return self->_appleMediaCategoryBitMask;
}

- (unint64_t)thirdPartyMediaCategoryBitMask
{
  return self->_thirdPartyMediaCategoryBitMask;
}

- (unint64_t)numAccessories
{
  return self->_numAccessories;
}

- (unint64_t)numCertifiedAccessories
{
  return self->_numCertifiedAccessories;
}

- (unint64_t)numBridgedAccessories
{
  return self->_numBridgedAccessories;
}

- (unint64_t)numNotCertifiedAccessories
{
  return self->_numNotCertifiedAccessories;
}

- (unint64_t)numSmartHomeAccessories
{
  return self->_numSmartHomeAccessories;
}

- (unint64_t)numThirdPartyMediaAccessories
{
  return self->_numThirdPartyMediaAccessories;
}

- (unint64_t)numAppleMediaAccessories
{
  return self->_numAppleMediaAccessories;
}

- (unint64_t)numHAPAccessories
{
  return self->_numHAPAccessories;
}

- (unint64_t)numCHIPAccessories
{
  return self->_numCHIPAccessories;
}

- (unint64_t)numHAPAccessoriesFirmwareUpdateEligible
{
  return self->_numHAPAccessoriesFirmwareUpdateEligible;
}

- (unint64_t)numCHIPAccessoriesFirmwareUpdateEligible
{
  return self->_numCHIPAccessoriesFirmwareUpdateEligible;
}

- (unint64_t)numIPAccessories
{
  return self->_numIPAccessories;
}

- (unint64_t)numBTAccessories
{
  return self->_numBTAccessories;
}

- (unint64_t)numBTOnlyAccessories
{
  return self->_numBTOnlyAccessories;
}

- (unint64_t)numThreadAccessories
{
  return self->_numThreadAccessories;
}

- (unint64_t)numHAPIPAccessories
{
  return self->_numHAPIPAccessories;
}

- (unint64_t)numHAPBTAccessories
{
  return self->_numHAPBTAccessories;
}

- (unint64_t)numHAPBatteryServiceAccessories
{
  return self->_numHAPBatteryServiceAccessories;
}

- (unint64_t)numAppleAudioAccessories
{
  return self->_numAppleAudioAccessories;
}

- (unint64_t)numAppleTVAccessories
{
  return self->_numAppleTVAccessories;
}

- (unint64_t)numAppleTV4K2ndGenAccessories
{
  return self->_numAppleTV4K2ndGenAccessories;
}

- (unint64_t)numTelevisionAccessories
{
  return self->_numTelevisionAccessories;
}

- (unint64_t)numTelevisionSetTopBoxAccessories
{
  return self->_numTelevisionSetTopBoxAccessories;
}

- (unint64_t)numTelevisionStreamingStickAccessories
{
  return self->_numTelevisionStreamingStickAccessories;
}

- (unint64_t)numHAPSpeakerServiceAccessories
{
  return self->_numHAPSpeakerServiceAccessories;
}

- (unint64_t)numPrimaryHAPSpeakerServiceAccessories
{
  return self->_numPrimaryHAPSpeakerServiceAccessories;
}

- (unint64_t)numWholeHouseAudioAccessories
{
  return self->_numWholeHouseAudioAccessories;
}

- (unint64_t)numCapableSiriEndpointAccessories
{
  return self->_numCapableSiriEndpointAccessories;
}

- (unint64_t)numEnabledSiriEndpointAccessories
{
  return self->_numEnabledSiriEndpointAccessories;
}

- (unint64_t)numAccessoriesWiFiPPSKCredential
{
  return self->_numAccessoriesWiFiPPSKCredential;
}

- (unint64_t)numAccessoriesNetworkProtectionUnprotected
{
  return self->_numAccessoriesNetworkProtectionUnprotected;
}

- (unint64_t)numAccessoriesNetworkProtectionAutoFullAccess
{
  return self->_numAccessoriesNetworkProtectionAutoFullAccess;
}

- (unint64_t)numAccessoriesNetworkProtectionAutoProtectedMainLAN
{
  return self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN;
}

- (unint64_t)numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN
{
  return self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN;
}

- (unint64_t)numAccessoriesNetworkProtectionFullAccess
{
  return self->_numAccessoriesNetworkProtectionFullAccess;
}

- (unint64_t)numAccessoriesNetworkProtectionHomeKitOnly
{
  return self->_numAccessoriesNetworkProtectionHomeKitOnly;
}

- (unint64_t)numCameraAccessories
{
  return self->_numCameraAccessories;
}

- (unint64_t)numCameraAccessoriesSupportRecording
{
  return self->_numCameraAccessoriesSupportRecording;
}

- (unint64_t)numCameraAccessoriesRecordingEnabled
{
  return self->_numCameraAccessoriesRecordingEnabled;
}

- (unint64_t)numCameraAccessoriesReachabilityNotificationEnabled
{
  return self->_numCameraAccessoriesReachabilityNotificationEnabled;
}

- (unint64_t)numCameraAccessoriesWithActivityZonesEnabled
{
  return self->_numCameraAccessoriesWithActivityZonesEnabled;
}

- (unint64_t)numLightProfilesWithNaturalLightingSupported
{
  return self->_numLightProfilesWithNaturalLightingSupported;
}

- (unint64_t)numLightProfilesWithNaturalLightingEnabled
{
  return self->_numLightProfilesWithNaturalLightingEnabled;
}

- (unint64_t)numLightProfilesWithNaturalLightingUsed
{
  return self->_numLightProfilesWithNaturalLightingUsed;
}

- (unint64_t)numResidentsEnabled
{
  return self->_numResidentsEnabled;
}

- (unint64_t)enabledResidentsDeviceCapabilities
{
  return self->_enabledResidentsDeviceCapabilities;
}

- (unint64_t)numServices
{
  return self->_numServices;
}

- (unint64_t)numTriggers
{
  return self->_numTriggers;
}

- (unint64_t)numActiveTriggers
{
  return self->_numActiveTriggers;
}

- (unint64_t)numEventTriggers
{
  return self->_numEventTriggers;
}

- (unint64_t)numTimerTriggers
{
  return self->_numTimerTriggers;
}

- (unint64_t)numShortcuts
{
  return self->_numShortcuts;
}

- (unint64_t)numTargetControllers
{
  return self->_numTargetControllers;
}

- (unint64_t)numCertifiedTargetControllers
{
  return self->_numCertifiedTargetControllers;
}

- (unint64_t)numBridgedTargetControllers
{
  return self->_numBridgedTargetControllers;
}

- (unint64_t)numCertifiedBridgedTargetControllers
{
  return self->_numCertifiedBridgedTargetControllers;
}

- (int64_t)numUsers
{
  return self->_numUsers;
}

- (int64_t)numAdmins
{
  return self->_numAdmins;
}

- (int64_t)numRestrictedGuests
{
  return self->_numRestrictedGuests;
}

- (unint64_t)userPrivilegeBitMask
{
  return self->_userPrivilegeBitMask;
}

- (unint64_t)numConfiguredScenes
{
  return self->_numConfiguredScenes;
}

- (unint64_t)numTriggerOwnedConfiguredScenes
{
  return self->_numTriggerOwnedConfiguredScenes;
}

- (unint64_t)numScenes
{
  return self->_numScenes;
}

- (unint64_t)numRooms
{
  return self->_numRooms;
}

- (unint64_t)numZones
{
  return self->_numZones;
}

- (unint64_t)numAccessoryServiceGroups
{
  return self->_numAccessoryServiceGroups;
}

- (int64_t)homeCreationCohortWeek
{
  return self->_homeCreationCohortWeek;
}

- (int64_t)firstHAPAccessoryAddedCohortWeek
{
  return self->_firstHAPAccessoryAddedCohortWeek;
}

- (int64_t)numConfiguredWidgets
{
  return self->_numConfiguredWidgets;
}

- (unint64_t)numThreadAccessoryMinCapable
{
  return self->_numThreadAccessoryMinCapable;
}

- (unint64_t)numThreadAccessorySleepCapable
{
  return self->_numThreadAccessorySleepCapable;
}

- (unint64_t)numThreadAccessoryFullCapable
{
  return self->_numThreadAccessoryFullCapable;
}

- (unint64_t)numThreadAccessoryRouterCapable
{
  return self->_numThreadAccessoryRouterCapable;
}

- (unint64_t)numThreadAccessoryBorderRouterCapable
{
  return self->_numThreadAccessoryBorderRouterCapable;
}

- (unint64_t)numThreadBorderRouters
{
  return self->_numThreadBorderRouters;
}

- (NSArray)multiUserSettings
{
  return self->_multiUserSettings;
}

- (void)setMultiUserSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 720);
}

- (NSArray)eventTriggers
{
  return self->_eventTriggers;
}

- (void)setEventTriggers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 728);
}

- (NSArray)hapServices
{
  return self->_hapServices;
}

- (int64_t)currentMediaAccessoryFallbackMediaUserType
{
  return self->_currentMediaAccessoryFallbackMediaUserType;
}

- (unint64_t)numHomePods
{
  return self->_numHomePods;
}

- (unint64_t)numHomePodMinis
{
  return self->_numHomePodMinis;
}

- (unint64_t)numHomePod2ndGen
{
  return self->_numHomePod2ndGen;
}

- (unint64_t)numMediaSystems
{
  return self->_numMediaSystems;
}

- (unint64_t)numHomePodStereoPairs
{
  return self->_numHomePodStereoPairs;
}

- (unint64_t)numHomePodMiniStereoPairs
{
  return self->_numHomePodMiniStereoPairs;
}

- (unint64_t)numHomePod2ndGenStereoPairs
{
  return self->_numHomePod2ndGenStereoPairs;
}

- (NSNumber)numBSPs
{
  return (NSNumber *)objc_getProperty(self, a2, 808, 1);
}

- (unint64_t)numWoLAccessories
{
  return self->_numWoLAccessories;
}

- (unsigned)databaseSize
{
  return self->_databaseSize;
}

- (void)setDatabaseSize:(unsigned int)a3
{
  self->_databaseSize = a3;
}

- (unsigned)metadataVersion
{
  return self->_metadataVersion;
}

- (void)setMetadataVersion:(unsigned int)a3
{
  self->_metadataVersion = a3;
}

- (unint64_t)numHAPLocks
{
  return self->_numHAPLocks;
}

- (unint64_t)numMatterLocks
{
  return self->_numMatterLocks;
}

- (unint64_t)numLocksWithAccessCodeSupported
{
  return self->_numLocksWithAccessCodeSupported;
}

- (unint64_t)numLocksWithWalletKeySupported
{
  return self->_numLocksWithWalletKeySupported;
}

- (unint64_t)ownerPerspectiveNumUsersWithAccessCode
{
  return self->_ownerPerspectiveNumUsersWithAccessCode;
}

- (unint64_t)numAccessoriesWithWalletKeySupported
{
  return self->_numAccessoriesWithWalletKeySupported;
}

- (BOOL)hasHomeKeyInWallet
{
  return self->_hasHomeKeyInWallet;
}

- (BOOL)isSmokeAlarmEnabled
{
  return self->_isSmokeAlarmEnabled;
}

- (BOOL)isSiriPhraseOptionsHeySiriEnabled
{
  return self->_isSiriPhraseOptionsHeySiriEnabled;
}

- (BOOL)isSiriPhraseOptionsJustSiriEnabled
{
  return self->_isSiriPhraseOptionsJustSiriEnabled;
}

- (unint64_t)residentElectionBitMask
{
  return self->_residentElectionBitMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numBSPs, 0);
  objc_storeStrong((id *)&self->_hapServices, 0);
  objc_storeStrong((id *)&self->_eventTriggers, 0);
  objc_storeStrong((id *)&self->_multiUserSettings, 0);
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_18_64706);

  return v3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "homePodVariant");

  return v5 == 1;
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_16_64707);

  return v3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "homePodVariant");

  return v5 == 3;
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_14_64708);

  return v3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "homePodVariant");

  return v5 == 2;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "homePodVariant");

  return v5 == 1;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "homePodVariant");

  return v5 == 3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "homePodVariant");

  return v5 == 2;
}

@end
