@implementation VCBitrateArbiter

- (VCBitrateArbiter)initWithDeviceRole:(int)a3 callLogFile:(void *)a4
{
  VCBitrateArbiter *v5;
  VCBitrateArbiter *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int maxAllowedBitrateWifi;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCBitrateArbiter;
  v5 = -[VCBitrateArbiter init](&v13, sel_init, *(_QWORD *)&a3);
  v6 = v5;
  if (v5)
  {
    -[VCBitrateArbiter readHardwareValues](v5, "readHardwareValues");
    -[VCBitrateArbiter readStoreBagValues:](v6, "readStoreBagValues:", a4);
    -[VCBitrateArbiter readCarrierBundleValues](v6, "readCarrierBundleValues");
    -[VCBitrateArbiter createSupportedBitrateRuleSets](v6, "createSupportedBitrateRuleSets");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend((id)-[NSMutableArray description](v6->supportedBitrateRules, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        v15 = v7;
        v16 = 2080;
        v17 = "-[VCBitrateArbiter initWithDeviceRole:callLogFile:]";
        v18 = 1024;
        v19 = 190;
        v20 = 2080;
        v21 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: Bitrate rules %s", buf, 0x26u);
      }
    }
    v10 = -[VCBitrateArbiter maxAllowedCellularBitrate](v6, "maxAllowedCellularBitrate");
    maxAllowedBitrateWifi = v6->_maxAllowedBitrateWifi;
    if (v10 > maxAllowedBitrateWifi)
      maxAllowedBitrateWifi = -[VCBitrateArbiter maxAllowedCellularBitrate](v6, "maxAllowedCellularBitrate");
    v6->_maxAllowedBitrate = maxAllowedBitrateWifi;
    v6->_maxAllowedAudioOnlyBitrateWifi = 299;
    v6->_maxAllowedScreenShareBitrateWifi = 4100;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCBitrateArbiter;
  -[VCBitrateArbiter dealloc](&v3, sel_dealloc);
}

- (void)createSupportedBitrateRuleSets
{
  VCVideoRule *v3;
  double v4;
  VCVideoRule *v5;
  VCVideoRule *v6;
  double v7;
  VCVideoRule *v8;
  VCVideoRule *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  VCVideoRule *v13;
  VCVideoRule *v14;
  double v15;
  VCVideoRule *v16;
  VCVideoRule *v17;
  double v18;
  VCVideoRule *v19;

  self->supportedBitrateRules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = [VCVideoRule alloc];
  LODWORD(v4) = 15.0;
  v5 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v3, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, 123, v4);
  -[VCBitrateArbiter addRuleForBitrate:connectionType:limitingRule:](self, "addRuleForBitrate:connectionType:limitingRule:", self->_maxAllowedBitrate2G, 0, v5);

  v6 = [VCVideoRule alloc];
  LODWORD(v7) = 30.0;
  v8 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v6, "initWithFrameWidth:frameHeight:frameRate:payload:", 640, 480, 123, v7);
  -[VCBitrateArbiter addRuleForBitrate:connectionType:limitingRule:](self, "addRuleForBitrate:connectionType:limitingRule:", self->_maxAllowedBitrate3G, 1, v8);

  LODWORD(v8) = self->_maxAllowedBitrateLTE;
  v9 = [VCVideoRule alloc];
  LODWORD(v10) = 30.0;
  if (v8 < 0x258)
  {
    v11 = 640;
    v12 = 480;
  }
  else
  {
    v11 = 1024;
    v12 = 768;
  }
  v13 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v9, "initWithFrameWidth:frameHeight:frameRate:payload:", v11, v12, 123, v10);
  -[VCBitrateArbiter addRuleForBitrate:connectionType:limitingRule:](self, "addRuleForBitrate:connectionType:limitingRule:", self->_maxAllowedBitrateLTE, 2, v13);

  v14 = [VCVideoRule alloc];
  LODWORD(v15) = 1114636288;
  v16 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v14, "initWithFrameWidth:frameHeight:frameRate:payload:", 1664, 1248, 123, v15);
  -[VCBitrateArbiter addRuleForBitrate:connectionType:limitingRule:](self, "addRuleForBitrate:connectionType:limitingRule:", self->_maxAllowedBitrateHighRat, 6, v16);

  v17 = [VCVideoRule alloc];
  LODWORD(v18) = 1114636288;
  v19 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v17, "initWithFrameWidth:frameHeight:frameRate:payload:", 1664, 1248, 123, v18);
  -[VCBitrateArbiter addRuleForBitrate:connectionType:limitingRule:](self, "addRuleForBitrate:connectionType:limitingRule:", self->_maxAllowedBitrateWifi, 3, v19);

  -[NSMutableArray sortUsingSelector:](self->supportedBitrateRules, "sortUsingSelector:", sel_compare_);
}

- (void)addRuleForBitrate:(unsigned int)a3 connectionType:(int)a4 limitingRule:(id)a5
{
  VCBitrateRule *v6;

  v6 = -[VCBitrateRule initWithBitrate:connectionType:limitingRule:]([VCBitrateRule alloc], "initWithBitrate:connectionType:limitingRule:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
  -[NSMutableArray addObject:](self->supportedBitrateRules, "addObject:", v6);

}

- (void)readHardwareValues
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCBitrateArbiter readHardwareValues]";
  v6 = 1024;
  v7 = 295;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCVideoRuleCollectionsCamera bitrateConfiguration returned NULL", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (int)storeBagBitrateForKey:(id)a3
{
  id v4;
  int v5;

  v4 = (id)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (!v4)
    v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D34350], "sharedInstance"), "objectForKey:", a3);
  v5 = objc_msgSend(v4, "intValue");

  return v5;
}

