@implementation DTOSLogLoader

+ (id)heartbeatPredicate
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("processIdentifier == %d AND subsystem == 'com.apple.dt.Instruments' AND category == 'heartbeat'"), getpid());
}

+ (void)heartbeat
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_25576FA88 != -1)
    dispatch_once(&qword_25576FA88, &unk_24EB292C8);
  v2 = qword_25576FA80;
  if (os_log_type_enabled((os_log_t)qword_25576FA80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_222B17000, v2, OS_LOG_TYPE_DEFAULT, "Heartbeat", v3, 2u);
  }
}

- (DTOSLogLoader)init
{
  dispatch_queue_t v3;
  DTOSLogLoader *v4;
  DTOSLogLoader *v5;
  uint64_t v6;
  XRIntKeyedDictionary *pushedProcessesByPid;
  uint64_t v8;
  NSMutableDictionary *repeatedStrings;
  uint64_t v10;
  NSMutableDictionary *repeatedUUIDs;
  uint64_t v12;
  NSMutableDictionary *repeatedPlaceholders;
  uint64_t v14;
  NSMutableArray *argReferenceConstants;
  uint64_t v16;
  XRIntKeyedDictionary *pidToExecNameMapping;
  objc_super v19;

  v3 = dispatch_queue_create("com.apple.dt.os_log-loader", 0);
  v19.receiver = self;
  v19.super_class = (Class)DTOSLogLoader;
  v4 = -[XRMobileAgentQueueStop initWithDispatchQueue:funnelTarget:](&v19, sel_initWithDispatchQueue_funnelTarget_, v3, v3);
  v5 = v4;
  if (v4)
  {
    pthread_cond_init(&v4->_stateChanged, 0);
    pthread_mutex_init(&v5->_stateLock, 0);
    pthread_mutex_lock(&v5->_stateLock);
    sub_222B3A980(v5);
    v6 = objc_opt_new();
    pushedProcessesByPid = v5->_pushedProcessesByPid;
    v5->_pushedProcessesByPid = (XRIntKeyedDictionary *)v6;

    v8 = objc_opt_new();
    repeatedStrings = v5->_repeatedStrings;
    v5->_repeatedStrings = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    repeatedUUIDs = v5->_repeatedUUIDs;
    v5->_repeatedUUIDs = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    repeatedPlaceholders = v5->_repeatedPlaceholders;
    v5->_repeatedPlaceholders = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 50);
    v14 = objc_claimAutoreleasedReturnValue();
    argReferenceConstants = v5->_argReferenceConstants;
    v5->_argReferenceConstants = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    pidToExecNameMapping = v5->_pidToExecNameMapping;
    v5->_pidToExecNameMapping = (XRIntKeyedDictionary *)v16;

    pthread_mutex_unlock(&v5->_stateLock);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_stateLock);
  pthread_cond_destroy(&self->_stateChanged);
  v3.receiver = self;
  v3.super_class = (Class)DTOSLogLoader;
  -[DTOSLogLoader dealloc](&v3, sel_dealloc);
}

- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  _QWORD block[4];
  id v13;
  id v14;
  DTOSLogLoader *v15;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = objc_msgSend(v8, "needsHold");
    if ((v9 & 1) != 0)
    {
      -[XRMobileAgentQueueStop _funnelQueue](self, "_funnelQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_222B3ABF4;
      block[3] = &unk_24EB28F20;
      v13 = v8;
      v14 = v6;
      v15 = self;
      dispatch_async(v10, block);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)ticketToStartStream:(id)a3
{
  return (id)objc_opt_new();
}

- (id)ticketToPrepare:(id)a3 configuration:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setConfiguration:", v4);

  return v5;
}

- (id)ticketToFetchData:(id)a3 window:(double)a4
{
  void *v5;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setWindowInSeconds:", a4);
  return v5;
}

- (id)ticketToStopStream:(id)a3
{
  return (id)objc_opt_new();
}

- (void)_prepareAgentToExecute:(id)a3 withTicket:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "prepareAgent:loader:", v7, self);

}

- (void)_escortAgentToExit:(id)a3 withTicket:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "escortAgent:loader:", v7, self);

}

