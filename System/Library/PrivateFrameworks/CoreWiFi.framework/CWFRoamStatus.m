@implementation CWFRoamStatus

- (CWFRoamStatus)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFRoamStatus *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFRoamStatus;
  v6 = -[CWFRoamStatus init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

- (double)duration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!objc_msgSend_timeEnded(self, a2, v2, v3, v4))
    return 0.0;
  objc_msgSend_timeEnded(self, v6, v7, v8, v9);
  objc_msgSend_timeStarted(self, v10, v11, v12, v13);
  v18 = objc_msgSend_timeEnded(self, v14, v15, v16, v17);
  return (double)(unint64_t)(v18 - objc_msgSend_timeStarted(self, v19, v20, v21, v22)) / 1000.0;
}

- (NSString)networkName
{
  id v3;
  const char *v4;
  uint64_t v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (NSString *)(id)objc_msgSend_initWithData_encoding_(v3, v4, (uint64_t)self->_SSID, 4, v5);
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  NSString *originOUI;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  int64_t fromRSSI;
  NSString *targetOUI;
  unint64_t fromChannel;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSString *interfaceName;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v59 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v62, v6, 5, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  interfaceName = self->_interfaceName;
  v58 = (void *)v9;
  objc_msgSend_networkName(self, v10, v11, v12, v13);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v61, v14, v15, v16, v17);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(self->_SSID, v18, v19, v20, v21);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v60, v22, v23, v24, v25);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(self->_startedAt);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(self->_endedAt);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v26, v27, v28, v29);
  v31 = (unint64_t)(v30 * 1000.0);
  sub_1B06431F4(self->_reason);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B06431F4(self->_status);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  originOUI = self->_originOUI;
  objc_msgSend_redactedForWiFi(self->_fromBSSID, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  fromRSSI = self->_fromRSSI;
  targetOUI = self->_targetOUI;
  fromChannel = self->_fromChannel;
  objc_msgSend_redactedForWiFi(self->_toBSSID, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v59, v48, (uint64_t)CFSTR("uuid=%@, intf=%@, ssid='%@' (%@), start=%@, end=%@ (%lums), reason=%@, status=%@, from=[oui=%@ bssid=%@ ch=%lu rssi=%ld] to=[oui=%@ bssid=%@ ch=%lu rssi=%ld]"), v49, v50, v58, interfaceName, v56, v55, v54, v53, v31, v32, v33, originOUI, v39, fromChannel, fromRSSI, targetOUI,
    v47,
    self->_toChannel,
    self->_toRSSI);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v51;
}