- (void)readStoreBagValues:(void *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  unsigned int maxAllowedBitrate2G;
  int ErrorLogLevelForModule;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  objc_class *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  objc_class *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  const char *v45;
  objc_class *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  objc_class *v56;
  const char *v57;
  objc_class *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  unsigned int v68;
  int v69;
  uint64_t v70;
  NSObject *v71;
  objc_class *v72;
  const char *v73;
  objc_class *v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  const char *v85;
  objc_class *v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  unsigned int maxAllowedBitrate3G;
  int v96;
  uint64_t v97;
  NSObject *v98;
  objc_class *v99;
  const char *v100;
  objc_class *v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  objc_class *v111;
  const char *v112;
  objc_class *v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  int v124;
  uint64_t v125;
  NSObject *v126;
  objc_class *v127;
  const char *v128;
  objc_class *v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  objc_class *v139;
  const char *v140;
  objc_class *v141;
  char v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  uint64_t v153;
  NSObject *v154;
  objc_class *v155;
  const char *v156;
  objc_class *v157;
  char v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  objc_class *v167;
  const char *v168;
  objc_class *v169;
  char v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  NSObject *v179;
  objc_class *v180;
  const char *v181;
  objc_class *v182;
  char v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  NSObject *v191;
  objc_class *v192;
  const char *v193;
  objc_class *v194;
  char v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  int v202;
  unsigned int maxAllowedBitrateHighRat;
  int v204;
  uint64_t v205;
  NSObject *v206;
  objc_class *v207;
  const char *v208;
  objc_class *v209;
  char v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  NSObject *v218;
  objc_class *v219;
  const char *v220;
  objc_class *v221;
  char v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  int v229;
  unsigned int maxAllowedBitrateWifi;
  int v231;
  uint64_t v232;
  NSObject *v233;
  objc_class *v234;
  const char *v235;
  objc_class *v236;
  char v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  NSObject *v245;
  objc_class *v246;
  const char *v247;
  objc_class *v248;
  char v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  int v256;
  unsigned int v257;
  unsigned int maxAllowedBitrateLTE;
  int v259;
  uint64_t v260;
  NSObject *v261;
  objc_class *v262;
  const char *v263;
  objc_class *v264;
  char v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  NSObject *v273;
  objc_class *v274;
  const char *v275;
  objc_class *v276;
  char v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  int v284;
  unsigned int v285;
  unsigned int v286;
  int v287;
  uint64_t v288;
  NSObject *v289;
  objc_class *v290;
  const char *v291;
  objc_class *v292;
  char v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  NSObject *v301;
  objc_class *v302;
  const char *v303;
  objc_class *v304;
  char v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  unsigned int v312;
  uint64_t v313;
  NSObject *v314;
  objc_class *v315;
  const char *v316;
  unsigned int maxAllowedBitrateTCPRelay;
  objc_class *v318;
  char v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  _BOOL4 v326;
  unsigned int v327;
  uint64_t v328;
  NSObject *v329;
  objc_class *v330;
  const char *v331;
  unsigned int maxAllowedBitrateConstrained;
  objc_class *v333;
  char v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint8_t buf[4];
  uint64_t v342;
  __int16 v343;
  const char *v344;
  __int16 v345;
  int v346;
  __int16 v347;
  const char *Name;
  __int16 v349;
  unsigned int v350;
  __int16 v351;
  _BOOL4 v352;
  uint64_t v353;

  v353 = *MEMORY[0x1E0C80C00];
  v5 = +[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings");
  if (v5)
    LOBYTE(v12) = objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
  else
    v12 = "<nil>";
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Current bag settings: %s\n", v6, v7, v8, v9, v10, v11, (char)v12);
  v13 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("gk-p2p-bitrate-max-2g"));
  if (rangeCheck(v13))
  {
    maxAllowedBitrate2G = self->_maxAllowedBitrate2G;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrate2G)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v18 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 136316162;
          v342 = v16;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 331;
          v347 = 2080;
          Name = class_getName(v18);
          v349 = 1024;
          v350 = v13;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 2G bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      v19 = (objc_class *)objc_opt_class();
      v20 = class_getName(v19);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 2G bitrate with storebag value of %d\n", v21, v22, v23, v24, v25, v26, v20);
      self->_maxAllowedBitrate2G = v13;
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v29 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 136316162;
          v342 = v27;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 334;
          v347 = 2080;
          Name = class_getName(v29);
          v349 = 1024;
          v350 = v13;
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 2G, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v30 = (objc_class *)objc_opt_class();
      v31 = class_getName(v30);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 2G, ignored storebag value of %d\n", v32, v33, v34, v35, v36, v37, v31);
    }
  }
  v38 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("rtc-ss-bitrate-max-2g"));
  if (v38)
  {
    v39 = v38;
    if (rangeCheck(v38))
    {
      v40 = self->_maxAllowedBitrate2G;
      v41 = VRTraceGetErrorLogLevelForModule();
      if (v40)
      {
        if (v41 >= 7)
        {
          v42 = VRTraceErrorLogLevelToCSTR();
          v43 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v44 = (objc_class *)objc_opt_class();
            v45 = class_getName(v44);
            *(_DWORD *)buf = 136316162;
            v342 = v42;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 346;
            v347 = 2080;
            Name = v45;
            v349 = 1024;
            v350 = v39;
            _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding ScreenShare 2G bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v46 = (objc_class *)objc_opt_class();
        v47 = class_getName(v46);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding ScreenShare 2G bitrate with storebag value of %d\n", v48, v49, v50, v51, v52, v53, v47);
        self->_maxAllowedScreenShareBitrate2G = v39;
      }
      else
      {
        if (v41 >= 7)
        {
          v54 = VRTraceErrorLogLevelToCSTR();
          v55 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v56 = (objc_class *)objc_opt_class();
            v57 = class_getName(v56);
            *(_DWORD *)buf = 136316162;
            v342 = v54;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 349;
            v347 = 2080;
            Name = v57;
            v349 = 1024;
            v350 = v39;
            _os_log_impl(&dword_1D8A54000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 2G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v58 = (objc_class *)objc_opt_class();
        v59 = class_getName(v58);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 2G, ignored storebag value of %d\n", v60, v61, v62, v63, v64, v65, v59);
      }
    }
  }
  else
  {
    self->_maxAllowedScreenShareBitrate2G = 510;
  }
  v66 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("rtc-ac-bitrate-max-2g"));
  if (v66)
  {
    v67 = v66;
    if (IsValidAudioBitrateRange(v66))
    {
      v68 = self->_maxAllowedBitrate2G;
      v69 = VRTraceGetErrorLogLevelForModule();
      if (v68)
      {
        if (v69 >= 7)
        {
          v70 = VRTraceErrorLogLevelToCSTR();
          v71 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v72 = (objc_class *)objc_opt_class();
            v73 = class_getName(v72);
            *(_DWORD *)buf = 136316162;
            v342 = v70;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 362;
            v347 = 2080;
            Name = v73;
            v349 = 1024;
            v350 = v67;
            _os_log_impl(&dword_1D8A54000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 2G AppleCalling bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v74 = (objc_class *)objc_opt_class();
        v75 = class_getName(v74);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 2G AppleCalling bitrate with storebag value of %d\n", v76, v77, v78, v79, v80, v81, v75);
        self->_maxAllowedAudioOnlyBitrate2G = v67;
      }
      else
      {
        if (v69 >= 7)
        {
          v82 = VRTraceErrorLogLevelToCSTR();
          v83 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v84 = (objc_class *)objc_opt_class();
            v85 = class_getName(v84);
            *(_DWORD *)buf = 136316162;
            v342 = v82;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 365;
            v347 = 2080;
            Name = v85;
            v349 = 1024;
            v350 = v67;
            _os_log_impl(&dword_1D8A54000, v83, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 2G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v86 = (objc_class *)objc_opt_class();
        v87 = class_getName(v86);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 2G, ignored storebag value of %d\n", v88, v89, v90, v91, v92, v93, v87);
      }
    }
  }
  else
  {
    self->_maxAllowedAudioOnlyBitrate2G = 21;
  }
  v94 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("gk-p2p-bitrate-max-3g"));
  if (rangeCheck(v94))
  {
    maxAllowedBitrate3G = self->_maxAllowedBitrate3G;
    v96 = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrate3G)
    {
      if (v96 >= 7)
      {
        v97 = VRTraceErrorLogLevelToCSTR();
        v98 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v99 = (objc_class *)objc_opt_class();
          v100 = class_getName(v99);
          *(_DWORD *)buf = 136316162;
          v342 = v97;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 374;
          v347 = 2080;
          Name = v100;
          v349 = 1024;
          v350 = v94;
          _os_log_impl(&dword_1D8A54000, v98, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 3G bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      v101 = (objc_class *)objc_opt_class();
      v102 = class_getName(v101);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 3G bitrate with storebag value of %d\n", v103, v104, v105, v106, v107, v108, v102);
      self->_maxAllowedBitrate3G = v94;
    }
    else
    {
      if (v96 >= 7)
      {
        v109 = VRTraceErrorLogLevelToCSTR();
        v110 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v111 = (objc_class *)objc_opt_class();
          v112 = class_getName(v111);
          *(_DWORD *)buf = 136316162;
          v342 = v109;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 377;
          v347 = 2080;
          Name = v112;
          v349 = 1024;
          v350 = v94;
          _os_log_impl(&dword_1D8A54000, v110, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 3G, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v113 = (objc_class *)objc_opt_class();
      v114 = class_getName(v113);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 3G, ignored storebag value of %d\n", v115, v116, v117, v118, v119, v120, v114);
    }
  }
  v121 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("rtc-ss-bitrate-max-3g"));
  if (v121)
  {
    v122 = v121;
    if (rangeCheck(v121))
    {
      v123 = self->_maxAllowedBitrate3G;
      v124 = VRTraceGetErrorLogLevelForModule();
      if (v123)
      {
        if (v124 >= 7)
        {
          v125 = VRTraceErrorLogLevelToCSTR();
          v126 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v127 = (objc_class *)objc_opt_class();
            v128 = class_getName(v127);
            *(_DWORD *)buf = 136316162;
            v342 = v125;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 389;
            v347 = 2080;
            Name = v128;
            v349 = 1024;
            v350 = v122;
            _os_log_impl(&dword_1D8A54000, v126, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 3G ScreenShare bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v129 = (objc_class *)objc_opt_class();
        v130 = class_getName(v129);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 3G ScreenShare bitrate with storebag value of %d\n", v131, v132, v133, v134, v135, v136, v130);
        self->_maxAllowedScreenShareBitrate3G = v122;
      }
      else
      {
        if (v124 >= 7)
        {
          v137 = VRTraceErrorLogLevelToCSTR();
          v138 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v139 = (objc_class *)objc_opt_class();
            v140 = class_getName(v139);
            *(_DWORD *)buf = 136316162;
            v342 = v137;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 392;
            v347 = 2080;
            Name = v140;
            v349 = 1024;
            v350 = v122;
            _os_log_impl(&dword_1D8A54000, v138, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 3G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v141 = (objc_class *)objc_opt_class();
        v142 = class_getName(v141);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 3G, ignored storebag value of %d\n", v143, v144, v145, v146, v147, v148, v142);
      }
    }
  }
  else
  {
    self->_maxAllowedScreenShareBitrate3G = 510;
  }
  v149 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("rtc-ac-bitrate-max-3g"));
  if (v149)
  {
    v150 = v149;
    if (IsValidAudioBitrateRange(v149))
    {
      v151 = self->_maxAllowedBitrate3G;
      v152 = VRTraceGetErrorLogLevelForModule();
      if (v151)
      {
        if (v152 >= 7)
        {
          v153 = VRTraceErrorLogLevelToCSTR();
          v154 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v155 = (objc_class *)objc_opt_class();
            v156 = class_getName(v155);
            *(_DWORD *)buf = 136316162;
            v342 = v153;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 405;
            v347 = 2080;
            Name = v156;
            v349 = 1024;
            v350 = v150;
            _os_log_impl(&dword_1D8A54000, v154, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 3G AppleCalling bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v157 = (objc_class *)objc_opt_class();
        v158 = class_getName(v157);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 3G AppleCalling bitrate with storebag value of %d\n", v159, v160, v161, v162, v163, v164, v158);
        self->_maxAllowedAudioOnlyBitrate3G = v150;
      }
      else
      {
        if (v152 >= 7)
        {
          v165 = VRTraceErrorLogLevelToCSTR();
          v166 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v167 = (objc_class *)objc_opt_class();
            v168 = class_getName(v167);
            *(_DWORD *)buf = 136316162;
            v342 = v165;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 408;
            v347 = 2080;
            Name = v168;
            v349 = 1024;
            v350 = v150;
            _os_log_impl(&dword_1D8A54000, v166, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 3G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v169 = (objc_class *)objc_opt_class();
        v170 = class_getName(v169);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 3G, ignored storebag value of %d\n", v171, v172, v173, v174, v175, v176, v170);
      }
    }
  }
  else
  {
    self->_maxAllowedAudioOnlyBitrate3G = 40;
  }
  v177 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("gk-p2p-bitrate-max-lte-v2"));
  if (rangeCheck(v177))
  {
    if (self->_maxAllowedBitrateLTE)
    {
      if ((VRTraceIsInternalOSInstalled() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v178 = VRTraceErrorLogLevelToCSTR();
          v179 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v180 = (objc_class *)objc_opt_class();
            v181 = class_getName(v180);
            *(_DWORD *)buf = 136316162;
            v342 = v178;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 418;
            v347 = 2080;
            Name = v181;
            v349 = 1024;
            v350 = v177;
            _os_log_impl(&dword_1D8A54000, v179, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding LTE bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v182 = (objc_class *)objc_opt_class();
        v183 = class_getName(v182);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding LTE bitrate with storebag value of %d\n", v184, v185, v186, v187, v188, v189, v183);
        self->_maxAllowedBitrateLTE = v177;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v190 = VRTraceErrorLogLevelToCSTR();
        v191 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v192 = (objc_class *)objc_opt_class();
          v193 = class_getName(v192);
          *(_DWORD *)buf = 136316162;
          v342 = v190;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 422;
          v347 = 2080;
          Name = v193;
          v349 = 1024;
          v350 = v177;
          _os_log_impl(&dword_1D8A54000, v191, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support LTE, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v194 = (objc_class *)objc_opt_class();
      v195 = class_getName(v194);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support LTE, ignored storebag value of %d\n", v196, v197, v198, v199, v200, v201, v195);
    }
  }
  v202 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("gk-p2p-bitrate-max-5g"));
  if (rangeCheck(v202))
  {
    maxAllowedBitrateHighRat = self->_maxAllowedBitrateHighRat;
    v204 = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrateHighRat)
    {
      if (v204 >= 7)
      {
        v205 = VRTraceErrorLogLevelToCSTR();
        v206 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v207 = (objc_class *)objc_opt_class();
          v208 = class_getName(v207);
          *(_DWORD *)buf = 136316162;
          v342 = v205;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 431;
          v347 = 2080;
          Name = v208;
          v349 = 1024;
          v350 = v202;
          _os_log_impl(&dword_1D8A54000, v206, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 5G bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      v209 = (objc_class *)objc_opt_class();
      v210 = class_getName(v209);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 5G bitrate with storebag value of %d\n", v211, v212, v213, v214, v215, v216, v210);
      self->_maxAllowedBitrateHighRat = v202;
    }
    else
    {
      if (v204 >= 7)
      {
        v217 = VRTraceErrorLogLevelToCSTR();
        v218 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v219 = (objc_class *)objc_opt_class();
          v220 = class_getName(v219);
          *(_DWORD *)buf = 136316162;
          v342 = v217;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 434;
          v347 = 2080;
          Name = v220;
          v349 = 1024;
          v350 = v202;
          _os_log_impl(&dword_1D8A54000, v218, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 5G, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v221 = (objc_class *)objc_opt_class();
      v222 = class_getName(v221);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 5G, ignored storebag value of %d\n", v223, v224, v225, v226, v227, v228, v222);
    }
  }
  v229 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("gk-p2p-bitrate-max-wifi"));
  if (rangeCheck(v229))
  {
    maxAllowedBitrateWifi = self->_maxAllowedBitrateWifi;
    v231 = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrateWifi)
    {
      if (v231 >= 7)
      {
        v232 = VRTraceErrorLogLevelToCSTR();
        v233 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v234 = (objc_class *)objc_opt_class();
          v235 = class_getName(v234);
          *(_DWORD *)buf = 136316162;
          v342 = v232;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 443;
          v347 = 2080;
          Name = v235;
          v349 = 1024;
          v350 = v229;
          _os_log_impl(&dword_1D8A54000, v233, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding Wi-Fi bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      v236 = (objc_class *)objc_opt_class();
      v237 = class_getName(v236);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding Wi-Fi bitrate with storebag value of %d\n", v238, v239, v240, v241, v242, v243, v237);
      self->_maxAllowedBitrateWifi = v229;
    }
    else
    {
      if (v231 >= 7)
      {
        v244 = VRTraceErrorLogLevelToCSTR();
        v245 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v246 = (objc_class *)objc_opt_class();
          v247 = class_getName(v246);
          *(_DWORD *)buf = 136316162;
          v342 = v244;
          v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          v345 = 1024;
          v346 = 446;
          v347 = 2080;
          Name = v247;
          v349 = 1024;
          v350 = v229;
          _os_log_impl(&dword_1D8A54000, v245, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support Wi-Fi, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v248 = (objc_class *)objc_opt_class();
      v249 = class_getName(v248);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support Wi-Fi, ignored storebag value of %d\n", v250, v251, v252, v253, v254, v255, v249);
    }
  }
  v256 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("rtc-ss-bitrate-max-lte"));
  if (v256)
  {
    v257 = v256;
    if (rangeCheck(v256))
    {
      maxAllowedBitrateLTE = self->_maxAllowedBitrateLTE;
      v259 = VRTraceGetErrorLogLevelForModule();
      if (maxAllowedBitrateLTE)
      {
        if (v259 >= 7)
        {
          v260 = VRTraceErrorLogLevelToCSTR();
          v261 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v262 = (objc_class *)objc_opt_class();
            v263 = class_getName(v262);
            *(_DWORD *)buf = 136316162;
            v342 = v260;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 458;
            v347 = 2080;
            Name = v263;
            v349 = 1024;
            v350 = v257;
            _os_log_impl(&dword_1D8A54000, v261, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding LTE ScreenShare bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v264 = (objc_class *)objc_opt_class();
        v265 = class_getName(v264);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding LTE ScreenShare bitrate with storebag value of %d\n", v266, v267, v268, v269, v270, v271, v265);
        self->_maxAllowedScreenShareBitrateLTE = v257;
      }
      else
      {
        if (v259 >= 7)
        {
          v272 = VRTraceErrorLogLevelToCSTR();
          v273 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v274 = (objc_class *)objc_opt_class();
            v275 = class_getName(v274);
            *(_DWORD *)buf = 136316162;
            v342 = v272;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 461;
            v347 = 2080;
            Name = v275;
            v349 = 1024;
            v350 = v257;
            _os_log_impl(&dword_1D8A54000, v273, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support LTE, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v276 = (objc_class *)objc_opt_class();
        v277 = class_getName(v276);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support LTE, ignored storebag value of %d\n", v278, v279, v280, v281, v282, v283, v277);
      }
    }
  }
  else
  {
    self->_maxAllowedScreenShareBitrateLTE = 510;
  }
  v284 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("rtc-ac-bitrate-max-lte"));
  if (v284)
  {
    v285 = v284;
    if (IsValidAudioBitrateRange(v284))
    {
      v286 = self->_maxAllowedBitrateLTE;
      v287 = VRTraceGetErrorLogLevelForModule();
      if (v286)
      {
        if (v287 >= 7)
        {
          v288 = VRTraceErrorLogLevelToCSTR();
          v289 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v290 = (objc_class *)objc_opt_class();
            v291 = class_getName(v290);
            *(_DWORD *)buf = 136316162;
            v342 = v288;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 474;
            v347 = 2080;
            Name = v291;
            v349 = 1024;
            v350 = v285;
            _os_log_impl(&dword_1D8A54000, v289, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding LTE AppleCalling bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v292 = (objc_class *)objc_opt_class();
        v293 = class_getName(v292);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding LTE AppleCalling bitrate with storebag value of %d\n", v294, v295, v296, v297, v298, v299, v293);
        self->_maxAllowedAudioOnlyBitrateLTE = v285;
      }
      else
      {
        if (v287 >= 7)
        {
          v300 = VRTraceErrorLogLevelToCSTR();
          v301 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v302 = (objc_class *)objc_opt_class();
            v303 = class_getName(v302);
            *(_DWORD *)buf = 136316162;
            v342 = v300;
            v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            v345 = 1024;
            v346 = 477;
            v347 = 2080;
            Name = v303;
            v349 = 1024;
            v350 = v285;
            _os_log_impl(&dword_1D8A54000, v301, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support LTE, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v304 = (objc_class *)objc_opt_class();
        v305 = class_getName(v304);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support LTE, ignored storebag value of %d\n", v306, v307, v308, v309, v310, v311, v305);
      }
    }
  }
  else
  {
    self->_maxAllowedAudioOnlyBitrateLTE = 40;
  }
  v312 = -[VCBitrateArbiter storeBagBitrateForKey:](self, "storeBagBitrateForKey:", CFSTR("gk-p2p-tcp-relay-bitrate-max"));
  self->_maxAllowedBitrateTCPRelay = v312;
  if (v312)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v313 = VRTraceErrorLogLevelToCSTR();
      v314 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v315 = (objc_class *)objc_opt_class();
        v316 = class_getName(v315);
        maxAllowedBitrateTCPRelay = self->_maxAllowedBitrateTCPRelay;
        *(_DWORD *)buf = 136316162;
        v342 = v313;
        v343 = 2080;
        v344 = "-[VCBitrateArbiter readStoreBagValues:]";
        v345 = 1024;
        v346 = 484;
        v347 = 2080;
        Name = v316;
        v349 = 1024;
        v350 = maxAllowedBitrateTCPRelay;
        _os_log_impl(&dword_1D8A54000, v314, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding TCP Relay bitrate with storebag value of %d", buf, 0x2Cu);
      }
    }
    v318 = (objc_class *)objc_opt_class();
    v319 = class_getName(v318);
    VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding TCP Relay bitrate with storebag value of %d\n", v320, v321, v322, v323, v324, v325, v319);
  }
  v326 = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:exceptionKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:exceptionKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-raise-u-one-bandwidth-limit-when-constrained"), CFSTR("vc-raise-u-one-bandwidth-limit-when-constrained-exceptions"), CFSTR("raiseU1BandwidthLimitWhenConstrained"), "AVConference", "RaiseU1BandwidthLimitWhenContrained");
  if (v326)
    v327 = 600;
  else
    v327 = 228;
  self->_maxAllowedBitrateConstrained = v327;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v328 = VRTraceErrorLogLevelToCSTR();
    v329 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v330 = (objc_class *)objc_opt_class();
      v331 = class_getName(v330);
      maxAllowedBitrateConstrained = self->_maxAllowedBitrateConstrained;
      *(_DWORD *)buf = 136316418;
      v342 = v328;
      v343 = 2080;
      v344 = "-[VCBitrateArbiter readStoreBagValues:]";
      v345 = 1024;
      v346 = 489;
      v347 = 2080;
      Name = v331;
      v349 = 1024;
      v350 = maxAllowedBitrateConstrained;
      v351 = 1024;
      v352 = v326;
      _os_log_impl(&dword_1D8A54000, v329, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: max bitrate for constrained wifi set to %d, enabled setting=%d", buf, 0x32u);
    }
  }
  v333 = (objc_class *)objc_opt_class();
  v334 = class_getName(v333);
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: max bitrate for constrained wifi set to %d, enabled setting=%d\n", v335, v336, v337, v338, v339, v340, v334);
}

- (void)updateMaxAllowedBitrate:(unsigned int *)a3 key:(__CFString *)a4 type:(id)a5 isAudio:(BOOL)a6 carrierBundleBitrates:(__CFDictionary *)a7
{
  _BOOL4 v7;
  const __CFNumber *Value;
  unsigned int v11;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int valuePtr;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v7 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  Value = (const __CFNumber *)CFDictionaryGetValue(a7, a4);
  if (Value)
  {
    valuePtr = -1431655766;
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    if (v7)
    {
      if (!IsValidAudioBitrateRange(valuePtr))
        return;
    }
    else if (!rangeCheck(valuePtr))
    {
      return;
    }
    v11 = *a3;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v11)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v19 = v13;
          v20 = 2080;
          v21 = "-[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:]";
          v22 = 1024;
          v23 = 505;
          v24 = 2112;
          v25 = a5;
          v26 = 1024;
          v27 = valuePtr;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: overriding %@ bitrate with carrier bundle value of %d", buf, 0x2Cu);
        }
      }
      *a3 = valuePtr;
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:]";
        v22 = 1024;
        v23 = 508;
        v24 = 2112;
        v25 = a5;
        v26 = 1024;
        v27 = valuePtr;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: hardware does not support %@, ignored carrier bundle value of %d", buf, 0x2Cu);
      }
    }
  }
}

- (void)readCarrierBundleValues
{
  BOOL v3;
  uint64_t v4;
  NSObject *v5;
  CFTypeID v6;
  CFTypeRef v7;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (VCCarrierBundle_QueryCarrierBundleValueForKey((uint64_t)CFSTR("FaceTimeOverCellular"), &cf))
    v3 = cf == 0;
  else
    v3 = 1;
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v10 = v4;
        v11 = 2080;
        v12 = "-[VCBitrateArbiter readCarrierBundleValues]";
        v13 = 1024;
        v14 = 544;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: no carrier bundle values found", buf, 0x1Cu);
      }
    }
  }
  else
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
    {
      v7 = cf;
      -[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:](self, "updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:", &self->_maxAllowedBitrate2G, CFSTR("MaxBitrate2G"), CFSTR("2G"), 0, cf);
      -[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:](self, "updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:", &self->_maxAllowedAudioOnlyBitrate2G, CFSTR("MaxAudioOnlyBitrate2G"), CFSTR("2G"), 1, v7);
      -[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:](self, "updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:", &self->_maxAllowedBitrate3G, CFSTR("MaxBitrate3G"), CFSTR("3G"), 0, v7);
      -[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:](self, "updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:", &self->_maxAllowedAudioOnlyBitrate3G, CFSTR("MaxAudioOnlyBitrate3G"), CFSTR("3G"), 1, v7);
      -[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:](self, "updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:", &self->_maxAllowedBitrateLTE, CFSTR("MaxBitrateLTE"), CFSTR("LTE"), 0, v7);
      -[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:](self, "updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:", &self->_maxAllowedAudioOnlyBitrateLTE, CFSTR("MaxAudioOnlyBitrateLTE"), CFSTR("LTE"), 1, v7);
      -[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:](self, "updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:", &self->_maxAllowedBitrateHighRat, CFSTR("MaxBitrate5G"), CFSTR("5G"), 0, v7);
    }
    CFRelease(cf);
  }
}

- (unsigned)maxAllowedCellularBitrate
{
  return vmaxvq_u32(*(uint32x4_t *)&self->_maxAllowedBitrate2G);
}

- (unsigned)maxAllowedScreenShareCellularBitrate
{
  unsigned int maxAllowedScreenShareBitrate2G;

  maxAllowedScreenShareBitrate2G = self->_maxAllowedScreenShareBitrate2G;
  if (maxAllowedScreenShareBitrate2G <= self->_maxAllowedScreenShareBitrate3G)
    maxAllowedScreenShareBitrate2G = self->_maxAllowedScreenShareBitrate3G;
  if (maxAllowedScreenShareBitrate2G <= self->_maxAllowedScreenShareBitrateLTE)
    return self->_maxAllowedScreenShareBitrateLTE;
  else
    return maxAllowedScreenShareBitrate2G;
}

- (unsigned)maxAllowedBitrateForConnectionType:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCBitrateArbiter maxAllowedBitrateForConnectionType:]";
      v12 = 1024;
      v13 = 563;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: received connectionType %d", (uint8_t *)&v8, 0x22u);
    }
  }
  result = 40000000;
  switch(a3)
  {
    case 0:
      result = self->_maxAllowedBitrate2G;
      break;
    case 1:
      result = self->_maxAllowedBitrate3G;
      break;
    case 2:
      result = self->_maxAllowedBitrateLTE;
      break;
    case 3:
      result = self->_maxAllowedBitrateWifi;
      break;
    case 4:
    case 5:
      return result;
    case 6:
      result = self->_maxAllowedBitrateHighRat;
      break;
    case 7:
      result = 60000000;
      break;
    default:
      result = 100;
      break;
  }
  return result;
}

- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4
{
  return -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:encodeRule:](self, "maxAllowedBitrateForVCConnection:forLocalInterface:encodeRule:", a3, a4, 0);
}

- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4 encodeRule:(id)a5
{
  _BOOL4 v6;
  int v9;
  int v10;
  int IsLocalExpensive;
  int IsLocalConstrained;
  int v13;
  uint64_t v14;
  unsigned int maxAllowedBitrate2G;
  unsigned int maxAllowedBitrateConstrained;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  if (a4)
    v9 = objc_msgSend(a3, "localConnectionType");
  else
    v9 = objc_msgSend(a3, "remoteConnectionType");
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
    {
      IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)a3);
      IsLocalConstrained = VCConnection_IsLocalConstrained((uint64_t)a3);
    }
    else
    {
      IsLocalExpensive = VCConnection_IsRemoteExpensive((uint64_t)a3);
      IsLocalConstrained = VCConnection_IsRemoteConstrained((uint64_t)a3);
    }
    v13 = IsLocalConstrained;
  }
  else
  {
    v13 = 0;
    IsLocalExpensive = 1;
  }
  switch(v10)
  {
    case 0:
      maxAllowedBitrate2G = self->_maxAllowedBitrate2G;
      break;
    case 1:
      maxAllowedBitrate2G = self->_maxAllowedBitrate3G;
      break;
    case 2:
    case 6:
      v14 = 24;
      if (IsLocalExpensive)
        v14 = 20;
      maxAllowedBitrate2G = *(_DWORD *)((char *)&self->super.isa + v14);
      if (v13)
      {
        if (self->_maxAllowedBitrateConstrained >= maxAllowedBitrate2G)
          maxAllowedBitrateConstrained = *(_DWORD *)((char *)&self->super.isa + v14);
        else
          maxAllowedBitrateConstrained = self->_maxAllowedBitrateConstrained;
        if (maxAllowedBitrate2G)
          maxAllowedBitrate2G = maxAllowedBitrateConstrained;
        else
          maxAllowedBitrate2G = self->_maxAllowedBitrateConstrained;
      }
      break;
    case 3:
      if (v13)
        maxAllowedBitrate2G = self->_maxAllowedBitrateConstrained;
      else
        maxAllowedBitrate2G = self->_maxAllowedBitrateWifi;
      break;
    case 4:
    case 5:
      maxAllowedBitrate2G = 40000000;
      break;
    case 7:
      maxAllowedBitrate2G = 60000000;
      break;
    default:
      maxAllowedBitrate2G = 100;
      break;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v19 = "Local";
      else
        v19 = "Remote";
      v21 = 136317186;
      v22 = v17;
      v23 = 2080;
      v24 = "-[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:encodeRule:]";
      v25 = 1024;
      v26 = 665;
      v27 = 1024;
      v28 = maxAllowedBitrate2G;
      v29 = 2080;
      v30 = v19;
      v31 = 1024;
      v32 = v10;
      v33 = 1024;
      v34 = v13;
      v35 = 1024;
      v36 = IsLocalExpensive;
      v37 = 1024;
      v38 = objc_msgSend(a5, "isVideoFullHD");
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bitrate = %d. received connection for %s, connectionType = %d, constraint %d, expensive %d, videoFullHD %d", (uint8_t *)&v21, 0x44u);
    }
  }
  return maxAllowedBitrate2G;
}

- (unsigned)maxAllowedScreenShareBitrateForConnection:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCBitrateArbiter maxAllowedScreenShareBitrateForConnection:]";
      v12 = 1024;
      v13 = 671;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received connection type %d", (uint8_t *)&v8, 0x22u);
    }
  }
  if (a3 <= 6 && ((0x4Fu >> a3) & 1) != 0)
    return *(_DWORD *)((char *)&self->super.isa + qword_1D9110458[a3]);
  else
    return 510;
}