- (id)_stackReferenceForRepeatedString:(id)a3
{
  id v4;
  _DWORD *v5;
  DTOSLogTableLoader *value;
  id v7;
  unsigned int v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_repeatedStrings, "objectForKeyedSubscript:", v4);
    v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (_DWORD *)objc_opt_new();
      value = self->_tableLoader.__ptr_.__value_;
      v7 = objc_retainAutorelease(v4);
      v8 = sub_222B3AF00((size_t)value, (char *)objc_msgSend(v7, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL);
      v5[2] = v8;
      if (v8 < 0x10000)
      {
        v9 = 0;
LABEL_8:

        goto LABEL_9;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_repeatedStrings, "setObject:forKeyedSubscript:", v5, v7);
    }
    v5 = v5;
    v9 = v5;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (id)_stackReferenceForRepeatedUUID:(id)a3
{
  id v4;
  _DWORD *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  unint64_t v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_repeatedUUIDs, "objectForKeyedSubscript:", v4);
    v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10[0] = 0;
      v10[1] = 0;
      objc_msgSend(v4, "getUUIDBytes:", v10);
      v5 = (_DWORD *)objc_opt_new();
      v7 = sub_222B3B094((uint64_t)self->_tableLoader.__ptr_.__value_, v10, v6);
      v5[2] = v7;
      if (v7 < 0x10000)
      {
        v8 = 0;
LABEL_8:

        goto LABEL_9;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_repeatedUUIDs, "setObject:forKeyedSubscript:", v5, v4);
    }
    v5 = v5;
    v8 = v5;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)_handleRecord:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  unint64_t slackInMachTimeUnits;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;
  NSDate *endTime;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  DTOSLogTableLoader *value;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  DTOSLogTableLoader *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _DWORD *v33;
  DTOSLogTableLoader *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int16 *v40;
  unsigned __int16 *v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  uint64_t v50;
  void *v51;
  __CFString *v52;
  DTOSLogLoader *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  unint64_t machTimeAdjustment;
  void *v60;
  unint64_t v61;
  void *v62;
  NSMutableArray *argReferenceConstants;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t i;
  uint64_t v72;
  DTOSLogArgumentPlaceholderDescription *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  __CFString *v86;
  DTOSLogLoader *v87;
  int v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  void *v96;
  char isKindOfClass;
  id v98;
  _BOOL4 v99;
  _BOOL4 v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  __int128 v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  char v110;
  void *v111;
  void *v112;
  int v113;
  _DWORD *v114;
  DTOSLogLoader *v115;
  unint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  _BOOL4 v120;
  DTOSLogLoader *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t j;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  id v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  id v159;
  uint64_t v160;
  id v161;
  size_t v162;
  DTOSLogTableLoader *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  int *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t k;
  void *v181;
  void *v182;
  unsigned __int16 *v183;
  uint64_t v184;
  uint64_t v185;
  int v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  _QWORD *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  int *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  void *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  BOOL v245;
  DTOSLogTableLoader *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  DTOSLogTableLoader *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  void *v278;
  void *v279;
  unsigned __int16 *v280;
  unsigned __int16 *v281;
  unsigned __int16 *v282;
  unint64_t v283;
  void *v284;
  char v285;
  unsigned __int16 *v286;
  unsigned __int16 *v287;
  void *v288;
  __CFString *v289;
  __CFString *v290;
  unsigned __int16 *v291;
  id v292;
  unsigned __int16 *v293;
  unint64_t v294;
  unsigned __int16 *v295;
  unsigned __int16 *v296;
  unsigned __int16 *v297;
  unsigned __int16 *v298;
  unsigned __int16 *v299;
  _opaque_pthread_mutex_t *p_stateLock;
  uint64_t v301;
  id v302;
  void *v303;
  _BOOL4 v304;
  unint64_t v305;
  void *v306;
  unint64_t v307;
  uint64_t v308;
  void *v309;
  void *v310;
  unsigned __int16 *v311;
  DTOSLogLoader *v312;
  unsigned int v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  unsigned int v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  StackReference topOfStackRef;
  uint64_t v328;
  int v329;
  _BYTE v330[128];
  _BYTE v331[128];
  __int128 v332;
  int v333;
  _BYTE v334[128];
  uint64_t v335;

  v335 = *MEMORY[0x24BDAC8D0];
  v302 = a3;
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  self->_didHandleRecord = 1;
  objc_msgSend(v302, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.dt.Instruments")) & 1) != 0)
  {
    objc_msgSend(v302, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("heartbeat"));

    if (v6)
    {
      if (self->_slackInMachTimeUnits)
      {
        v7 = objc_msgSend(v302, "machContinuousTimestamp");
        slackInMachTimeUnits = self->_slackInMachTimeUnits;
        v9 = v7 >= slackInMachTimeUnits;
        v10 = v7 - slackInMachTimeUnits;
        if (!v9)
          v10 = 0;
        if (self->_lastMachTime < v10)
          self->_lastMachTime = v10;
      }
      goto LABEL_22;
    }
  }
  else
  {

  }
  v301 = objc_msgSend(v302, "type");
  if (v301 == 1536 || -[DTOSLogLoaderConfiguration signpostConfig](self->_configuration, "signpostConfig") != 1)
  {
    if (!self->_deserializedEventStream
      || (endTime = self->_endTime,
          objc_msgSend(v302, "date"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = -[NSDate compare:](endTime, "compare:", v13),
          v13,
          v14 != -1))
    {
      if (self->_ignoreNextRecord)
      {
        if (self->_encoder._state != 5)
          self->_ignoreNextRecord = 0;
LABEL_333:
        pthread_mutex_unlock(p_stateLock);
        goto LABEL_334;
      }
      if (self->_liveStream
        && !self->_calledForHelp
        && (uint64_t)(*(_QWORD *)(*((_QWORD *)self->_tableLoader.__ptr_.__value_ + 2) + 24)
                   - *(_QWORD *)(*((_QWORD *)self->_tableLoader.__ptr_.__value_ + 2) + 16)) <= 2047)
      {
        self->_calledForHelp = 1;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "logLoaderNeedsFetchNow:", self);

      }
      value = self->_tableLoader.__ptr_.__value_;
      if (*(_DWORD *)(*((_QWORD *)value + 2) + 64) >= 0x13890000u)
      {
        -[DTOSLogLoader _performResetOnOutputStream](self, "_performResetOnOutputStream");
        value = self->_tableLoader.__ptr_.__value_;
      }
      sub_222B3DA5C((uint64_t)value, 1, v11);
      v17 = objc_msgSend(v302, "threadIdentifier");
      v18 = objc_msgSend(v302, "processIdentifier");
      v328 = v17;
      v329 = v18;
      v19 = sub_222B42C24(&self->_pushedThreadsAndProcesses.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&v328);
      v20 = v19;
      v312 = self;
      if (v19)
      {
        v21 = (id)v19[4];
        v22 = (id)v20[5];
        v293 = (unsigned __int16 *)v21;
        v298 = (unsigned __int16 *)v22;

      }
      else
      {
        v24 = v18;
        -[XRIntKeyedDictionary objectAtIndexedSubscript:](self->_pushedProcessesByPid, "objectAtIndexedSubscript:", v18);
        v299 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
        if (!v299)
        {
          v25 = objc_opt_new();
          topOfStackRef = self->_encoder._topOfStackRef;
          v26 = self->_tableLoader.__ptr_.__value_;
          LODWORD(v332) = v18;
          v27 = *((_QWORD *)v26 + 2);
          *(_QWORD *)(v27 + 32) = &v332;
          *(_QWORD *)(v27 + 40) = (char *)&v332 + 4;
          sub_222B41914((uint64_t)v26, v28, v29);
          sub_222B3B350((uint64_t)self->_tableLoader.__ptr_.__value_, &self->_deviceSessionRef._generation, v30);
          sub_222B3B588((uint64_t)self->_tableLoader.__ptr_.__value_, (unsigned int *)&topOfStackRef._generation, v31);
          *(_DWORD *)(v25 + 8) = *(_DWORD *)(*((_QWORD *)self->_tableLoader.__ptr_.__value_ + 2) + 64);
          -[XRIntKeyedDictionary setObject:atIndexedSubscript:](self->_pushedProcessesByPid, "setObject:atIndexedSubscript:", v25, v18);
          if (-[DTOSLogLoaderConfiguration trackPidToExecNameMapping](self->_configuration, "trackPidToExecNameMapping"))
          {
            objc_msgSend(v302, "process");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[XRIntKeyedDictionary setObject:atIndexedSubscript:](self->_pidToExecNameMapping, "setObject:atIndexedSubscript:", v32, v24);

          }
          v299 = (unsigned __int16 *)v25;
        }
        v33 = (_DWORD *)objc_opt_new();
        topOfStackRef = self->_encoder._topOfStackRef;
        v34 = self->_tableLoader.__ptr_.__value_;
        *(_QWORD *)&v332 = v17;
        v35 = *((_QWORD *)v34 + 2);
        *(_QWORD *)(v35 + 32) = &v332;
        *(_QWORD *)(v35 + 40) = (char *)&v332 + 8;
        sub_222B41914((uint64_t)v34, v36, v37);
        sub_222B3B350((uint64_t)self->_tableLoader.__ptr_.__value_, v299 + 4, v38);
        sub_222B3B588((uint64_t)self->_tableLoader.__ptr_.__value_, (unsigned int *)&topOfStackRef._generation, v39);
        v33[2] = *(_DWORD *)(*((_QWORD *)self->_tableLoader.__ptr_.__value_ + 2) + 64);
        v40 = v33;
        v41 = v299;
        *(_QWORD *)&v332 = &v328;
        v42 = sub_222B42CE8((uint64_t)&self->_pushedThreadsAndProcesses, (uint64_t)&v328, (uint64_t)&unk_222BD17DF, (_OWORD **)&v332);
        v43 = (void *)v42[4];
        v293 = v40;
        v42[4] = v40;

        v44 = (void *)v42[5];
        v42[5] = v41;

        v298 = v41;
      }
      sub_222B3DA5C((uint64_t)self->_tableLoader.__ptr_.__value_, 2, v23);
      objc_msgSend(v302, "signpostName");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "formatString");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v284, "length"))
      {
        -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:", v284);
        v297 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v297 = 0;
      }
      objc_msgSend(v302, "subsystem");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45 == 0;

      if (v46)
      {
        objc_msgSend(v302, "sender");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v47;
        if (v47)
          v49 = (__CFString *)v47;
        else
          v49 = CFSTR("Default");
        v290 = v49;

        -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:", v290);
      }
      else
      {
        objc_msgSend(v302, "subsystem");
        v290 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:", v290);
      }
      v296 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "category");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      if (v50)
        v52 = (__CFString *)v50;
      else
        v52 = CFSTR("Default");
      v289 = v52;

      v53 = self;
      -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:", v289);
      v295 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "senderImagePath");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:");
      v286 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "processImagePath");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:");
      v287 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      if ((-[DTOSLogLoaderConfiguration columnInclusions](self->_configuration, "columnInclusions") & 1) != 0)
      {
        objc_msgSend(v302, "senderImageUUID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTOSLogLoader _stackReferenceForRepeatedUUID:](self, "_stackReferenceForRepeatedUUID:", v54);
        v280 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v302, "sender");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTOSLogLoader _stackReferenceForRepeatedString:](self, "_stackReferenceForRepeatedString:", v55);
        v281 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();

        v53 = self;
      }
      else
      {
        v280 = 0;
        v281 = 0;
      }
      if ((-[DTOSLogLoaderConfiguration columnInclusions](v53->_configuration, "columnInclusions") & 2) != 0)
      {
        objc_msgSend(v302, "timeZone");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "name");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTOSLogLoader _stackReferenceForRepeatedString:](v53, "_stackReferenceForRepeatedString:", v57);
        v282 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();

        v53 = self;
      }
      else
      {
        v282 = 0;
      }
      v58 = objc_msgSend(v302, "machContinuousTimestamp");
      machTimeAdjustment = v53->_machTimeAdjustment;
      objc_msgSend(v302, "decomposedMessage");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v306 = v60;
      if (v60)
        v61 = objc_msgSend(v60, "placeholderCount");
      else
        v61 = 0;
      objc_msgSend(v306, "literalPrefixAtIndex:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = v62;
      if (v62 && objc_msgSend(v62, "length"))
      {
        -[DTOSLogLoader _stackReferenceForRepeatedString:](v53, "_stackReferenceForRepeatedString:", v279);
        v291 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v291 = 0;
      }
      v294 = machTimeAdjustment + v58;
      v307 = v61;
      while (v61 > -[NSMutableArray count](v53->_argReferenceConstants, "count"))
      {
        argReferenceConstants = v53->_argReferenceConstants;
        v64 = (void *)objc_opt_new();
        -[NSMutableArray addObject:](argReferenceConstants, "addObject:", v64);

        v53 = self;
        v61 = v307;
      }
      if (v61)
      {
        v292 = 0;
        v65 = 0;
        v283 = v61;
        while (1)
        {
          -[NSMutableArray objectAtIndexedSubscript:](v53->_argReferenceConstants, "objectAtIndexedSubscript:", v65);
          v308 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v306, "placeholderAtIndex:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v325 = 0u;
          v326 = 0u;
          v323 = 0u;
          v324 = 0u;
          v303 = v66;
          objc_msgSend(v66, "tokens");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v323, v334, 16);
          v305 = v65;
          if (v68)
          {
            v310 = 0;
            v69 = 0;
            v70 = *(_QWORD *)v324;
            do
            {
              for (i = 0; i != v68; ++i)
              {
                if (*(_QWORD *)v324 != v70)
                  objc_enumerationMutation(v67);
                v72 = *(_QWORD *)(*((_QWORD *)&v323 + 1) + 8 * i);
                -[NSMutableDictionary objectForKeyedSubscript:](v312->_repeatedPlaceholders, "objectForKeyedSubscript:", v72);
                v73 = (DTOSLogArgumentPlaceholderDescription *)objc_claimAutoreleasedReturnValue();
                if (v73
                  || (v73 = -[DTOSLogArgumentPlaceholderDescription initWithPlaceholderToken:]([DTOSLogArgumentPlaceholderDescription alloc], "initWithPlaceholderToken:", v72), -[NSMutableDictionary setObject:forKeyedSubscript:](v312->_repeatedPlaceholders, "setObject:forKeyedSubscript:", v73, v72), v73))
                {
                  if (v69 || -[DTOSLogArgumentPlaceholderDescription placeholderKind](v73, "placeholderKind") != 2)
                  {
                    if (!v310)
                    {
                      if (-[DTOSLogArgumentPlaceholderDescription placeholderKind](v73, "placeholderKind") == 1)
                      {
                        -[DTOSLogArgumentPlaceholderDescription placeholderObjectValue](v73, "placeholderObjectValue");
                        v310 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v310 = 0;
                      }
                    }
                  }
                  else
                  {
                    -[DTOSLogArgumentPlaceholderDescription placeholderObjectValue](v73, "placeholderObjectValue");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                }

              }
              v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v323, v334, 16);
            }
            while (v68);
          }
          else
          {
            v310 = 0;
            v69 = 0;
          }

          objc_msgSend(v306, "argumentAtIndex:", v305);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v303)
            goto LABEL_123;
          objc_msgSend(v306, "literalPrefixAtIndex:", v305);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[DTOSLogLoader _stackReferenceForRepeatedString:](v312, "_stackReferenceForRepeatedString:", v75);
          v76 = objc_claimAutoreleasedReturnValue();
          v77 = *(void **)(v308 + 24);
          *(_QWORD *)(v308 + 24) = v76;

          v78 = *(void **)(v308 + 16);
          *(_QWORD *)(v308 + 16) = 0;

          v79 = *(void **)(v308 + 8);
          *(_QWORD *)(v308 + 8) = 0;

          v80 = *(void **)(v308 + 32);
          *(_QWORD *)(v308 + 32) = 0;

          *(_BYTE *)(v308 + 50) = 0;
          *(_WORD *)(v308 + 48) = 0;
          v81 = v69;
          if (v69)
            goto LABEL_84;
          if (v305 <= 0x12)
            break;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("arg%d"), v305);
          v82 = (id)objc_claimAutoreleasedReturnValue();