- (BOOL)isEqualToRoamStatus:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSUUID *UUID;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUUID *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUUID *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqual;
  NSString *interfaceName;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSData *SSID;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSData *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSData *v56;
  uint64_t v57;
  NSData *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSString *originOUI;
  NSString *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSString *v74;
  void *v75;
  NSString *v76;
  uint64_t v77;
  NSString *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSString *fromBSSID;
  NSString *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSString *v94;
  uint64_t v95;
  NSString *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t fromChannel;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int64_t fromRSSI;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSString *targetOUI;
  NSString *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSString *v122;
  uint64_t v123;
  NSString *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  NSString *v129;
  NSString *v130;
  NSString *v131;
  NSString *v132;
  void *v133;
  BOOL v134;
  NSString *toBSSID;
  NSString *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSString *v147;
  NSString *v148;
  uint64_t v149;
  NSString *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t toChannel;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int64_t toRSSI;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  int status;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  int reason;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t timeStarted;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t timeEnded;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSDate *startedAt;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSDate *v190;
  NSDate *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  NSDate *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  BOOL v200;
  BOOL v201;
  NSString *v202;
  NSString *v203;
  NSString *v204;
  NSString *v205;
  NSString *v206;
  NSString *v207;
  NSDate *endedAt;
  NSDate *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  NSDate *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  NSDate *v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  NSData *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  NSString *v232;
  NSString *v233;
  NSString *v234;
  NSString *v235;
  NSString *v236;
  NSString *v237;
  NSString *v238;
  void *v239;
  void *v240;
  void *v241;
  NSString *v242;
  NSString *v243;
  void *v244;
  void *v245;
  NSString *v246;
  NSString *v247;
  void *v248;
  void *v249;
  NSString *v250;
  void *v251;
  NSData *v252;
  void *v253;

  v6 = a3;
  UUID = self->_UUID;
  objc_msgSend_UUID(v6, v8, v9, v10, v11);
  v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  if (UUID != v16)
  {
    if (!self->_UUID || (objc_msgSend_UUID(v6, v12, v13, v14, v15), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      isEqual = 0;
      goto LABEL_78;
    }
    v3 = (void *)v17;
    v22 = self->_UUID;
    objc_msgSend_UUID(v6, v18, v19, v20, v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      isEqual = 0;
LABEL_77:

      goto LABEL_78;
    }
  }
  interfaceName = self->_interfaceName;
  objc_msgSend_interfaceName(v6, v12, v13, v14, v15);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (interfaceName != v32)
  {
    if (!self->_interfaceName)
    {
      isEqual = 0;
LABEL_57:

      goto LABEL_76;
    }
    objc_msgSend_interfaceName(v6, v28, v29, v30, v31);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_74;
    v253 = (void *)v33;
    v38 = self->_interfaceName;
    objc_msgSend_interfaceName(v6, v34, v35, v36, v37);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v38;
    v41 = (void *)v39;
    if ((objc_msgSend_isEqual_(v40, v42, v39, v43, v44) & 1) == 0)
    {

LABEL_73:
      goto LABEL_74;
    }
    v251 = v41;
  }
  SSID = self->_SSID;
  objc_msgSend_SSID(v6, v28, v29, v30, v31);
  v50 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (SSID == v50)
  {
    v252 = SSID;
LABEL_19:
    originOUI = self->_originOUI;
    objc_msgSend_originOUI(v6, v46, v47, v48, v49);
    v64 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (originOUI != v64)
    {
      if (!self->_originOUI)
      {
        isEqual = 0;
        goto LABEL_53;
      }
      v250 = v64;
      objc_msgSend_originOUI(v6, v65, v66, v67, v68);
      v69 = objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        v242 = interfaceName;
        v74 = originOUI;
        v245 = (void *)v69;
        v75 = v4;
        v76 = self->_originOUI;
        objc_msgSend_originOUI(v6, v70, v71, v72, v73);
        v77 = objc_claimAutoreleasedReturnValue();
        v78 = v76;
        v79 = (void *)v77;
        if ((objc_msgSend_isEqual_(v78, v80, v77, v81, v82) & 1) != 0)
        {
          v241 = v79;
          v4 = v75;
          v247 = v74;
          interfaceName = v242;
          goto LABEL_27;
        }

        v4 = v75;
        if (v252 == v50)
        {

        }
        else
        {

        }
        v134 = v242 == v32;
      }
      else
      {

        if (v252 == v50)
        {

        }
        else
        {

        }
        v134 = interfaceName == v32;
      }
      if (v134)
      {
LABEL_74:

        goto LABEL_75;
      }
      goto LABEL_72;
    }
    v247 = originOUI;
    v250 = v64;
LABEL_27:
    fromBSSID = self->_fromBSSID;
    objc_msgSend_fromBSSID(v6, v65, v66, v67, v68);
    v84 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (fromBSSID == v84)
    {
      v246 = v84;
      v244 = v4;
      goto LABEL_37;
    }
    if (!self->_fromBSSID)
    {
      isEqual = 0;
      goto LABEL_51;
    }
    v246 = v84;
    objc_msgSend_fromBSSID(v6, v85, v86, v87, v88);
    v89 = objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      v240 = (void *)v89;
      v244 = v4;
      v94 = self->_fromBSSID;
      objc_msgSend_fromBSSID(v6, v90, v91, v92, v93);
      v95 = objc_claimAutoreleasedReturnValue();
      v96 = v94;
      v97 = (void *)v95;
      if ((objc_msgSend_isEqual_(v96, v98, v95, v99, v100) & 1) != 0)
      {
        v239 = v97;
LABEL_37:
        fromChannel = self->_fromChannel;
        if (fromChannel != objc_msgSend_fromChannel(v6, v85, v86, v87, v88)
          || (fromRSSI = self->_fromRSSI, fromRSSI != objc_msgSend_fromRSSI(v6, v102, v103, v104, v105)))
        {
          isEqual = 0;
          v84 = v246;
          v4 = v244;
          if (fromBSSID == v246)
            goto LABEL_51;
          goto LABEL_45;
        }
        targetOUI = self->_targetOUI;
        objc_msgSend_targetOUI(v6, v107, v108, v109, v110);
        v112 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (targetOUI == v112)
        {
          v234 = fromBSSID;
          v237 = v112;
        }
        else
        {
          if (!self->_targetOUI)
          {
            isEqual = 0;
            goto LABEL_108;
          }
          v237 = v112;
          objc_msgSend_targetOUI(v6, v113, v114, v115, v116);
          v117 = objc_claimAutoreleasedReturnValue();
          if (!v117)
          {

            if (fromBSSID == v246)
            {

            }
            else
            {

            }
            v205 = v250;
            v4 = v244;
            if (v247 != v250)
              goto LABEL_128;
            goto LABEL_119;
          }
          v235 = targetOUI;
          v231 = (void *)v117;
          v122 = self->_targetOUI;
          objc_msgSend_targetOUI(v6, v118, v119, v120, v121);
          v123 = objc_claimAutoreleasedReturnValue();
          v124 = v122;
          v125 = (void *)v123;
          if ((objc_msgSend_isEqual_(v124, v126, v123, v127, v128) & 1) == 0)
          {

            v203 = v246;
            v4 = v244;
            if (fromBSSID == v246)
            {

              goto LABEL_127;
            }
            goto LABEL_126;
          }
          v234 = fromBSSID;
          v230 = v125;
          targetOUI = v235;
        }
        toBSSID = self->_toBSSID;
        objc_msgSend_toBSSID(v6, v113, v114, v115, v116);
        v137 = (NSString *)objc_claimAutoreleasedReturnValue();
        v232 = toBSSID;
        v236 = targetOUI;
        if (toBSSID == v137)
        {
          v233 = v137;
          goto LABEL_87;
        }
        if (!self->_toBSSID)
        {
          isEqual = 0;
          fromBSSID = v234;
LABEL_106:

          v112 = v237;
          if (v236 != v237)
          {

            v112 = v237;
          }
LABEL_108:
          v4 = v244;

          v84 = v246;
          if (fromBSSID == v246)
          {
LABEL_51:

            v64 = v250;
            if (v247 != v250)
            {

              v64 = v250;
            }
LABEL_53:

            if (v252 == v50)
              goto LABEL_55;
            goto LABEL_54;
          }
LABEL_45:
          v129 = v84;

          v84 = v129;
          goto LABEL_51;
        }
        v233 = v137;
        objc_msgSend_toBSSID(v6, v138, v139, v140, v141);
        v142 = objc_claimAutoreleasedReturnValue();
        v147 = v234;
        if (!v142)
        {
          isEqual = 0;
          v4 = v244;
          goto LABEL_111;
        }
        v229 = (void *)v142;
        v148 = self->_toBSSID;
        objc_msgSend_toBSSID(v6, v143, v144, v145, v146);
        v149 = objc_claimAutoreleasedReturnValue();
        v150 = v148;
        v151 = (void *)v149;
        if ((objc_msgSend_isEqual_(v150, v152, v149, v153, v154) & 1) != 0)
        {
          v228 = v151;
LABEL_87:
          toChannel = self->_toChannel;
          if (toChannel != objc_msgSend_toChannel(v6, v138, v139, v140, v141)
            || (toRSSI = self->_toRSSI, toRSSI != objc_msgSend_toRSSI(v6, v156, v157, v158, v159))
            || (status = self->_status, status != objc_msgSend_status(v6, v161, v162, v163, v164))
            || (reason = self->_reason, reason != objc_msgSend_reason(v6, v166, v167, v168, v169))
            || (timeStarted = self->_timeStarted, timeStarted != objc_msgSend_timeStarted(v6, v171, v172, v173, v174))
            || (timeEnded = self->_timeEnded, timeEnded != objc_msgSend_timeEnded(v6, v176, v177, v178, v179)))
          {
            v200 = 0;
            isEqual = 0;
            v137 = v233;
            v201 = v232 == v233;
            goto LABEL_99;
          }
          v243 = interfaceName;
          v227 = v50;
          startedAt = self->_startedAt;
          objc_msgSend_startedAt(v6, v181, v182, v183, v184);
          v190 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v191 = startedAt;
          if (startedAt != v190)
          {
            if (!self->_startedAt
              || (objc_msgSend_startedAt(v6, v186, v187, v188, v189),
                  (v226 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
LABEL_140:
              v200 = 0;
              goto LABEL_141;
            }
            v196 = self->_startedAt;
            objc_msgSend_startedAt(v6, v192, v193, v194, v195);
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_isEqual_(v196, v197, (uint64_t)v225, v198, v199) & 1) == 0)
            {

              isEqual = 0;
LABEL_143:
              if (v232 == v233)
              {

                v204 = v237;
                interfaceName = v243;
                v4 = v244;
                v50 = v227;
                v147 = v234;
                if (v236 == v237)
                {
LABEL_113:

                  if (v147 != v246)
                  {

                  }
                  if (v247 != v250)
                  {

                  }
                  if (v252 == v50)
                    goto LABEL_55;
LABEL_54:

LABEL_55:
                  if (interfaceName != v32)
                  {

                  }
                  goto LABEL_57;
                }
LABEL_112:
                v238 = v204;

                v204 = v238;
                goto LABEL_113;
              }

              interfaceName = v243;
              v4 = v244;
              v50 = v227;
              v147 = v234;
LABEL_111:

              v204 = v237;
              if (v236 == v237)
                goto LABEL_113;
              goto LABEL_112;
            }
          }
          endedAt = self->_endedAt;
          objc_msgSend_endedAt(v6, v186, v187, v188, v189);
          v209 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v214 = v209;
          v200 = endedAt == v209;
          if (v200 || !self->_endedAt)
          {

            if (v191 == v190)
            {
LABEL_141:

              isEqual = v200;
              v137 = v233;
              v201 = v232 == v233;
              v50 = v227;
              interfaceName = v243;
LABEL_99:
              fromBSSID = v234;
              if (!v201)
              {
                v202 = v137;

                v137 = v202;
                isEqual = v200;
              }
              goto LABEL_106;
            }
          }
          else
          {
            objc_msgSend_endedAt(v6, v210, v211, v212, v213);
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            if (v224)
            {
              v219 = self->_endedAt;
              objc_msgSend_endedAt(v6, v215, v216, v217, v218);
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v219, v221, (uint64_t)v220, v222, v223);

              if (v191 == v190)
              {

              }
              else
              {

              }
              goto LABEL_143;
            }

            if (v191 == v190)
              goto LABEL_140;
          }

          goto LABEL_141;
        }

        v4 = v244;
        if (v236 == v237)
        {

        }
        else
        {

        }
        v203 = v246;
        if (v234 == v246)
        {

LABEL_127:
          v205 = v250;
          if (v247 != v250)
          {
LABEL_128:
            v207 = v205;

LABEL_129:
            v133 = v248;
            if (v252 == v50)
            {
LABEL_65:

              if (interfaceName == v32)
                goto LABEL_74;
              goto LABEL_72;
            }
LABEL_64:

            goto LABEL_65;
          }
LABEL_119:

          goto LABEL_129;
        }
LABEL_126:
        v206 = v203;

        goto LABEL_127;
      }

      v130 = v250;
      v131 = v247;
      v4 = v244;
      if (v247 == v250)
        goto LABEL_61;
    }
    else
    {

      v130 = v250;
      v131 = v247;
      if (v247 == v250)
      {
LABEL_61:

        goto LABEL_62;
      }
    }
    v132 = v130;