- (unsigned)maxAllowedAudioOnlyBitrateForConnection:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:]";
      v12 = 1024;
      v13 = 695;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received connection type %d", (uint8_t *)&v8, 0x22u);
    }
  }
  if (a3 <= 6 && ((0x4Fu >> a3) & 1) != 0)
    return *(_DWORD *)((char *)&self->super.isa + qword_1D9110490[a3]);
  else
    return 40;
}

- (id)maxAllowedBitrateRuleForConnection:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  NSMutableArray *supportedBitrateRules;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v20 = v5;
      v21 = 2080;
      v22 = "-[VCBitrateArbiter maxAllowedBitrateRuleForConnection:]";
      v23 = 1024;
      v24 = 719;
      v25 = 1024;
      v26 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received connection type %d", buf, 0x22u);
    }
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  supportedBitrateRules = self->supportedBitrateRules;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](supportedBitrateRules, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = *(_QWORD *)v16;
LABEL_6:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v10)
      objc_enumerationMutation(supportedBitrateRules);
    v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
    if (objc_msgSend(v12, "connectionType") == a3)
      return v12;
    if (v9 == ++v11)
    {
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](supportedBitrateRules, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      if (v9)
        goto LABEL_6;
      return 0;
    }
  }
}

- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4 arbiterMode:(unsigned __int8)a5 encodeRule:(id)a6
{
  int v7;
  _BOOL8 v8;
  uint64_t v11;
  uint64_t v12;
  unsigned int result;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCBitrateArbiter *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v7 = a5;
  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  if (a4)
    v11 = objc_msgSend(a3, "localConnectionType");
  else
    v11 = objc_msgSend(a3, "remoteConnectionType");
  v12 = v11;
  result = 20000000;
  switch(v7)
  {
    case 0:
    case 2:
    case 7:
      return -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self, "maxAllowedAudioOnlyBitrateForConnection:", v12);
    case 1:
    case 4:
    case 5:
      return -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:encodeRule:](self, "maxAllowedBitrateForVCConnection:forLocalInterface:encodeRule:", a3, v8, a6);
    case 3:
      return -[VCBitrateArbiter maxAllowedScreenShareBitrateForConnection:](self, "maxAllowedScreenShareBitrateForConnection:", v12);
    case 6:
      return result;
    default:
      if ((VCBitrateArbiter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!result)
            return result;
          -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[VCBitrateArbiter performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!result)
            return result;
          v17 = 136316418;
          v18 = v15;
          v19 = 2080;
          v20 = "-[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:]";
          v21 = 1024;
          v22 = 753;
          v23 = 2112;
          v24 = v14;
          v25 = 2048;
          v26 = self;
          v27 = 1024;
          v28 = v7;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected arbiterMode=%hhu", (uint8_t *)&v17, 0x36u);
        }
      }
      return 0;
  }
}