LABEL_85:
          v83 = v82;
          -[DTOSLogLoader _stackReferenceForRepeatedString:](v312, "_stackReferenceForRepeatedString:", v82);
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = *(void **)(v308 + 32);
          *(_QWORD *)(v308 + 32) = v84;

          v86 = v310;
          v87 = v312;
          if (v86)
            goto LABEL_86;
          v95 = objc_msgSend(v74, "category");
          if (v95 != 1)
          {
            if (v95 == 2)
            {
              v86 = CFSTR("string");
              goto LABEL_86;
            }
            if (v95 == 3)
            {
              objc_msgSend(v74, "objectRepresentation");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
                v86 = CFSTR("data");
              else
                v86 = CFSTR("string");
LABEL_103:
              v87 = v312;
              goto LABEL_86;
            }
LABEL_131:
            v86 = 0;
            goto LABEL_86;
          }
          v108 = objc_msgSend(v74, "scalarCategory");
          if ((unint64_t)(v108 - 3) < 2)
          {
            v86 = CFSTR("fixed-decimal");
          }
          else
          {
            if ((unint64_t)(v108 - 1) > 1)
              goto LABEL_131;
            objc_msgSend(v303, "rawString");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = objc_msgSend(v109, "isEqualToString:", CFSTR("%p"));

            v86 = CFSTR("address");
            v87 = v312;
            if ((v110 & 1) == 0)
            {
              objc_msgSend(v303, "rawString");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v111, "containsString:", CFSTR("x")))
              {

                v86 = CFSTR("uint64-hex-lowercase");
              }
              else
              {
                objc_msgSend(v303, "rawString");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                v113 = objc_msgSend(v112, "containsString:", CFSTR("X"));

                if (v113)
                  v86 = CFSTR("uint64-hex-lowercase");
                else
                  v86 = CFSTR("uint64");
              }
              goto LABEL_103;
            }
          }
LABEL_86:
          if (objc_msgSend(v74, "availability") == 2)
          {

            v86 = CFSTR("private");
            v87 = v312;
          }
          else if (!v86)
          {
            v88 = 0;
            goto LABEL_90;
          }
          v88 = XREngineeringTypeIDForMnemonic();
LABEL_90:
          -[DTOSLogLoader _stackReferenceForRepeatedString:](v87, "_stackReferenceForRepeatedString:", v86);
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = *(void **)(v308 + 8);
          *(_QWORD *)(v308 + 8) = v89;

          *(_WORD *)(v308 + 48) = v88;
          if (!*(_QWORD *)(v308 + 8) || !v74)
            goto LABEL_122;
          v91 = objc_msgSend(v74, "category");
          if (v91 == 3)
          {
            if (v88 != 163 || objc_msgSend(v74, "category") != 3)
              goto LABEL_122;
            objc_msgSend(v74, "objectRepresentation");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_121;
            v98 = v92;
            v99 = -[DTOSLogLoaderConfiguration enableBacktraceReplacement](v312->_configuration, "enableBacktraceReplacement");
            if (v292)
              v100 = 0;
            else
              v100 = v99;
            if (v100)
            {
              v292 = v98;
              *(_BYTE *)(v308 + 50) = 1;
              --v283;
            }
            v101 = objc_msgSend(v98, "length");
            v94 = objc_retainAutorelease(v98);
            v102 = objc_msgSend(v94, "bytes");
            if (v101 >= 0x14)
            {
              v103 = v102;
              if (v101 / 0x14 <= 1)
                v104 = 1;
              else
                v104 = v101 / 0x14;
              do
              {
                v105 = *(_OWORD *)v103;
                v333 = *(_DWORD *)(v103 + 16);
                v332 = v105;
                v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v332);
                v107 = -[DTOSLogLoader _stackReferenceForRepeatedUUID:](v312, "_stackReferenceForRepeatedUUID:", v106);

                v103 += 20;
                --v104;
              }
              while (v104);
            }
            v92 = v94;
            goto LABEL_120;
          }
          if (v91 != 2 || v88 == 193)
            goto LABEL_122;
          objc_msgSend(v74, "objectRepresentation");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v92, "length") >= 0x11)
          {
            -[DTOSLogLoader _stackReferenceForRepeatedString:](v312, "_stackReferenceForRepeatedString:", v92);
            v93 = objc_claimAutoreleasedReturnValue();
            v94 = *(id *)(v308 + 16);
            *(_QWORD *)(v308 + 16) = v93;
LABEL_120:

          }
LABEL_121:

LABEL_122:
LABEL_123:

          v65 = v305 + 1;
          v53 = v312;
          if (v305 + 1 == v307)
            goto LABEL_137;
        }
        v81 = *(&off_24EB28F40 + v305);
LABEL_84:
        v82 = v81;
        goto LABEL_85;
      }
      v292 = 0;
      v283 = 0;
LABEL_137:
      -[DTOSLogLoader _stackReferenceForRepeatedString:](v53, "_stackReferenceForRepeatedString:", CFSTR("narrative-text"));
      v114 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      topOfStackRef = (StackReference)v114[2];

      if (v288)
      {
        v115 = v312;
        -[DTOSLogLoader _stackReferenceForRepeatedString:](v312, "_stackReferenceForRepeatedString:");
        v311 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v311 = 0;
        v115 = v312;
      }
      v116 = v307;
      objc_msgSend(v302, "backtrace");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (v117)
      {
        v309 = v117;
        objc_msgSend(v117, "frames");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = (unint64_t)objc_msgSend(v119, "count") < 2;

        if (!v120)
        {
          if (v292)
          {
            v285 = 0;
            v304 = 1;
          }
          else
          {
            v322 = 0u;
            v320 = 0u;
            v321 = 0u;
            v319 = 0u;
            objc_msgSend(v309, "frames");
            v121 = v312;
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v319, v331, 16);
            if (v123)
            {
              v124 = *(_QWORD *)v320;
              do
              {
                for (j = 0; j != v123; ++j)
                {
                  if (*(_QWORD *)v320 != v124)
                    objc_enumerationMutation(v122);
                  objc_msgSend(*(id *)(*((_QWORD *)&v319 + 1) + 8 * j), "imageUUID");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  v127 = -[DTOSLogLoader _stackReferenceForRepeatedUUID:](v121, "_stackReferenceForRepeatedUUID:", v126);

                  v121 = v312;
                }
                v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v319, v331, 16);
              }
              while (v123);
            }

            v304 = 0;
            v285 = 0;
          }
          v115 = v312;
          v116 = v307;
