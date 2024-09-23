@implementation CARSessionConfiguration

- (id)descriptionForTransportType
{
  return (id)objc_msgSend((id)objc_opt_class(), "_descriptionForTransportType:", -[CARSessionConfiguration transportType](self, "transportType"));
}

+ (id)_descriptionForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E5428EF0[a3 - 1];
}

+ (id)descriptionForCapability:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Unrestricted");
  if (a3 == 1)
    return CFSTR("Restricted");
  else
    return (id)v3;
}

+ (id)descriptionForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E5428F08[a3];
}

+ (id)descriptionForEdgeInsets:(NSEdgeInsets)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{top = %f, left = %f, bottom = %f, right = %f}"), *(_QWORD *)&a3.top, *(_QWORD *)&a3.left, *(_QWORD *)&a3.bottom, *(_QWORD *)&a3.right);
}

- (id)descriptionForLimitableUserInterfaces
{
  char v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[CARSessionConfiguration limitableUserInterfaces](self, "limitableUserInterfaces");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("Keyboard"));
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addObject:", CFSTR("Phone Keypad"));
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v4, "addObject:", CFSTR("Non-Music Lists"));
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v4, "addObject:", CFSTR("Music Lists"));
  if ((v2 & 0x10) == 0)
  {
LABEL_6:
    if ((v2 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v4, "addObject:", CFSTR("Japan Maps"));
  if ((v2 & 0x20) == 0)
  {
LABEL_7:
    if ((v2 & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v4, "addObject:", CFSTR("Paired Devices"));
    if ((v2 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v4, "addObject:", CFSTR("Automaker Settings"));
  if ((v2 & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if (v2 < 0)
LABEL_9:
    objc_msgSend(v4, "addObject:", CFSTR("Theme Customization"));
LABEL_10:
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unint64_t)_limitableUserInterfacesFromLimitedUIValues:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("softKeyboard")))
        {
          v6 |= 1uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("softPhoneKeypad")))
        {
          v6 |= 2uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("nonMusicLists")))
        {
          v6 |= 4uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("musicLists")))
        {
          v6 |= 8uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("japanMaps")))
        {
          v6 |= 0x10uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("automakerSettings")))
        {
          v6 |= 0x20uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("pairedDevices")))
        {
          v6 |= 0x40uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("themeCustomization")))
        {
          v6 |= 0x80uLL;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)_defaultInterfaceStyleFromAppearanceDefault:(id)a3
{
  id v3;
  NSObject *v4;
  int64_t v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CARSessionConfiguration INFO appearanceDefault=%@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("automatic")) - 1;
  else
    v5 = -1;

  return v5;
}