- (unsigned)maxAllowedBitrateForConnectionType:(int)a3 arbiterMode:(unsigned __int8)a4
{
  int v4;
  unsigned int result;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCBitrateArbiter *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  result = 20000000;
  switch(a4)
  {
    case 0u:
    case 2u:
      return -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self, "maxAllowedAudioOnlyBitrateForConnection:", *(_QWORD *)&a3);
    case 1u:
    case 4u:
    case 5u:
      return -[VCBitrateArbiter maxAllowedBitrateForConnectionType:](self, "maxAllowedBitrateForConnectionType:", *(_QWORD *)&a3);
    case 3u:
      return -[VCBitrateArbiter maxAllowedScreenShareBitrateForConnection:](self, "maxAllowedScreenShareBitrateForConnection:", *(_QWORD *)&a3);
    case 6u:
      return result;
    case 7u:
      return 6000000;
    default:
      if ((VCBitrateArbiter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!result)
            return result;
          -[VCBitrateArbiter maxAllowedBitrateForConnectionType:arbiterMode:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCBitrateArbiter performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!result)
            return result;
          v10 = 136316418;
          v11 = v8;
          v12 = 2080;
          v13 = "-[VCBitrateArbiter maxAllowedBitrateForConnectionType:arbiterMode:]";
          v14 = 1024;
          v15 = 775;
          v16 = 2112;
          v17 = v7;
          v18 = 2048;
          v19 = self;
          v20 = 1024;
          v21 = v4;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected arbiterMode=%hhu", (uint8_t *)&v10, 0x36u);
        }
      }
      return 0;
  }
}