LABEL_155:
          sub_222B3DA5C((uint64_t)v115->_tableLoader.__ptr_.__value_, 100, v118);
          if (v116)
          {
            v130 = 0;
            while (1)
            {
              objc_msgSend(v306, "placeholderAtIndex:", v130);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v306, "argumentAtIndex:", v130);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray objectAtIndexedSubscript:](v115->_argReferenceConstants, "objectAtIndexedSubscript:", v130);
              v134 = objc_claimAutoreleasedReturnValue();
              v135 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              v318 = *(_DWORD *)(*(_QWORD *)(v135 + 16) + 64);
              if (!*(_BYTE *)(v134 + 50))
                break;
LABEL_168:

              ++v130;
              v116 = v307;
              v115 = v312;
              if (v307 == v130)
                goto LABEL_197;
            }
            if (!v131 || !v132)
            {
              sub_222B3B4B8(v135);
LABEL_167:
              v143 = objc_opt_new();
              v144 = *(void **)(v134 + 40);
              *(_QWORD *)(v134 + 40) = v143;

              *(_DWORD *)(*(_QWORD *)(v134 + 40) + 8) = *(_DWORD *)(*((_QWORD *)v312->_tableLoader.__ptr_.__value_ + 2)
                                                                    + 64);
              goto LABEL_168;
            }
            v136 = *(unsigned __int16 *)(v134 + 48);
            v137 = *(_QWORD *)(v134 + 8);
            if (v137)
              sub_222B3B350(v135, (unsigned __int16 *)(v137 + 8), v133);
            else
              sub_222B3B4B8(v135);
            if (*(_WORD *)(v134 + 48) == 248)
            {
              v140 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              LODWORD(v332) = 0;
              v141 = *(_QWORD *)(v140 + 16);
              *(_QWORD *)(v141 + 32) = &v332;
              *(_QWORD *)(v141 + 40) = (char *)&v332 + 4;
              sub_222B41914(v140, v138, v139);
LABEL_166:
              sub_222B3B588((uint64_t)v115->_tableLoader.__ptr_.__value_, &v318, v142);
              goto LABEL_167;
            }
            v145 = objc_msgSend(v132, "category");
            if ((unint64_t)(v145 - 2) >= 2)
            {
              if (v145)
              {
                if (v145 == 1)
                {
                  v146 = objc_msgSend(v132, "scalarType") - 13;
                  v147 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                  if (v146 > 1)
                  {
                    *(_QWORD *)&v332 = objc_msgSend(v132, "unsignedInt64Value");
                  }
                  else
                  {
                    objc_msgSend(v132, "doubleValue");
                    *(_QWORD *)&v332 = v150;
                  }
                  v151 = *(_QWORD *)(v147 + 16);
                  *(_QWORD *)(v151 + 32) = &v332;
                  *(_QWORD *)(v151 + 40) = (char *)&v332 + 8;
                  sub_222B41914(v147, v148, v149);
                }
              }
              else
              {
                sub_222B3B4B8((uint64_t)v115->_tableLoader.__ptr_.__value_);
              }
              goto LABEL_166;
            }
            v152 = *(_QWORD *)(v134 + 16);
            if (v152)
            {
              sub_222B3B350((uint64_t)v115->_tableLoader.__ptr_.__value_, (unsigned __int16 *)(v152 + 8), v142);
              goto LABEL_166;
            }
            objc_msgSend(v132, "objectRepresentation");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v154 = v153;
              v155 = v154;
              if (v136 == 163)
              {
                sub_222B3B168((uint64_t *)v115, v154);
              }
              else
              {
                if (v136 != 135 || (v115 = v312, objc_msgSend(v154, "length") != 16))
                {
                  v160 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                  v161 = objc_retainAutorelease(v155);
                  sub_222B3DB64(v160, objc_msgSend(v161, "bytes"), objc_msgSend(v161, "length"));
LABEL_194:

                  goto LABEL_195;
                }
                v332 = 0uLL;
                objc_msgSend(v155, "getBytes:length:", &v332, 16);
                sub_222B3B094((uint64_t)v312->_tableLoader.__ptr_.__value_, (unint64_t *)&v332, v156);
              }
            }
            else
            {
              if (!v153)
              {
                sub_222B3B4B8((uint64_t)v115->_tableLoader.__ptr_.__value_);
LABEL_195:

                v115 = v312;
                goto LABEL_166;
              }
              objc_msgSend(v153, "description");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v155 = v157;
              if (v157)
              {
                if (v136 != 193)
                {
                  v162 = (size_t)v115->_tableLoader.__ptr_.__value_;
                  v161 = objc_retainAutorelease(v157);
                  sub_222B3DC84(v162, (char *)objc_msgSend(v161, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL);
                  goto LABEL_194;
                }
                objc_msgSend(v157, "dataUsingEncoding:", 4);
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                v276 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                v159 = objc_retainAutorelease(v158);
                sub_222B3DB64(v276, objc_msgSend(v159, "bytes"), objc_msgSend(v159, "length"));

              }
              else
              {
                sub_222B3B4B8((uint64_t)v115->_tableLoader.__ptr_.__value_);
              }
            }
            v161 = v155;
            goto LABEL_194;
          }