LABEL_62:
    if (v252 == v50)
      goto LABEL_65;
    v133 = v248;
    goto LABEL_64;
  }
  if (!self->_SSID)
  {
    isEqual = 0;
    goto LABEL_55;
  }
  objc_msgSend_SSID(v6, v46, v47, v48, v49);
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v252 = SSID;
    v249 = (void *)v51;
    v56 = self->_SSID;
    objc_msgSend_SSID(v6, v52, v53, v54, v55);
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = v56;
    v59 = (void *)v57;
    if ((objc_msgSend_isEqual_(v58, v60, v57, v61, v62) & 1) != 0)
    {
      v248 = v59;
      goto LABEL_19;
    }

  }
  if (interfaceName != v32)
  {
LABEL_72:

    goto LABEL_73;
  }

LABEL_75:
  isEqual = 0;
LABEL_76:
  if (UUID != v16)
    goto LABEL_77;
LABEL_78:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFRoamStatus *v4;
  CWFRoamStatus *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRoamStatus;

  v4 = (CWFRoamStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToRoamStatus = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToRoamStatus = objc_msgSend_isEqualToRoamStatus_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToRoamStatus = 0;
  }

  return isEqualToRoamStatus;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  int64_t fromRSSI;
  unint64_t fromChannel;
  uint64_t v52;

  v52 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  v10 = objc_msgSend_hash(self->_interfaceName, v6, v7, v8, v9);
  v15 = objc_msgSend_hash(self->_SSID, v11, v12, v13, v14);
  v20 = objc_msgSend_hash(self->_startedAt, v16, v17, v18, v19);
  v25 = objc_msgSend_hash(self->_endedAt, v21, v22, v23, v24);
  v30 = objc_msgSend_hash(self->_originOUI, v26, v27, v28, v29);
  v35 = objc_msgSend_hash(self->_fromBSSID, v31, v32, v33, v34);
  fromChannel = self->_fromChannel;
  fromRSSI = self->_fromRSSI;
  v40 = objc_msgSend_hash(self->_targetOUI, v36, v37, v38, v39);
  v45 = objc_msgSend_hash(self->_toBSSID, v41, v42, v43, v44);
  v47.i64[0] = fromRSSI;
  v46.i64[0] = fromChannel;
  v47.i64[1] = self->_toRSSI;
  v46.i64[1] = self->_toChannel;
  v48 = veorq_s8(v46, v47);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v48.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)) ^ self->_timeStarted ^ self->_timeEnded ^ self->_status ^ v45 ^ self->_reason ^ v40 ^ v35 ^ v30 ^ v25 ^ v20 ^ v15 ^ v10 ^ v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFRoamStatus, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setSSID_(v11, v18, (uint64_t)self->_SSID, v19, v20);
  objc_msgSend_setReason_(v11, v21, self->_reason, v22, v23);
  objc_msgSend_setStatus_(v11, v24, self->_status, v25, v26);
  objc_msgSend_setStartedAt_(v11, v27, (uint64_t)self->_startedAt, v28, v29);
  objc_msgSend_setEndedAt_(v11, v30, (uint64_t)self->_endedAt, v31, v32);
  objc_msgSend_setOriginOUI_(v11, v33, (uint64_t)self->_originOUI, v34, v35);
  objc_msgSend_setFromBSSID_(v11, v36, (uint64_t)self->_fromBSSID, v37, v38);
  objc_msgSend_setFromChannel_(v11, v39, self->_fromChannel, v40, v41);
  objc_msgSend_setFromRSSI_(v11, v42, self->_fromRSSI, v43, v44);
  objc_msgSend_setTargetOUI_(v11, v45, (uint64_t)self->_targetOUI, v46, v47);
  objc_msgSend_setToBSSID_(v11, v48, (uint64_t)self->_toBSSID, v49, v50);
  objc_msgSend_setToChannel_(v11, v51, self->_toChannel, v52, v53);
  objc_msgSend_setToRSSI_(v11, v54, self->_toRSSI, v55, v56);
  objc_msgSend_setTimeStarted_(v11, v57, self->_timeStarted, v58, v59);
  objc_msgSend_setTimeEnded_(v11, v60, self->_timeEnded, v61, v62);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  id v63;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)UUID, (uint64_t)CFSTR("_UUID"), v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_interfaceName, (uint64_t)CFSTR("_interfaceName"), v9);
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)self->_startedAt, (uint64_t)CFSTR("_startedAt"), v11);
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)self->_endedAt, (uint64_t)CFSTR("_endedAt"), v13);
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)self->_SSID, (uint64_t)CFSTR("_SSID"), v15);
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)self->_originOUI, (uint64_t)CFSTR("_originOUI"), v17);
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)self->_fromBSSID, (uint64_t)CFSTR("_fromBSSID"), v19);
  objc_msgSend_encodeInteger_forKey_(v5, v20, self->_fromRSSI, (uint64_t)CFSTR("_fromRSSI"), v21);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v22, self->_fromChannel, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v26, (uint64_t)v25, (uint64_t)CFSTR("_fromChannel"), v27);

  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)self->_targetOUI, (uint64_t)CFSTR("_targetOUI"), v29);
  objc_msgSend_encodeObject_forKey_(v5, v30, (uint64_t)self->_toBSSID, (uint64_t)CFSTR("_toBSSID"), v31);
  objc_msgSend_encodeInteger_forKey_(v5, v32, self->_toRSSI, (uint64_t)CFSTR("_toRSSI"), v33);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v34, self->_toChannel, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)v37, (uint64_t)CFSTR("_toChannel"), v39);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v40, self->_reason, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v44, (uint64_t)v43, (uint64_t)CFSTR("_reason"), v45);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v46, self->_status, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v50, (uint64_t)v49, (uint64_t)CFSTR("_status"), v51);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v52, self->_timeStarted, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v56, (uint64_t)v55, (uint64_t)CFSTR("_timeStarted"), v57);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v58, self->_timeEnded, v59, v60);
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v61, (uint64_t)v63, (uint64_t)CFSTR("_timeEnded"), v62);

}