- (CARSessionConfiguration)initWithSessionStatusOptions:(unint64_t)a3 propertySupplier:(id)a4
{
  void (**v6)(id, _QWORD);
  CARSessionConfiguration *v7;
  id v8;
  NSString *v9;
  NSString *endpointIdentifier;
  id v11;
  NSString *v12;
  NSString *name;
  id v14;
  NSString *v15;
  NSString *modelName;
  id v17;
  NSString *v18;
  NSString *manufacturerName;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *infoResponse;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSDictionary *v36;
  uint64_t v37;
  uint64_t v38;
  NSArray *altScreenSuggestUIURLs;
  uint64_t v40;
  NSArray *lastOnDisplayUIContextURLs;
  uint64_t v42;
  NSArray *nowOnDisplayUIContextURLs;
  uint64_t v44;
  NSString *deviceIdentifier;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  char v51;
  id v52;
  id v53;
  char v54;
  void *v55;
  id v56;
  id v57;
  char v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  NSString *v75;
  NSString *vehicleDataProtocolVersion;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  uint64_t v97;
  id *v98;
  void *v99;
  uint64_t v100;
  NSArray *displays;
  void *v102;
  CARSessionConfiguration *v103;
  id v104;
  id v105;
  uint64_t v106;
  NSArray *screens;
  uint64_t v108;
  NSArray *screenIDs;
  id v110;
  NSString *v111;
  NSString *manufacturerIconLabel;
  id v113;
  id v114;
  char v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  NSObject *v122;
  uint64_t v123;
  NSArray *vehicleButtons;
  void *v125;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  void *v129;
  uint64_t v130;
  NSString *vehicleName;
  uint64_t v132;
  NSString *vehicleModelName;
  uint64_t v134;
  NSString *vehicleManufacturer;
  uint64_t v136;
  NSString *vehicleSerialNumber;
  uint64_t v138;
  NSString *vehicleFirmwareVersion;
  uint64_t v140;
  NSString *vehicleHardwareVersion;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  NSString *PPID;
  void *v148;
  CARSessionConfiguration *v149;
  uint64_t v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  char v156;
  void *v157;
  id v158;
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
  _QWORD v170[4];
  NSObject *v171;
  _QWORD v172[4];
  id v173;
  _QWORD v174[4];
  id v175;
  CARSessionConfiguration *v176;
  id v177;
  id v178;
  _QWORD v179[4];
  id v180;
  _QWORD v181[4];
  id v182;
  objc_super v183;
  uint8_t buf[4];
  void *v185;
  _QWORD v186[7];

  v186[5] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  v183.receiver = self;
  v183.super_class = (Class)CARSessionConfiguration;
  v7 = -[CARSessionConfiguration init](&v183, sel_init);

  if (v7)
  {
    v6[2](v6, *MEMORY[0x1E0CA4258]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = (NSString *)v8;
    else
      v9 = 0;

    endpointIdentifier = v7->_endpointIdentifier;
    v7->_endpointIdentifier = v9;

    v6[2](v6, *MEMORY[0x1E0CA4348]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = (NSString *)v11;
    else
      v12 = 0;

    name = v7->_name;
    v7->_name = v12;

    v6[2](v6, *MEMORY[0x1E0CA4338]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = (NSString *)v14;
    else
      v15 = 0;

    modelName = v7->_modelName;
    v7->_modelName = v15;

    v6[2](v6, *MEMORY[0x1E0CA4318]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = (NSString *)v17;
    else
      v18 = 0;

    manufacturerName = v7->_manufacturerName;
    v7->_manufacturerName = v18;

    v6[2](v6, *MEMORY[0x1E0CA4460]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v20;
    if (v20)
    {
      v21 = v20;
      if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CA4940]) & 1) != 0
        || (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CA4958]) & 1) != 0)
      {
        v22 = 3;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CA4948]) & 1) != 0)
      {
        v22 = 2;
      }
      else
      {
        v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CA4950]);
      }
    }
    else
    {
      v22 = 0;
    }
    v7->_transportType = v22;
    v6[2](v6, *MEMORY[0x1E0CA4390]);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_opt_class();
      v24 = v23;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = objc_msgSend(v24, "BOOLValue");
      else
        v25 = 0;

    }
    else
    {
      v25 = 0;
    }

    v7->_rightHandDrive = v25;
    v6[2](v6, *MEMORY[0x1E0CA4300]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    v7->_limitableUserInterfaces = +[CARSessionConfiguration _limitableUserInterfacesFromLimitedUIValues:](CARSessionConfiguration, "_limitableUserInterfacesFromLimitedUIValues:", v28);
    v6[2](v6, *MEMORY[0x1E0CA4350]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_nightModeSupported = v29 != 0;

    ((void (**)(id, const __CFString *))v6)[2](v6, CFSTR("EndpointInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if ((a3 & 8) != 0)
    {
      if ((a3 & 0x10) != 0)
      {
        v37 = objc_msgSend(v30, "copy");
        infoResponse = v7->_infoResponse;
        v7->_infoResponse = (NSDictionary *)v37;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v30);
        infoResponse = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *MEMORY[0x1E0CA4358];
        v186[0] = *MEMORY[0x1E0CA4368];
        v186[1] = v33;
        v186[2] = CFSTR("oemIcon");
        v186[3] = CFSTR("oemIcons");
        v186[4] = CFSTR("oemIconLabel");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(infoResponse, "removeObjectsForKeys:", v34);

        v35 = objc_msgSend(infoResponse, "copy");
        v36 = v7->_infoResponse;
        v7->_infoResponse = (NSDictionary *)v35;

      }
    }
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("altScreenSuggestUIURLs"));
    v38 = objc_claimAutoreleasedReturnValue();
    altScreenSuggestUIURLs = v7->_altScreenSuggestUIURLs;
    v7->_altScreenSuggestUIURLs = (NSArray *)v38;

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("uiContextLastOnDisplayURLs"));
    v40 = objc_claimAutoreleasedReturnValue();
    lastOnDisplayUIContextURLs = v7->_lastOnDisplayUIContextURLs;
    v7->_lastOnDisplayUIContextURLs = (NSArray *)v40;

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("uiContextNowOnDisplayURLs"));
    v42 = objc_claimAutoreleasedReturnValue();
    nowOnDisplayUIContextURLs = v7->_nowOnDisplayUIContextURLs;
    v7->_nowOnDisplayUIContextURLs = (NSArray *)v42;

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("deviceID"));
    v44 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v7->_deviceIdentifier;
    v7->_deviceIdentifier = (NSString *)v44;

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("appearanceDefault"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_defaultUserInterfaceStyle = +[CARSessionConfiguration _defaultInterfaceStyleFromAppearanceDefault:](CARSessionConfiguration, "_defaultInterfaceStyleFromAppearanceDefault:");
    v7->_userInterfaceStyle = -1;
    -[CARSessionConfiguration updateCarCapabilities](v7, "updateCarCapabilities");
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("enhancedSiriInfo"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v48 = v47;
    else
      v48 = 0;

    if (v48)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("enhancedSiriVoice"));
      v49 = (id)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        objc_opt_class();
        v50 = v49;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v51 = objc_msgSend(v50, "BOOLValue");
        else
          v51 = 0;

      }
      else
      {
        v51 = 0;
      }

      v7->_supportsSiriZLL = v51;
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("enhancedSiriButton"));
      v52 = (id)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        objc_opt_class();
        v53 = v52;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v54 = objc_msgSend(v53, "BOOLValue");
        else
          v54 = 0;

      }
      else
      {
        v54 = 0;
      }

      v7->_supportsSiriZLLButton = v54;
      objc_msgSend(v48, "objectForKey:", CFSTR("enhancedSiriNotMixable"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("enhancedSiriNotMixable"));
        v56 = (id)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          objc_opt_class();
          v57 = v56;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v58 = objc_msgSend(v57, "BOOLValue");
          else
            v58 = 0;

        }
        else
        {
          v58 = 0;
        }

        v7->_supportsSiriMixable = v58 ^ 1;
      }
      else
      {
        v7->_supportsSiriMixable = 1;
      }
    }
    else
    {
      *(_WORD *)&v7->_supportsSiriZLL = 0;
      v7->_supportsSiriMixable = 0;
    }
    v6[2](v6, *MEMORY[0x1E0CA41D0]);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsACBack = objc_msgSend(v163, "containsObject:", *MEMORY[0x1E0CA4938]);
    v6[2](v6, *MEMORY[0x1E0CA4498]);
    v59 = (id)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_opt_class();
      v60 = v59;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v61 = objc_msgSend(v60, "integerValue");
      else
        v61 = 0x7FFFFFFFFFFFFFFFLL;

    }
    else
    {
      v61 = 0x7FFFFFFFFFFFFFFFLL;
    }

    if ((unint64_t)(v61 - 3) < 0xFFFFFFFFFFFFFFFCLL || v61 == 0)
      v63 = -1;
    else
      v63 = v61;
    v7->_voiceTriggerMode = v63;
    v169 = v31;
    if ((a3 & 2) != 0)
    {
      v6[2](v6, *MEMORY[0x1E0CA4490]);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v64;
      if (v64)
      {
        objc_msgSend(v64, "objectForKeyedSubscript:", *MEMORY[0x1E0CA49B0]);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v67 = v66;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v68 = v67;
        else
          v68 = 0;

        if (v68)
        {
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("active"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_supportsElectronicTollCollection = v69 != 0;

        }
      }

    }
    objc_msgSend(v31, "objectForKey:", CFSTR("vehicleStateProtocolInfo"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v72 = v71;
    else
      v72 = 0;

    v166 = v28;
    v162 = v72;
    if (!v72)
    {
      v7->_supportsVehicleData = 0;
      v7->_vehicleDataPluginCount = 0;
      goto LABEL_101;
    }
    v7->_supportsVehicleData = 1;
    objc_msgSend(v72, "objectForKey:", CFSTR("protocolVersion"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = v73;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v75 = (NSString *)v74;
    else
      v75 = 0;

    vehicleDataProtocolVersion = v7->_vehicleDataProtocolVersion;
    v7->_vehicleDataProtocolVersion = v75;

    objc_msgSend(v72, "objectForKey:", CFSTR("pluginCount"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v77;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v79 = v78;
    else
      v79 = 0;

    if (v79)
    {
      v80 = objc_msgSend(v79, "unsignedIntegerValue");
      v7->_vehicleDataPluginCount = v80;
      if (v80)
      {
LABEL_100:

LABEL_101:
        objc_msgSend(v31, "objectForKey:", CFSTR("logTransferInfo"), a3);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_supportsLogTransfer = v89 != 0;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, *MEMORY[0x1E0CA43A0]);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", CFSTR("displayPanels"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v93 = v92;
        v164 = v48;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v94 = v93;
        else
          v94 = 0;

        v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v96 = v95;
        v97 = MEMORY[0x1E0C809B0];
        v161 = v94;
        if (v94)
        {
          v181[0] = MEMORY[0x1E0C809B0];
          v181[1] = 3221225472;
          v181[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke;
          v181[3] = &unk_1E5428DA8;
          v98 = &v182;
          v182 = v95;
          objc_msgSend(v94, "enumerateObjectsUsingBlock:", v181);
          v99 = v168;
        }
        else
        {
          v179[0] = MEMORY[0x1E0C809B0];
          v179[1] = 3221225472;
          v179[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_467;
          v179[3] = &unk_1E5428DA8;
          v98 = &v180;
          v180 = v95;
          v99 = v168;
          objc_msgSend(v168, "enumerateObjectsUsingBlock:", v179);
        }

        v160 = v96;
        v100 = objc_msgSend(v96, "copy");
        displays = v7->_displays;
        v7->_displays = (NSArray *)v100;

        v102 = v169;
        objc_msgSend(v169, "objectForKey:", CFSTR("displays"));
        v174[0] = v97;
        v174[1] = 3221225472;
        v174[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_470;
        v174[3] = &unk_1E5428E48;
        v158 = (id)objc_claimAutoreleasedReturnValue();
        v175 = v158;
        v103 = v7;
        v176 = v103;
        v104 = v90;
        v177 = v104;
        v105 = v91;
        v178 = v105;
        objc_msgSend(v99, "enumerateObjectsUsingBlock:", v174);
        v159 = v104;
        v106 = objc_msgSend(v104, "copy");
        screens = v103->_screens;
        v103->_screens = (NSArray *)v106;

        v157 = v105;
        v108 = objc_msgSend(v105, "copy");
        screenIDs = v103->_screenIDs;
        v103->_screenIDs = (NSArray *)v108;

        v103->_hasGaugeClusterScreen = -[NSArray bs_containsObjectPassingTest:](v7->_displays, "bs_containsObjectPassingTest:", &__block_literal_global_477);
        if ((v156 & 2) != 0)
        {
          v6[2](v6, *MEMORY[0x1E0CA4358]);
          v110 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v111 = (NSString *)v110;
          else
            v111 = 0;

          manufacturerIconLabel = v103->_manufacturerIconLabel;
          v103->_manufacturerIconLabel = v111;

          v6[2](v6, *MEMORY[0x1E0CA4360]);
          v113 = (id)objc_claimAutoreleasedReturnValue();
          if (v113)
          {
            objc_opt_class();
            v114 = v113;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v115 = objc_msgSend(v114, "BOOLValue");
            else
              v115 = 0;

          }
          else
          {
            v115 = 0;
          }

          v103->_manufacturerIconVisible = v115;
          v6[2](v6, *MEMORY[0x1E0CA4368]);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v172[0] = v97;
          v172[1] = 3221225472;
          v172[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_6;
          v172[3] = &unk_1E5428C68;
          v118 = v117;
          v173 = v118;
          objc_msgSend(v116, "enumerateObjectsUsingBlock:", v172);
          objc_storeStrong((id *)&v103->_manufacturerIcons, v117);

          v102 = v169;
        }
        objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("buttonInfo"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v120 = v119;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v121 = v120;

          if (!v121)
            goto LABEL_127;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v170[0] = v97;
          v170[1] = 3221225472;
          v170[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7;
          v170[3] = &unk_1E5428C68;
          v122 = (id)objc_claimAutoreleasedReturnValue();
          v171 = v122;
          objc_msgSend(v121, "enumerateObjectsUsingBlock:", v170);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v122);
          v123 = objc_claimAutoreleasedReturnValue();
          vehicleButtons = v103->_vehicleButtons;
          v103->_vehicleButtons = (NSArray *)v123;

        }
        else
        {

          if (!v120)
          {
            v121 = 0;
LABEL_127:
            +[CRVehicleAccessoryManager sharedInstance](CRVehicleAccessoryManager, "sharedInstance");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "connectedVehicleAccessories");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "anyObject");
            v127 = objc_claimAutoreleasedReturnValue();
            if (v127)
            {
              v128 = v127;
              v103->_hasAccessory = 1;
LABEL_129:
              -[NSObject vehicleAccessoryInfoKeys](v128, "vehicleAccessoryInfoKeys");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("name"));
              v130 = objc_claimAutoreleasedReturnValue();
              vehicleName = v103->_vehicleName;
              v103->_vehicleName = (NSString *)v130;

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("modelName"));
              v132 = objc_claimAutoreleasedReturnValue();
              vehicleModelName = v103->_vehicleModelName;
              v103->_vehicleModelName = (NSString *)v132;

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("manufacturer"));
              v134 = objc_claimAutoreleasedReturnValue();
              vehicleManufacturer = v103->_vehicleManufacturer;
              v103->_vehicleManufacturer = (NSString *)v134;

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("serialNumber"));
              v136 = objc_claimAutoreleasedReturnValue();
              vehicleSerialNumber = v103->_vehicleSerialNumber;
              v103->_vehicleSerialNumber = (NSString *)v136;

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
              v138 = objc_claimAutoreleasedReturnValue();
              vehicleFirmwareVersion = v103->_vehicleFirmwareVersion;
              v103->_vehicleFirmwareVersion = (NSString *)v138;

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("hardwareVersion"));
              v140 = objc_claimAutoreleasedReturnValue();
              vehicleHardwareVersion = v103->_vehicleHardwareVersion;
              v103->_vehicleHardwareVersion = (NSString *)v140;

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("engineTypeGasoline"));
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              v103->_vehicleSupportsGasoline = objc_msgSend(v142, "BOOLValue");

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("engineTypeElectric"));
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              v103->_vehicleSupportsElectric = objc_msgSend(v143, "BOOLValue");

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("engineTypeDiesel"));
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              v103->_vehicleSupportsDiesel = objc_msgSend(v144, "BOOLValue");

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("engineTypeCNG"));
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              v103->_vehicleSupportsCNG = objc_msgSend(v145, "BOOLValue");

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("ppid"));
              v146 = objc_claimAutoreleasedReturnValue();
              PPID = v103->_PPID;
              v103->_PPID = (NSString *)v146;

              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("destinationSharing"));
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              v103->_vehicleSupportsDestinationSharing = objc_msgSend(v148, "BOOLValue");

LABEL_130:
              goto LABEL_131;
            }
            +[CRCarPlayCapabilities capabilitiesIdentifier](CRCarPlayCapabilities, "capabilitiesIdentifier");
            v151 = objc_claimAutoreleasedReturnValue();
            if (v151)
            {
              v152 = (void *)v151;
              v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v151, 0);
              v154 = (id)objc_msgSend(v125, "connectedVehicleAccessories");
              objc_msgSend(v125, "vehicleAccessoryForCertificateSerial:", v153);
              v128 = objc_claimAutoreleasedReturnValue();

              v103->_hasAccessory = v128 != 0;
              if (v128)
                goto LABEL_129;
            }
            else
            {
              v103->_hasAccessory = 0;
            }
            CarGeneralLogging();
            v128 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v125, "connectedAccessories");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v185 = v155;
              _os_log_impl(&dword_1A83A2000, v128, OS_LOG_TYPE_DEFAULT, "Configuration created without an accessory. Connected accessories: %@", buf, 0xCu);

            }
            goto LABEL_130;
          }
          CarGeneralLogging();
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            -[CARSessionConfiguration initWithSessionStatusOptions:propertySupplier:].cold.1();
          v121 = 0;
        }

        goto LABEL_127;
      }
    }
    else
    {
      v7->_vehicleDataPluginCount = 0;
    }
    CarGeneralLogging();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[CARSessionConfiguration initWithSessionStatusOptions:propertySupplier:].cold.2(v81, v82, v83, v84, v85, v86, v87, v88);

    goto LABEL_100;
  }