LABEL_197:
          v163 = v115->_tableLoader.__ptr_.__value_;
          *((_DWORD *)v163 + 6) = *(_DWORD *)(*((_QWORD *)v163 + 2) + 64);
          *((_BYTE *)v163 + 8) = 1;
          v164 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
          *(_QWORD *)&v332 = v294;
          v165 = *(_QWORD *)(v164 + 16);
          *(_QWORD *)(v165 + 32) = &v332;
          *(_QWORD *)(v165 + 40) = (char *)&v332 + 8;
          sub_222B41914(v164, v128, v129);
          sub_222B3DCE4((uint64_t)v115->_tableLoader.__ptr_.__value_);
          v115->_lastMachTime = v294;
          v167 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
          if (v298)
            sub_222B3B350(v167, v298 + 4, v166);
          else
            sub_222B3B4B8(v167);
          v169 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
          if (v293)
            sub_222B3B350(v169, v293 + 4, v168);
          else
            sub_222B3B4B8(v169);
          if (v301 == 1536)
          {
            v170 = objc_msgSend(v302, "signpostType");
            if (v170 < 3)
            {
              v172 = off_24EB29308[v170];
LABEL_218:
              sub_222B3B350((uint64_t)v115->_tableLoader.__ptr_.__value_, (unsigned __int16 *)((char *)v115 + *v172), v171);
LABEL_219:
              v175 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              if (v297)
                sub_222B3B350(v175, v297 + 4, v174);
              else
                sub_222B3B4B8(v175);
              if (v304)
              {
                sub_222B3B168((uint64_t *)v115, v292);
              }
              else if ((v285 & 1) != 0)
              {
                sub_222B3B4B8((uint64_t)v115->_tableLoader.__ptr_.__value_);
              }
              else
              {
                v318 = *(_DWORD *)(*((_QWORD *)v115->_tableLoader.__ptr_.__value_ + 2) + 64);
                v314 = 0u;
                v315 = 0u;
                v316 = 0u;
                v317 = 0u;
                objc_msgSend(v309, "frames");
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v314, v330, 16);
                if (v178)
                {
                  v179 = *(_QWORD *)v315;
                  do
                  {
                    for (k = 0; k != v178; ++k)
                    {
                      if (*(_QWORD *)v315 != v179)
                        objc_enumerationMutation(v177);
                      v181 = *(void **)(*((_QWORD *)&v314 + 1) + 8 * k);
                      v313 = *(_DWORD *)(*((_QWORD *)v312->_tableLoader.__ptr_.__value_ + 2) + 64);
                      objc_msgSend(v181, "imageUUID");
                      v182 = (void *)objc_claimAutoreleasedReturnValue();
                      -[DTOSLogLoader _stackReferenceForRepeatedUUID:](v312, "_stackReferenceForRepeatedUUID:", v182);
                      v183 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();

                      v185 = (uint64_t)v312->_tableLoader.__ptr_.__value_;
                      if (v183)
                        sub_222B3B350(v185, v183 + 4, v184);
                      else
                        sub_222B3B4B8(v185);
                      if ((unint64_t)objc_msgSend(v181, "imageOffset") >> 32)
                      {
                        sub_222B3B4B8((uint64_t)v312->_tableLoader.__ptr_.__value_);
                      }
                      else
                      {
                        v186 = objc_msgSend(v181, "imageOffset");
                        v187 = (uint64_t)v312->_tableLoader.__ptr_.__value_;
                        LODWORD(v332) = v186;
                        v188 = *(_QWORD *)(v187 + 16);
                        *(_QWORD *)(v188 + 32) = &v332;
                        *(_QWORD *)(v188 + 40) = (char *)&v332 + 4;
                        sub_222B41914(v187, v189, v190);
                      }
                      sub_222B3B588((uint64_t)v312->_tableLoader.__ptr_.__value_, &v313, v191);

                    }
                    v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v314, v330, 16);
                  }
                  while (v178);
                }

                v115 = v312;
                sub_222B3B588((uint64_t)v312->_tableLoader.__ptr_.__value_, &v318, v192);
                v116 = v307;
              }
              v193 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              if (v296)
                sub_222B3B350(v193, v296 + 4, v176);
              else
                sub_222B3B4B8(v193);
              v195 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              if (v295)
                sub_222B3B350(v195, v295 + 4, v194);
              else
                sub_222B3B4B8(v195);
              v197 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              if (v286)
                sub_222B3B350(v197, v286 + 4, v196);
              else
                sub_222B3B4B8(v197);
              v199 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              if (v287)
                sub_222B3B350(v199, v287 + 4, v198);
              else
                sub_222B3B4B8(v199);
              v318 = *(_DWORD *)(*((_QWORD *)v115->_tableLoader.__ptr_.__value_ + 2) + 64);
              if (v116)
              {
                v201 = 0;
                do
                {
                  -[NSMutableArray objectAtIndexedSubscript:](v115->_argReferenceConstants, "objectAtIndexedSubscript:", v201);
                  v202 = objc_claimAutoreleasedReturnValue();
                  v204 = (_QWORD *)v202;
                  if (!*(_BYTE *)(v202 + 50))
                  {
                    if (*(_QWORD *)(v202 + 24))
                    {
                      v205 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      LODWORD(v332) = *(_DWORD *)(*(_QWORD *)(v205 + 16) + 64);
                      sub_222B3B350(v205, &topOfStackRef._generation, v203);
                      sub_222B3B350((uint64_t)v115->_tableLoader.__ptr_.__value_, (unsigned __int16 *)(v204[3] + 8), v206);
                      sub_222B3B588((uint64_t)v115->_tableLoader.__ptr_.__value_, (unsigned int *)&v332, v207);
                    }
                    v208 = v204[5];
                    v209 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                    if (v208)
                      sub_222B3B350(v209, (unsigned __int16 *)(v208 + 8), v203);
                    else
                      sub_222B3B4B8(v209);
                  }

                  ++v201;
                  v116 = v307;
                  v115 = v312;
                }
                while (v307 != v201);
              }
              if (v291)
              {
                v210 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                LODWORD(v332) = *(_DWORD *)(*(_QWORD *)(v210 + 16) + 64);
                sub_222B3B350(v210, &topOfStackRef._generation, v200);
                sub_222B3B350((uint64_t)v115->_tableLoader.__ptr_.__value_, v291 + 4, v211);
                sub_222B3B588((uint64_t)v115->_tableLoader.__ptr_.__value_, (unsigned int *)&v332, v212);
                v213 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
              }
              else
              {
                v213 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                if (!v283)
                {
                  sub_222B3B4B8(v213);
LABEL_265:
                  if (v301 != 1536)
                  {
LABEL_278:
                    if ((-[DTOSLogLoaderConfiguration columnInclusions](v115->_configuration, "columnInclusions") & 1) != 0)
                    {
                      v224 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      if (v280)
                        sub_222B3B350(v224, v280 + 4, v223);
                      else
                        sub_222B3B4B8(v224);
                      v225 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      *(_QWORD *)&v332 = objc_msgSend(v302, "senderImageOffset");
                      v226 = *(_QWORD *)(v225 + 16);
                      *(_QWORD *)(v226 + 32) = &v332;
                      *(_QWORD *)(v226 + 40) = (char *)&v332 + 8;
                      sub_222B41914(v225, v227, v228);
                      v230 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      if (v281)
                        sub_222B3B350(v230, v281 + 4, v229);
                      else
                        sub_222B3B4B8(v230);
                    }
                    if ((-[DTOSLogLoaderConfiguration columnInclusions](v115->_configuration, "columnInclusions") & 2) != 0)
                    {
                      v232 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      if (v282)
                        sub_222B3B350(v232, v282 + 4, v231);
                      else
                        sub_222B3B4B8(v232);
                      v233 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      objc_msgSend(v302, "date");
                      v234 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v234, "timeIntervalSince1970");
                      *(_QWORD *)&v332 = v235;
                      v236 = *(_QWORD *)(v233 + 16);
                      *(_QWORD *)(v236 + 32) = &v332;
                      *(_QWORD *)(v236 + 40) = (char *)&v332 + 8;
                      sub_222B41914(v233, v237, v238);

                      v115 = v312;
                      v116 = v307;
                    }
                    sub_222B3DDB4(v115->_tableLoader.__ptr_.__value_, 2 * (v301 == 1536), v231);
                    ++v115->_rowsSent;
                    if (v116)
                    {
                      v239 = 0;
                      do
                      {
                        objc_msgSend(v306, "placeholderAtIndex:", v239);
                        v240 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v306, "argumentAtIndex:", v239);
                        v241 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSMutableArray objectAtIndexedSubscript:](v115->_argReferenceConstants, "objectAtIndexedSubscript:", v239);
                        v244 = objc_claimAutoreleasedReturnValue();
                        if (*(_BYTE *)(v244 + 50))
                          v245 = 1;
                        else
                          v245 = v240 == 0;
                        if (!v245 && v241 != 0)
                        {
                          v247 = v115->_tableLoader.__ptr_.__value_;
                          *((_DWORD *)v247 + 6) = *(_DWORD *)(*((_QWORD *)v247 + 2) + 64);
                          *((_BYTE *)v247 + 8) = 1;
                          v248 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                          *(_QWORD *)&v332 = v294;
                          v249 = *(_QWORD *)(v248 + 16);
                          *(_QWORD *)(v249 + 32) = &v332;
                          *(_QWORD *)(v249 + 40) = (char *)&v332 + 8;
                          sub_222B41914(v248, v242, v243);
                          sub_222B3DCE4((uint64_t)v115->_tableLoader.__ptr_.__value_);
                          v251 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                          if (v298)
                            sub_222B3B350(v251, v298 + 4, v250);
                          else
                            sub_222B3B4B8(v251);
                          sub_222B3B350((uint64_t)v115->_tableLoader.__ptr_.__value_, v293 + 4, v252);
                          v254 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                          if (v297)
                            sub_222B3B350(v254, v297 + 4, v253);
                          else
                            sub_222B3B4B8(v254);
                          v256 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                          if (v296)
                            sub_222B3B350(v256, v296 + 4, v255);
                          else
                            sub_222B3B4B8(v256);
                          v258 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                          if (v295)
                            sub_222B3B350(v258, v295 + 4, v257);
                          else
                            sub_222B3B4B8(v258);
                          v260 = *(_QWORD *)(v244 + 32);
                          v261 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                          if (v260)
                            sub_222B3B350(v261, (unsigned __int16 *)(v260 + 8), v259);
                          else
                            sub_222B3B4B8(v261);
                          v263 = *(_QWORD *)(v244 + 40);
                          if (v263)
                          {
                            v264 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                            LODWORD(v332) = *(_DWORD *)(*(_QWORD *)(v264 + 16) + 64);
                            sub_222B3B350(v264, (unsigned __int16 *)(v263 + 8), v262);
                            sub_222B3B588((uint64_t)v115->_tableLoader.__ptr_.__value_, (unsigned int *)&v332, v265);
                          }
                          else
                          {
                            sub_222B3B4B8((uint64_t)v115->_tableLoader.__ptr_.__value_);
                          }
                          v267 = v115->_tableLoader.__ptr_.__value_;
                          if (v301 == 1536)
                          {
                            *(_QWORD *)&v332 = objc_msgSend(v302, "signpostIdentifier");
                            v268 = *((_QWORD *)v267 + 2);
                            *(_QWORD *)(v268 + 32) = &v332;
                            *(_QWORD *)(v268 + 40) = (char *)&v332 + 8;
                            sub_222B41914((uint64_t)v267, v269, v270);
                            v272 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                            if (v311)
                              sub_222B3B350(v272, v311 + 4, v271);
                            else
                              sub_222B3B4B8(v272);
                            v267 = v115->_tableLoader.__ptr_.__value_;
                            v273 = 3;
                          }
                          else
                          {
                            v273 = 1;
                          }
                          sub_222B3DDB4(v267, v273, v266);
                          ++v115->_rowsSent;
                        }

                        ++v239;
                        v115 = v312;
                      }
                      while (v307 != v239);
                    }
                    sub_222B41AE4(*((_QWORD *)v115->_tableLoader.__ptr_.__value_ + 2), ((unint64_t)v283 << 8) | 0x6A, v283, 0);
                    v275 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                    if (**(_DWORD **)(v275 + 16) == 5)
                      v115->_ignoreNextRecord = 1;
                    sub_222B3DA5C(v275, 200, v274);
                    if (!v115->_slackInMachTimeUnits && v115->_lastMachTime < v294)
                      v115->_lastMachTime = v294;

                    goto LABEL_333;
                  }
                  v214 = objc_msgSend(v302, "signpostScope");
                  switch(v214)
                  {
                    case 192:
                      v216 = &OBJC_IVAR___DTOSLogLoader__systemScopeRef;
                      break;
                    case 128:
                      v216 = &OBJC_IVAR___DTOSLogLoader__processScopeRef;
                      break;
                    case 64:
                      v216 = &OBJC_IVAR___DTOSLogLoader__threadScopeRef;
                      break;
                    default:
                      sub_222B3B4B8((uint64_t)v115->_tableLoader.__ptr_.__value_);
LABEL_275:
                      v217 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      *(_QWORD *)&v332 = objc_msgSend(v302, "signpostIdentifier");
                      v218 = *(_QWORD *)(v217 + 16);
                      *(_QWORD *)(v218 + 32) = &v332;
                      *(_QWORD *)(v218 + 40) = (char *)&v332 + 8;
                      sub_222B41914(v217, v219, v220);
                      v222 = (uint64_t)v115->_tableLoader.__ptr_.__value_;
                      if (v311)
                        sub_222B3B350(v222, v311 + 4, v221);
                      else
                        sub_222B3B4B8(v222);
                      goto LABEL_278;
                  }
                  sub_222B3B350((uint64_t)v115->_tableLoader.__ptr_.__value_, (unsigned __int16 *)((char *)v115 + *v216), v215);
                  goto LABEL_275;
                }
              }
              sub_222B3B588(v213, &v318, v200);
              goto LABEL_265;
            }
          }
          else
          {
            v173 = objc_msgSend(v302, "logType");
            if (v173 <= 1)
            {
              if (!v173)
              {
                v172 = &OBJC_IVAR___DTOSLogLoader__defaultLevelRef;
                goto LABEL_218;
              }
              if (v173 == 1)
              {
                v172 = &OBJC_IVAR___DTOSLogLoader__infoLevelRef;
                goto LABEL_218;
              }
            }
            else
            {
              switch(v173)
              {
                case 2:
                  v172 = &OBJC_IVAR___DTOSLogLoader__debugLevelRef;
                  goto LABEL_218;
                case 16:
                  v172 = &OBJC_IVAR___DTOSLogLoader__errorLevelRef;
                  goto LABEL_218;
                case 17:
                  v172 = &OBJC_IVAR___DTOSLogLoader__faultLevelRef;
                  goto LABEL_218;
              }
            }
          }
          sub_222B3B4B8((uint64_t)v115->_tableLoader.__ptr_.__value_);
          goto LABEL_219;
        }

        v115 = v312;
        v116 = v307;
      }
      v309 = 0;
      v304 = v292 != 0;
      v285 = 1;
      goto LABEL_155;
    }
    -[OSLogEventStreamBase invalidate](self->_deserializedEventStream, "invalidate");
  }