- (CWFRoamStatus)initWithCoder:(id)a3
{
  id v4;
  CWFRoamStatus *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *interfaceName;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSDate *startedAt;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSDate *endedAt;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSData *SSID;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *originOUI;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSString *fromBSSID;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSString *targetOUI;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  NSString *toBSSID;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  objc_super v106;

  v4 = a3;
  v106.receiver = self;
  v106.super_class = (Class)CWFRoamStatus;
  v5 = -[CWFRoamStatus init](&v106, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_UUID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_interfaceName"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_startedAt"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("_endedAt"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    endedAt = v5->_endedAt;
    v5->_endedAt = (NSDate *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("_SSID"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    SSID = v5->_SSID;
    v5->_SSID = (NSData *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("_originOUI"), v33);
    v34 = objc_claimAutoreleasedReturnValue();
    originOUI = v5->_originOUI;
    v5->_originOUI = (NSString *)v34;

    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)CFSTR("_fromBSSID"), v38);
    v39 = objc_claimAutoreleasedReturnValue();
    fromBSSID = v5->_fromBSSID;
    v5->_fromBSSID = (NSString *)v39;

    v5->_fromRSSI = objc_msgSend_decodeIntegerForKey_(v4, v41, (uint64_t)CFSTR("_fromRSSI"), v42, v43);
    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)CFSTR("_fromChannel"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fromChannel = objc_msgSend_unsignedIntegerValue(v47, v48, v49, v50, v51);

    v52 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, (uint64_t)CFSTR("_targetOUI"), v54);
    v55 = objc_claimAutoreleasedReturnValue();
    targetOUI = v5->_targetOUI;
    v5->_targetOUI = (NSString *)v55;

    v57 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, (uint64_t)CFSTR("_toBSSID"), v59);
    v60 = objc_claimAutoreleasedReturnValue();
    toBSSID = v5->_toBSSID;
    v5->_toBSSID = (NSString *)v60;

    v5->_toRSSI = objc_msgSend_decodeIntegerForKey_(v4, v62, (uint64_t)CFSTR("_toRSSI"), v63, v64);
    v65 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v65, (uint64_t)CFSTR("_toChannel"), v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_toChannel = objc_msgSend_unsignedIntegerValue(v68, v69, v70, v71, v72);

    v73 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v74, v73, (uint64_t)CFSTR("_reason"), v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reason = objc_msgSend_unsignedIntegerValue(v76, v77, v78, v79, v80);

    v81 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, (uint64_t)CFSTR("_status"), v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend_unsignedIntegerValue(v84, v85, v86, v87, v88);

    v89 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v90, v89, (uint64_t)CFSTR("_timeStarted"), v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeStarted = objc_msgSend_unsignedLongLongValue(v92, v93, v94, v95, v96);

    v97 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v98, v97, (uint64_t)CFSTR("_timeEnded"), v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeEnded = objc_msgSend_unsignedLongLongValue(v100, v101, v102, v103, v104);

  }
  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)timeStarted
{
  return self->_timeStarted;
}