LABEL_131:
  v149 = v7;

  return v149;
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  CARDisplayInfo *v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      v5 = -[CARDisplayInfo initWithPhysicalScreenDictionary:]([CARDisplayInfo alloc], "initWithPhysicalScreenDictionary:", v4);
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      }
      else
      {
        CarGeneralLogging();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_2();

      }
      v6 = v4;
      goto LABEL_12;
    }
  }
  else
  {

  }
  CarGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_1();
LABEL_12:

}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_467(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  CARDisplayInfo *v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      v5 = -[CARDisplayInfo initWithLogicalScreenDictionary:]([CARDisplayInfo alloc], "initWithLogicalScreenDictionary:", v4);
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      }
      else
      {
        CarGeneralLogging();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_467_cold_2();

      }
      v6 = v4;
      goto LABEL_12;
    }
  }
  else
  {

  }
  CarGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_467_cold_1();
LABEL_12:

}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_470(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  CARScreenInfo *v13;
  id v14;
  CARScreenInfo *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v5 = a2;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  objc_msgSend(v5, "objectForKey:", CFSTR("ScreenID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_473;
  v28[3] = &unk_1E5428DD0;
  v9 = v6;
  v29 = v9;
  v30 = &v31;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);
  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
  v23 = v8;
  v24 = 3221225472;
  v25 = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_2;
  v26 = &unk_1E5428E20;
  v11 = v9;
  v27 = v11;
  objc_msgSend(v10, "bs_firstObjectPassingTest:", &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [CARScreenInfo alloc];
  v18 = v8;
  v19 = 3221225472;
  v20 = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_4;
  v21 = &unk_1E5428C90;
  v14 = v5;
  v22 = v14;
  v15 = -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:](v13, "initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:", &v18, a3 != 0, v32[5], v12, *(double *)(*(_QWORD *)(a1 + 40) + 280), *(double *)(*(_QWORD *)(a1 + 40) + 288), *(double *)(*(_QWORD *)(a1 + 40) + 296), *(double *)(*(_QWORD *)(a1 + 40) + 304));
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v15, v18, v19, v20, v21, v22, v23, v24, v25, v26);
    v16 = *(void **)(a1 + 56);
    -[CARScreenInfo identifier](v15, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
  _Block_object_dispose(&v31, 8);

}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_473(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKey:", CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "streams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_3;
  v6[3] = &unk_1E5428DF8;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsDDPContent");
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  CARManufacturerIcon *v4;
  CARManufacturerIcon *v5;

  v3 = a2;
  v5 = -[CARManufacturerIcon initWithDictionary:]([CARManufacturerIcon alloc], "initWithDictionary:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  CARButtonInfo *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("buttonType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v6 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;

      -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("buttonLocation"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v10 = v9;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;

      -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("buttonPressDuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = v12;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;

      if (v7 && v11 && v14)
      {
        v15 = -[CARButtonInfo initWithButtonType:buttonLocation:buttonPressDuration:]([CARButtonInfo alloc], "initWithButtonType:buttonLocation:buttonPressDuration:", objc_msgSend(v7, "unsignedIntegerValue"), objc_msgSend(v11, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

      }
      else
      {
        CarGeneralLogging();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);

      }
      v8 = v4;
      goto LABEL_23;
    }
  }
  else
  {

  }
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_1();
LABEL_23:

}

- (void)updateCarCapabilities
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[CARSessionConfiguration updateCarCapabilities]";
  v5 = 2048;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1A83A2000, log, OS_LOG_TYPE_DEBUG, "%s: configuration %p updated with car capabilities with %@", (uint8_t *)&v3, 0x20u);
  OUTLINED_FUNCTION_6();
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CARSessionConfiguration valueForUndefinedKey:].cold.1((uint64_t)v3, v4);

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v26 = (void *)MEMORY[0x1E0CB3940];
  v28.receiver = self;
  v28.super_class = (Class)CARSessionConfiguration;
  -[CARSessionConfiguration description](&v28, sel_description);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration vehicleName](self, "vehicleName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration vehicleModelName](self, "vehicleModelName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration vehicleManufacturer](self, "vehicleManufacturer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration vehicleSerialNumber](self, "vehicleSerialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration descriptionForTransportType](self, "descriptionForTransportType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CARSessionConfiguration supportsElectronicTollCollection](self, "supportsElectronicTollCollection"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v21 = v5;
  if (-[CARSessionConfiguration rightHandDrive](self, "rightHandDrive"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v20 = v6;
  -[CARSessionConfiguration descriptionForLimitableUserInterfaces](self, "descriptionForLimitableUserInterfaces");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration manufacturerIconLabel](self, "manufacturerIconLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CARSessionConfiguration manufacturerIconVisible](self, "manufacturerIconVisible"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v17 = v7;
  if (-[CARSessionConfiguration nightModeSupported](self, "nightModeSupported"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v16 = v8;
  if (-[CARSessionConfiguration supportsACBack](self, "supportsACBack"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[CARSessionConfiguration screens](self, "screens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CARSessionConfiguration descriptionForCapability:](CARSessionConfiguration, "descriptionForCapability:", -[CARSessionConfiguration nowPlayingAlbumArtMode](self, "nowPlayingAlbumArtMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", -[CARSessionConfiguration userInterfaceStyle](self, "userInterfaceStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration viewAreaInsets](self, "viewAreaInsets");
  +[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionConfiguration dashboardRoundedCorners](self, "dashboardRoundedCorners");
  +[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("[%@ name: %@, modelName: %@, manufacturer: %@, serialNumber: %@, transport: %@, ETC supported: %@, right hand drive: %@, limitableUserInterfaces: (%@), manufacturerIconLabel: %@, manufacturerIconVisible: %@, night mode supported: %@, supports AC_BACK: %@, screens: %@], [CC] Now Playing Album Art Mode: %@, [CC] User Interface Style: %@, [CC] Additional Safe Area Insets %@, [CC] Dashboard rounded corners: %@"), v25, v24, v23, v22, v3, v4, v21, v20, v19, v18, v17, v16, v9, v10, v15, v11,
    v12,
    v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)screenInfoForScreenID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[CARSessionConfiguration screens](self, "screens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CARSessionConfiguration_screenInfoForScreenID___block_invoke;
  v9[3] = &unk_1E5428EB0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__CARSessionConfiguration_screenInfoForScreenID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)primaryDisplayPhysicalSize
{
  void *v2;
  uint64_t v3;
  CGFloat v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  CGFloat v9;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  NSSize v19;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CARSessionConfiguration screens](self, "screens", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v8, "screenType"))
        {
          objc_msgSend(v8, "physicalSize");
          v9 = v10;
          v4 = v11;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0.0;
LABEL_11:

  v19.width = v9;
  v19.height = v4;
  NSStringFromSize(v19);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (NSString)vehicleSerialNumber
{
  return self->_vehicleSerialNumber;
}

- (NSString)vehicleManufacturer
{
  return self->_vehicleManufacturer;
}

- (NSString)vehicleFirmwareVersion
{
  return self->_vehicleFirmwareVersion;
}

- (NSString)vehicleHardwareVersion
{
  return self->_vehicleHardwareVersion;
}

- (BOOL)vehicleSupportsDestinationSharing
{
  return self->_vehicleSupportsDestinationSharing;
}

- (BOOL)vehicleSupportsGasoline
{
  return self->_vehicleSupportsGasoline;
}

- (BOOL)vehicleSupportsDiesel
{
  return self->_vehicleSupportsDiesel;
}

- (BOOL)vehicleSupportsElectric
{
  return self->_vehicleSupportsElectric;
}

- (BOOL)vehicleSupportsCNG
{
  return self->_vehicleSupportsCNG;
}

- (NSString)PPID
{
  return self->_PPID;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (NSArray)displays
{
  return self->_displays;
}

- (NSArray)screens
{
  return self->_screens;
}

- (NSArray)screenIDs
{
  return self->_screenIDs;
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (unint64_t)limitableUserInterfaces
{
  return self->_limitableUserInterfaces;
}

- (BOOL)nightModeSupported
{
  return self->_nightModeSupported;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (int64_t)voiceTriggerMode
{
  return self->_voiceTriggerMode;
}

- (int64_t)nowPlayingAlbumArtMode
{
  return self->_nowPlayingAlbumArtMode;
}

- (NSEdgeInsets)viewAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_viewAreaInsets.top;
  left = self->_viewAreaInsets.left;
  bottom = self->_viewAreaInsets.bottom;
  right = self->_viewAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)supportsACBack
{
  return self->_supportsACBack;
}

- (BOOL)supportsSiriZLL
{
  return self->_supportsSiriZLL;
}

- (BOOL)supportsSiriZLLButton
{
  return self->_supportsSiriZLLButton;
}

- (BOOL)supportsSiriMixable
{
  return self->_supportsSiriMixable;
}

- (NSArray)vehicleButtons
{
  return self->_vehicleButtons;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (BOOL)hasGaugeClusterScreen
{
  return self->_hasGaugeClusterScreen;
}

- (BOOL)supportsVehicleData
{
  return self->_supportsVehicleData;
}

- (NSString)vehicleDataProtocolVersion
{
  return self->_vehicleDataProtocolVersion;
}

- (unint64_t)vehicleDataPluginCount
{
  return self->_vehicleDataPluginCount;
}

- (BOOL)supportsLogTransfer
{
  return self->_supportsLogTransfer;
}

- (NSEdgeInsets)dashboardRoundedCorners
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_dashboardRoundedCorners.top;
  left = self->_dashboardRoundedCorners.left;
  bottom = self->_dashboardRoundedCorners.bottom;
  right = self->_dashboardRoundedCorners.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDashboardRoundedCorners:(NSEdgeInsets)a3
{
  self->_dashboardRoundedCorners = a3;
}

- (int64_t)defaultUserInterfaceStyle
{
  return self->_defaultUserInterfaceStyle;
}

- (void)setDefaultUserInterfaceStyle:(int64_t)a3
{
  self->_defaultUserInterfaceStyle = a3;
}

- (BOOL)supportsElectronicTollCollection
{
  return self->_supportsElectronicTollCollection;
}

- (void)setSupportsElectronicTollCollection:(BOOL)a3
{
  self->_supportsElectronicTollCollection = a3;
}

- (NSString)manufacturerIconLabel
{
  return self->_manufacturerIconLabel;
}

- (void)setManufacturerIconLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)manufacturerIconVisible
{
  return self->_manufacturerIconVisible;
}

- (void)setManufacturerIconVisible:(BOOL)a3
{
  self->_manufacturerIconVisible = a3;
}

- (NSArray)manufacturerIcons
{
  return self->_manufacturerIcons;
}

- (void)setManufacturerIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)hasAccessory
{
  return self->_hasAccessory;
}

- (void)setHasAccessory:(BOOL)a3
{
  self->_hasAccessory = a3;
}

- (NSDictionary)infoResponse
{
  return self->_infoResponse;
}

- (void)setInfoResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (CARDisplayInfoProviding)displayInfoProvider
{
  return (CARDisplayInfoProviding *)objc_loadWeakRetained((id *)&self->_displayInfoProvider);
}

- (void)setDisplayInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_displayInfoProvider, a3);
}

- (NSArray)altScreenSuggestUIURLs
{
  return self->_altScreenSuggestUIURLs;
}

- (NSArray)lastOnDisplayUIContextURLs
{
  return self->_lastOnDisplayUIContextURLs;
}

- (NSArray)nowOnDisplayUIContextURLs
{
  return self->_nowOnDisplayUIContextURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowOnDisplayUIContextURLs, 0);
  objc_storeStrong((id *)&self->_lastOnDisplayUIContextURLs, 0);
  objc_storeStrong((id *)&self->_altScreenSuggestUIURLs, 0);
  objc_destroyWeak((id *)&self->_displayInfoProvider);
  objc_storeStrong((id *)&self->_infoResponse, 0);
  objc_storeStrong((id *)&self->_manufacturerIcons, 0);
  objc_storeStrong((id *)&self->_manufacturerIconLabel, 0);
  objc_storeStrong((id *)&self->_vehicleDataProtocolVersion, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleButtons, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_screenIDs, 0);
  objc_storeStrong((id *)&self->_screens, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_vehicleHardwareVersion, 0);
  objc_storeStrong((id *)&self->_vehicleFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_vehicleManufacturer, 0);
  objc_storeStrong((id *)&self->_vehicleSerialNumber, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithSessionStatusOptions:propertySupplier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Button info is not array: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithSessionStatusOptions:(uint64_t)a3 propertySupplier:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, a1, a3, "Incomplete/malformed vehicle data protocol info in INFO response.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to create display info from physical screen info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to create display info from physical screen dictionary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_467_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to create display info from screen info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_467_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to create display info from screen dictionary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Button info is of incorrect type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, a1, a3, "Incomplete/malformed car button type in INFO response.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[CARSessionConfiguration valueForUndefinedKey:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_DEBUG, "%s: key %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