LABEL_22:
  pthread_mutex_unlock(p_stateLock);
LABEL_334:

}

- (void)_performResetOnOutputStream
{
  NSObject *v3;
  id v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  const char **v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  char *v99;
  const char **v100;
  char *v101;
  const char **v102;
  const char *v103;
  char *v104;
  const char **v105;
  char *v106;
  char *v107;
  char *v108;
  const char **v109;
  char *v110;
  void *__p;
  char *v112;
  char *v113;

  sub_222B3EADC((uint64_t)self->_tableLoader.__ptr_.__value_);
  v3 = MEMORY[0x24BDACB70];
  v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_222BC62EC();

  v5 = (char *)operator new(0x58uLL);
  v112 = v5 + 88;
  v113 = v5 + 88;
  *((_OWORD *)v5 + 2) = xmmword_24EB28FF8;
  *((_OWORD *)v5 + 3) = *(_OWORD *)&off_24EB29008;
  *((_OWORD *)v5 + 4) = xmmword_24EB29018;
  *((_QWORD *)v5 + 10) = "message";
  *(_OWORD *)v5 = xmmword_24EB28FD8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)&off_24EB28FE8;
  __p = v5;
  v6 = (char *)operator new(0x70uLL);
  v106 = v6 + 112;
  v110 = v6 + 112;
  *((_OWORD *)v6 + 4) = xmmword_24EB29070;
  *((_OWORD *)v6 + 5) = *(_OWORD *)&off_24EB29080;
  *((_OWORD *)v6 + 6) = xmmword_24EB29090;
  *(_OWORD *)v6 = xmmword_24EB29030;
  *((_OWORD *)v6 + 1) = *(_OWORD *)&off_24EB29040;
  *((_OWORD *)v6 + 2) = xmmword_24EB29050;
  *((_OWORD *)v6 + 3) = *(_OWORD *)&off_24EB29060;
  v104 = v6;
  if ((-[DTOSLogLoaderConfiguration columnInclusions](self->_configuration, "columnInclusions") & 1) != 0)
  {
    v7 = v112;
    if (v112 >= v113)
    {
      v9 = (v112 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v9 + 1) >> 61)
        sub_222B348D4();
      v10 = (v113 - (_BYTE *)__p) >> 2;
      if (v10 <= v9 + 1)
        v10 = v9 + 1;
      if ((unint64_t)(v113 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v11 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v11 = v10;
      if (v11)
        v12 = (char *)sub_222B431C4((uint64_t)&v113, v11);
      else
        v12 = 0;
      v13 = &v12[8 * v9];
      v14 = &v12[8 * v11];
      *(_QWORD *)v13 = "sender-image-uuid";
      v8 = v13 + 8;
      v16 = (char *)__p;
      v15 = v112;
      if (v112 != __p)
      {
        do
        {
          v17 = *((_QWORD *)v15 - 1);
          v15 -= 8;
          *((_QWORD *)v13 - 1) = v17;
          v13 -= 8;
        }
        while (v15 != v16);
        v15 = (char *)__p;
      }
      __p = v13;
      v112 = v8;
      v113 = v14;
      if (v15)
        operator delete(v15);
    }
    else
    {
      *(_QWORD *)v112 = "sender-image-uuid";
      v8 = v7 + 8;
    }
    v112 = v8;
    if (v8 >= v113)
    {
      v19 = (v8 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v19 + 1) >> 61)
        sub_222B348D4();
      v20 = (v113 - (_BYTE *)__p) >> 2;
      if (v20 <= v19 + 1)
        v20 = v19 + 1;
      if ((unint64_t)(v113 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v21 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v21 = v20;
      if (v21)
        v22 = (char *)sub_222B431C4((uint64_t)&v113, v21);
      else
        v22 = 0;
      v23 = &v22[8 * v19];
      v24 = &v22[8 * v21];
      *(_QWORD *)v23 = "sender-image-offset";
      v18 = v23 + 8;
      v26 = (char *)__p;
      v25 = v112;
      if (v112 != __p)
      {
        do
        {
          v27 = *((_QWORD *)v25 - 1);
          v25 -= 8;
          *((_QWORD *)v23 - 1) = v27;
          v23 -= 8;
        }
        while (v25 != v26);
        v25 = (char *)__p;
      }
      __p = v23;
      v112 = v18;
      v113 = v24;
      if (v25)
        operator delete(v25);
    }
    else
    {
      *(_QWORD *)v8 = "sender-image-offset";
      v18 = v8 + 8;
    }
    v112 = v18;
    if (v18 >= v113)
    {
      v29 = (v18 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v29 + 1) >> 61)
        sub_222B348D4();
      v30 = (v113 - (_BYTE *)__p) >> 2;
      if (v30 <= v29 + 1)
        v30 = v29 + 1;
      if ((unint64_t)(v113 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v31 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v31 = v30;
      if (v31)
        v32 = (char *)sub_222B431C4((uint64_t)&v113, v31);
      else
        v32 = 0;
      v33 = &v32[8 * v29];
      v34 = &v32[8 * v31];
      *(_QWORD *)v33 = "sender-image-name";
      v28 = v33 + 8;
      v36 = (char *)__p;
      v35 = v112;
      if (v112 != __p)
      {
        do
        {
          v37 = *((_QWORD *)v35 - 1);
          v35 -= 8;
          *((_QWORD *)v33 - 1) = v37;
          v33 -= 8;
        }
        while (v35 != v36);
        v35 = (char *)__p;
      }
      __p = v33;
      v112 = v28;
      v113 = v34;
      if (v35)
        operator delete(v35);
    }
    else
    {
      *(_QWORD *)v18 = "sender-image-name";
      v28 = v18 + 8;
    }
    v112 = v28;
    if (v106 >= v110)
    {
      v39 = (v106 - v104) >> 3;
      if ((unint64_t)(v39 + 1) >> 61)
        sub_222B348D4();
      v40 = (v110 - v104) >> 2;
      if (v40 <= v39 + 1)
        v40 = v39 + 1;
      if ((unint64_t)(v110 - v104) >= 0x7FFFFFFFFFFFFFF8)
        v41 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v41 = v40;
      if (v41)
        v42 = (char *)sub_222B431C4((uint64_t)&v110, v41);
      else
        v42 = 0;
      v43 = &v42[8 * v39];
      v44 = &v42[8 * v41];
      *(_QWORD *)v43 = "sender-image-uuid";
      v38 = v43 + 8;
      v45 = v106;
      if (v106 != v104)
      {
        do
        {
          v46 = *((_QWORD *)v45 - 1);
          v45 -= 8;
          *((_QWORD *)v43 - 1) = v46;
          v43 -= 8;
        }
        while (v45 != v104);
        v45 = v104;
      }
      v104 = v43;
      v110 = v44;
      if (v45)
        operator delete(v45);
    }
    else
    {
      *(_QWORD *)v106 = "sender-image-uuid";
      v38 = v106 + 8;
    }
    v107 = v38;
    if (v38 >= v110)
    {
      v48 = (v38 - v104) >> 3;
      if ((unint64_t)(v48 + 1) >> 61)
        sub_222B348D4();
      v49 = (v110 - v104) >> 2;
      if (v49 <= v48 + 1)
        v49 = v48 + 1;
      if ((unint64_t)(v110 - v104) >= 0x7FFFFFFFFFFFFFF8)
        v50 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v50 = v49;
      if (v50)
        v51 = (char *)sub_222B431C4((uint64_t)&v110, v50);
      else
        v51 = 0;
      v52 = &v51[8 * v48];
      v53 = &v51[8 * v50];
      *(_QWORD *)v52 = "sender-image-offset";
      v47 = v52 + 8;
      v54 = v107;
      if (v107 != v104)
      {
        do
        {
          v55 = *((_QWORD *)v54 - 1);
          v54 -= 8;
          *((_QWORD *)v52 - 1) = v55;
          v52 -= 8;
        }
        while (v54 != v104);
        v54 = v104;
      }
      v104 = v52;
      v110 = v53;
      if (v54)
        operator delete(v54);
    }
    else
    {
      *(_QWORD *)v38 = "sender-image-offset";
      v47 = v38 + 8;
    }
    v108 = v47;
    if (v47 >= v110)
    {
      v57 = (v47 - v104) >> 3;
      if ((unint64_t)(v57 + 1) >> 61)
        sub_222B348D4();
      v58 = (v110 - v104) >> 2;
      if (v58 <= v57 + 1)
        v58 = v57 + 1;
      if ((unint64_t)(v110 - v104) >= 0x7FFFFFFFFFFFFFF8)
        v59 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v59 = v58;
      if (v59)
        v60 = (char *)sub_222B431C4((uint64_t)&v110, v59);
      else
        v60 = 0;
      v61 = &v60[8 * v57];
      v62 = &v60[8 * v59];
      *(_QWORD *)v61 = "sender-image-name";
      v56 = v61 + 8;
      v63 = v108;
      if (v108 != v104)
      {
        do
        {
          v64 = *((_QWORD *)v63 - 1);
          v63 -= 8;
          *((_QWORD *)v61 - 1) = v64;
          v61 -= 8;
        }
        while (v63 != v104);
        v63 = v104;
      }
      v104 = v61;
      v110 = v62;
      if (v63)
        operator delete(v63);
    }
    else
    {
      *(_QWORD *)v47 = "sender-image-name";
      v56 = v47 + 8;
    }
    v106 = v56;
  }
  if ((-[DTOSLogLoaderConfiguration columnInclusions](self->_configuration, "columnInclusions", v104) & 2) != 0)
  {
    v65 = v112;
    if (v112 >= v113)
    {
      v67 = (v112 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v67 + 1) >> 61)
        sub_222B348D4();
      v68 = (v113 - (_BYTE *)__p) >> 2;
      if (v68 <= v67 + 1)
        v68 = v67 + 1;
      if ((unint64_t)(v113 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v69 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v69 = v68;
      if (v69)
        v70 = (char *)sub_222B431C4((uint64_t)&v113, v69);
      else
        v70 = 0;
      v71 = &v70[8 * v67];
      v72 = &v70[8 * v69];
      *(_QWORD *)v71 = "timezone-name";
      v66 = v71 + 8;
      v74 = (char *)__p;
      v73 = v112;
      if (v112 != __p)
      {
        do
        {
          v75 = *((_QWORD *)v73 - 1);
          v73 -= 8;
          *((_QWORD *)v71 - 1) = v75;
          v71 -= 8;
        }
        while (v73 != v74);
        v73 = (char *)__p;
      }
      __p = v71;
      v112 = v66;
      v113 = v72;
      if (v73)
        operator delete(v73);
    }
    else
    {
      *(_QWORD *)v112 = "timezone-name";
      v66 = v65 + 8;
    }
    v112 = v66;
    if (v66 >= v113)
    {
      v77 = (v66 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v77 + 1) >> 61)
        sub_222B348D4();
      v78 = (v113 - (_BYTE *)__p) >> 2;
      if (v78 <= v77 + 1)
        v78 = v77 + 1;
      if ((unint64_t)(v113 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v79 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v79 = v78;
      if (v79)
        v80 = (char *)sub_222B431C4((uint64_t)&v113, v79);
      else
        v80 = 0;
      v81 = &v80[8 * v77];
      v82 = &v80[8 * v79];
      *(_QWORD *)v81 = "unix-time-interval";
      v76 = v81 + 8;
      v84 = (char *)__p;
      v83 = v112;
      if (v112 != __p)
      {
        do
        {
          v85 = *((_QWORD *)v83 - 1);
          v83 -= 8;
          *((_QWORD *)v81 - 1) = v85;
          v81 -= 8;
        }
        while (v83 != v84);
        v83 = (char *)__p;
      }
      __p = v81;
      v112 = v76;
      v113 = v82;
      if (v83)
        operator delete(v83);
    }
    else
    {
      *(_QWORD *)v66 = "unix-time-interval";
      v76 = v66 + 8;
    }
    v112 = v76;
    if (v106 >= v110)
    {
      v87 = (v106 - (char *)v105) >> 3;
      if ((unint64_t)(v87 + 1) >> 61)
        sub_222B348D4();
      v88 = (v110 - (char *)v105) >> 2;
      if (v88 <= v87 + 1)
        v88 = v87 + 1;
      if ((unint64_t)(v110 - (char *)v105) >= 0x7FFFFFFFFFFFFFF8)
        v89 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v89 = v88;
      if (v89)
        v90 = (char *)sub_222B431C4((uint64_t)&v110, v89);
      else
        v90 = 0;
      v91 = &v90[8 * v87];
      v92 = &v90[8 * v89];
      *(_QWORD *)v91 = "timezone-name";
      v86 = v91 + 8;
      v93 = (const char **)v106;
      if (v106 != (char *)v105)
      {
        do
        {
          v94 = (uint64_t)*--v93;
          *((_QWORD *)v91 - 1) = v94;
          v91 -= 8;
        }
        while (v93 != v105);
        v93 = v105;
      }
      v105 = (const char **)v91;
      v110 = v92;
      if (v93)
        operator delete(v93);
    }
    else
    {
      *(_QWORD *)v106 = "timezone-name";
      v86 = v106 + 8;
    }
    v109 = (const char **)v86;
    if (v86 >= v110)
    {
      v96 = (v86 - (char *)v105) >> 3;
      if ((unint64_t)(v96 + 1) >> 61)
        sub_222B348D4();
      v97 = (v110 - (char *)v105) >> 2;
      if (v97 <= v96 + 1)
        v97 = v96 + 1;
      if ((unint64_t)(v110 - (char *)v105) >= 0x7FFFFFFFFFFFFFF8)
        v98 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v98 = v97;
      if (v98)
        v99 = (char *)sub_222B431C4((uint64_t)&v110, v98);
      else
        v99 = 0;
      v100 = (const char **)&v99[8 * v96];
      v101 = &v99[8 * v98];
      *v100 = "unix-time-interval";
      v95 = (_DWORD)v100 + 8;
      v102 = v109;
      if (v109 != v105)
      {
        do
        {
          v103 = *--v102;
          *--v100 = v103;
        }
        while (v102 != v105);
        v102 = v105;
      }
      v105 = v100;
      v110 = v101;
      if (v102)
        operator delete(v102);
    }
    else
    {
      *(_QWORD *)v86 = "unix-time-interval";
      v95 = (_DWORD)v86 + 8;
    }
    LODWORD(v106) = v95;
  }
  sub_222B3EBBC(self->_tableLoader.__ptr_.__value_, 0, (uint64_t)"os-log", 6, 0, 0, (const char **)__p, (((_DWORD)v112 - (_DWORD)__p) >> 3));
  sub_222B3EBBC(self->_tableLoader.__ptr_.__value_, 1, (uint64_t)"os-log-arg", 10, 0, 0, (const char **)off_24EB290A0, 8);
  sub_222B3EBBC(self->_tableLoader.__ptr_.__value_, 2, (uint64_t)"os-signpost", 11, 0, 0, v105, (((_DWORD)v106 - (_DWORD)v105) >> 3));
  sub_222B3EBBC(self->_tableLoader.__ptr_.__value_, 3, (uint64_t)"os-signpost-arg", 15, 0, 0, (const char **)off_24EB290E0, 10);
  self->_deviceSessionRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "TODO", 0xFFFFFFFFFFFFFFFFLL);
  self->_defaultLevelRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Default", 0xFFFFFFFFFFFFFFFFLL);
  self->_debugLevelRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Debug", 0xFFFFFFFFFFFFFFFFLL);
  self->_infoLevelRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Info", 0xFFFFFFFFFFFFFFFFLL);
  self->_errorLevelRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Error", 0xFFFFFFFFFFFFFFFFLL);
  self->_faultLevelRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Fault", 0xFFFFFFFFFFFFFFFFLL);
  self->_beginRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Begin", 0xFFFFFFFFFFFFFFFFLL);
  self->_emitRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Event", 0xFFFFFFFFFFFFFFFFLL);
  self->_endRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "End", 0xFFFFFFFFFFFFFFFFLL);
  self->_threadScopeRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Thread", 0xFFFFFFFFFFFFFFFFLL);
  self->_processScopeRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "Process", 0xFFFFFFFFFFFFFFFFLL);
  self->_systemScopeRef = (StackReference)sub_222B3AF00((size_t)self->_tableLoader.__ptr_.__value_, "System", 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableDictionary removeAllObjects](self->_repeatedStrings, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_repeatedUUIDs, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_argReferenceConstants, "removeAllObjects");
  -[XRIntKeyedDictionary removeAllObjects](self->_pushedProcessesByPid, "removeAllObjects");
  sub_222B431F8((uint64_t)&self->_pushedThreadsAndProcesses);
  if (v105)
    operator delete(v105);
  if (__p)
  {
    v112 = (char *)__p;
    operator delete(__p);
  }
}

- (void)_setupCommonStreamParameters:(id)a3
{
  OSLogEventLiveStream *v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = (OSLogEventLiveStream *)a3;
  v5 = -[DTOSLogLoaderConfiguration signpostConfig](self->_configuration, "signpostConfig");
  if (v5)
  {
    if (v5 == 1)
    {
      v7 = self->_liveStream == v4;
      v6 = 1012;
      v8 = 500;
    }
    else
    {
      v6 = 212;
      v7 = v5 == 2;
      v8 = 215;
    }
    if (v7)
      v9 = v8;
    else
      v9 = v6;
  }
  else
  {
    v9 = 247;
  }
  v10 = -[DTOSLogLoaderConfiguration loaderExclusions](self->_configuration, "loaderExclusions");
  v11 = -[DTOSLogLoaderConfiguration loaderExclusions](self->_configuration, "loaderExclusions");
  v12 = v9 & 0x3F6;
  if ((v10 & 1) == 0)
    v12 = v9;
  if ((v11 & 2) != 0)
    v13 = v12 & 0x3F5;
  else
    v13 = v12;
  -[DTOSLogLoaderConfiguration filterPredicate](self->_configuration, "filterPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogEventLiveStream setFilterPredicate:](v4, "setFilterPredicate:", v14);
  -[OSLogEventLiveStream filterPredicate](v4, "filterPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[DTOSLogLoaderConfiguration setFilterPredicate:](self->_configuration, "setFilterPredicate:", v15);
  if (v15)
  {
    if (self->_liveStream == v4)
    {
      +[DTOSLogLoader heartbeatPredicate](DTOSLogLoader, "heartbeatPredicate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD14C0];
      v23[0] = v15;
      v23[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = v15;
    }
  }
  else
  {
    v16 = 0;
  }
  -[OSLogEventLiveStream setFilterPredicate:](v4, "setFilterPredicate:", v16);
  -[OSLogEventLiveStream setFlags:](v4, "setFlags:", v13);
  -[OSLogEventLiveStream setTarget:](v4, "setTarget:", MEMORY[0x24BDAC9B8]);
  v20 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_222B3F0A0;
  v22[3] = &unk_24EB29138;
  v22[4] = self;
  -[OSLogEventLiveStream setEventHandler:](v4, "setEventHandler:", v22);
  v21[0] = v20;
  v21[1] = 3221225472;
  v21[2] = sub_222B3F2FC;
  v21[3] = &unk_24EB29188;
  v21[4] = self;
  -[OSLogEventLiveStream setInvalidationHandler:](v4, "setInvalidationHandler:", v21);

}

- (id)_setupLoggedStreamForNextChunk:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[DTOSLogLoaderConfiguration signpostConfig](self->_configuration, "signpostConfig");
  if (v5)
  {
    if (v5 == 1)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE60C80]), "initWithSource:skipNonSignpostFiles:", v4, 1);
      goto LABEL_6;
    }
    if (v5 != 2)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE60C80]), "initWithSource:", v4);
