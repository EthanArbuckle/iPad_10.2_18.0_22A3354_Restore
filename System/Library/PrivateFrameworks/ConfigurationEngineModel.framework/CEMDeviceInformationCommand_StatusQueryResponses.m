@implementation CEMDeviceInformationCommand_StatusQueryResponses

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[60];

  v6[59] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("UDID");
  v6[1] = CFSTR("OrganizationInfo");
  v6[2] = CFSTR("MDMOptions");
  v6[3] = CFSTR("LastCloudBackupDate");
  v6[4] = CFSTR("AwaitingConfiguration");
  v6[5] = CFSTR("iTunesStoreAccountIsActive");
  v6[6] = CFSTR("iTunesStoreAccountHash");
  v6[7] = CFSTR("DeviceName");
  v6[8] = CFSTR("OSVersion");
  v6[9] = CFSTR("BuildVersion");
  v6[10] = CFSTR("ModelName");
  v6[11] = CFSTR("Model");
  v6[12] = CFSTR("ProductName");
  v6[13] = CFSTR("MarketingName");
  v6[14] = CFSTR("SerialNumber");
  v6[15] = CFSTR("DeviceCapacity");
  v6[16] = CFSTR("AvailableDeviceCapacity");
  v6[17] = CFSTR("IMEI");
  v6[18] = CFSTR("MEID");
  v6[19] = CFSTR("ModemFirmwareVersion");
  v6[20] = CFSTR("CellularTechnology");
  v6[21] = CFSTR("BatteryLevel");
  v6[22] = CFSTR("IsSupervised");
  v6[23] = CFSTR("IsMultiUser");
  v6[24] = CFSTR("IsDeviceLocatorServiceEnabled");
  v6[25] = CFSTR("IsActivationLockEnabled");
  v6[26] = CFSTR("IsDoNotDisturbInEffect");
  v6[27] = CFSTR("DeviceID");
  v6[28] = CFSTR("EASDeviceIdentifier");
  v6[29] = CFSTR("IsCloudBackupEnabled");
  v6[30] = CFSTR("ActiveManagedUsers");
  v6[31] = CFSTR("OSUpdateSettings");
  v6[32] = CFSTR("AutoSetupAdminAccounts");
  v6[33] = CFSTR("SystemIntegrityProtectionEnabled");
  v6[34] = CFSTR("IsMDMLostModeEnabled");
  v6[35] = CFSTR("MaximumResidentUsers");
  v6[36] = CFSTR("PushToken");
  v6[37] = CFSTR("DiagnosticSubmissionEnabled");
  v6[38] = CFSTR("AppAnalyticsEnabled");
  v6[39] = CFSTR("ICCID");
  v6[40] = CFSTR("BluetoothMAC");
  v6[41] = CFSTR("WiFiMAC");
  v6[42] = CFSTR("EthernetMACs");
  v6[43] = CFSTR("CurrentCarrierNetwork");
  v6[44] = CFSTR("SIMCarrierNetwork");
  v6[45] = CFSTR("SubscriberCarrierNetwork");
  v6[46] = CFSTR("CarrierSettingsVersion");
  v6[47] = CFSTR("PhoneNumber");
  v6[48] = CFSTR("DataRoamingEnabled");
  v6[49] = CFSTR("VoiceRoamingEnabled");
  v6[50] = CFSTR("PersonalHotspotEnabled");
  v6[51] = CFSTR("IsNetworkTethered");
  v6[52] = CFSTR("IsRoaming");
  v6[53] = CFSTR("SIMMCC");
  v6[54] = CFSTR("SIMMNC");
  v6[55] = CFSTR("SubscriberMCC");
  v6[56] = CFSTR("SubscriberMNC");
  v6[57] = CFSTR("CurrentMCC");
  v6[58] = CFSTR("CurrentMNC");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 59);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithUDID:(id)a3 withOrganizationInfo:(id)a4 withMDMOptions:(id)a5 withLastCloudBackupDate:(id)a6 withAwaitingConfiguration:(id)a7 withITunesStoreAccountIsActive:(id)a8 withITunesStoreAccountHash:(id)a9 withDeviceName:(id)a10 withOSVersion:(id)a11 withBuildVersion:(id)a12 withModelName:(id)a13 withModel:(id)a14 withProductName:(id)a15 withMarketingName:(id)a16 withSerialNumber:(id)a17 withDeviceCapacity:(id)a18 withAvailableDeviceCapacity:(id)a19 withIMEI:(id)a20 withMEID:(id)a21 withModemFirmwareVersion:(id)a22 withCellularTechnology:(id)a23 withBatteryLevel:(id)a24 withIsSupervised:(id)a25 withIsMultiUser:(id)a26 withIsDeviceLocatorServiceEnabled:(id)a27 withIsActivationLockEnabled:(id)a28 withIsDoNotDisturbInEffect:(id)a29 withDeviceID:(id)a30 withEASDeviceIdentifier:(id)a31 withIsCloudBackupEnabled:(id)a32 withActiveManagedUsers:(id)a33 withOSUpdateSettings:(id)a34 withAutoSetupAdminAccounts:(id)a35 withSystemIntegrityProtectionEnabled:(id)a36 withIsMDMLostModeEnabled:(id)a37 withMaximumResidentUsers:(id)a38 withPushToken:(id)a39 withDiagnosticSubmissionEnabled:(id)a40 withAppAnalyticsEnabled:(id)a41 withICCID:(id)a42 withBluetoothMAC:(id)a43 withWiFiMAC:(id)a44 withEthernetMACs:(id)a45 withCurrentCarrierNetwork:(id)a46 withSIMCarrierNetwork:(id)a47 withSubscriberCarrierNetwork:(id)a48 withCarrierSettingsVersion:(id)a49 withPhoneNumber:(id)a50 withDataRoamingEnabled:(id)a51 withVoiceRoamingEnabled:(id)a52 withPersonalHotspotEnabled:(id)a53 withIsNetworkTethered:(id)a54 withIsRoaming:(id)a55 withSIMMCC:(id)a56 withSIMMNC:(id)a57 withSubscriberMCC:(id)a58 withSubscriberMNC:(id)a59 withCurrentMCC:(id)a60 withCurrentMNC:(id)a61
{
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v87;
  id v91;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;

  v127 = a61;
  v126 = a60;
  v125 = a59;
  v124 = a58;
  v123 = a57;
  v122 = a56;
  v121 = a55;
  v120 = a54;
  v119 = a53;
  v118 = a52;
  v117 = a51;
  v116 = a50;
  v115 = a49;
  v114 = a48;
  v113 = a47;
  v112 = a46;
  v111 = a45;
  v110 = a44;
  v109 = a43;
  v108 = a42;
  v107 = a41;
  v106 = a40;
  v105 = a39;
  v104 = a38;
  v103 = a37;
  v102 = a36;
  v101 = a35;
  v100 = a34;
  v99 = a33;
  v98 = a32;
  v97 = a31;
  v96 = a30;
  v95 = a29;
  v94 = a28;
  v91 = a27;
  v87 = a26;
  v85 = a25;
  v84 = a24;
  v81 = a23;
  v77 = a22;
  v74 = a21;
  v72 = a20;
  v73 = a19;
  v75 = a18;
  v76 = a17;
  v78 = a16;
  v79 = a15;
  v80 = a14;
  v82 = a13;
  v83 = a12;
  v61 = a11;
  v62 = a10;
  v63 = a9;
  v64 = a8;
  v65 = a7;
  v66 = a6;
  v67 = a5;
  v68 = a4;
  v69 = a3;
  v70 = (void *)objc_opt_new();
  objc_msgSend(v70, "setStatusUDID:", v69);

  objc_msgSend(v70, "setStatusOrganizationInfo:", v68);
  objc_msgSend(v70, "setStatusMDMOptions:", v67);

  objc_msgSend(v70, "setStatusLastCloudBackupDate:", v66);
  objc_msgSend(v70, "setStatusAwaitingConfiguration:", v65);

  objc_msgSend(v70, "setStatusITunesStoreAccountIsActive:", v64);
  objc_msgSend(v70, "setStatusITunesStoreAccountHash:", v63);

  objc_msgSend(v70, "setStatusDeviceName:", v62);
  objc_msgSend(v70, "setStatusOSVersion:", v61);

  objc_msgSend(v70, "setStatusBuildVersion:", v83);
  objc_msgSend(v70, "setStatusModelName:", v82);

  objc_msgSend(v70, "setStatusModel:", v80);
  objc_msgSend(v70, "setStatusProductName:", v79);

  objc_msgSend(v70, "setStatusMarketingName:", v78);
  objc_msgSend(v70, "setStatusSerialNumber:", v76);

  objc_msgSend(v70, "setStatusDeviceCapacity:", v75);
  objc_msgSend(v70, "setStatusAvailableDeviceCapacity:", v73);

  objc_msgSend(v70, "setStatusIMEI:", v72);
  objc_msgSend(v70, "setStatusMEID:", v74);

  objc_msgSend(v70, "setStatusModemFirmwareVersion:", v77);
  objc_msgSend(v70, "setStatusCellularTechnology:", v81);

  objc_msgSend(v70, "setStatusBatteryLevel:", v84);
  objc_msgSend(v70, "setStatusIsSupervised:", v85);

  objc_msgSend(v70, "setStatusIsMultiUser:", v87);
  objc_msgSend(v70, "setStatusIsDeviceLocatorServiceEnabled:", v91);

  objc_msgSend(v70, "setStatusIsActivationLockEnabled:", v94);
  objc_msgSend(v70, "setStatusIsDoNotDisturbInEffect:", v95);

  objc_msgSend(v70, "setStatusDeviceID:", v96);
  objc_msgSend(v70, "setStatusEASDeviceIdentifier:", v97);

  objc_msgSend(v70, "setStatusIsCloudBackupEnabled:", v98);
  objc_msgSend(v70, "setStatusActiveManagedUsers:", v99);

  objc_msgSend(v70, "setStatusOSUpdateSettings:", v100);
  objc_msgSend(v70, "setStatusAutoSetupAdminAccounts:", v101);

  objc_msgSend(v70, "setStatusSystemIntegrityProtectionEnabled:", v102);
  objc_msgSend(v70, "setStatusIsMDMLostModeEnabled:", v103);

  objc_msgSend(v70, "setStatusMaximumResidentUsers:", v104);
  objc_msgSend(v70, "setStatusPushToken:", v105);

  objc_msgSend(v70, "setStatusDiagnosticSubmissionEnabled:", v106);
  objc_msgSend(v70, "setStatusAppAnalyticsEnabled:", v107);

  objc_msgSend(v70, "setStatusICCID:", v108);
  objc_msgSend(v70, "setStatusBluetoothMAC:", v109);

  objc_msgSend(v70, "setStatusWiFiMAC:", v110);
  objc_msgSend(v70, "setStatusEthernetMACs:", v111);

  objc_msgSend(v70, "setStatusCurrentCarrierNetwork:", v112);
  objc_msgSend(v70, "setStatusSIMCarrierNetwork:", v113);

  objc_msgSend(v70, "setStatusSubscriberCarrierNetwork:", v114);
  objc_msgSend(v70, "setStatusCarrierSettingsVersion:", v115);

  objc_msgSend(v70, "setStatusPhoneNumber:", v116);
  objc_msgSend(v70, "setStatusDataRoamingEnabled:", v117);

  objc_msgSend(v70, "setStatusVoiceRoamingEnabled:", v118);
  objc_msgSend(v70, "setStatusPersonalHotspotEnabled:", v119);

  objc_msgSend(v70, "setStatusIsNetworkTethered:", v120);
  objc_msgSend(v70, "setStatusIsRoaming:", v121);

  objc_msgSend(v70, "setStatusSIMMCC:", v122);
  objc_msgSend(v70, "setStatusSIMMNC:", v123);

  objc_msgSend(v70, "setStatusSubscriberMCC:", v124);
  objc_msgSend(v70, "setStatusSubscriberMNC:", v125);

  objc_msgSend(v70, "setStatusCurrentMCC:", v126);
  objc_msgSend(v70, "setStatusCurrentMNC:", v127);

  return v70;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSString *v15;
  NSString *statusUDID;
  CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo *v17;
  CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo *statusOrganizationInfo;
  NSString *v19;
  NSString *statusMDMOptions;
  NSDate *v21;
  NSDate *statusLastCloudBackupDate;
  NSNumber *v23;
  NSNumber *statusAwaitingConfiguration;
  NSNumber *v25;
  NSNumber *statusITunesStoreAccountIsActive;
  NSString *v27;
  NSString *statusITunesStoreAccountHash;
  NSString *v29;
  NSString *statusDeviceName;
  NSString *v31;
  NSString *statusOSVersion;
  NSString *v33;
  NSString *statusBuildVersion;
  NSString *v35;
  NSString *statusModelName;
  NSString *v37;
  NSString *statusModel;
  NSString *v39;
  NSString *statusProductName;
  NSString *v41;
  NSString *statusMarketingName;
  NSString *v43;
  NSString *statusSerialNumber;
  NSNumber *v45;
  NSNumber *statusDeviceCapacity;
  NSNumber *v47;
  NSNumber *statusAvailableDeviceCapacity;
  NSString *v49;
  NSString *statusIMEI;
  NSString *v51;
  NSString *statusMEID;
  NSString *v53;
  NSString *statusModemFirmwareVersion;
  NSNumber *v55;
  NSNumber *statusCellularTechnology;
  NSNumber *v57;
  NSNumber *statusBatteryLevel;
  NSNumber *v59;
  NSNumber *statusIsSupervised;
  NSNumber *v61;
  NSNumber *statusIsMultiUser;
  NSNumber *v63;
  NSNumber *statusIsDeviceLocatorServiceEnabled;
  NSNumber *v65;
  NSNumber *statusIsActivationLockEnabled;
  NSNumber *v67;
  NSNumber *statusIsDoNotDisturbInEffect;
  NSString *v69;
  NSString *statusDeviceID;
  NSString *v71;
  NSString *statusEASDeviceIdentifier;
  NSNumber *v73;
  NSNumber *statusIsCloudBackupEnabled;
  NSArray *v75;
  NSArray *statusActiveManagedUsers;
  CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings *v77;
  CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings *statusOSUpdateSettings;
  NSArray *v79;
  NSArray *statusAutoSetupAdminAccounts;
  NSNumber *v81;
  NSNumber *statusSystemIntegrityProtectionEnabled;
  NSNumber *v83;
  NSNumber *statusIsMDMLostModeEnabled;
  NSNumber *v85;
  NSNumber *statusMaximumResidentUsers;
  NSString *v87;
  NSString *statusPushToken;
  NSNumber *v89;
  NSNumber *statusDiagnosticSubmissionEnabled;
  NSNumber *v91;
  NSNumber *statusAppAnalyticsEnabled;
  NSString *v93;
  NSString *statusICCID;
  NSString *v95;
  NSString *statusBluetoothMAC;
  NSString *v97;
  NSString *statusWiFiMAC;
  NSArray *v99;
  NSArray *statusEthernetMACs;
  NSString *v101;
  NSString *statusCurrentCarrierNetwork;
  NSString *v103;
  NSString *statusSIMCarrierNetwork;
  NSString *v105;
  NSString *statusSubscriberCarrierNetwork;
  NSString *v107;
  NSString *statusCarrierSettingsVersion;
  NSString *v109;
  NSString *statusPhoneNumber;
  NSNumber *v111;
  NSNumber *statusDataRoamingEnabled;
  NSNumber *v113;
  NSNumber *statusVoiceRoamingEnabled;
  NSNumber *v115;
  NSNumber *statusPersonalHotspotEnabled;
  NSNumber *v117;
  NSNumber *statusIsNetworkTethered;
  NSNumber *v119;
  NSNumber *statusIsRoaming;
  NSString *v121;
  NSString *statusSIMMCC;
  NSString *v123;
  NSString *statusSIMMNC;
  NSString *v125;
  NSString *statusSubscriberMCC;
  NSString *v127;
  NSString *statusSubscriberMNC;
  NSString *v129;
  NSString *statusCurrentMCC;
  NSString *v131;
  NSString *statusCurrentMNC;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  uint64_t v193;
  _QWORD v194[2];

  v194[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceInformationCommand_StatusQueryResponses allowedStatusKeys](CEMDeviceInformationCommand_StatusQueryResponses, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_68;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v193 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v194[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v194, &v193, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v192 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UDID"), 0, 0, &v192);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = v192;
    statusUDID = self->_statusUDID;
    self->_statusUDID = v15;

    if (!v12)
    {
      v191 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("OrganizationInfo"), objc_opt_class(), 0, 0, &v191);
      v17 = (CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo *)objc_claimAutoreleasedReturnValue();
      v12 = v191;
      statusOrganizationInfo = self->_statusOrganizationInfo;
      self->_statusOrganizationInfo = v17;

      if (!v12)
      {
        v190 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("MDMOptions"), 0, 0, &v190);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = v190;
        statusMDMOptions = self->_statusMDMOptions;
        self->_statusMDMOptions = v19;

        if (!v12)
        {
          v189 = 0;
          -[CEMPayloadBase loadDateFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadDateFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LastCloudBackupDate"), 0, 0, &v189);
          v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v12 = v189;
          statusLastCloudBackupDate = self->_statusLastCloudBackupDate;
          self->_statusLastCloudBackupDate = v21;

          if (!v12)
          {
            v188 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AwaitingConfiguration"), 0, 0, &v188);
            v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v12 = v188;
            statusAwaitingConfiguration = self->_statusAwaitingConfiguration;
            self->_statusAwaitingConfiguration = v23;

            if (!v12)
            {
              v187 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("iTunesStoreAccountIsActive"), 0, 0, &v187);
              v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v12 = v187;
              statusITunesStoreAccountIsActive = self->_statusITunesStoreAccountIsActive;
              self->_statusITunesStoreAccountIsActive = v25;

              if (!v12)
              {
                v186 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("iTunesStoreAccountHash"), 0, 0, &v186);
                v27 = (NSString *)objc_claimAutoreleasedReturnValue();
                v12 = v186;
                statusITunesStoreAccountHash = self->_statusITunesStoreAccountHash;
                self->_statusITunesStoreAccountHash = v27;

                if (!v12)
                {
                  v185 = 0;
                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeviceName"), 0, 0, &v185);
                  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v12 = v185;
                  statusDeviceName = self->_statusDeviceName;
                  self->_statusDeviceName = v29;

                  if (!v12)
                  {
                    v184 = 0;
                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OSVersion"), 0, 0, &v184);
                    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v12 = v184;
                    statusOSVersion = self->_statusOSVersion;
                    self->_statusOSVersion = v31;

                    if (!v12)
                    {
                      v183 = 0;
                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BuildVersion"), 0, 0, &v183);
                      v33 = (NSString *)objc_claimAutoreleasedReturnValue();
                      v12 = v183;
                      statusBuildVersion = self->_statusBuildVersion;
                      self->_statusBuildVersion = v33;

                      if (!v12)
                      {
                        v182 = 0;
                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ModelName"), 0, 0, &v182);
                        v35 = (NSString *)objc_claimAutoreleasedReturnValue();
                        v12 = v182;
                        statusModelName = self->_statusModelName;
                        self->_statusModelName = v35;

                        if (!v12)
                        {
                          v181 = 0;
                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Model"), 0, 0, &v181);
                          v37 = (NSString *)objc_claimAutoreleasedReturnValue();
                          v12 = v181;
                          statusModel = self->_statusModel;
                          self->_statusModel = v37;

                          if (!v12)
                          {
                            v180 = 0;
                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProductName"), 0, 0, &v180);
                            v39 = (NSString *)objc_claimAutoreleasedReturnValue();
                            v12 = v180;
                            statusProductName = self->_statusProductName;
                            self->_statusProductName = v39;

                            if (!v12)
                            {
                              v179 = 0;
                              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("MarketingName"), 0, 0, &v179);
                              v41 = (NSString *)objc_claimAutoreleasedReturnValue();
                              v12 = v179;
                              statusMarketingName = self->_statusMarketingName;
                              self->_statusMarketingName = v41;

                              if (!v12)
                              {
                                v178 = 0;
                                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SerialNumber"), 0, 0, &v178);
                                v43 = (NSString *)objc_claimAutoreleasedReturnValue();
                                v12 = v178;
                                statusSerialNumber = self->_statusSerialNumber;
                                self->_statusSerialNumber = v43;

                                if (!v12)
                                {
                                  v177 = 0;
                                  -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeviceCapacity"), 0, 0, &v177);
                                  v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v12 = v177;
                                  statusDeviceCapacity = self->_statusDeviceCapacity;
                                  self->_statusDeviceCapacity = v45;

                                  if (!v12)
                                  {
                                    v176 = 0;
                                    -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AvailableDeviceCapacity"), 0, 0, &v176);
                                    v47 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                    v12 = v176;
                                    statusAvailableDeviceCapacity = self->_statusAvailableDeviceCapacity;
                                    self->_statusAvailableDeviceCapacity = v47;

                                    if (!v12)
                                    {
                                      v175 = 0;
                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IMEI"), 0, 0, &v175);
                                      v49 = (NSString *)objc_claimAutoreleasedReturnValue();
                                      v12 = v175;
                                      statusIMEI = self->_statusIMEI;
                                      self->_statusIMEI = v49;

                                      if (!v12)
                                      {
                                        v174 = 0;
                                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("MEID"), 0, 0, &v174);
                                        v51 = (NSString *)objc_claimAutoreleasedReturnValue();
                                        v12 = v174;
                                        statusMEID = self->_statusMEID;
                                        self->_statusMEID = v51;

                                        if (!v12)
                                        {
                                          v173 = 0;
                                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ModemFirmwareVersion"), 0, 0, &v173);
                                          v53 = (NSString *)objc_claimAutoreleasedReturnValue();
                                          v12 = v173;
                                          statusModemFirmwareVersion = self->_statusModemFirmwareVersion;
                                          self->_statusModemFirmwareVersion = v53;

                                          if (!v12)
                                          {
                                            v172 = 0;
                                            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CellularTechnology"), 0, 0, &v172);
                                            v55 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                            v12 = v172;
                                            statusCellularTechnology = self->_statusCellularTechnology;
                                            self->_statusCellularTechnology = v55;

                                            if (!v12)
                                            {
                                              v171 = 0;
                                              -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BatteryLevel"), 0, 0, &v171);
                                              v57 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                              v12 = v171;
                                              statusBatteryLevel = self->_statusBatteryLevel;
                                              self->_statusBatteryLevel = v57;

                                              if (!v12)
                                              {
                                                v170 = 0;
                                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsSupervised"), 0, 0, &v170);
                                                v59 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                v12 = v170;
                                                statusIsSupervised = self->_statusIsSupervised;
                                                self->_statusIsSupervised = v59;

                                                if (!v12)
                                                {
                                                  v169 = 0;
                                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsMultiUser"), 0, 0, &v169);
                                                  v61 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                  v12 = v169;
                                                  statusIsMultiUser = self->_statusIsMultiUser;
                                                  self->_statusIsMultiUser = v61;

                                                  if (!v12)
                                                  {
                                                    v168 = 0;
                                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsDeviceLocatorServiceEnabled"), 0, 0, &v168);
                                                    v63 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                    v12 = v168;
                                                    statusIsDeviceLocatorServiceEnabled = self->_statusIsDeviceLocatorServiceEnabled;
                                                    self->_statusIsDeviceLocatorServiceEnabled = v63;

                                                    if (!v12)
                                                    {
                                                      v167 = 0;
                                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsActivationLockEnabled"), 0, 0, &v167);
                                                      v65 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                      v12 = v167;
                                                      statusIsActivationLockEnabled = self->_statusIsActivationLockEnabled;
                                                      self->_statusIsActivationLockEnabled = v65;

                                                      if (!v12)
                                                      {
                                                        v166 = 0;
                                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsDoNotDisturbInEffect"), 0, 0, &v166);
                                                        v67 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                        v12 = v166;
                                                        statusIsDoNotDisturbInEffect = self->_statusIsDoNotDisturbInEffect;
                                                        self->_statusIsDoNotDisturbInEffect = v67;

                                                        if (!v12)
                                                        {
                                                          v165 = 0;
                                                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeviceID"), 0, 0, &v165);
                                                          v69 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                          v12 = v165;
                                                          statusDeviceID = self->_statusDeviceID;
                                                          self->_statusDeviceID = v69;

                                                          if (!v12)
                                                          {
                                                            v164 = 0;
                                                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EASDeviceIdentifier"), 0, 0, &v164);
                                                            v71 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                            v12 = v164;
                                                            statusEASDeviceIdentifier = self->_statusEASDeviceIdentifier;
                                                            self->_statusEASDeviceIdentifier = v71;

                                                            if (!v12)
                                                            {
                                                              v163 = 0;
                                                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsCloudBackupEnabled"), 0, 0, &v163);
                                                              v73 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                              v12 = v163;
                                                              statusIsCloudBackupEnabled = self->_statusIsCloudBackupEnabled;
                                                              self->_statusIsCloudBackupEnabled = v73;

                                                              if (!v12)
                                                              {
                                                                v162 = 0;
                                                                -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("ActiveManagedUsers"), &__block_literal_global_240, 0, 0, &v162);
                                                                v75 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                                                v12 = v162;
                                                                statusActiveManagedUsers = self->_statusActiveManagedUsers;
                                                                self->_statusActiveManagedUsers = v75;

                                                                if (!v12)
                                                                {
                                                                  v161 = 0;
                                                                  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("OSUpdateSettings"), objc_opt_class(), 0, 0, &v161);
                                                                  v77 = (CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings *)objc_claimAutoreleasedReturnValue();
                                                                  v12 = v161;
                                                                  statusOSUpdateSettings = self->_statusOSUpdateSettings;
                                                                  self->_statusOSUpdateSettings = v77;

                                                                  if (!v12)
                                                                  {
                                                                    v160 = 0;
                                                                    -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("AutoSetupAdminAccounts"), objc_opt_class(), 0, 0, 0, &v160);
                                                                    v79 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                                                    v12 = v160;
                                                                    statusAutoSetupAdminAccounts = self->_statusAutoSetupAdminAccounts;
                                                                    self->_statusAutoSetupAdminAccounts = v79;

                                                                    if (!v12)
                                                                    {
                                                                      v159 = 0;
                                                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SystemIntegrityProtectionEnabled"), 0, 0, &v159);
                                                                      v81 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                      v12 = v159;
                                                                      statusSystemIntegrityProtectionEnabled = self->_statusSystemIntegrityProtectionEnabled;
                                                                      self->_statusSystemIntegrityProtectionEnabled = v81;

                                                                      if (!v12)
                                                                      {
                                                                        v158 = 0;
                                                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsMDMLostModeEnabled"), 0, 0, &v158);
                                                                        v83 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                        v12 = v158;
                                                                        statusIsMDMLostModeEnabled = self->_statusIsMDMLostModeEnabled;
                                                                        self->_statusIsMDMLostModeEnabled = v83;

                                                                        if (!v12)
                                                                        {
                                                                          v157 = 0;
                                                                          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("MaximumResidentUsers"), 0, 0, &v157);
                                                                          v85 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                          v12 = v157;
                                                                          statusMaximumResidentUsers = self->_statusMaximumResidentUsers;
                                                                          self->_statusMaximumResidentUsers = v85;

                                                                          if (!v12)
                                                                          {
                                                                            v156 = 0;
                                                                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PushToken"), 0, 0, &v156);
                                                                            v87 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                            v12 = v156;
                                                                            statusPushToken = self->_statusPushToken;
                                                                            self->_statusPushToken = v87;

                                                                            if (!v12)
                                                                            {
                                                                              v155 = 0;
                                                                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DiagnosticSubmissionEnabled"), 0, 0, &v155);
                                                                              v89 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                              v12 = v155;
                                                                              statusDiagnosticSubmissionEnabled = self->_statusDiagnosticSubmissionEnabled;
                                                                              self->_statusDiagnosticSubmissionEnabled = v89;

                                                                              if (!v12)
                                                                              {
                                                                                v154 = 0;
                                                                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AppAnalyticsEnabled"), 0, 0, &v154);
                                                                                v91 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                                v12 = v154;
                                                                                statusAppAnalyticsEnabled = self->_statusAppAnalyticsEnabled;
                                                                                self->_statusAppAnalyticsEnabled = v91;

                                                                                if (!v12)
                                                                                {
                                                                                  v153 = 0;
                                                                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ICCID"), 0, 0, &v153);
                                                                                  v93 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                  v12 = v153;
                                                                                  statusICCID = self->_statusICCID;
                                                                                  self->_statusICCID = v93;

                                                                                  if (!v12)
                                                                                  {
                                                                                    v152 = 0;
                                                                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BluetoothMAC"), 0, 0, &v152);
                                                                                    v95 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                    v12 = v152;
                                                                                    statusBluetoothMAC = self->_statusBluetoothMAC;
                                                                                    self->_statusBluetoothMAC = v95;

                                                                                    if (!v12)
                                                                                    {
                                                                                      v151 = 0;
                                                                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("WiFiMAC"), 0, 0, &v151);
                                                                                      v97 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                      v12 = v151;
                                                                                      statusWiFiMAC = self->_statusWiFiMAC;
                                                                                      self->_statusWiFiMAC = v97;

                                                                                      if (!v12)
                                                                                      {
                                                                                        v150 = 0;
                                                                                        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("EthernetMACs"), &__block_literal_global_243, 0, 0, &v150);
                                                                                        v99 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                                                                        v12 = v150;
                                                                                        statusEthernetMACs = self->_statusEthernetMACs;
                                                                                        self->_statusEthernetMACs = v99;

                                                                                        if (!v12)
                                                                                        {
                                                                                          v149 = 0;
                                                                                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CurrentCarrierNetwork"), 0, 0, &v149);
                                                                                          v101 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                          v12 = v149;
                                                                                          statusCurrentCarrierNetwork = self->_statusCurrentCarrierNetwork;
                                                                                          self->_statusCurrentCarrierNetwork = v101;

                                                                                          if (!v12)
                                                                                          {
                                                                                            v148 = 0;
                                                                                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SIMCarrierNetwork"), 0, 0, &v148);
                                                                                            v103 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                            v12 = v148;
                                                                                            statusSIMCarrierNetwork = self->_statusSIMCarrierNetwork;
                                                                                            self->_statusSIMCarrierNetwork = v103;

                                                                                            if (!v12)
                                                                                            {
                                                                                              v147 = 0;
                                                                                              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SubscriberCarrierNetwork"), 0, 0, &v147);
                                                                                              v105 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                              v12 = v147;
                                                                                              statusSubscriberCarrierNetwork = self->_statusSubscriberCarrierNetwork;
                                                                                              self->_statusSubscriberCarrierNetwork = v105;

                                                                                              if (!v12)
                                                                                              {
                                                                                                v146 = 0;
                                                                                                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CarrierSettingsVersion"), 0, 0, &v146);
                                                                                                v107 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                v12 = v146;
                                                                                                statusCarrierSettingsVersion = self->_statusCarrierSettingsVersion;
                                                                                                self->_statusCarrierSettingsVersion = v107;

                                                                                                if (!v12)
                                                                                                {
                                                                                                  v145 = 0;
                                                                                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PhoneNumber"), 0, 0, &v145);
                                                                                                  v109 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                  v12 = v145;
                                                                                                  statusPhoneNumber = self->_statusPhoneNumber;
                                                                                                  self->_statusPhoneNumber = v109;

                                                                                                  if (!v12)
                                                                                                  {
                                                                                                    v144 = 0;
                                                                                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DataRoamingEnabled"), 0, 0, &v144);
                                                                                                    v111 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                                                    v12 = v144;
                                                                                                    statusDataRoamingEnabled = self->_statusDataRoamingEnabled;
                                                                                                    self->_statusDataRoamingEnabled = v111;

                                                                                                    if (!v12)
                                                                                                    {
                                                                                                      v143 = 0;
                                                                                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("VoiceRoamingEnabled"), 0, 0, &v143);
                                                                                                      v113 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                                                      v12 = v143;
                                                                                                      statusVoiceRoamingEnabled = self->_statusVoiceRoamingEnabled;
                                                                                                      self->_statusVoiceRoamingEnabled = v113;

                                                                                                      if (!v12)
                                                                                                      {
                                                                                                        v142 = 0;
                                                                                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PersonalHotspotEnabled"), 0, 0, &v142);
                                                                                                        v115 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                                                        v12 = v142;
                                                                                                        statusPersonalHotspotEnabled = self->_statusPersonalHotspotEnabled;
                                                                                                        self->_statusPersonalHotspotEnabled = v115;

                                                                                                        if (!v12)
                                                                                                        {
                                                                                                          v141 = 0;
                                                                                                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsNetworkTethered"), 0, 0, &v141);
                                                                                                          v117 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                                                          v12 = v141;
                                                                                                          statusIsNetworkTethered = self->_statusIsNetworkTethered;
                                                                                                          self->_statusIsNetworkTethered = v117;

                                                                                                          if (!v12)
                                                                                                          {
                                                                                                            v140 = 0;
                                                                                                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsRoaming"), 0, 0, &v140);
                                                                                                            v119 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                                                                            v12 = v140;
                                                                                                            statusIsRoaming = self->_statusIsRoaming;
                                                                                                            self->_statusIsRoaming = v119;

                                                                                                            if (!v12)
                                                                                                            {
                                                                                                              v139 = 0;
                                                                                                              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SIMMCC"), 0, 0, &v139);
                                                                                                              v121 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                              v12 = v139;
                                                                                                              statusSIMMCC = self->_statusSIMMCC;
                                                                                                              self->_statusSIMMCC = v121;

                                                                                                              if (!v12)
                                                                                                              {
                                                                                                                v138 = 0;
                                                                                                                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SIMMNC"), 0, 0, &v138);
                                                                                                                v123 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                                v12 = v138;
                                                                                                                statusSIMMNC = self->_statusSIMMNC;
                                                                                                                self->_statusSIMMNC = v123;

                                                                                                                if (!v12)
                                                                                                                {
                                                                                                                  v137 = 0;
                                                                                                                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SubscriberMCC"), 0, 0, &v137);
                                                                                                                  v125 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                                  v12 = v137;
                                                                                                                  statusSubscriberMCC = self->_statusSubscriberMCC;
                                                                                                                  self->_statusSubscriberMCC = v125;

                                                                                                                  if (!v12)
                                                                                                                  {
                                                                                                                    v136 = 0;
                                                                                                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SubscriberMNC"), 0, 0, &v136);
                                                                                                                    v127 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                                    v12 = v136;
                                                                                                                    statusSubscriberMNC = self->_statusSubscriberMNC;
                                                                                                                    self->_statusSubscriberMNC = v127;

                                                                                                                    if (!v12)
                                                                                                                    {
                                                                                                                      v135 = 0;
                                                                                                                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CurrentMCC"), 0, 0, &v135);
                                                                                                                      v129 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                                      v12 = v135;
                                                                                                                      statusCurrentMCC = self->_statusCurrentMCC;
                                                                                                                      self->_statusCurrentMCC = v129;

                                                                                                                      if (!v12)
                                                                                                                      {
                                                                                                                        v134 = 0;
                                                                                                                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CurrentMNC"), 0, 0, &v134);
                                                                                                                        v131 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                                                                                        v12 = v134;
                                                                                                                        statusCurrentMNC = self->_statusCurrentMNC;
                                                                                                                        self->_statusCurrentMNC = v131;

                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_68:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("UDID"), self->_statusUDID, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("OrganizationInfo"), self->_statusOrganizationInfo, &__block_literal_global_244, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("MDMOptions"), self->_statusMDMOptions, 0, 0);
  -[CEMPayloadBase serializeDateIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeDateIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("LastCloudBackupDate"), self->_statusLastCloudBackupDate, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AwaitingConfiguration"), self->_statusAwaitingConfiguration, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("iTunesStoreAccountIsActive"), self->_statusITunesStoreAccountIsActive, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("iTunesStoreAccountHash"), self->_statusITunesStoreAccountHash, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DeviceName"), self->_statusDeviceName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("OSVersion"), self->_statusOSVersion, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BuildVersion"), self->_statusBuildVersion, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ModelName"), self->_statusModelName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Model"), self->_statusModel, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ProductName"), self->_statusProductName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("MarketingName"), self->_statusMarketingName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SerialNumber"), self->_statusSerialNumber, 0, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DeviceCapacity"), self->_statusDeviceCapacity, 0, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AvailableDeviceCapacity"), self->_statusAvailableDeviceCapacity, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IMEI"), self->_statusIMEI, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("MEID"), self->_statusMEID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ModemFirmwareVersion"), self->_statusModemFirmwareVersion, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("CellularTechnology"), self->_statusCellularTechnology, 0, 0);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BatteryLevel"), self->_statusBatteryLevel, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsSupervised"), self->_statusIsSupervised, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsMultiUser"), self->_statusIsMultiUser, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsDeviceLocatorServiceEnabled"), self->_statusIsDeviceLocatorServiceEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsActivationLockEnabled"), self->_statusIsActivationLockEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsDoNotDisturbInEffect"), self->_statusIsDoNotDisturbInEffect, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DeviceID"), self->_statusDeviceID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("EASDeviceIdentifier"), self->_statusEASDeviceIdentifier, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsCloudBackupEnabled"), self->_statusIsCloudBackupEnabled, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v3, CFSTR("ActiveManagedUsers"), self->_statusActiveManagedUsers, &__block_literal_global_245, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("OSUpdateSettings"), self->_statusOSUpdateSettings, &__block_literal_global_246, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v3, CFSTR("AutoSetupAdminAccounts"), self->_statusAutoSetupAdminAccounts, &__block_literal_global_248, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SystemIntegrityProtectionEnabled"), self->_statusSystemIntegrityProtectionEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsMDMLostModeEnabled"), self->_statusIsMDMLostModeEnabled, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("MaximumResidentUsers"), self->_statusMaximumResidentUsers, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PushToken"), self->_statusPushToken, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DiagnosticSubmissionEnabled"), self->_statusDiagnosticSubmissionEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AppAnalyticsEnabled"), self->_statusAppAnalyticsEnabled, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ICCID"), self->_statusICCID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BluetoothMAC"), self->_statusBluetoothMAC, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("WiFiMAC"), self->_statusWiFiMAC, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v3, CFSTR("EthernetMACs"), self->_statusEthernetMACs, &__block_literal_global_249, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("CurrentCarrierNetwork"), self->_statusCurrentCarrierNetwork, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SIMCarrierNetwork"), self->_statusSIMCarrierNetwork, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SubscriberCarrierNetwork"), self->_statusSubscriberCarrierNetwork, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("CarrierSettingsVersion"), self->_statusCarrierSettingsVersion, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PhoneNumber"), self->_statusPhoneNumber, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DataRoamingEnabled"), self->_statusDataRoamingEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("VoiceRoamingEnabled"), self->_statusVoiceRoamingEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PersonalHotspotEnabled"), self->_statusPersonalHotspotEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsNetworkTethered"), self->_statusIsNetworkTethered, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsRoaming"), self->_statusIsRoaming, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SIMMCC"), self->_statusSIMMCC, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SIMMNC"), self->_statusSIMMNC, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SubscriberMCC"), self->_statusSubscriberMCC, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SubscriberMNC"), self->_statusSubscriberMNC, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("CurrentMCC"), self->_statusCurrentMCC, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("CurrentMNC"), self->_statusCurrentMNC, 0, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  objc_super v124;

  v124.receiver = self;
  v124.super_class = (Class)CEMDeviceInformationCommand_StatusQueryResponses;
  v4 = -[CEMPayloadBase copyWithZone:](&v124, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusUDID, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo copy](self->_statusOrganizationInfo, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusMDMOptions, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSDate copy](self->_statusLastCloudBackupDate, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_statusAwaitingConfiguration, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_statusITunesStoreAccountIsActive, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSString copy](self->_statusITunesStoreAccountHash, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSString copy](self->_statusDeviceName, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSString copy](self->_statusOSVersion, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSString copy](self->_statusBuildVersion, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSString copy](self->_statusModelName, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSString copy](self->_statusModel, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSString copy](self->_statusProductName, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[NSString copy](self->_statusMarketingName, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  v33 = -[NSString copy](self->_statusSerialNumber, "copy");
  v34 = (void *)v4[16];
  v4[16] = v33;

  v35 = -[NSNumber copy](self->_statusDeviceCapacity, "copy");
  v36 = (void *)v4[17];
  v4[17] = v35;

  v37 = -[NSNumber copy](self->_statusAvailableDeviceCapacity, "copy");
  v38 = (void *)v4[18];
  v4[18] = v37;

  v39 = -[NSString copy](self->_statusIMEI, "copy");
  v40 = (void *)v4[19];
  v4[19] = v39;

  v41 = -[NSString copy](self->_statusMEID, "copy");
  v42 = (void *)v4[20];
  v4[20] = v41;

  v43 = -[NSString copy](self->_statusModemFirmwareVersion, "copy");
  v44 = (void *)v4[21];
  v4[21] = v43;

  v45 = -[NSNumber copy](self->_statusCellularTechnology, "copy");
  v46 = (void *)v4[22];
  v4[22] = v45;

  v47 = -[NSNumber copy](self->_statusBatteryLevel, "copy");
  v48 = (void *)v4[23];
  v4[23] = v47;

  v49 = -[NSNumber copy](self->_statusIsSupervised, "copy");
  v50 = (void *)v4[24];
  v4[24] = v49;

  v51 = -[NSNumber copy](self->_statusIsMultiUser, "copy");
  v52 = (void *)v4[25];
  v4[25] = v51;

  v53 = -[NSNumber copy](self->_statusIsDeviceLocatorServiceEnabled, "copy");
  v54 = (void *)v4[26];
  v4[26] = v53;

  v55 = -[NSNumber copy](self->_statusIsActivationLockEnabled, "copy");
  v56 = (void *)v4[27];
  v4[27] = v55;

  v57 = -[NSNumber copy](self->_statusIsDoNotDisturbInEffect, "copy");
  v58 = (void *)v4[28];
  v4[28] = v57;

  v59 = -[NSString copy](self->_statusDeviceID, "copy");
  v60 = (void *)v4[29];
  v4[29] = v59;

  v61 = -[NSString copy](self->_statusEASDeviceIdentifier, "copy");
  v62 = (void *)v4[30];
  v4[30] = v61;

  v63 = -[NSNumber copy](self->_statusIsCloudBackupEnabled, "copy");
  v64 = (void *)v4[31];
  v4[31] = v63;

  v65 = -[NSArray copy](self->_statusActiveManagedUsers, "copy");
  v66 = (void *)v4[32];
  v4[32] = v65;

  v67 = -[CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings copy](self->_statusOSUpdateSettings, "copy");
  v68 = (void *)v4[33];
  v4[33] = v67;

  v69 = -[NSArray copy](self->_statusAutoSetupAdminAccounts, "copy");
  v70 = (void *)v4[34];
  v4[34] = v69;

  v71 = -[NSNumber copy](self->_statusSystemIntegrityProtectionEnabled, "copy");
  v72 = (void *)v4[35];
  v4[35] = v71;

  v73 = -[NSNumber copy](self->_statusIsMDMLostModeEnabled, "copy");
  v74 = (void *)v4[36];
  v4[36] = v73;

  v75 = -[NSNumber copy](self->_statusMaximumResidentUsers, "copy");
  v76 = (void *)v4[37];
  v4[37] = v75;

  v77 = -[NSString copy](self->_statusPushToken, "copy");
  v78 = (void *)v4[38];
  v4[38] = v77;

  v79 = -[NSNumber copy](self->_statusDiagnosticSubmissionEnabled, "copy");
  v80 = (void *)v4[39];
  v4[39] = v79;

  v81 = -[NSNumber copy](self->_statusAppAnalyticsEnabled, "copy");
  v82 = (void *)v4[40];
  v4[40] = v81;

  v83 = -[NSString copy](self->_statusICCID, "copy");
  v84 = (void *)v4[41];
  v4[41] = v83;

  v85 = -[NSString copy](self->_statusBluetoothMAC, "copy");
  v86 = (void *)v4[42];
  v4[42] = v85;

  v87 = -[NSString copy](self->_statusWiFiMAC, "copy");
  v88 = (void *)v4[43];
  v4[43] = v87;

  v89 = -[NSArray copy](self->_statusEthernetMACs, "copy");
  v90 = (void *)v4[44];
  v4[44] = v89;

  v91 = -[NSString copy](self->_statusCurrentCarrierNetwork, "copy");
  v92 = (void *)v4[45];
  v4[45] = v91;

  v93 = -[NSString copy](self->_statusSIMCarrierNetwork, "copy");
  v94 = (void *)v4[46];
  v4[46] = v93;

  v95 = -[NSString copy](self->_statusSubscriberCarrierNetwork, "copy");
  v96 = (void *)v4[47];
  v4[47] = v95;

  v97 = -[NSString copy](self->_statusCarrierSettingsVersion, "copy");
  v98 = (void *)v4[48];
  v4[48] = v97;

  v99 = -[NSString copy](self->_statusPhoneNumber, "copy");
  v100 = (void *)v4[49];
  v4[49] = v99;

  v101 = -[NSNumber copy](self->_statusDataRoamingEnabled, "copy");
  v102 = (void *)v4[50];
  v4[50] = v101;

  v103 = -[NSNumber copy](self->_statusVoiceRoamingEnabled, "copy");
  v104 = (void *)v4[51];
  v4[51] = v103;

  v105 = -[NSNumber copy](self->_statusPersonalHotspotEnabled, "copy");
  v106 = (void *)v4[52];
  v4[52] = v105;

  v107 = -[NSNumber copy](self->_statusIsNetworkTethered, "copy");
  v108 = (void *)v4[53];
  v4[53] = v107;

  v109 = -[NSNumber copy](self->_statusIsRoaming, "copy");
  v110 = (void *)v4[54];
  v4[54] = v109;

  v111 = -[NSString copy](self->_statusSIMMCC, "copy");
  v112 = (void *)v4[55];
  v4[55] = v111;

  v113 = -[NSString copy](self->_statusSIMMNC, "copy");
  v114 = (void *)v4[56];
  v4[56] = v113;

  v115 = -[NSString copy](self->_statusSubscriberMCC, "copy");
  v116 = (void *)v4[57];
  v4[57] = v115;

  v117 = -[NSString copy](self->_statusSubscriberMNC, "copy");
  v118 = (void *)v4[58];
  v4[58] = v117;

  v119 = -[NSString copy](self->_statusCurrentMCC, "copy");
  v120 = (void *)v4[59];
  v4[59] = v119;

  v121 = -[NSString copy](self->_statusCurrentMNC, "copy");
  v122 = (void *)v4[60];
  v4[60] = v121;

  return v4;
}

- (NSString)statusUDID
{
  return self->_statusUDID;
}

- (void)setStatusUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo)statusOrganizationInfo
{
  return self->_statusOrganizationInfo;
}

- (void)setStatusOrganizationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusMDMOptions
{
  return self->_statusMDMOptions;
}

- (void)setStatusMDMOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)statusLastCloudBackupDate
{
  return self->_statusLastCloudBackupDate;
}

- (void)setStatusLastCloudBackupDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)statusAwaitingConfiguration
{
  return self->_statusAwaitingConfiguration;
}

- (void)setStatusAwaitingConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)statusITunesStoreAccountIsActive
{
  return self->_statusITunesStoreAccountIsActive;
}

- (void)setStatusITunesStoreAccountIsActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)statusITunesStoreAccountHash
{
  return self->_statusITunesStoreAccountHash;
}

- (void)setStatusITunesStoreAccountHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)statusDeviceName
{
  return self->_statusDeviceName;
}

- (void)setStatusDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)statusOSVersion
{
  return self->_statusOSVersion;
}

- (void)setStatusOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)statusBuildVersion
{
  return self->_statusBuildVersion;
}

- (void)setStatusBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)statusModelName
{
  return self->_statusModelName;
}

- (void)setStatusModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)statusModel
{
  return self->_statusModel;
}

- (void)setStatusModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)statusProductName
{
  return self->_statusProductName;
}

- (void)setStatusProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)statusMarketingName
{
  return self->_statusMarketingName;
}

- (void)setStatusMarketingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)statusSerialNumber
{
  return self->_statusSerialNumber;
}

- (void)setStatusSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)statusDeviceCapacity
{
  return self->_statusDeviceCapacity;
}

- (void)setStatusDeviceCapacity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)statusAvailableDeviceCapacity
{
  return self->_statusAvailableDeviceCapacity;
}

- (void)setStatusAvailableDeviceCapacity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)statusIMEI
{
  return self->_statusIMEI;
}

- (void)setStatusIMEI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)statusMEID
{
  return self->_statusMEID;
}

- (void)setStatusMEID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)statusModemFirmwareVersion
{
  return self->_statusModemFirmwareVersion;
}

- (void)setStatusModemFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)statusCellularTechnology
{
  return self->_statusCellularTechnology;
}

- (void)setStatusCellularTechnology:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)statusBatteryLevel
{
  return self->_statusBatteryLevel;
}

- (void)setStatusBatteryLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)statusIsSupervised
{
  return self->_statusIsSupervised;
}

- (void)setStatusIsSupervised:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)statusIsMultiUser
{
  return self->_statusIsMultiUser;
}

- (void)setStatusIsMultiUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)statusIsDeviceLocatorServiceEnabled
{
  return self->_statusIsDeviceLocatorServiceEnabled;
}

- (void)setStatusIsDeviceLocatorServiceEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)statusIsActivationLockEnabled
{
  return self->_statusIsActivationLockEnabled;
}

- (void)setStatusIsActivationLockEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)statusIsDoNotDisturbInEffect
{
  return self->_statusIsDoNotDisturbInEffect;
}

- (void)setStatusIsDoNotDisturbInEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)statusDeviceID
{
  return self->_statusDeviceID;
}

- (void)setStatusDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)statusEASDeviceIdentifier
{
  return self->_statusEASDeviceIdentifier;
}

- (void)setStatusEASDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)statusIsCloudBackupEnabled
{
  return self->_statusIsCloudBackupEnabled;
}

- (void)setStatusIsCloudBackupEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSArray)statusActiveManagedUsers
{
  return self->_statusActiveManagedUsers;
}

- (void)setStatusActiveManagedUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings)statusOSUpdateSettings
{
  return self->_statusOSUpdateSettings;
}

- (void)setStatusOSUpdateSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)statusAutoSetupAdminAccounts
{
  return self->_statusAutoSetupAdminAccounts;
}

- (void)setStatusAutoSetupAdminAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)statusSystemIntegrityProtectionEnabled
{
  return self->_statusSystemIntegrityProtectionEnabled;
}

- (void)setStatusSystemIntegrityProtectionEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)statusIsMDMLostModeEnabled
{
  return self->_statusIsMDMLostModeEnabled;
}

- (void)setStatusIsMDMLostModeEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)statusMaximumResidentUsers
{
  return self->_statusMaximumResidentUsers;
}

- (void)setStatusMaximumResidentUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)statusPushToken
{
  return self->_statusPushToken;
}

- (void)setStatusPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)statusDiagnosticSubmissionEnabled
{
  return self->_statusDiagnosticSubmissionEnabled;
}

- (void)setStatusDiagnosticSubmissionEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)statusAppAnalyticsEnabled
{
  return self->_statusAppAnalyticsEnabled;
}

- (void)setStatusAppAnalyticsEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)statusICCID
{
  return self->_statusICCID;
}

- (void)setStatusICCID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)statusBluetoothMAC
{
  return self->_statusBluetoothMAC;
}

- (void)setStatusBluetoothMAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)statusWiFiMAC
{
  return self->_statusWiFiMAC;
}

- (void)setStatusWiFiMAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSArray)statusEthernetMACs
{
  return self->_statusEthernetMACs;
}

- (void)setStatusEthernetMACs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)statusCurrentCarrierNetwork
{
  return self->_statusCurrentCarrierNetwork;
}

- (void)setStatusCurrentCarrierNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)statusSIMCarrierNetwork
{
  return self->_statusSIMCarrierNetwork;
}

- (void)setStatusSIMCarrierNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)statusSubscriberCarrierNetwork
{
  return self->_statusSubscriberCarrierNetwork;
}

- (void)setStatusSubscriberCarrierNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)statusCarrierSettingsVersion
{
  return self->_statusCarrierSettingsVersion;
}

- (void)setStatusCarrierSettingsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)statusPhoneNumber
{
  return self->_statusPhoneNumber;
}

- (void)setStatusPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSNumber)statusDataRoamingEnabled
{
  return self->_statusDataRoamingEnabled;
}

- (void)setStatusDataRoamingEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSNumber)statusVoiceRoamingEnabled
{
  return self->_statusVoiceRoamingEnabled;
}

- (void)setStatusVoiceRoamingEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSNumber)statusPersonalHotspotEnabled
{
  return self->_statusPersonalHotspotEnabled;
}

- (void)setStatusPersonalHotspotEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSNumber)statusIsNetworkTethered
{
  return self->_statusIsNetworkTethered;
}

- (void)setStatusIsNetworkTethered:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSNumber)statusIsRoaming
{
  return self->_statusIsRoaming;
}

- (void)setStatusIsRoaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSString)statusSIMMCC
{
  return self->_statusSIMMCC;
}

