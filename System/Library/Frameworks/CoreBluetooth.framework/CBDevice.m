@implementation CBDevice

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void)changedTypesRemoveAll
{
  self->_changeFlags = 0;
  self->_attributeInternalFlags = 0;
  self->_changedTypesInternal = 0;
}

- (void)setBleRSSI:(int)a3
{
  self->_bleRSSI = a3;
}

- (void)setLastSeenTicks:(unint64_t)a3
{
  self->_lastSeenTicks = a3;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_deviceFlags = a3;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_changeFlags = a3;
}

- (void)setBtAddressData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setBleChannel:(int)a3
{
  self->_bleChannel = a3;
}

- (void)setBleAdvertisementTimestamp:(double)a3
{
  self->_bleAdvertisementTimestamp = a3;
}

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (void)setBleAppleManufacturerData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (unsigned)attributeInternalFlags
{
  return self->_attributeInternalFlags;
}

- (unint64_t)updateWithCBDevice:(id)a3
{
  id v4;
  __int16 v5;
  unint64_t discoveryFlags;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  NSData *bleAddressData;
  NSData *v26;
  NSData *v27;
  NSData *v28;
  char v29;
  void *v30;
  NSData *bleAdvertisementData;
  NSData *v32;
  NSData *v33;
  NSData *v34;
  char v35;
  double v36;
  unint64_t v37;
  void *v38;
  NSData *bleAppleManufacturerData;
  NSData *v40;
  NSData *v41;
  NSData *v42;
  char v43;
  int v44;
  int v45;
  void *v46;
  NSData *btAddressData;
  NSData *v48;
  NSData *v49;
  NSData *v50;
  char v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  char v58;
  void *v59;
  NSString *caseVersion;
  NSString *v61;
  NSString *v62;
  NSString *v63;
  char v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  unsigned int v71;
  uint64_t v72;
  void *v73;
  NSString *v74;
  NSString *v75;
  NSString *v76;
  char v77;
  uint64_t v78;
  void *v79;
  CBControllerInfo *v80;
  CBControllerInfo *v81;
  CBControllerInfo *v82;
  BOOL v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t deviceFlags;
  unint64_t v90;
  int v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  char v96;
  int v97;
  int v98;
  int v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  char v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  void *v120;
  char v121;
  uint64_t v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  char v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  void *v137;
  char v138;
  unsigned __int8 *v139;
  uint64_t v140;
  void *v141;
  NSString *firmwareVersion;
  NSString *v143;
  NSString *v144;
  NSString *v145;
  char v146;
  void *v147;
  NSString *identifier;
  NSString *v149;
  NSString *v150;
  NSString *v151;
  char v152;
  uint64_t v153;
  void *v154;
  NSString *v155;
  NSString *v156;
  NSString *v157;
  char v158;
  int v159;
  unsigned __int16 v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  void *v167;
  NSString *model;
  NSString *v169;
  NSString *v170;
  NSString *v171;
  char v172;
  void *v173;
  void *v174;
  id v175;
  id v176;
  void *v177;
  char v178;
  int v179;
  int muteControlCapability;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  NSString *name;
  NSString *v185;
  NSString *v186;
  NSString *v187;
  char v188;
  NSString **p_name;
  NSString *v190;
  NSString *v191;
  uint64_t v192;
  int v193;
  int v194;
  int v195;
  unsigned int v196;
  void *v197;
  void *v198;
  NSData *proximityServiceData;
  NSData *v200;
  NSData *v201;
  NSData *v202;
  void *v203;
  char v204;
  _BYTE *v205;
  void *v206;
  NSData *safetyAlertsAlertData;
  NSData *v208;
  NSData *v209;
  NSData *v210;
  char v211;
  NSData *v212;
  NSData *v213;
  void *v214;
  NSData *safetyAlertsAlertID;
  NSData *v216;
  NSData *v217;
  NSData *v218;
  char v219;
  NSData *v220;
  NSData *v221;
  void *v222;
  NSData *safetyAlertsSignature;
  NSData *v224;
  NSData *v225;
  NSData *v226;
  int v227;
  int v228;
  unsigned __int8 *p_safetyAlertsVersion;
  NSData *v230;
  NSData *v231;
  BOOL v232;
  char v235;
  void *v236;
  NSData *safetyAlertsSegmentServiceData;
  NSData *v238;
  NSData *v239;
  NSData *v240;
  char v241;
  int v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  NSString *serialNumber;
  NSString *v247;
  NSString *v248;
  NSString *v249;
  char v250;
  void *v251;
  NSString *serialNumberLeft;
  NSString *v253;
  NSString *v254;
  NSString *v255;
  char v256;
  void *v257;
  NSString *serialNumberRight;
  NSString *v259;
  NSString *v260;
  NSString *v261;
  char v262;
  int v263;
  uint64_t v264;
  unsigned int v265;
  void *v266;
  void *v267;
  NSData *txAddressData;
  NSData *v269;
  NSData *v270;
  NSData *v271;
  char v272;
  int v273;
  int v274;
  int vendorIDSource;
  unint64_t v276;
  int v277;
  _BOOL4 v278;
  uint64_t v279;
  void *v280;
  void *v281;
  NSString *v282;
  NSString *v283;
  NSString *v284;
  _BOOL4 v285;
  void *v286;
  NSString *v287;
  void *v288;
  NSString *v289;
  int v290;
  NSString **v291;
  unint64_t v292;
  uint64_t v293;
  unint64_t v294;
  unint64_t v295;
  _BYTE *v297;
  id v298;
  uint64_t v299;
  char v300;
  void *v301;
  unint64_t changeFlags;
  void *v303;
  void *v304;
  NSData *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  id v310;
  id v311;
  id v312;
  id v313;
  id v314;
  id v315;
  id v316;
  id obj;
  id v318;
  _BOOL4 v319;
  id v320;
  id v321;
  id v322;
  id v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  NSData *v329;
  NSData *v330;
  void *v331;
  int v332;
  NSString *v333;
  __int16 v334;
  $77478E09546100A0DB2933F271BBC655 discoveryTypesInternal;

  v4 = a3;
  v5 = objc_msgSend(v4, "internalFlags");
  changeFlags = self->_changeFlags;
  discoveryFlags = self->_discoveryFlags;
  objc_msgSend(v4, "accountID");
  v334 = v5;
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  if (v328)
  {
    v7 = self->_accountID;
    v8 = v328;
    v9 = v8;
    if (v7 != v8)
    {
      if (v7)
      {
        v10 = -[NSString isEqual:](v7, "isEqual:", v8);

        if ((v10 & 1) != 0)
        {
          v11 = 0;
LABEL_10:
          LOBYTE(v5) = v334;
          goto LABEL_11;
        }
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_accountID, v328);
      v11 = 0x80000000000;
      goto LABEL_10;
    }

    v11 = 0;
  }
  else
  {
    v11 = 0;
  }
LABEL_11:
  v12 = objc_msgSend(v4, "adaptiveVolumeCapability");
  if (v12 && v12 != self->_adaptiveVolumeCapability)
  {
    self->_adaptiveVolumeCapability = v12;
    v11 = 0x80000000000;
  }
  v13 = objc_msgSend(v4, "adaptiveVolumeConfig");
  if ((_DWORD)v13)
  {
    v14 = v13;
    if ((_DWORD)v13 != -[CBDevice adaptiveVolumeConfig](self, "adaptiveVolumeConfig"))
    {
      -[CBDevice setAdaptiveVolumeConfig:](self, "setAdaptiveVolumeConfig:", v14);
      v11 = 0x80000000000;
    }
  }
  v15 = objc_msgSend(v4, "appearanceValue");
  if ((_DWORD)v15)
  {
    v16 = v15;
    if ((_DWORD)v15 != -[CBDevice appearanceValue](self, "appearanceValue"))
    {
      -[CBDevice setAppearanceValue:](self, "setAppearanceValue:", v16);
      v11 = 0x80000000000;
    }
  }
  v17 = objc_msgSend(v4, "audioStreamState");
  if (v17 && v17 != self->_audioStreamState)
  {
    self->_audioStreamState = v17;
    v11 |= 0x80000000000uLL;
  }
  v18 = v5 & 0x84;
  v19 = objc_msgSend(v4, "autoAncCapability");
  if (v19 && v19 != self->_autoAncCapability)
  {
    self->_autoAncCapability = v19;
    v11 |= 0x80000000000uLL;
  }
  if ((v5 & 0x84) == 0 && (objc_msgSend(v4, "discoveryFlags") & 0x80) == 0)
    goto LABEL_33;
  v20 = objc_msgSend(v4, "batteryInfoMain");
  if (v20 == self->_batteryInfoMain)
  {
    v21 = objc_msgSend(v4, "batteryInfoLeft");
    if (v21 == self->_batteryInfoLeft)
      goto LABEL_30;
LABEL_39:
    self->_batteryInfoLeft = v21;
    v11 |= 0x80000000000uLL;
    v22 = objc_msgSend(v4, "batteryInfoRight");
    if (v22 == self->_batteryInfoRight)
    {
LABEL_31:
      v23 = objc_msgSend(v4, "batteryInfoCase");
      if (v23 == self->_batteryInfoCase)
        goto LABEL_33;
      goto LABEL_32;
    }
    goto LABEL_40;
  }
  self->_batteryInfoMain = v20;
  v11 |= 0x80000000000uLL;
  v21 = objc_msgSend(v4, "batteryInfoLeft");
  if (v21 != self->_batteryInfoLeft)
    goto LABEL_39;
LABEL_30:
  v22 = objc_msgSend(v4, "batteryInfoRight");
  if (v22 == self->_batteryInfoRight)
    goto LABEL_31;
LABEL_40:
  self->_batteryInfoRight = v22;
  v11 |= 0x80000000000uLL;
  v23 = objc_msgSend(v4, "batteryInfoCase");
  if (v23 != self->_batteryInfoCase)
  {
LABEL_32:
    self->_batteryInfoCase = v23;
    v11 |= 0x80000000000uLL;
  }
LABEL_33:
  objc_msgSend(v4, "bleAddressData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v24;
  if (!v24)
    goto LABEL_46;
  bleAddressData = self->_bleAddressData;
  v26 = v24;
  v27 = bleAddressData;
  if (v26 == v27)
  {

    goto LABEL_46;
  }
  v28 = v27;
  if (v27)
  {
    v29 = -[NSData isEqual:](v26, "isEqual:", v27);

    if ((v29 & 1) != 0)
      goto LABEL_45;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_bleAddressData, obj);
  v11 |= 0x80000000000uLL;
LABEL_45:
  LOBYTE(v5) = v334;
LABEL_46:
  objc_msgSend(v4, "bleAdvertisementData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v316 = v30;
  if (v30)
  {
    bleAdvertisementData = self->_bleAdvertisementData;
    v32 = v30;
    v33 = bleAdvertisementData;
    if (v32 != v33)
    {
      v34 = v33;
      if (v33)
      {
        v35 = -[NSData isEqual:](v32, "isEqual:", v33);

        if ((v35 & 1) != 0)
          goto LABEL_54;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_bleAdvertisementData, v316);
      v11 |= 0x40000000uLL;
LABEL_54:
      LOBYTE(v5) = v334;
      goto LABEL_55;
    }

  }
LABEL_55:
  objc_msgSend(v4, "bleAdvertisementTimestamp");
  if (v36 != 0.0 && v36 != self->_bleAdvertisementTimestamp)
    self->_bleAdvertisementTimestamp = v36;
  v37 = objc_msgSend(v4, "bleAdvertisementTimestampMachContinuous");
  if (v37 && v37 != self->_bleAdvertisementTimestampMachContinuous)
    self->_bleAdvertisementTimestampMachContinuous = v37;
  objc_msgSend(v4, "bleAppleManufacturerData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = v38;
  if (v38)
  {
    bleAppleManufacturerData = self->_bleAppleManufacturerData;
    v40 = v38;
    v41 = bleAppleManufacturerData;
    if (v40 != v41)
    {
      v42 = v41;
      if (v41)
      {
        v43 = -[NSData isEqual:](v40, "isEqual:", v41);

        if ((v43 & 1) != 0)
          goto LABEL_69;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_bleAppleManufacturerData, v327);
      v11 |= 0x40000000uLL;
LABEL_69:
      LOBYTE(v5) = v334;
      goto LABEL_70;
    }

  }
LABEL_70:
  v44 = objc_msgSend(v4, "bleChannel");
  if (v44 && v44 != self->_bleChannel)
  {
    self->_bleChannel = v44;
    v11 |= 0x200000000uLL;
  }
  v45 = objc_msgSend(v4, "bleRSSI");
  if (v45)
  {
    self->_bleRSSI = v45;
    v11 |= 0x200000000uLL;
  }
  objc_msgSend(v4, "btAddressData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v315 = v46;
  if (v46)
  {
    btAddressData = self->_btAddressData;
    v48 = v46;
    v49 = btAddressData;
    if (v48 == v49)
    {

      goto LABEL_84;
    }
    v50 = v49;
    if (v49)
    {
      v51 = -[NSData isEqual:](v48, "isEqual:", v49);

      if ((v51 & 1) != 0)
        goto LABEL_83;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_btAddressData, v315);
    v11 |= 0x80000000000uLL;
LABEL_83:
    LOBYTE(v5) = v334;
  }
LABEL_84:
  objc_msgSend(v4, "btVersion");
  v52 = objc_claimAutoreleasedReturnValue();
  v301 = (void *)v52;
  if (!v52)
    goto LABEL_92;
  v53 = (void *)v52;
  -[CBDevice btVersion](self, "btVersion");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v53;
  v56 = v54;
  if (v55 == v56)
  {

    goto LABEL_92;
  }
  v57 = v56;
  if (!v56)
  {

    goto LABEL_91;
  }
  v58 = objc_msgSend(v55, "isEqual:", v56);

  if ((v58 & 1) == 0)
  {
LABEL_91:
    -[CBDevice setBtVersion:](self, "setBtVersion:", v55);
    v11 |= 0x80000000000uLL;
  }
LABEL_92:
  objc_msgSend(v4, "caseVersion");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v323 = v59;
  if (objc_msgSend(v59, "length"))
  {
    caseVersion = self->_caseVersion;
    v61 = v59;
    v62 = caseVersion;
    if (v61 == v62)
    {

    }
    else
    {
      v63 = v62;
      if ((v61 == 0) == (v62 != 0))
      {

        goto LABEL_121;
      }
      v64 = -[NSString isEqual:](v61, "isEqual:", v62);

      if ((v64 & 1) == 0)
      {
LABEL_121:
        objc_storeStrong((id *)&self->_caseVersion, v323);
        v11 |= 0x80000000000uLL;
        v65 = objc_msgSend(v4, "classicRSSI");
        if (!v65)
          goto LABEL_100;
        goto LABEL_99;
      }
    }
  }
  v65 = objc_msgSend(v4, "classicRSSI");
  if (v65)
  {
LABEL_99:
    self->_classicRSSI = v65;
    v11 |= 0x200000000uLL;
  }
LABEL_100:
  v66 = objc_msgSend(v4, "clickHoldModeLeft");
  if ((_DWORD)v66)
  {
    v67 = v66;
    if ((_DWORD)v66 != -[CBDevice clickHoldModeLeft](self, "clickHoldModeLeft"))
    {
      -[CBDevice setClickHoldModeLeft:](self, "setClickHoldModeLeft:", v67);
      v11 |= 0x80000000000uLL;
    }
  }
  v68 = objc_msgSend(v4, "clickHoldModeRight");
  if ((_DWORD)v68)
  {
    v69 = v68;
    if ((_DWORD)v68 != -[CBDevice clickHoldModeRight](self, "clickHoldModeRight"))
    {
      -[CBDevice setClickHoldModeRight:](self, "setClickHoldModeRight:", v69);
      v11 |= 0x80000000000uLL;
    }
  }
  v70 = objc_msgSend(v4, "colorInfo");
  if (v70 && self->_colorInfo != v70)
  {
    self->_colorInfo = v70;
    v11 |= 0x80000000000uLL;
  }
  if (v18)
  {
    v71 = objc_msgSend(v4, "connectedServices");
    if (v71 != self->_connectedServices)
    {
      self->_connectedServices = v71;
      v11 |= 0x80000200000uLL;
    }
  }
  objc_msgSend(v4, "contactID");
  v72 = objc_claimAutoreleasedReturnValue();
  v314 = (id)v72;
  if (!v72)
  {
LABEL_116:
    objc_msgSend(v4, "controllerInfo");
    v78 = objc_claimAutoreleasedReturnValue();
    v313 = (id)v78;
    if (!v78)
      goto LABEL_130;
    goto LABEL_125;
  }
  v73 = (void *)v72;
  v74 = self->_contactID;
  v75 = v73;
  v76 = v75;
  if (v74 == v75)
  {

    objc_msgSend(v4, "controllerInfo");
    v78 = objc_claimAutoreleasedReturnValue();
    v313 = (id)v78;
    if (!v78)
      goto LABEL_130;
    goto LABEL_125;
  }
  if (v74)
  {
    v77 = -[NSString isEqual:](v74, "isEqual:", v75);

    if ((v77 & 1) != 0)
      goto LABEL_116;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_contactID, v314);
  v11 |= 0x80000000000uLL;
  objc_msgSend(v4, "controllerInfo");
  v78 = objc_claimAutoreleasedReturnValue();
  v313 = (id)v78;
  if (!v78)
    goto LABEL_130;
LABEL_125:
  v79 = (void *)v78;
  v80 = self->_controllerInfo;
  v81 = v79;
  v82 = v81;
  if (v80 != v81)
  {
    if (v80)
    {
      v83 = -[CBControllerInfo isEqual:](v80, "isEqual:", v81);

      if (v83)
        goto LABEL_130;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_controllerInfo, v313);
    v11 |= 0x80000000000uLL;
    v84 = objc_msgSend(v4, "conversationDetectCapability");
    if (!v84)
      goto LABEL_136;
    goto LABEL_134;
  }

LABEL_130:
  v84 = objc_msgSend(v4, "conversationDetectCapability");
  if (!v84)
    goto LABEL_136;
LABEL_134:
  if (v84 != self->_conversationDetectCapability)
  {
    self->_conversationDetectCapability = v84;
    v11 |= 0x80000000000uLL;
  }
LABEL_136:
  v85 = objc_msgSend(v4, "conversationDetectConfig");
  if ((_DWORD)v85)
  {
    v86 = v85;
    if ((_DWORD)v85 != -[CBDevice conversationDetectConfig](self, "conversationDetectConfig"))
    {
      -[CBDevice setConversationDetectConfig:](self, "setConversationDetectConfig:", v86);
      v11 |= 0x80000000000uLL;
    }
  }
  v87 = objc_msgSend(v4, "crownRotationDirection");
  if ((_DWORD)v87)
  {
    v88 = v87;
    if ((_DWORD)v87 != -[CBDevice crownRotationDirection](self, "crownRotationDirection"))
    {
      -[CBDevice setCrownRotationDirection:](self, "setCrownRotationDirection:", v88);
      v11 |= 0x80000000000uLL;
    }
  }
  if (v18)
  {
    deviceFlags = self->_deviceFlags;
    v90 = objc_msgSend(v4, "deviceFlags") & 0x780FFFFF07FLL | deviceFlags & 0xFFFFF87F00000F80;
    if (v90 != deviceFlags)
    {
      self->_deviceFlags = v90;
      v11 |= 0x80000000000uLL;
    }
  }
  if ((v5 & 2) == 0)
    goto LABEL_152;
  if ((objc_msgSend(v4, "deviceFlags") & 0x40000000000) != 0)
  {
    self->_deviceFlags |= 0x40000000000uLL;
    if ((objc_msgSend(v4, "deviceFlags") & 0x80) == 0)
    {
LABEL_151:
      v11 |= 0x80000000000uLL;
      goto LABEL_152;
    }
LABEL_150:
    self->_deviceFlags |= 0x80uLL;
    goto LABEL_151;
  }
  if ((objc_msgSend(v4, "deviceFlags") & 0x80) != 0)
    goto LABEL_150;
LABEL_152:
  if (v18)
  {
    v91 = objc_msgSend(v4, "deviceType");
    if (v91 != self->_deviceType)
    {
      self->_deviceType = v91;
      v11 |= 0x80000000000uLL;
    }
  }
  objc_msgSend(v4, "dockKitAccessoryPayloadData");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 2) == 0)
    goto LABEL_161;
  -[CBDevice dockKitAccessoryPayloadData](self, "dockKitAccessoryPayloadData");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v331;
  v94 = v92;
  if (v93 == v94)
  {

    goto LABEL_161;
  }
  v95 = v94;
  if ((v93 == 0) == (v94 != 0))
  {

    goto LABEL_165;
  }
  v96 = objc_msgSend(v93, "isEqual:", v94);

  if ((v96 & 1) != 0)
  {
LABEL_161:
    v97 = objc_msgSend(v4, "doubleTapActionLeft");
    if (!v97)
      goto LABEL_166;
    goto LABEL_162;
  }
LABEL_165:
  -[CBDevice setDockKitAccessoryPayloadData:](self, "setDockKitAccessoryPayloadData:", v93);
  self->_changedTypesInternal.bitArray[1] |= 0x10u;
  v97 = objc_msgSend(v4, "doubleTapActionLeft");
  if (!v97)
    goto LABEL_166;
LABEL_162:
  if (self->_doubleTapActionLeft != v97)
  {
    self->_doubleTapActionLeft = v97;
    v11 |= 0x80000000000uLL;
  }
LABEL_166:
  v98 = objc_msgSend(v4, "doubleTapActionRight");
  if (v98 && self->_doubleTapActionRight != v98)
  {
    self->_doubleTapActionRight = v98;
    v11 |= 0x80000000000uLL;
  }
  v99 = objc_msgSend(v4, "doubleTapCapability");
  if (v99 && self->_doubleTapCapability != v99)
  {
    self->_doubleTapCapability = v99;
    v11 |= 0x80000000000uLL;
  }
  v100 = discoveryFlags;
  if ((v5 & 0x80) != 0)
  {
    v100 = discoveryFlags & 0xFFFBFFFFFFFFFFFFLL | ((((unint64_t)objc_msgSend(v4, "discoveryFlags") >> 50) & 1) << 50);
    if ((v5 & 4) == 0)
    {
LABEL_174:
      if (v100 == discoveryFlags)
        goto LABEL_175;
LABEL_179:
      self->_discoveryFlags = v100;
      v11 |= 0x800000000uLL;
      if ((v5 & 2) == 0)
        goto LABEL_186;
LABEL_180:
      v101 = objc_msgSend(v4, "dsInfoVehicleConfidence");
      if ((_DWORD)v101)
      {
        v102 = v101;
        if ((_DWORD)v101 != -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence"))
        {
          -[CBDevice setDsInfoVehicleConfidence:](self, "setDsInfoVehicleConfidence:", v102);
          v11 |= 0x800000000000000uLL;
        }
      }
      v103 = objc_msgSend(v4, "dsInfoVehicleState");
      if ((_DWORD)v103)
      {
        v104 = v103;
        if ((_DWORD)v103 != -[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState"))
        {
          -[CBDevice setDsInfoVehicleState:](self, "setDsInfoVehicleState:", v104);
          v11 |= 0x800000000000000uLL;
        }
      }
      goto LABEL_186;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_174;
  }
  v100 = objc_msgSend(v4, "discoveryFlags") & 0xA00000 | v100 & 0xFFFFFFFFFF5FFFFFLL;
  if (v100 != discoveryFlags)
    goto LABEL_179;
LABEL_175:
  if ((v5 & 2) != 0)
    goto LABEL_180;
LABEL_186:
  v105 = objc_msgSend(v4, "endCallCapability");
  if (v105 && v105 != self->_endCallCapability)
  {
    self->_endCallCapability = v105;
    v11 |= 0x80000000000uLL;
  }
  v106 = objc_msgSend(v4, "endCallConfig");
  if ((_DWORD)v106)
  {
    v107 = v106;
    if ((_DWORD)v106 != -[CBDevice endCallConfig](self, "endCallConfig"))
    {
      -[CBDevice setEndCallConfig:](self, "setEndCallConfig:", v107);
      v11 |= 0x80000000000uLL;
    }
  }
  objc_msgSend(v4, "fidoPayloadData");
  v108 = objc_claimAutoreleasedReturnValue();
  v325 = (void *)v108;
  if ((v5 & 2) == 0)
    goto LABEL_198;
  v109 = (void *)v108;
  -[CBDevice fidoPayloadData](self, "fidoPayloadData");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v109;
  v112 = v110;
  if (v111 == v112)
  {

    goto LABEL_198;
  }
  v113 = v112;
  if ((v111 == 0) == (v112 != 0))
  {

    goto LABEL_205;
  }
  v114 = objc_msgSend(v111, "isEqual:", v112);

  if ((v114 & 1) != 0)
  {
LABEL_198:
    objc_msgSend(v4, "findMyCaseIdentifier");
    v115 = objc_claimAutoreleasedReturnValue();
    v309 = (void *)v115;
    if (!v115)
      goto LABEL_209;
LABEL_199:
    v116 = (void *)v115;
    -[CBDevice findMyCaseIdentifier](self, "findMyCaseIdentifier");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v116;
    v119 = v117;
    if (v118 == v119)
    {

      goto LABEL_209;
    }
    v120 = v119;
    if (v119)
    {
      v121 = objc_msgSend(v118, "isEqual:", v119);

      if ((v121 & 1) != 0)
        goto LABEL_209;
    }
    else
    {

    }
    -[CBDevice setFindMyCaseIdentifier:](self, "setFindMyCaseIdentifier:", v118);
    v11 |= 0x80000000000uLL;
    goto LABEL_209;
  }
LABEL_205:
  -[CBDevice setFidoPayloadData:](self, "setFidoPayloadData:", v111);
  v11 |= 0x8000000000000uLL;
  objc_msgSend(v4, "findMyCaseIdentifier");
  v115 = objc_claimAutoreleasedReturnValue();
  v309 = (void *)v115;
  if (v115)
    goto LABEL_199;
LABEL_209:
  objc_msgSend(v4, "findMyGroupIdentifier");
  v122 = objc_claimAutoreleasedReturnValue();
  v308 = (void *)v122;
  if (!v122)
    goto LABEL_215;
  v123 = (void *)v122;
  -[CBDevice findMyGroupIdentifier](self, "findMyGroupIdentifier");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v123;
  v126 = v124;
  if (v125 == v126)
  {

    goto LABEL_215;
  }
  v127 = v126;
  if (!v126)
  {

    goto LABEL_218;
  }
  v128 = objc_msgSend(v125, "isEqual:", v126);

  if ((v128 & 1) != 0)
  {
LABEL_215:
    v129 = objc_msgSend(v4, "frequencyBand");
    if (!(_DWORD)v129)
      goto LABEL_221;
    goto LABEL_219;
  }
LABEL_218:
  -[CBDevice setFindMyGroupIdentifier:](self, "setFindMyGroupIdentifier:", v125);
  v11 |= 0x80000000000uLL;
  v129 = objc_msgSend(v4, "frequencyBand");
  if (!(_DWORD)v129)
    goto LABEL_221;
LABEL_219:
  v130 = v129;
  if ((_DWORD)v129 != -[CBDevice frequencyBand](self, "frequencyBand"))
  {
    -[CBDevice setFrequencyBand:](self, "setFrequencyBand:", v130);
    v11 |= 0x80000000000uLL;
  }
LABEL_221:
  v131 = objc_msgSend(v4, "gapaFlags");
  if ((_DWORD)v131 != -[CBDevice gapaFlags](self, "gapaFlags"))
  {
    -[CBDevice setGapaFlags:](self, "setGapaFlags:", v131);
    v11 |= 0x80000000000uLL;
  }
  objc_msgSend(v4, "gfpPayloadData");
  v132 = objc_claimAutoreleasedReturnValue();
  v324 = (void *)v132;
  if ((v5 & 2) != 0)
  {
    v133 = (void *)v132;
    -[CBDevice gfpPayloadData](self, "gfpPayloadData");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v133;
    v136 = v134;
    if (v135 == v136)
    {

      if ((unint64_t)objc_msgSend(v135, "length") < 3)
        goto LABEL_234;
    }
    else
    {
      v137 = v136;
      if ((v135 == 0) != (v136 != 0))
      {
        v138 = objc_msgSend(v135, "isEqual:", v136);

        if ((v138 & 1) != 0)
        {
          if ((unint64_t)objc_msgSend(v135, "length") >= 3)
            goto LABEL_228;
LABEL_234:
          v140 = 0;
          if (!-[CBDevice gfpModelID](self, "gfpModelID"))
            goto LABEL_236;
          goto LABEL_235;
        }
      }
      else
      {

      }
      -[CBDevice setGfpPayloadData:](self, "setGfpPayloadData:", v135);
      v11 |= 0x40000000000000uLL;
      if ((unint64_t)objc_msgSend(v135, "length") < 3)
        goto LABEL_234;
    }
LABEL_228:
    v139 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v135), "bytes");
    v140 = (*v139 << 16) | (v139[1] << 8) | v139[2];
    if ((_DWORD)v140 == -[CBDevice gfpModelID](self, "gfpModelID"))
      goto LABEL_236;
LABEL_235:
    -[CBDevice setGfpModelID:](self, "setGfpModelID:", v140);
    v11 |= 0x40000000000000uLL;
  }
LABEL_236:
  objc_msgSend(v4, "firmwareVersion");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v322 = v141;
  if (!objc_msgSend(v141, "length"))
    goto LABEL_240;
  firmwareVersion = self->_firmwareVersion;
  v143 = v141;
  v144 = firmwareVersion;
  if (v143 != v144)
  {
    v145 = v144;
    if ((v143 == 0) != (v144 != 0))
    {
      v146 = -[NSString isEqual:](v143, "isEqual:", v144);

      if ((v146 & 1) != 0)
      {
LABEL_240:
        objc_msgSend(v4, "identifier");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v312 = v147;
        if (!v147)
          goto LABEL_249;
        goto LABEL_246;
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_firmwareVersion, v322);
    v11 |= 0x80000000000uLL;
    objc_msgSend(v4, "identifier");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v312 = v147;
    if (!v147)
      goto LABEL_249;
    goto LABEL_246;
  }

  objc_msgSend(v4, "identifier");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v312 = v147;
  if (!v147)
  {
LABEL_249:
    objc_msgSend(v4, "idsDeviceID");
    v153 = objc_claimAutoreleasedReturnValue();
    v311 = (id)v153;
    if (!v153)
      goto LABEL_260;
    goto LABEL_255;
  }
LABEL_246:
  identifier = self->_identifier;
  v149 = v147;
  v150 = identifier;
  if (v149 != v150)
  {
    v151 = v150;
    if (v150)
    {
      v152 = -[NSString isEqual:](v149, "isEqual:", v150);

      if ((v152 & 1) != 0)
        goto LABEL_249;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_identifier, v312);
    v11 |= 0x80000000000uLL;
    objc_msgSend(v4, "idsDeviceID");
    v153 = objc_claimAutoreleasedReturnValue();
    v311 = (id)v153;
    if (!v153)
      goto LABEL_260;
    goto LABEL_255;
  }

  objc_msgSend(v4, "idsDeviceID");
  v153 = objc_claimAutoreleasedReturnValue();
  v311 = (id)v153;
  if (!v153)
  {
LABEL_260:
    v159 = objc_msgSend(v4, "interval");
    if (!v159)
      goto LABEL_266;
    goto LABEL_264;
  }
LABEL_255:
  v154 = (void *)v153;
  v155 = self->_idsDeviceID;
  v156 = v154;
  v157 = v156;
  if (v155 == v156)
  {

    goto LABEL_260;
  }
  if (v155)
  {
    v158 = -[NSString isEqual:](v155, "isEqual:", v156);

    if ((v158 & 1) != 0)
      goto LABEL_260;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_idsDeviceID, v311);
  v11 |= 0x80000000000uLL;
  v159 = objc_msgSend(v4, "interval");
  if (!v159)
    goto LABEL_266;
LABEL_264:
  v160 = v159;
  if (v159 != -[CBDevice interval](self, "interval"))
  {
    self->_interval = v160;
    v11 |= 0x80000000000uLL;
  }
LABEL_266:
  v161 = objc_msgSend(v4, "lastSeenTicks");
  if (v161 > self->_lastSeenTicks)
    self->_lastSeenTicks = v161;
  v162 = objc_msgSend(v4, "listeningMode");
  if ((_DWORD)v162)
  {
    v163 = v162;
    if ((_DWORD)v162 != -[CBDevice listeningMode](self, "listeningMode"))
    {
      -[CBDevice setListeningMode:](self, "setListeningMode:", v163);
      v11 |= 0x80000000000uLL;
    }
  }
  v164 = objc_msgSend(v4, "listeningModeConfigs");
  if ((_DWORD)v164)
  {
    v165 = v164;
    if ((_DWORD)v164 != -[CBDevice listeningModeConfigs](self, "listeningModeConfigs"))
    {
      -[CBDevice setListeningModeConfigs:](self, "setListeningModeConfigs:", v165);
      v11 |= 0x80000000000uLL;
    }
  }
  v166 = objc_msgSend(v4, "microphoneMode");
  if (v166 && self->_microphoneMode != v166)
  {
    self->_microphoneMode = v166;
    v11 |= 0x80000000000uLL;
  }
  objc_msgSend(v4, "model");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v321 = v167;
  if (objc_msgSend(v167, "length"))
  {
    model = self->_model;
    v169 = v167;
    v170 = model;
    if (v169 == v170)
    {

      goto LABEL_285;
    }
    v171 = v170;
    if ((v169 == 0) != (v170 != 0))
    {
      v172 = -[NSString isEqual:](v169, "isEqual:", v170);

      if ((v172 & 1) != 0)
        goto LABEL_285;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_model, v321);
    v11 |= 0x80000000000uLL;
  }
LABEL_285:
  objc_msgSend(v4, "modelUser");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v307 = v173;
  if (!objc_msgSend(v173, "length"))
    goto LABEL_289;
  -[CBDevice modelUser](self, "modelUser");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = v173;
  v176 = v174;
  if (v175 == v176)
  {

    v179 = objc_msgSend(v4, "muteControlCapability");
    muteControlCapability = self->_muteControlCapability;
    if (!v179)
      goto LABEL_296;
  }
  else
  {
    v177 = v176;
    if ((v175 == 0) == (v176 != 0))
    {

    }
    else
    {
      v178 = objc_msgSend(v175, "isEqual:", v176);

      if ((v178 & 1) != 0)
      {
LABEL_289:
        v179 = objc_msgSend(v4, "muteControlCapability");
        muteControlCapability = self->_muteControlCapability;
        if (v179)
          goto LABEL_290;
LABEL_296:
        if (!muteControlCapability)
          goto LABEL_299;
        goto LABEL_297;
      }
    }
    -[CBDevice setModelUser:](self, "setModelUser:", v175);
    v11 |= 0x80000000000uLL;
    v179 = objc_msgSend(v4, "muteControlCapability");
    muteControlCapability = self->_muteControlCapability;
    if (!v179)
      goto LABEL_296;
  }
LABEL_290:
  if (v179 != muteControlCapability)
  {
    self->_muteControlCapability = v179;
    v11 |= 0x80000000000uLL;
  }
LABEL_297:
  if (self->_endCallCapability)
  {
    self->_endCallCapability = 0;
    v11 |= 0x80000000000uLL;
  }
LABEL_299:
  v181 = objc_msgSend(v4, "muteControlConfig");
  if ((_DWORD)v181)
  {
    v182 = v181;
    if ((_DWORD)v181 != -[CBDevice muteControlConfig](self, "muteControlConfig"))
    {
      -[CBDevice setMuteControlConfig:](self, "setMuteControlConfig:", v182);
      v11 |= 0x80000000000uLL;
    }
  }
  objc_msgSend(v4, "name");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leAdvName");
  v333 = (NSString *)objc_claimAutoreleasedReturnValue();
  v326 = v183;
  if (objc_msgSend(v183, "length"))
  {
    name = self->_name;
    v185 = v183;
    v186 = name;
    if (v185 == v186)
    {

    }
    else
    {
      v187 = v186;
      if ((v185 == 0) == (v186 != 0))
      {

      }
      else
      {
        v188 = -[NSString isEqual:](v185, "isEqual:", v186);

        if ((v188 & 1) != 0)
          goto LABEL_311;
      }
      if ((v5 & 2) == 0)
      {
        p_name = &self->_name;
LABEL_314:
        v190 = v185;
        v191 = *p_name;
        *p_name = v190;

        v11 |= 0x80000000000uLL;
        goto LABEL_315;
      }
    }
  }
LABEL_311:
  if (!self->_name)
  {
    v185 = v333;
    if (-[NSString length](v333, "length"))
    {
      objc_storeStrong((id *)&self->_name, v333);
      p_name = &self->_leAdvName;
      goto LABEL_314;
    }
  }
LABEL_315:
  if (!v18)
    goto LABEL_320;
  v192 = objc_msgSend(v4, "primaryBudSide");
  if ((_DWORD)v192 == -[CBDevice primaryBudSide](self, "primaryBudSide"))
  {
    v193 = objc_msgSend(v4, "primaryPlacement");
    if (v193 == self->_primaryPlacement)
      goto LABEL_318;
LABEL_334:
    self->_primaryPlacement = v193;
    v11 |= 0x80000000000uLL;
    v194 = objc_msgSend(v4, "secondaryPlacement");
    if (v194 == self->_secondaryPlacement)
      goto LABEL_320;
    goto LABEL_319;
  }
  -[CBDevice setPrimaryBudSide:](self, "setPrimaryBudSide:", v192);
  v11 |= 0x80000000000uLL;
  v193 = objc_msgSend(v4, "primaryPlacement");
  if (v193 != self->_primaryPlacement)
    goto LABEL_334;
LABEL_318:
  v194 = objc_msgSend(v4, "secondaryPlacement");
  if (v194 != self->_secondaryPlacement)
  {
LABEL_319:
    self->_secondaryPlacement = v194;
    v11 |= 0x80000000000uLL;
  }
LABEL_320:
  v195 = objc_msgSend(v4, "placementMode");
  if (v195 && self->_placementMode != v195)
  {
    self->_placementMode = v195;
    v11 |= 0x80000000000uLL;
  }
  v196 = objc_msgSend(v4, "productID");
  if (v196 && v196 != self->_productID)
  {
    self->_productID = v196;
    v11 |= 0x80000000000uLL;
  }
  objc_msgSend(v4, "proximityServiceData");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = v197;
  if ((v5 & 2) == 0 && !v197)
  {
    v332 = 0;
    goto LABEL_341;
  }
  proximityServiceData = self->_proximityServiceData;
  v200 = v197;
  v201 = proximityServiceData;
  if (v200 == v201)
  {

    v332 = 0;
  }
  else
  {
    v202 = v201;
    v203 = v198;
    if ((v200 == 0) != (v201 != 0))
    {
      v204 = -[NSData isEqual:](v200, "isEqual:", v201);

      if ((v204 & 1) != 0)
      {
        v332 = 0;
        v198 = v203;
        goto LABEL_341;
      }
    }
    else
    {

    }
    v198 = v203;
    objc_storeStrong((id *)&self->_proximityServiceData, v203);
    v11 |= 0x80000000uLL;
    self->_discoveryFlags &= 0xFFFFFFFE7FFFFFFFLL;
    v205 = CBDiscoveryTypesProximityService();
    CBDiscoveryTypesRemoveTypes(self->_discoveryTypesInternal.bitArray, v205);
    if (v203)
      -[CBDevice _parseProximityServiceData:](self, "_parseProximityServiceData:", v200);
    v332 = 1;
  }
LABEL_341:
  objc_msgSend(v4, "safetyAlertsAlertData");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  v208 = v206;
  v209 = safetyAlertsAlertData;
  v319 = v208 != v209;
  if (v208 == v209)
  {

    v212 = v208;
  }
  else
  {
    v210 = v209;
    if ((v208 == 0) != (v209 != 0))
    {
      v211 = -[NSData isEqual:](v208, "isEqual:", v209);

      if ((v211 & 1) != 0)
      {
        v319 = 0;
        goto LABEL_349;
      }
    }
    else
    {

    }
    v213 = v208;
    v212 = self->_safetyAlertsAlertData;
    self->_safetyAlertsAlertData = v213;
  }

LABEL_349:
  v330 = v208;
  objc_msgSend(v4, "safetyAlertsAlertID");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  v216 = v214;
  v217 = safetyAlertsAlertID;
  if (v216 == v217)
  {

    v220 = v216;
LABEL_356:

    goto LABEL_357;
  }
  v218 = v217;
  if ((v216 == 0) == (v217 != 0))
  {

    goto LABEL_355;
  }
  v219 = -[NSData isEqual:](v216, "isEqual:", v217);

  if ((v219 & 1) == 0)
  {
LABEL_355:
    v221 = v216;
    v220 = self->_safetyAlertsAlertID;
    self->_safetyAlertsAlertID = v221;
    v319 = 1;
    goto LABEL_356;
  }
LABEL_357:
  objc_msgSend(v4, "safetyAlertsSignature");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  safetyAlertsSignature = self->_safetyAlertsSignature;
  v224 = v222;
  v225 = safetyAlertsSignature;
  v329 = v224;
  v306 = v198;
  if (v224 == v225)
  {

    goto LABEL_362;
  }
  v226 = v225;
  if ((v224 == 0) == (v225 != 0))
  {

    goto LABEL_366;
  }
  v227 = -[NSData isEqual:](v224, "isEqual:", v225);

  if (v227)
  {
LABEL_362:
    v228 = objc_msgSend(v4, "safetyAlertsVersion");
    p_safetyAlertsVersion = &self->_safetyAlertsVersion;
    v230 = v330;
    if (v228 == self->_safetyAlertsVersion)
    {
      v231 = v224;
      if (!v319)
        goto LABEL_371;
      goto LABEL_370;
    }
    goto LABEL_369;
  }
LABEL_366:
  objc_storeStrong((id *)&self->_safetyAlertsSignature, v222);
  v228 = objc_msgSend(v4, "safetyAlertsVersion");
  p_safetyAlertsVersion = &self->_safetyAlertsVersion;
  if (v228 != self->_safetyAlertsVersion)
  {
    v230 = v330;
LABEL_369:
    v231 = v224;
    *p_safetyAlertsVersion = v228;
    goto LABEL_370;
  }
  v231 = v224;
  v230 = v330;
LABEL_370:
  self->_changedTypesInternal.bitArray[3] |= 0x40u;
  v332 = 1;
LABEL_371:
  if (v228)
    v232 = v231 == 0;
  else
    v232 = 1;
  if (v232 || v216 == 0 || v230 == 0)
    v235 = 0;
  else
    v235 = 64;
  self->_discoveryTypesInternal.bitArray[3] = self->_discoveryTypesInternal.bitArray[3] & 0xBF | v235;
  objc_msgSend(v4, "safetyAlertsSegmentServiceData");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v310 = v236;
  if ((v334 & 0x4000) == 0)
    goto LABEL_389;
  safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
  v238 = v236;
  v239 = safetyAlertsSegmentServiceData;
  if (v238 == v239)
  {

    goto LABEL_389;
  }
  v240 = v239;
  if ((v238 == 0) == (v239 != 0))
  {

    goto LABEL_393;
  }
  v241 = -[NSData isEqual:](v238, "isEqual:", v239);

  if ((v241 & 1) != 0)
  {
LABEL_389:
    v242 = objc_msgSend(v4, "selectiveSpeechListeningCapability");
    if (!v242)
      goto LABEL_396;
    goto LABEL_390;
  }
LABEL_393:
  objc_storeStrong((id *)&self->_safetyAlertsSegmentServiceData, v310);
  self->_changedTypesInternal.bitArray[3] |= 0x40u;
  self->_discoveryTypesInternal.bitArray[3] &= ~0x40u;
  if (v238)
    -[CBDevice _parseSafetyAlertsSegmentServiceData:](self, "_parseSafetyAlertsSegmentServiceData:", v238);
  v332 = 1;
  v242 = objc_msgSend(v4, "selectiveSpeechListeningCapability");
  if (v242)
  {
LABEL_390:
    if (v242 != self->_selectiveSpeechListeningCapability)
    {
      self->_selectiveSpeechListeningCapability = v242;
      v11 |= 0x80000000000uLL;
    }
  }
LABEL_396:
  v243 = objc_msgSend(v4, "selectiveSpeechListeningConfig");
  if ((_DWORD)v243)
  {
    v244 = v243;
    if ((_DWORD)v243 != -[CBDevice selectiveSpeechListeningConfig](self, "selectiveSpeechListeningConfig"))
    {
      -[CBDevice setSelectiveSpeechListeningConfig:](self, "setSelectiveSpeechListeningConfig:", v244);
      v11 |= 0x80000000000uLL;
    }
  }
  objc_msgSend(v4, "serialNumber");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v245, "length"))
  {
    serialNumber = self->_serialNumber;
    v247 = v245;
    v248 = serialNumber;
    if (v247 == v248)
    {

      goto LABEL_407;
    }
    v249 = v248;
    if ((v247 == 0) != (v248 != 0))
    {
      v250 = -[NSString isEqual:](v247, "isEqual:", v248);

      if ((v250 & 1) != 0)
        goto LABEL_407;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_serialNumber, v245);
    v11 |= 0x80000000000uLL;
  }
LABEL_407:
  objc_msgSend(v4, "serialNumberLeft");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v320 = v251;
  if (!objc_msgSend(v251, "length"))
    goto LABEL_415;
  serialNumberLeft = self->_serialNumberLeft;
  v253 = v251;
  v254 = serialNumberLeft;
  if (v253 == v254)
  {

    goto LABEL_415;
  }
  v255 = v254;
  if ((v253 == 0) == (v254 != 0))
  {

    goto LABEL_414;
  }
  v256 = -[NSString isEqual:](v253, "isEqual:", v254);

  if ((v256 & 1) == 0)
  {
LABEL_414:
    objc_storeStrong((id *)&self->_serialNumberLeft, v320);
    v11 |= 0x80000000000uLL;
  }
LABEL_415:
  objc_msgSend(v4, "serialNumberRight");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v318 = v257;
  if (!objc_msgSend(v257, "length"))
    goto LABEL_421;
  serialNumberRight = self->_serialNumberRight;
  v259 = v257;
  v260 = serialNumberRight;
  if (v259 == v260)
  {

    goto LABEL_421;
  }
  v261 = v260;
  if ((v259 == 0) == (v260 != 0))
  {

    goto LABEL_424;
  }
  v262 = -[NSString isEqual:](v259, "isEqual:", v260);

  if ((v262 & 1) != 0)
  {
LABEL_421:
    v263 = objc_msgSend(v4, "smartRoutingMode");
    if (v263)
      goto LABEL_425;
    goto LABEL_427;
  }
LABEL_424:
  objc_storeStrong((id *)&self->_serialNumberRight, v318);
  v11 |= 0x80000000000uLL;
  v263 = objc_msgSend(v4, "smartRoutingMode");
  if (v263)
  {
LABEL_425:
    if (self->_smartRoutingMode != v263)
    {
      self->_smartRoutingMode = v263;
      v11 |= 0x80000000000uLL;
    }
  }
LABEL_427:
  if (v18)
  {
    v264 = objc_msgSend(v4, "spatialAudioMode");
    if ((_DWORD)v264 != -[CBDevice spatialAudioMode](self, "spatialAudioMode"))
    {
      -[CBDevice setSpatialAudioMode:](self, "setSpatialAudioMode:", v264);
      v11 |= 0x80000000000uLL;
    }
    v265 = objc_msgSend(v4, "supportedServices");
    if (v265 != self->_supportedServices)
    {
      self->_supportedServices = v265;
      v11 |= 0x80000200000uLL;
    }
  }
  objc_msgSend(v4, "txAddressData");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v267 = v266;
  if (!v266)
    goto LABEL_438;
  txAddressData = self->_txAddressData;
  v269 = v266;
  v270 = txAddressData;
  if (v269 == v270)
  {

    goto LABEL_438;
  }
  v271 = v270;
  if (!v270)
  {

    goto LABEL_441;
  }
  v272 = -[NSData isEqual:](v269, "isEqual:", v270);

  if ((v272 & 1) != 0)
  {
LABEL_438:
    v273 = objc_msgSend(v4, "vendorID");
    if (!v273)
      goto LABEL_444;
    goto LABEL_442;
  }
LABEL_441:
  objc_storeStrong((id *)&self->_txAddressData, v267);
  v11 |= 0x80000000000uLL;
  v273 = objc_msgSend(v4, "vendorID");
  if (!v273)
    goto LABEL_444;
LABEL_442:
  if (v273 != self->_vendorID)
  {
    self->_vendorID = v273;
    v11 |= 0x80000000000uLL;
  }
LABEL_444:
  v274 = objc_msgSend(v4, "vendorIDSource");
  vendorIDSource = self->_vendorIDSource;
  if (!v274)
  {
    v274 = self->_vendorIDSource;
    v305 = v216;
    v303 = v267;
    v276 = discoveryFlags;
    if (vendorIDSource != 1)
      goto LABEL_448;
LABEL_451:
    v277 = 76;
LABEL_452:
    v278 = self->_vendorID == v277;
    v279 = -[CBDevice productID](self, "productID");
    if ((_DWORD)v279)
      goto LABEL_453;
    goto LABEL_460;
  }
  if (v274 != vendorIDSource)
  {
    self->_vendorIDSource = v274;
    v11 |= 0x80000000000uLL;
  }
  v305 = v216;
  v303 = v267;
  v276 = discoveryFlags;
  if (v274 == 1)
    goto LABEL_451;
LABEL_448:
  if (v274 == 2)
  {
    v277 = 1452;
    goto LABEL_452;
  }
  v278 = 0;
  v279 = -[CBDevice productID](self, "productID");
  if ((_DWORD)v279)
  {
LABEL_453:
    v304 = v245;
    if (v278)
      goto LABEL_454;
LABEL_464:
    CBDeviceTypeToNSLocalizedString(self->_deviceType);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v278)
      goto LABEL_477;
    goto LABEL_471;
  }
LABEL_460:
  v279 = -[CBDevice proximityPairingProductID](self, "proximityPairingProductID");
  if ((_DWORD)v279)
    v285 = v278;
  else
    v285 = 0;
  v304 = v245;
  if (!v285)
    goto LABEL_464;
LABEL_454:
  +[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", v279);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "productName");
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v281)
    goto LABEL_467;
  v282 = self->_productName;
  v283 = v281;
  v284 = v283;
  if (v282 == v283)
  {

    goto LABEL_467;
  }
  if (!v282)
  {

LABEL_470:
    objc_storeStrong((id *)&self->_productName, v281);
    v11 |= 0x80000000000uLL;

    CBDeviceTypeToNSLocalizedString(self->_deviceType);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v278)
      goto LABEL_477;
    goto LABEL_471;
  }
  v300 = -[NSString isEqual:](v282, "isEqual:", v283);

  if ((v300 & 1) == 0)
    goto LABEL_470;
LABEL_467:

  CBDeviceTypeToNSLocalizedString(self->_deviceType);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v278)
    goto LABEL_477;
LABEL_471:
  v287 = self->_name;
  if (!v287 || -[NSString isEqualToString:](v287, "isEqualToString:", v286))
  {
    CBProductIDToNSLocalizedProductNameString(v279);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = v333;
    if (v288)
    {
      objc_storeStrong((id *)&self->_name, v288);
      v11 |= 0x80000000000uLL;
    }
    v290 = v332;

    v291 = &self->_name;
    if (!self->_name)
      goto LABEL_478;
    goto LABEL_479;
  }
LABEL_477:
  v289 = v333;
  v290 = v332;
  v291 = &self->_name;
  if (!self->_name)
  {
LABEL_478:
    objc_storeStrong((id *)v291, v286);
    v11 |= 0x80000000000uLL;
  }
LABEL_479:
  if (-[NSString length](v289, "length") && -[NSString isEqualToString:](*v291, "isEqualToString:", v286))
  {
    objc_storeStrong((id *)v291, v289);
    objc_storeStrong((id *)&self->_leAdvName, v289);
    v11 |= 0x80000000000uLL;
  }
  if ((v11 & 0x40000000) != 0)
  {
    self->_discoveryFlags &= 0x8305793BCEB00040;
    discoveryTypesInternal = self->_discoveryTypesInternal;
    v297 = CBDiscoveryTypesBLEScan();
    CBDiscoveryTypesRemoveTypes(self->_discoveryTypesInternal.bitArray, v297);
    v298 = objc_retainAutorelease(v327);
    v299 = objc_msgSend(v298, "bytes");
    if (v299)
      -[CBDevice _parseManufacturerPtr:end:](self, "_parseManufacturerPtr:end:", v299, v299 + objc_msgSend(v298, "length"));
    CBDiscoveryTypesAddChangedTypes(self->_changedTypesInternal.bitArray, &discoveryTypesInternal, self->_discoveryTypesInternal.bitArray);
    v290 = 1;
    if ((v334 & 2) != 0)
    {
LABEL_484:
      self->_discoveryFlags = self->_discoveryFlags & 0xFFFDFFFFFFFFFFFFLL | ((((unint64_t)objc_msgSend(v4, "discoveryFlags") >> 49) & 1) << 49);
      self->_discoveryFlags = ((unint64_t)(v325 != 0) << 51) | ((unint64_t)(v324 != 0) << 54) | self->_discoveryFlags & 0xFFB7FFFFDFFFFFFFLL | objc_msgSend(v4, "discoveryFlags") & 0x20000000;
      self->_discoveryTypesInternal.bitArray[1] = self->_discoveryTypesInternal.bitArray[1] & 0xEF | (16 * (v331 != 0));
      if (!v290)
        goto LABEL_485;
      goto LABEL_494;
    }
  }
  else if ((v334 & 2) != 0)
  {
    goto LABEL_484;
  }
  if (!v290)
  {
LABEL_485:
    if ((self->_internalFlags & 0x800) == 0)
      goto LABEL_487;
    goto LABEL_486;
  }
LABEL_494:
  -[CBDevice _clearUnparsedProperties](self, "_clearUnparsedProperties");
  if ((self->_internalFlags & 0x800) != 0)
LABEL_486:
    self->_discoveryTypesInternal.bitArray[3] |= 0x80u;
LABEL_487:
  v292 = self->_discoveryFlags;
  v293 = v11 | 0x800000000;
  if (v292 == v276)
    v293 = v11;
  v294 = self->_changeFlags;
  v295 = v294 ^ changeFlags | v292 ^ v276 | v293;
  self->_changeFlags = v295 | v294;

  return v295;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)discoveryTypesContainCBDiscovery:(id)a3
{
  id v4;
  unint64_t discoveryFlags;
  BOOL v7;

  v4 = a3;
  discoveryFlags = self->_discoveryFlags;
  if ((objc_msgSend(v4, "discoveryFlags") & discoveryFlags) != 0)
  {

    return 1;
  }
  else
  {
    v7 = CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, (_BYTE *)objc_msgSend(objc_retainAutorelease(v4), "discoveryTypesInternalPtr"));

    return v7;
  }
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (unsigned)gapaFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (NSData)gfpPayloadData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (NSData)fidoPayloadData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (NSData)dockKitAccessoryPayloadData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)adaptiveVolumeConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)muteControlConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)modelUser
{
  CFStringGetTypeID();
  return (NSString *)CFDictionaryGetTypedValue();
}

- (int)listeningMode
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)listeningModeConfigs
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)interval
{
  return self->_interval;
}

- (NSString)findMyGroupIdentifier
{
  CFStringGetTypeID();
  return (NSString *)CFDictionaryGetTypedValue();
}

- (NSString)findMyCaseIdentifier
{
  CFStringGetTypeID();
  return (NSString *)CFDictionaryGetTypedValue();
}

- (unsigned)endCallConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)crownRotationDirection
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)conversationDetectConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)clickHoldModeRight
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)clickHoldModeLeft
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)btVersion
{
  CFStringGetTypeID();
  return (NSString *)CFDictionaryGetTypedValue();
}

- (unsigned)appearanceValue
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)selectiveSpeechListeningConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)proximityPairingProductID
{
  return self->_proximityPairingProductID;
}

- (NSString)model
{
  return self->_model;
}

- (int)bleChannel
{
  return self->_bleChannel;
}

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (char)smartRoutingMode
{
  return self->_smartRoutingMode;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)serialNumberRight
{
  return self->_serialNumberRight;
}

- (NSString)serialNumberLeft
{
  return self->_serialNumberLeft;
}

- (unsigned)selectiveSpeechListeningCapability
{
  return self->_selectiveSpeechListeningCapability;
}

- (unsigned)safetyAlertsVersion
{
  return self->_safetyAlertsVersion;
}

- (NSData)safetyAlertsSignature
{
  return self->_safetyAlertsSignature;
}

- (NSData)safetyAlertsSegmentServiceData
{
  return self->_safetyAlertsSegmentServiceData;
}

- (unsigned)safetyAlertsAlertIndex
{
  return self->_safetyAlertsAlertIndex;
}

- (NSData)safetyAlertsAlertData
{
  return self->_safetyAlertsAlertData;
}

- (NSData)proximityServiceData
{
  return self->_proximityServiceData;
}

- (char)placementMode
{
  return self->_placementMode;
}

- (unsigned)muteControlCapability
{
  return self->_muteControlCapability;
}

- (char)microphoneMode
{
  return self->_microphoneMode;
}

- (NSString)leAdvName
{
  return self->_leAdvName;
}

- (unint64_t)lastSeenTicks
{
  return self->_lastSeenTicks;
}

- (unsigned)gfpModelID
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (unsigned)endCallCapability
{
  return self->_endCallCapability;
}

- (unsigned)dsInfoVehicleState
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)dsInfoVehicleConfidence
{
  return CFDictionaryGetInt64Ranged();
}

- (char)doubleTapCapability
{
  return self->_doubleTapCapability;
}

- (char)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (char)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (unsigned)conversationDetectCapability
{
  return self->_conversationDetectCapability;
}

- (CBControllerInfo)controllerInfo
{
  return self->_controllerInfo;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (unsigned)colorInfo
{
  return self->_colorInfo;
}

- (char)classicRSSI
{
  return self->_classicRSSI;
}

- (NSString)caseVersion
{
  return self->_caseVersion;
}

- (int)bleRSSI
{
  return self->_bleRSSI;
}

- (NSData)bleAppleManufacturerData
{
  return self->_bleAppleManufacturerData;
}

- (double)bleAdvertisementTimestamp
{
  return self->_bleAdvertisementTimestamp;
}

- (NSData)bleAdvertisementData
{
  return self->_bleAdvertisementData;
}

- (NSData)bleAddressData
{
  return self->_bleAddressData;
}

- (unsigned)autoAncCapability
{
  return self->_autoAncCapability;
}

- (int)audioStreamState
{
  return self->_audioStreamState;
}

- (unsigned)adaptiveVolumeCapability
{
  return self->_adaptiveVolumeCapability;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialInteractionDeviceTimestampArrayDictionary, 0);
  objc_storeStrong((id *)&self->_spatialInteractionDeviceTimestampArrayClientIDs, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSegmentSignature, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSegmentServiceData, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSegmentAlertData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2EncryptedData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoAuthTag, 0);
  objc_storeStrong((id *)&self->_nearbyActionTargetAuthTag, 0);
  objc_storeStrong((id *)&self->_nearbyActionAuthTag, 0);
  objc_storeStrong((id *)&self->_leAdvName, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeConfigData, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAuthTagData, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSignature, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertID, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionUWBConfigData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionUserInfo, 0);
  objc_storeStrong((id *)&self->_spatialInteractionTokenData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionIdentifiers, 0);
  objc_storeStrong((id *)&self->_proximityServiceSetupHash, 0);
  objc_storeStrong((id *)&self->_proximityServiceData, 0);
  objc_storeStrong((id *)&self->_proximityServiceClassicAddress, 0);
  objc_storeStrong((id *)&self->_objectSetupMessage, 0);
  objc_storeStrong((id *)&self->_objectSetupFontCode, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryPublicKeyData, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryNearOwnerID, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2TempAuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthIntegrityTagData, 0);
  objc_storeStrong((id *)&self->_nearbyAuthTag, 0);
  objc_storeStrong((id *)&self->_homeKitV2AuthTagData, 0);
  objc_storeStrong((id *)&self->_homeKitV2AccessoryIDData, 0);
  objc_storeStrong((id *)&self->_homeKitV1DeviceIDData, 0);
  objc_storeStrong((id *)&self->_airplaySourceAuthTagData, 0);
  objc_storeStrong((id *)&self->_airdropTempAuthTagData, 0);
  objc_storeStrong((id *)&self->_txAddressData, 0);
  objc_storeStrong((id *)&self->_tipiDevices, 0);
  objc_storeStrong((id *)&self->_serialNumberRight, 0);
  objc_storeStrong((id *)&self->_serialNumberLeft, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_remoteHostID, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_caseVersion, 0);
  objc_storeStrong((id *)&self->_btAddressData, 0);
  objc_storeStrong((id *)&self->_bleAppleManufacturerData, 0);
  objc_storeStrong((id *)&self->_bleAdvertisementData, 0);
  objc_storeStrong((id *)&self->_bleAddressData, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)_parseManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  const char *v4;
  int v5;
  int v6;

  if (a4 - a3 >= 2)
  {
    v6 = *(unsigned __int16 *)a3;
    v4 = a3 + 2;
    v5 = v6;
    if (v6 == 6)
    {
      -[CBDevice _parseMicrosoftManufacturerPtr:end:](self, "_parseMicrosoftManufacturerPtr:end:", v4);
    }
    else if (v5 == 76)
    {
      -[CBDevice _parseAppleManufacturerPtr:end:](self, "_parseAppleManufacturerPtr:end:", v4);
    }
  }
}

- (id)description
{
  return -[CBDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (void)updateWithReceivedAuthTag:(id)a3 forType:(unsigned __int8)a4
{
  int v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;

  v4 = a4;
  v13 = a3;
  if (!v13)
    goto LABEL_7;
  if (v4 != 21)
    goto LABEL_7;
  -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
    goto LABEL_7;
  -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v8;
  if (v10 == v9)
  {

    return;
  }
  v11 = v10;
  if (!v10)
  {

    goto LABEL_11;
  }
  v12 = objc_msgSend(v9, "isEqual:", v10);

  if ((v12 & 1) == 0)
  {
LABEL_11:
    -[CBDevice setNearbyActionV2Flags:](self, "setNearbyActionV2Flags:", 0);
    -[CBDevice setNearbyActionV2Type:](self, "setNearbyActionV2Type:", 0);
    -[CBDevice setNearbyActionV2TargetData:](self, "setNearbyActionV2TargetData:", 0);
    self->_discoveryFlags &= 0xDFFFFFFBFFFDFEF7;
    self->_changeFlags &= 0xDFFFFFFBFFFDFEF7;

    return;
  }
LABEL_7:

}

- (NSData)nearbyActionV2TargetData
{
  return (NSData *)CFDictionaryGetCFDataOfLength();
}

- (BOOL)changedTypesNeedsIdentify
{
  _BYTE *v4;
  void *v5;

  if ((self->_changeFlags & 0x4000080040) != 0
    || self->_nearbyInfoV2AuthTagData && (self->_changedTypesInternal.bitArray[0] & 0x10) != 0)
  {
    return 1;
  }
  v4 = CBDiscoveryTypesNeedsIdentify();
  if (CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, v4))
    return 1;
  -[CBDevice nearbyInfoV2EncryptedData](self, "nearbyInfoV2EncryptedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (NSData)nearbyInfoV2EncryptedData
{
  return self->_nearbyInfoV2EncryptedData;
}

- (NSData)nearbyInfoV2AuthTagData
{
  return self->_nearbyInfoV2AuthTagData;
}

- (NSData)nearbyAuthTag
{
  return self->_nearbyAuthTag;
}

- (NSData)airplaySourceAuthTagData
{
  return self->_airplaySourceAuthTagData;
}

- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  uint64_t v7;
  int v8;

  if (a4 - a3 >= 2)
  {
    v5 = a3;
    do
    {
      v7 = v5[1] & 0x1F;
      if (a4 - (v5 + 2) < v7)
        break;
      v8 = *(unsigned __int8 *)v5;
      v5 += v7 + 2;
      switch(v8)
      {
        case 5:
          -[CBDevice _parseAirDropPtr:end:](self, "_parseAirDropPtr:end:");
          break;
        case 6:
          -[CBDevice _parseHomeKitV1Ptr:end:](self, "_parseHomeKitV1Ptr:end:");
          break;
        case 7:
          -[CBDevice _parseProximityPairingPtr:end:](self, "_parseProximityPairingPtr:end:");
          break;
        case 8:
          -[CBDevice _parseHeySiriPtr:end:](self, "_parseHeySiriPtr:end:");
          break;
        case 9:
          -[CBDevice _parseAirPlayTargetPtr:end:](self, "_parseAirPlayTargetPtr:end:");
          break;
        case 10:
          -[CBDevice _parseAirPlaySourcePtr:end:](self, "_parseAirPlaySourcePtr:end:");
          break;
        case 15:
          -[CBDevice _parseNearbyActionPtr:end:](self, "_parseNearbyActionPtr:end:");
          break;
        case 16:
          -[CBDevice _parseNearbyInfoPtr:end:](self, "_parseNearbyInfoPtr:end:");
          break;
        case 17:
          -[CBDevice _parseHomeKitV2Ptr:end:](self, "_parseHomeKitV2Ptr:end:");
          break;
        case 18:
          -[CBDevice _parseObjectDiscoveryPtr:end:](self, "_parseObjectDiscoveryPtr:end:");
          break;
        case 19:
          -[CBDevice _parseSpatialInteractionPtr:end:](self, "_parseSpatialInteractionPtr:end:");
          break;
        case 21:
          -[CBDevice _parseNearbyActionV2Ptr:end:](self, "_parseNearbyActionV2Ptr:end:");
          break;
        case 22:
          -[CBDevice _parseNearbyInfoV2Ptr:end:](self, "_parseNearbyInfoV2Ptr:end:");
          break;
        case 24:
          -[CBDevice _parseDSInfoPtr:end:](self, "_parseDSInfoPtr:end:");
          break;
        case 26:
          -[CBDevice _parseNearbyActionNoWakePtr:end:](self, "_parseNearbyActionNoWakePtr:end:");
          break;
        default:
          break;
      }
    }
    while (a4 - v5 > 1);
  }
}

- (void)_parseNearbyInfoPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v7;
  int v8;
  unsigned int v9;
  char *v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  char v14;
  int v15;
  int v16;
  unsigned int v17;
  char v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  NSData *nearbyInfoAuthTag;
  NSData *v25;
  NSData *v26;
  NSData *v27;
  char v28;
  id obj;

  if (a4 - a3 < 1)
  {
    v9 = 0;
    obj = 0;
    v8 = 0;
    goto LABEL_29;
  }
  v7 = *(unsigned __int8 *)a3;
  v8 = v7 & 0xF;
  v9 = (v7 >> 2) & 4 | (v7 >> 6) & 1 | (v7 >> 4) & 2;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1)
    goto LABEL_28;
  v10 = (char *)(a3 + 2);
  v11 = *((unsigned __int8 *)a3 + 1);
  if ((v11 & 0x80u) == 0)
    v12 = (v7 >> 2) & 4 | (v7 >> 6) & 1 | (v7 >> 4) & 2;
  else
    v12 = v9 | 8;
  v13 = v11 & 0x20 | (v11 >> 2) & 0x10 | v12 & 0xFFFFFFBF | (((v11 >> 4) & 1) << 6);
  v9 = (v11 << 8) & 0x200 | (((v11 & 4) != 0) << 8) | (((v11 >> 3) & 1) << 7) | v13;
  if ((v13 & 0x40) == 0)
  {
    obj = 0;
    if ((v11 & 1) == 0)
      goto LABEL_8;
    goto LABEL_13;
  }
  if (a4 - v10 < 3)
  {
LABEL_28:
    obj = 0;
    goto LABEL_29;
  }
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 2, 3);
  v10 = (char *)(a3 + 5);
  if ((v11 & 1) == 0)
  {
LABEL_8:
    if ((v9 & 0x1000) == 0)
      goto LABEL_29;
    goto LABEL_17;
  }
LABEL_13:
  if (a4 - v10 < 1)
    goto LABEL_29;
  v15 = *v10++;
  v14 = v15;
  v16 = v9 | 0x400;
  if (v15 >= 0)
    v16 = v9;
  v9 = v16 | ((v14 & 4) << 10);
  if ((v9 & 0x1000) == 0)
  {
LABEL_29:
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("w"), 0);
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("x"), 0);
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("y"), 0);
    v22 = 0;
    if (v8 != self->_nearbyActivityLevel)
      goto LABEL_30;
LABEL_25:
    if (v9 != self->_nearbyInfoFlags)
      goto LABEL_31;
    goto LABEL_26;
  }
LABEL_17:
  if (a4 - v10 < 3)
    goto LABEL_29;
  v17 = v10[1] & 0x7F;
  if (v17 >= 0x64)
    v17 = 100;
  v18 = *v10;
  v19 = (double)v17 / 100.0;
  v20 = v10[2] & 0xF;
  -[CBDevice nearbyInfoStatusProgress](self, "nearbyInfoStatusProgress");
  if (v19 != v21)
  {
    -[CBDevice setNearbyInfoStatusProgress:](self, "setNearbyInfoStatusProgress:", v19);
    v22 = 64;
    v23 = v18 & 0x1F;
    if ((_DWORD)v20 == -[CBDevice nearbyInfoStatusTime](self, "nearbyInfoStatusTime"))
      goto LABEL_23;
    goto LABEL_22;
  }
  v22 = 0;
  v23 = v18 & 0x1F;
  if ((_DWORD)v20 != -[CBDevice nearbyInfoStatusTime](self, "nearbyInfoStatusTime"))
  {
LABEL_22:
    -[CBDevice setNearbyInfoStatusTime:](self, "setNearbyInfoStatusTime:", v20);
    v22 = 64;
  }
LABEL_23:
  if ((_DWORD)v23 == -[CBDevice nearbyInfoStatusType](self, "nearbyInfoStatusType"))
  {
    if (v8 != self->_nearbyActivityLevel)
      goto LABEL_30;
    goto LABEL_25;
  }
  -[CBDevice setNearbyInfoStatusType:](self, "setNearbyInfoStatusType:", v23);
  v22 = 64;
  if (v8 == self->_nearbyActivityLevel)
    goto LABEL_25;
LABEL_30:
  self->_nearbyActivityLevel = v8;
  v22 = 64;
  if (v9 != self->_nearbyInfoFlags)
  {
LABEL_31:
    self->_nearbyInfoFlags = v9;
    v22 |= 0x40uLL;
    if ((v9 & 0x40) == 0)
      goto LABEL_39;
    goto LABEL_32;
  }
LABEL_26:
  if ((v9 & 0x40) == 0)
    goto LABEL_39;
LABEL_32:
  nearbyInfoAuthTag = self->_nearbyInfoAuthTag;
  v25 = (NSData *)obj;
  v26 = nearbyInfoAuthTag;
  if (v25 == v26)
  {

  }
  else
  {
    v27 = v26;
    if ((v25 == 0) != (v26 != 0))
    {
      v28 = -[NSData isEqual:](v25, "isEqual:", v26);

      if ((v28 & 1) != 0)
        goto LABEL_39;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_nearbyInfoAuthTag, obj);
    v22 |= 0x40uLL;
  }
LABEL_39:
  self->_discoveryFlags |= 0x40uLL;
  self->_changeFlags |= v22;

}

- (void)_clearUnparsedProperties
{
  unint64_t discoveryFlags;
  NSData *v4;
  $77478E09546100A0DB2933F271BBC655 discoveryTypesInternal;
  NSData *safetyAlertsAlertData;
  NSData *safetyAlertsAlertID;
  NSData *safetyAlertsSignature;
  NSData *safetyAlertsSegmentAlertData;
  NSData *safetyAlertsSegmentServiceData;
  NSData *safetyAlertsSegmentSignature;
  NSData *homeKitV2AuthTagData;
  NSData *nearbyActionAuthTag;
  NSData *objectDiscoveryNearOwnerID;
  NSData *objectDiscoveryPublicKeyData;
  NSString *objectSetupFontCode;
  NSString *objectSetupMessage;
  NSData *proximityServiceSetupHash;
  NSArray *spatialInteractionIdentifiers;
  NSData *spatialInteractionTokenData;
  NSDictionary *spatialInteractionUserInfo;
  NSData *spatialInteractionUWBConfigData;

  discoveryFlags = self->_discoveryFlags;
  if ((discoveryFlags & 0x4000000000) != 0)
  {
    if ((discoveryFlags & 0x8000000000) != 0)
      goto LABEL_3;
  }
  else
  {
    self->_airplaySourceFlags = 0;
    if ((discoveryFlags & 0x8000000000) != 0)
    {
LABEL_3:
      if ((discoveryFlags & 0x8000000000000) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  self->_airplayTargetFlags = 0;
  self->_airplayTargetIPv4 = 0;
  if ((discoveryFlags & 0x8000000000000) != 0)
  {
LABEL_4:
    if ((discoveryFlags & 0x40000000000000) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  -[CBDevice setFidoPayloadData:](self, "setFidoPayloadData:", 0);
  if ((discoveryFlags & 0x40000000000000) != 0)
  {
LABEL_5:
    if ((discoveryFlags & 0x400000) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  -[CBDevice setGfpModelID:](self, "setGfpModelID:", 0);
  -[CBDevice setGfpPayloadData:](self, "setGfpPayloadData:", 0);
  if ((discoveryFlags & 0x400000) != 0)
  {
LABEL_6:
    if ((discoveryFlags & 0x1000000) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *(_WORD *)&self->_homeKitV1CompatibleVersion = 0;
  self->_homeKitV1Flags = 0;
  self->_homeKitV1StateNumber = 0;
  self->_homeKitV1SetupHash = 0;
  if ((discoveryFlags & 0x1000000) != 0)
  {
LABEL_7:
    if ((discoveryFlags & 0x80000000000000) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
  self->_homeKitV2AuthTagData = 0;

  *(_DWORD *)&self->_homeKitV2InstanceID = 0;
  self->_homeKitV2Value = 0;
  if ((discoveryFlags & 0x80000000000000) != 0)
  {
LABEL_8:
    if ((discoveryFlags & 0x5030800010083E37) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  -[CBDevice setMspAddressData:](self, "setMspAddressData:", 0);
  -[CBDevice setMspDeviceClass:](self, "setMspDeviceClass:", 0);
  -[CBDevice setMspDisplayName:](self, "setMspDisplayName:", 0);
  -[CBDevice setMspSubScenario:](self, "setMspSubScenario:", 0);
  if ((discoveryFlags & 0x5030800010083E37) != 0)
  {
LABEL_9:
    if ((discoveryFlags & 0x2000000400020108) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  nearbyActionAuthTag = self->_nearbyActionAuthTag;
  self->_nearbyActionAuthTag = 0;

  -[CBDevice setNearbyActionDeviceClass:](self, "setNearbyActionDeviceClass:", 0);
  self->_nearbyActionFlags = 0;
  self->_nearbyActionType = 0;
  if ((discoveryFlags & 0x2000000400020108) != 0)
  {
LABEL_10:
    v4 = self->_nearbyActionAuthTag;
    if (v4)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  -[CBDevice setNearbyActionV2Flags:](self, "setNearbyActionV2Flags:", 0);
  -[CBDevice setNearbyActionV2Type:](self, "setNearbyActionV2Type:", 0);
  v4 = self->_nearbyActionAuthTag;
  if (v4)
  {
LABEL_11:
    objc_storeStrong((id *)&self->_nearbyAuthTag, v4);
    if ((discoveryFlags & 0x60000000000) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_storeStrong((id *)&self->_nearbyAuthTag, self->_nearbyInfoAuthTag);
  if ((discoveryFlags & 0x60000000000) != 0)
  {
LABEL_12:
    if ((discoveryFlags & 0x10000) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->_objectDiscoveryMode = 0;
  objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
  self->_objectDiscoveryNearOwnerID = 0;

  objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
  self->_objectDiscoveryPublicKeyData = 0;

  if ((discoveryFlags & 0x10000) != 0)
  {
LABEL_13:
    if ((discoveryFlags & 0x80000000) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  self->_objectSetupFlags = 0;
  objectSetupFontCode = self->_objectSetupFontCode;
  self->_objectSetupFontCode = 0;

  objectSetupMessage = self->_objectSetupMessage;
  self->_objectSetupMessage = 0;

  if ((discoveryFlags & 0x80000000) != 0)
  {
LABEL_14:
    if ((discoveryFlags & 0x40000) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *(_WORD *)&self->_proximityServiceFlags = 0;
  self->_proximityServicePSM = 0;
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  self->_proximityServiceSetupHash = 0;

  *(_WORD *)&self->_proximityServiceSubType = 0;
  if ((discoveryFlags & 0x40000) != 0)
  {
LABEL_15:
    discoveryTypesInternal = self->_discoveryTypesInternal;
    if ((*(_WORD *)discoveryTypesInternal.bitArray & 0x1000) != 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  self->_spatialInteractionFlags = 0;
  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  self->_spatialInteractionIdentifiers = 0;

  self->_spatialInteractionPeerID = 0;
  spatialInteractionTokenData = self->_spatialInteractionTokenData;
  self->_spatialInteractionTokenData = 0;

  spatialInteractionUserInfo = self->_spatialInteractionUserInfo;
  self->_spatialInteractionUserInfo = 0;

  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  self->_spatialInteractionUWBConfigData = 0;

  discoveryTypesInternal = self->_discoveryTypesInternal;
  if ((*(_WORD *)discoveryTypesInternal.bitArray & 0x1000) != 0)
  {
LABEL_16:
    if ((*(_DWORD *)&discoveryTypesInternal & 0x40000000) != 0)
      return;
    goto LABEL_17;
  }
LABEL_32:
  -[CBDevice setDockKitAccessoryPayloadData:](self, "setDockKitAccessoryPayloadData:", 0);
  if ((*(_DWORD *)&discoveryTypesInternal & 0x40000000) == 0)
  {
LABEL_17:
    safetyAlertsAlertData = self->_safetyAlertsAlertData;
    self->_safetyAlertsAlertData = 0;

    safetyAlertsAlertID = self->_safetyAlertsAlertID;
    self->_safetyAlertsAlertID = 0;

    safetyAlertsSignature = self->_safetyAlertsSignature;
    self->_safetyAlertsSignature = 0;

    self->_safetyAlertsVersion = 0;
    safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
    self->_safetyAlertsSegmentAlertData = 0;

    *(_WORD *)&self->_safetyAlertsSegmentSegmentNumber = 0;
    safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
    self->_safetyAlertsSegmentServiceData = 0;

    safetyAlertsSegmentSignature = self->_safetyAlertsSegmentSignature;
    self->_safetyAlertsSegmentSignature = 0;

  }
}

- (void)_setDeviceInfoKey:(id)a3 value:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self->_deviceInfo;
  v8 = v7;
  if (v6 && !v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_storeStrong((id *)&self->_deviceInfo, v8);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v6, v9);

}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("v"), v4);

  }
  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("v"), 0);
  }
}

- (void)setNearbyActionV2Flags:(unsigned int)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("t"), v4);

  }
  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("t"), 0);
  }
}

- (void)setNearbyActionDeviceClass:(unsigned __int8)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("z"), v4);

  }
  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("z"), 0);
  }
}

- (void)setMspSubScenario:(unsigned __int8)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("s"), v4);

  }
  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("s"), 0);
  }
}

- (void)setMspDisplayName:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("r"), a3);
}

- (void)setMspDeviceClass:(unsigned int)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("q"), v4);

  }
  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("q"), 0);
  }
}

- (void)setMspAddressData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("p"), a3);
}

- (void)setGfpPayloadData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("f"), a3);
}

- (void)setGfpModelID:(unsigned int)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("e"), v4);

  }
  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("e"), 0);
  }
}

- (void)setFidoPayloadData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("d"), a3);
}

- (void)setDockKitAccessoryPayloadData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("dKA"), a3);
}

- (void)setLeAdvName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (id)descriptionWithLevel:(int)a3
{
  NSData *v5;
  id *v6;
  NSData *v7;
  id *v8;
  NSString *v9;
  NSString *v10;
  id *v11;
  NSString *v12;
  NSString *v13;
  id *v14;
  uint64_t productID;
  const char *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  id *v20;
  unsigned int v21;
  void *vendorID;
  id *v23;
  void *vendorIDSource;
  id *v25;
  NSString *v26;
  NSString *v27;
  id *v28;
  NSString *v29;
  NSString *v30;
  id *v31;
  void *adaptiveVolumeCapability;
  id *v33;
  unsigned int v34;
  id *v35;
  NSString *v36;
  NSString *v37;
  id *v38;
  uint64_t v39;
  void *v40;
  id *v41;
  id *v42;
  id *v43;
  id *v44;
  unsigned int deviceType;
  id *v46;
  int v47;
  id *v48;
  id *v49;
  id *v50;
  int v51;
  id *v52;
  const __CFString *v53;
  unsigned int audioStreamState;
  id *v55;
  const char *v56;
  int v57;
  const char *v58;
  id *v59;
  const char *bleChannel;
  id *v61;
  const char *autoAncCapability;
  id *v63;
  int v64;
  unsigned int batteryInfoMain;
  unsigned int batteryInfoLeft;
  unsigned int batteryInfoRight;
  unsigned int batteryInfoCase;
  id *v69;
  id *v70;
  int v71;
  const char *v72;
  const char *v73;
  id *v74;
  int v75;
  const char *v76;
  const char *v77;
  id *v78;
  int v79;
  const char *v80;
  const char *v81;
  id *v82;
  int v83;
  const char *v84;
  const char *v85;
  unsigned int v86;
  unsigned int v87;
  id *v88;
  id *v89;
  const __CFString *v90;
  id *v91;
  const __CFString *v92;
  const __CFString *endCallCapability;
  int v94;
  id *v95;
  unsigned int v96;
  id *v97;
  uint64_t muteControlCapability;
  id *v99;
  unsigned int v100;
  id *v101;
  NSString *v102;
  NSString *v103;
  id *v104;
  id *v105;
  CBControllerInfo *v106;
  CBControllerInfo *v107;
  id *v108;
  CBControllerInfo *conversationDetectCapability;
  id *v110;
  unsigned int v111;
  id *v112;
  int v113;
  __CFString *v114;
  id *v115;
  uint64_t doubleTapActionLeft;
  char doubleTapActionRight;
  char doubleTapCapability;
  id *v119;
  id *v120;
  const char *v121;
  id *v122;
  const char *v123;
  id *v124;
  const char *v125;
  id *v126;
  NSString *v127;
  NSString *v128;
  id *v129;
  unsigned int v130;
  id *v131;
  const char *v132;
  id *v133;
  void *v134;
  void *v135;
  id *v136;
  uint64_t microphoneMode;
  id *v138;
  const char *v139;
  unsigned int secondaryPlacement;
  unsigned int primaryPlacement;
  char placementMode;
  id *v143;
  id *v144;
  const char *v145;
  id *v146;
  const char *v147;
  id *v148;
  const char *v149;
  unsigned int v150;
  id *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  id *v155;
  uint64_t v156;
  void *v157;
  id *v158;
  unsigned int v159;
  double v160;
  void **v161;
  void *v162;
  id v163;
  void *v164;
  uint64_t v165;
  void *v166;
  id *v167;
  NSString *v168;
  NSString *v169;
  id *v170;
  NSString *v171;
  NSString *v172;
  id *v173;
  NSString *v174;
  NSString *v175;
  id *v176;
  uint64_t smartRoutingMode;
  id *v178;
  const char *v179;
  int v180;
  id *v181;
  const char *v182;
  _BYTE *v183;
  id *v184;
  unint64_t bleAdvertisementTimestampMachContinuous;
  id *v186;
  NSData *v187;
  id *v188;
  void *v189;
  id *v190;
  void *v191;
  id *v192;
  void *v193;
  id *v194;
  unint64_t discoveryFlags;
  id *v196;
  id *v197;
  id *v198;
  id *v199;
  void *v200;
  id *v201;
  uint64_t airdropModel;
  id *v203;
  uint64_t airdropVersion;
  id *v205;
  uint64_t airdropHash1;
  id *v207;
  uint64_t airdropHash2;
  id *v209;
  uint64_t airdropHash3;
  id *v211;
  uint64_t airdropHash4;
  id *v213;
  id *v214;
  NSData *v215;
  id *v216;
  id *v217;
  void *v218;
  id *v219;
  id *v220;
  id *v221;
  void *v222;
  id *v223;
  id *v224;
  void *v225;
  id *v226;
  id *v227;
  id *v228;
  id *v229;
  id *v230;
  id *v231;
  unsigned int v232;
  const char *v233;
  void *v234;
  id *v235;
  void *v236;
  id *v237;
  id *v238;
  id *v239;
  unsigned int v240;
  const char *v241;
  id *v242;
  id *v243;
  unsigned int v244;
  const char *v245;
  id *v246;
  id *v247;
  id *v248;
  id *v249;
  id *v250;
  id *v251;
  id *v252;
  void *v253;
  id *v254;
  id *v255;
  id *v256;
  id *v257;
  id *v258;
  id *v259;
  id *v260;
  void *v261;
  id *v262;
  unint64_t v263;
  id *v264;
  void *v265;
  id *v266;
  id *v267;
  unsigned int v268;
  const char *v269;
  unsigned int v270;
  id *v271;
  id *v272;
  unsigned int nearbyActionType;
  id *v274;
  const char *v275;
  NSData *v276;
  id *v277;
  NSData *v278;
  id *v279;
  unsigned int v280;
  id *v281;
  const char *v282;
  id *v283;
  unsigned int v284;
  id *v285;
  const char *v286;
  void *v287;
  id *v288;
  NSData *v289;
  id *v290;
  id *v291;
  double v292;
  id *v293;
  unsigned int v294;
  id *v295;
  const char *v296;
  unsigned int v297;
  id *v298;
  const char *v299;
  id *v300;
  id *v301;
  NSData *v302;
  id *v303;
  NSData *v304;
  id *v305;
  __CFString *nearbyInfoV2InvitationCounter;
  id *v307;
  id *v308;
  unsigned int nearbyInfoV2InvitationRouteType;
  id *v310;
  const char *v311;
  const char *v312;
  id *v313;
  id *v314;
  NSData *v315;
  id *v316;
  NSData *v317;
  id *v318;
  id *v319;
  id *v320;
  id *v321;
  id *v322;
  id *v323;
  NSData *v324;
  id *v325;
  __CFString *proximityServiceCategory;
  id *v327;
  NSData *v328;
  id *v329;
  id *v330;
  __CFString *proximityServiceMeasuredPower;
  id *v332;
  __CFString *proximityServiceProductID;
  const char *v334;
  id *v335;
  __CFString *proximityServicePSM;
  id *v337;
  NSData *v338;
  id *v339;
  unsigned int proximityServiceSubType;
  id *v341;
  const char *v342;
  __CFString *proximityServiceVendorID;
  id *v344;
  const char *v345;
  __CFString *proximityServiceVersion;
  id *v347;
  __CFString *proximityPairingProductID;
  const char *v349;
  id *v350;
  __CFString *proximityPairingSubType;
  id *v352;
  const char *v353;
  unsigned int v354;
  id *v355;
  const char *v356;
  unsigned int v357;
  id *v358;
  const char *v359;
  __CFString *v360;
  id *v361;
  unsigned int v362;
  id *v363;
  const __CFString *v364;
  NSData *v365;
  id *v366;
  NSData *v367;
  id *v368;
  NSData *v369;
  id *v370;
  const char *v371;
  id *v372;
  NSData *v373;
  id *v374;
  void *safetyAlertsSegmentSegmentNumber;
  id *v376;
  void *safetyAlertsSegmentSegmentsTotal;
  id *v378;
  NSData *v379;
  id *v380;
  NSData *v381;
  id *v382;
  NSArray *v383;
  id *v384;
  id *v385;
  NSData *v386;
  id *v387;
  NSDictionary *v388;
  id *v389;
  NSData *v390;
  NSData *v391;
  id *v392;
  void *spatialInteractionUWBTokenFlags;
  id *v394;
  NSArray *v395;
  id *v396;
  unsigned int tipiConnectionStatus;
  id *v398;
  const char *v399;
  id *v400;
  void *v401;
  id *v402;
  id *v403;
  id *v404;
  id *v405;
  id *v406;
  id *v407;
  NSMutableDictionary *v408;
  id *v409;
  NSMutableDictionary *spatialInteractionDeviceTimestampArrayDictionary;
  id *v411;
  id v412;
  void *identifier;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  const __CFString *v419;
  uint64_t v420;
  CBControllerInfo *v421;
  uint64_t v422;
  __CFString *v423;
  void *v424;
  void *v425;
  uint64_t v426;
  const char *v427;
  double v428;
  uint64_t v429;
  void *v430;
  void *v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  void *v435;
  uint64_t v436;
  void *v437;
  uint64_t v438;
  uint64_t v439;
  unint64_t homeKitV1SetupHash;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  void *v447;
  const char *v448;
  void *v449;
  double v450;
  const char *v451;
  __CFString *objectDiscoveryPublicKeyData;
  const char *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  const char *v461;
  id v462;
  _QWORD v463[5];
  int v464;
  id v465;
  id v466;
  id v467;
  id v468;
  id v469;
  id v470;
  id v471;
  id v472;
  id v473;
  id v474;
  id v475;
  id v476;
  id v477;
  id v478;
  id v479;
  id v480;
  id v481;
  id v482;
  id v483;
  id v484;
  id v485;
  id v486;
  id v487;
  id v488;
  id v489;
  id v490;
  id v491;
  id v492;
  id v493;
  id v494;
  id v495;
  id v496;
  id v497;
  id v498;
  id v499;
  id v500;
  id v501;
  id v502;
  id v503;
  id v504;
  id v505;
  id v506;
  id v507;
  id v508;
  id v509;
  id v510;
  id v511;
  id v512;
  id v513;
  id v514;
  id v515;
  id v516;
  id v517;
  id v518;
  id v519;
  id v520;
  id v521;
  id v522;
  id v523;
  id v524;
  id v525;
  id v526;
  id v527;
  id v528;
  id v529;
  id v530;
  id v531;
  id v532;
  id v533;
  id v534;
  id v535;
  id v536;
  id v537;
  id v538;
  id v539;
  id v540;
  id v541;
  id v542;
  id v543;
  id v544;
  id v545;
  id v546;
  id v547;
  id v548;
  id v549;
  id v550;
  id v551;
  id v552;
  id v553;
  id v554;
  id v555;
  id v556;
  id v557;
  id v558;
  id v559;
  id v560;
  id v561;
  id v562;
  id v563;
  id v564;
  id v565;
  id v566;
  id v567;
  id v568;
  id v569;
  id v570;
  id v571;
  id v572;
  id v573;
  id v574;
  id v575;
  id v576;
  id v577;
  id v578;
  id v579;
  id v580;
  id v581;
  id v582;
  id v583;
  id v584;
  id v585;
  id v586;
  id v587;
  id v588;
  id v589;
  id v590;
  id v591;
  id v592;
  id v593;
  id v594;
  id v595;
  id v596;
  id v597;
  id v598;
  id v599;
  id v600;
  id v601;
  id v602;
  id v603;
  id v604;
  id v605;
  id v606;
  id v607;
  id v608;
  id v609;
  id v610;
  id v611;
  id v612;
  id v613;
  id v614;
  id v615;
  id v616;
  id v617;
  id v618;
  id v619;
  id v620;
  id v621;
  id v622;
  id v623;
  id v624;
  id v625;
  id v626;
  id v627;
  id v628;
  id v629;
  id v630;
  id v631;
  id v632;
  id v633;
  id v634;
  id v635;
  id v636;
  id v637;
  id v638;
  id v639;
  id v640;
  id v641;
  id v642;
  id v643;
  id v644;
  id v645;
  id v646;
  id v647;
  id obj;
  id v649;
  id v650;
  id v651;
  id v652;
  id v653;
  id v654;
  id v655;
  id v656;
  id v657;
  id v658;
  id v659;
  id v660;
  uint64_t v661;
  uint64_t v662;
  id *v663;
  uint64_t v664;
  uint64_t (*v665)(uint64_t, uint64_t);
  void (*v666)(uint64_t);
  id v667;

  v662 = 0;
  v663 = (id *)&v662;
  v664 = 0x3032000000;
  v665 = __Block_byref_object_copy__5;
  v666 = __Block_byref_object_dispose__5;
  v667 = 0;
  v661 = 0;
  identifier = self->_identifier;
  NSAppendPrintF_safe();
  objc_storeStrong(&v667, 0);
  v5 = self->_btAddressData;
  if (v5)
  {
    v6 = v663;
    v660 = v663[5];
    CUPrintNSDataAddress();
    identifier = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v6 + 5, v660);

  }
  v7 = self->_txAddressData;
  if (v7)
  {
    v8 = v663;
    v659 = v663[5];
    CUPrintNSDataAddress();
    identifier = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v8 + 5, v659);

  }
  v9 = self->_name;
  v10 = v9;
  if (v9)
  {
    v11 = v663;
    v658 = v663[5];
    identifier = v9;
    NSAppendPrintF_safe();
    objc_storeStrong(v11 + 5, v658);
  }

  v12 = self->_model;
  v13 = v12;
  if (v12)
  {
    v14 = v663;
    v657 = v663[5];
    identifier = v12;
    NSAppendPrintF_safe();
    objc_storeStrong(v14 + 5, v657);
  }

  productID = self->_productID;
  if ((_DWORD)productID)
  {
    v16 = CBProductIDToString_0(self->_productID);
    v17 = v663;
    v656 = v663[5];
    identifier = (void *)productID;
    v459 = v16;
    NSAppendPrintF_safe();
    objc_storeStrong(v17 + 5, v656);
    CBProductIDToNSLocalizedProductNameString(productID);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v20 = v663;
      v655 = v663[5];
      identifier = (void *)v18;
      NSAppendPrintF_safe();
      objc_storeStrong(v20 + 5, v655);
    }

  }
  v21 = a3;
  if (a3 <= 0x3Bu)
  {
    vendorID = (void *)self->_vendorID;
    if (self->_vendorID)
    {
      v23 = v663;
      v654 = v663[5];
      identifier = vendorID;
      NSAppendPrintF_safe();
      objc_storeStrong(v23 + 5, v654);
    }
    vendorIDSource = (void *)self->_vendorIDSource;
    if (self->_vendorIDSource)
    {
      v25 = v663;
      v653 = v663[5];
      identifier = vendorIDSource;
      NSAppendPrintF_safe();
      objc_storeStrong(v25 + 5, v653);
    }
    v26 = self->_idsDeviceID;
    v27 = v26;
    if (v26)
    {
      v28 = v663;
      v652 = v663[5];
      identifier = v26;
      NSAppendPrintF_safe();
      objc_storeStrong(v28 + 5, v652);
    }

    v29 = self->_accountID;
    v30 = v29;
    if (v29)
    {
      v31 = v663;
      v651 = v663[5];
      identifier = v29;
      NSAppendPrintF_safe();
      objc_storeStrong(v31 + 5, v651);
    }

    adaptiveVolumeCapability = (void *)self->_adaptiveVolumeCapability;
    if (self->_adaptiveVolumeCapability)
    {
      v33 = v663;
      v650 = v663[5];
      identifier = adaptiveVolumeCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v33 + 5, v650);
    }
    v34 = -[CBDevice adaptiveVolumeConfig](self, "adaptiveVolumeConfig", identifier, v459);
    if (v34)
    {
      v35 = v663;
      v649 = v663[5];
      v415 = v34;
      NSAppendPrintF_safe();
      objc_storeStrong(v35 + 5, v649);
    }
    v36 = self->_contactID;
    v37 = v36;
    if (v36)
    {
      v38 = v663;
      obj = v663[5];
      v415 = (uint64_t)v36;
      NSAppendPrintF_safe();
      objc_storeStrong(v38 + 5, obj);
    }

    -[CBDevice stableIdentifier](self, "stableIdentifier");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v39)
    {
      v41 = v663;
      v647 = v663[5];
      v415 = v39;
      NSAppendPrintF_safe();
      objc_storeStrong(v41 + 5, v647);
    }

    if (self->_discoveryFlags)
    {
      v42 = v663;
      v646 = v663[5];
      CUPrintFlags64();
      v415 = objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v42 + 5, v646);

    }
    v43 = v663;
    v645 = v663[5];
    CBDiscoveryTypesAppendString((uint64_t)&v645, (uint64_t)", DsTy", (uint64_t)&self->_discoveryTypesInternal);
    objc_storeStrong(v43 + 5, v645);
    if (self->_deviceFlags)
    {
      v44 = v663;
      v644 = v663[5];
      CUPrintFlags64();
      v415 = objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v44 + 5, v644);

    }
    deviceType = self->_deviceType;
    if (self->_deviceType)
    {
      v46 = v663;
      v643 = v663[5];
      v415 = (uint64_t)CBDeviceTypeToString(deviceType);
      NSAppendPrintF_safe();
      objc_storeStrong(v46 + 5, v643);
    }
    v47 = -[CBDevice rssi](self, "rssi", v415);
    if (v47)
    {
      v48 = v663;
      v642 = v663[5];
      v416 = v47;
      NSAppendPrintF_safe();
      objc_storeStrong(v48 + 5, v642);
    }
    if (self->_connectedServices)
    {
      v49 = v663;
      v641 = v663[5];
      CUPrintFlags32();
      v416 = objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v49 + 5, v641);

    }
    if (self->_supportedServices)
    {
      v50 = v663;
      v640 = v663[5];
      CUPrintFlags32();
      v416 = objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v50 + 5, v640);

    }
    v51 = -[CBDevice appearanceValue](self, "appearanceValue", v416);
    if (v51)
    {
      v52 = v663 + 5;
      v639 = v663[5];
      if (v51 <= 2368)
      {
        switch(v51)
        {
          case 2112:
            v53 = CFSTR("Generic Audio Sink");
            break;
          case 2113:
            v53 = CFSTR("Standalone Speaker");
            break;
          case 2114:
            v53 = CFSTR("Soundbar");
            break;
          case 2115:
            v53 = CFSTR("Bookshelf Speaker");
            break;
          case 2116:
            v53 = CFSTR("Standmounted Speaker");
            break;
          case 2117:
            v53 = CFSTR("Speakerphone");
            break;
          default:
            v53 = CFSTR("Keyboard");
            switch(v51)
            {
              case 961:
                goto LABEL_65;
              case 962:
                v53 = CFSTR("Mouse");
                break;
              case 963:
                v53 = CFSTR("Joystick");
                break;
              case 964:
                v53 = CFSTR("Gamepad");
                break;
              case 969:
                v53 = CFSTR("Touchpad");
                break;
              default:
                goto LABEL_56;
            }
            break;
        }
      }
      else if (v51 > 2370)
      {
        if (v51 == 2371)
        {
          v53 = CFSTR("Headphones");
        }
        else if (v51 == 2625)
        {
          v53 = CFSTR("Hearing Aid");
        }
        else
        {
LABEL_56:
          v53 = CFSTR("?");
        }
      }
      else if (v51 == 2369)
      {
        v53 = CFSTR("Earbud");
      }
      else
      {
        v53 = CFSTR("Headset");
      }
LABEL_65:
      v417 = (void *)v53;
      NSAppendPrintF_safe();
      objc_storeStrong(v52, v639);
    }
    audioStreamState = self->_audioStreamState;
    if (audioStreamState)
    {
      v55 = v663 + 5;
      v638 = v663[5];
      if (audioStreamState > 3)
        v56 = "?";
      else
        v56 = off_1E54030A0[audioStreamState - 1];
      v417 = (void *)v56;
      NSAppendPrintF_safe();
      objc_storeStrong(v55, v638);
    }
    v57 = -[CBDevice frequencyBand](self, "frequencyBand", v417);
    if (v57)
    {
      v58 = "2.4";
      if (v57 != 1)
        v58 = "?";
      if (v57 == 2)
        v58 = "5";
      v59 = v663;
      v637 = v663[5];
      v418 = v58;
      NSAppendPrintF_safe();
      objc_storeStrong(v59 + 5, v637);
    }
    bleChannel = (const char *)self->_bleChannel;
    if ((_DWORD)bleChannel)
    {
      v61 = v663;
      v636 = v663[5];
      v418 = bleChannel;
      NSAppendPrintF_safe();
      objc_storeStrong(v61 + 5, v636);
    }
    autoAncCapability = (const char *)self->_autoAncCapability;
    if (self->_autoAncCapability)
    {
      v63 = v663;
      v635 = v663[5];
      v418 = autoAncCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v63 + 5, v635);
    }
    v64 = a3;
    batteryInfoMain = self->_batteryInfoMain;
    batteryInfoLeft = self->_batteryInfoLeft;
    batteryInfoRight = self->_batteryInfoRight;
    batteryInfoCase = self->_batteryInfoCase;
    if (self->_batteryInfoMain || self->_batteryInfoLeft || self->_batteryInfoRight || self->_batteryInfoCase)
    {
      v69 = v663;
      v634 = v663[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v69 + 5, v634);
      if (batteryInfoMain)
      {
        v70 = v663 + 5;
        v633 = v663[5];
        v71 = (batteryInfoMain >> 8) & 7;
        v72 = "";
        if (v71 == 2)
          v72 = "-";
        if (v71 == 1)
          v73 = "+";
        else
          v73 = v72;
        v418 = v73;
        v460 = (float)((float)((float)(batteryInfoMain & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v70, v633);
      }
      if (batteryInfoLeft)
      {
        v74 = v663 + 5;
        v632 = v663[5];
        v75 = (batteryInfoLeft >> 8) & 7;
        v76 = "";
        if (v75 == 2)
          v76 = "-";
        if (v75 == 1)
          v77 = "+";
        else
          v77 = v76;
        v418 = v77;
        v460 = (float)((float)((float)(batteryInfoLeft & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v74, v632);
      }
      if (batteryInfoRight)
      {
        v78 = v663 + 5;
        v631 = v663[5];
        v79 = (batteryInfoRight >> 8) & 7;
        v80 = "";
        if (v79 == 2)
          v80 = "-";
        if (v79 == 1)
          v81 = "+";
        else
          v81 = v80;
        v418 = v81;
        v460 = (float)((float)((float)(batteryInfoRight & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v78, v631);
      }
      if (batteryInfoCase)
      {
        v82 = v663 + 5;
        v630 = v663[5];
        v83 = (batteryInfoCase >> 8) & 7;
        v84 = "";
        if (v83 == 2)
          v84 = "-";
        if (v83 == 1)
          v85 = "+";
        else
          v85 = v84;
        v418 = v85;
        v460 = (float)((float)((float)(batteryInfoCase & 0x7F) / 100.0) * 100.0);
        NSAppendPrintF_safe();
        objc_storeStrong(v82, v630);
      }
    }
    v86 = -[CBDevice clickHoldModeLeft](self, "clickHoldModeLeft", v418, v460);
    v87 = -[CBDevice clickHoldModeRight](self, "clickHoldModeRight");
    if (v86 | v87)
    {
      v88 = v663;
      v629 = v663[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v88 + 5, v629);
      if (v86)
      {
        v89 = v663 + 5;
        v628 = v663[5];
        if (v86 > 7)
          v90 = CFSTR("?");
        else
          v90 = (const __CFString *)*((_QWORD *)&off_1E54030B8 + (char)(v86 - 1));
        v419 = v90;
        NSAppendPrintF_safe();
        objc_storeStrong(v89, v628);
      }
      if (v87)
      {
        v91 = v663 + 5;
        v627 = v663[5];
        if (v87 > 7)
          v92 = CFSTR("?");
        else
          v92 = (const __CFString *)*((_QWORD *)&off_1E54030B8 + (char)(v87 - 1));
        v419 = v92;
        NSAppendPrintF_safe();
        objc_storeStrong(v91, v627);
      }
    }
    endCallCapability = (const __CFString *)self->_endCallCapability;
    v94 = v64;
    if (self->_endCallCapability)
    {
      v95 = v663;
      v626 = v663[5];
      v419 = endCallCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v95 + 5, v626);
    }
    v96 = -[CBDevice endCallConfig](self, "endCallConfig", v419);
    if (v96)
    {
      v97 = v663;
      v625 = v663[5];
      v420 = v96;
      NSAppendPrintF_safe();
      objc_storeStrong(v97 + 5, v625);
    }
    muteControlCapability = self->_muteControlCapability;
    if (self->_muteControlCapability)
    {
      v99 = v663;
      v624 = v663[5];
      v420 = muteControlCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v99 + 5, v624);
    }
    v100 = -[CBDevice muteControlConfig](self, "muteControlConfig", v420);
    if (v100)
    {
      v101 = v663;
      v623 = v663[5];
      v421 = (CBControllerInfo *)v100;
      NSAppendPrintF_safe();
      objc_storeStrong(v101 + 5, v623);
    }
    v102 = self->_caseVersion;
    v103 = v102;
    if (v102)
    {
      v104 = v663;
      v622 = v663[5];
      v421 = (CBControllerInfo *)v102;
      NSAppendPrintF_safe();
      objc_storeStrong(v104 + 5, v622);
    }

    if ((self->_colorInfo & 0x100) != 0)
    {
      v105 = v663;
      v621 = v663[5];
      v421 = (CBControllerInfo *)-[CBDevice colorCodeBest](self, "colorCodeBest");
      NSAppendPrintF_safe();
      objc_storeStrong(v105 + 5, v621);
    }
    v106 = self->_controllerInfo;
    v107 = v106;
    if (v106)
    {
      v108 = v663;
      v620 = v663[5];
      v421 = v106;
      NSAppendPrintF_safe();
      objc_storeStrong(v108 + 5, v620);
    }

    conversationDetectCapability = (CBControllerInfo *)self->_conversationDetectCapability;
    if (self->_conversationDetectCapability)
    {
      v110 = v663;
      v619 = v663[5];
      v421 = conversationDetectCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v110 + 5, v619);
    }
    v111 = -[CBDevice conversationDetectConfig](self, "conversationDetectConfig", v421);
    if (v111)
    {
      v112 = v663;
      v618 = v663[5];
      v422 = v111;
      NSAppendPrintF_safe();
      objc_storeStrong(v112 + 5, v618);
    }
    v113 = -[CBDevice crownRotationDirection](self, "crownRotationDirection", v422);
    if (v113)
    {
      v114 = CFSTR("?");
      if (v113 == 1)
        v114 = CFSTR("BackToFront");
      if (v113 == 2)
        v114 = CFSTR("FrontToBack");
      v115 = v663;
      v617 = v663[5];
      v423 = v114;
      NSAppendPrintF_safe();
      objc_storeStrong(v115 + 5, v617);

    }
    doubleTapActionLeft = self->_doubleTapActionLeft;
    doubleTapActionRight = self->_doubleTapActionRight;
    doubleTapCapability = self->_doubleTapCapability;
    if (self->_doubleTapActionLeft || self->_doubleTapActionRight || self->_doubleTapCapability)
    {
      v119 = v663;
      v616 = v663[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v119 + 5, v616);
      if ((_DWORD)doubleTapActionLeft)
      {
        v120 = v663 + 5;
        v615 = v663[5];
        if (doubleTapActionLeft > 5)
          v121 = "?";
        else
          v121 = off_1E54030F0[doubleTapActionLeft];
        v423 = (__CFString *)v121;
        NSAppendPrintF_safe();
        objc_storeStrong(v120, v615);
      }
      if (doubleTapActionRight)
      {
        v122 = v663 + 5;
        v614 = v663[5];
        if (doubleTapActionRight > 5)
          v123 = "?";
        else
          v123 = off_1E54030F0[doubleTapActionRight];
        v423 = (__CFString *)v123;
        NSAppendPrintF_safe();
        objc_storeStrong(v122, v614);
      }
      if (doubleTapCapability)
      {
        v124 = v663 + 5;
        v613 = v663[5];
        if (doubleTapCapability > 3)
          v125 = "?";
        else
          v125 = off_1E5403120[doubleTapCapability];
        v423 = (__CFString *)v125;
        NSAppendPrintF_safe();
        objc_storeStrong(v124, v613);
      }
    }
    if (-[CBDevice gapaFlags](self, "gapaFlags", v423))
    {
      v126 = v663;
      v612 = v663[5];
      CUPrintFlags32();
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v126 + 5, v612);

    }
    v127 = self->_firmwareVersion;
    v128 = v127;
    if (v127)
    {
      v129 = v663;
      v611 = v663[5];
      v424 = v127;
      NSAppendPrintF_safe();
      objc_storeStrong(v129 + 5, v611);
    }

    v130 = -[CBDevice listeningMode](self, "listeningMode");
    if (v130)
    {
      v131 = v663 + 5;
      v610 = v663[5];
      if (v130 > 4)
        v132 = "?";
      else
        v132 = off_1E5403140[v130 - 1];
      v424 = (void *)v132;
      NSAppendPrintF_safe();
      objc_storeStrong(v131, v610);
    }
    if (-[CBDevice listeningModeConfigs](self, "listeningModeConfigs", v424))
    {
      v133 = v663;
      v609 = v663[5];
      CUPrintFlags32();
      v425 = (void *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      objc_storeStrong(v133 + 5, v609);

    }
    -[CBDevice btVersion](self, "btVersion", v425);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v134;
    if (v134)
    {
      v136 = v663;
      v608 = v663[5];
      v426 = objc_msgSend(objc_retainAutorelease(v134), "cStringUsingEncoding:", 4);
      NSAppendPrintF_safe();
      objc_storeStrong(v136 + 5, v608);
    }

    microphoneMode = self->_microphoneMode;
    if (self->_microphoneMode)
    {
      v138 = v663 + 5;
      v607 = v663[5];
      if (microphoneMode > 3)
        v139 = "?";
      else
        v139 = off_1E5403160[microphoneMode];
      v426 = (uint64_t)v139;
      NSAppendPrintF_safe();
      objc_storeStrong(v138, v607);
    }
    primaryPlacement = self->_primaryPlacement;
    secondaryPlacement = self->_secondaryPlacement;
    placementMode = self->_placementMode;
    if (__PAIR64__(secondaryPlacement, primaryPlacement) || self->_placementMode)
    {
      v143 = v663;
      v606 = v663[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v143 + 5, v606);
      if (primaryPlacement)
      {
        v144 = v663 + 5;
        v605 = v663[5];
        if (primaryPlacement > 7)
          v145 = "?";
        else
          v145 = off_1E5403728[primaryPlacement - 1];
        v426 = (uint64_t)v145;
        NSAppendPrintF_safe();
        objc_storeStrong(v144, v605);
      }
      if (secondaryPlacement)
      {
        v146 = v663 + 5;
        v604 = v663[5];
        if (secondaryPlacement > 7)
          v147 = "?";
        else
          v147 = off_1E5403728[secondaryPlacement - 1];
        v426 = (uint64_t)v147;
        NSAppendPrintF_safe();
        objc_storeStrong(v146, v604);
      }
      if (placementMode)
      {
        v148 = v663 + 5;
        v603 = v663[5];
        if (placementMode > 2)
          v149 = "?";
        else
          v149 = off_1E5403198[placementMode];
        v426 = (uint64_t)v149;
        NSAppendPrintF_safe();
        objc_storeStrong(v148, v603);
      }
    }
    v150 = -[CBDevice primaryBudSide](self, "primaryBudSide", v426);
    if (v150)
    {
      v151 = v663 + 5;
      v602 = v663[5];
      if (v150 > 3)
        v152 = "?";
      else
        v152 = off_1E5403180[(char)(v150 - 1)];
      v427 = v152;
      NSAppendPrintF_safe();
      objc_storeStrong(v151, v602);
    }
    -[CBDevice findMyCaseIdentifier](self, "findMyCaseIdentifier", v427);
    v153 = objc_claimAutoreleasedReturnValue();
    v154 = (void *)v153;
    if (v153)
    {
      v155 = v663;
      v601 = v663[5];
      v428 = *(double *)&v153;
      NSAppendPrintF_safe();
      objc_storeStrong(v155 + 5, v601);
    }

    -[CBDevice findMyGroupIdentifier](self, "findMyGroupIdentifier");
    v156 = objc_claimAutoreleasedReturnValue();
    v157 = (void *)v156;
    if (v156)
    {
      v158 = v663;
      v600 = v663[5];
      v428 = *(double *)&v156;
      NSAppendPrintF_safe();
      objc_storeStrong(v158 + 5, v600);
    }

    v159 = -[CBDevice interval](self, "interval");
    if (v159 && (-[CBDevice discoveryFlags](self, "discoveryFlags") & 0x200000) != 0)
    {
      v160 = (double)v159;
      if ((-[CBDevice deviceFlags](self, "deviceFlags") & 0x4000) != 0)
      {
        v161 = v663 + 5;
        v599 = v663[5];
        v428 = v160 * 0.625;
        NSAppendPrintF_safe();
        v162 = v599;
      }
      else
      {
        if ((-[CBDevice deviceFlags](self, "deviceFlags") & 0x2000) == 0)
          goto LABEL_217;
        v161 = v663 + 5;
        v598 = v663[5];
        v428 = v160 * 1.25;
        NSAppendPrintF_safe();
        v162 = v598;
      }
      v163 = v162;
      v164 = *v161;
      *v161 = v163;

    }
LABEL_217:
    -[CBDevice modelUser](self, "modelUser", *(_QWORD *)&v428);
    v165 = objc_claimAutoreleasedReturnValue();
    v166 = (void *)v165;
    if (v165)
    {
      v167 = v663;
      v597 = v663[5];
      v429 = v165;
      NSAppendPrintF_safe();
      objc_storeStrong(v167 + 5, v597);
    }

    v168 = self->_serialNumber;
    v169 = v168;
    if (v168)
    {
      v170 = v663;
      v596 = v663[5];
      v429 = (uint64_t)v168;
      NSAppendPrintF_safe();
      objc_storeStrong(v170 + 5, v596);
    }

    v171 = self->_serialNumberLeft;
    v172 = v171;
    if (v171)
    {
      v173 = v663;
      v595 = v663[5];
      v429 = (uint64_t)v171;
      NSAppendPrintF_safe();
      objc_storeStrong(v173 + 5, v595);
    }

    v174 = self->_serialNumberRight;
    v175 = v174;
    if (v174)
    {
      v176 = v663;
      v594 = v663[5];
      v429 = (uint64_t)v174;
      NSAppendPrintF_safe();
      objc_storeStrong(v176 + 5, v594);
    }

    smartRoutingMode = self->_smartRoutingMode;
    if (self->_smartRoutingMode)
    {
      v178 = v663 + 5;
      v593 = v663[5];
      if (smartRoutingMode > 2)
        v179 = "?";
      else
        v179 = off_1E5403198[smartRoutingMode];
      v429 = (uint64_t)v179;
      NSAppendPrintF_safe();
      objc_storeStrong(v178, v593);
    }
    v180 = -[CBDevice spatialAudioMode](self, "spatialAudioMode", v429);
    if (!v180)
    {
LABEL_242:
      v183 = CBDiscoveryTypesBuffer();
      if (CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, v183)
        && IsAppleInternalBuild()
        && self->_bleAdvertisementTimestamp != 0.0)
      {
        v184 = v663;
        v591 = v663[5];
        -[CBDevice bleAdvertisementTimestampString](self, "bleAdvertisementTimestampString");
        v430 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v184 + 5, v591);

      }
      bleAdvertisementTimestampMachContinuous = self->_bleAdvertisementTimestampMachContinuous;
      if (bleAdvertisementTimestampMachContinuous)
      {
        v186 = v663;
        v590 = v663[5];
        v430 = (void *)bleAdvertisementTimestampMachContinuous;
        NSAppendPrintF_safe();
        objc_storeStrong(v186 + 5, v590);
      }
      v187 = self->_bleAppleManufacturerData;
      if (v187)
      {
        v188 = v663;
        v589 = v663[5];
        CUPrintNSDataHex();
        v430 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v188 + 5, v589);

      }
      if ((v94 & 0x800000) != 0)
      {
        -[CBDevice linkKeyData](self, "linkKeyData");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        if (v189)
        {
          v190 = v663;
          v588 = v663[5];
          CUPrintNSDataHex();
          v430 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v190 + 5, v588);

        }
        -[CBDevice irkData](self, "irkData");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        if (v191)
        {
          v192 = v663;
          v587 = v663[5];
          CUPrintNSDataHex();
          v430 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v192 + 5, v587);

        }
        -[CBDevice ltkData](self, "ltkData");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        if (v193)
        {
          v194 = v663;
          v586 = v663[5];
          CUPrintNSDataHex();
          v430 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v194 + 5, v586);

        }
      }
      discoveryFlags = self->_discoveryFlags;
      if ((discoveryFlags & 0x80) != 0)
      {
        v196 = v663;
        v585 = v663[5];
        -[CBDevice accessoryStatusFlags](self, "accessoryStatusFlags");
        CUPrintFlags32();
        v431 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v196 + 5, v585);

        v197 = v663;
        v584 = v663[5];
        v432 = -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount", v431);
        NSAppendPrintF_safe();
        objc_storeStrong(v197 + 5, v584);
        v198 = v663;
        v583 = v663[5];
        -[CBDevice accessoryStatusOBCTime](self, "accessoryStatusOBCTime", v432);
        CUPrintDurationDouble();
        v430 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v198 + 5, v583);

      }
      if (self->_airdropFlags)
      {
        v199 = v663;
        v582 = v663[5];
        CUPrintFlags32();
        v430 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v199 + 5, v582);

      }
      -[CBDevice airdropTempAuthTagData](self, "airdropTempAuthTagData", v430);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      if (v200)
      {
        v201 = v663;
        v581 = v663[5];
        CUPrintNSDataHex();
        v433 = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v201 + 5, v581);

      }
      airdropModel = self->_airdropModel;
      if (self->_airdropModel)
      {
        v203 = v663;
        v580 = v663[5];
        v433 = airdropModel;
        NSAppendPrintF_safe();
        objc_storeStrong(v203 + 5, v580);
      }
      airdropVersion = self->_airdropVersion;
      if (self->_airdropVersion)
      {
        v205 = v663;
        v579 = v663[5];
        v433 = airdropVersion;
        NSAppendPrintF_safe();
        objc_storeStrong(v205 + 5, v579);
      }
      airdropHash1 = self->_airdropHash1;
      if (self->_airdropHash1)
      {
        v207 = v663;
        v578 = v663[5];
        v433 = airdropHash1;
        NSAppendPrintF_safe();
        objc_storeStrong(v207 + 5, v578);
      }
      airdropHash2 = self->_airdropHash2;
      if (self->_airdropHash2)
      {
        v209 = v663;
        v577 = v663[5];
        v433 = airdropHash2;
        NSAppendPrintF_safe();
        objc_storeStrong(v209 + 5, v577);
      }
      airdropHash3 = self->_airdropHash3;
      if (self->_airdropHash3)
      {
        v211 = v663;
        v576 = v663[5];
        v433 = airdropHash3;
        NSAppendPrintF_safe();
        objc_storeStrong(v211 + 5, v576);
      }
      airdropHash4 = self->_airdropHash4;
      if (self->_airdropHash4)
      {
        v213 = v663;
        v575 = v663[5];
        v433 = airdropHash4;
        NSAppendPrintF_safe();
        objc_storeStrong(v213 + 5, v575);
      }
      if (self->_airdropConfigData)
      {
        v214 = v663;
        v574 = v663[5];
        CUPrintFlags32();
        v433 = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v214 + 5, v574);

      }
      if ((discoveryFlags & 0x4000000000) != 0)
      {
        v215 = self->_airplaySourceAuthTagData;
        if (v215)
        {
          v216 = v663;
          v573 = v663[5];
          CUPrintNSDataHex();
          v434 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v216 + 5, v573);

        }
        v217 = v663;
        v572 = v663[5];
        CUPrintFlags32();
        v435 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v217 + 5, v572);

        -[CBDevice airplaySourceUWBConfigData](self, "airplaySourceUWBConfigData", v435);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        if (v218)
        {
          v219 = v663;
          v571 = v663[5];
          CUPrintNSDataHex();
          v433 = objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v219 + 5, v571);

        }
      }
      if ((discoveryFlags & 0x8000000000) != 0)
      {
        v220 = v663;
        v570 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v220 + 5, v570);
        v221 = v663;
        v569 = v663[5];
        CUPrintFlags32();
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v221 + 5, v569);

        v223 = v663;
        v568 = v663[5];
        CUPrintAddress();
        v433 = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v223 + 5, v568);

        if ((self->_airplayTargetFlags & 0x10) != 0)
        {
          v224 = v663;
          v567 = v663[5];
          v433 = -[CBDevice airplayTargetPort](self, "airplayTargetPort", v433);
          NSAppendPrintF_safe();
          objc_storeStrong(v224 + 5, v567);
        }
      }
      -[CBDevice dockKitAccessoryPayloadData](self, "dockKitAccessoryPayloadData", v433);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      if (v225)
      {
        v226 = v663;
        v566 = v663[5];
        CUPrintNSDataHex();
        v436 = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v226 + 5, v566);

      }
      if ((discoveryFlags & 0x1000000000000000) != 0)
      {
        v227 = v663;
        v565 = v663[5];
        -[CBDevice dsActionFlags](self, "dsActionFlags");
        CUPrintFlags32();
        v437 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v227 + 5, v565);

        v228 = v663;
        v564 = v663[5];
        v438 = -[CBDevice dsActionMeasuredPower](self, "dsActionMeasuredPower", v437);
        NSAppendPrintF_safe();
        objc_storeStrong(v228 + 5, v564);
        v229 = v663;
        v563 = v663[5];
        v436 = -[CBDevice dsActionTieBreaker](self, "dsActionTieBreaker", v438);
        NSAppendPrintF_safe();
        objc_storeStrong(v229 + 5, v563);
      }
      if ((discoveryFlags & 0x800000000000000) != 0)
      {
        v230 = v663;
        v562 = v663[5];
        v439 = -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence");
        NSAppendPrintF_safe();
        objc_storeStrong(v230 + 5, v562);
        v231 = v663 + 5;
        v561 = v663[5];
        v232 = -[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState", v439);
        if (v232 > 2)
          v233 = "?";
        else
          v233 = off_1E54031B0[(char)v232];
        v436 = (uint64_t)v233;
        NSAppendPrintF_safe();
        objc_storeStrong(v231, v561);
      }
      -[CBDevice gfpPayloadData](self, "gfpPayloadData", v436);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      if (v234)
      {
        v235 = v663;
        v560 = v663[5];
        CUPrintNSDataHex();
        homeKitV1SetupHash = objc_claimAutoreleasedReturnValue();
        v461 = (const char *)-[CBDevice gfpModelID](self, "gfpModelID");
        NSAppendPrintF_safe();
        objc_storeStrong(v235 + 5, v560);

      }
      -[CBDevice fidoPayloadData](self, "fidoPayloadData");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      if (v236)
      {
        v237 = v663;
        v559 = v663[5];
        CUPrintNSDataHex();
        homeKitV1SetupHash = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v237 + 5, v559);

      }
      if ((discoveryFlags & 0x400000000000000) != 0)
      {
        v238 = v663;
        v558 = v663[5];
        v441 = -[CBDevice heySiriConfidence](self, "heySiriConfidence");
        NSAppendPrintF_safe();
        objc_storeStrong(v238 + 5, v558);
        v239 = v663 + 5;
        v557 = v663[5];
        v240 = -[CBDevice heySiriDeviceClass](self, "heySiriDeviceClass", v441);
        if (v240 > 0xA)
          v241 = "?";
        else
          v241 = off_1E54031C8[(__int16)v240];
        v442 = v241;
        NSAppendPrintF_safe();
        objc_storeStrong(v239, v557);
        v242 = v663;
        v556 = v663[5];
        v443 = -[CBDevice heySiriPerceptualHash](self, "heySiriPerceptualHash", v442);
        NSAppendPrintF_safe();
        objc_storeStrong(v242 + 5, v556);
        v243 = v663 + 5;
        v555 = v663[5];
        v244 = -[CBDevice heySiriProductType](self, "heySiriProductType", v443);
        if (v244 > 4)
          v245 = "?";
        else
          v245 = off_1E5403220[(char)v244];
        v444 = v245;
        NSAppendPrintF_safe();
        objc_storeStrong(v243, v555);
        v246 = v663;
        v554 = v663[5];
        v445 = -[CBDevice heySiriRandom](self, "heySiriRandom", v444);
        NSAppendPrintF_safe();
        objc_storeStrong(v246 + 5, v554);
        v247 = v663;
        v553 = v663[5];
        homeKitV1SetupHash = -[CBDevice heySiriSNR](self, "heySiriSNR", v445);
        NSAppendPrintF_safe();
        objc_storeStrong(v247 + 5, v553);
      }
      if ((discoveryFlags & 0x400000) != 0)
      {
        v248 = v663;
        v552 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v248 + 5, v552);
        v249 = v663;
        v551 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v249 + 5, v551);
        v250 = v663;
        v550 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v250 + 5, v550);
        v251 = v663;
        v549 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v251 + 5, v549);
        v252 = v663;
        v548 = v663[5];
        CUPrintFlags32();
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v252 + 5, v548);

        v254 = v663;
        v547 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v254 + 5, v547);
        v255 = v663;
        v546 = v663[5];
        homeKitV1SetupHash = self->_homeKitV1SetupHash;
        NSAppendPrintF_safe();
        objc_storeStrong(v255 + 5, v546);
      }
      if ((discoveryFlags & 0x1000000) != 0)
      {
        v256 = v663;
        v545 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v256 + 5, v545);
        v257 = v663;
        v544 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v257 + 5, v544);
        v258 = v663;
        v543 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v258 + 5, v543);
        v259 = v663;
        v542 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v259 + 5, v542);
        v260 = v663;
        v541 = v663[5];
        homeKitV1SetupHash = self->_homeKitV2Value;
        NSAppendPrintF_safe();
        objc_storeStrong(v260 + 5, v541);
      }
      if ((discoveryFlags & 0x80000000000000) != 0)
      {
        -[CBDevice mspAddressData](self, "mspAddressData");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        if (v261)
        {
          v262 = v663;
          v540 = v663[5];
          CUPrintNSDataAddress();
          homeKitV1SetupHash = objc_claimAutoreleasedReturnValue();
          NSAppendPrintF_safe();
          objc_storeStrong(v262 + 5, v540);

        }
        v263 = -[CBDevice mspDeviceClass](self, "mspDeviceClass");
        if ((_DWORD)v263)
        {
          v264 = v663;
          v539 = v663[5];
          homeKitV1SetupHash = v263;
          NSAppendPrintF_safe();
          objc_storeStrong(v264 + 5, v539);
        }
        -[CBDevice mspDisplayName](self, "mspDisplayName", homeKitV1SetupHash, v461);
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        if (v265)
        {
          v266 = v663;
          v538 = v663[5];
          NSAppendPrintF_safe();
          objc_storeStrong(v266 + 5, v538);
        }

        v267 = v663 + 5;
        v537 = v663[5];
        v268 = -[CBDevice mspSubScenario](self, "mspSubScenario");
        if (v268 > 2)
          v269 = "?";
        else
          v269 = off_1E5403248[(char)v268];
        homeKitV1SetupHash = (unint64_t)v269;
        NSAppendPrintF_safe();
        objc_storeStrong(v267, v537);
      }
      v270 = -[CBDevice nearbyActionColorCode](self, "nearbyActionColorCode", homeKitV1SetupHash);
      if (v270)
      {
        v271 = v663;
        v536 = v663[5];
        v446 = v270;
        NSAppendPrintF_safe();
        objc_storeStrong(v271 + 5, v536);
      }
      if (self->_nearbyActionFlags)
      {
        v272 = v663;
        v535 = v663[5];
        CUPrintFlags32();
        v446 = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v272 + 5, v535);

      }
      nearbyActionType = self->_nearbyActionType;
      if (self->_nearbyActionType)
      {
        v274 = v663 + 5;
        v534 = v663[5];
        if (nearbyActionType > 0x55)
          v275 = "?";
        else
          v275 = off_1E54032A8[(char)(nearbyActionType - 1)];
        v446 = (uint64_t)v275;
        NSAppendPrintF_safe();
        objc_storeStrong(v274, v534);
      }
      v276 = self->_nearbyActionAuthTag;
      if (v276)
      {
        v277 = v663;
        v533 = v663[5];
        CUPrintNSDataHex();
        v446 = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v277 + 5, v533);

      }
      v278 = self->_nearbyActionTargetAuthTag;
      if (v278)
      {
        v279 = v663;
        v532 = v663[5];
        CUPrintNSDataHex();
        v446 = objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v279 + 5, v532);

      }
      v280 = -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass");
      if (v280)
      {
        v281 = v663 + 5;
        v531 = v663[5];
        if (v280 > 9)
          v282 = "?";
        else
          v282 = off_1E5403260[(char)(v280 - 1)];
        v446 = (uint64_t)v282;
        NSAppendPrintF_safe();
        objc_storeStrong(v281, v531);
      }
      if (-[CBDevice nearbyActionV2Flags](self, "nearbyActionV2Flags", v446))
      {
        v283 = v663;
        v530 = v663[5];
        CUPrintFlags32();
        v447 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v283 + 5, v530);

      }
      v284 = -[CBDevice nearbyActionV2Type](self, "nearbyActionV2Type", v447);
      if (v284)
      {
        v285 = v663 + 5;
        v529 = v663[5];
        if (v284 >= 0x56)
          v286 = "?";
        else
          v286 = off_1E54032A8[(char)(v284 - 1)];
        v448 = v286;
        NSAppendPrintF_safe();
        objc_storeStrong(v285, v529);
      }
      -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData", v448);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      if (v287)
      {
        v288 = v663;
        v528 = v663[5];
        CUPrintNSDataHex();
        v449 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v288 + 5, v528);

      }
      v289 = self->_nearbyInfoAuthTag;
      if (v289)
      {
        v290 = v663;
        v527 = v663[5];
        CUPrintNSDataHex();
        v449 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v290 + 5, v527);

      }
      if (self->_nearbyInfoFlags)
      {
        v291 = v663;
        v526 = v663[5];
        CUPrintFlags32();
        v449 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v291 + 5, v526);

      }
      -[CBDevice nearbyInfoStatusProgress](self, "nearbyInfoStatusProgress", v449);
      if (v292 != 0.0)
      {
        v293 = v663;
        v525 = v663[5];
        v450 = v292 * 100.0;
        NSAppendPrintF_safe();
        objc_storeStrong(v293 + 5, v525);
      }
      v294 = -[CBDevice nearbyInfoStatusTime](self, "nearbyInfoStatusTime", *(_QWORD *)&v450);
      if (v294)
      {
        v295 = v663 + 5;
        v524 = v663[5];
        if (v294 > 0xE)
          v296 = "?";
        else
          v296 = off_1E5403550[(char)(v294 - 1)];
        v451 = v296;
        NSAppendPrintF_safe();
        objc_storeStrong(v295, v524);
      }
      v297 = -[CBDevice nearbyInfoStatusType](self, "nearbyInfoStatusType", v451);
      if (v297)
      {
        v298 = v663 + 5;
        v523 = v663[5];
        if (v297 > 0xD)
          v299 = "?";
        else
          v299 = off_1E54035C0[(char)(v297 - 1)];
        objectDiscoveryPublicKeyData = (__CFString *)v299;
        NSAppendPrintF_safe();
        objc_storeStrong(v298, v523);
      }
      if (self->_nearbyInfoV2Flags)
      {
        v300 = v663;
        v522 = v663[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v300 + 5, v522);

      }
      if (self->_nearbyInfoV2DecryptedFlags)
      {
        v301 = v663;
        v521 = v663[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v301 + 5, v521);

      }
      v302 = self->_nearbyInfoV2AuthTagData;
      if (v302)
      {
        v303 = v663;
        v520 = v663[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v303 + 5, v520);

      }
      v304 = self->_nearbyInfoV2AuthIntegrityTagData;
      if (v304)
      {
        v305 = v663;
        v519 = v663[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v305 + 5, v519);

      }
      nearbyInfoV2InvitationCounter = (__CFString *)self->_nearbyInfoV2InvitationCounter;
      if (self->_nearbyInfoV2InvitationCounter)
      {
        v307 = v663;
        v518 = v663[5];
        objectDiscoveryPublicKeyData = nearbyInfoV2InvitationCounter;
        NSAppendPrintF_safe();
        objc_storeStrong(v307 + 5, v518);
      }
      if (self->_nearbyInfoV2InvitationTypes)
      {
        v308 = v663;
        v517 = v663[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v308 + 5, v517);

      }
      nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
      if (self->_nearbyInfoV2InvitationRouteType)
      {
        v310 = v663 + 5;
        v516 = v663[5];
        if (nearbyInfoV2InvitationRouteType > 0xB)
          v311 = "?";
        else
          v311 = off_1E5403628[(char)(nearbyInfoV2InvitationRouteType - 1)];
        objectDiscoveryPublicKeyData = (__CFString *)v311;
        NSAppendPrintF_safe();
        objc_storeStrong(v310, v516);
      }
      if (self->_nearbyActionNoWakeType)
      {
        if (self->_nearbyActionNoWakeType == 1)
          v312 = "PrecisionFinding";
        else
          v312 = "?";
        v313 = v663;
        v515 = v663[5];
        objectDiscoveryPublicKeyData = (__CFString *)v312;
        NSAppendPrintF_safe();
        objc_storeStrong(v313 + 5, v515);
      }
      if (self->_nearbyActionNWPrecisionFindingStatus)
      {
        v314 = v663;
        v514 = v663[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v314 + 5, v514);

      }
      v315 = self->_nearbyActionNoWakeAuthTagData;
      if (v315)
      {
        v316 = v663;
        v513 = v663[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v316 + 5, v513);

      }
      v317 = self->_nearbyActionNoWakeConfigData;
      if (v317)
      {
        v318 = v663;
        v512 = v663[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v318 + 5, v512);

      }
      if ((discoveryFlags & 0x60000000000) != 0)
      {
        v319 = v663 + 5;
        v511 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v319, v511);
        v320 = v663 + 5;
        v510 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v320, v510);
        v321 = v663;
        v509 = v663[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v321 + 5, v509);
        v322 = v663;
        v508 = v663[5];
        CBProductIDToString_0(self->_objectDiscoveryProductID);
        NSAppendPrintF_safe();
        objc_storeStrong(v322 + 5, v508);
        v323 = v663;
        v507 = v663[5];
        objectDiscoveryPublicKeyData = (__CFString *)self->_objectDiscoveryPublicKeyData;
        NSAppendPrintF_safe();
        objc_storeStrong(v323 + 5, v507);
      }
      v324 = self->_proximityServiceData;
      if (v324)
      {
        v325 = v663;
        v506 = v663[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v325 + 5, v506);

      }
      proximityServiceCategory = (__CFString *)self->_proximityServiceCategory;
      if (self->_proximityServiceCategory)
      {
        v327 = v663;
        v505 = v663[5];
        objectDiscoveryPublicKeyData = proximityServiceCategory;
        NSAppendPrintF_safe();
        objc_storeStrong(v327 + 5, v505);
      }
      v328 = self->_proximityServiceClassicAddress;
      if (v328)
      {
        v329 = v663;
        v504 = v663[5];
        CUPrintNSDataAddress();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v329 + 5, v504);

      }
      if (self->_proximityServiceFlags)
      {
        v330 = v663;
        v503 = v663[5];
        CUPrintFlags32();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v330 + 5, v503);

      }
      proximityServiceMeasuredPower = (__CFString *)self->_proximityServiceMeasuredPower;
      if (self->_proximityServiceMeasuredPower)
      {
        v332 = v663;
        v502 = v663[5];
        objectDiscoveryPublicKeyData = proximityServiceMeasuredPower;
        NSAppendPrintF_safe();
        objc_storeStrong(v332 + 5, v502);
      }
      proximityServiceProductID = (__CFString *)self->_proximityServiceProductID;
      if ((_DWORD)proximityServiceProductID)
      {
        v334 = CBProductIDToString_0(self->_proximityServiceProductID);
        v335 = v663;
        v501 = v663[5];
        objectDiscoveryPublicKeyData = proximityServiceProductID;
        v461 = v334;
        NSAppendPrintF_safe();
        objc_storeStrong(v335 + 5, v501);
      }
      proximityServicePSM = (__CFString *)self->_proximityServicePSM;
      if (self->_proximityServicePSM)
      {
        v337 = v663;
        v500 = v663[5];
        objectDiscoveryPublicKeyData = proximityServicePSM;
        NSAppendPrintF_safe();
        objc_storeStrong(v337 + 5, v500);
      }
      v338 = self->_proximityServiceSetupHash;
      if (v338)
      {
        v339 = v663;
        v499 = v663[5];
        CUPrintNSDataHex();
        objectDiscoveryPublicKeyData = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        objc_storeStrong(v339 + 5, v499);

      }
      proximityServiceSubType = self->_proximityServiceSubType;
      if (self->_proximityServiceSubType)
      {
        v341 = v663 + 5;
        v498 = v663[5];
        if (proximityServiceSubType > 6)
          v342 = "?";
        else
          v342 = off_1E54036B8[(char)(proximityServiceSubType - 1)];
        objectDiscoveryPublicKeyData = (__CFString *)v342;
        NSAppendPrintF_safe();
        objc_storeStrong(v341, v498);
      }
      proximityServiceVendorID = (__CFString *)self->_proximityServiceVendorID;
      if (!self->_proximityServiceVendorID)
        goto LABEL_430;
      v344 = v663 + 5;
      v497 = v663[5];
      v345 = "Apple";
      if ((int)proximityServiceVendorID > 300)
      {
        if ((_DWORD)proximityServiceVendorID == 1452)
          goto LABEL_429;
        if ((_DWORD)proximityServiceVendorID == 1356 || (_DWORD)proximityServiceVendorID == 301)
        {
          v345 = "Sony";
          goto LABEL_429;
        }
      }
      else
      {
        switch((_DWORD)proximityServiceVendorID)
        {
          case 6:
            v345 = "MS";
            goto LABEL_429;
          case 0x4C:
LABEL_429:
            objectDiscoveryPublicKeyData = proximityServiceVendorID;
            v461 = v345;
            NSAppendPrintF_safe();
            objc_storeStrong(v344, v497);
LABEL_430:
            proximityServiceVersion = (__CFString *)self->_proximityServiceVersion;
            if (self->_proximityServiceVersion)
            {
              v347 = v663;
              v496 = v663[5];
              objectDiscoveryPublicKeyData = proximityServiceVersion;
              NSAppendPrintF_safe();
              objc_storeStrong(v347 + 5, v496);
            }
            if ((discoveryFlags & 0xC080) != 0)
            {
              proximityPairingProductID = (__CFString *)self->_proximityPairingProductID;
              if ((_DWORD)proximityPairingProductID)
              {
                v349 = CBProductIDToString_0(self->_proximityPairingProductID);
                v350 = v663;
                v495 = v663[5];
                objectDiscoveryPublicKeyData = proximityPairingProductID;
                v461 = v349;
                NSAppendPrintF_safe();
                objc_storeStrong(v350 + 5, v495);
              }
              proximityPairingSubType = (__CFString *)self->_proximityPairingSubType;
              if (self->_proximityPairingSubType)
              {
                v352 = v663 + 5;
                v494 = v663[5];
                if (proximityPairingSubType > 8)
                  v353 = "?";
                else
                  v353 = off_1E54036E8[(char)((_BYTE)proximityPairingSubType - 1)];
                objectDiscoveryPublicKeyData = proximityPairingSubType;
                v461 = v353;
                NSAppendPrintF_safe();
                objc_storeStrong(v352, v494);
              }
              v354 = -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", objectDiscoveryPublicKeyData, v461);
              if (v354)
              {
                v355 = v663 + 5;
                v493 = v663[5];
                if (v354 > 7)
                  v356 = "?";
                else
                  v356 = off_1E5403728[v354 - 1];
                v453 = v356;
                NSAppendPrintF_safe();
                objc_storeStrong(v355, v493);
              }
              v357 = -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement", v453);
              if (v357)
              {
                v358 = v663 + 5;
                v492 = v663[5];
                if (v357 > 7)
                  v359 = "?";
                else
                  v359 = off_1E5403728[v357 - 1];
                objectDiscoveryPublicKeyData = (__CFString *)v359;
                NSAppendPrintF_safe();
                objc_storeStrong(v358, v492);
              }
            }
            if (self->_selectiveSpeechListeningCapability)
            {
              if (self->_selectiveSpeechListeningCapability == 1)
                v360 = CFSTR("Enabled");
              else
                v360 = CFSTR("?");
              v361 = v663;
              v491 = v663[5];
              objectDiscoveryPublicKeyData = v360;
              NSAppendPrintF_safe();
              objc_storeStrong(v361 + 5, v491);

            }
            v362 = -[CBDevice selectiveSpeechListeningConfig](self, "selectiveSpeechListeningConfig", objectDiscoveryPublicKeyData);
            if (v362)
            {
              v363 = v663 + 5;
              v490 = v663[5];
              if (v362 > 3)
                v364 = CFSTR("?");
              else
                v364 = (const __CFString *)*((_QWORD *)&off_1E5403760 + (char)(v362 - 1));
              v454 = (void *)v364;
              NSAppendPrintF_safe();
              objc_storeStrong(v363, v490);
            }
            v365 = self->_safetyAlertsAlertData;
            if (v365)
            {
              v366 = v663;
              v489 = v663[5];
              CUPrintNSDataHex();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v366 + 5, v489);

            }
            v367 = self->_safetyAlertsAlertID;
            if (v367)
            {
              v368 = v663;
              v488 = v663[5];
              CUPrintNSDataHex();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v368 + 5, v488);

            }
            v369 = self->_safetyAlertsSignature;
            if (v369)
            {
              v370 = v663;
              v487 = v663[5];
              CUPrintNSDataHex();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v370 + 5, v487);

            }
            if (self->_safetyAlertsVersion)
            {
              if (self->_safetyAlertsVersion == 1)
                v371 = "1";
              else
                v371 = "?";
              v372 = v663;
              v486 = v663[5];
              v454 = (void *)v371;
              NSAppendPrintF_safe();
              objc_storeStrong(v372 + 5, v486);
            }
            if ((self->_internalFlags & 0x4000) != 0)
            {
              v373 = self->_safetyAlertsSegmentAlertData;
              if (v373)
              {
                v374 = v663;
                v485 = v663[5];
                CUPrintNSDataHex();
                v454 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v374 + 5, v485);

              }
              safetyAlertsSegmentSegmentNumber = (void *)self->_safetyAlertsSegmentSegmentNumber;
              if (self->_safetyAlertsSegmentSegmentNumber)
              {
                v376 = v663;
                v484 = v663[5];
                v454 = safetyAlertsSegmentSegmentNumber;
                NSAppendPrintF_safe();
                objc_storeStrong(v376 + 5, v484);
              }
              safetyAlertsSegmentSegmentsTotal = (void *)self->_safetyAlertsSegmentSegmentsTotal;
              if (self->_safetyAlertsSegmentSegmentsTotal)
              {
                v378 = v663;
                v483 = v663[5];
                v454 = safetyAlertsSegmentSegmentsTotal;
                NSAppendPrintF_safe();
                objc_storeStrong(v378 + 5, v483);
              }
              v379 = self->_safetyAlertsSegmentServiceData;
              if (v379)
              {
                v380 = v663;
                v482 = v663[5];
                CUPrintNSDataHex();
                v454 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v380 + 5, v482);

              }
              v381 = self->_safetyAlertsSegmentSignature;
              if (v381)
              {
                v382 = v663;
                v481 = v663[5];
                CUPrintNSDataHex();
                v454 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v382 + 5, v481);

              }
            }
            v383 = self->_spatialInteractionIdentifiers;
            if (v383)
            {
              v384 = v663;
              v480 = v663[5];
              CUPrintNSObjectOneLine();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v384 + 5, v480);

            }
            if (self->_spatialInteractionFlags)
            {
              v385 = v663;
              v479 = v663[5];
              CUPrintFlags32();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v385 + 5, v479);

            }
            v386 = self->_spatialInteractionTokenData;
            if (v386)
            {
              v387 = v663;
              v478 = v663[5];
              CUPrintNSObjectMasked();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v387 + 5, v478);

            }
            v388 = self->_spatialInteractionUserInfo;
            if (v388)
            {
              v389 = v663;
              v477 = v663[5];
              CUPrintNSObjectOneLineEx();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v389 + 5, v477);

            }
            v390 = self->_spatialInteractionUWBConfigData;
            v391 = v390;
            if (v390)
            {
              v392 = v663;
              v476 = v663[5];
              v454 = v390;
              NSAppendPrintF_safe();
              objc_storeStrong(v392 + 5, v476);
            }

            spatialInteractionUWBTokenFlags = (void *)self->_spatialInteractionUWBTokenFlags;
            if ((_DWORD)spatialInteractionUWBTokenFlags)
            {
              v394 = v663;
              v475 = v663[5];
              v454 = spatialInteractionUWBTokenFlags;
              NSAppendPrintF_safe();
              objc_storeStrong(v394 + 5, v475);
            }
            v395 = self->_tipiDevices;
            if (v395)
            {
              v396 = v663;
              v474 = v663[5];
              CUPrintNSObjectOneLine();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v396 + 5, v474);

            }
            tipiConnectionStatus = self->_tipiConnectionStatus;
            if (self->_tipiConnectionStatus)
            {
              v398 = v663 + 5;
              v473 = v663[5];
              if (tipiConnectionStatus > 3)
                v399 = "?";
              else
                v399 = off_1E5403778[(char)(tipiConnectionStatus - 1)];
              v454 = (void *)v399;
              NSAppendPrintF_safe();
              objc_storeStrong(v398, v473);
            }
            if (self->_tipiState)
            {
              v400 = v663;
              v472 = v663[5];
              CUPrintFlags32();
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v400 + 5, v472);

            }
            -[CBDevice watchSetupData](self, "watchSetupData", v454);
            v401 = (void *)objc_claimAutoreleasedReturnValue();
            if (v401)
            {
              v402 = v663;
              v471 = v663[5];
              CUPrintNSDataHex();
              v455 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v402 + 5, v471);

            }
            if (v21 < 0x1F)
            {
              if (self->_internalFlags)
              {
                v403 = v663;
                v470 = v663[5];
                CUPrintFlags32();
                v456 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v403 + 5, v470);

              }
              if (self->_attributeInternalFlags)
              {
                v404 = v663;
                v469 = v663[5];
                CUPrintFlags32();
                v457 = (void *)objc_claimAutoreleasedReturnValue();
                NSAppendPrintF_safe();
                objc_storeStrong(v404 + 5, v469);

              }
            }
            if (self->_changeFlags != self->_discoveryFlags)
            {
              v405 = v663;
              v468 = v663[5];
              CUPrintFlags64();
              v458 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              objc_storeStrong(v405 + 5, v468);

            }
            if (*(_DWORD *)&self->_changedTypesInternal != *(_DWORD *)&self->_discoveryTypesInternal)
            {
              v406 = v663;
              v467 = v663[5];
              CBDiscoveryTypesAppendString((uint64_t)&v467, (uint64_t)", ChTy", (uint64_t)&self->_changedTypesInternal);
              objc_storeStrong(v406 + 5, v467);
            }
            if (v21 <= 0x14)
            {
              v407 = v663;
              v466 = v663[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v407 + 5, v466);
            }
            v408 = self->_spatialInteractionDeviceTimestampArrayDictionary;
            if (v408)
            {
              v409 = v663;
              v465 = v663[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v409 + 5, v465);
              spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
              v463[0] = MEMORY[0x1E0C809B0];
              v463[1] = 3221225472;
              v463[2] = __33__CBDevice_descriptionWithLevel___block_invoke;
              v463[3] = &unk_1E5403080;
              v463[4] = &v662;
              v464 = v94;
              -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](spatialInteractionDeviceTimestampArrayDictionary, "enumerateKeysAndObjectsUsingBlock:", v463);
              v411 = v663;
              v462 = v663[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v411 + 5, v462);
            }

            goto LABEL_520;
          case 0xC4:
            v345 = "LG";
            goto LABEL_429;
        }
      }
      v345 = "?";
      goto LABEL_429;
    }
    v181 = v663 + 5;
    v592 = v663[5];
    if (v180 > 2)
    {
      if (v180 == 3)
      {
        v182 = "NoStereoUpSample";
        goto LABEL_241;
      }
      if (v180 == 255)
      {
        v182 = "Unknown";
        goto LABEL_241;
      }
    }
    else
    {
      if (v180 == 1)
      {
        v182 = "ContentDriven";
        goto LABEL_241;
      }
      if (v180 == 2)
      {
        v182 = "Always";
LABEL_241:
        v430 = (void *)v182;
        NSAppendPrintF_safe();
        objc_storeStrong(v181, v592);
        goto LABEL_242;
      }
    }
    v182 = "?";
    goto LABEL_241;
  }
LABEL_520:
  v412 = v663[5];
  _Block_object_dispose(&v662, 8);

  return v412;
}

- (char)rssi
{
  int bleRSSI;

  bleRSSI = self->_bleRSSI;
  if (!bleRSSI)
    LOBYTE(bleRSSI) = self->_classicRSSI;
  return bleRSSI;
}

- (NSString)stableIdentifier
{
  NSString *v3;
  NSData *v4;
  void *v5;
  NSData *v7;
  void *v8;

  v3 = self->_idsDeviceID;
  if (v3)
    return v3;
  v4 = self->_homeKitV2AccessoryIDData;
  if (-[NSData length](v4, "length") == 6)
  {
    CUPrintNSDataAddress();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v5;
  }
  else
  {
    v7 = self->_homeKitV1DeviceIDData;
    if (-[NSData length](v7, "length") == 6)
    {
      CUPrintNSDataAddress();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    return (NSString *)v8;
  }
}

- (int)spatialAudioMode
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)primaryBudSide
{
  return CFDictionaryGetInt64Ranged();
}

- (NSData)nearbyInfoV2TempAuthTagData
{
  return self->_nearbyInfoV2TempAuthTagData;
}

- (NSData)watchSetupData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (unsigned)nearbyInfoStatusType
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyInfoStatusTime
{
  return CFDictionaryGetInt64Ranged();
}

- (double)nearbyInfoStatusProgress
{
  double result;

  CFDictionaryGetDouble();
  return result;
}

- (unsigned)nearbyActionV2Type
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyActionV2Flags
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyActionDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (NSData)airdropTempAuthTagData
{
  return self->_airdropTempAuthTagData;
}

- (BOOL)discoveryTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, a3);
}

- (BOOL)changedTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, a3);
}

- (BOOL)changedTypesContainCBDiscovery:(id)a3
{
  id v4;
  unint64_t changeFlags;
  BOOL v7;

  v4 = a3;
  changeFlags = self->_changeFlags;
  if ((objc_msgSend(v4, "discoveryFlags") & changeFlags) != 0)
  {

    return 1;
  }
  else
  {
    v7 = CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, (_BYTE *)objc_msgSend(objc_retainAutorelease(v4), "discoveryTypesInternalPtr"));

    return v7;
  }
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSString *accountID;
  id v6;
  const char *v7;
  int64_t audioStreamState;
  NSData *bleAddressData;
  NSData *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  size_t v14;
  double bleAdvertisementTimestamp;
  uint64_t bleAdvertisementTimestampMachContinuous;
  NSData *bleAppleManufacturerData;
  NSData *v18;
  id v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  int64_t bleChannel;
  int64_t bleRSSI;
  NSData *btAddressData;
  NSData *v26;
  id v27;
  uint64_t v28;
  const char *v29;
  size_t v30;
  NSString *caseVersion;
  id v32;
  const char *v33;
  uint64_t changeFlags;
  size_t v35;
  uint64_t connectedServices;
  NSString *contactID;
  id v38;
  const char *v39;
  uint64_t deviceFlags;
  NSMutableDictionary *v41;
  void *v42;
  uint64_t discoveryFlags;
  size_t v44;
  NSString *firmwareVersion;
  id v46;
  const char *v47;
  NSString *identifier;
  id v49;
  const char *v50;
  NSString *idsDeviceID;
  id v52;
  const char *v53;
  NSString *leAdvName;
  id v55;
  const char *v56;
  NSString *model;
  id v58;
  const char *v59;
  NSString *name;
  id v61;
  const char *v62;
  int64_t primaryPlacement;
  int64_t secondaryPlacement;
  uint64_t productID;
  NSString *productName;
  id v67;
  const char *v68;
  NSData *txAddressData;
  NSData *v70;
  id v71;
  uint64_t v72;
  const char *v73;
  size_t v74;
  NSString *serialNumber;
  id v76;
  const char *v77;
  NSString *serialNumberLeft;
  id v79;
  const char *v80;
  NSString *serialNumberRight;
  const char *v82;
  uint64_t supportedServices;
  NSData *airdropTempAuthTagData;
  NSData *v85;
  id v86;
  uint64_t v87;
  const char *v88;
  size_t v89;
  NSData *airplaySourceAuthTagData;
  NSData *v91;
  id v92;
  uint64_t v93;
  const char *v94;
  size_t v95;
  uint64_t airplayTargetIPv4;
  NSData *homeKitV1DeviceIDData;
  NSData *v98;
  id v99;
  uint64_t v100;
  const char *v101;
  size_t v102;
  uint64_t homeKitV1SetupHash;
  NSData *homeKitV2AccessoryIDData;
  NSData *v105;
  id v106;
  uint64_t v107;
  const char *v108;
  size_t v109;
  NSData *homeKitV2AuthTagData;
  NSData *v111;
  id v112;
  uint64_t v113;
  const char *v114;
  size_t v115;
  uint64_t homeKitV2Value;
  uint64_t nearbyActionFlags;
  NSData *nearbyAuthTag;
  NSData *v119;
  id v120;
  uint64_t v121;
  const char *v122;
  size_t v123;
  uint64_t nearbyInfoFlags;
  NSData *nearbyInfoV2AuthIntegrityTagData;
  NSData *v126;
  id v127;
  uint64_t v128;
  const char *v129;
  size_t v130;
  NSData *nearbyInfoV2AuthTagData;
  NSData *v132;
  id v133;
  uint64_t v134;
  const char *v135;
  size_t v136;
  NSData *nearbyActionNoWakeAuthTagData;
  NSData *v138;
  id v139;
  uint64_t v140;
  const char *v141;
  size_t v142;
  NSData *nearbyActionNoWakeConfigData;
  NSData *v144;
  id v145;
  uint64_t v146;
  const char *v147;
  size_t v148;
  NSData *objectDiscoveryNearOwnerID;
  NSData *v150;
  id v151;
  uint64_t v152;
  const char *v153;
  size_t v154;
  uint64_t objectDiscoveryProductID;
  NSData *objectDiscoveryPublicKeyData;
  NSData *v157;
  id v158;
  uint64_t v159;
  const char *v160;
  size_t v161;
  uint64_t proximityPairingProductID;
  NSData *proximityServiceClassicAddress;
  NSData *v164;
  id v165;
  uint64_t v166;
  const char *v167;
  size_t v168;
  NSData *proximityServiceData;
  NSData *v170;
  id v171;
  uint64_t v172;
  const char *v173;
  size_t v174;
  uint64_t proximityServiceProductID;
  NSData *proximityServiceSetupHash;
  NSData *v177;
  id v178;
  uint64_t v179;
  const char *v180;
  size_t v181;
  NSData *safetyAlertsAlertData;
  NSData *v183;
  id v184;
  uint64_t v185;
  const char *v186;
  size_t v187;
  NSData *safetyAlertsAlertID;
  NSData *v189;
  id v190;
  uint64_t v191;
  const char *v192;
  size_t v193;
  NSData *safetyAlertsSignature;
  NSData *v195;
  id v196;
  uint64_t v197;
  const char *v198;
  size_t v199;
  uint64_t spatialInteractionPeerID;
  NSData *spatialInteractionUWBConfigData;
  NSData *v202;
  id v203;
  uint64_t v204;
  const char *v205;
  size_t v206;
  xpc_object_t xdict;

  v4 = a3;
  accountID = self->_accountID;
  v6 = v4;
  v7 = -[NSString UTF8String](objc_retainAutorelease(accountID), "UTF8String");
  if (v7)
    xpc_dictionary_set_string(v6, "acID", v7);

  if (self->_adaptiveVolumeCapability)
    xpc_dictionary_set_uint64(v6, "avCp", self->_adaptiveVolumeCapability);
  audioStreamState = self->_audioStreamState;
  if ((_DWORD)audioStreamState)
    xpc_dictionary_set_int64(v6, "aStS", audioStreamState);
  if (self->_autoAncCapability)
    xpc_dictionary_set_uint64(v6, "aaCp", self->_autoAncCapability);
  if (self->_batteryInfoMain)
    xpc_dictionary_set_uint64(v6, "batM", self->_batteryInfoMain);
  if (self->_batteryInfoLeft)
    xpc_dictionary_set_uint64(v6, "batL", self->_batteryInfoLeft);
  if (self->_batteryInfoRight)
    xpc_dictionary_set_uint64(v6, "batR", self->_batteryInfoRight);
  if (self->_batteryInfoCase)
    xpc_dictionary_set_uint64(v6, "batC", self->_batteryInfoCase);
  bleAddressData = self->_bleAddressData;
  if (bleAddressData)
  {
    v10 = objc_retainAutorelease(bleAddressData);
    v11 = v6;
    v12 = -[NSData bytes](v10, "bytes");
    if (v12)
      v13 = (const char *)v12;
    else
      v13 = "";
    v14 = -[NSData length](v10, "length");

    xpc_dictionary_set_data(v11, "blAd", v13, v14);
  }
  bleAdvertisementTimestamp = self->_bleAdvertisementTimestamp;
  if (bleAdvertisementTimestamp != 0.0)
    xpc_dictionary_set_double(v6, "blAt", bleAdvertisementTimestamp);
  bleAdvertisementTimestampMachContinuous = self->_bleAdvertisementTimestampMachContinuous;
  if (bleAdvertisementTimestampMachContinuous)
    xpc_dictionary_set_uint64(v6, "blATM", bleAdvertisementTimestampMachContinuous);
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  if (bleAppleManufacturerData)
  {
    v18 = objc_retainAutorelease(bleAppleManufacturerData);
    v19 = v6;
    v20 = -[NSData bytes](v18, "bytes");
    if (v20)
      v21 = (const char *)v20;
    else
      v21 = "";
    v22 = -[NSData length](v18, "length");

    xpc_dictionary_set_data(v19, "blAM", v21, v22);
  }
  bleChannel = self->_bleChannel;
  if ((_DWORD)bleChannel)
    xpc_dictionary_set_int64(v6, "blCh", bleChannel);
  bleRSSI = self->_bleRSSI;
  if ((_DWORD)bleRSSI)
    xpc_dictionary_set_int64(v6, "blRS", bleRSSI);
  btAddressData = self->_btAddressData;
  if (btAddressData)
  {
    v26 = objc_retainAutorelease(btAddressData);
    v27 = v6;
    v28 = -[NSData bytes](v26, "bytes");
    if (v28)
      v29 = (const char *)v28;
    else
      v29 = "";
    v30 = -[NSData length](v26, "length");

    xpc_dictionary_set_data(v27, "btAd", v29, v30);
  }
  caseVersion = self->_caseVersion;
  v32 = v6;
  v33 = -[NSString UTF8String](objc_retainAutorelease(caseVersion), "UTF8String");
  if (v33)
    xpc_dictionary_set_string(v32, "cVer", v33);

  changeFlags = self->_changeFlags;
  if (changeFlags)
    xpc_dictionary_set_uint64(v32, "chFl", changeFlags);
  if (self->_changedTypesInternal)
    v35 = 4;
  else
    v35 = 1;
  xpc_dictionary_set_data(v32, "chTy", &self->_changedTypesInternal, v35);
  if (self->_colorInfo)
    xpc_dictionary_set_uint64(v32, "clrI", self->_colorInfo);
  if (self->_classicRSSI)
    xpc_dictionary_set_int64(v32, "clRS", self->_classicRSSI);
  connectedServices = self->_connectedServices;
  if ((_DWORD)connectedServices)
    xpc_dictionary_set_uint64(v32, "CnS", connectedServices);
  contactID = self->_contactID;
  v38 = v32;
  v39 = -[NSString UTF8String](objc_retainAutorelease(contactID), "UTF8String");
  if (v39)
    xpc_dictionary_set_string(v38, "cnID", v39);

  CUXPCEncodeObject();
  if (self->_conversationDetectCapability)
    xpc_dictionary_set_uint64(v38, "cdCp", self->_conversationDetectCapability);
  deviceFlags = self->_deviceFlags;
  if (deviceFlags)
    xpc_dictionary_set_uint64(v38, "dvFl", deviceFlags);
  v41 = self->_deviceInfo;
  if (v41)
  {
    v42 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v42)
      xpc_dictionary_set_value(v38, "dvIn", v42);

  }
  if (self->_deviceType)
    xpc_dictionary_set_uint64(v38, "dvTy", self->_deviceType);
  discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags)
    xpc_dictionary_set_uint64(v38, "dsFl", discoveryFlags);
  if (self->_discoveryTypesInternal)
    v44 = 4;
  else
    v44 = 1;
  xpc_dictionary_set_data(v38, "dsTy", &self->_discoveryTypesInternal, v44);
  if (self->_doubleTapActionLeft)
    xpc_dictionary_set_int64(v38, "dtAL", self->_doubleTapActionLeft);
  if (self->_doubleTapActionRight)
    xpc_dictionary_set_int64(v38, "dtAR", self->_doubleTapActionRight);
  if (self->_doubleTapCapability)
    xpc_dictionary_set_int64(v38, "dtCa", self->_doubleTapCapability);
  if (self->_endCallCapability)
    xpc_dictionary_set_uint64(v38, "eCCp", self->_endCallCapability);
  firmwareVersion = self->_firmwareVersion;
  v46 = v38;
  v47 = -[NSString UTF8String](objc_retainAutorelease(firmwareVersion), "UTF8String");
  if (v47)
    xpc_dictionary_set_string(v46, "frmV", v47);

  identifier = self->_identifier;
  v49 = v46;
  v50 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v50)
    xpc_dictionary_set_string(v49, "id", v50);

  if (self->_interval)
    xpc_dictionary_set_uint64(v49, "inV", self->_interval);
  idsDeviceID = self->_idsDeviceID;
  v52 = v49;
  v53 = -[NSString UTF8String](objc_retainAutorelease(idsDeviceID), "UTF8String");
  if (v53)
    xpc_dictionary_set_string(v52, "idsI", v53);

  leAdvName = self->_leAdvName;
  v55 = v52;
  v56 = -[NSString UTF8String](objc_retainAutorelease(leAdvName), "UTF8String");
  if (v56)
    xpc_dictionary_set_string(v55, "leNm", v56);

  if (self->_microphoneMode)
    xpc_dictionary_set_int64(v55, "micM", self->_microphoneMode);
  model = self->_model;
  v58 = v55;
  v59 = -[NSString UTF8String](objc_retainAutorelease(model), "UTF8String");
  if (v59)
    xpc_dictionary_set_string(v58, "md", v59);

  if (self->_muteControlCapability)
    xpc_dictionary_set_uint64(v58, "mCCp", self->_muteControlCapability);
  name = self->_name;
  v61 = v58;
  v62 = -[NSString UTF8String](objc_retainAutorelease(name), "UTF8String");
  if (v62)
    xpc_dictionary_set_string(v61, "nm", v62);

  primaryPlacement = self->_primaryPlacement;
  if ((_DWORD)primaryPlacement)
    xpc_dictionary_set_int64(v61, "dPrP", primaryPlacement);
  secondaryPlacement = self->_secondaryPlacement;
  if ((_DWORD)secondaryPlacement)
    xpc_dictionary_set_int64(v61, "dScP", secondaryPlacement);
  if (self->_placementMode)
    xpc_dictionary_set_int64(v61, "dPlM", self->_placementMode);
  productID = self->_productID;
  if ((_DWORD)productID)
    xpc_dictionary_set_uint64(v61, "pid", productID);
  productName = self->_productName;
  v67 = v61;
  v68 = -[NSString UTF8String](objc_retainAutorelease(productName), "UTF8String");
  if (v68)
    xpc_dictionary_set_string(v67, "prN", v68);

  if (self->_selectiveSpeechListeningCapability)
    xpc_dictionary_set_uint64(v67, "ssCp", self->_selectiveSpeechListeningCapability);
  txAddressData = self->_txAddressData;
  if (txAddressData)
  {
    v70 = objc_retainAutorelease(txAddressData);
    v71 = v67;
    v72 = -[NSData bytes](v70, "bytes");
    if (v72)
      v73 = (const char *)v72;
    else
      v73 = "";
    v74 = -[NSData length](v70, "length");

    xpc_dictionary_set_data(v71, "TxAd", v73, v74);
  }
  serialNumber = self->_serialNumber;
  v76 = v67;
  v77 = -[NSString UTF8String](objc_retainAutorelease(serialNumber), "UTF8String");
  if (v77)
    xpc_dictionary_set_string(v76, "sn", v77);

  serialNumberLeft = self->_serialNumberLeft;
  v79 = v76;
  v80 = -[NSString UTF8String](objc_retainAutorelease(serialNumberLeft), "UTF8String");
  if (v80)
    xpc_dictionary_set_string(v79, "snLe", v80);

  serialNumberRight = self->_serialNumberRight;
  xdict = v79;
  v82 = -[NSString UTF8String](objc_retainAutorelease(serialNumberRight), "UTF8String");
  if (v82)
    xpc_dictionary_set_string(xdict, "snRi", v82);

  if (self->_smartRoutingMode)
    xpc_dictionary_set_int64(xdict, "srMd", self->_smartRoutingMode);
  supportedServices = self->_supportedServices;
  if ((_DWORD)supportedServices)
    xpc_dictionary_set_uint64(xdict, "supS", supportedServices);
  if (self->_vendorID)
    xpc_dictionary_set_uint64(xdict, "vid", self->_vendorID);
  if (self->_vendorIDSource)
    xpc_dictionary_set_uint64(xdict, "vidS", self->_vendorIDSource);
  if (self->_airdropFlags)
    xpc_dictionary_set_uint64(xdict, "adFl", self->_airdropFlags);
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  if (airdropTempAuthTagData)
  {
    v85 = objc_retainAutorelease(airdropTempAuthTagData);
    v86 = xdict;
    v87 = -[NSData bytes](v85, "bytes");
    if (v87)
      v88 = (const char *)v87;
    else
      v88 = "";
    v89 = -[NSData length](v85, "length");

    xpc_dictionary_set_data(v86, "adTa", v88, v89);
  }
  if (self->_airdropModel)
    xpc_dictionary_set_uint64(xdict, "adMl", self->_airdropModel);
  if (self->_airdropVersion)
    xpc_dictionary_set_uint64(xdict, "adVs", self->_airdropVersion);
  if (self->_airdropHash1)
    xpc_dictionary_set_uint64(xdict, "adH1", self->_airdropHash1);
  if (self->_airdropHash2)
    xpc_dictionary_set_uint64(xdict, "adH2", self->_airdropHash2);
  if (self->_airdropHash3)
    xpc_dictionary_set_uint64(xdict, "adH3", self->_airdropHash3);
  if (self->_airdropHash4)
    xpc_dictionary_set_uint64(xdict, "adH4", self->_airdropHash4);
  if (self->_airdropConfigData)
    xpc_dictionary_set_uint64(xdict, "adCd", self->_airdropConfigData);
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  if (airplaySourceAuthTagData)
  {
    v91 = objc_retainAutorelease(airplaySourceAuthTagData);
    v92 = xdict;
    v93 = -[NSData bytes](v91, "bytes");
    if (v93)
      v94 = (const char *)v93;
    else
      v94 = "";
    v95 = -[NSData length](v91, "length");

    xpc_dictionary_set_data(v92, "apAT", v94, v95);
  }
  if (self->_airplaySourceFlags)
    xpc_dictionary_set_uint64(xdict, "apSF", self->_airplaySourceFlags);
  if (self->_airplayTargetConfigSeed)
    xpc_dictionary_set_uint64(xdict, "apTC", self->_airplayTargetConfigSeed);
  if (self->_airplayTargetFlags)
    xpc_dictionary_set_uint64(xdict, "apTF", self->_airplayTargetFlags);
  airplayTargetIPv4 = self->_airplayTargetIPv4;
  if ((_DWORD)airplayTargetIPv4)
    xpc_dictionary_set_uint64(xdict, "apTI", airplayTargetIPv4);
  if (self->_homeKitV1Category)
    xpc_dictionary_set_uint64(xdict, "hkCa", self->_homeKitV1Category);
  if (self->_homeKitV1CompatibleVersion)
    xpc_dictionary_set_uint64(xdict, "hkCV", self->_homeKitV1CompatibleVersion);
  if (self->_homeKitV1ConfigurationNumber)
    xpc_dictionary_set_uint64(xdict, "hkCN", self->_homeKitV1ConfigurationNumber);
  homeKitV1DeviceIDData = self->_homeKitV1DeviceIDData;
  if (homeKitV1DeviceIDData)
  {
    v98 = objc_retainAutorelease(homeKitV1DeviceIDData);
    v99 = xdict;
    v100 = -[NSData bytes](v98, "bytes");
    if (v100)
      v101 = (const char *)v100;
    else
      v101 = "";
    v102 = -[NSData length](v98, "length");

    xpc_dictionary_set_data(v99, "hkDI", v101, v102);
  }
  if (self->_homeKitV1Flags)
    xpc_dictionary_set_uint64(xdict, "hkFl", self->_homeKitV1Flags);
  if (self->_homeKitV1StateNumber)
    xpc_dictionary_set_uint64(xdict, "hkS1", self->_homeKitV1StateNumber);
  homeKitV1SetupHash = self->_homeKitV1SetupHash;
  if ((_DWORD)homeKitV1SetupHash)
    xpc_dictionary_set_uint64(xdict, "hkSH", homeKitV1SetupHash);
  homeKitV2AccessoryIDData = self->_homeKitV2AccessoryIDData;
  if (homeKitV2AccessoryIDData)
  {
    v105 = objc_retainAutorelease(homeKitV2AccessoryIDData);
    v106 = xdict;
    v107 = -[NSData bytes](v105, "bytes");
    if (v107)
      v108 = (const char *)v107;
    else
      v108 = "";
    v109 = -[NSData length](v105, "length");

    xpc_dictionary_set_data(v106, "hkAI", v108, v109);
  }
  homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
  if (homeKitV2AuthTagData)
  {
    v111 = objc_retainAutorelease(homeKitV2AuthTagData);
    v112 = xdict;
    v113 = -[NSData bytes](v111, "bytes");
    if (v113)
      v114 = (const char *)v113;
    else
      v114 = "";
    v115 = -[NSData length](v111, "length");

    xpc_dictionary_set_data(v112, "hkAT", v114, v115);
  }
  if (self->_homeKitV2InstanceID)
    xpc_dictionary_set_uint64(xdict, "hkII", self->_homeKitV2InstanceID);
  if (self->_homeKitV2StateNumber)
    xpc_dictionary_set_uint64(xdict, "hkS2", self->_homeKitV2StateNumber);
  homeKitV2Value = self->_homeKitV2Value;
  if (homeKitV2Value)
    xpc_dictionary_set_uint64(xdict, "hkVa", homeKitV2Value);
  nearbyActionFlags = self->_nearbyActionFlags;
  if ((_DWORD)nearbyActionFlags)
    xpc_dictionary_set_uint64(xdict, "nbAF", nearbyActionFlags);
  if (self->_nearbyActionType)
    xpc_dictionary_set_uint64(xdict, "nbAc", self->_nearbyActionType);
  nearbyAuthTag = self->_nearbyAuthTag;
  if (nearbyAuthTag)
  {
    v119 = objc_retainAutorelease(nearbyAuthTag);
    v120 = xdict;
    v121 = -[NSData bytes](v119, "bytes");
    if (v121)
      v122 = (const char *)v121;
    else
      v122 = "";
    v123 = -[NSData length](v119, "length");

    xpc_dictionary_set_data(v120, "nbAT", v122, v123);
  }
  nearbyInfoFlags = self->_nearbyInfoFlags;
  if ((_DWORD)nearbyInfoFlags)
    xpc_dictionary_set_uint64(xdict, "nbIF", nearbyInfoFlags);
  if (self->_nearbyInfoV2DecryptedFlags)
    xpc_dictionary_set_uint64(xdict, "nb2Fe", self->_nearbyInfoV2DecryptedFlags);
  if (self->_nearbyInfoV2Flags)
    xpc_dictionary_set_uint64(xdict, "nb2F", self->_nearbyInfoV2Flags);
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  if (nearbyInfoV2AuthIntegrityTagData)
  {
    v126 = objc_retainAutorelease(nearbyInfoV2AuthIntegrityTagData);
    v127 = xdict;
    v128 = -[NSData bytes](v126, "bytes");
    if (v128)
      v129 = (const char *)v128;
    else
      v129 = "";
    v130 = -[NSData length](v126, "length");

    xpc_dictionary_set_data(v127, "nb2Ai", v129, v130);
  }
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  if (nearbyInfoV2AuthTagData)
  {
    v132 = objc_retainAutorelease(nearbyInfoV2AuthTagData);
    v133 = xdict;
    v134 = -[NSData bytes](v132, "bytes");
    if (v134)
      v135 = (const char *)v134;
    else
      v135 = "";
    v136 = -[NSData length](v132, "length");

    xpc_dictionary_set_data(v133, "nb2A", v135, v136);
  }
  if (self->_nearbyInfoV2InvitationCounter)
    xpc_dictionary_set_uint64(xdict, "nb2Ic", self->_nearbyInfoV2InvitationCounter);
  if (self->_nearbyInfoV2InvitationTypes)
    xpc_dictionary_set_uint64(xdict, "nb2It", self->_nearbyInfoV2InvitationTypes);
  if (self->_nearbyInfoV2InvitationRouteType)
    xpc_dictionary_set_uint64(xdict, "nb2Ir", self->_nearbyInfoV2InvitationRouteType);
  if (self->_nearbyActionNoWakeType)
    xpc_dictionary_set_uint64(xdict, "nawT", self->_nearbyActionNoWakeType);
  if (self->_nearbyActionNWPrecisionFindingStatus)
    xpc_dictionary_set_uint64(xdict, "nawS", self->_nearbyActionNWPrecisionFindingStatus);
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  if (nearbyActionNoWakeAuthTagData)
  {
    v138 = objc_retainAutorelease(nearbyActionNoWakeAuthTagData);
    v139 = xdict;
    v140 = -[NSData bytes](v138, "bytes");
    if (v140)
      v141 = (const char *)v140;
    else
      v141 = "";
    v142 = -[NSData length](v138, "length");

    xpc_dictionary_set_data(v139, "nawA", v141, v142);
  }
  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  if (nearbyActionNoWakeConfigData)
  {
    v144 = objc_retainAutorelease(nearbyActionNoWakeConfigData);
    v145 = xdict;
    v146 = -[NSData bytes](v144, "bytes");
    if (v146)
      v147 = (const char *)v146;
    else
      v147 = "";
    v148 = -[NSData length](v144, "length");

    xpc_dictionary_set_data(v145, "nawC", v147, v148);
  }
  if (self->_objectDiscoveryBatteryState)
    xpc_dictionary_set_uint64(xdict, "odBS", self->_objectDiscoveryBatteryState);
  if (self->_objectDiscoveryMode)
    xpc_dictionary_set_uint64(xdict, "odDM", self->_objectDiscoveryMode);
  objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
  if (objectDiscoveryNearOwnerID)
  {
    v150 = objc_retainAutorelease(objectDiscoveryNearOwnerID);
    v151 = xdict;
    v152 = -[NSData bytes](v150, "bytes");
    if (v152)
      v153 = (const char *)v152;
    else
      v153 = "";
    v154 = -[NSData length](v150, "length");

    xpc_dictionary_set_data(v151, "odNO", v153, v154);
  }
  objectDiscoveryProductID = self->_objectDiscoveryProductID;
  if ((_DWORD)objectDiscoveryProductID)
    xpc_dictionary_set_uint64(xdict, "odPI", objectDiscoveryProductID);
  objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
  if (objectDiscoveryPublicKeyData)
  {
    v157 = objc_retainAutorelease(objectDiscoveryPublicKeyData);
    v158 = xdict;
    v159 = -[NSData bytes](v157, "bytes");
    if (v159)
      v160 = (const char *)v159;
    else
      v160 = "";
    v161 = -[NSData length](v157, "length");

    xpc_dictionary_set_data(v158, "odPK", v160, v161);
  }
  proximityPairingProductID = self->_proximityPairingProductID;
  if ((_DWORD)proximityPairingProductID)
    xpc_dictionary_set_uint64(xdict, "ppPI", proximityPairingProductID);
  if (self->_proximityPairingSubType)
    xpc_dictionary_set_uint64(xdict, "ppST", self->_proximityPairingSubType);
  if (self->_peerStatusFlag)
    xpc_dictionary_set_uint64(xdict, "prSt", self->_peerStatusFlag);
  if (self->_transmitPowerOne)
    xpc_dictionary_set_uint64(xdict, "txP1", self->_transmitPowerOne);
  if (self->_transmitPowerTwo)
    xpc_dictionary_set_uint64(xdict, "txP2", self->_transmitPowerTwo);
  if (self->_transmitPowerThree)
    xpc_dictionary_set_uint64(xdict, "txP3", self->_transmitPowerThree);
  if (self->_proximityServiceCategory)
    xpc_dictionary_set_uint64(xdict, "psCa", self->_proximityServiceCategory);
  proximityServiceClassicAddress = self->_proximityServiceClassicAddress;
  if (proximityServiceClassicAddress)
  {
    v164 = objc_retainAutorelease(proximityServiceClassicAddress);
    v165 = xdict;
    v166 = -[NSData bytes](v164, "bytes");
    if (v166)
      v167 = (const char *)v166;
    else
      v167 = "";
    v168 = -[NSData length](v164, "length");

    xpc_dictionary_set_data(v165, "psCA", v167, v168);
  }
  proximityServiceData = self->_proximityServiceData;
  if (proximityServiceData)
  {
    v170 = objc_retainAutorelease(proximityServiceData);
    v171 = xdict;
    v172 = -[NSData bytes](v170, "bytes");
    if (v172)
      v173 = (const char *)v172;
    else
      v173 = "";
    v174 = -[NSData length](v170, "length");

    xpc_dictionary_set_data(v171, "psDa", v173, v174);
  }
  if (self->_proximityServiceFlags)
    xpc_dictionary_set_uint64(xdict, "psFl", self->_proximityServiceFlags);
  if (self->_proximityServiceMeasuredPower)
    xpc_dictionary_set_int64(xdict, "psMP", self->_proximityServiceMeasuredPower);
  proximityServiceProductID = self->_proximityServiceProductID;
  if ((_DWORD)proximityServiceProductID)
    xpc_dictionary_set_uint64(xdict, "psPI", proximityServiceProductID);
  if (self->_proximityServicePSM)
    xpc_dictionary_set_uint64(xdict, "psPS", self->_proximityServicePSM);
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  if (proximityServiceSetupHash)
  {
    v177 = objc_retainAutorelease(proximityServiceSetupHash);
    v178 = xdict;
    v179 = -[NSData bytes](v177, "bytes");
    if (v179)
      v180 = (const char *)v179;
    else
      v180 = "";
    v181 = -[NSData length](v177, "length");

    xpc_dictionary_set_data(v178, "psSH", v180, v181);
  }
  if (self->_proximityServiceSubType)
    xpc_dictionary_set_uint64(xdict, "psST", self->_proximityServiceSubType);
  if (self->_proximityServiceVendorID)
    xpc_dictionary_set_uint64(xdict, "psVI", self->_proximityServiceVendorID);
  if (self->_proximityServiceVersion)
    xpc_dictionary_set_uint64(xdict, "psVs", self->_proximityServiceVersion);
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  if (safetyAlertsAlertData)
  {
    v183 = objc_retainAutorelease(safetyAlertsAlertData);
    v184 = xdict;
    v185 = -[NSData bytes](v183, "bytes");
    if (v185)
      v186 = (const char *)v185;
    else
      v186 = "";
    v187 = -[NSData length](v183, "length");

    xpc_dictionary_set_data(v184, "saAd", v186, v187);
  }
  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  if (safetyAlertsAlertID)
  {
    v189 = objc_retainAutorelease(safetyAlertsAlertID);
    v190 = xdict;
    v191 = -[NSData bytes](v189, "bytes");
    if (v191)
      v192 = (const char *)v191;
    else
      v192 = "";
    v193 = -[NSData length](v189, "length");

    xpc_dictionary_set_data(v190, "saAi", v192, v193);
  }
  safetyAlertsSignature = self->_safetyAlertsSignature;
  if (safetyAlertsSignature)
  {
    v195 = objc_retainAutorelease(safetyAlertsSignature);
    v196 = xdict;
    v197 = -[NSData bytes](v195, "bytes");
    if (v197)
      v198 = (const char *)v197;
    else
      v198 = "";
    v199 = -[NSData length](v195, "length");

    xpc_dictionary_set_data(v196, "saSg", v198, v199);
  }
  if (self->_safetyAlertsVersion)
    xpc_dictionary_set_uint64(xdict, "saVs", self->_safetyAlertsVersion);
  if (self->_spatialInteractionFlags)
    xpc_dictionary_set_uint64(xdict, "siFl", self->_spatialInteractionFlags);
  CUXPCEncodeNSArrayOfNSData();
  spatialInteractionPeerID = self->_spatialInteractionPeerID;
  if ((_DWORD)spatialInteractionPeerID)
    xpc_dictionary_set_uint64(xdict, "siPI", spatialInteractionPeerID);
  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  if (spatialInteractionUWBConfigData)
  {
    v202 = objc_retainAutorelease(spatialInteractionUWBConfigData);
    v203 = xdict;
    v204 = -[NSData bytes](v202, "bytes");
    if (v204)
      v205 = (const char *)v204;
    else
      v205 = "";
    v206 = -[NSData length](v202, "length");

    xpc_dictionary_set_data(v203, "siUC", v205, v206);
  }
  if (self->_tipiConnectionStatus)
    xpc_dictionary_set_uint64(xdict, "tpCS", self->_tipiConnectionStatus);
  CUXPCEncodeNSArrayOfObjects();
  if (self->_tipiState)
    xpc_dictionary_set_uint64(xdict, "tpSt", self->_tipiState);

}

- (CBDevice)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBDevice *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSMutableDictionary *deviceInfo;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  CBDevice *v120;
  const char *v122;
  const char *v123;
  int v124;
  uint64_t v125;
  objc_super v126;
  unint64_t v127;

  v6 = a3;
  v126.receiver = self;
  v126.super_class = (Class)CBDevice;
  v7 = -[CBDevice init](&v126, sel_init);

  if (!v7)
  {
    if (!a4)
      goto LABEL_320;
    v122 = "CBDevice super init failed";
LABEL_319:
    CBErrorF(-6756, (uint64_t)v122, v8, v9, v10, v11, v12, v13, v125);
    v120 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_314;
  }
  v14 = MEMORY[0x1A85D2194](v6);
  v15 = MEMORY[0x1E0C812F8];
  if (v14 != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_320;
    v122 = "XPC non-dict";
    goto LABEL_319;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_320;
  v127 = 0;
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_adaptiveVolumeCapability = v127;
  }
  else if (v16 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_audioStreamState = v127;
  }
  else if (v17 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_autoAncCapability = v127;
  }
  else if (v18 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_batteryInfoMain = v127;
  }
  else if (v19 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_batteryInfoLeft = v127;
  }
  else if (v20 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_batteryInfoRight = v127;
  }
  else if (v21 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_batteryInfoCase = v127;
  }
  else if (v22 == 5)
  {
    goto LABEL_320;
  }
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeDouble())
    goto LABEL_320;
  v127 = 0;
  v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_bleAdvertisementTimestampMachContinuous = v127;
  }
  else if (v23 == 5)
  {
    goto LABEL_320;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_320;
  v127 = 0;
  v24 = CUXPCDecodeSInt64RangedEx();
  if (v24 == 6)
  {
    v7->_bleChannel = v127;
  }
  else if (v24 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v25 = CUXPCDecodeSInt64RangedEx();
  if (v25 == 6)
  {
    v7->_bleRSSI = v127;
  }
  else if (v25 == 5)
  {
    goto LABEL_320;
  }
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSString())
    goto LABEL_320;
  v127 = 0;
  v26 = CUXPCDecodeUInt64RangedEx();
  if (v26 == 6)
  {
    v7->_changeFlags = v127;
  }
  else if (v26 == 5)
  {
    goto LABEL_320;
  }
  if (!CBXPCDecodeDiscoveryTypes(v6, "chTy", &v7->_changedTypesInternal))
    goto LABEL_320;
  v127 = 0;
  v27 = CUXPCDecodeSInt64RangedEx();
  if (v27 == 6)
  {
    v7->_classicRSSI = v127;
  }
  else if (v27 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v7->_colorInfo = v127;
  }
  else if (v28 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 == 6)
  {
    v7->_connectedServices = v127;
  }
  else if (v29 == 5)
  {
    goto LABEL_320;
  }
  v127 = 0;
  v30 = CUXPCDecodeUInt64RangedEx();
  if (v30 == 6)
  {
    v7->_conversationDetectCapability = v127;
  }
  else if (v30 == 5)
  {
    goto LABEL_320;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_320;
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_320;
  v127 = 0;
  v31 = CUXPCDecodeUInt64RangedEx();
  if (v31 == 6)
  {
    v7->_deviceFlags = v127;
    goto LABEL_60;
  }
  if (v31 == 5)
  {
LABEL_320:
    v120 = 0;
    goto LABEL_314;
  }
LABEL_60:
  xpc_dictionary_get_value(v6, "dvIn");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (!v32)
    goto LABEL_65;
  if (MEMORY[0x1A85D2194](v32) != v15)
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"Bad DeviceInfo XPC type", v34, v35, v36, v37, v38, v39, v125);
      v120 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_313;
    }
    goto LABEL_323;
  }
  v46 = (void *)CUXPCCreateCFObjectFromXPCObject();
  if (!v46)
  {
    if (a4)
    {
      v123 = "XPC->CF failed";
      v124 = -6732;
LABEL_328:
      CBErrorF(v124, (uint64_t)v123, v40, v41, v42, v43, v44, v45, v125);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_329:

    v120 = 0;
    goto LABEL_313;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v123 = "Bad DeviceInfo NS type";
      v124 = -6756;
      goto LABEL_328;
    }
    goto LABEL_329;
  }
  v47 = objc_msgSend(v46, "mutableCopy");
  deviceInfo = v7->_deviceInfo;
  v7->_deviceInfo = (NSMutableDictionary *)v47;

LABEL_65:
  v127 = 0;
  v49 = CUXPCDecodeUInt64RangedEx();
  if (v49 == 6)
  {
    v7->_deviceType = v127;
  }
  else if (v49 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v50 = CUXPCDecodeUInt64RangedEx();
  if (v50 == 6)
  {
    v7->_discoveryFlags = v127;
  }
  else if (v50 == 5)
  {
    goto LABEL_323;
  }
  if (!CBXPCDecodeDiscoveryTypes(v6, "dsTy", &v7->_discoveryTypesInternal))
    goto LABEL_323;
  v127 = 0;
  v51 = CUXPCDecodeSInt64RangedEx();
  if (v51 == 6)
  {
    v7->_doubleTapActionLeft = v127;
  }
  else if (v51 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v52 = CUXPCDecodeSInt64RangedEx();
  if (v52 == 6)
  {
    v7->_doubleTapActionRight = v127;
  }
  else if (v52 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v53 = CUXPCDecodeSInt64RangedEx();
  if (v53 == 6)
  {
    v7->_doubleTapCapability = v127;
  }
  else if (v53 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v54 = CUXPCDecodeUInt64RangedEx();
  if (v54 == 6)
  {
    v7->_endCallCapability = v127;
  }
  else if (v54 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString())
    goto LABEL_323;
  v127 = 0;
  v55 = CUXPCDecodeUInt64RangedEx();
  if (v55 == 6)
  {
    v7->_interval = v127;
  }
  else if (v55 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString())
    goto LABEL_323;
  v127 = 0;
  v56 = CUXPCDecodeSInt64RangedEx();
  if (v56 == 6)
  {
    v7->_microphoneMode = v127;
  }
  else if (v56 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_323;
  v127 = 0;
  v57 = CUXPCDecodeUInt64RangedEx();
  if (v57 == 6)
  {
    v7->_muteControlCapability = v127;
  }
  else if (v57 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_323;
  v127 = 0;
  v58 = CUXPCDecodeSInt64RangedEx();
  if (v58 == 6)
  {
    v7->_primaryPlacement = v127;
  }
  else if (v58 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v59 = CUXPCDecodeSInt64RangedEx();
  if (v59 == 6)
  {
    v7->_secondaryPlacement = v127;
  }
  else if (v59 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v60 = CUXPCDecodeSInt64RangedEx();
  if (v60 == 6)
  {
    v7->_placementMode = v127;
  }
  else if (v60 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v61 = CUXPCDecodeUInt64RangedEx();
  if (v61 == 6)
  {
    v7->_productID = v127;
  }
  else if (v61 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_323;
  }
  v127 = 0;
  v62 = CUXPCDecodeSInt64RangedEx();
  if (v62 == 6)
  {
    v7->_smartRoutingMode = v127;
  }
  else if (v62 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v63 = CUXPCDecodeUInt64RangedEx();
  if (v63 == 6)
  {
    v7->_supportedServices = v127;
  }
  else if (v63 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_323;
  v127 = 0;
  v64 = CUXPCDecodeUInt64RangedEx();
  if (v64 == 6)
  {
    v7->_vendorID = v127;
  }
  else if (v64 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v65 = CUXPCDecodeUInt64RangedEx();
  if (v65 == 6)
  {
    v7->_vendorIDSource = v127;
  }
  else if (v65 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v66 = CUXPCDecodeUInt64RangedEx();
  if (v66 == 6)
  {
    v7->_airdropFlags = v127;
  }
  else if (v66 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_323;
  v127 = 0;
  v67 = CUXPCDecodeUInt64RangedEx();
  if (v67 == 6)
  {
    v7->_airdropModel = v127;
  }
  else if (v67 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v68 = CUXPCDecodeUInt64RangedEx();
  if (v68 == 6)
  {
    v7->_airdropVersion = v127;
  }
  else if (v68 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v69 = CUXPCDecodeUInt64RangedEx();
  if (v69 == 6)
  {
    v7->_airdropHash1 = v127;
  }
  else if (v69 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v70 = CUXPCDecodeUInt64RangedEx();
  if (v70 == 6)
  {
    v7->_airdropHash2 = v127;
  }
  else if (v70 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v71 = CUXPCDecodeUInt64RangedEx();
  if (v71 == 6)
  {
    v7->_airdropHash3 = v127;
  }
  else if (v71 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v72 = CUXPCDecodeUInt64RangedEx();
  if (v72 == 6)
  {
    v7->_airdropHash4 = v127;
  }
  else if (v72 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v73 = CUXPCDecodeUInt64RangedEx();
  if (v73 == 6)
  {
    v7->_airdropConfigData = v127;
  }
  else if (v73 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_323;
  v127 = 0;
  v74 = CUXPCDecodeUInt64RangedEx();
  if (v74 == 6)
  {
    v7->_airplaySourceFlags = v127;
  }
  else if (v74 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v75 = CUXPCDecodeUInt64RangedEx();
  if (v75 == 6)
  {
    v7->_airplayTargetConfigSeed = v127;
  }
  else if (v75 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v76 = CUXPCDecodeUInt64RangedEx();
  if (v76 == 6)
  {
    v7->_airplayTargetFlags = v127;
  }
  else if (v76 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v77 = CUXPCDecodeUInt64RangedEx();
  if (v77 == 6)
  {
    v7->_airplayTargetIPv4 = v127;
  }
  else if (v77 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v78 = CUXPCDecodeUInt64RangedEx();
  if (v78 == 6)
  {
    v7->_homeKitV1Category = v127;
  }
  else if (v78 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v79 = CUXPCDecodeUInt64RangedEx();
  if (v79 == 6)
  {
    v7->_homeKitV1CompatibleVersion = v127;
  }
  else if (v79 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v80 = CUXPCDecodeUInt64RangedEx();
  if (v80 == 6)
  {
    v7->_homeKitV1ConfigurationNumber = v127;
  }
  else if (v80 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_323;
  v127 = 0;
  v81 = CUXPCDecodeUInt64RangedEx();
  if (v81 == 6)
  {
    v7->_homeKitV1Flags = v127;
  }
  else if (v81 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v82 = CUXPCDecodeUInt64RangedEx();
  if (v82 == 6)
  {
    v7->_homeKitV1StateNumber = v127;
  }
  else if (v82 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v83 = CUXPCDecodeUInt64RangedEx();
  if (v83 == 6)
  {
    v7->_homeKitV1SetupHash = v127;
  }
  else if (v83 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSDataOfLength())
    goto LABEL_323;
  v127 = 0;
  v84 = CUXPCDecodeUInt64RangedEx();
  if (v84 == 6)
  {
    v7->_homeKitV2InstanceID = v127;
  }
  else if (v84 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v85 = CUXPCDecodeUInt64RangedEx();
  if (v85 == 6)
  {
    v7->_homeKitV2StateNumber = v127;
  }
  else if (v85 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v86 = CUXPCDecodeUInt64RangedEx();
  if (v86 == 6)
  {
    v7->_homeKitV2Value = v127;
  }
  else if (v86 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v87 = CUXPCDecodeUInt64RangedEx();
  if (v87 == 6)
  {
    v7->_nearbyActionFlags = v127;
  }
  else if (v87 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v88 = CUXPCDecodeUInt64RangedEx();
  if (v88 == 6)
  {
    v7->_nearbyActionType = v127;
  }
  else if (v88 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_323;
  v127 = 0;
  v89 = CUXPCDecodeUInt64RangedEx();
  if (v89 == 6)
  {
    v7->_nearbyInfoFlags = v127;
  }
  else if (v89 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v90 = CUXPCDecodeUInt64RangedEx();
  if (v90 == 6)
  {
    v7->_nearbyInfoV2DecryptedFlags = v127;
  }
  else if (v90 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v91 = CUXPCDecodeUInt64RangedEx();
  if (v91 == 6)
  {
    v7->_nearbyInfoV2Flags = v127;
  }
  else if (v91 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData())
    goto LABEL_323;
  v127 = 0;
  v92 = CUXPCDecodeUInt64RangedEx();
  if (v92 == 6)
  {
    v7->_nearbyInfoV2InvitationCounter = v127;
  }
  else if (v92 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v93 = CUXPCDecodeUInt64RangedEx();
  if (v93 == 6)
  {
    v7->_nearbyInfoV2InvitationTypes = v127;
  }
  else if (v93 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v94 = CUXPCDecodeUInt64RangedEx();
  if (v94 == 6)
  {
    v7->_nearbyInfoV2InvitationRouteType = v127;
  }
  else if (v94 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v95 = CUXPCDecodeUInt64RangedEx();
  if (v95 == 6)
  {
    v7->_objectDiscoveryBatteryState = v127;
  }
  else if (v95 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v96 = CUXPCDecodeUInt64RangedEx();
  if (v96 == 6)
  {
    v7->_objectDiscoveryMode = v127;
  }
  else if (v96 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_323;
  v127 = 0;
  v97 = CUXPCDecodeUInt64RangedEx();
  if (v97 == 6)
  {
    v7->_objectDiscoveryProductID = v127;
  }
  else if (v97 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_323;
  v127 = 0;
  v98 = CUXPCDecodeUInt64RangedEx();
  if (v98 == 6)
  {
    v7->_proximityPairingProductID = v127;
  }
  else if (v98 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v99 = CUXPCDecodeUInt64RangedEx();
  if (v99 == 6)
  {
    v7->_proximityPairingSubType = v127;
  }
  else if (v99 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v100 = CUXPCDecodeUInt64RangedEx();
  if (v100 == 6)
  {
    v7->_peerStatusFlag = v127;
  }
  else if (v100 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v101 = CUXPCDecodeUInt64RangedEx();
  if (v101 == 6)
  {
    v7->_transmitPowerOne = v127;
  }
  else if (v101 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v102 = CUXPCDecodeUInt64RangedEx();
  if (v102 == 6)
  {
    v7->_transmitPowerTwo = v127;
  }
  else if (v102 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v103 = CUXPCDecodeUInt64RangedEx();
  if (v103 == 6)
  {
    v7->_transmitPowerThree = v127;
  }
  else if (v103 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v104 = CUXPCDecodeUInt64RangedEx();
  if (v104 == 6)
  {
    v7->_proximityServiceCategory = v127;
  }
  else if (v104 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData())
    goto LABEL_323;
  v127 = 0;
  v105 = CUXPCDecodeUInt64RangedEx();
  if (v105 == 6)
  {
    v7->_proximityServiceFlags = v127;
  }
  else if (v105 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v106 = CUXPCDecodeSInt64RangedEx();
  if (v106 == 6)
  {
    v7->_proximityServiceMeasuredPower = v127;
  }
  else if (v106 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v107 = CUXPCDecodeUInt64RangedEx();
  if (v107 == 6)
  {
    v7->_proximityServiceProductID = v127;
  }
  else if (v107 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v108 = CUXPCDecodeUInt64RangedEx();
  if (v108 == 6)
  {
    v7->_proximityServicePSM = v127;
  }
  else if (v108 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_323;
  v127 = 0;
  v109 = CUXPCDecodeUInt64RangedEx();
  if (v109 == 6)
  {
    v7->_proximityServiceSubType = v127;
  }
  else if (v109 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v110 = CUXPCDecodeUInt64RangedEx();
  if (v110 == 6)
  {
    v7->_proximityServiceVendorID = v127;
  }
  else if (v110 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v111 = CUXPCDecodeUInt64RangedEx();
  if (v111 == 6)
  {
    v7->_proximityServiceVersion = v127;
  }
  else if (v111 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSDataOfLength())
  {
    goto LABEL_323;
  }
  v127 = 0;
  v112 = CUXPCDecodeUInt64RangedEx();
  if (v112 == 6)
  {
    v7->_safetyAlertsVersion = v127;
  }
  else if (v112 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v113 = CUXPCDecodeUInt64RangedEx();
  if (v113 == 6)
  {
    v7->_selectiveSpeechListeningCapability = v127;
  }
  else if (v113 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v114 = CUXPCDecodeUInt64RangedEx();
  if (v114 == 6)
  {
    v7->_spatialInteractionFlags = v127;
  }
  else if (v114 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSArrayOfNSData())
    goto LABEL_323;
  v127 = 0;
  v115 = CUXPCDecodeUInt64RangedEx();
  if (v115 == 6)
  {
    v7->_spatialInteractionPeerID = v127;
  }
  else if (v115 == 5)
  {
    goto LABEL_323;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_323;
  v127 = 0;
  v116 = CUXPCDecodeUInt64RangedEx();
  if (v116 == 6)
  {
    v7->_tipiConnectionStatus = v127;
  }
  else if (v116 == 5)
  {
    goto LABEL_323;
  }
  objc_opt_class();
  if (!CUXPCDecodeNSArrayOfClass())
    goto LABEL_323;
  v127 = 0;
  v117 = CUXPCDecodeUInt64RangedEx();
  if (v117 == 6)
  {
    v7->_tipiState = v127;
  }
  else if (v117 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v118 = CUXPCDecodeUInt64RangedEx();
  if (v118 == 6)
  {
    v7->_nearbyActionNoWakeType = v127;
  }
  else if (v118 == 5)
  {
    goto LABEL_323;
  }
  v127 = 0;
  v119 = CUXPCDecodeUInt64RangedEx();
  if (v119 != 6)
  {
    if (v119 != 5)
      goto LABEL_309;
LABEL_323:
    v120 = 0;
    goto LABEL_313;
  }
  v7->_nearbyActionNWPrecisionFindingStatus = v127;
LABEL_309:
  if (!CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeBool())
  {
    goto LABEL_323;
  }
  v120 = v7;
LABEL_313:

LABEL_314:
  return v120;
}

- (void)setHeySiriSNR:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("l"), v4);

}

- (void)setHeySiriRandom:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("k"), v4);

}

- (void)setHeySiriPerceptualHash:(unsigned __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("i"), v4);

}

- (void)setHeySiriDeviceClass:(unsigned __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("h"), v4);

}

- (void)setHeySiriConfidence:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("g"), v4);

}

- (unsigned)nearbyInfoV2Flags
{
  return self->_nearbyInfoV2Flags;
}

- (unsigned)nearbyInfoV2EncryptedFlags
{
  return self->_nearbyInfoV2EncryptedFlags;
}

- (NSData)nearbyInfoV2AuthIntegrityTagData
{
  return self->_nearbyInfoV2AuthIntegrityTagData;
}

- (unsigned)heySiriSNR
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)heySiriRandom
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)heySiriProductType
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)heySiriPerceptualHash
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)heySiriDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)heySiriConfidence
{
  return CFDictionaryGetInt64Ranged();
}

- (void)_parseObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4
{
  const char *v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  NSData *v11;
  uint64_t v12;
  __int16 v13;
  NSData *v14;
  NSData *objectDiscoveryNearOwnerID;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  NSData *v19;
  int v20;
  __int16 v21;
  _BYTE v22[22];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a4 - a3 >= 1)
  {
    v7 = a3 + 1;
    v8 = *(unsigned __int8 *)a3;
    v9 = (v8 >> 4) & 3;
    if ((_DWORD)v9 == 3)
      v10 = 0;
    else
      v10 = dword_1A8336F98[v9];
    v11 = self->_btAddressData;
    if (-[NSData length](v11, "length") != 6)
      goto LABEL_19;
    if (a4 - v7 < 22)
    {
      v17 = -[NSData bytes](objc_retainAutorelease(v11), "bytes");
      v18 = *(_WORD *)(v17 + 4);
      v20 = *(_DWORD *)v17;
      v21 = v18;
      if (a4 - v7 >= 1)
        LOBYTE(v20) = v20 & 0x3F | (*v7 << 6);
      v14 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v20, 6);
      self->_objectDiscoveryBatteryState = v8 >> 6;
      self->_objectDiscoveryMode = 1;
      self->_objectDiscoveryProductID = v10;
      if (!v14)
      {
        v16 = 0x20000000000;
        goto LABEL_18;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
      self->_objectDiscoveryNearOwnerID = v14;
      v16 = 0x20000000000;
    }
    else
    {
      v12 = -[NSData bytes](objc_retainAutorelease(v11), "bytes");
      v13 = *(_WORD *)(v12 + 4);
      v20 = *(_DWORD *)v12;
      v21 = v13;
      *(_OWORD *)v22 = *(_OWORD *)v7;
      *(_QWORD *)&v22[14] = *(_QWORD *)(v7 + 14);
      if (a4 - (a3 + 23) >= 1)
        LOBYTE(v20) = v20 & 0x3F | (a3[23] << 6);
      v14 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v20, 28);
      self->_objectDiscoveryBatteryState = v8 >> 6;
      self->_objectDiscoveryMode = 2;
      self->_objectDiscoveryProductID = v10;
      if (!v14)
      {
        v16 = 0x40000000000;
        goto LABEL_18;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryPublicKeyData;
      self->_objectDiscoveryPublicKeyData = v14;
      v16 = 0x40000000000;
    }
    v19 = v14;

LABEL_18:
    self->_discoveryFlags |= v16;
LABEL_19:

  }
}

- (void)_parseNearbyInfoV2Ptr:(const char *)a3 end:(const char *)a4
{
  int v7;
  int v8;
  NSData *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  NSData *v17;
  char v18;
  NSData *nearbyInfoV2AuthTagData;
  NSData *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  NSData *v31;

  if (a4 - a3 >= 1)
  {
    if ((uint64_t)&a4[~(unint64_t)a3] < 1 || a4 - (a3 + 2) < 3)
    {
      v9 = 0;
    }
    else
    {
      v7 = *(unsigned __int8 *)a3;
      v8 = *((unsigned __int8 *)a3 + 1);
      v9 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 2, 3);
      if (a4 - (a3 + 5) >= 3)
      {
        v31 = v9;
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 5, 3);
        if (!v10)
        {
LABEL_47:
          v9 = v31;
          goto LABEL_10;
        }
        v11 = (void *)v10;
        v12 = a3 + 8;
        if (a4 - v12 < 2)
        {
          v13 = 0;
          if ((v7 & 4) == 0)
            goto LABEL_14;
        }
        else
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v12, 2);
          if ((v7 & 4) == 0)
          {
LABEL_14:
            v14 = -[CBDevice nearbyInfoV2Flags](self, "nearbyInfoV2Flags");
            v15 = v7 != v14;
            if (v7 == v14)
            {
              if (v8 == -[CBDevice nearbyInfoV2EncryptedFlags](self, "nearbyInfoV2EncryptedFlags"))
                goto LABEL_21;
            }
            else
            {
              if ((v7 & 4) != (-[CBDevice nearbyInfoV2Flags](self, "nearbyInfoV2Flags") & 4))
                self->_changedTypesInternal.bitArray[2] |= 8u;
              self->_nearbyInfoV2Flags = v7;
              if (v8 == -[CBDevice nearbyInfoV2EncryptedFlags](self, "nearbyInfoV2EncryptedFlags"))
              {
LABEL_21:
                -[CBDevice nearbyInfoV2AuthTagData](self, "nearbyInfoV2AuthTagData");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v31;
                v17 = v16;
                if (v31 == v17)
                {

                  nearbyInfoV2AuthTagData = v31;
                }
                else
                {
                  if ((v31 == 0) != (v17 != 0))
                  {
                    v18 = -[NSData isEqual:](v31, "isEqual:", v17);

                    if ((v18 & 1) != 0)
                    {
LABEL_29:
                      -[CBDevice nearbyInfoV2AuthIntegrityTagData](self, "nearbyInfoV2AuthIntegrityTagData");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      v22 = v11;
                      v23 = v21;
                      if (v22 == v23)
                      {

                        goto LABEL_36;
                      }
                      v24 = v23;
                      if (v23)
                      {
                        v25 = objc_msgSend(v22, "isEqual:", v23);

                        if ((v25 & 1) != 0)
                        {
LABEL_36:
                          -[CBDevice nearbyInfoV2EncryptedData](self, "nearbyInfoV2EncryptedData");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          v27 = v13;
                          v28 = v26;
                          if (v27 == v28)
                          {

                          }
                          else
                          {
                            v29 = v28;
                            if ((v27 == 0) == (v28 != 0))
                            {

LABEL_44:
                              objc_storeStrong((id *)&self->_nearbyInfoV2EncryptedData, v13);
                              self->_discoveryTypesInternal.bitArray[0] |= 0x10u;
LABEL_45:
                              self->_changedTypesInternal.bitArray[0] |= 0x10u;
LABEL_46:

                              goto LABEL_47;
                            }
                            v30 = objc_msgSend(v27, "isEqual:", v28);

                            if ((v30 & 1) == 0)
                              goto LABEL_44;
                          }
                          self->_discoveryTypesInternal.bitArray[0] |= 0x10u;
                          if (!v15)
                            goto LABEL_46;
                          goto LABEL_45;
                        }
                      }
                      else
                      {

                      }
                      objc_storeStrong((id *)&self->_nearbyInfoV2AuthIntegrityTagData, v11);
                      v15 = 1;
                      goto LABEL_36;
                    }
                  }
                  else
                  {

                  }
                  v20 = v31;
                  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
                  self->_nearbyInfoV2AuthTagData = v20;
                  v15 = 1;
                }

                goto LABEL_29;
              }
            }
            self->_nearbyInfoV2EncryptedFlags = v8;
            v15 = 1;
            goto LABEL_21;
          }
        }
        self->_discoveryTypesInternal.bitArray[2] |= 8u;
        goto LABEL_14;
      }
    }
LABEL_10:

    return;
  }

}

- (void)_parseHeySiriPtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v11;
  uint64_t v12;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v22;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 < 2)
  {
    v8 = 0;
    if (-[CBDevice heySiriPerceptualHash](self, "heySiriPerceptualHash"))
    {
LABEL_3:
      -[CBDevice setHeySiriPerceptualHash:](self, "setHeySiriPerceptualHash:", v8);
      v9 = 0x400000000000000;
      v11 = v7 > 1 && a4 - v5 > 0;
      if (!v11)
        goto LABEL_10;
LABEL_20:
      v14 = *(unsigned __int8 *)v5++;
      v12 = v14;
      if (v14 == -[CBDevice heySiriSNR](self, "heySiriSNR"))
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else
  {
    v5 = a3 + 2;
    v8 = bswap32(*(unsigned __int16 *)a3) >> 16;
    if ((_DWORD)v8 != -[CBDevice heySiriPerceptualHash](self, "heySiriPerceptualHash"))
      goto LABEL_3;
  }
  v9 = 0;
  v11 = v7 > 1 && a4 - v5 > 0;
  if (v11)
    goto LABEL_20;
LABEL_10:
  v12 = 0;
  if (-[CBDevice heySiriSNR](self, "heySiriSNR"))
  {
LABEL_21:
    -[CBDevice setHeySiriSNR:](self, "setHeySiriSNR:", v12);
    v9 = 0x400000000000000;
  }
LABEL_22:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v15 = 0;
    if (!-[CBDevice heySiriConfidence](self, "heySiriConfidence"))
      goto LABEL_29;
    goto LABEL_28;
  }
  v16 = *(unsigned __int8 *)v5++;
  v15 = v16;
  if (v16 != -[CBDevice heySiriConfidence](self, "heySiriConfidence"))
  {
LABEL_28:
    -[CBDevice setHeySiriConfidence:](self, "setHeySiriConfidence:", v15);
    v9 = 0x400000000000000;
  }
LABEL_29:
  if (a4 - v5 <= 1)
    v11 = 0;
  if (!v11)
  {
    v18 = 0;
    if (!-[CBDevice heySiriDeviceClass](self, "heySiriDeviceClass"))
      goto LABEL_36;
    goto LABEL_35;
  }
  v17 = *(unsigned __int16 *)v5;
  v5 += 2;
  v18 = bswap32(v17) >> 16;
  if ((_DWORD)v18 != -[CBDevice heySiriDeviceClass](self, "heySiriDeviceClass"))
  {
LABEL_35:
    -[CBDevice setHeySiriDeviceClass:](self, "setHeySiriDeviceClass:", v18);
    v9 = 0x400000000000000;
  }
LABEL_36:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v19 = 0;
    if (!-[CBDevice heySiriRandom](self, "heySiriRandom"))
      goto LABEL_43;
    goto LABEL_42;
  }
  v20 = *(unsigned __int8 *)v5++;
  v19 = v20;
  if (v20 != -[CBDevice heySiriRandom](self, "heySiriRandom"))
  {
LABEL_42:
    -[CBDevice setHeySiriRandom:](self, "setHeySiriRandom:", v19);
    v9 |= 0x400000000000000uLL;
  }
LABEL_43:
  if (a4 - v5 > 0 && v11)
  {
    v22 = *(unsigned __int8 *)v5;
    if ((_DWORD)v22 == -[CBDevice heySiriProductType](self, "heySiriProductType"))
      goto LABEL_51;
    goto LABEL_50;
  }
  v22 = 0;
  if (-[CBDevice heySiriProductType](self, "heySiriProductType"))
  {
LABEL_50:
    -[CBDevice setHeySiriProductType:](self, "setHeySiriProductType:", v22);
    v9 |= 0x400000000000000uLL;
  }
LABEL_51:
  self->_discoveryFlags |= 0x400000000000000uLL;
  self->_changeFlags |= v9;
}

- (void)_parseAirPlaySourcePtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  _BOOL4 v7;
  char v8;
  uint64_t v9;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  NSData *airplaySourceAuthTagData;
  NSData *v19;
  NSData *v20;
  char v21;
  NSData *v22;
  id v23;

  v5 = a3;
  v7 = a4 - a3 > 0;
  if (a4 - a3 >= 1)
  {
    v5 = a3 + 1;
    v8 = *a3;
    if (*(unsigned __int8 *)a3 == self->_airplaySourceFlags)
      goto LABEL_3;
LABEL_10:
    self->_airplaySourceFlags = v8;
    v9 = 0x4000000000;
    if ((v8 & 8) != 0)
      goto LABEL_4;
    goto LABEL_11;
  }
  v8 = 0;
  if (self->_airplaySourceFlags)
    goto LABEL_10;
LABEL_3:
  v9 = 0;
  if ((v8 & 8) != 0)
  {
LABEL_4:
    v23 = 0;
    v7 = 0;
    if (a4 - a3 >= 1 && a4 - v5 >= 1)
    {
      v7 = 1;
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5++, 1);
    }
    if ((v8 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_12;
  }
LABEL_11:
  v23 = 0;
  if ((v8 & 0x10) == 0)
    goto LABEL_18;
LABEL_12:
  if (a4 - v5 > 2 && v7)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5, 3);
    if ((v8 & 8) == 0)
      goto LABEL_25;
    goto LABEL_19;
  }
LABEL_18:
  v11 = 0;
  if ((v8 & 8) == 0)
    goto LABEL_25;
LABEL_19:
  -[CBDevice airplaySourceUWBConfigData](self, "airplaySourceUWBConfigData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_25;
  }
  v15 = v14;
  if ((v13 == 0) != (v14 != 0))
  {
    v16 = objc_msgSend(v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
    {
      -[CBDevice setAirplaySourceUWBConfigData:](self, "setAirplaySourceUWBConfigData:", v13);
      v9 = 0x4000000000;
      if ((v8 & 0x10) == 0)
        goto LABEL_36;
      goto LABEL_26;
    }
LABEL_25:
    if ((v8 & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_26;
  }

  -[CBDevice setAirplaySourceUWBConfigData:](self, "setAirplaySourceUWBConfigData:", v13);
  v9 = 0x4000000000;
  if ((v8 & 0x10) == 0)
    goto LABEL_36;
LABEL_26:
  -[CBDevice airplaySourceAuthTagData](self, "airplaySourceAuthTagData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  airplaySourceAuthTagData = v11;
  v19 = v17;
  if (airplaySourceAuthTagData == v19)
  {

  }
  else
  {
    v20 = v19;
    if ((airplaySourceAuthTagData == 0) == (v19 != 0))
    {

    }
    else
    {
      v21 = -[NSData isEqual:](airplaySourceAuthTagData, "isEqual:", v19);

      if ((v21 & 1) != 0)
        goto LABEL_36;
    }
    v22 = airplaySourceAuthTagData;
    airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
    self->_airplaySourceAuthTagData = v22;
    v9 = 0x4000000000;
  }

LABEL_36:
  self->_discoveryFlags |= 0x4000000000uLL;
  self->_changeFlags |= v9;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDevice)initWithXPCEventRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBDevice *v13;
  uint64_t v14;
  NSData *btAddressData;
  const char *string;
  uint64_t v17;
  NSString *identifier;
  int64_t int64;
  CBDevice *v20;
  const char *v22;
  uint64_t v23;
  int v24;
  __int16 v25;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CBDevice;
  v13 = -[CBDevice init](&v26, sel_init);
  if (!v13)
  {
    if (a4)
    {
      v22 = "CBDevice super init failed";
LABEL_16:
      CBErrorF(-6756, (uint64_t)v22, v7, v8, v9, v10, v11, v12, v23);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_17:
    v20 = 0;
    goto LABEL_11;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      v22 = "XPC non-dict";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (xpc_dictionary_get_string(v6, "btAddress"))
  {
    v25 = 0;
    v24 = 0;
    if (!TextToHardwareAddress())
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v24, 6);
      btAddressData = v13->_btAddressData;
      v13->_btAddressData = (NSData *)v14;

    }
  }
  string = xpc_dictionary_get_string(v6, "deviceID");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v17;

  }
  int64 = xpc_dictionary_get_int64(v6, "deviceClass");
  if (int64)
    -[CBDevice setNearbyActionDeviceClass:](v13, "setNearbyActionDeviceClass:", int64);
  v20 = v13;
LABEL_11:

  return v20;
}

- (OS_xpc_object)xpcEventRepresentation
{
  xpc_object_t v3;
  NSData *v4;
  NSData *v5;
  const char *v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = self->_btAddressData;
  v5 = v4;
  if (v4 && -[NSData length](v4, "length") == 6)
  {
    LOWORD(v10) = 0;
    -[NSData bytes](objc_retainAutorelease(v5), "bytes", 0, 0, v10, v11);
    HardwareAddressToCString();
    xpc_dictionary_set_string(v3, "btAddress", (const char *)&v9);
  }

  v6 = -[NSString UTF8String](self->_identifier, "UTF8String");
  if (v6)
    xpc_dictionary_set_string(v3, "deviceID", v6);
  v7 = -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass");
  if (v7)
    xpc_dictionary_set_int64(v3, "deviceClass", v7);
  return (OS_xpc_object *)v3;
}

- (CBDevice)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CBDevice *v9;
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

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16, v17, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("devi"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CBDevice initWithDictionary:error:](self, "initWithDictionary:error:", v8, 0);
  return v9;
}

- (CBDevice)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CBDevice *v13;
  uint64_t v15;

  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = -[CBDevice initWithXPCObject:error:](self, "initWithXPCObject:error:", v12, a4);
    v13 = self;
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBDevice convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CBDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("devi"));

}

- (id)dictionaryRepresentation
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[CBDevice encodeWithXPCObject:](self, "encodeWithXPCObject:", v3);
  v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = v4;

  return v6;
}

void __33__CBDevice_descriptionWithLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id obj;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  v5 = a3;
  objc_msgSend(a2, "unsignedIntValue");
  CUDescriptionWithLevel();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CUPrintNSObjectOneLine();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v4 + 40), obj);

}

- (float)batteryLevelMain
{
  return (float)(self->_batteryInfoMain & 0x7F) / 100.0;
}

- (unsigned)batteryStateMain
{
  return HIBYTE(self->_batteryInfoMain) & 7;
}

- (float)batteryLevelLeft
{
  return (float)(self->_batteryInfoLeft & 0x7F) / 100.0;
}

- (unsigned)batteryStateLeft
{
  return HIBYTE(self->_batteryInfoLeft) & 7;
}

- (float)batteryLevelRight
{
  return (float)(self->_batteryInfoRight & 0x7F) / 100.0;
}

- (unsigned)batteryStateRight
{
  return HIBYTE(self->_batteryInfoRight) & 7;
}

- (float)batteryLevelCase
{
  return (float)(self->_batteryInfoCase & 0x7F) / 100.0;
}

- (unsigned)batteryStateCase
{
  return HIBYTE(self->_batteryInfoCase) & 7;
}

- ($A0BF7C2F34202597F9F30F6CD4123348)changedTypesInternalPtr
{
  return ($A0BF7C2F34202597F9F30F6CD4123348 *)&self->_changedTypesInternal;
}

- (unsigned)colorCodeBest
{
  unsigned int colorInfo_low;
  unsigned int v3;
  int v4;
  unsigned __int8 result;

  switch(self->_productID)
  {
    case 0x200Au:
    case 0x201Fu:
      result = self->_colorInfo & 0x1F;
      break;
    case 0x200Bu:
    case 0x2011u:
    case 0x2012u:
      colorInfo_low = LOBYTE(self->_colorInfo);
      v3 = colorInfo_low >> 4;
      v4 = colorInfo_low & 0xF;
      if (v4 == 15)
        LOBYTE(v4) = 0;
      if (v3 == 15)
        result = v4;
      else
        result = v3;
      break;
    default:
      result = self->_colorInfo;
      break;
  }
  return result;
}

- (unsigned)colorFlags
{
  return HIBYTE(self->_colorInfo) & 1;
}

- ($A0BF7C2F34202597F9F30F6CD4123348)discoveryTypesInternalPtr
{
  return ($A0BF7C2F34202597F9F30F6CD4123348 *)&self->_discoveryTypesInternal;
}

- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("aVC"), v4);

}

- (void)setAppearanceValue:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("a"), v4);

}

- (void)setBtVersion:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("btV"), a3);
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("clHL"), v4);

}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("clHR"), v4);

}

- (void)setConversationDetectConfig:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("cDC"), v4);

}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("crRD"), v4);

}

- (void)setEndCallConfig:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("eCC"), v4);

}

- (void)setFindMyCaseIdentifier:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("fmCI"), a3);
}

- (void)setFindMyGroupIdentifier:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("fmGI"), a3);
}

- (unsigned)frequencyBand
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("bndI"), v4);

}

- (void)setGapaFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("gapa"), v4);

}

- (NSData)irkData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setIrkData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("m"), a3);
}

- (NSData)linkKeyData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setLinkKeyData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("n"), a3);
}

- (void)setListeningMode:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("lsnM"), v4);

}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("lsMC"), v4);

}

- (NSData)ltkData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setLtkData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("o"), a3);
}

- (void)setModelUser:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("modU"), a3);
}

- (void)setMuteControlConfig:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("mCC"), v4);

}

- (void)setSpatialAudioMode:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("spAM"), v4);

}

- (unsigned)accessoryStatusLidOpenCount
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAccessoryStatusLidOpenCount:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("asLO"), v4);

}

- (unsigned)accessoryStatusFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAccessoryStatusFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("asFl"), v4);

}

- (double)accessoryStatusOBCTime
{
  double result;

  CFDictionaryGetDouble();
  return result;
}

- (void)setAccessoryStatusOBCTime:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("asOT"), v4);

}

- (NSData)airplaySourceUWBConfigData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setAirplaySourceUWBConfigData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("apUW"), a3);
}

- (unsigned)airplayTargetPort
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAirplayTargetPort:(unsigned __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("apTP"), v4);

}

- (unsigned)dsActionFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionFlags:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("dsAF"), v4);

}

- (char)dsActionMeasuredPower
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionMeasuredPower:(char)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("dsAP"), v4);

}

- (unsigned)dsActionTieBreaker
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionTieBreaker:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("dsAT"), v4);

}

- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("b"), v4);

}

- (void)setDsInfoVehicleState:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("c"), v4);

}

- (void)setHeySiriProductType:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("j"), v4);

}

- (NSData)mspAddressData
{
  CFDataGetTypeID();
  return (NSData *)CFDictionaryGetTypedValue();
}

- (unsigned)mspDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (NSString)mspDisplayName
{
  CFStringGetTypeID();
  return (NSString *)CFDictionaryGetTypedValue();
}

- (unsigned)mspSubScenario
{
  return CFDictionaryGetInt64Ranged();
}

- (unsigned)nearbyActionColorCode
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyActionColorCode:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("naCC"), v4);

}

- (void)setNearbyActionV2TargetData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("u"), a3);
}

- (void)setNearbyInfoStatusProgress:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("w"), v4);

}

- (void)setNearbyInfoStatusTime:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("x"), v4);

}

- (void)setNearbyInfoStatusType:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("y"), v4);

}

- (void)setPrimaryBudSide:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("pBSd"), v4);

}

- (int)proximityPairingPrimaryPlacement
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setProximityPairingPrimaryPlacement:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("ppPP"), v4);

}

- (int)proximityPairingSecondaryPlacement
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setProximityPairingSecondaryPlacement:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("ppSP"), v4);

}

- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("ssLC"), v4);

}

- (void)setWatchSetupData:(id)a3
{
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", CFSTR("wsDa"), a3);
}

- (id)bleAdvertisementTimestampString
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_1ECF9A240 != -1)
    dispatch_once(&qword_1ECF9A240, &__block_literal_global_7);
  v3 = (void *)_MergedGlobals_3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_bleAdvertisementTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__CBDevice_bleAdvertisementTimestampString__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

- (void)decryptApplePayloadWithIdentity:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5
{
  if (a4 == 22)
    -[CBDevice decryptNearbyInfoV2PayloadWithIdentity:error:](self, "decryptNearbyInfoV2PayloadWithIdentity:error:", a3, a5);
}

- (void)decryptNearbyInfoV2PayloadWithIdentity:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  NSData *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char v39;
  char v40;
  int v41;
  int v42;
  unsigned __int8 v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void (**v52)(_QWORD);
  id v53;
  __int16 v54;
  unsigned __int8 v55;
  _QWORD v56[7];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _OWORD v63[2];
  _BYTE v64[40];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__5;
  v61 = __Block_byref_object_dispose__5;
  v62 = 0;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __57__CBDevice_decryptNearbyInfoV2PayloadWithIdentity_error___block_invoke;
  v56[3] = &unk_1E53FF9D8;
  v56[5] = &v57;
  v56[6] = a4;
  v56[4] = self;
  v52 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v56);
  -[CBDevice nearbyInfoV2AuthTagData](self, "nearbyInfoV2AuthTagData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "deviceIRKData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  if (!self->_nearbyInfoV2EncryptedData && !self->_nearbyInfoV2EncryptedFlags)
    goto LABEL_37;
  if (!v6)
  {
    CBErrorF(-6705, (uint64_t)"Unable to decrypt AuthTag data is not available", v8, v9, v10, v11, v12, v13, v51);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v58[5];
    v58[5] = v44;

    goto LABEL_37;
  }
  if (!v7)
  {
    CBErrorF(-6705, (uint64_t)"Unable to decrypt IRK data is not available", v8, v9, v10, v11, v12, v13, v51);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v58[5];
    v58[5] = v46;

    goto LABEL_37;
  }
  memset(v64, 0, 32);
  v15 = objc_retainAutorelease(v7);
  objc_msgSend(v15, "bytes");
  objc_msgSend(v15, "length");
  v16 = objc_retainAutorelease(v6);
  objc_msgSend(v16, "bytes");
  objc_msgSend(v16, "length");
  CryptoHKDF();
  v55 = 0;
  if (!-[CBDevice decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:](self, "decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:", &self->_nearbyInfoV2EncryptedFlags, 1, v64, 32, &v55))
  {
    CBErrorF(-6777, (uint64_t)"Unable to decrypt NearbyInfoV2 sensitive flags", v17, v18, v19, v20, v21, v22, (uint64_t)v64);
    v48 = objc_claimAutoreleasedReturnValue();
LABEL_42:
    v29 = (NSData *)v58[5];
    v58[5] = v48;
    goto LABEL_36;
  }
  v23 = v55 & 7;
  v55 &= 7u;
  if (!v23)
  {
    CBErrorF(-6777, (uint64_t)"Unable to verify NearbyInfoV2 sensitive flags mask", v17, v18, v19, v20, v21, v22, (uint64_t)v64);
    v48 = objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  v24 = -[CBDevice nearbyInfoV2DecryptedFlags](self, "nearbyInfoV2DecryptedFlags", v64);
  v25 = v55;
  self->_nearbyInfoV2DecryptedFlags = v55;
  if (v25)
  {
    if (v23 == v24)
    {
      if ((v25 & 1) == 0)
      {
LABEL_14:
        if ((v25 & 2) != 0)
        {
          v26 = 13;
          if ((self->_internalFlags & 0x800) != 0)
          {
            v27 = 32;
          }
          else
          {
            v26 = 14;
            v27 = 64;
          }
          if (v23 != v24)
          {
            v28 = 9;
            if ((self->_internalFlags & 0x800) == 0)
              v28 = 10;
            *((_BYTE *)&self->super.isa + v28) |= v27;
          }
          *((_BYTE *)&self->super.isa + v26) |= v27;
        }
        if ((v25 & 4) != 0)
        {
          if (v23 != v24)
            self->_changedTypesInternal.bitArray[2] |= 0x20u;
          self->_discoveryTypesInternal.bitArray[2] |= 0x20u;
        }
        v29 = self->_nearbyInfoV2EncryptedData;
        if (-[NSData length](v29, "length") != 2)
          goto LABEL_36;
        memset(v63, 0, sizeof(v63));
        v30 = objc_retainAutorelease(v15);
        objc_msgSend(v30, "bytes");
        objc_msgSend(v30, "length");
        v31 = objc_retainAutorelease(v16);
        objc_msgSend(v31, "bytes");
        objc_msgSend(v31, "length");
        CryptoHKDF();
        v54 = 0;
        v29 = objc_retainAutorelease(v29);
        if (-[CBDevice decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:](self, "decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:", -[NSData bytes](v29, "bytes"), -[NSData length](v29, "length"), v63, 32, &v54))
        {
          v38 = v55;
          v39 = v54;
          v40 = HIBYTE(v54);
          v41 = -[CBDevice nearbyInfoV2InvitationCounter](self, "nearbyInfoV2InvitationCounter", v63);
          v42 = v38 << 31 >> 31;
          v43 = v42 & v39;
          if (v41 != (v42 & v39))
            self->_nearbyInfoV2InvitationCounter = v43;
          if (-[CBDevice nearbyInfoV2InvitationRouteType](self, "nearbyInfoV2InvitationRouteType") == (v42 & v40))
          {
            if (v41 == v43)
              goto LABEL_36;
          }
          else
          {
            self->_nearbyInfoV2InvitationRouteType = v42 & v40;
          }
          self->_changedTypesInternal.bitArray[2] |= 8u;
        }
        else
        {
          CBErrorF(-6777, (uint64_t)"Unable to decrypt NearbyInfoV2 sensitive data", v32, v33, v34, v35, v36, v37, (uint64_t)v63);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = (void *)v58[5];
          v58[5] = v49;

        }
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      self->_changedTypesInternal.bitArray[0] |= 0x10u;
      if ((v25 & 1) == 0)
        goto LABEL_14;
      self->_changedTypesInternal.bitArray[2] |= 8u;
    }
    self->_discoveryTypesInternal.bitArray[2] |= 8u;
    self->_nearbyInfoV2Flags |= 4u;
    goto LABEL_14;
  }
LABEL_37:

  v52[2](v52);
  _Block_object_dispose(&v57, 8);

}

void __57__CBDevice_decryptNearbyInfoV2PayloadWithIdentity_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2 && *(_QWORD *)(a1 + 48))
  {
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v2);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 672);
    *(_QWORD *)(v3 + 672) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 71) = 0;
  }
}

- (BOOL)decryptNearbyInfoV2PayloadPtr:(const char *)a3 payloadLength:(unint64_t)a4 key:(const char *)a5 keyLength:(unint64_t)a6 decryptedPtr:(void *)a7
{
  size_t v8;
  uint64_t v9;
  _OWORD v11[2];
  uint64_t v12;
  __int16 __src;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a4 >= 2)
    v8 = 2;
  else
    v8 = a4;
  __src = 0;
  __memcpy_chk();
  ccaes_ecb_encrypt_mode();
  v9 = ccecb_context_size();
  bzero((char *)v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (ccecb_init())
    return 0;
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  if (cclr_aes_init() || cclr_decrypt_block())
    return 0;
  memcpy(a7, &__src, v8);
  ccecb_context_size();
  cc_clear();
  return 1;
}

- (BOOL)discoveryTypesContainType:(int)a3
{
  _BOOL4 v3;

  if ((a3 - 30) >= 0xFFFFFFE3)
    return (self->_discoveryTypesInternal.bitArray[(unint64_t)(a3 - 1) >> 3] >> (-(char)a3 & 7)) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)isEquivalentToCBDevice:(id)a3 compareFlags:(unsigned int)a4
{
  char v4;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSData *bleAdvertisementData;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  int v14;
  void *v15;
  NSData *bleAppleManufacturerData;
  NSData *v17;
  int v18;
  void *v19;
  NSData *v20;
  NSData *v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  _BOOL4 v25;
  uint64_t v26;
  BOOL v27;
  NSString *v28;
  uint64_t v29;
  BOOL v30;
  int v31;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if ((v4 & 1) == 0)
    goto LABEL_2;
  objc_msgSend(v6, "bleAdvertisementData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  bleAdvertisementData = self->_bleAdvertisementData;
  v11 = v9;
  v12 = bleAdvertisementData;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
      goto LABEL_18;
    v14 = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!v14)
      goto LABEL_51;
  }
  objc_msgSend(v7, "bleAppleManufacturerData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  v11 = v15;
  v17 = bleAppleManufacturerData;
  if (v11 == v17)
  {

    goto LABEL_2;
  }
  v13 = v17;
  if ((v11 == 0) == (v17 != 0))
  {
LABEL_18:

LABEL_51:
    v8 = 0;
    goto LABEL_52;
  }
  v18 = -[NSData isEqual:](v11, "isEqual:", v17);

  if (!v18)
    goto LABEL_51;
LABEL_2:
  if ((v4 & 4) != 0
    && (objc_msgSend(v7, "bleRSSI") != self->_bleRSSI
     || objc_msgSend(v7, "bleChannel") != self->_bleChannel
     || self->_classicRSSI != objc_msgSend(v7, "classicRSSI")))
  {
    goto LABEL_51;
  }
  if ((v4 & 8) != 0)
  {
    objc_msgSend(v7, "btAddressData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_btAddressData;
    v21 = v20;
    if (!v19 || !v20 || (objc_msgSend(v19, "isEqual:", v20) & 1) == 0)
    {
      objc_msgSend(v7, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = self->_identifier;
      v24 = v23;
      v25 = 0;
      if (v22 && v23)
        v25 = objc_msgSend(v22, "caseInsensitiveCompare:", v23) == 0;
      if (v22)
      {
        if (!v25 && -[NSData length](v21, "length") == 6)
        {
          objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
          v25 = 0;
          if (!TextToHardwareAddress())
          {
            v26 = -[NSData bytes](objc_retainAutorelease(v21), "bytes");
            if (*(_DWORD *)v26)
              v27 = 0;
            else
              v27 = *(unsigned __int16 *)(v26 + 4) == 0;
            v25 = v27;
          }
        }
      }
      if (!v25 && v24 && objc_msgSend(v19, "length") == 6)
      {
        v28 = objc_retainAutorelease(v24);
        -[NSString UTF8String](v28, "UTF8String");
        if (TextToHardwareAddress())
        {

LABEL_50:
          goto LABEL_51;
        }
        v29 = objc_msgSend(objc_retainAutorelease(v19), "bytes");
        if (*(_DWORD *)v29)
          v30 = 0;
        else
          v30 = *(unsigned __int16 *)(v29 + 4) == 0;
        v31 = !v30;

        if (v31)
          goto LABEL_50;
      }
      else
      {

        if (!v25)
          goto LABEL_50;
      }
    }

    v8 = 1;
    goto LABEL_52;
  }
  v8 = 1;
LABEL_52:

  return v8;
}

- (unint64_t)removeInternalFlags:(unsigned int)a3
{
  unsigned int v4;
  unint64_t v5;
  NSData *bleAddressData;
  BOOL v7;
  NSData *bleAdvertisementData;
  NSData *bleAppleManufacturerData;
  unint64_t deviceFlags;
  unint64_t discoveryFlags;
  unint64_t v12;
  unint64_t v13;
  char *v14;

  v4 = self->_internalFlags & ~a3;
  self->_internalFlags = v4;
  v5 = (unint64_t)((v4 & 0x86) == 0) << 27;
  if (self->_audioStreamState)
  {
    self->_audioStreamState = 0;
    v5 |= 0x80000000000uLL;
  }
  if ((v4 & 0x84) == 0 && (self->_discoveryFlags & 0x80) == 0)
  {
    if (self->_batteryInfoMain)
    {
      self->_batteryInfoMain = 0;
      v5 |= 0x80000000000uLL;
    }
    if (self->_batteryInfoLeft)
    {
      self->_batteryInfoLeft = 0;
      v5 |= 0x80000000000uLL;
    }
    if (self->_batteryInfoRight)
    {
      self->_batteryInfoRight = 0;
      v5 |= 0x80000000000uLL;
    }
    if (self->_batteryInfoCase)
    {
      self->_batteryInfoCase = 0;
      v5 |= 0x80000000000uLL;
    }
  }
  bleAddressData = self->_bleAddressData;
  if (bleAddressData)
    v7 = (v4 & 2) == 0;
  else
    v7 = 0;
  if (v7)
  {
    self->_bleAddressData = 0;

    v5 |= 0x80000000000uLL;
  }
  bleAdvertisementData = self->_bleAdvertisementData;
  if (bleAdvertisementData && (v4 & 2) == 0)
  {
    self->_bleAdvertisementData = 0;

    v5 |= 0x40000000uLL;
  }
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  if (bleAppleManufacturerData && (v4 & 2) == 0)
  {
    self->_bleAppleManufacturerData = 0;

    v5 |= 0x40000000uLL;
  }
  if (self->_bleChannel && (v4 & 2) == 0)
  {
    self->_bleChannel = 0;
    v5 |= 0x200000000uLL;
  }
  if (self->_bleRSSI && (v4 & 2) == 0)
  {
    self->_bleRSSI = 0;
    v5 |= 0x200000000uLL;
  }
  if (self->_classicRSSI && (v4 & 0x84) == 0)
  {
    self->_classicRSSI = 0;
    v5 |= 0x200000000uLL;
  }
  if (self->_connectedServices && (v4 & 0x84) == 0)
  {
    self->_connectedServices = 0;
    v5 |= 0x80000000000uLL;
  }
  if ((v4 & 0x84) == 0)
  {
    deviceFlags = self->_deviceFlags;
    if ((deviceFlags & 0xFFFFF87F00000F80) != deviceFlags)
    {
      self->_deviceFlags = deviceFlags & 0xFFFFF87F00000F80;
      v5 |= 0x80000000000uLL;
    }
  }
  if (self->_deviceType && (v4 & 0x84) == 0)
  {
    self->_deviceType = 0;
    v5 |= 0x80000000000uLL;
  }
  discoveryFlags = self->_discoveryFlags;
  v12 = discoveryFlags & 0x8305593A4EB00000;
  if ((v4 & 2) != 0)
    v12 = self->_discoveryFlags;
  if ((v4 & 0x84) == 0)
    v12 &= 0xFFFFFFFFFF5FFFFFLL;
  if ((v4 & 0x80) == 0)
    v12 &= ~0x4000000000000uLL;
  v13 = v12 ^ discoveryFlags;
  if (v13)
  {
    self->_discoveryFlags = v12;
    self->_changeFlags |= v13 | 0x800000000;
    v5 |= v13 | 0x800000000;
  }
  if ((v4 & 2) == 0)
  {
    v14 = CBDiscoveryTypesBLEScan();
    CBDiscoveryTypesRemoveTypesAndReportChanges((char *)&self->_discoveryTypesInternal, v14, self->_changedTypesInternal.bitArray);
  }
  if (self->_doubleTapActionLeft && (v4 & 0x84) == 0)
  {
    self->_doubleTapActionLeft = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_doubleTapActionRight && (v4 & 0x84) == 0)
  {
    self->_doubleTapActionRight = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_doubleTapCapability && (v4 & 0x84) == 0)
  {
    self->_doubleTapCapability = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_microphoneMode && (v4 & 0x84) == 0)
  {
    self->_microphoneMode = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_primaryPlacement && (v4 & 0x84) == 0)
  {
    self->_primaryPlacement = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_secondaryPlacement && (v4 & 0x84) == 0)
  {
    self->_secondaryPlacement = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_placementMode && (v4 & 0x84) == 0)
  {
    self->_placementMode = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_smartRoutingMode && (v4 & 0x84) == 0)
  {
    self->_smartRoutingMode = 0;
    v5 |= 0x80000000000uLL;
  }
  if (self->_supportedServices && (v4 & 0x84) == 0)
  {
    self->_supportedServices = 0;
    v5 |= 0x80000000000uLL;
  }
  -[CBDevice _clearUnparsedProperties](self, "_clearUnparsedProperties");
  return v5;
}

- (void)updateWithCBDeviceIdentity:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self->_accountID)
  {
    if (self->_contactID)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(v10, "accountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&self->_accountID, v6);

    if (self->_contactID)
    {
LABEL_3:
      v4 = objc_msgSend(v10, "type") - 2;
      if (v4 > 4)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  objc_msgSend(v10, "contactID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_storeStrong((id *)&self->_contactID, v7);

  v4 = objc_msgSend(v10, "type") - 2;
  if (v4 > 4)
  {
LABEL_4:
    if (self->_idsDeviceID)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_deviceFlags |= qword_1A8336F30[v4];
  if (self->_idsDeviceID)
  {
LABEL_5:
    if (self->_model)
      goto LABEL_6;
LABEL_19:
    objc_msgSend(v10, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&self->_model, v9);
      self->_attributeInternalFlags |= 1u;
    }

    objc_msgSend(v10, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_7;
    goto LABEL_8;
  }
LABEL_16:
  objc_msgSend(v10, "idsDeviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_storeStrong((id *)&self->_idsDeviceID, v8);

  if (!self->_model)
    goto LABEL_19;
LABEL_6:
  objc_msgSend(v10, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
LABEL_7:
    objc_storeStrong((id *)&self->_name, v5);
LABEL_8:

}

- (unint64_t)updateWithPowerSourceDescription:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  uint64_t Int64;
  int v13;
  int v14;
  int v15;

  v4 = a3;
  CFDictionaryGetDouble();
  v6 = v5;
  CFDictionaryGetDouble();
  v8 = 0.0;
  if (v7 > 0.0)
    v8 = v6 / v7 * 100.0;
  v9 = 100.0;
  if (v8 <= 100.0)
    v9 = v8;
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = 0.0;
  if (CFDictionaryGetInt64())
  {
    v11 = 768;
  }
  else
  {
    Int64 = CFDictionaryGetInt64();
    if (v10 > 0.0)
      v13 = 512;
    else
      v13 = 0;
    if (Int64)
      v11 = 256;
    else
      v11 = v13;
  }
  v14 = (int)v10;
  if ((int)v10 >= 100)
    v14 = 100;
  v15 = v11 | v14 & ~(v14 >> 31);
  if (self->_batteryInfoMain == v15)
  {

    return 0;
  }
  else
  {
    self->_batteryInfoMain = v15;

    return 0x80000000000;
  }
}

- (void)updateWithRPIdentity:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self->_accountID)
  {
    if (self->_contactID)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(v10, "accountID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_storeStrong((id *)&self->_accountID, v5);

    if (self->_contactID)
    {
LABEL_3:
      v4 = objc_msgSend(v10, "type") - 2;
      if (v4 > 7)
        goto LABEL_13;
      goto LABEL_11;
    }
  }
  objc_msgSend(v10, "contactID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_storeStrong((id *)&self->_contactID, v6);

  v4 = objc_msgSend(v10, "type") - 2;
  if (v4 <= 7)
  {
LABEL_11:
    if (((0xD5u >> v4) & 1) != 0)
      self->_deviceFlags |= qword_1A8336F58[v4];
  }
LABEL_13:
  if (self->_idsDeviceID)
  {
    if (self->_model)
      goto LABEL_15;
LABEL_21:
    objc_msgSend(v10, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&self->_model, v9);
      self->_attributeInternalFlags |= 1u;
    }

    objc_msgSend(v10, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_16;
    goto LABEL_17;
  }
  objc_msgSend(v10, "idsDeviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_storeStrong((id *)&self->_idsDeviceID, v8);

  if (!self->_model)
    goto LABEL_21;
LABEL_15:
  objc_msgSend(v10, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
LABEL_16:
    objc_storeStrong((id *)&self->_name, v7);
LABEL_17:

}

- (void)updateWithSafetyAlertsSegments:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  unsigned int safetyAlertsSegmentSegmentsTotal;
  int safetyAlertsVersion;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSData *safetyAlertsSegmentAlertData;
  NSData *safetyAlertsSegmentServiceData;
  NSData *safetyAlertsSegmentSignature;
  const char *v36;
  int v37;
  const char *v38;
  uint64_t v39;
  id v40;

  v40 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  safetyAlertsSegmentSegmentsTotal = self->_safetyAlertsSegmentSegmentsTotal;
  if (!self->_safetyAlertsSegmentSegmentsTotal)
  {
LABEL_7:
    if ((unint64_t)objc_msgSend(v6, "length") >= 0x1D)
    {
      if (!a4)
        goto LABEL_10;
      v38 = "Invalid alert data length";
    }
    else
    {
      if (objc_msgSend(v7, "length") == 56)
      {
        objc_storeStrong((id *)&self->_safetyAlertsAlertData, v6);
        objc_storeStrong((id *)&self->_safetyAlertsSignature, v7);
        self->_internalFlags &= ~0x4000u;
        safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
        self->_safetyAlertsSegmentAlertData = 0;

        *(_WORD *)&self->_safetyAlertsSegmentSegmentNumber = 0;
        safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
        self->_safetyAlertsSegmentServiceData = 0;

        safetyAlertsSegmentSignature = self->_safetyAlertsSegmentSignature;
        self->_safetyAlertsSegmentSignature = 0;

        goto LABEL_10;
      }
      if (!a4)
        goto LABEL_10;
      v38 = "Invalid signature length";
    }
    CBErrorF(-6743, (uint64_t)v38, v27, v28, v29, v30, v31, v32, v39);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  safetyAlertsVersion = self->_safetyAlertsVersion;
  v10 = 1;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      break;
    if (objc_msgSend(v12, "safetyAlertsSegmentSegmentsTotal") != safetyAlertsSegmentSegmentsTotal)
    {
      if (!a4)
        goto LABEL_19;
      v36 = "Invalid value";
      v37 = -6737;
LABEL_17:
      CBErrorF(v37, (uint64_t)v36, v19, v20, v21, v22, v23, v24, v39);
      goto LABEL_18;
    }
    if (objc_msgSend(v12, "safetyAlertsVersion") != safetyAlertsVersion)
    {
      if (!a4)
        goto LABEL_19;
      v36 = "Invalid version";
      v37 = -6715;
      goto LABEL_17;
    }
    objc_msgSend(v12, "safetyAlertsSegmentAlertData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendData:", v25);

    objc_msgSend(v12, "safetyAlertsSegmentSignature");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v26);

    if (safetyAlertsSegmentSegmentsTotal < ++v10)
      goto LABEL_7;
  }
  if (!a4)
    goto LABEL_19;
  CBErrorF(-6727, (uint64_t)"Segment %d/%d not found", v13, v14, v15, v16, v17, v18, v10);
LABEL_18:
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_10:
}

- (void)_parseAirPlayTargetPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5;
  unsigned __int8 v6;
  int v7;
  uint64_t v8;
  _BOOL4 v10;
  unsigned __int8 v11;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  BOOL v17;
  char v18;

  v5 = a4 - a3;
  if (a4 - a3 < 1)
  {
    v6 = 0;
    if (!self->_airplayTargetFlags)
    {
LABEL_3:
      v8 = 0;
      v10 = v5 > 0 && a4 - a3 > 0;
      if (!v10)
        goto LABEL_10;
LABEL_20:
      v13 = *(unsigned __int8 *)a3++;
      v11 = v13;
      if (v13 == self->_airplayTargetConfigSeed)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else
  {
    v7 = *(unsigned __int8 *)a3++;
    v6 = v7;
    if (v7 == self->_airplayTargetFlags)
      goto LABEL_3;
  }
  self->_airplayTargetFlags = v6;
  v8 = 0x8000000000;
  v10 = v5 > 0 && a4 - a3 > 0;
  if (v10)
    goto LABEL_20;
LABEL_10:
  v11 = 0;
  if (self->_airplayTargetConfigSeed)
  {
LABEL_21:
    self->_airplayTargetConfigSeed = v11;
    v8 = 0x8000000000;
  }
LABEL_22:
  if (a4 - a3 <= 3)
    v10 = 0;
  if (!v10)
  {
    v15 = 0;
    if (!self->_airplayTargetIPv4)
      goto LABEL_29;
    goto LABEL_28;
  }
  v14 = *(_DWORD *)a3;
  a3 += 4;
  v15 = bswap32(v14);
  if (v15 != self->_airplayTargetIPv4)
  {
LABEL_28:
    self->_airplayTargetIPv4 = v15;
    v8 = 0x8000000000;
  }
LABEL_29:
  v16 = 0;
  v17 = (v6 & 0x10) == 0;
  v18 = !v10;
  if (v17)
    v18 = 1;
  if ((v18 & 1) == 0 && a4 - a3 >= 2)
    v16 = bswap32(*(unsigned __int16 *)a3) >> 16;
  if ((_DWORD)v16 != -[CBDevice airplayTargetPort](self, "airplayTargetPort", a3))
  {
    -[CBDevice setAirplayTargetPort:](self, "setAirplayTargetPort:", v16);
    v8 = 0x8000000000;
  }
  self->_discoveryFlags |= 0x8000000000uLL;
  self->_changeFlags |= v8;
}

- (void)_parseDSInfoPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a4 - a3 < 1)
  {
    v5 = 0;
    v6 = 0;
    if (!-[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState"))
    {
LABEL_3:
      v7 = 0;
      v8 = (v5 >> 2) & 0xF;
      if ((_DWORD)v8 == -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence"))
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else
  {
    v5 = *(unsigned __int8 *)a3;
    v6 = v5 & 3;
    if ((_DWORD)v6 == -[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState"))
      goto LABEL_3;
  }
  -[CBDevice setDsInfoVehicleState:](self, "setDsInfoVehicleState:", v6);
  v7 = 0x800000000000000;
  v8 = (v5 >> 2) & 0xF;
  if ((_DWORD)v8 != -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence"))
  {
LABEL_7:
    -[CBDevice setDsInfoVehicleConfidence:](self, "setDsInfoVehicleConfidence:", v8);
    v7 = 0x800000000000000;
  }
LABEL_8:
  self->_discoveryFlags |= 0x800000000000000uLL;
  self->_changeFlags |= v7;
}

- (void)_parseHomeKitV1Ptr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  int homeKitV1Flags;
  int v9;
  uint64_t v10;
  _BOOL4 v12;
  void *v13;
  int v14;
  NSData *homeKitV1DeviceIDData;
  NSData *v17;
  char v18;
  _BOOL4 v19;
  unsigned __int16 v20;
  int v21;
  NSData *v22;
  NSData *v23;
  NSData *v24;
  unsigned __int16 v25;
  int v26;
  unsigned __int8 v27;
  int v28;
  unsigned __int8 v29;
  int v30;
  unsigned int v31;
  NSData *v32;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    v5 = a3 + 1;
    homeKitV1Flags = self->_homeKitV1Flags;
    v9 = homeKitV1Flags & 0xFE | *a3 & 1;
    if (v9 == homeKitV1Flags)
      goto LABEL_3;
LABEL_12:
    self->_homeKitV1Flags = v9;
    v10 = 0x400000;
    v12 = v7 > 0 && a4 - v5 > 5;
    if (!v12)
      goto LABEL_10;
    goto LABEL_19;
  }
  v14 = self->_homeKitV1Flags;
  LOBYTE(v9) = v14 & 0xFE;
  if ((v14 & 0xFE) != v14)
    goto LABEL_12;
LABEL_3:
  v10 = 0;
  v12 = v7 > 0 && a4 - v5 > 5;
  if (!v12)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_20;
  }
LABEL_19:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5, 6);
  v5 += 6;
LABEL_20:
  homeKitV1DeviceIDData = self->_homeKitV1DeviceIDData;
  v32 = v13;
  v17 = homeKitV1DeviceIDData;
  if (v32 == v17)
  {

    v23 = v32;
  }
  else
  {
    if ((v32 == 0) != (v17 != 0))
    {
      v18 = -[NSData isEqual:](v32, "isEqual:", v17);

      if ((v18 & 1) != 0)
      {
        v19 = a4 - v5 > 1 && v12;
        if (v19)
          goto LABEL_27;
LABEL_36:
        v20 = 0;
        v22 = v32;
        if (!self->_homeKitV1Category)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    else
    {

    }
    v24 = v32;
    v23 = self->_homeKitV1DeviceIDData;
    self->_homeKitV1DeviceIDData = v24;
    v10 = 0x400000;
  }

  v19 = a4 - v5 > 1 && v12;
  if (!v19)
    goto LABEL_36;
LABEL_27:
  v21 = *(unsigned __int16 *)v5;
  v5 += 2;
  v20 = v21;
  v22 = v32;
  if (v21 != self->_homeKitV1Category)
  {
LABEL_37:
    self->_homeKitV1Category = v20;
    v10 = 0x400000;
  }
LABEL_38:
  if (a4 - v5 <= 1)
    v19 = 0;
  if (!v19)
  {
    v25 = 0;
    if (!self->_homeKitV1StateNumber)
      goto LABEL_45;
    goto LABEL_44;
  }
  v26 = *(unsigned __int16 *)v5;
  v5 += 2;
  v25 = v26;
  if (v26 != self->_homeKitV1StateNumber)
  {
LABEL_44:
    self->_homeKitV1StateNumber = v25;
    v10 = 0x400000;
  }
LABEL_45:
  if (a4 - v5 <= 0)
    v19 = 0;
  if (!v19)
  {
    v27 = 0;
    if (!self->_homeKitV1ConfigurationNumber)
      goto LABEL_52;
    goto LABEL_51;
  }
  v28 = *(unsigned __int8 *)v5++;
  v27 = v28;
  if (v28 != self->_homeKitV1ConfigurationNumber)
  {
LABEL_51:
    self->_homeKitV1ConfigurationNumber = v27;
    v10 |= 0x400000uLL;
  }
LABEL_52:
  if (a4 - v5 <= 0)
    v19 = 0;
  if (!v19)
  {
    v29 = 0;
    if (!self->_homeKitV1CompatibleVersion)
      goto LABEL_59;
    goto LABEL_58;
  }
  v30 = *(unsigned __int8 *)v5++;
  v29 = v30;
  if (v30 != self->_homeKitV1CompatibleVersion)
  {
LABEL_58:
    self->_homeKitV1CompatibleVersion = v29;
    v10 |= 0x400000uLL;
  }
LABEL_59:
  if (a4 - v5 <= 3)
    v19 = 0;
  if (v19)
  {
    v31 = *(_DWORD *)v5;
    if (*(_DWORD *)v5 == self->_homeKitV1SetupHash)
      goto LABEL_66;
    goto LABEL_65;
  }
  v31 = 0;
  if (self->_homeKitV1SetupHash)
  {
LABEL_65:
    self->_homeKitV1SetupHash = v31;
    v10 |= 0x400000uLL;
  }
LABEL_66:
  self->_discoveryFlags |= 0x400000uLL;
  self->_changeFlags |= v10;

}

- (void)_parseHomeKitV2Ptr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  void *v8;
  NSData *homeKitV2AccessoryIDData;
  NSData *v10;
  char v11;
  NSData *v12;
  uint64_t v13;
  _BOOL4 v15;
  unsigned __int16 v16;
  NSData *v17;
  NSData *v18;
  int v20;
  unsigned __int16 v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  NSData *v26;
  NSData *v27;
  NSData *v28;
  NSData *v29;
  char v30;
  NSData *homeKitV2AuthTagData;
  NSData *v32;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 < 6)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 6);
    v5 += 6;
  }
  homeKitV2AccessoryIDData = self->_homeKitV2AccessoryIDData;
  v32 = v8;
  v10 = homeKitV2AccessoryIDData;
  if (v32 == v10)
  {

    v13 = 0;
    v17 = v32;
  }
  else
  {
    if ((v32 == 0) != (v10 != 0))
    {
      v11 = -[NSData isEqual:](v32, "isEqual:", v10);

      v12 = v32;
      if ((v11 & 1) != 0)
      {
        v13 = 0;
        v15 = v7 > 5 && a4 - v5 > 1;
        if (!v15)
          goto LABEL_14;
LABEL_26:
        v20 = *(unsigned __int16 *)v5;
        v5 += 2;
        v16 = v20;
        if (v20 == self->_homeKitV2StateNumber)
          goto LABEL_28;
        goto LABEL_27;
      }
    }
    else
    {

      v12 = v32;
    }
    v18 = v12;
    v17 = self->_homeKitV2AccessoryIDData;
    self->_homeKitV2AccessoryIDData = v18;
    v13 = 0x1000000;
  }

  v15 = v7 > 5 && a4 - v5 > 1;
  if (v15)
    goto LABEL_26;
LABEL_14:
  v16 = 0;
  if (self->_homeKitV2StateNumber)
  {
LABEL_27:
    self->_homeKitV2StateNumber = v16;
    v13 = 0x1000000;
  }
LABEL_28:
  if (a4 - v5 <= 1)
    v15 = 0;
  if (!v15)
  {
    v21 = 0;
    if (!self->_homeKitV2InstanceID)
      goto LABEL_35;
    goto LABEL_34;
  }
  v22 = *(unsigned __int16 *)v5;
  v5 += 2;
  v21 = v22;
  if (v22 != self->_homeKitV2InstanceID)
  {
LABEL_34:
    self->_homeKitV2InstanceID = v21;
    v13 = 0x1000000;
  }
LABEL_35:
  if (a4 - v5 <= 7)
    v15 = 0;
  if (!v15)
  {
    v23 = 0;
    if (!self->_homeKitV2Value)
      goto LABEL_42;
    goto LABEL_41;
  }
  v24 = *(_QWORD *)v5;
  v5 += 8;
  v23 = v24;
  if (v24 != self->_homeKitV2Value)
  {
LABEL_41:
    self->_homeKitV2Value = v23;
    v13 = 0x1000000;
  }
LABEL_42:
  if (a4 - v5 <= 3)
    v15 = 0;
  if (!v15)
  {
    v25 = 0;
    homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
    v27 = (NSData *)0;
    v28 = homeKitV2AuthTagData;
    if (v27 != v28)
      goto LABEL_46;
LABEL_50:

    goto LABEL_53;
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5, 4);
  v26 = self->_homeKitV2AuthTagData;
  v27 = v25;
  v28 = v26;
  if (v27 == v28)
    goto LABEL_50;
LABEL_46:
  v29 = v28;
  if ((v27 == 0) != (v28 != 0))
  {
    v30 = -[NSData isEqual:](v27, "isEqual:", v28);

    if ((v30 & 1) != 0)
      goto LABEL_53;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_homeKitV2AuthTagData, v25);
  v13 |= 0x1000000uLL;
LABEL_53:
  self->_discoveryFlags |= 0x1000000uLL;
  self->_changeFlags |= v13;

}

- (void)_parseNearbyActionPtr:(const char *)a3 end:(const char *)a4
{
  const char *v6;
  unsigned int v7;
  int64_t v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSData *nearbyActionAuthTag;
  NSData *v18;
  NSData *v19;
  NSData *v20;
  char v21;
  BOOL v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  NSData *v29;
  NSData *v30;
  NSData *nearbyActionTargetAuthTag;
  NSData *v32;
  NSData *v33;
  NSData *v34;
  char v35;
  const char *v36;
  int v37;
  char **v38;
  char *v39;
  int v40;
  BOOL v41;
  void *v42;
  id obj;
  id v44;

  if (a4 - a3 < 1)
  {
    obj = 0;
    v44 = 0;
    v10 = 0;
    v7 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v42 = 0;
    v41 = 1;
    goto LABEL_6;
  }
  v6 = a3 + 1;
  v7 = *(unsigned __int8 *)a3;
  v8 = a4 - (a3 + 1);
  v9 = v8 > 0;
  if (v8 < 1)
  {
    v10 = 0;
    if ((v7 & 0x80) == 0)
      goto LABEL_4;
  }
  else
  {
    v6 = a3 + 2;
    v10 = *((unsigned __int8 *)a3 + 1);
    if ((v7 & 0x80) == 0)
    {
LABEL_4:
      v44 = 0;
      goto LABEL_42;
    }
  }
  v44 = 0;
  v9 = 0;
  if (v8 >= 1 && a4 - v6 >= 3)
  {
    v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v6, 3);
    v6 += 3;
    v9 = 1;
  }
LABEL_42:
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  switch(v10)
  {
    case 2:
    case 37:
    case 44:
    case 45:
    case 47:
    case 85:
      if (a4 - v6 <= 0)
        v9 = 0;
      if (!v9)
        goto LABEL_71;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v11 = *(unsigned __int8 *)v6 >> 4;
      v41 = (v7 & 0x200) == 0;
      v42 = 0;
      goto LABEL_76;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 55:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
      goto LABEL_72;
    case 5:
      if (!v9)
        goto LABEL_71;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v41 = (v7 & 0x200) == 0;
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v6, a4 - v6);
      goto LABEL_76;
    case 54:
      if (a4 - v6 <= 2)
        v9 = 0;
      if (!v9)
        goto LABEL_71;
      v11 = 0;
      v12 = *(unsigned __int8 *)v6;
      v13 = *((unsigned __int8 *)v6 + 1);
      v14 = *((unsigned __int8 *)v6 + 2);
      v41 = (v7 & 0x200) == 0;
      v42 = 0;
      goto LABEL_76;
    case 56:
      if (a4 - v6 <= 0)
        v9 = 0;
      if (v9)
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v37 = *(unsigned __int8 *)v6;
        v36 = v6 + 1;
        v7 |= v37 << 8;
        v41 = (v7 & 0x200) == 0;
        v42 = 0;
        if ((v7 & 0x200) != 0 && a4 - v36 > 2)
        {
          obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v36, 3);
          goto LABEL_77;
        }
      }
      else
      {
LABEL_71:
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
LABEL_72:
        v41 = (v7 & 0x200) == 0;
        v42 = 0;
      }
LABEL_76:
      obj = 0;
LABEL_77:
      v15 = 0x80000;
      switch(v10)
      {
        case 0:
          goto LABEL_7;
        case 1:
          v15 = 524290;
          goto LABEL_7;
        case 2:
          v15 = 0x4000000000080000;
          goto LABEL_7;
        case 5:
          v15 = 0x20000000080000;
          goto LABEL_7;
        case 8:
          v15 = 532480;
          goto LABEL_7;
        case 9:
          v15 = 524320;
          goto LABEL_7;
        case 10:
          v15 = 524800;
          goto LABEL_7;
        case 11:
          v15 = 524304;
          goto LABEL_7;
        case 12:
          v15 = 524289;
          goto LABEL_7;
        case 13:
          v15 = 528384;
          goto LABEL_7;
        case 25:
          v15 = 526336;
          goto LABEL_7;
        case 27:
          v15 = 525312;
          goto LABEL_7;
        case 28:
          v15 = 524292;
          goto LABEL_7;
        case 34:
          v15 = 268959744;
          goto LABEL_7;
        case 37:
          v15 = 0x800000080000;
          goto LABEL_7;
        case 39:
          v15 = 0x10000000080000;
          goto LABEL_7;
        case 44:
          self->_discoveryTypesInternal.bitArray[0] |= 0x40u;
          v10 = 44;
          goto LABEL_6;
        case 45:
          self->_discoveryTypesInternal.bitArray[0] |= 8u;
          v10 = 45;
          goto LABEL_6;
        case 46:
          self->_discoveryTypesInternal.bitArray[0] |= 1u;
          v10 = 46;
          goto LABEL_6;
        case 47:
          self->_discoveryTypesInternal.bitArray[1] |= 8u;
          v10 = 47;
          goto LABEL_6;
        case 48:
          self->_discoveryTypesInternal.bitArray[1] |= 0x80u;
          v10 = 48;
          goto LABEL_6;
        case 54:
          v15 = 0x1000000000080000;
          goto LABEL_7;
        case 55:
          self->_discoveryTypesInternal.bitArray[0] |= 4u;
          v10 = 55;
          goto LABEL_6;
        case 56:
          self->_discoveryTypesInternal.bitArray[1] |= 0x40u;
          v10 = 56;
          goto LABEL_6;
        case 83:
          self->_discoveryTypesInternal.bitArray[2] |= 4u;
          v10 = 83;
          goto LABEL_6;
        default:
          if (!"AirDrop")
            goto LABEL_6;
          v38 = &off_1E5401530;
          v15 = 0x80000;
          break;
      }
      break;
    default:
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v41 = (v7 & 0x200) == 0;
      v42 = 0;
      goto LABEL_76;
  }
  while (*((unsigned __int8 *)v38 - 8) != v10)
  {
    v39 = *v38;
    v38 += 3;
    if (!v39)
      goto LABEL_7;
  }
  v40 = *((_DWORD *)v38 - 4);
  if ((v40 - 30) >= 0xFFFFFFE3)
    self->_discoveryTypesInternal.bitArray[(unint64_t)(v40 - 1) >> 3] |= 1 << (-(char)v40 & 7);
LABEL_6:
  v15 = 0x80000;
LABEL_7:
  if (-[CBDevice nearbyActionColorCode](self, "nearbyActionColorCode"))
  {
    -[CBDevice setNearbyActionColorCode:](self, "setNearbyActionColorCode:", 0);
    v16 = v15;
    if (v7 == self->_nearbyActionFlags)
      goto LABEL_10;
    goto LABEL_9;
  }
  v16 = 0;
  if (v7 != self->_nearbyActionFlags)
  {
LABEL_9:
    self->_nearbyActionFlags = v7;
    v16 = v15;
  }
LABEL_10:
  if (v10 == self->_nearbyActionType)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_12;
  }
  else
  {
    self->_nearbyActionType = v10;
    v16 = v15;
    if ((v7 & 0x80) == 0)
    {
LABEL_12:
      if (v41)
        goto LABEL_19;
      goto LABEL_51;
    }
  }
  nearbyActionAuthTag = self->_nearbyActionAuthTag;
  v18 = (NSData *)v44;
  v19 = nearbyActionAuthTag;
  if (v18 == v19)
  {

    if (v41)
      goto LABEL_19;
  }
  else
  {
    v20 = v19;
    if ((v18 == 0) != (v19 != 0))
    {
      v21 = -[NSData isEqual:](v18, "isEqual:", v19);

      v22 = v41;
      if ((v21 & 1) != 0)
      {
        if (v41)
          goto LABEL_19;
        goto LABEL_51;
      }
    }
    else
    {

      v22 = v41;
    }
    v29 = v18;
    v30 = self->_nearbyActionAuthTag;
    self->_nearbyActionAuthTag = v29;
    v16 = v15;

    if (v22)
      goto LABEL_19;
  }
LABEL_51:
  nearbyActionTargetAuthTag = self->_nearbyActionTargetAuthTag;
  v23 = obj;
  v32 = (NSData *)obj;
  v33 = nearbyActionTargetAuthTag;
  if (v32 == v33)
  {

    if ((_DWORD)v11 != -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass"))
      goto LABEL_20;
  }
  else
  {
    v34 = v33;
    if ((v32 == 0) != (v33 != 0))
    {
      v35 = -[NSData isEqual:](v32, "isEqual:", v33);

      if ((v35 & 1) != 0)
      {
LABEL_19:
        v23 = obj;
        if ((_DWORD)v11 == -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass"))
          goto LABEL_21;
        goto LABEL_20;
      }
    }
    else
    {

    }
    v23 = obj;
    objc_storeStrong((id *)&self->_nearbyActionTargetAuthTag, obj);
    v16 |= v15;
    if ((_DWORD)v11 != -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass"))
    {
LABEL_20:
      -[CBDevice setNearbyActionDeviceClass:](self, "setNearbyActionDeviceClass:", v11);
      v16 |= v15;
    }
  }
LABEL_21:
  if ((_DWORD)v12 == -[CBDevice dsActionFlags](self, "dsActionFlags"))
  {
    if (v13 == -[CBDevice dsActionMeasuredPower](self, "dsActionMeasuredPower"))
      goto LABEL_23;
  }
  else
  {
    -[CBDevice setDsActionFlags:](self, "setDsActionFlags:", v12);
    v16 |= v15;
    if (v13 == -[CBDevice dsActionMeasuredPower](self, "dsActionMeasuredPower"))
    {
LABEL_23:
      if ((_DWORD)v14 == -[CBDevice dsActionTieBreaker](self, "dsActionTieBreaker"))
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  -[CBDevice setDsActionMeasuredPower:](self, "setDsActionMeasuredPower:", (char)v13);
  v16 |= v15;
  if ((_DWORD)v14 != -[CBDevice dsActionTieBreaker](self, "dsActionTieBreaker"))
  {
LABEL_24:
    -[CBDevice setDsActionTieBreaker:](self, "setDsActionTieBreaker:", v14);
    v16 |= v15;
  }
LABEL_25:
  -[CBDevice watchSetupData](self, "watchSetupData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v42;
  v26 = v24;
  if (v25 == v26)
  {

  }
  else
  {
    v27 = v26;
    if ((v25 == 0) != (v26 != 0))
    {
      v28 = objc_msgSend(v25, "isEqual:", v26);

      if ((v28 & 1) != 0)
        goto LABEL_37;
    }
    else
    {

    }
    -[CBDevice setWatchSetupData:](self, "setWatchSetupData:", v25);
    v16 |= v15;
  }
LABEL_37:
  self->_discoveryFlags |= v15;
  self->_changeFlags |= v16;

}

- (void)_parseNearbyActionV2Ptr:(const char *)a3 end:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;

  if (a4 - a3 < 1)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v5 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] <= 0)
  {
LABEL_9:
    v15 = 0;
    v6 = 0;
    v8 = 0;
    v7 = (v5 & 1) == 0;
    goto LABEL_10;
  }
  v15 = 0;
  v6 = *((unsigned __int8 *)a3 + 1);
  v7 = (v5 & 1) == 0;
  if ((v5 & 1) != 0 && a4 - (a3 + 2) >= 3)
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 2, 3);
  v8 = 0;
  switch((int)v6)
  {
    case '&':
      v8 = 0x400000000;
      break;
    case '(':
      v8 = 0x2000000000000000;
      break;
    case ')':
      v8 = 0x20000;
      break;
    case '2':
      v8 = 256;
      break;
    case '3':
      v8 = 8;
      break;
    default:
      break;
  }
LABEL_10:
  if (-[CBDevice nearbyActionV2Flags](self, "nearbyActionV2Flags") != (_DWORD)v5)
  {
    -[CBDevice setNearbyActionV2Flags:](self, "setNearbyActionV2Flags:", v5);
    v9 = v8;
    if ((_DWORD)v6 == -[CBDevice nearbyActionV2Type](self, "nearbyActionV2Type"))
      goto LABEL_15;
    goto LABEL_14;
  }
  v9 = 0;
  if ((_DWORD)v6 != -[CBDevice nearbyActionV2Type](self, "nearbyActionV2Type"))
  {
LABEL_14:
    -[CBDevice setNearbyActionV2Type:](self, "setNearbyActionV2Type:", v6);
    v9 = v8;
  }
LABEL_15:
  if (!v7)
  {
    -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v12 = v10;
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      if ((v11 == 0) == (v12 != 0))
      {

      }
      else
      {
        v14 = objc_msgSend(v11, "isEqual:", v12);

        if ((v14 & 1) != 0)
          goto LABEL_23;
      }
      -[CBDevice setNearbyActionV2TargetData:](self, "setNearbyActionV2TargetData:", v11);
      v9 = v8;
    }
  }
LABEL_23:
  self->_discoveryFlags |= v8;
  self->_changeFlags |= v9;

}

- (void)_parseNearbyActionNoWakePtr:(const char *)a3 end:(const char *)a4
{
  int v6;
  int v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  char v14;
  NSData *v15;
  NSData *nearbyActionNoWakeAuthTagData;
  void *v17;
  NSData *nearbyActionNoWakeConfigData;
  NSData *v19;
  NSData *v20;
  char v21;
  NSData *v22;
  id v23;

  if (a4 - a3 < 1)
  {
    v6 = 0;
    goto LABEL_9;
  }
  v6 = *(unsigned __int8 *)a3;
  if ((v6 & 1) == 0)
  {
LABEL_9:
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_14;
  }
  if (a4 - (a3 + 1) < 1)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    v8 = *((unsigned __int8 *)a3 + 1);
    if (a4 - (a3 + 2) >= 3)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 2, 3);
      v10 = 0;
      if ((v8 & 1) != 0)
      {
        v11 = a3 + 5;
        if (a4 - v11 >= 1)
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v11, 1);
      }
      goto LABEL_13;
    }
    v9 = 0;
  }
  v10 = 0;
LABEL_13:
  self->_discoveryTypesInternal.bitArray[1] |= 1u;
LABEL_14:
  self->_discoveryTypesInternal.bitArray[1] |= 2u;
  if (v6 != -[CBDevice nearbyActionNoWakeType](self, "nearbyActionNoWakeType"))
    self->_nearbyActionNoWakeType = v6;
  if (v8 != -[CBDevice nearbyActionNWPrecisionFindingStatus](self, "nearbyActionNWPrecisionFindingStatus"))
    self->_nearbyActionNWPrecisionFindingStatus = v8;
  -[CBDevice nearbyActionNoWakeAuthTagData](self, "nearbyActionNoWakeAuthTagData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  v13 = v12;
  if (v23 != v13)
  {
    if ((v23 == 0) != (v13 != 0))
    {
      v14 = objc_msgSend(v23, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
        if ((v8 & 1) == 0)
          goto LABEL_35;
        goto LABEL_27;
      }
    }
    else
    {

    }
    v15 = (NSData *)v23;
    nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
    self->_nearbyActionNoWakeAuthTagData = v15;

    if ((v8 & 1) == 0)
      goto LABEL_35;
    goto LABEL_27;
  }

  if ((v8 & 1) == 0)
    goto LABEL_35;
LABEL_27:
  -[CBDevice nearbyActionNoWakeConfigData](self, "nearbyActionNoWakeConfigData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionNoWakeConfigData = v10;
  v19 = v17;
  if (nearbyActionNoWakeConfigData == v19)
  {

  }
  else
  {
    v20 = v19;
    if ((nearbyActionNoWakeConfigData == 0) == (v19 != 0))
    {

    }
    else
    {
      v21 = -[NSData isEqual:](nearbyActionNoWakeConfigData, "isEqual:", v19);

      if ((v21 & 1) != 0)
        goto LABEL_35;
    }
    v22 = nearbyActionNoWakeConfigData;
    nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
    self->_nearbyActionNoWakeConfigData = v22;
  }

LABEL_35:
}

- (void)_parseProximityPairingPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5;
  int v6;
  int v7;
  int proximityPairingSubType;
  _BOOL4 v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int proximityPairingProductID;
  unint64_t discoveryFlags;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v5 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    v7 = *(unsigned __int8 *)a3++;
    v6 = v7;
    proximityPairingSubType = self->_proximityPairingSubType;
    if (v7 == proximityPairingSubType)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 255;
  proximityPairingSubType = self->_proximityPairingSubType;
  if (proximityPairingSubType != 255)
LABEL_3:
    self->_proximityPairingSubType = v6;
LABEL_4:
  v10 = v5 > 0 && a4 - a3 > 1;
  if (!v10)
  {
    v11 = 0;
    proximityPairingProductID = self->_proximityPairingProductID;
    if (!proximityPairingProductID)
      goto LABEL_15;
    goto LABEL_14;
  }
  v12 = *(unsigned __int16 *)a3;
  a3 += 2;
  v11 = v12;
  proximityPairingProductID = self->_proximityPairingProductID;
  if (v12 != proximityPairingProductID)
LABEL_14:
    self->_proximityPairingProductID = v11;
LABEL_15:
  discoveryFlags = self->_discoveryFlags;
  if (v10)
  {
    switch(v6)
    {
      case 0:
        -[CBDevice _parseProximityPairingWxSetupPtr:end:](self, "_parseProximityPairingWxSetupPtr:end:", a3);
        break;
      case 1:
        -[CBDevice _parseProximityPairingWxStatusPtr:end:](self, "_parseProximityPairingWxStatusPtr:end:", a3);
        break;
      case 4:
        -[CBDevice _parseProximityPairingAirPodsMismatchedPtr:end:](self, "_parseProximityPairingAirPodsMismatchedPtr:end:", a3);
        break;
      case 5:
        -[CBDevice _parseProximityPairingObjectSetupPtr:end:](self, "_parseProximityPairingObjectSetupPtr:end:", a3);
        break;
      case 6:
        -[CBDevice _parseProximityPairingAccessoryStatusPtr:end:](self, "_parseProximityPairingAccessoryStatusPtr:end:", a3);
        break;
      case 7:
        -[CBDevice _parseProximityPairingV2Ptr:end:](self, "_parseProximityPairingV2Ptr:end:", a3);
        break;
      case 8:
        -[CBDevice _parseProximityPairingFindMyAccessoryStatusPtr:end:](self, "_parseProximityPairingFindMyAccessoryStatusPtr:end:", a3);
        break;
      default:
        break;
    }
  }
  v15 = v11 == proximityPairingProductID && v6 == proximityPairingSubType;
  v16 = self->_discoveryFlags;
  v17 = v16 ^ discoveryFlags;
  v18 = v16 & 0x1C080;
  if (v15)
    v19 = 0;
  else
    v19 = v16 & 0x1C080;
  v20 = self->_changeFlags | v17 | v19;
  self->_changeFlags = v20;
  if (v18 && (self->_internalFlags & 0x800) != 0)
    self->_discoveryTypesInternal.bitArray[3] |= 8u;
  if ((v20 & 0x1C080) != 0 && (self->_internalFlags & 0x800) != 0)
    self->_changedTypesInternal.bitArray[3] |= 8u;
}

- (void)_parseProximityPairingWxSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  const char *v13;
  unint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  int v20;
  _BOOL4 v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unint64_t deviceFlags;
  uint64_t v28;

  v7 = a4 - a3;
  v8 = a4 - a3 - 6;
  if (v8 < 1)
  {
    v9 = 0;
    v11 = 6;
    v10 = v8;
  }
  else
  {
    v9 = *((unsigned __int8 *)a3 + 6);
    v10 = v7 - 7;
    v11 = 7;
  }
  v12 = v8 > 0;
  v13 = &a3[v11];
  deviceFlags = self->_deviceFlags;
  v28 = 0;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:](self, "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:", v9, &deviceFlags, (char *)&v28 + 4, &v28);
  v14 = 0;
  v15 = 3;
  if (!v12 || v10 <= 2)
    v15 = 0;
  v16 = &v13[v15];
  v17 = a4 - v16;
  if (v12 && v10 > 2 && v17 >= 1)
  {
    v18 = *v16++;
    v14 = (unint64_t)(v18 & 8) << 33;
    v17 = a4 - v16;
  }
  deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | v14;
  if (v17 >= 1)
  {
    v19 = *(unsigned __int8 *)v16;
    v20 = -[CBDevice colorInfo](self, "colorInfo");
    v21 = v20 != v19;
    if (v20 == (_DWORD)v19)
      goto LABEL_12;
    goto LABEL_11;
  }
  v19 = 0;
  v26 = -[CBDevice colorInfo](self, "colorInfo");
  v21 = v26 != 0;
  if (v26)
LABEL_11:
    -[CBDevice setColorInfo:](self, "setColorInfo:", v19, deviceFlags);
LABEL_12:
  if (deviceFlags == self->_deviceFlags)
  {
    v22 = HIDWORD(v28);
    if (v22 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement"))
      goto LABEL_14;
  }
  else
  {
    self->_deviceFlags = deviceFlags;
    v21 = 1;
    v24 = HIDWORD(v28);
    if (v24 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement"))
    {
LABEL_14:
      v23 = v28;
      if (v23 == -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement", deviceFlags))goto LABEL_15;
LABEL_19:
      -[CBDevice setProximityPairingSecondaryPlacement:](self, "setProximityPairingSecondaryPlacement:", v28);
      self->_discoveryFlags |= 0x4000uLL;
      goto LABEL_20;
    }
  }
  -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v28), deviceFlags);
  v21 = 1;
  v25 = v28;
  if (v25 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement"))
    goto LABEL_19;
LABEL_15:
  self->_discoveryFlags |= 0x4000uLL;
  if (v21)
LABEL_20:
    self->_changeFlags |= 0x80000004000uLL;
}

- (void)_parseProximityPairingWxStatusPtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  const char *v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unint64_t deviceFlags;
  uint64_t v22;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    v8 = 0;
    v9 = v7;
  }
  else
  {
    v5 = a3 + 1;
    v8 = *(unsigned __int8 *)a3;
    v9 = a4 - v5;
  }
  v10 = v7 > 0;
  deviceFlags = self->_deviceFlags;
  v22 = 0;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:](self, "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:", v8, &deviceFlags, (char *)&v22 + 4, &v22);
  v11 = 0;
  v12 = 2;
  if (!v10 || v9 <= 1)
    v12 = 0;
  if (v10 && v9 > 1)
  {
    v13 = &v5[v12];
    if (a4 - v13 >= 1)
      v11 = (unint64_t)(*v13 & 8) << 33;
  }
  v14 = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | v11;
  deviceFlags = v14;
  v15 = self->_deviceFlags;
  v16 = v14 != v15;
  if (v14 == v15)
  {
    v17 = HIDWORD(v22);
    if (v17 != -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags))
      goto LABEL_16;
  }
  else
  {
    self->_deviceFlags = v14;
    v19 = HIDWORD(v22);
    if (v19 != -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags))
    {
LABEL_16:
      -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v22));
      v16 = 1;
      v20 = v22;
      if (v20 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement"))
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  v18 = v22;
  if (v18 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement"))
  {
LABEL_17:
    -[CBDevice setProximityPairingSecondaryPlacement:](self, "setProximityPairingSecondaryPlacement:", v22);
    self->_discoveryFlags |= 0x8000uLL;
    goto LABEL_18;
  }
LABEL_13:
  self->_discoveryFlags |= 0x8000uLL;
  if (v16)
LABEL_18:
    self->_changeFlags |= 0x80000008000uLL;
}

- (void)_parseStatusOne:(unsigned __int8)a3 deviceFlags:(unint64_t *)a4 primaryPlacement:(int *)a5 secondaryPlacement:(int *)a6
{
  int v6;
  unint64_t v7;
  int v8;
  unint64_t v9;

  if (self->_proximityPairingProductID == 8202)
  {
    v6 = (a3 >> 5) & 3;
    if (v6 == 1)
      goto LABEL_15;
    goto LABEL_12;
  }
  v7 = *a4 & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a3 & 1) << 35);
  *a4 = v7;
  v8 = (a3 >> 3) & 3;
  if (v8 == 1)
    goto LABEL_8;
  if (v8 != 3)
  {
    if (v8 != 2)
    {
LABEL_9:
      v9 = *a4 & 0xFFFFFFBFFFFFFFFFLL;
      goto LABEL_11;
    }
    v8 = 3;
LABEL_8:
    *a6 = v8;
    goto LABEL_9;
  }
  v9 = v7 | 0x4000000000;
LABEL_11:
  *a4 = v9 & 0xFFFFFFF9FFFFFFFFLL | ((((unint64_t)(a3 & 0x20) >> 5) & 1) << 34) | ((((unint64_t)(a3 & 0x40) >> 6) & 1) << 33);
  v6 = (a3 >> 1) & 3;
  if (v6 == 1)
    goto LABEL_15;
LABEL_12:
  if (v6 != 3)
  {
    if (v6 != 2)
    {
LABEL_16:
      *a4 = *a4 & 0xFFFFFFDEFFFFFFFFLL | ((((unint64_t)(a3 & 0x80) >> 7) & 1) << 32);
      return;
    }
    v6 = 3;
LABEL_15:
    *a5 = v6;
    goto LABEL_16;
  }
  *a4 = *a4 & 0xFFFFFFDEFFFFFFFFLL | 0x2000000000 | ((((unint64_t)(a3 & 0x80) >> 7) & 1) << 32);
}

- (void)_parseProximityPairingAirPodsMismatchedPtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  uint64_t v8;
  const char *v9;
  _BOOL4 v11;
  char v12;
  char v13;
  int v14;
  int v15;
  int v16;
  int batteryInfoCase;
  _BOOL4 v18;
  char v19;
  char v20;
  int v21;
  int v22;
  int v23;
  char v24;
  char v25;
  int v26;
  int v27;
  int v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  unsigned int v37;
  unint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  unint64_t deviceFlags;
  uint64_t v44;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    v8 = 0;
    v9 = (const char *)v7;
  }
  else
  {
    v5 = a3 + 1;
    v8 = *(unsigned __int8 *)a3;
    v9 = (const char *)(a4 - v5);
  }
  deviceFlags = self->_deviceFlags;
  v44 = 0;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:](self, "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:", v8, &deviceFlags, (char *)&v44 + 4, &v44);
  v11 = v7 > 0 && (uint64_t)v9 > 0;
  if (!v11)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v13 = *v5++;
  v12 = v13;
  if (v13 != -1)
  {
    if (v12 < 0)
    {
      v14 = 256;
      goto LABEL_16;
    }
LABEL_15:
    v14 = 512;
LABEL_16:
    v15 = v12 & 0x7F;
    if (v15 >= 100)
      v15 = 100;
    v16 = v15 | v14;
    batteryInfoCase = self->_batteryInfoCase;
    v18 = v16 != batteryInfoCase;
    if (v16 != batteryInfoCase)
      goto LABEL_19;
    goto LABEL_20;
  }
  LOWORD(v16) = 0;
  v18 = self->_batteryInfoCase != 0;
  if (self->_batteryInfoCase)
LABEL_19:
    self->_batteryInfoCase = v16;
LABEL_20:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v19 = 0;
    goto LABEL_27;
  }
  v20 = *v5++;
  v19 = v20;
  if (v20 != -1)
  {
    if (v19 < 0)
    {
      v21 = 256;
      goto LABEL_28;
    }
LABEL_27:
    v21 = 512;
LABEL_28:
    v22 = v19 & 0x7F;
    if (v22 >= 100)
      v22 = 100;
    v23 = v22 | v21;
    if (v23 != self->_batteryInfoLeft)
      goto LABEL_31;
    goto LABEL_32;
  }
  LOWORD(v23) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_31:
    self->_batteryInfoLeft = v23;
    v18 = 1;
  }
LABEL_32:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v24 = 0;
    goto LABEL_39;
  }
  v25 = *v5++;
  v24 = v25;
  if (v25 != -1)
  {
    if (v24 < 0)
    {
      v26 = 256;
      goto LABEL_40;
    }
LABEL_39:
    v26 = 512;
LABEL_40:
    v27 = v24 & 0x7F;
    if (v27 >= 100)
      v27 = 100;
    v28 = v26 | v27;
    if (v28 != self->_batteryInfoRight)
      goto LABEL_43;
    goto LABEL_44;
  }
  LOWORD(v28) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_43:
    self->_batteryInfoRight = v28;
    v18 = 1;
  }
LABEL_44:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v29 = 0;
    v31 = 0;
    if (!-[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
      goto LABEL_51;
    goto LABEL_50;
  }
  v30 = *v5++;
  v29 = v30;
  v31 = v30 & 7;
  if ((_DWORD)v31 != -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
  {
LABEL_50:
    -[CBDevice setAccessoryStatusLidOpenCount:](self, "setAccessoryStatusLidOpenCount:", v31);
    v18 = 1;
  }
LABEL_51:
  deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v29 & 8) >> 3) & 1) << 36);
  if (a4 - v5 >= 1)
  {
    v33 = *(unsigned __int8 *)v5++;
    v32 = v33;
    if (-[CBDevice colorInfo](self, "colorInfo") == v33)
      goto LABEL_54;
    goto LABEL_53;
  }
  v32 = 0;
  if (-[CBDevice colorInfo](self, "colorInfo"))
  {
LABEL_53:
    -[CBDevice setColorInfo:](self, "setColorInfo:", v32, deviceFlags);
    v18 = 1;
  }
LABEL_54:
  v34 = a4 - v5;
  if (a4 - v5 < 1)
  {
    v36 = 0;
  }
  else
  {
    v35 = *v5++;
    v36 = (unint64_t)(v35 & 1) << 43;
  }
  v37 = 0;
  v38 = deviceFlags & 0xFFFFF7FFFFFFFFFFLL | v36;
  deviceFlags = v38;
  if (v34 >= 1 && a4 - v5 - 12 >= 2)
    v37 = *((unsigned __int16 *)v5 + 6);
  if (v37 == self->_proximityPairingOtherBudProductID)
  {
    if (v38 == self->_deviceFlags)
      goto LABEL_64;
  }
  else
  {
    self->_proximityPairingOtherBudProductID = v37;
    v18 = 1;
    if (v38 == self->_deviceFlags)
    {
LABEL_64:
      v39 = HIDWORD(v44);
      if (v39 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags))
        goto LABEL_65;
      goto LABEL_70;
    }
  }
  self->_deviceFlags = v38;
  v18 = 1;
  v41 = HIDWORD(v44);
  if (v41 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags))
  {
LABEL_65:
    v40 = v44;
    if (v40 == -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement"))
      goto LABEL_66;
LABEL_71:
    -[CBDevice setProximityPairingSecondaryPlacement:](self, "setProximityPairingSecondaryPlacement:", v44);
    self->_discoveryFlags |= 0x8000uLL;
    goto LABEL_72;
  }
LABEL_70:
  -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v44));
  v18 = 1;
  v42 = v44;
  if (v42 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement"))
    goto LABEL_71;
LABEL_66:
  self->_discoveryFlags |= 0x8000uLL;
  if (v18)
LABEL_72:
    self->_changeFlags |= 0x80000008000uLL;
}

- (void)_parseProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  const char *v11;
  int v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *objectSetupFontCode;
  NSString *v18;
  char v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSString *objectSetupMessage;
  NSString *v26;
  size_t v27;
  NSString *v28;

  if (a4 - a3 < 1)
  {
    v12 = 0;
    v7 = 0;
LABEL_9:
    v9 = 0;
    v10 = 0;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v7 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v8 = *((unsigned __int8 *)a3 + 1);
  v9 = (v8 >> 2) & 3;
  v10 = v8 & 3;
  if (a4 - a3 - 2 < 1)
  {
    v12 = 0;
    goto LABEL_11;
  }
  v11 = a3 + 3;
  v12 = *((unsigned __int8 *)a3 + 2);
  v13 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v13 >= 7)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3 + 3, 7, 4);
    v11 = a3 + 10;
    v13 = a4 - (a3 + 10);
  }
  else
  {
    v14 = 0;
    if ((v7 & 0x10) == 0)
    {
      v15 = 0;
      goto LABEL_13;
    }
  }
  if (v13 < 1)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)v13 >= 0xC)
    v27 = 12;
  else
    v27 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v11, strnlen(v11, v27), 4);
LABEL_13:
  if (v7 != self->_objectSetupFlags)
  {
    self->_objectSetupFlags = v7;
    v16 = 0x10000;
    if (v9 == self->_objectSetupBatteryPerformance)
      goto LABEL_18;
    goto LABEL_17;
  }
  v16 = 0;
  if (v9 != self->_objectSetupBatteryPerformance)
  {
LABEL_17:
    self->_objectSetupBatteryPerformance = v9;
    v16 = 0x10000;
  }
LABEL_18:
  if (v10 == self->_objectSetupBatteryState)
  {
    if (v12 == self->_objectSetupColorCode)
      goto LABEL_21;
    goto LABEL_20;
  }
  self->_objectSetupBatteryState = v10;
  v16 = 0x10000;
  if (v12 != self->_objectSetupColorCode)
  {
LABEL_20:
    self->_objectSetupColorCode = v12;
    v16 = 0x10000;
  }
LABEL_21:
  objectSetupFontCode = self->_objectSetupFontCode;
  v28 = v14;
  v18 = objectSetupFontCode;
  if (v28 == v18)
  {

    objectSetupMessage = self->_objectSetupMessage;
    v21 = v15;
    v22 = objectSetupMessage;
    if (v21 != v22)
      goto LABEL_25;
LABEL_34:

    goto LABEL_37;
  }
  if ((v28 == 0) == (v18 != 0))
  {

LABEL_33:
    objc_storeStrong((id *)&self->_objectSetupFontCode, v14);
    v16 |= 0x10000uLL;
    v26 = self->_objectSetupMessage;
    v21 = v15;
    v22 = v26;
    if (v21 != v22)
      goto LABEL_25;
    goto LABEL_34;
  }
  v19 = -[NSString isEqual:](v28, "isEqual:", v18);

  if ((v19 & 1) == 0)
    goto LABEL_33;
  v20 = self->_objectSetupMessage;
  v21 = v15;
  v22 = v20;
  if (v21 == v22)
    goto LABEL_34;
LABEL_25:
  v23 = v22;
  if ((v21 == 0) != (v22 != 0))
  {
    v24 = -[NSString isEqual:](v21, "isEqual:", v22);

    if ((v24 & 1) != 0)
      goto LABEL_37;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_objectSetupMessage, v15);
  v16 |= 0x10000uLL;
LABEL_37:
  self->_discoveryFlags |= 0x10000uLL;
  self->_changeFlags |= v16;

}

- (void)_parseProximityPairingAccessoryStatusPtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v12;
  char v13;
  char v14;
  int v15;
  int v16;
  int v17;
  char v18;
  char v19;
  int v20;
  int v21;
  int v22;
  char v23;
  char v24;
  int v25;
  int v26;
  int v27;
  _BOOL4 v28;
  unsigned int v29;
  void *v30;
  NSString *firmwareVersion;
  NSString *v32;
  char v33;
  int v35;
  double v36;
  double v38;
  NSString *v39;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    v8 = 0;
  }
  else
  {
    v5 = a3 + 1;
    v8 = *(unsigned __int8 *)a3;
  }
  if ((v8 & 7) != -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
  {
    -[CBDevice setAccessoryStatusLidOpenCount:](self, "setAccessoryStatusLidOpenCount:", v8 & 7);
    v9 = 0x80000000080;
    v10 = (v8 >> 3) & 7;
    if (-[CBDevice accessoryStatusFlags](self, "accessoryStatusFlags") == (_DWORD)v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  v9 = 0;
  v10 = (v8 >> 3) & 7;
  if (-[CBDevice accessoryStatusFlags](self, "accessoryStatusFlags") != (_DWORD)v10)
  {
LABEL_8:
    -[CBDevice setAccessoryStatusFlags:](self, "setAccessoryStatusFlags:", v10);
    v9 = 0x80000000080;
  }
LABEL_9:
  v12 = v7 > 0 && a4 - v5 > 0;
  if (!v12)
  {
    v13 = 0;
    goto LABEL_20;
  }
  v14 = *v5++;
  v13 = v14;
  if (v14 != -1)
  {
    if (v13 < 0)
    {
      v15 = 256;
      goto LABEL_21;
    }
LABEL_20:
    v15 = 512;
LABEL_21:
    v16 = v13 & 0x7F;
    if (v16 >= 100)
      v16 = 100;
    v17 = v16 | v15;
    if (v17 != self->_batteryInfoCase)
      goto LABEL_24;
    goto LABEL_25;
  }
  LOWORD(v17) = 0;
  if (self->_batteryInfoCase)
  {
LABEL_24:
    self->_batteryInfoCase = v17;
    v9 = 0x80000000080;
  }
LABEL_25:
  if (a4 - v5 <= 0)
    v12 = 0;
  if (!v12)
  {
    v18 = 0;
    goto LABEL_32;
  }
  v19 = *v5++;
  v18 = v19;
  if (v19 != -1)
  {
    if (v18 < 0)
    {
      v20 = 256;
      goto LABEL_33;
    }
LABEL_32:
    v20 = 512;
LABEL_33:
    v21 = v18 & 0x7F;
    if (v21 >= 100)
      v21 = 100;
    v22 = v20 | v21;
    if (v22 != self->_batteryInfoLeft)
      goto LABEL_36;
    goto LABEL_37;
  }
  LOWORD(v22) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_36:
    self->_batteryInfoLeft = v22;
    v9 = 0x80000000080;
  }
LABEL_37:
  if (a4 - v5 <= 0)
    v12 = 0;
  if (!v12)
  {
    v23 = 0;
    goto LABEL_44;
  }
  v24 = *v5++;
  v23 = v24;
  if (v24 != -1)
  {
    if (v23 < 0)
    {
      v25 = 256;
      goto LABEL_45;
    }
LABEL_44:
    v25 = 512;
LABEL_45:
    v26 = v23 & 0x7F;
    if (v26 >= 100)
      v26 = 100;
    v27 = v25 | v26;
    if (v27 != self->_batteryInfoRight)
      goto LABEL_48;
    goto LABEL_49;
  }
  LOWORD(v27) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_48:
    self->_batteryInfoRight = v27;
    v9 |= 0x80000000080uLL;
  }
LABEL_49:
  v28 = a4 - v5 > 2 && v12;
  if (v28)
  {
    v29 = *(unsigned __int16 *)v5 | (*((unsigned __int8 *)v5 + 2) << 16);
    v5 += 3;
  }
  else
  {
    v29 = 0;
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u.%u.%u"), HIWORD(v29), BYTE1(v29), v29);
  firmwareVersion = self->_firmwareVersion;
  v39 = v30;
  v32 = firmwareVersion;
  if (v39 == v32)
  {

  }
  else
  {
    if ((v39 == 0) == (v32 != 0))
    {

      goto LABEL_67;
    }
    v33 = -[NSString isEqual:](v39, "isEqual:", v32);

    if ((v33 & 1) == 0)
    {
LABEL_67:
      objc_storeStrong((id *)&self->_firmwareVersion, v30);
      v9 |= 0x80000000080uLL;
      if (a4 - v5 <= 0 || !v28)
        goto LABEL_71;
LABEL_64:
      v35 = *(unsigned __int8 *)v5;
      -[CBDevice accessoryStatusOBCTime](self, "accessoryStatusOBCTime");
      if (v36 == (double)v35)
        goto LABEL_73;
      goto LABEL_72;
    }
  }
  if (a4 - v5 > 0 && v28)
    goto LABEL_64;
LABEL_71:
  v35 = 0;
  -[CBDevice accessoryStatusOBCTime](self, "accessoryStatusOBCTime");
  if (v38 != (double)0)
  {
LABEL_72:
    -[CBDevice setAccessoryStatusOBCTime:](self, "setAccessoryStatusOBCTime:", (double)(600 * v35));
    v9 |= 0x80000000080uLL;
  }
LABEL_73:
  self->_discoveryFlags |= 0x80uLL;
  self->_changeFlags |= v9;

}

- (void)_parseProximityPairingV2Ptr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  uint64_t v8;
  const char *v9;
  _BOOL4 v11;
  char v12;
  char v13;
  int v14;
  int v15;
  int v16;
  int batteryInfoCase;
  _BOOL4 v18;
  char v19;
  char v20;
  int v21;
  int v22;
  int v23;
  char v24;
  char v25;
  int v26;
  int v27;
  int v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  unint64_t deviceFlags;
  uint64_t v38;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    v8 = 0;
    v9 = (const char *)v7;
  }
  else
  {
    v5 = a3 + 1;
    v8 = *(unsigned __int8 *)a3;
    v9 = (const char *)(a4 - v5);
  }
  deviceFlags = self->_deviceFlags;
  v38 = 0;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:](self, "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:", v8, &deviceFlags, (char *)&v38 + 4, &v38);
  v11 = v7 > 0 && (uint64_t)v9 > 0;
  if (!v11)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v13 = *v5++;
  v12 = v13;
  if (v13 != -1)
  {
    if (v12 < 0)
    {
      v14 = 256;
      goto LABEL_16;
    }
LABEL_15:
    v14 = 512;
LABEL_16:
    v15 = v12 & 0x7F;
    if (v15 >= 100)
      v15 = 100;
    v16 = v15 | v14;
    batteryInfoCase = self->_batteryInfoCase;
    v18 = v16 != batteryInfoCase;
    if (v16 != batteryInfoCase)
      goto LABEL_19;
    goto LABEL_20;
  }
  LOWORD(v16) = 0;
  v18 = self->_batteryInfoCase != 0;
  if (self->_batteryInfoCase)
LABEL_19:
    self->_batteryInfoCase = v16;
LABEL_20:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v19 = 0;
    goto LABEL_27;
  }
  v20 = *v5++;
  v19 = v20;
  if (v20 != -1)
  {
    if (v19 < 0)
    {
      v21 = 256;
      goto LABEL_28;
    }
LABEL_27:
    v21 = 512;
LABEL_28:
    v22 = v19 & 0x7F;
    if (v22 >= 100)
      v22 = 100;
    v23 = v21 | v22;
    if (v23 != self->_batteryInfoLeft)
      goto LABEL_31;
    goto LABEL_32;
  }
  LOWORD(v23) = 0;
  if (self->_batteryInfoLeft)
  {
LABEL_31:
    self->_batteryInfoLeft = v23;
    v18 = 1;
  }
LABEL_32:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v24 = 0;
    goto LABEL_39;
  }
  v25 = *v5++;
  v24 = v25;
  if (v25 != -1)
  {
    if (v24 < 0)
    {
      v26 = 256;
      goto LABEL_40;
    }
LABEL_39:
    v26 = 512;
LABEL_40:
    v27 = v24 & 0x7F;
    if (v27 >= 100)
      v27 = 100;
    v28 = v26 | v27;
    if (v28 != self->_batteryInfoRight)
      goto LABEL_43;
    goto LABEL_44;
  }
  LOWORD(v28) = 0;
  if (self->_batteryInfoRight)
  {
LABEL_43:
    self->_batteryInfoRight = v28;
    v18 = 1;
  }
LABEL_44:
  if (a4 - v5 <= 0)
    v11 = 0;
  if (!v11)
  {
    v29 = 0;
    v31 = 0;
    if (!-[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
      goto LABEL_51;
    goto LABEL_50;
  }
  v30 = *v5++;
  v29 = v30;
  v31 = v30 & 7;
  if ((_DWORD)v31 != -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
  {
LABEL_50:
    -[CBDevice setAccessoryStatusLidOpenCount:](self, "setAccessoryStatusLidOpenCount:", v31);
    v18 = 1;
  }
LABEL_51:
  deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v29 & 8) >> 3) & 1) << 36);
  if (a4 - v5 >= 1)
  {
    v32 = *(unsigned __int8 *)v5;
    if (-[CBDevice colorInfo](self, "colorInfo") == (_DWORD)v32)
      goto LABEL_54;
    goto LABEL_53;
  }
  v32 = 0;
  if (-[CBDevice colorInfo](self, "colorInfo"))
  {
LABEL_53:
    -[CBDevice setColorInfo:](self, "setColorInfo:", v32, deviceFlags);
    v18 = 1;
  }
LABEL_54:
  if (deviceFlags == self->_deviceFlags)
  {
    v33 = HIDWORD(v38);
    if (v33 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement"))
      goto LABEL_56;
  }
  else
  {
    self->_deviceFlags = deviceFlags;
    v18 = 1;
    v35 = HIDWORD(v38);
    if (v35 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement"))
    {
LABEL_56:
      v34 = v38;
      if (v34 == -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement", deviceFlags))goto LABEL_57;
LABEL_61:
      -[CBDevice setProximityPairingSecondaryPlacement:](self, "setProximityPairingSecondaryPlacement:", v38);
      self->_discoveryFlags |= 0x4000uLL;
      goto LABEL_62;
    }
  }
  -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v38), deviceFlags);
  v18 = 1;
  v36 = v38;
  if (v36 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement"))
    goto LABEL_61;
LABEL_57:
  self->_discoveryFlags |= 0x4000uLL;
  if (v18)
LABEL_62:
    self->_changeFlags |= 0x80000004000uLL;
}

- (void)_parseProximityPairingFindMyAccessoryStatusPtr:(const char *)a3 end:(const char *)a4
{
  char v4;
  int v5;
  unsigned int v6;
  float v7;
  int v8;

  if (a4 - a3 >= 1)
  {
    v4 = *a3++;
    v5 = v4 & 3;
    if (v5 == self->_peerStatusFlag)
      goto LABEL_4;
    goto LABEL_3;
  }
  LOBYTE(v5) = 0;
  if (self->_peerStatusFlag)
  {
LABEL_3:
    self->_peerStatusFlag = v5;
    self->_changedTypesInternal.bitArray[1] |= 4u;
  }
LABEL_4:
  if (a4 - a3 < 1)
  {
    v7 = 0.0;
  }
  else
  {
    v6 = *(unsigned __int8 *)a3++;
    v7 = (float)v6;
  }
  v8 = (int)(float)(v7 / 100.0);
  if (self->_batteryInfoMain != v8)
  {
    self->_batteryInfoMain = v8;
    self->_changedTypesInternal.bitArray[1] |= 4u;
  }
  if (a4 - a3 <= 0)
  {
    self->_transmitPowerOne = 0;
    goto LABEL_17;
  }
  self->_transmitPowerOne = *a3;
  if ((uint64_t)&a4[~(unint64_t)a3] <= 0)
  {
LABEL_17:
    self->_transmitPowerTwo = 0;
    self->_transmitPowerThree = 0;
    self->_discoveryTypesInternal.bitArray[1] |= 4u;
    return;
  }
  self->_transmitPowerTwo = a3[1];
  if (a4 - (a3 + 2) < 1)
    self->_transmitPowerThree = 0;
  else
    self->_transmitPowerThree = a3[2];
  self->_discoveryTypesInternal.bitArray[1] |= 4u;
}

- (void)_parseProximityServiceData:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  unint64_t discoveryFlags;

  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  if (v6 <= 0)
  {
    self->_proximityServiceSubType = 0;
    discoveryFlags = self->_discoveryFlags;
    self->_discoveryFlags = discoveryFlags | 0x80000000;
  }
  else
  {
    v7 = &v5[v6];
    v10 = *v5;
    v9 = v5 + 1;
    v8 = v10;
    self->_proximityServiceSubType = v10;
    discoveryFlags = self->_discoveryFlags;
    self->_discoveryFlags = discoveryFlags | 0x80000000;
    if (v10 == 6)
    {
      -[CBDevice _parseProximityServiceWatchSetupPtr:end:](self, "_parseProximityServiceWatchSetupPtr:end:", v9, v7);
    }
    else if (v8 == 1)
    {
      -[CBDevice _parseProximityServiceHomeKitSetupPtr:end:](self, "_parseProximityServiceHomeKitSetupPtr:end:", v9, v7);
    }
  }
  self->_changeFlags |= self->_discoveryFlags ^ discoveryFlags;
}

- (void)_parseProximityServiceHomeKitSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5;
  int v6;
  unsigned __int16 v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  NSData *proximityServiceSetupHash;
  NSData *v17;
  char v18;
  NSData *v19;

  v5 = a4 - a3;
  if (a4 - a3 < 2)
  {
    v7 = 0;
    v13 = 0;
    v10 = 0;
    v8 = 0;
    v6 = 0;
LABEL_15:
    v9 = 0;
LABEL_16:
    v11 = 0;
    v12 = 0;
    goto LABEL_17;
  }
  v6 = *(unsigned __int16 *)a3;
  if (a4 - a3 - 2 < 2)
  {
    v7 = 0;
    goto LABEL_14;
  }
  v7 = *((_WORD *)a3 + 1);
  if (v5 - 4 < 1)
  {
LABEL_14:
    v13 = 0;
    v10 = 0;
    v8 = 0;
    goto LABEL_15;
  }
  v8 = *((unsigned __int8 *)a3 + 4);
  if (v5 - 5 < 2)
  {
    v13 = 0;
    v10 = 0;
    goto LABEL_15;
  }
  v9 = *(unsigned __int16 *)(a3 + 5);
  if (v5 - 7 < 1)
  {
    v13 = 0;
    v10 = 0;
    goto LABEL_16;
  }
  v10 = *((unsigned __int8 *)a3 + 7);
  if (v5 - 8 < 1)
  {
    v13 = 0;
    goto LABEL_16;
  }
  v11 = *((unsigned __int8 *)a3 + 8);
  if (v5 - 9 < 1)
  {
    v13 = 0;
    v12 = 0;
    v14 = *((unsigned __int16 *)a3 + 1);
    if (v6 != self->_proximityServiceVendorID)
      goto LABEL_24;
    goto LABEL_18;
  }
  v12 = 0;
  v13 = *((unsigned __int8 *)a3 + 9);
  if ((v13 & 2) == 0 || a4 - (a3 + 10) < 4)
  {
LABEL_17:
    v14 = v7;
    if (v6 != self->_proximityServiceVendorID)
      goto LABEL_24;
    goto LABEL_18;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 10, 4);
  v14 = v7;
  if (v6 != self->_proximityServiceVendorID)
  {
LABEL_24:
    self->_proximityServiceVendorID = v6;
    v15 = 0x100000000;
    if (self->_proximityServiceProductID == v14)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_18:
  v15 = 0;
  if (self->_proximityServiceProductID != v14)
  {
LABEL_25:
    self->_proximityServiceProductID = v14;
    v15 = 0x100000000;
  }
LABEL_26:
  if (v8 == self->_proximityServiceCategory)
  {
    if (v9 == self->_proximityServicePSM)
      goto LABEL_28;
  }
  else
  {
    self->_proximityServiceCategory = v8;
    v15 = 0x100000000;
    if (v9 == self->_proximityServicePSM)
    {
LABEL_28:
      if (v10 == self->_proximityServiceMeasuredPower)
        goto LABEL_29;
      goto LABEL_38;
    }
  }
  self->_proximityServicePSM = v9;
  v15 = 0x100000000;
  if (v10 == self->_proximityServiceMeasuredPower)
  {
LABEL_29:
    if (v11 == self->_proximityServiceVersion)
      goto LABEL_30;
    goto LABEL_39;
  }
LABEL_38:
  self->_proximityServiceMeasuredPower = v10;
  v15 |= 0x100000000uLL;
  if (v11 == self->_proximityServiceVersion)
  {
LABEL_30:
    if (v13 == self->_proximityServiceFlags)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_39:
  self->_proximityServiceVersion = v11;
  v15 |= 0x100000000uLL;
  if (v13 != self->_proximityServiceFlags)
  {
LABEL_31:
    self->_proximityServiceFlags = v13;
    v15 |= 0x100000000uLL;
  }
LABEL_32:
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  v19 = v12;
  v17 = proximityServiceSetupHash;
  if (v19 == v17)
  {

  }
  else
  {
    if ((v19 == 0) != (v17 != 0))
    {
      v18 = -[NSData isEqual:](v19, "isEqual:", v17);

      if ((v18 & 1) != 0)
        goto LABEL_44;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_proximityServiceSetupHash, v12);
    v15 |= 0x100000000uLL;
  }
LABEL_44:
  self->_discoveryFlags |= 0x100000000uLL;
  self->_changeFlags |= v15;

}

- (void)_parseProximityServiceWatchSetupPtr:(const char *)a3 end:(const char *)a4
{
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4 - a3);
  -[CBDevice watchSetupData](self, "watchSetupData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v7 = v6;
  if (v9 == v7)
  {

  }
  else
  {
    if ((v9 == 0) != (v7 != 0))
    {
      v8 = objc_msgSend(v9, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    -[CBDevice setWatchSetupData:](self, "setWatchSetupData:", v9);
    self->_changedTypesInternal.bitArray[2] |= 2u;
  }
LABEL_8:
  self->_discoveryTypesInternal.bitArray[2] |= 2u;

}

- (void)_parseSafetyAlertsSegmentServiceData:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  char v7;
  unsigned int v8;
  NSData *v9;
  NSData *safetyAlertsAlertID;
  NSData *btAddressData;
  _BYTE *v12;
  void *v13;
  unint64_t v14;
  char *v15;
  _BYTE *v16;
  _BYTE *v17;
  NSData *v18;
  NSData *safetyAlertsSegmentAlertData;
  id obj;

  v4 = objc_retainAutorelease(a3);
  v5 = (char *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  if (v6 >= 1)
  {
    v7 = *v5;
    if ((*v5 & 0xF) == 1)
    {
      self->_safetyAlertsVersion = 1;
      if ((unint64_t)v6 >= 2)
      {
        v8 = v5[1];
        if ((v8 & 0xF) == 3 && v8 - 64 >= 0xFFFFFFD0)
        {
          self->_safetyAlertsSegmentSegmentsTotal = 3;
          self->_safetyAlertsSegmentSegmentNumber = v8 >> 4;
          if ((unint64_t)v6 >= 5)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5 + 2, 3);
            v9 = (NSData *)objc_claimAutoreleasedReturnValue();
            safetyAlertsAlertID = self->_safetyAlertsAlertID;
            self->_safetyAlertsAlertID = v9;

            btAddressData = self->_btAddressData;
            if (btAddressData)
            {
              if (-[NSData length](btAddressData, "length") == 6)
              {
                obj = objc_retainAutorelease((id)-[NSData mutableCopy](self->_btAddressData, "mutableCopy"));
                v12 = (_BYTE *)objc_msgSend(obj, "mutableBytes");
                *v12 = *v12 & 0x3F | v7 & 0xC0;
                v13 = obj;
                if (self->_safetyAlertsSegmentSegmentNumber == self->_safetyAlertsSegmentSegmentsTotal)
                  v14 = 12;
                else
                  v14 = 13;
                if (v6 - 5 >= v14)
                {
                  v15 = &v5[v6];
                  v16 = v5 + 5;
                  objc_msgSend(obj, "appendBytes:length:", v16, v14);
                  v17 = &v16[v14];
                  objc_storeStrong((id *)&self->_safetyAlertsSegmentSignature, obj);
                  if (v15 - v17 >= 1)
                  {
                    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, ((_BYTE)v15 - (_BYTE)v17));
                    v18 = (NSData *)objc_claimAutoreleasedReturnValue();
                    safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
                    self->_safetyAlertsSegmentAlertData = v18;

                  }
                  self->_discoveryTypesInternal.bitArray[3] |= 0x40u;
                  v13 = obj;
                }

              }
            }
          }
        }
      }
    }
  }
}

- (void)_parseSpatialInteractionPtr:(const char *)a3 end:(const char *)a4
{
  const char *v7;
  int v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *spatialInteractionIdentifiers;
  NSArray *v15;
  char v16;
  NSData *v17;
  NSData *v18;
  NSData *v19;
  NSData *v20;
  char v21;
  NSArray *v22;
  NSArray *v23;
  NSData *spatialInteractionUWBConfigData;
  NSData *v25;
  NSData *v26;
  void *v27;
  void *v28;
  NSArray *v29;

  if (a4 - a3 <= 0)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = 0;
  }
  else
  {
    v7 = a3 + 1;
    v8 = *(unsigned __int8 *)a3;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = v8 & 3;
    if ((v8 & 3) == 0)
    {
LABEL_5:
      v12 = 0;
      if ((v8 & 8) != 0 && a4 - v7 >= 5)
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, 5);
      if (v8 == self->_spatialInteractionFlags)
        goto LABEL_9;
      goto LABEL_12;
    }
    if (a4 - v7 >= 3)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, 3);
      v7 = a3 + 4;
      objc_msgSend(v9, "addObject:", v11);

      if (v10 == 1)
        goto LABEL_5;
      if (a4 - v7 >= 3)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 4, 3);
        v7 = a3 + 7;
        objc_msgSend(v9, "addObject:", v27);

        if (v10 == 2)
          goto LABEL_5;
        if (a4 - v7 >= 3)
        {
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 7, 3);
          v7 = a3 + 10;
          objc_msgSend(v9, "addObject:", v28);

          goto LABEL_5;
        }
      }
    }
  }
  v12 = 0;
  if (v8 == self->_spatialInteractionFlags)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_13;
  }
LABEL_12:
  self->_spatialInteractionFlags = v8;
  v13 = 0x40000;
LABEL_13:
  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  v29 = (NSArray *)v9;
  v15 = spatialInteractionIdentifiers;
  if (v29 == v15)
  {

    v22 = v29;
    goto LABEL_23;
  }
  if ((v29 == 0) == (v15 != 0))
  {

    goto LABEL_22;
  }
  v16 = -[NSArray isEqual:](v29, "isEqual:", v15);

  if ((v16 & 1) == 0)
  {
LABEL_22:
    v23 = (NSArray *)-[NSArray copy](v29, "copy");
    v22 = self->_spatialInteractionIdentifiers;
    self->_spatialInteractionIdentifiers = v23;
    v13 = 0x40000;
LABEL_23:

    spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
    v18 = v12;
    v19 = spatialInteractionUWBConfigData;
    if (v18 != v19)
      goto LABEL_17;
LABEL_24:

    v25 = v18;
    goto LABEL_27;
  }
  v17 = self->_spatialInteractionUWBConfigData;
  v18 = v12;
  v19 = v17;
  if (v18 == v19)
    goto LABEL_24;
LABEL_17:
  v20 = v19;
  if ((v18 == 0) != (v19 != 0))
  {
    v21 = -[NSData isEqual:](v18, "isEqual:", v19);

    if ((v21 & 1) != 0)
      goto LABEL_28;
  }
  else
  {

  }
  v26 = v18;
  v25 = self->_spatialInteractionUWBConfigData;
  self->_spatialInteractionUWBConfigData = v26;
  v13 = 0x40000;
LABEL_27:

LABEL_28:
  self->_discoveryFlags |= 0x40000uLL;
  self->_changeFlags |= v13;

}

- (void)_parseAirDropPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5;
  const char *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  void *v17;
  id v18;
  char v19;
  int v20;
  unsigned __int16 v21;
  NSData *v22;
  NSData *airdropTempAuthTagData;
  int v24;
  unsigned int v25;
  id v26;

  v5 = a4 - a3;
  if (a4 - a3 < 18)
  {
    v15 = 0;
    v25 = 0;
    v12 = 0;
    v10 = 0;
    v9 = 0;
LABEL_12:
    v11 = 0;
LABEL_13:
    v13 = 0;
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v8 = a3 + 1;
  v9 = *(unsigned __int8 *)a3;
  if ((v9 & 0x40) == 0)
  {
    v10 = 0;
    if ((v9 & 0x80) == 0)
      goto LABEL_4;
    goto LABEL_43;
  }
  if (a4 - v8 < 3)
  {
    v15 = 0;
    v25 = 0;
    v12 = 0;
    v10 = 0;
    goto LABEL_12;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8, 3);
  if ((v9 & 0x80) == 0)
  {
LABEL_4:
    v11 = 0;
    if (v5 - 8 >= 1)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_43:
  if (a4 - (a3 + 4) < 1)
  {
    v15 = 0;
    v25 = 0;
    v12 = 0;
    goto LABEL_12;
  }
  v11 = *((unsigned __int8 *)a3 + 4);
  if (v5 - 8 < 1)
  {
LABEL_45:
    v15 = 0;
    v25 = 0;
    v12 = 0;
    goto LABEL_13;
  }
LABEL_5:
  v12 = *((unsigned __int8 *)a3 + 8);
  if (v5 - 9 < 2)
  {
    v15 = 0;
    v25 = 0;
    goto LABEL_13;
  }
  v13 = __rev16(*(unsigned __int16 *)(a3 + 9));
  if (v5 - 11 < 2)
  {
    v15 = 0;
    v25 = 0;
    goto LABEL_14;
  }
  v25 = __rev16(*(unsigned __int16 *)(a3 + 11));
  if (v5 - 13 < 2)
  {
    v15 = 0;
    goto LABEL_14;
  }
  v14 = __rev16(*(unsigned __int16 *)(a3 + 13));
  if (v5 - 15 < 2)
  {
    v15 = 0;
  }
  else
  {
    v15 = __rev16(*(unsigned __int16 *)(a3 + 15));
    if (a4 - (a3 + 17) >= 1)
    {
      v16 = *((unsigned __int8 *)a3 + 17);
      goto LABEL_16;
    }
  }
LABEL_15:
  v16 = 0;
LABEL_16:
  self->_discoveryTypesInternal.bitArray[0] |= 0x80u;
  if (v9 != -[CBDevice airdropFlags](self, "airdropFlags"))
    self->_airdropFlags = v9;
  -[CBDevice airdropTempAuthTagData](self, "airdropTempAuthTagData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  v18 = v17;
  if (v26 == v18)
  {

    if (v11 != -[CBDevice airdropModel](self, "airdropModel"))
      goto LABEL_34;
LABEL_22:
    if (v12 == -[CBDevice airdropVersion](self, "airdropVersion"))
      goto LABEL_23;
    goto LABEL_35;
  }
  if ((v26 == 0) == (v18 != 0))
  {

LABEL_33:
    v22 = (NSData *)v26;
    airdropTempAuthTagData = self->_airdropTempAuthTagData;
    self->_airdropTempAuthTagData = v22;

    if (v11 != -[CBDevice airdropModel](self, "airdropModel"))
      goto LABEL_34;
    goto LABEL_22;
  }
  v19 = objc_msgSend(v26, "isEqual:", v18);

  if ((v19 & 1) == 0)
    goto LABEL_33;
  if (v11 == -[CBDevice airdropModel](self, "airdropModel"))
    goto LABEL_22;
LABEL_34:
  self->_airdropModel = v11;
  if (v12 == -[CBDevice airdropVersion](self, "airdropVersion"))
  {
LABEL_23:
    if (v13 == -[CBDevice airdropHash1](self, "airdropHash1"))
      goto LABEL_24;
    goto LABEL_36;
  }
LABEL_35:
  self->_airdropVersion = v12;
  if (v13 == -[CBDevice airdropHash1](self, "airdropHash1"))
  {
LABEL_24:
    v20 = -[CBDevice airdropHash2](self, "airdropHash2");
    v21 = v25;
    if (v25 == v20)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  self->_airdropHash1 = v13;
  v24 = -[CBDevice airdropHash2](self, "airdropHash2");
  v21 = v25;
  if (v25 == v24)
  {
LABEL_25:
    if (v14 == -[CBDevice airdropHash3](self, "airdropHash3"))
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  self->_airdropHash2 = v21;
  if (v14 == -[CBDevice airdropHash3](self, "airdropHash3"))
  {
LABEL_26:
    if (v15 == -[CBDevice airdropHash4](self, "airdropHash4"))
      goto LABEL_27;
LABEL_39:
    self->_airdropHash4 = v15;
    if (v16 == -[CBDevice airdropConfigData](self, "airdropConfigData"))
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_38:
  self->_airdropHash3 = v14;
  if (v15 != -[CBDevice airdropHash4](self, "airdropHash4"))
    goto LABEL_39;
LABEL_27:
  if (v16 != -[CBDevice airdropConfigData](self, "airdropConfigData"))
LABEL_28:
    self->_airdropConfigData = v16;
LABEL_29:

}

- (void)_parseMicrosoftManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1 && *a3 == 3)
    -[CBDevice _parseMicrosoftSwiftPairPtr:end:](self, "_parseMicrosoftSwiftPairPtr:end:", a3 + 1);
}

- (void)_parseMicrosoftSwiftPairPtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  BOOL v11;
  int v12;
  const char *v13;
  _BOOL4 v14;
  BOOL v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  size_t v21;
  BOOL v22;
  int v23;
  unsigned __int16 *v24;
  const char *v25;
  BOOL v26;
  char v27;
  const char *v28;
  unsigned __int8 v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  int v33;
  const char *v34;
  const char *v35;
  BOOL v36;
  _BOOL4 v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  char v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  char v47;
  id v48;

  v5 = a3;
  v7 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    v5 = a3 + 1;
    v8 = *(unsigned __int8 *)a3;
    if ((_DWORD)v8 == -[CBDevice mspSubScenario](self, "mspSubScenario"))
      goto LABEL_3;
LABEL_27:
    -[CBDevice setMspSubScenario:](self, "setMspSubScenario:", v8);
    v9 = 0x80000000000000;
    v10 = (const char *)(a4 - v5);
    if ((_DWORD)v8 != 2)
      goto LABEL_4;
LABEL_28:
    v22 = v7 <= 0 || (uint64_t)v10 <= 0;
    v23 = !v22;
    if (v22)
      v24 = (unsigned __int16 *)v5;
    else
      v24 = (unsigned __int16 *)(v5 + 1);
    v25 = (const char *)(a4 - (const char *)v24);
    if (a4 - (const char *)v24 <= 2)
      v23 = 0;
    if (v23 == 1)
    {
      v19 = *v24 | (*((unsigned __int8 *)v24 + 2) << 16);
      v24 = (unsigned __int16 *)((char *)v24 + 3);
      v25 = (const char *)(a4 - (const char *)v24);
    }
    else
    {
      v19 = 0;
    }
    v18 = 0;
    v37 = (uint64_t)v25 > 0;
    if ((v23 & v37) != 0)
      v20 = (const char *)v24;
    else
      v20 = 0;
    if ((v23 & v37) != 0)
      v21 = (size_t)v25;
    else
      v21 = 0;
    goto LABEL_79;
  }
  v8 = 0;
  if (-[CBDevice mspSubScenario](self, "mspSubScenario"))
    goto LABEL_27;
LABEL_3:
  v9 = 0;
  v10 = (const char *)(a4 - v5);
  if ((_DWORD)v8 == 2)
    goto LABEL_28;
LABEL_4:
  if ((_DWORD)v8 != 1)
  {
    v11 = v7 <= 0 || (uint64_t)v10 <= 0;
    v12 = !v11;
    if (v11)
      v13 = v5;
    else
      v13 = v5 + 1;
    v14 = a4 - v13 > 0;
    v15 = (v12 & v14) == 0;
    if ((v12 & v14) != 0)
      v16 = v13;
    else
      v16 = 0;
    if (v15)
      v17 = 0;
    else
      v17 = (const char *)(a4 - v13);
    v18 = 0;
    v19 = 0;
    if ((_DWORD)v8)
      v20 = 0;
    else
      v20 = v16;
    if ((_DWORD)v8)
      v21 = 0;
    else
      v21 = (size_t)v17;
    goto LABEL_79;
  }
  v26 = v7 <= 0 || (uint64_t)v10 <= 0;
  v27 = !v26;
  if (v26)
    v28 = v5;
  else
    v28 = v5 + 1;
  v29 = v27 & (a4 - v28 > 5);
  v30 = 6;
  if (!v29)
    v30 = 0;
  v31 = &v28[v30];
  if (v29)
    v18 = (void *)v28;
  else
    v18 = 0;
  v32 = (const char *)(a4 - v31);
  v33 = v29 & (a4 - v31 > 2);
  if (v33 == 1)
  {
    v19 = *(unsigned __int16 *)v31 | (*((unsigned __int8 *)v31 + 2) << 16);
    v34 = v31 + 3;
    v35 = (const char *)(a4 - v34);
    v36 = a4 - v34 > 0;
    if (a4 - v34 <= 0)
      v20 = 0;
    else
      v20 = v34;
    if (v36)
      v21 = (size_t)v35;
    else
      v21 = 0;
    if (!v18)
      goto LABEL_79;
LABEL_78:
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v18, 6);
    goto LABEL_79;
  }
  v19 = 0;
  v38 = (uint64_t)v32 > 0;
  if ((v33 & v38) != 0)
    v20 = v31;
  else
    v20 = 0;
  if ((v33 & v38) != 0)
    v21 = (size_t)v32;
  else
    v21 = 0;
  if (v18)
    goto LABEL_78;
LABEL_79:
  -[CBDevice mspAddressData](self, "mspAddressData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v18;
  v40 = v39;
  if (v48 == v40)
  {

    if ((_DWORD)v19 != -[CBDevice mspDeviceClass](self, "mspDeviceClass"))
      goto LABEL_90;
LABEL_83:
    if (v20)
      goto LABEL_84;
LABEL_91:
    v42 = 0;
    goto LABEL_92;
  }
  if ((v48 == 0) == (v40 != 0))
  {

LABEL_89:
    -[CBDevice setMspAddressData:](self, "setMspAddressData:", v48);
    v9 = 0x80000000000000;
    if ((_DWORD)v19 != -[CBDevice mspDeviceClass](self, "mspDeviceClass"))
      goto LABEL_90;
    goto LABEL_83;
  }
  v41 = objc_msgSend(v48, "isEqual:", v40);

  if ((v41 & 1) == 0)
    goto LABEL_89;
  if ((_DWORD)v19 == -[CBDevice mspDeviceClass](self, "mspDeviceClass"))
    goto LABEL_83;
LABEL_90:
  -[CBDevice setMspDeviceClass:](self, "setMspDeviceClass:", v19);
  v9 = 0x80000000000000;
  if (!v20)
    goto LABEL_91;
LABEL_84:
  v42 = (void *)strnlen(v20, v21);
  if (v42)
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v20, v42, 4);
LABEL_92:
  -[CBDevice mspDisplayName](self, "mspDisplayName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v42;
  v45 = v43;
  if (v44 == v45)
  {

  }
  else
  {
    v46 = v45;
    if ((v44 == 0) != (v45 != 0))
    {
      v47 = objc_msgSend(v44, "isEqual:", v45);

      if ((v47 & 1) != 0)
        goto LABEL_99;
    }
    else
    {

    }
    -[CBDevice setMspDisplayName:](self, "setMspDisplayName:", v44);
    v9 = 0x80000000000000;
  }
LABEL_99:
  self->_discoveryFlags |= 0x80000000000000uLL;
  self->_changeFlags |= v9;

}

- (void)resetNearbyInfoV2SensitiveProperties
{
  unsigned __int8 v2;
  unsigned __int8 v3;

  self->_nearbyInfoV2InvitationRouteType = 0;
  *(_DWORD *)&self->_nearbyInfoV2DecryptedFlags = 0;
  v2 = self->_discoveryTypesInternal.bitArray[2];
  self->_discoveryTypesInternal.bitArray[1] &= ~0x20u;
  self->_discoveryTypesInternal.bitArray[2] = v2 & 0x97;
  v3 = self->_changedTypesInternal.bitArray[2];
  self->_changedTypesInternal.bitArray[1] &= ~0x20u;
  self->_changedTypesInternal.bitArray[2] = v3 & 0x97;
}

- (id)getSpatialInteractionDeviceTimestampArrayForClientID:(id)a3
{
  id v4;
  NSMutableDictionary *spatialInteractionDeviceTimestampArrayDictionary;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableArray *v8;
  NSMutableArray *spatialInteractionDeviceTimestampArrayClientIDs;
  void *v10;
  NSMutableDictionary *v11;
  id v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
    if (!spatialInteractionDeviceTimestampArrayDictionary || !self->_spatialInteractionDeviceTimestampArrayClientIDs)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      self->_spatialInteractionDeviceTimestampArrayDictionary = v6;

      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      spatialInteractionDeviceTimestampArrayClientIDs = self->_spatialInteractionDeviceTimestampArrayClientIDs;
      self->_spatialInteractionDeviceTimestampArrayClientIDs = v8;

      spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](spatialInteractionDeviceTimestampArrayDictionary, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v4);

      -[NSMutableArray addObject:](self->_spatialInteractionDeviceTimestampArrayClientIDs, "addObject:", v4);
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_spatialInteractionDeviceTimestampArrayDictionary, "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {

    return 0;
  }
}

- (void)setSpatialInteractionDeviceTimestampArrayForClientID:(id)a3 clientID:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *spatialInteractionDeviceTimestampArrayDictionary;
  NSMutableArray *v10;
  NSMutableArray *spatialInteractionDeviceTimestampArrayClientIDs;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14 && v6)
  {
    if (!self->_spatialInteractionDeviceTimestampArrayDictionary
      || (v7 = self->_spatialInteractionDeviceTimestampArrayClientIDs) == 0)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
      self->_spatialInteractionDeviceTimestampArrayDictionary = v8;

      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      spatialInteractionDeviceTimestampArrayClientIDs = self->_spatialInteractionDeviceTimestampArrayClientIDs;
      self->_spatialInteractionDeviceTimestampArrayClientIDs = v10;

      v7 = self->_spatialInteractionDeviceTimestampArrayClientIDs;
    }
    if ((unint64_t)-[NSMutableArray count](v7, "count") >= 6)
    {
      v12 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      -[NSMutableArray objectAtIndexedSubscript:](self->_spatialInteractionDeviceTimestampArrayClientIDs, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

      -[NSMutableArray removeObjectAtIndex:](self->_spatialInteractionDeviceTimestampArrayClientIDs, "removeObjectAtIndex:", 0);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_spatialInteractionDeviceTimestampArrayDictionary, "setObject:forKeyedSubscript:", v14, v6);
  }

}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setAdaptiveVolumeCapability:(unsigned __int8)a3
{
  self->_adaptiveVolumeCapability = a3;
}

- (void)setAudioStreamState:(int)a3
{
  self->_audioStreamState = a3;
}

- (void)setAutoAncCapability:(unsigned __int8)a3
{
  self->_autoAncCapability = a3;
}

- (void)setBleAddressData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setBleAdvertisementData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unint64_t)bleAdvertisementTimestampMachContinuous
{
  return self->_bleAdvertisementTimestampMachContinuous;
}

- (void)setBleAdvertisementTimestampMachContinuous:(unint64_t)a3
{
  self->_bleAdvertisementTimestampMachContinuous = a3;
}

- (void)setCaseVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setClassicRSSI:(char)a3
{
  self->_classicRSSI = a3;
}

- (void)setControllerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_connectedServices = a3;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setConversationDetectCapability:(unsigned __int8)a3
{
  self->_conversationDetectCapability = a3;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_deviceType = a3;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (void)setDoubleTapActionLeft:(char)a3
{
  self->_doubleTapActionLeft = a3;
}

- (void)setDoubleTapActionRight:(char)a3
{
  self->_doubleTapActionRight = a3;
}

- (void)setDoubleTapCapability:(char)a3
{
  self->_doubleTapCapability = a3;
}

- (void)setEndCallCapability:(unsigned __int8)a3
{
  self->_endCallCapability = a3;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void)setIdsDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void)setInterval:(unsigned __int16)a3
{
  self->_interval = a3;
}

- (void)setMicrophoneMode:(char)a3
{
  self->_microphoneMode = a3;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setMuteControlCapability:(unsigned __int8)a3
{
  self->_muteControlCapability = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int)primaryPlacement
{
  return self->_primaryPlacement;
}

- (void)setPrimaryPlacement:(int)a3
{
  self->_primaryPlacement = a3;
}

- (int)secondaryPlacement
{
  return self->_secondaryPlacement;
}

- (void)setSecondaryPlacement:(int)a3
{
  self->_secondaryPlacement = a3;
}

- (void)setPlacementMode:(char)a3
{
  self->_placementMode = a3;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)remoteHostID
{
  return self->_remoteHostID;
}

- (void)setRemoteHostID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void)setSelectiveSpeechListeningCapability:(unsigned __int8)a3
{
  self->_selectiveSpeechListeningCapability = a3;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setSerialNumberLeft:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void)setSerialNumberRight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void)setSmartRoutingMode:(char)a3
{
  self->_smartRoutingMode = a3;
}

- (unsigned)tipiConnectionStatus
{
  return self->_tipiConnectionStatus;
}

- (void)setTipiConnectionStatus:(unsigned __int8)a3
{
  self->_tipiConnectionStatus = a3;
}

- (NSArray)tipiDevices
{
  return self->_tipiDevices;
}

- (void)setTipiDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (unsigned)tipiState
{
  return self->_tipiState;
}

- (void)setTipiState:(unsigned __int8)a3
{
  self->_tipiState = a3;
}

- (NSData)txAddressData
{
  return self->_txAddressData;
}

- (void)setTxAddressData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (void)setVendorIDSource:(unsigned __int8)a3
{
  self->_vendorIDSource = a3;
}

- (unsigned)airdropFlags
{
  return self->_airdropFlags;
}

- (void)setAirdropFlags:(unsigned __int8)a3
{
  self->_airdropFlags = a3;
}

- (void)setAirdropTempAuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (unsigned)airdropModel
{
  return self->_airdropModel;
}

- (void)setAirdropModel:(unsigned __int8)a3
{
  self->_airdropModel = a3;
}

- (unsigned)airdropVersion
{
  return self->_airdropVersion;
}

- (void)setAirdropVersion:(unsigned __int8)a3
{
  self->_airdropVersion = a3;
}

- (unsigned)airdropHash1
{
  return self->_airdropHash1;
}

- (void)setAirdropHash1:(unsigned __int16)a3
{
  self->_airdropHash1 = a3;
}

- (unsigned)airdropHash2
{
  return self->_airdropHash2;
}

- (void)setAirdropHash2:(unsigned __int16)a3
{
  self->_airdropHash2 = a3;
}

- (unsigned)airdropHash3
{
  return self->_airdropHash3;
}

- (void)setAirdropHash3:(unsigned __int16)a3
{
  self->_airdropHash3 = a3;
}

- (unsigned)airdropHash4
{
  return self->_airdropHash4;
}

- (void)setAirdropHash4:(unsigned __int16)a3
{
  self->_airdropHash4 = a3;
}

- (unsigned)airdropConfigData
{
  return self->_airdropConfigData;
}

- (void)setAirdropConfigData:(unsigned __int8)a3
{
  self->_airdropConfigData = a3;
}

- (void)setAirplaySourceAuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (unsigned)airplaySourceFlags
{
  return self->_airplaySourceFlags;
}

- (void)setAirplaySourceFlags:(unsigned __int8)a3
{
  self->_airplaySourceFlags = a3;
}

- (unsigned)airplayTargetConfigSeed
{
  return self->_airplayTargetConfigSeed;
}

- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3
{
  self->_airplayTargetConfigSeed = a3;
}

- (unsigned)airplayTargetFlags
{
  return self->_airplayTargetFlags;
}

- (void)setAirplayTargetFlags:(unsigned __int8)a3
{
  self->_airplayTargetFlags = a3;
}

- (unsigned)airplayTargetIPv4
{
  return self->_airplayTargetIPv4;
}

- (void)setAirplayTargetIPv4:(unsigned int)a3
{
  self->_airplayTargetIPv4 = a3;
}

- (unsigned)peerStatusFlag
{
  return self->_peerStatusFlag;
}

- (void)setPeerStatusFlag:(unsigned __int8)a3
{
  self->_peerStatusFlag = a3;
}

- (unsigned)transmitPowerOne
{
  return self->_transmitPowerOne;
}

- (void)setTransmitPowerOne:(unsigned __int8)a3
{
  self->_transmitPowerOne = a3;
}

- (unsigned)transmitPowerTwo
{
  return self->_transmitPowerTwo;
}

- (void)setTransmitPowerTwo:(unsigned __int8)a3
{
  self->_transmitPowerTwo = a3;
}

- (unsigned)transmitPowerThree
{
  return self->_transmitPowerThree;
}

- (void)setTransmitPowerThree:(unsigned __int8)a3
{
  self->_transmitPowerThree = a3;
}

- (unsigned)homeKitV1Category
{
  return self->_homeKitV1Category;
}

- (void)setHomeKitV1Category:(unsigned __int16)a3
{
  self->_homeKitV1Category = a3;
}

- (unsigned)homeKitV1CompatibleVersion
{
  return self->_homeKitV1CompatibleVersion;
}

- (void)setHomeKitV1CompatibleVersion:(unsigned __int8)a3
{
  self->_homeKitV1CompatibleVersion = a3;
}

- (unsigned)homeKitV1ConfigurationNumber
{
  return self->_homeKitV1ConfigurationNumber;
}

- (void)setHomeKitV1ConfigurationNumber:(unsigned __int8)a3
{
  self->_homeKitV1ConfigurationNumber = a3;
}

- (NSData)homeKitV1DeviceIDData
{
  return self->_homeKitV1DeviceIDData;
}

- (void)setHomeKitV1DeviceIDData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (unsigned)homeKitV1Flags
{
  return self->_homeKitV1Flags;
}

- (void)setHomeKitV1Flags:(unsigned __int8)a3
{
  self->_homeKitV1Flags = a3;
}

- (unsigned)homeKitV1StateNumber
{
  return self->_homeKitV1StateNumber;
}

- (void)setHomeKitV1StateNumber:(unsigned __int16)a3
{
  self->_homeKitV1StateNumber = a3;
}

- (unsigned)homeKitV1SetupHash
{
  return self->_homeKitV1SetupHash;
}

- (void)setHomeKitV1SetupHash:(unsigned int)a3
{
  self->_homeKitV1SetupHash = a3;
}

- (NSData)homeKitV2AccessoryIDData
{
  return self->_homeKitV2AccessoryIDData;
}

- (void)setHomeKitV2AccessoryIDData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSData)homeKitV2AuthTagData
{
  return self->_homeKitV2AuthTagData;
}

- (void)setHomeKitV2AuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (unsigned)homeKitV2InstanceID
{
  return self->_homeKitV2InstanceID;
}

- (void)setHomeKitV2InstanceID:(unsigned __int16)a3
{
  self->_homeKitV2InstanceID = a3;
}

- (unsigned)homeKitV2StateNumber
{
  return self->_homeKitV2StateNumber;
}

- (void)setHomeKitV2StateNumber:(unsigned __int16)a3
{
  self->_homeKitV2StateNumber = a3;
}

- (unint64_t)homeKitV2Value
{
  return self->_homeKitV2Value;
}

- (void)setHomeKitV2Value:(unint64_t)a3
{
  self->_homeKitV2Value = a3;
}

- (unsigned)nearbyActionFlags
{
  return self->_nearbyActionFlags;
}

- (void)setNearbyActionFlags:(unsigned int)a3
{
  self->_nearbyActionFlags = a3;
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  self->_nearbyActionType = a3;
}

- (unsigned)nearbyActivityLevel
{
  return self->_nearbyActivityLevel;
}

- (void)setNearbyAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (unsigned)nearbyInfoFlags
{
  return self->_nearbyInfoFlags;
}

- (void)setNearbyInfoFlags:(unsigned int)a3
{
  self->_nearbyInfoFlags = a3;
}

- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void)setNearbyInfoV2AuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (unsigned)nearbyInfoV2DecryptedFlags
{
  return self->_nearbyInfoV2DecryptedFlags;
}

- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3
{
  self->_nearbyInfoV2DecryptedFlags = a3;
}

- (void)setNearbyInfoV2Flags:(unsigned __int8)a3
{
  self->_nearbyInfoV2Flags = a3;
}

- (unsigned)nearbyInfoV2InvitationCounter
{
  return self->_nearbyInfoV2InvitationCounter;
}

- (unsigned)nearbyInfoV2InvitationTypes
{
  return self->_nearbyInfoV2InvitationTypes;
}

- (unsigned)nearbyInfoV2InvitationRouteType
{
  return self->_nearbyInfoV2InvitationRouteType;
}

- (unsigned)objectDiscoveryBatteryState
{
  return self->_objectDiscoveryBatteryState;
}

- (void)setObjectDiscoveryBatteryState:(unsigned __int8)a3
{
  self->_objectDiscoveryBatteryState = a3;
}

- (unsigned)objectDiscoveryMode
{
  return self->_objectDiscoveryMode;
}

- (void)setObjectDiscoveryMode:(unsigned __int8)a3
{
  self->_objectDiscoveryMode = a3;
}

- (NSData)objectDiscoveryNearOwnerID
{
  return self->_objectDiscoveryNearOwnerID;
}

- (void)setObjectDiscoveryNearOwnerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (unsigned)objectDiscoveryProductID
{
  return self->_objectDiscoveryProductID;
}

- (void)setObjectDiscoveryProductID:(unsigned int)a3
{
  self->_objectDiscoveryProductID = a3;
}

- (NSData)objectDiscoveryPublicKeyData
{
  return self->_objectDiscoveryPublicKeyData;
}

- (void)setObjectDiscoveryPublicKeyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (unsigned)objectSetupBatteryPerformance
{
  return self->_objectSetupBatteryPerformance;
}

- (unsigned)objectSetupBatteryState
{
  return self->_objectSetupBatteryState;
}

- (unsigned)objectSetupColorCode
{
  return self->_objectSetupColorCode;
}

- (unsigned)objectSetupFlags
{
  return self->_objectSetupFlags;
}

- (NSString)objectSetupFontCode
{
  return self->_objectSetupFontCode;
}

- (NSString)objectSetupMessage
{
  return self->_objectSetupMessage;
}

- (void)setProximityPairingProductID:(unsigned int)a3
{
  self->_proximityPairingProductID = a3;
}

- (unsigned)proximityPairingSubType
{
  return self->_proximityPairingSubType;
}

- (void)setProximityPairingSubType:(unsigned __int8)a3
{
  self->_proximityPairingSubType = a3;
}

- (unsigned)proximityServiceCategory
{
  return self->_proximityServiceCategory;
}

- (void)setProximityServiceCategory:(unsigned __int8)a3
{
  self->_proximityServiceCategory = a3;
}

- (NSData)proximityServiceClassicAddress
{
  return self->_proximityServiceClassicAddress;
}

- (void)setProximityServiceClassicAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void)setProximityServiceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (unsigned)proximityServiceFlags
{
  return self->_proximityServiceFlags;
}

- (void)setProximityServiceFlags:(unsigned __int8)a3
{
  self->_proximityServiceFlags = a3;
}

- (char)proximityServiceMeasuredPower
{
  return self->_proximityServiceMeasuredPower;
}

- (void)setProximityServiceMeasuredPower:(char)a3
{
  self->_proximityServiceMeasuredPower = a3;
}

- (unsigned)proximityServiceProductID
{
  return self->_proximityServiceProductID;
}

- (void)setProximityServiceProductID:(unsigned int)a3
{
  self->_proximityServiceProductID = a3;
}

- (unsigned)proximityServicePSM
{
  return self->_proximityServicePSM;
}

- (void)setProximityServicePSM:(unsigned __int16)a3
{
  self->_proximityServicePSM = a3;
}

- (NSData)proximityServiceSetupHash
{
  return self->_proximityServiceSetupHash;
}

- (void)setProximityServiceSetupHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (unsigned)proximityServiceSubType
{
  return self->_proximityServiceSubType;
}

- (void)setProximityServiceSubType:(unsigned __int8)a3
{
  self->_proximityServiceSubType = a3;
}

- (unsigned)proximityServiceVendorID
{
  return self->_proximityServiceVendorID;
}

- (void)setProximityServiceVendorID:(unsigned __int16)a3
{
  self->_proximityServiceVendorID = a3;
}

- (unsigned)proximityServiceVersion
{
  return self->_proximityServiceVersion;
}

- (void)setProximityServiceVersion:(unsigned __int8)a3
{
  self->_proximityServiceVersion = a3;
}

- (unsigned)spatialInteractionFlags
{
  return self->_spatialInteractionFlags;
}

- (void)setSpatialInteractionFlags:(unsigned __int8)a3
{
  self->_spatialInteractionFlags = a3;
}

- (NSArray)spatialInteractionIdentifiers
{
  return self->_spatialInteractionIdentifiers;
}

- (void)setSpatialInteractionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSData)spatialInteractionTokenData
{
  return self->_spatialInteractionTokenData;
}

- (void)setSpatialInteractionTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSDictionary)spatialInteractionUserInfo
{
  return self->_spatialInteractionUserInfo;
}

- (void)setSpatialInteractionUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSData)spatialInteractionUWBConfigData
{
  return self->_spatialInteractionUWBConfigData;
}

- (void)setSpatialInteractionUWBConfigData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (unsigned)spatialInteractionUWBTokenFlags
{
  return self->_spatialInteractionUWBTokenFlags;
}

- (void)setSpatialInteractionUWBTokenFlags:(unsigned int)a3
{
  self->_spatialInteractionUWBTokenFlags = a3;
}

- (NSData)safetyAlertsAlertID
{
  return self->_safetyAlertsAlertID;
}

- (NSData)nearbyActionNoWakeAuthTagData
{
  return self->_nearbyActionNoWakeAuthTagData;
}

- (void)setNearbyActionNoWakeAuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (NSData)nearbyActionNoWakeConfigData
{
  return self->_nearbyActionNoWakeConfigData;
}

- (void)setNearbyActionNoWakeConfigData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (unsigned)nearbyActionNoWakeType
{
  return self->_nearbyActionNoWakeType;
}

- (void)setNearbyActionNoWakeType:(unsigned __int8)a3
{
  self->_nearbyActionNoWakeType = a3;
}

- (unsigned)nearbyActionNWPrecisionFindingStatus
{
  return self->_nearbyActionNWPrecisionFindingStatus;
}

- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3
{
  self->_nearbyActionNWPrecisionFindingStatus = a3;
}

- (void)setAttributeInternalFlags:(unsigned int)a3
{
  self->_attributeInternalFlags = a3;
}

- (unsigned)batteryInfoMain
{
  return self->_batteryInfoMain;
}

- (void)setBatteryInfoMain:(unsigned __int16)a3
{
  self->_batteryInfoMain = a3;
}

- (unsigned)batteryInfoLeft
{
  return self->_batteryInfoLeft;
}

- (void)setBatteryInfoLeft:(unsigned __int16)a3
{
  self->_batteryInfoLeft = a3;
}

- (unsigned)batteryInfoRight
{
  return self->_batteryInfoRight;
}

- (void)setBatteryInfoRight:(unsigned __int16)a3
{
  self->_batteryInfoRight = a3;
}

- (unsigned)batteryInfoCase
{
  return self->_batteryInfoCase;
}

- (void)setBatteryInfoCase:(unsigned __int16)a3
{
  self->_batteryInfoCase = a3;
}

- ($F6EBB11256A2F6C4B9D2EC026D0EABA8)callMgmtMsg
{
  return ($F6EBB11256A2F6C4B9D2EC026D0EABA8)(*(unsigned int *)&self->_callMgmtMsg.version | ((unint64_t)self->_callMgmtMsg.muteControlConfig << 32));
}

- (void)setCallMgmtMsg:(id)a3
{
  self->_callMgmtMsg = ($9586B29D337632A0E7B5229ABB253883)a3;
}

- (void)setColorInfo:(unsigned __int16)a3
{
  self->_colorInfo = a3;
}

- (NSMutableDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (unsigned)leaVersion
{
  return self->_leaVersion;
}

- (void)setLeaVersion:(unsigned __int8 *)a3
{
  self->_leaVersion = a3;
}

- (unint64_t)oldDiscoveryFlags
{
  return self->_oldDiscoveryFlags;
}

- (void)setOldDiscoveryFlags:(unint64_t)a3
{
  self->_oldDiscoveryFlags = a3;
}

- (unsigned)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(unsigned int)a3
{
  self->_supportedServices = a3;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_enableEPAForLEAdvertisement = a3;
}

- (NSData)nearbyActionAuthTag
{
  return self->_nearbyActionAuthTag;
}

- (void)setNearbyActionAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (NSData)nearbyActionTargetAuthTag
{
  return self->_nearbyActionTargetAuthTag;
}

- (void)setNearbyActionTargetAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSData)nearbyInfoAuthTag
{
  return self->_nearbyInfoAuthTag;
}

- (void)setNearbyInfoAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (void)setNearbyInfoV2EncryptedFlags:(unsigned __int8)a3
{
  self->_nearbyInfoV2EncryptedFlags = a3;
}

- (void)setNearbyInfoV2EncryptedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (unsigned)proximityPairingOtherBudProductID
{
  return self->_proximityPairingOtherBudProductID;
}

- (void)setProximityPairingOtherBudProductID:(unsigned int)a3
{
  self->_proximityPairingOtherBudProductID = a3;
}

- (NSData)safetyAlertsSegmentAlertData
{
  return self->_safetyAlertsSegmentAlertData;
}

- (void)setSafetyAlertsSegmentAlertData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (unsigned)safetyAlertsSegmentSegmentNumber
{
  return self->_safetyAlertsSegmentSegmentNumber;
}

- (void)setSafetyAlertsSegmentSegmentNumber:(unsigned __int8)a3
{
  self->_safetyAlertsSegmentSegmentNumber = a3;
}

- (unsigned)safetyAlertsSegmentSegmentsTotal
{
  return self->_safetyAlertsSegmentSegmentsTotal;
}

- (void)setSafetyAlertsSegmentSegmentsTotal:(unsigned __int8)a3
{
  self->_safetyAlertsSegmentSegmentsTotal = a3;
}

- (void)setSafetyAlertsSegmentServiceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (NSData)safetyAlertsSegmentSignature
{
  return self->_safetyAlertsSegmentSignature;
}

- (void)setSafetyAlertsSegmentSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (unsigned)spatialInteractionPeerID
{
  return self->_spatialInteractionPeerID;
}

- (void)setSpatialInteractionPeerID:(unsigned int)a3
{
  self->_spatialInteractionPeerID = a3;
}

- (NSMutableArray)spatialInteractionDeviceTimestampArrayClientIDs
{
  return self->_spatialInteractionDeviceTimestampArrayClientIDs;
}

- (void)setSpatialInteractionDeviceTimestampArrayClientIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (NSMutableDictionary)spatialInteractionDeviceTimestampArrayDictionary
{
  return self->_spatialInteractionDeviceTimestampArrayDictionary;
}

- (void)setSpatialInteractionDeviceTimestampArrayDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

@end