LABEL_6:
  v7 = (void *)v6;
LABEL_8:
  objc_storeStrong((id *)&self->_loggedStream, v7);
  -[DTOSLogLoader _setupCommonStreamParameters:](self, "_setupCommonStreamParameters:", v7);

  return v7;
}

- (void)_setupLiveStream:(id)a3
{
  id v4;
  OSLogEventLiveStream *v5;
  OSLogEventLiveStream *liveStream;
  OSLogEventLiveStream *v7;
  unint64_t v8;
  mach_timebase_info info;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  v5 = (OSLogEventLiveStream *)objc_msgSend(objc_alloc(MEMORY[0x24BE60C70]), "initWithLiveSource:", v4);
  liveStream = self->_liveStream;
  self->_liveStream = v5;

  objc_initWeak(&location, self);
  v7 = self->_liveStream;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_222B3F7D4;
  v10[3] = &unk_24EB291B0;
  objc_copyWeak(&v11, &location);
  -[OSLogEventLiveStream setDroppedEventHandler:](v7, "setDroppedEventHandler:", v10);
  -[DTOSLogLoader _setupCommonStreamParameters:](self, "_setupCommonStreamParameters:", self->_liveStream);
  if (mach_timebase_info(&info))
    v8 = 0;
  else
    v8 = 5000000 * (unint64_t)info.denom / info.numer;
  self->_slackInMachTimeUnits = v8;
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)invalidate
{
  _opaque_pthread_mutex_t *p_stateLock;

  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  self->_workingBufferCanBeReplaced = 0;
  pthread_cond_signal(&self->_stateChanged);
  pthread_mutex_unlock(p_stateLock);
}