- (void)setTimeStarted:(unint64_t)a3
{
  self->_timeStarted = a3;
}

- (unint64_t)timeEnded
{
  return self->_timeEnded;
}

- (void)setTimeEnded:(unint64_t)a3
{
  self->_timeEnded = a3;
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)originOUI
{
  return self->_originOUI;
}

- (void)setOriginOUI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)targetOUI
{
  return self->_targetOUI;
}

- (void)setTargetOUI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)fromBSSID
{
  return self->_fromBSSID;
}

- (void)setFromBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)toBSSID
{
  return self->_toBSSID;
}

- (void)setToBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)fromChannel
{
  return self->_fromChannel;
}

- (void)setFromChannel:(unint64_t)a3
{
  self->_fromChannel = a3;
}

- (unint64_t)toChannel
{
  return self->_toChannel;
}

- (void)setToChannel:(unint64_t)a3
{
  self->_toChannel = a3;
}

- (int64_t)fromRSSI
{
  return self->_fromRSSI;
}

- (void)setFromRSSI:(int64_t)a3
{
  self->_fromRSSI = a3;
}

- (int64_t)toRSSI
{
  return self->_toRSSI;
}

- (void)setToRSSI:(int64_t)a3
{
  self->_toRSSI = a3;
}

- (int)reason
{
  return self->_reason;
}

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBSSID, 0);
  objc_storeStrong((id *)&self->_fromBSSID, 0);
  objc_storeStrong((id *)&self->_targetOUI, 0);
  objc_storeStrong((id *)&self->_originOUI, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_endedAt, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_UUID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("uuid"), v15);

  objc_msgSend_interfaceName(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("interface_name"), v22);

  objc_msgSend_startedAt(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, (uint64_t)CFSTR("started_at"), v29);

  objc_msgSend_endedAt(self, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, (uint64_t)CFSTR("ended_at"), v36);

  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_duration(self, v38, v39, v40, v41);
  objc_msgSend_numberWithDouble_(v37, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)v46, (uint64_t)CFSTR("duration"), v48);

  objc_msgSend_networkName(self, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v54, (uint64_t)v53, (uint64_t)CFSTR("network_name"), v55);

  objc_msgSend_originOUI(self, v56, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v61, (uint64_t)v60, (uint64_t)CFSTR("origin_oui"), v62);

  objc_msgSend_targetOUI(self, v63, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, (uint64_t)CFSTR("target_oui"), v69);

  objc_msgSend_fromBSSID(self, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v75, (uint64_t)v74, (uint64_t)CFSTR("from_bssid"), v76);

  objc_msgSend_toBSSID(self, v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v82, (uint64_t)v81, (uint64_t)CFSTR("to_bssid"), v83);

  v84 = (void *)MEMORY[0x1E0CB37E8];
  v89 = objc_msgSend_fromChannel(self, v85, v86, v87, v88);
  objc_msgSend_numberWithUnsignedInteger_(v84, v90, v89, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v94, (uint64_t)v93, (uint64_t)CFSTR("from_channel"), v95);

  v96 = (void *)MEMORY[0x1E0CB37E8];
  v101 = objc_msgSend_toChannel(self, v97, v98, v99, v100);
  objc_msgSend_numberWithUnsignedInteger_(v96, v102, v101, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v106, (uint64_t)v105, (uint64_t)CFSTR("to_channel"), v107);

  v108 = (void *)MEMORY[0x1E0CB37E8];
  v113 = objc_msgSend_fromRSSI(self, v109, v110, v111, v112);
  objc_msgSend_numberWithInteger_(v108, v114, v113, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v118, (uint64_t)v117, (uint64_t)CFSTR("from_rssi"), v119);

  v120 = (void *)MEMORY[0x1E0CB37E8];
  v125 = objc_msgSend_toRSSI(self, v121, v122, v123, v124);
  objc_msgSend_numberWithInteger_(v120, v126, v125, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v130, (uint64_t)v129, (uint64_t)CFSTR("to_rssi"), v131);

  v136 = objc_msgSend_reason(self, v132, v133, v134, v135);
  sub_1B06431F4(v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v138, (uint64_t)v137, (uint64_t)CFSTR("roam_reason"), v139);

  v144 = objc_msgSend_status(self, v140, v141, v142, v143);
  sub_1B06431F4(v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v146, (uint64_t)v145, (uint64_t)CFSTR("status"), v147);

  sub_1B06475A8(v3, 0, 1u);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v148, (uint64_t)v151, v149, v150);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v152 = 0;
  }

  return v152;
}

@end