- (void)setStatusSIMMCC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)statusSIMMNC
{
  return self->_statusSIMMNC;
}

- (void)setStatusSIMMNC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)statusSubscriberMCC
{
  return self->_statusSubscriberMCC;
}

- (void)setStatusSubscriberMCC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSString)statusSubscriberMNC
{
  return self->_statusSubscriberMNC;
}

- (void)setStatusSubscriberMNC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)statusCurrentMCC
{
  return self->_statusCurrentMCC;
}

- (void)setStatusCurrentMCC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSString)statusCurrentMNC
{
  return self->_statusCurrentMNC;
}

- (void)setStatusCurrentMNC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCurrentMNC, 0);
  objc_storeStrong((id *)&self->_statusCurrentMCC, 0);
  objc_storeStrong((id *)&self->_statusSubscriberMNC, 0);
  objc_storeStrong((id *)&self->_statusSubscriberMCC, 0);
  objc_storeStrong((id *)&self->_statusSIMMNC, 0);
  objc_storeStrong((id *)&self->_statusSIMMCC, 0);
  objc_storeStrong((id *)&self->_statusIsRoaming, 0);
  objc_storeStrong((id *)&self->_statusIsNetworkTethered, 0);
  objc_storeStrong((id *)&self->_statusPersonalHotspotEnabled, 0);
  objc_storeStrong((id *)&self->_statusVoiceRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_statusDataRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_statusPhoneNumber, 0);
  objc_storeStrong((id *)&self->_statusCarrierSettingsVersion, 0);
  objc_storeStrong((id *)&self->_statusSubscriberCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_statusSIMCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_statusCurrentCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_statusEthernetMACs, 0);
  objc_storeStrong((id *)&self->_statusWiFiMAC, 0);
  objc_storeStrong((id *)&self->_statusBluetoothMAC, 0);
  objc_storeStrong((id *)&self->_statusICCID, 0);
  objc_storeStrong((id *)&self->_statusAppAnalyticsEnabled, 0);
  objc_storeStrong((id *)&self->_statusDiagnosticSubmissionEnabled, 0);
  objc_storeStrong((id *)&self->_statusPushToken, 0);
  objc_storeStrong((id *)&self->_statusMaximumResidentUsers, 0);
  objc_storeStrong((id *)&self->_statusIsMDMLostModeEnabled, 0);
  objc_storeStrong((id *)&self->_statusSystemIntegrityProtectionEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutoSetupAdminAccounts, 0);
  objc_storeStrong((id *)&self->_statusOSUpdateSettings, 0);
  objc_storeStrong((id *)&self->_statusActiveManagedUsers, 0);
  objc_storeStrong((id *)&self->_statusIsCloudBackupEnabled, 0);
  objc_storeStrong((id *)&self->_statusEASDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusDeviceID, 0);
  objc_storeStrong((id *)&self->_statusIsDoNotDisturbInEffect, 0);
  objc_storeStrong((id *)&self->_statusIsActivationLockEnabled, 0);
  objc_storeStrong((id *)&self->_statusIsDeviceLocatorServiceEnabled, 0);
  objc_storeStrong((id *)&self->_statusIsMultiUser, 0);
  objc_storeStrong((id *)&self->_statusIsSupervised, 0);
  objc_storeStrong((id *)&self->_statusBatteryLevel, 0);
  objc_storeStrong((id *)&self->_statusCellularTechnology, 0);
  objc_storeStrong((id *)&self->_statusModemFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_statusMEID, 0);
  objc_storeStrong((id *)&self->_statusIMEI, 0);
  objc_storeStrong((id *)&self->_statusAvailableDeviceCapacity, 0);
  objc_storeStrong((id *)&self->_statusDeviceCapacity, 0);
  objc_storeStrong((id *)&self->_statusSerialNumber, 0);
  objc_storeStrong((id *)&self->_statusMarketingName, 0);
  objc_storeStrong((id *)&self->_statusProductName, 0);
  objc_storeStrong((id *)&self->_statusModel, 0);
  objc_storeStrong((id *)&self->_statusModelName, 0);
  objc_storeStrong((id *)&self->_statusBuildVersion, 0);
  objc_storeStrong((id *)&self->_statusOSVersion, 0);
  objc_storeStrong((id *)&self->_statusDeviceName, 0);
  objc_storeStrong((id *)&self->_statusITunesStoreAccountHash, 0);
  objc_storeStrong((id *)&self->_statusITunesStoreAccountIsActive, 0);
  objc_storeStrong((id *)&self->_statusAwaitingConfiguration, 0);
  objc_storeStrong((id *)&self->_statusLastCloudBackupDate, 0);
  objc_storeStrong((id *)&self->_statusMDMOptions, 0);
  objc_storeStrong((id *)&self->_statusOrganizationInfo, 0);
  objc_storeStrong((id *)&self->_statusUDID, 0);
}

@end