+ (void)updateMaxAllowedBitratePerConnection:(unsigned int *)a3 connectionType:(int)a4 negotiatedSettings:(id)a5
{
  unsigned int v6;

  v6 = objc_msgSend(a5, "maxBandwidthWithArbiterMode:connectionType:", 1, *(_QWORD *)&a4);
  if (v6)
    *a3 = v6;
}

- (void)updateNegotiatedSettings:(id)a3
{
  unsigned int *p_maxAllowedBitrate2G;
  unsigned int *p_maxAllowedBitrate3G;
  unsigned int *p_maxAllowedBitrateLTE;
  unsigned int *p_maxAllowedBitrateHighRat;
  unsigned int *p_maxAllowedBitrateWifi;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_maxAllowedBitrate2G = &self->_maxAllowedBitrate2G;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:](VCBitrateArbiter, "updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:", &self->_maxAllowedBitrate2G, 0, a3);
  p_maxAllowedBitrate3G = &self->_maxAllowedBitrate3G;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:](VCBitrateArbiter, "updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:", &self->_maxAllowedBitrate3G, 1, a3);
  p_maxAllowedBitrateLTE = &self->_maxAllowedBitrateLTE;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:](VCBitrateArbiter, "updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:", &self->_maxAllowedBitrateLTE, 2, a3);
  p_maxAllowedBitrateHighRat = &self->_maxAllowedBitrateHighRat;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:](VCBitrateArbiter, "updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:", &self->_maxAllowedBitrateHighRat, 6, a3);
  p_maxAllowedBitrateWifi = &self->_maxAllowedBitrateWifi;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:](VCBitrateArbiter, "updateMaxAllowedBitratePerConnection:connectionType:negotiatedSettings:", p_maxAllowedBitrateWifi, 3, a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *p_maxAllowedBitrate2G;
      v13 = *p_maxAllowedBitrate3G;
      v14 = *p_maxAllowedBitrateLTE;
      v15 = *p_maxAllowedBitrateHighRat;
      v16 = *p_maxAllowedBitrateWifi;
      v17 = 136316930;
      v18 = v10;
      v19 = 2080;
      v20 = "-[VCBitrateArbiter updateNegotiatedSettings:]";
      v21 = 1024;
      v22 = 795;
      v23 = 1024;
      v24 = v12;
      v25 = 1024;
      v26 = v13;
      v27 = 1024;
      v28 = v14;
      v29 = 1024;
      v30 = v15;
      v31 = 1024;
      v32 = v16;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _maxAllowedBitrate2G = %d,  _maxAllowedBitrate3G = %d, _maxAllowedBitrateLTE = %d, _maxAllowedBitrateHighRat = %d, _maxAllowedBitrateWifi = %d", (uint8_t *)&v17, 0x3Au);
    }
  }
}

- (unsigned)maxAllowedBitrate
{
  return self->_maxAllowedBitrate;
}

- (unsigned)maxAllowedBitrate2G
{
  return self->_maxAllowedBitrate2G;
}

- (unsigned)maxAllowedBitrate3G
{
  return self->_maxAllowedBitrate3G;
}

- (unsigned)maxAllowedBitrateLTE
{
  return self->_maxAllowedBitrateLTE;
}

- (unsigned)maxAllowedBitrateHighRat
{
  return self->_maxAllowedBitrateHighRat;
}

- (unsigned)maxAllowedBitrateWifi
{
  return self->_maxAllowedBitrateWifi;
}

- (unsigned)maxAllowedBitrateTCPRelay
{
  return self->_maxAllowedBitrateTCPRelay;
}

- (unsigned)maxAllowedBitrateP2P
{
  return self->_maxAllowedBitrateP2P;
}

- (unsigned)maxAllowedBitrateUSB
{
  return self->_maxAllowedBitrateUSB;
}

- (void)maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected arbiterMode=%hhu", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)maxAllowedBitrateForConnectionType:arbiterMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected arbiterMode=%hhu", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