- (NSError)failureReason
{
  return self->_failureReason;
}

- (DTOSLogLoaderDelegate)delegate
{
  return (DTOSLogLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  DTOSLogTableLoader *value;

  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pidToExecNameMapping, 0);
  objc_storeStrong((id *)&self->_argReferenceConstants, 0);
  objc_storeStrong((id *)&self->_repeatedPlaceholders, 0);
  objc_storeStrong((id *)&self->_repeatedUUIDs, 0);
  objc_storeStrong((id *)&self->_repeatedStrings, 0);
  sub_222B43290((uint64_t)&self->_pushedThreadsAndProcesses);
  objc_storeStrong((id *)&self->_pushedProcessesByPid, 0);
  objc_storeStrong((id *)&self->_workingBuffer, 0);
  objc_storeStrong((id *)&self->_agentWaitingForEvents, 0);
  value = self->_tableLoader.__ptr_.__value_;
  self->_tableLoader.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(DTOSLogTableLoader *))(*(_QWORD *)value + 16))(value);
  objc_storeStrong((id *)&self->_lastFetchTicket, 0);
  objc_storeStrong((id *)&self->_agentWaitingForStop, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_liveStream, 0);
  objc_storeStrong((id *)&self->_liveEventStore, 0);
  objc_storeStrong((id *)&self->_loggedStream, 0);
  objc_storeStrong((id *)&self->_loggedEventStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_deserializedEventStream, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 32) = 0;
  *((_DWORD *)self + 66) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_DWORD *)self + 82) = 0;
  *((_DWORD *)self + 92) = 0;
  *((_DWORD *)self + 93) = 0;
  *((_DWORD *)self + 94) = 0;
  *((_DWORD *)self + 95) = 0;
  *((_DWORD *)self + 96) = 0;
  *((_DWORD *)self + 97) = 0;
  *((_DWORD *)self + 98) = 0;
  *((_DWORD *)self + 99) = 0;
  *((_DWORD *)self + 100) = 0;
  *((_DWORD *)self + 101) = 0;
  *((_DWORD *)self + 102) = 0;
  *((_DWORD *)self + 103) = 0;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *((_DWORD *)self + 114) = 1065353216;
  return self;
}

@end
