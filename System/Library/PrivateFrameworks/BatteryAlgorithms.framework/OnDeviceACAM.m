@implementation OnDeviceACAM

+ (id)algorithmWithData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__OnDeviceACAM_algorithmWithData___block_invoke;
  v9[3] = &unk_25086D590;
  v10 = v4;
  v11 = a1;
  v5 = +[OnDeviceACAM algorithmWithData:]::onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&+[OnDeviceACAM algorithmWithData:]::onceToken, v9);
  v7 = (id)+[OnDeviceACAM algorithmWithData:]::instance;

  return v7;
}

void __34__OnDeviceACAM_algorithmWithData___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "init:", *(_QWORD *)(a1 + 32));
  v2 = (void *)+[OnDeviceACAM algorithmWithData:]::instance;
  +[OnDeviceACAM algorithmWithData:]::instance = v1;

}

- (int)freshInitWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double *v7;
  void *v8;
  void *v9;
  void *v10;
  ACAM *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  objc_object *v18;
  void *v19;
  ACAMSerialization::Serialization *v20;
  const ACAM *v21;
  uint64_t v22;
  double *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v28;
  unint64_t i;
  void *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  unint64_t j;
  void *v43;
  _OWORD *v44;
  __int128 v45;
  __int128 v46;
  _QWORD *v47;
  _OWORD *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  __int128 v54;
  __int128 v55;
  char *v56;
  __int128 v57;
  __int128 v58;
  char *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  ACAMPersistentStates *v65;
  ACAMPersistentStates *v66;
  uint64_t v67;
  NSString *v68;
  void *v69;
  ACAMSerialization::Serialization *v70;
  double *v71;
  const ACAM *v72;
  uint64_t v73;
  double *v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
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
  _OWORD v96[3];
  uint64_t v97;
  _OWORD v98[3];
  uint64_t v99;
  ACAMPersistentStates *v100[2];
  __int128 v101;
  uint64_t v102;
  void *__p;
  _QWORD *v104;
  char *v105;
  void *v106;
  char *v107;
  char *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  double v113[3];
  double v114;
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[5];
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  _QWORD v125[3];
  _QWORD v126[3];
  _QWORD v127[2];
  _QWORD v128[5];

  v128[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("smcData"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sbcStreamData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("obcStreamData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("dailyStreamData"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double *)(-[OnDeviceACAM model](self, "model") + 6912);
  ACAMSerialization::Deserialization::setSMCKeyDataFromDictionary(v113, v7, v95);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v8) & 1) != 0 || !objc_msgSend(v5, "count"))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v9) & 1) != 0 || !objc_msgSend(v6, "count"))
  {
LABEL_7:

LABEL_8:
LABEL_9:
    -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("BDC Data is not present. Performing fallback initialization"));
    v11 = -[OnDeviceACAM model](self, "model");
    ACAM::init(v11, v114, v113[1], v113[0]);
    v127[1] = CFSTR("parsedTeq");
    v128[0] = v95;
    v127[0] = CFSTR("rawSmcKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v113[0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v128[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v128, v127, 2);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();

    -[OnDeviceACAM runTimeOptions](self, "runTimeOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SaveDebugInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", MEMORY[0x24BDBD1C8]);

    if (v16)
    {
      -[OnDeviceACAM debugLogBuffer](self, "debugLogBuffer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)CFSTR("Fallback init inputs"), v13, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

      saveCurrentSnapshotIntoDebugBuffer(self, CFSTR("Fallback initialization result"));
    }
    -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("Fallback initialization complete."));
    v20 = -[OnDeviceACAM model](self, "model");
    ACAMSerialization::Serialization::createBDCDailyFromACAM(v20, v21, v114, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v126[0] = v24;
    v125[0] = CFSTR("postFreshInitSnapshot");
    v125[1] = CFSTR("freshInitReason");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(-[OnDeviceACAM model](self, "model") + 28972));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v125[2] = CFSTR("fallbackInitInfo");
    v126[1] = v25;
    v126[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OnDeviceACAM setFreshInitInfo:](self, "setFreshInitInfo:", v26);

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v94, "isEqual:", v10))
  {

    goto LABEL_7;
  }
  v28 = objc_msgSend(v94, "count") == 0;

  if (v28)
    goto LABEL_9;
  v106 = 0;
  v107 = 0;
  v108 = 0;
  std::vector<OBCData>::reserve(&v106, objc_msgSend(v6, "count"));
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndex:", i);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (ACAMSerialization::Deserialization::setOBCDataFromDictionary((uint64_t)v100, v30))
    {
      v31 = v107;
      if (v107 >= v108)
      {
        v33 = (v107 - (_BYTE *)v106) >> 4;
        v34 = v33 + 1;
        if ((unint64_t)(v33 + 1) >> 60)
          std::vector<OBCData>::__throw_length_error[abi:ne180100]();
        v35 = v108 - (_BYTE *)v106;
        if ((v108 - (_BYTE *)v106) >> 3 > v34)
          v34 = v35 >> 3;
        if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
          v36 = 0xFFFFFFFFFFFFFFFLL;
        else
          v36 = v34;
        if (v36)
          v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<OBCData>>((uint64_t)&v108, v36);
        else
          v37 = 0;
        v38 = &v37[16 * v33];
        *(_OWORD *)v38 = *(_OWORD *)v100;
        v40 = (char *)v106;
        v39 = v107;
        v41 = v38;
        if (v107 != v106)
        {
          do
          {
            *((_OWORD *)v41 - 1) = *((_OWORD *)v39 - 1);
            v41 -= 16;
            v39 -= 16;
          }
          while (v39 != v40);
          v39 = (char *)v106;
        }
        v32 = v38 + 16;
        v106 = v41;
        v107 = v38 + 16;
        v108 = &v37[16 * v36];
        if (v39)
          operator delete(v39);
      }
      else
      {
        *(_OWORD *)v107 = *(_OWORD *)v100;
        v32 = v31 + 16;
      }
      v107 = v32;
    }

  }
  *(_QWORD *)&v110 = v106;
  *((_QWORD *)&v110 + 1) = (v107 - (_BYTE *)v106) >> 4;
  __p = 0;
  v104 = 0;
  v105 = 0;
  std::vector<SBCData>::reserve(&__p, objc_msgSend(v5, "count"));
  for (j = 0; j < objc_msgSend(v5, "count"); ++j)
  {
    objc_msgSend(v5, "objectAtIndex:", j);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (ACAMSerialization::Deserialization::setSBCDataFromDictionary((uint64_t)v100, v43))
    {
      v44 = v104;
      if (v104 >= (_QWORD *)v105)
      {
        v48 = __p;
        v49 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v104 - (_BYTE *)__p) >> 3);
        v50 = v49 + 1;
        if (v49 + 1 > 0x666666666666666)
          std::vector<OBCData>::__throw_length_error[abi:ne180100]();
        if (0x999999999999999ALL * ((v105 - (_BYTE *)__p) >> 3) > v50)
          v50 = 0x999999999999999ALL * ((v105 - (_BYTE *)__p) >> 3);
        if (0xCCCCCCCCCCCCCCCDLL * ((v105 - (_BYTE *)__p) >> 3) >= 0x333333333333333)
          v51 = 0x666666666666666;
        else
          v51 = v50;
        if (v51)
        {
          v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>((uint64_t)&v105, v51);
          v48 = __p;
          v44 = v104;
        }
        else
        {
          v52 = 0;
        }
        v53 = &v52[40 * v49];
        v54 = *(_OWORD *)v100;
        v55 = v101;
        *((_QWORD *)v53 + 4) = v102;
        *(_OWORD *)v53 = v54;
        *((_OWORD *)v53 + 1) = v55;
        if (v44 == v48)
        {
          v59 = &v52[40 * v49];
        }
        else
        {
          v56 = &v52[40 * v49];
          do
          {
            v57 = *(_OWORD *)((char *)v44 - 40);
            v58 = *(_OWORD *)((char *)v44 - 24);
            v59 = v56 - 40;
            *((_QWORD *)v56 - 1) = *((_QWORD *)v44 - 1);
            *(_OWORD *)(v56 - 24) = v58;
            *(_OWORD *)(v56 - 40) = v57;
            v44 = (_OWORD *)((char *)v44 - 40);
            v56 -= 40;
          }
          while (v44 != v48);
        }
        v47 = v53 + 40;
        __p = v59;
        v104 = v53 + 40;
        v105 = &v52[40 * v51];
        if (v48)
          operator delete(v48);
      }
      else
      {
        v45 = *(_OWORD *)v100;
        v46 = v101;
        v104[4] = v102;
        *v44 = v45;
        v44[1] = v46;
        v47 = (_QWORD *)v44 + 5;
      }
      v104 = v47;
    }

  }
  *(_QWORD *)&v109 = __p;
  *((_QWORD *)&v109 + 1) = 0xCCCCCCCCCCCCCCCDLL * (((char *)v104 - (_BYTE *)__p) >> 3);
  objc_msgSend(v94, "objectAtIndexedSubscript:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  ACAMSerialization::Deserialization::setDailyDataFromDictionary((double *)&v111, (NSString *)v7, v60);

  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("Performing BDC-based initialization."));
  -[OnDeviceACAM runTimeOptions](self, "runTimeOptions");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("SaveDebugInfo"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v63)
  {
    v100[0] = 0;
    v100[1] = 0;
    *(_QWORD *)&v101 = 0;
    v64 = -[OnDeviceACAM model](self, "model");
    v98[0] = v109;
    v98[1] = v110;
    v98[2] = v111;
    v99 = v112;
    ACAM::init((uint64_t)v64, (double *)v98, (uint64_t *)v100);
    v65 = v100[0];
    saveSnapshotIntoDebugBuffer(self, v100[0], CFSTR("BDC-based initialization result: After daily data-based fallback initialization"));
    v66 = (ACAMPersistentStates *)*((_QWORD *)v65 + 100);
    if (v66)
    {
      v67 = 1;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BDC-based initialization result: intermediate state #%lu"), v67);
        v68 = (NSString *)objc_claimAutoreleasedReturnValue();
        saveSnapshotIntoDebugBuffer(self, v66, v68);

        ++v67;
        v66 = (ACAMPersistentStates *)*((_QWORD *)v66 + 100);
      }
      while (v66);
    }
    simpleList<ACAMPersistentStates>::clear(v100);
  }
  else
  {
    v69 = -[OnDeviceACAM model](self, "model");
    v96[0] = v109;
    v96[1] = v110;
    v96[2] = v111;
    v97 = v112;
    ACAM::init((uint64_t)v69, (double *)v96, 0);
  }
  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("BDC-based initialization complete."));
  v70 = -[OnDeviceACAM model](self, "model");
  v71 = -[OnDeviceACAM model](self, "model");
  ACAMSerialization::Serialization::createBDCDailyFromACAM(v70, v72, v71[3528], v73, v74);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -1.0;
  v76 = -1.0;
  v77 = -1.0;
  v78 = (char *)v104 - (_BYTE *)__p;
  if (v104 != __p)
  {
    v76 = *((double *)__p + 4);
    v77 = *((double *)v104 - 1);
  }
  v79 = -1.0;
  v80 = v107 - (_BYTE *)v106;
  if (v107 != v106)
  {
    v75 = *((double *)v106 + 1);
    v79 = *((double *)v107 - 1);
  }
  v119[0] = CFSTR("bdcDailyData");
  objc_msgSend(v94, "objectAtIndexedSubscript:", 0);
  v120 = objc_claimAutoreleasedReturnValue();
  v119[1] = CFSTR("numSbcDataUsed");
  v88 = (void *)v120;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0xCCCCCCCCCCCCCCCDLL * (v78 >> 3));
  v121 = objc_claimAutoreleasedReturnValue();
  v119[2] = CFSTR("sbcInterval");
  v91 = (void *)v121;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v76);
  v118[0] = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v118[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v77);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v89;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v87;
  v119[3] = CFSTR("numObcDataUsed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v80 >> 4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v81;
  v119[4] = CFSTR("obcInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v75);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v82;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v79);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v83;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v84;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, v119, 5);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v116[0] = v92;
  v115[0] = CFSTR("postFreshInitSnapshot");
  v115[1] = CFSTR("freshInitReason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(-[OnDeviceACAM model](self, "model") + 28972));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = CFSTR("bdcInitInfo");
  v116[1] = v85;
  v116[2] = v93;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[OnDeviceACAM setFreshInitInfo:](self, "setFreshInitInfo:", v86);

  if (__p)
  {
    v104 = __p;
    operator delete(__p);
  }
  if (v106)
  {
    v107 = (char *)v106;
    operator delete(v106);
  }
LABEL_12:

  return 0;
}

- (id)init:(id)a3
{
  void *v3;
  id v4;
  OnDeviceACAM *v5;
  os_log_t v6;
  OS_os_log *logger;
  NSString *name;
  uint64_t v9;
  NSString *version;
  NSString *algoDescription;
  uint64_t v12;
  NSNumber *runPeriod;
  OnDeviceACAMUtility *v14;
  uint64_t v15;
  NSDictionary *runTimeOptions;
  uint64_t v17;
  NSMutableArray *debugLogBuffer;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *v23;
  uint64_t v24;
  NSMutableDictionary *lastBDCOutputTimestamp;
  void *v26;
  _BOOL4 v27;
  void *freshInitInfo;
  uint64_t v29;
  NSDictionary *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *runningInfo;
  uint64_t v35;
  NSMutableArray *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSDictionary *bdcOutputBuffer;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  ACAMPersistentStates *v66;
  const NSDictionary *v67;
  uint64_t v68;
  uint64_t v69;
  const NSDictionary *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  OnDeviceACAM *v76;
  void *v78;
  id v79;
  void *v80;
  NSDictionary *v81;
  void *v82;
  BOOL v83;
  _BYTE v84[8];
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *__p;
  uint64_t v89;
  uint64_t v90;
  std::string v91;
  std::string __dst;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  std::string v96;
  objc_super v97;
  _QWORD v98[21];
  _QWORD v99[21];
  _QWORD v100[25];
  _QWORD v101[25];
  _QWORD v102[32];
  _QWORD v103[32];
  _QWORD v104[37];
  _QWORD v105[37];
  _QWORD v106[48];
  _QWORD v107[48];
  _QWORD v108[31];
  _QWORD v109[31];
  _QWORD v110[42];
  _QWORD v111[42];
  _QWORD v112[26];
  _QWORD v113[26];
  _QWORD v114[8];
  _QWORD v115[8];
  _QWORD v116[3];
  _QWORD v117[6];

  v3 = (void *)((uint64_t (*)(OnDeviceACAM *, SEL))MEMORY[0x24BDAC7A8])(self, a2);
  v117[3] = *MEMORY[0x24BDAC8D0];
  v79 = v4;
  objc_msgSend(v79, "objectForKey:", CFSTR("smcData"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "objectForKey:", CFSTR("systemState"));
  v81 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "objectForKey:", CFSTR("savedAlgoState"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v97.receiver = v3;
  v97.super_class = (Class)OnDeviceACAM;
  v5 = -[OnDeviceACAM init](&v97, sel_init);
  v6 = os_log_create("com.apple.batteryalgorithms", "OnDeviceACAM");
  logger = v5->_logger;
  v5->_logger = (OS_os_log *)v6;

  -[OnDeviceACAM multiLog:](v5, "multiLog:", CFSTR("OnDeviceACAM: %@"), v80);
  name = v5->_name;
  v5->_name = (NSString *)CFSTR("OnDeviceACAM");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 1);
  v9 = objc_claimAutoreleasedReturnValue();
  version = v5->_version;
  v5->_version = (NSString *)v9;

  algoDescription = v5->_algoDescription;
  v5->_algoDescription = (NSString *)CFSTR("Physics-based battery aging model for on-device battery chemistry state.");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 86400);
  v12 = objc_claimAutoreleasedReturnValue();
  runPeriod = v5->_runPeriod;
  v5->_runPeriod = (NSNumber *)v12;

  OnDeviceACAMUtility::createRuntimeOptions(v14);
  v15 = objc_claimAutoreleasedReturnValue();
  runTimeOptions = v5->_runTimeOptions;
  v5->_runTimeOptions = (NSDictionary *)v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = objc_claimAutoreleasedReturnValue();
  debugLogBuffer = v5->_debugLogBuffer;
  v5->_debugLogBuffer = (NSMutableArray *)v17;

  objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMInterface"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    lastBDCOutputTimestamp = v5->_lastBDCOutputTimestamp;
    v5->_lastBDCOutputTimestamp = (NSMutableDictionary *)v24;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_lastBDCOutputTimestamp, "setObject:forKeyedSubscript:", &unk_250871E00, CFSTR("SBC"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_lastBDCOutputTimestamp, "setObject:forKeyedSubscript:", &unk_250871E00, CFSTR("Daily"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_lastBDCOutputTimestamp, "setObject:forKeyedSubscript:", &unk_250871E00, CFSTR("Weekly"));
  }
  else
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMInterface"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "mutableCopy");
    v23 = v5->_lastBDCOutputTimestamp;
    v5->_lastBDCOutputTimestamp = (NSMutableDictionary *)v22;

  }
  objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMFreshInitInfo"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (v27)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    freshInitInfo = v5->_freshInitInfo;
    v5->_freshInitInfo = (NSDictionary *)v31;
  }
  else
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMFreshInitInfo"));
    freshInitInfo = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(freshInitInfo, "copy");
    v30 = v5->_freshInitInfo;
    v5->_freshInitInfo = (NSDictionary *)v29;

  }
  objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMRunningInfo"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 == 0;

  if (v33)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v37 = objc_claimAutoreleasedReturnValue();
    runningInfo = v5->_runningInfo;
    v5->_runningInfo = (NSMutableArray *)v37;
  }
  else
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMRunningInfo"));
    runningInfo = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(runningInfo, "mutableCopy");
    v36 = v5->_runningInfo;
    v5->_runningInfo = (NSMutableArray *)v35;

  }
  v116[0] = CFSTR("SBC");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v38;
  v116[1] = CFSTR("Daily");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v39;
  v116[2] = CFSTR("Weekly");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 3);
  v41 = objc_claimAutoreleasedReturnValue();
  bdcOutputBuffer = v5->_bdcOutputBuffer;
  v5->_bdcOutputBuffer = (NSDictionary *)v41;

  std::string::basic_string[abi:ne180100]<0>(&v96, "Default");
  v114[0] = CFSTR("D37");
  v112[0] = &unk_250870290;
  v113[0] = CFSTR("D37ATL");
  v112[1] = &unk_2508702A8;
  v113[1] = CFSTR("D37ATL");
  v112[2] = &unk_2508702C0;
  v113[2] = CFSTR("D37ATL");
  v112[3] = &unk_2508702D8;
  v113[3] = CFSTR("D37ATL");
  v112[4] = &unk_2508702F0;
  v113[4] = CFSTR("D37ATL");
  v112[5] = &unk_250870308;
  v113[5] = CFSTR("D37ATL");
  v112[6] = &unk_250870320;
  v113[6] = CFSTR("D37ATL");
  v112[7] = &unk_250870338;
  v113[7] = CFSTR("D37ATL");
  v112[8] = &unk_250870350;
  v113[8] = CFSTR("D37ATL");
  v112[9] = &unk_250870368;
  v113[9] = CFSTR("D37ATL");
  v112[10] = &unk_250870380;
  v113[10] = CFSTR("D37ATL");
  v112[11] = &unk_250870398;
  v113[11] = CFSTR("D37LGC");
  v112[12] = &unk_2508703B0;
  v113[12] = CFSTR("D37LGC");
  v112[13] = &unk_2508703C8;
  v113[13] = CFSTR("D37LGC");
  v112[14] = &unk_2508703E0;
  v113[14] = CFSTR("D37LGC");
  v112[15] = &unk_2508703F8;
  v113[15] = CFSTR("D37LGC");
  v112[16] = &unk_250870410;
  v113[16] = CFSTR("D37LGC");
  v112[17] = &unk_250870428;
  v113[17] = CFSTR("D37LGC");
  v112[18] = &unk_250870440;
  v113[18] = CFSTR("D37LGC");
  v112[19] = &unk_250870458;
  v113[19] = CFSTR("D37LGC");
  v112[20] = &unk_250870470;
  v113[20] = CFSTR("D37LGC");
  v112[21] = &unk_250870488;
  v113[21] = CFSTR("D37LGC");
  v112[22] = &unk_2508704A0;
  v113[22] = CFSTR("D37LGC");
  v112[23] = &unk_2508704B8;
  v113[23] = CFSTR("D37LGC");
  v112[24] = &unk_2508704D0;
  v113[24] = CFSTR("D37LGC");
  v112[25] = &unk_2508704E8;
  v113[25] = CFSTR("D37LGC");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 26);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v78;
  v114[1] = CFSTR("D38");
  v110[0] = &unk_250870500;
  v111[0] = CFSTR("D38ATL");
  v110[1] = &unk_250870518;
  v111[1] = CFSTR("D38ATL");
  v110[2] = &unk_250870530;
  v111[2] = CFSTR("D38ATL");
  v110[3] = &unk_250870548;
  v111[3] = CFSTR("D38ATL");
  v110[4] = &unk_250870560;
  v111[4] = CFSTR("D38ATL");
  v110[5] = &unk_250870578;
  v111[5] = CFSTR("D38ATL");
  v110[6] = &unk_250870590;
  v111[6] = CFSTR("D38ATL");
  v110[7] = &unk_2508705A8;
  v111[7] = CFSTR("D38ATL");
  v110[8] = &unk_2508705C0;
  v111[8] = CFSTR("D38ATL");
  v110[9] = &unk_2508705D8;
  v111[9] = CFSTR("D38ATL");
  v110[10] = &unk_2508705F0;
  v111[10] = CFSTR("D38ATL");
  v110[11] = &unk_250870608;
  v111[11] = CFSTR("D38ATL");
  v110[12] = &unk_250870620;
  v111[12] = CFSTR("D38ATL");
  v110[13] = &unk_250870638;
  v111[13] = CFSTR("D38ATL");
  v110[14] = &unk_250870650;
  v111[14] = CFSTR("D38ATL");
  v110[15] = &unk_250870668;
  v111[15] = CFSTR("D38ATL");
  v110[16] = &unk_250870680;
  v111[16] = CFSTR("D38ATL");
  v110[17] = &unk_250870698;
  v111[17] = CFSTR("D38ATL");
  v110[18] = &unk_2508706B0;
  v111[18] = CFSTR("D38ATL");
  v110[19] = &unk_2508706C8;
  v111[19] = CFSTR("D38ATL");
  v110[20] = &unk_2508706E0;
  v111[20] = CFSTR("D38ATL");
  v110[21] = &unk_2508706F8;
  v111[21] = CFSTR("D38ATL");
  v110[22] = &unk_250870710;
  v111[22] = CFSTR("D38ATL");
  v110[23] = &unk_250870728;
  v111[23] = CFSTR("D38ATL");
  v110[24] = &unk_250870740;
  v111[24] = CFSTR("D38LGC");
  v110[25] = &unk_250870758;
  v111[25] = CFSTR("D38LGC");
  v110[26] = &unk_250870770;
  v111[26] = CFSTR("D38LGC");
  v110[27] = &unk_250870788;
  v111[27] = CFSTR("D38LGC");
  v110[28] = &unk_2508707A0;
  v111[28] = CFSTR("D38LGC");
  v110[29] = &unk_2508707B8;
  v111[29] = CFSTR("D38LGC");
  v110[30] = &unk_2508707D0;
  v111[30] = CFSTR("D38LGC");
  v110[31] = &unk_2508707E8;
  v111[31] = CFSTR("D38LGC");
  v110[32] = &unk_250870800;
  v111[32] = CFSTR("D38LGC");
  v110[33] = &unk_250870818;
  v111[33] = CFSTR("D38LGC");
  v110[34] = &unk_250870830;
  v111[34] = CFSTR("D38LGC");
  v110[35] = &unk_250870848;
  v111[35] = CFSTR("D38LGC");
  v110[36] = &unk_250870860;
  v111[36] = CFSTR("D38LGC");
  v110[37] = &unk_250870878;
  v111[37] = CFSTR("D38LGC");
  v110[38] = &unk_250870890;
  v111[38] = CFSTR("D38LGC");
  v110[39] = &unk_2508708A8;
  v111[39] = CFSTR("D38LGC");
  v110[40] = &unk_2508708C0;
  v111[40] = CFSTR("D38LGC");
  v110[41] = &unk_2508708D8;
  v111[41] = CFSTR("D38LGC");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, v110, 42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v43;
  v114[2] = CFSTR("D83");
  v108[0] = &unk_2508708F0;
  v109[0] = CFSTR("D83ATL");
  v108[1] = &unk_250870908;
  v109[1] = CFSTR("D83ATL");
  v108[2] = &unk_250870920;
  v109[2] = CFSTR("D83ATL");
  v108[3] = &unk_250870938;
  v109[3] = CFSTR("D83ATL");
  v108[4] = &unk_250870950;
  v109[4] = CFSTR("D83ATL");
  v108[5] = &unk_250870968;
  v109[5] = CFSTR("D83ATL");
  v108[6] = &unk_250870980;
  v109[6] = CFSTR("D83ATL");
  v108[7] = &unk_250870998;
  v109[7] = CFSTR("D83ATL");
  v108[8] = &unk_2508709B0;
  v109[8] = CFSTR("D83ATL");
  v108[9] = &unk_2508709C8;
  v109[9] = CFSTR("D83ATL");
  v108[10] = &unk_2508709E0;
  v109[10] = CFSTR("D83ATL");
  v108[11] = &unk_2508709F8;
  v109[11] = CFSTR("D83ATL");
  v108[12] = &unk_250870A10;
  v109[12] = CFSTR("D83ATL");
  v108[13] = &unk_250870A28;
  v109[13] = CFSTR("D83ATL");
  v108[14] = &unk_250870A40;
  v109[14] = CFSTR("D83ATL");
  v108[15] = &unk_250870A58;
  v109[15] = CFSTR("D83ATL");
  v108[16] = &unk_250870A70;
  v109[16] = CFSTR("D83COS");
  v108[17] = &unk_250870A88;
  v109[17] = CFSTR("D83COS");
  v108[18] = &unk_250870AA0;
  v109[18] = CFSTR("D83COS");
  v108[19] = &unk_250870AB8;
  v109[19] = CFSTR("D83COS");
  v108[20] = &unk_250870AD0;
  v109[20] = CFSTR("D83COS");
  v108[21] = &unk_250870AE8;
  v109[21] = CFSTR("D83COS");
  v108[22] = &unk_250870B00;
  v109[22] = CFSTR("D83COS");
  v108[23] = &unk_250870B18;
  v109[23] = CFSTR("D83COS");
  v108[24] = &unk_250870B30;
  v109[24] = CFSTR("D83COS");
  v108[25] = &unk_250870B48;
  v109[25] = CFSTR("D83COS");
  v108[26] = &unk_250870B60;
  v109[26] = CFSTR("D83COS");
  v108[27] = &unk_250870B78;
  v109[27] = CFSTR("D83COS");
  v108[28] = &unk_250870B90;
  v109[28] = CFSTR("D83COS");
  v108[29] = &unk_250870BA8;
  v109[29] = CFSTR("D83COS");
  v108[30] = &unk_250870BC0;
  v109[30] = CFSTR("D83COS");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 31);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v44;
  v114[3] = CFSTR("D84");
  v106[0] = &unk_250870BD8;
  v107[0] = CFSTR("D84ATL");
  v106[1] = &unk_250870BF0;
  v107[1] = CFSTR("D84ATL");
  v106[2] = &unk_250870C08;
  v107[2] = CFSTR("D84ATL");
  v106[3] = &unk_250870C20;
  v107[3] = CFSTR("D84ATL");
  v106[4] = &unk_250870C38;
  v107[4] = CFSTR("D84ATL");
  v106[5] = &unk_250870C50;
  v107[5] = CFSTR("D84ATL");
  v106[6] = &unk_250870C68;
  v107[6] = CFSTR("D84ATL");
  v106[7] = &unk_250870C80;
  v107[7] = CFSTR("D84ATL");
  v106[8] = &unk_250870C98;
  v107[8] = CFSTR("D84ATL");
  v106[9] = &unk_250870CB0;
  v107[9] = CFSTR("D84ATL");
  v106[10] = &unk_250870CC8;
  v107[10] = CFSTR("D84ATL");
  v106[11] = &unk_250870CE0;
  v107[11] = CFSTR("D84ATL");
  v106[12] = &unk_250870CF8;
  v107[12] = CFSTR("D84ATL");
  v106[13] = &unk_250870D10;
  v107[13] = CFSTR("D84ATL");
  v106[14] = &unk_250870D28;
  v107[14] = CFSTR("D84ATL");
  v106[15] = &unk_250870D40;
  v107[15] = CFSTR("D84ATL");
  v106[16] = &unk_250870D58;
  v107[16] = CFSTR("D84ATL");
  v106[17] = &unk_250870D70;
  v107[17] = CFSTR("D84ATL");
  v106[18] = &unk_250870D88;
  v107[18] = CFSTR("D84ATL");
  v106[19] = &unk_250870DA0;
  v107[19] = CFSTR("D84ATL");
  v106[20] = &unk_250870DB8;
  v107[20] = CFSTR("D84ATL");
  v106[21] = &unk_250870DD0;
  v107[21] = CFSTR("D84ATL");
  v106[22] = &unk_250870DE8;
  v107[22] = CFSTR("D84ATL");
  v106[23] = &unk_250870E00;
  v107[23] = CFSTR("D84ATL");
  v106[24] = &unk_250870E18;
  v107[24] = CFSTR("D84LGC");
  v106[25] = &unk_250870E30;
  v107[25] = CFSTR("D84LGC");
  v106[26] = &unk_250870E48;
  v107[26] = CFSTR("D84LGC");
  v106[27] = &unk_250870E60;
  v107[27] = CFSTR("D84LGC");
  v106[28] = &unk_250870E78;
  v107[28] = CFSTR("D84LGC");
  v106[29] = &unk_250870E90;
  v107[29] = CFSTR("D84LGC");
  v106[30] = &unk_250870EA8;
  v107[30] = CFSTR("D84LGC");
  v106[31] = &unk_250870EC0;
  v107[31] = CFSTR("D84LGC");
  v106[32] = &unk_250870ED8;
  v107[32] = CFSTR("D84LGC");
  v106[33] = &unk_250870EF0;
  v107[33] = CFSTR("D84LGC");
  v106[34] = &unk_250870F08;
  v107[34] = CFSTR("D84LGC");
  v106[35] = &unk_250870F20;
  v107[35] = CFSTR("D84LGC");
  v106[36] = &unk_250870F38;
  v107[36] = CFSTR("D84LGC");
  v106[37] = &unk_250870F50;
  v107[37] = CFSTR("D84LGC");
  v106[38] = &unk_250870F68;
  v107[38] = CFSTR("D84LGC");
  v106[39] = &unk_250870F80;
  v107[39] = CFSTR("D84LGC");
  v106[40] = &unk_250870F98;
  v107[40] = CFSTR("D84LGC");
  v106[41] = &unk_250870FB0;
  v107[41] = CFSTR("D84LGC");
  v106[42] = &unk_250870FC8;
  v107[42] = CFSTR("D84LGC");
  v106[43] = &unk_250870FE0;
  v107[43] = CFSTR("D84LGC");
  v106[44] = &unk_250870FF8;
  v107[44] = CFSTR("D84LGC");
  v106[45] = &unk_250871010;
  v107[45] = CFSTR("D84LGC");
  v106[46] = &unk_250871028;
  v107[46] = CFSTR("D84LGC");
  v106[47] = &unk_250871040;
  v107[47] = CFSTR("D84LGC");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v107, v106, 48);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v45;
  v114[4] = CFSTR("D47");
  v104[0] = &unk_250871058;
  v105[0] = CFSTR("D47ATL");
  v104[1] = &unk_250871070;
  v105[1] = CFSTR("D47ATL");
  v104[2] = &unk_250871088;
  v105[2] = CFSTR("D47ATL");
  v104[3] = &unk_2508710A0;
  v105[3] = CFSTR("D47ATL");
  v104[4] = &unk_2508710B8;
  v105[4] = CFSTR("D47ATL");
  v104[5] = &unk_2508710D0;
  v105[5] = CFSTR("D47ATL");
  v104[6] = &unk_2508710E8;
  v105[6] = CFSTR("D47ATL");
  v104[7] = &unk_250871100;
  v105[7] = CFSTR("D47ATL");
  v104[8] = &unk_250871118;
  v105[8] = CFSTR("D47ATL");
  v104[9] = &unk_250871130;
  v105[9] = CFSTR("D47ATL");
  v104[10] = &unk_250871148;
  v105[10] = CFSTR("D47ATL");
  v104[11] = &unk_250871160;
  v105[11] = CFSTR("D47ATL");
  v104[12] = &unk_250871178;
  v105[12] = CFSTR("D47ATL");
  v104[13] = &unk_250871190;
  v105[13] = CFSTR("D47ATL");
  v104[14] = &unk_2508711A8;
  v105[14] = CFSTR("D47ATL");
  v104[15] = &unk_2508711C0;
  v105[15] = CFSTR("D47ATL");
  v104[16] = &unk_2508711D8;
  v105[16] = CFSTR("D47ATL");
  v104[17] = &unk_2508711F0;
  v105[17] = CFSTR("D47ATL");
  v104[18] = &unk_250871208;
  v105[18] = CFSTR("D47COS");
  v104[19] = &unk_250871220;
  v105[19] = CFSTR("D47COS");
  v104[20] = &unk_250871238;
  v105[20] = CFSTR("D47COS");
  v104[21] = &unk_250871250;
  v105[21] = CFSTR("D47COS");
  v104[22] = &unk_250871268;
  v105[22] = CFSTR("D47COS");
  v104[23] = &unk_250871280;
  v105[23] = CFSTR("D47COS");
  v104[24] = &unk_250871298;
  v105[24] = CFSTR("D47COS");
  v104[25] = &unk_2508712B0;
  v105[25] = CFSTR("D47COS");
  v104[26] = &unk_2508712C8;
  v105[26] = CFSTR("D47COS");
  v104[27] = &unk_2508712E0;
  v105[27] = CFSTR("D47COS");
  v104[28] = &unk_2508712F8;
  v105[28] = CFSTR("D47COS");
  v104[29] = &unk_250871310;
  v105[29] = CFSTR("D47COS");
  v104[30] = &unk_250871328;
  v105[30] = CFSTR("D47COS");
  v104[31] = &unk_250871340;
  v105[31] = CFSTR("D47COS");
  v104[32] = &unk_250871358;
  v105[32] = CFSTR("D47COS");
  v104[33] = &unk_250871370;
  v105[33] = CFSTR("D47COS");
  v104[34] = &unk_250871388;
  v105[34] = CFSTR("D47COS");
  v104[35] = &unk_2508713A0;
  v105[35] = CFSTR("D47COS");
  v104[36] = &unk_2508713B8;
  v105[36] = CFSTR("D47COS");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 37);
  v46 = objc_claimAutoreleasedReturnValue();
  v115[4] = v46;
  v114[5] = CFSTR("D48");
  v102[0] = &unk_2508713D0;
  v103[0] = CFSTR("D48ATL");
  v102[1] = &unk_2508713E8;
  v103[1] = CFSTR("D48ATL");
  v102[2] = &unk_250871400;
  v103[2] = CFSTR("D48ATL");
  v102[3] = &unk_250871418;
  v103[3] = CFSTR("D48ATL");
  v102[4] = &unk_250871430;
  v103[4] = CFSTR("D48ATL");
  v102[5] = &unk_250871448;
  v103[5] = CFSTR("D48ATL");
  v102[6] = &unk_250871460;
  v103[6] = CFSTR("D48ATL");
  v102[7] = &unk_250871478;
  v103[7] = CFSTR("D48ATL");
  v102[8] = &unk_250871490;
  v103[8] = CFSTR("D48ATL");
  v102[9] = &unk_2508714A8;
  v103[9] = CFSTR("D48ATL");
  v102[10] = &unk_2508714C0;
  v103[10] = CFSTR("D48ATL");
  v102[11] = &unk_2508714D8;
  v103[11] = CFSTR("D48ATL");
  v102[12] = &unk_2508714F0;
  v103[12] = CFSTR("D48ATL");
  v102[13] = &unk_250871508;
  v103[13] = CFSTR("D48ATL");
  v102[14] = &unk_250871520;
  v103[14] = CFSTR("D48LGC");
  v102[15] = &unk_250871538;
  v103[15] = CFSTR("D48LGC");
  v102[16] = &unk_250871550;
  v103[16] = CFSTR("D48LGC");
  v102[17] = &unk_250871568;
  v103[17] = CFSTR("D48LGC");
  v102[18] = &unk_250871580;
  v103[18] = CFSTR("D48LGC");
  v102[19] = &unk_250871598;
  v103[19] = CFSTR("D48LGC");
  v102[20] = &unk_2508715B0;
  v103[20] = CFSTR("D48LGC");
  v102[21] = &unk_2508715C8;
  v103[21] = CFSTR("D48LGC");
  v102[22] = &unk_2508715E0;
  v103[22] = CFSTR("D48LGC");
  v102[23] = &unk_2508715F8;
  v103[23] = CFSTR("D48LGC");
  v102[24] = &unk_250871610;
  v103[24] = CFSTR("D48LGC");
  v102[25] = &unk_250871628;
  v103[25] = CFSTR("D48LGC");
  v102[26] = &unk_250871640;
  v103[26] = CFSTR("D48LGC");
  v102[27] = &unk_250871658;
  v103[27] = CFSTR("D48LGC");
  v102[28] = &unk_250871670;
  v103[28] = CFSTR("D48LGC");
  v102[29] = &unk_250871688;
  v103[29] = CFSTR("D48LGC");
  v102[30] = &unk_2508716A0;
  v103[30] = CFSTR("D48LGC");
  v102[31] = &unk_2508716B8;
  v103[31] = CFSTR("D48LGC");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v103, v102, 32);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v47;
  v114[6] = CFSTR("D93");
  v101[0] = CFSTR("D93ATL");
  v100[0] = &unk_2508716D0;
  v100[1] = &unk_2508716E8;
  v101[1] = CFSTR("D93ATL");
  v101[2] = CFSTR("D93ATL");
  v100[2] = &unk_250871700;
  v100[3] = &unk_250871718;
  v101[3] = CFSTR("D93ATL");
  v101[4] = CFSTR("D93ATL");
  v100[4] = &unk_250871730;
  v100[5] = &unk_250871748;
  v101[5] = CFSTR("D93ATL");
  v101[6] = CFSTR("D93ATL");
  v100[6] = &unk_250871760;
  v100[7] = &unk_250871778;
  v101[7] = CFSTR("D93ATL");
  v101[8] = CFSTR("D93ATL");
  v100[8] = &unk_250871790;
  v100[9] = &unk_2508717A8;
  v101[9] = CFSTR("D93ATL");
  v101[10] = CFSTR("D93ATL");
  v100[10] = &unk_2508717C0;
  v100[11] = &unk_2508717D8;
  v101[11] = CFSTR("D93ATL");
  v101[12] = CFSTR("D93ATL");
  v100[12] = &unk_2508717F0;
  v100[13] = &unk_250871808;
  v101[13] = CFSTR("D93ATL");
  v101[14] = CFSTR("D93ATL");
  v100[14] = &unk_250871820;
  v100[15] = &unk_250871838;
  v101[15] = CFSTR("D93ATL");
  v101[16] = CFSTR("D93ATL");
  v100[16] = &unk_250871850;
  v100[17] = &unk_250871868;
  v101[17] = CFSTR("D93ATL");
  v100[18] = &unk_250871880;
  v101[18] = CFSTR("D93ATL");
  v100[19] = &unk_250871898;
  v101[19] = CFSTR("D93ATL");
  v100[20] = &unk_2508718B0;
  v101[20] = CFSTR("D93ATL");
  v100[21] = &unk_2508718C8;
  v101[21] = CFSTR("D93ATL");
  v100[22] = &unk_2508718E0;
  v101[22] = CFSTR("D93ATL");
  v100[23] = &unk_2508718F8;
  v101[23] = CFSTR("D93ATL");
  v100[24] = &unk_250871910;
  v101[24] = CFSTR("D93ATL");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v101, v100, 25);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v48;
  v114[7] = CFSTR("D94");
  v98[0] = &unk_250871928;
  v98[1] = &unk_250871940;
  v99[1] = CFSTR("D94ATL");
  v99[2] = CFSTR("D94ATL");
  v98[2] = &unk_250871958;
  v98[3] = &unk_250871970;
  v99[3] = CFSTR("D94ATL");
  v99[4] = CFSTR("D94ATL");
  v98[4] = &unk_250871988;
  v98[5] = &unk_2508719A0;
  v99[5] = CFSTR("D94ATL");
  v99[6] = CFSTR("D94ATL");
  v98[6] = &unk_2508719B8;
  v98[7] = &unk_2508719D0;
  v99[7] = CFSTR("D94ATL");
  v99[8] = CFSTR("D94ATL");
  v98[8] = &unk_2508719E8;
  v98[9] = &unk_250871A00;
  v99[9] = CFSTR("D94LGC");
  v99[10] = CFSTR("D94LGC");
  v98[10] = &unk_250871A18;
  v98[11] = &unk_250871A30;
  v99[11] = CFSTR("D94LGC");
  v99[12] = CFSTR("D94LGC");
  v98[12] = &unk_250871A48;
  v98[13] = &unk_250871A60;
  v99[13] = CFSTR("D94LGC");
  v99[14] = CFSTR("D94LGC");
  v98[14] = &unk_250871A78;
  v98[15] = &unk_250871A90;
  v98[16] = &unk_250871AA8;
  v98[17] = &unk_250871AC0;
  v99[15] = CFSTR("D94LGC");
  v99[16] = CFSTR("D94LGC");
  v98[18] = &unk_250871AD8;
  v98[19] = &unk_250871AF0;
  v99[17] = CFSTR("D94LGC");
  v99[18] = CFSTR("D94LGC");
  v98[20] = &unk_250871B08;
  v99[0] = CFSTR("D94ATL");
  v99[19] = CFSTR("D94LGC");
  v99[20] = CFSTR("D94LGC");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 21);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v115[7] = v49;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, v114, 8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", CFSTR("DeviceType"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v46) = v52 == 0;

  if ((v46 & 1) == 0)
  {
    -[NSDictionary objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", CFSTR("DeviceType"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("AlgoChemID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57 == 0;

    if (!v58)
    {
      objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("AlgoChemID"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", v59);
      v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100](&__dst, (void *)objc_msgSend(v60, "UTF8String"), objc_msgSend(v60, "lengthOfBytesUsingEncoding:", 4));

      if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v96.__r_.__value_.__l.__data_);
      v96 = __dst;
      *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 0;
      __dst.__r_.__value_.__s.__data_[0] = 0;

    }
  }
  if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v91, v96.__r_.__value_.__l.__data_, v96.__r_.__value_.__l.__size_);
  else
    v91 = v96;
  ACAMUtility::ACAMParameterPack::ACAMParameterPack((uint64_t)&__dst, (ACAMUtility *)&v91, v53);
  if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v91.__r_.__value_.__l.__data_);
  v61 = operator new();
  ACAM::ACAM(v61, __dst.__r_.__value_.__l.__size_, __dst.__r_.__value_.__r.__words[0], __dst.__r_.__value_.__r.__words[2], v94, v93, &v95);
  -[OnDeviceACAM setModel:](v5, "setModel:", v61);
  v62 = operator new();
  *(_QWORD *)(v62 + 600) = 0;
  *(_QWORD *)(v62 + 696) = 0;
  *(_QWORD *)(v62 + 712) = 0;
  *(_QWORD *)(v62 + 704) = 0;
  *(_QWORD *)(v62 + 680) = 0;
  *(_OWORD *)(v62 + 616) = 0u;
  *(_OWORD *)(v62 + 632) = 0u;
  *(_OWORD *)(v62 + 648) = 0u;
  *(_OWORD *)(v62 + 664) = 0u;
  *(_OWORD *)(v62 + 736) = 0u;
  *(_OWORD *)(v62 + 752) = 0u;
  *(_OWORD *)(v62 + 768) = 0u;
  objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMCoreAlgo"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63
    || (objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMCoreAlgo")),
        v64 = (void *)objc_claimAutoreleasedReturnValue(),
        v65 = objc_msgSend(v64, "count") == 0,
        v64,
        v63,
        v65))
  {
    v5->_freshInitNeeded = 1;
    v68 = *(_QWORD *)(v62 + 760);
    if (v68)
    {
      do
      {
        v69 = *(_QWORD *)(v68 + 40);
        MEMORY[0x23B8057D4]();
        v68 = v69;
      }
      while (v69);
    }
    *(_QWORD *)(v62 + 760) = 0;
    *(_QWORD *)(v62 + 768) = 0;
    *(_QWORD *)(v62 + 776) = 0;
    if (*(char *)(v62 + 759) < 0)
      operator delete(*(void **)(v62 + 736));
    if (*(char *)(v62 + 719) < 0)
      operator delete(*(void **)(v62 + 696));
    MEMORY[0x23B8057D4](v62, 0x1032C40E465C24DLL);
    v62 = 0;
  }
  else
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("kSavedAlgoStateOnDeviceACAMCoreAlgo"));
    v66 = (ACAMPersistentStates *)objc_claimAutoreleasedReturnValue();
    ACAMSerialization::Deserialization::setPersistentStatesFromDictionary((ACAMSerialization::Deserialization *)v62, v66, v67);

    if (*(_QWORD *)(v62 + 728) != 1)
      v5->_freshInitNeeded = 1;
  }
  v85 = 0;
  v86 = 0;
  v87 = 0;
  __p = 0;
  v89 = 0;
  v90 = 0;
  if (-[NSDictionary count](v81, "count"))
    ACAMSerialization::Deserialization::setSystemSignalsFromDictionaries((ACAMSerialization::Deserialization *)v84, (ACAMStatus::SystemSignals *)v80, v81, v70);
  v83 = 0;
  ACAM::preInit((ACAM *)-[OnDeviceACAM model](v5, "model"), (const ACAMPersistentStates *)v62, (const ACAMStatus::SystemSignals *)v84, &v83);
  v5->_freshInitNeeded = v83;
  -[OnDeviceACAM runTimeOptions](v5, "runTimeOptions");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("SaveDebugInfo"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v73)
  {
    -[OnDeviceACAM multiLog:](v5, "multiLog:", CFSTR("preInit done."));
    saveCurrentSnapshotIntoDebugBuffer(v5, CFSTR("preInit result"));
    if (!v5->_freshInitNeeded)
    {
      -[OnDeviceACAM multiLog:](v5, "multiLog:", CFSTR("Soft initiliazation done. Persistent state is loaded. "));
      saveCurrentSnapshotIntoDebugBuffer(v5, CFSTR("Soft initialization result"));
    }
  }
  if (v62)
  {
    v74 = *(_QWORD *)(v62 + 760);
    if (v74)
    {
      do
      {
        v75 = *(_QWORD *)(v74 + 40);
        MEMORY[0x23B8057D4]();
        v74 = v75;
      }
      while (v75);
    }
    *(_QWORD *)(v62 + 760) = 0;
    *(_QWORD *)(v62 + 768) = 0;
    *(_QWORD *)(v62 + 776) = 0;
    if (*(char *)(v62 + 759) < 0)
      operator delete(*(void **)(v62 + 736));
    if (*(char *)(v62 + 719) < 0)
      operator delete(*(void **)(v62 + 696));
    MEMORY[0x23B8057D4](v62, 0x1032C40E465C24DLL);
  }
  v76 = v5;
  if (SHIBYTE(v90) < 0)
    operator delete(__p);
  if (SHIBYTE(v87) < 0)
    operator delete(v85);
  ACAMUtility::ACAMParameterPack::~ACAMParameterPack((ACAMPerformanceModelParameter **)&__dst);

  if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v96.__r_.__value_.__l.__data_);

  return v76;
}

- (void)addToBdcOutputBuffer:(const void *)a3 :(double)a4
{
  unsigned __int8 *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ACAMSerialization::Serialization *v13;
  const ACAM *v14;
  void *v15;
  unsigned __int8 *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ACAMSerialization::Serialization *v22;
  const ACAM *v23;
  uint64_t v24;
  double *v25;
  void *v26;
  unsigned __int8 *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ACAMSerialization::Serialization *v33;
  const ACAM *v34;
  void *v35;
  void *__p[2];
  char v37;

  std::string::basic_string[abi:ne180100]<0>(__p, "SBC");
  v7 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v8 = v7[40];
  if (v37 < 0)
    operator delete(__p[0]);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OnDeviceACAM lastBDCOutputTimestamp](self, "lastBDCOutputTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("SBC"));

    -[OnDeviceACAM bdcOutputBuffer](self, "bdcOutputBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SBC"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[OnDeviceACAM model](self, "model");
    ACAMSerialization::Serialization::createBDCSBCFromACAM(v13, v14, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Daily");
  v16 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v16)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v17 = v16[40];
  if (v37 < 0)
  {
    operator delete(__p[0]);
    if (!v17)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (v16[40])
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OnDeviceACAM lastBDCOutputTimestamp](self, "lastBDCOutputTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("Daily"));

    -[OnDeviceACAM bdcOutputBuffer](self, "bdcOutputBuffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Daily"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[OnDeviceACAM model](self, "model");
    ACAMSerialization::Serialization::createBDCDailyFromACAM(v22, v23, a4, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v26);

    *(_DWORD *)(-[OnDeviceACAM model](self, "model") + 28964) = 0;
  }
LABEL_12:
  std::string::basic_string[abi:ne180100]<0>(__p, "Weekly");
  v27 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v27)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v28 = v27[40];
  if (v37 < 0)
  {
    operator delete(__p[0]);
    if (!v28)
      return;
  }
  else if (!v27[40])
  {
    return;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[OnDeviceACAM lastBDCOutputTimestamp](self, "lastBDCOutputTimestamp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("Weekly"));

  -[OnDeviceACAM bdcOutputBuffer](self, "bdcOutputBuffer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Weekly"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[OnDeviceACAM model](self, "model");
  ACAMSerialization::Serialization::createBDCWeeklyFromACAM(v33, v34, a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v35);

}

- (int)runWithData:(id)a3
{
  uint64_t v4;
  unint64_t i;
  double *v6;
  uint64_t v7;
  double v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  void **v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  double *v30;
  __int128 v31;
  __int128 v32;
  double *v33;
  double *v34;
  double *v35;
  __int128 v36;
  __int128 v37;
  uint64_t j;
  void *v39;
  void *v40;
  double v41;
  double v42;
  uint64_t *v43;
  void *v44;
  int v45;
  std::string::size_type v46;
  uint64_t v47;
  std::string *v48;
  void *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  BOOL v53;
  double v54;
  void *v55;
  double v56;
  unsigned __int8 *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  objc_object *v62;
  void *v63;
  unint64_t v64;
  char *v65;
  unsigned __int8 *v66;
  _QWORD *k;
  unint64_t v68;
  char v69;
  unsigned __int8 *v70;
  _QWORD *v71;
  unint64_t v72;
  char v73;
  unsigned __int8 *v74;
  _QWORD *m;
  unint64_t v76;
  char v77;
  uint64_t n;
  char *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  std::string *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  ACAMPersistentStates *v88;
  NSString *v89;
  ACAMSerialization::Serialization *v90;
  const ACAM *v91;
  uint64_t v92;
  double *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unsigned __int8 *v100;
  void *v101;
  void *v102;
  unsigned __int8 *v103;
  void *v104;
  void *v105;
  unsigned __int8 *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  _BOOL4 v112;
  id v114;
  NSString *v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  void *v119;
  unsigned int v120;
  unsigned int v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  id v127;
  void *v128;
  _OWORD v129[2];
  uint64_t v130;
  void *v131[2];
  __int128 v132;
  double v133;
  _QWORD **v134;
  _QWORD *v135[2];
  void *__p[2];
  char v137;
  void *v138;
  _QWORD *v139;
  uint64_t v140;
  void *v141[2];
  char v142;
  _QWORD v143[2];
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  _OWORD v148[2];
  uint64_t v149;
  void *v150[2];
  char v151;
  _QWORD v152[3];
  _QWORD v153[3];
  _QWORD v154[2];
  _QWORD v155[7];
  _QWORD v156[7];
  _QWORD v157[2];
  _QWORD v158[2];
  std::string v159;
  uint64_t v160;
  _QWORD v161[2];
  _BYTE v162[40];
  uint64_t v163;
  std::string v164[2];
  uint64_t v165;

  v165 = *MEMORY[0x24BDAC8D0];
  v114 = a3;
  objc_msgSend(v114, "objectForKey:", CFSTR("amaStreamData"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "objectForKey:", CFSTR("smcData"));
  v115 = (NSString *)objc_claimAutoreleasedReturnValue();
  ACAMSerialization::Deserialization::setSMCKeyDataFromDictionary((double *)v148, (double *)(-[OnDeviceACAM model](self, "model") + 6912), v115);
  v4 = objc_msgSend(v119, "count");
  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("%lu 1Hz data received "), v4);
  v145 = 0;
  v146 = 0;
  v147 = 0;
  std::string::basic_string[abi:ne180100]<0>(v150, "SBC");
  v131[1] = 0;
  *(_QWORD *)&v132 = 0;
  v131[0] = &v131[1];
  std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>(&v159, (__int128 *)v150, (uint64_t)v131);
  std::string::basic_string[abi:ne180100]<0>(v141, "Daily");
  v139 = 0;
  v140 = 0;
  v138 = &v139;
  std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>((std::string *)v162, (__int128 *)v141, (uint64_t)&v138);
  std::string::basic_string[abi:ne180100]<0>(__p, "Weekly");
  v135[0] = 0;
  v135[1] = 0;
  v134 = v135;
  std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>(v164, (__int128 *)__p, (uint64_t)&v134);
  std::unordered_map<std::string,std::set<unsigned long>>::unordered_map((uint64_t)v143, (unsigned __int8 *)&v159, 3);
  for (i = 0; i != -144; i -= 48)
  {
    std::__tree<unsigned long>::destroy((uint64_t)&v164[i / 0x18 + 1], (_QWORD *)v164[1].__r_.__value_.__r.__words[i / 8 + 1]);
    if (SHIBYTE(v164[0].__r_.__value_.__r.__words[i / 8 + 2]) < 0)
      operator delete(v164[i / 0x18].__r_.__value_.__l.__data_);
  }
  std::__tree<unsigned long>::destroy((uint64_t)&v134, v135[0]);
  if (v137 < 0)
    operator delete(__p[0]);
  std::__tree<unsigned long>::destroy((uint64_t)&v138, v139);
  if (v142 < 0)
    operator delete(v141[0]);
  std::__tree<unsigned long>::destroy((uint64_t)v131, (_QWORD *)v131[1]);
  if (v151 < 0)
    operator delete(v150[0]);
  v6 = -[OnDeviceACAM model](self, "model");
  v116 = v4;
  if (v4)
  {
    v123 = 0;
    v125 = 0;
    v7 = 0;
    v117 = 0;
    v8 = v6[3528];
    v9 = 1;
    v10 = -1.0;
    v11 = -1.0;
    do
    {
      objc_msgSend(v119, "objectAtIndexedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = ACAMSerialization::Deserialization::setSmartBatteryDataFromDictionary((uint64_t)v131, v12);
      if (v133 > v8)
        v14 = v13;
      else
        v14 = 0;
      v120 = v14;
      v121 = v13;
      if ((v14 & 1) != 0)
      {
        if (!v117)
          v11 = v133;
        if (!__CFADD__(v117++, 1))
          v10 = v133;
        v16 = v12;
        if ((v9 & 1) != 0)
        {
          memset(&v159, 0, sizeof(v159));
          std::vector<std::vector<SmartBatteryData>>::push_back[abi:ne180100](&v145, (uint64_t)&v159);
          if (v159.__r_.__value_.__r.__words[0])
          {
            v159.__r_.__value_.__l.__size_ = v159.__r_.__value_.__r.__words[0];
            operator delete(v159.__r_.__value_.__l.__data_);
          }
        }
        v17 = v146;
        v18 = *(_QWORD *)(v146 - 16);
        v19 = *(_QWORD *)(v146 - 8);
        if (v18 >= v19)
        {
          v23 = (void **)(v146 - 24);
          v24 = *(_QWORD *)(v146 - 24);
          v25 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - v24) >> 3);
          v26 = v25 + 1;
          if (v25 + 1 > 0x666666666666666)
            std::vector<OBCData>::__throw_length_error[abi:ne180100]();
          v27 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - v24) >> 3);
          if (2 * v27 > v26)
            v26 = 2 * v27;
          if (v27 >= 0x333333333333333)
            v28 = 0x666666666666666;
          else
            v28 = v26;
          if (v28)
            v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>(v146 - 8, v28);
          else
            v29 = 0;
          v30 = (double *)&v29[40 * v25];
          v31 = *(_OWORD *)v131;
          v32 = v132;
          v30[4] = v133;
          *(_OWORD *)v30 = v31;
          *((_OWORD *)v30 + 1) = v32;
          v34 = *(double **)(v17 - 24);
          v33 = *(double **)(v17 - 16);
          v35 = v30;
          if (v33 != v34)
          {
            do
            {
              v36 = *(_OWORD *)(v33 - 5);
              v37 = *(_OWORD *)(v33 - 3);
              *(v35 - 1) = *(v33 - 1);
              *(_OWORD *)(v35 - 3) = v37;
              *(_OWORD *)(v35 - 5) = v36;
              v35 -= 5;
              v33 -= 5;
            }
            while (v33 != v34);
            v33 = (double *)*v23;
          }
          v22 = (char *)(v30 + 5);
          *(_QWORD *)(v17 - 24) = v35;
          *(_QWORD *)(v17 - 16) = v30 + 5;
          *(_QWORD *)(v17 - 8) = &v29[40 * v28];
          if (v33)
            operator delete(v33);
        }
        else
        {
          v20 = *(_OWORD *)v131;
          v21 = v132;
          *(double *)(v18 + 32) = v133;
          *(_OWORD *)v18 = v20;
          *(_OWORD *)(v18 + 16) = v21;
          v22 = (char *)(v18 + 40);
        }
        *(_QWORD *)(v17 - 16) = v22;
        -[OnDeviceACAM lastBDCOutputTimestamp](self, "lastBDCOutputTimestamp");
        v127 = (id)objc_claimAutoreleasedReturnValue();
        v118 = v119;
        v141[0] = (void *)(-1 - 0x5555555555555555 * ((v146 - v145) >> 3));
        v12 = v16;
        std::string::basic_string[abi:ne180100]<0>(&v159, "SBC");
        v160 = 0x4072C00000000000;
        std::string::basic_string[abi:ne180100]<0>(v161, "Daily");
        *(_QWORD *)&v162[8] = 0x40F5180000000000;
        std::string::basic_string[abi:ne180100]<0>(&v162[16], "Weekly");
        v163 = 0x4122750000000000;
        std::unordered_map<std::string,double>::unordered_map((uint64_t)v150, (unsigned __int8 *)&v159, 3);
        for (j = 0; j != -96; j -= 32)
        {
          if ((char)v162[j + 39] < 0)
            operator delete(*(void **)&v162[j + 16]);
        }
        objc_msgSend(v118, "objectAtIndexedSubscript:", v7);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Timestamp"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "doubleValue");
        v42 = v41;

        v43 = v144;
        if (v144)
        {
          v9 = 0;
          do
          {
            if (*((char *)v43 + 39) < 0)
              std::string::__init_copy_ctor_external(&v159, (const std::string::value_type *)v43[2], v43[3]);
            else
              v159 = *(std::string *)(v43 + 2);
            v44 = (void *)MEMORY[0x24BDD17C8];
            v45 = SHIBYTE(v159.__r_.__value_.__r.__words[2]);
            v46 = v159.__r_.__value_.__r.__words[0];
            v47 = objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding");
            if (v45 >= 0)
              v48 = &v159;
            else
              v48 = (std::string *)v46;
            objc_msgSend(v44, "stringWithCString:encoding:", v48, v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43[7])
            {
              v50 = v43 + 6;
              v51 = (_QWORD *)v43[6];
              v12 = v16;
              if (v51)
              {
                do
                {
                  v52 = v51;
                  v51 = (_QWORD *)v51[1];
                }
                while (v51);
              }
              else
              {
                do
                {
                  v52 = (_QWORD *)v50[2];
                  v53 = *v52 == (_QWORD)v50;
                  v50 = v52;
                }
                while (v53);
              }
              v54 = *(double *)(*(_QWORD *)(v145 + 24 * v52[4] + 8) - 8);
            }
            else
            {
              v12 = v16;
              objc_msgSend(v127, "objectForKeyedSubscript:", v49);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "doubleValue");
              v54 = v56;

            }
            v57 = std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(v150, (unsigned __int8 *)&v159);
            if (!v57)
              std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
            if (v42 - v54 > *((double *)v57 + 5))
            {
              std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)v43 + 5, (unint64_t *)v141, (uint64_t *)v141);
              v9 = 1;
            }

            if (SHIBYTE(v159.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v159.__r_.__value_.__l.__data_);
            v43 = (uint64_t *)*v43;
          }
          while (v43);
        }
        else
        {
          v9 = 0;
        }
        std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table((uint64_t)v150);

      }
      v125 += v121 ^ 1;
      v123 += v121 ^ v120;
      ++v7;
    }
    while (v7 != v116);
  }
  else
  {
    v117 = 0;
    v123 = 0;
    v125 = 0;
    v11 = -1.0;
    v10 = -1.0;
  }
  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("%lu valid 1Hz data found out of %lu.\n- %lu are invalid records\n- %lu have overlapping timestamp with SBC\n- %lu chunks identified\n"), v117, v116, v125, v123, 0xAAAAAAAAAAAAAAABLL * ((v146 - v145) >> 3));
  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("Running OnDeviceACAM"));
  -[OnDeviceACAM runTimeOptions](self, "runTimeOptions");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("SaveDebugInfo"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v60)
  {
    -[OnDeviceACAM debugLogBuffer](self, "debugLogBuffer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)CFSTR("SMC Key for Running OnDeviceACAM"), v115, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v63);

  }
  if (v146 == v145)
    goto LABEL_115;
  v64 = 0;
  v65 = "Daily";
  do
  {
    std::string::basic_string[abi:ne180100]<0>(v131, "SBC");
    v66 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v143, (unsigned __int8 *)v131);
    if (!v66)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    for (k = (_QWORD *)*((_QWORD *)v66 + 6); k; k = (_QWORD *)*k)
    {
      v68 = k[4];
      if (v64 >= v68)
      {
        if (v68 >= v64)
        {
          v69 = 1;
          goto LABEL_83;
        }
        ++k;
      }
    }
    v69 = 0;
LABEL_83:
    std::string::basic_string[abi:ne180100]<0>(&v159, "SBC");
    LOBYTE(v160) = v69;
    std::string::basic_string[abi:ne180100]<0>(v141, v65);
    v70 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v143, (unsigned __int8 *)v141);
    if (!v70)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    v71 = (_QWORD *)*((_QWORD *)v70 + 6);
    if (!v71)
    {
LABEL_89:
      v73 = 0;
      goto LABEL_91;
    }
    while (1)
    {
      v72 = v71[4];
      if (v64 >= v72)
        break;
LABEL_88:
      v71 = (_QWORD *)*v71;
      if (!v71)
        goto LABEL_89;
    }
    if (v72 < v64)
    {
      ++v71;
      goto LABEL_88;
    }
    v73 = 1;
LABEL_91:
    std::string::basic_string[abi:ne180100]<0>(v161, v65);
    v162[8] = v73;
    std::string::basic_string[abi:ne180100]<0>(&v138, "Weekly");
    v74 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v143, (unsigned __int8 *)&v138);
    if (!v74)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    for (m = (_QWORD *)*((_QWORD *)v74 + 6); m; m = (_QWORD *)*m)
    {
      v76 = m[4];
      if (v64 >= v76)
      {
        if (v76 >= v64)
        {
          v77 = 1;
          goto LABEL_99;
        }
        ++m;
      }
    }
    v77 = 0;
LABEL_99:
    std::string::basic_string[abi:ne180100]<0>(&v162[16], "Weekly");
    LOBYTE(v163) = v77;
    std::unordered_map<std::string,BOOL>::unordered_map((uint64_t)v150, (unsigned __int8 *)&v159, 3);
    for (n = 0; n != -96; n -= 32)
    {
      if ((char)v162[n + 39] < 0)
        operator delete(*(void **)&v162[n + 16]);
    }
    if (SHIBYTE(v140) < 0)
      operator delete(v138);
    if (v142 < 0)
      operator delete(v141[0]);
    v79 = v65;
    if (SBYTE7(v132) < 0)
      operator delete(v131[0]);
    memset(&v159, 0, sizeof(v159));
    -[OnDeviceACAM runTimeOptions](self, "runTimeOptions");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("SaveDebugInfo"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "isEqual:", MEMORY[0x24BDBD1C8]);

    v83 = -[OnDeviceACAM model](self, "model");
    if (v82)
      v84 = &v159;
    else
      v84 = 0;
    v85 = (uint64_t *)(v145 + 24 * v64);
    v86 = *v85;
    v87 = 0xCCCCCCCCCCCCCCCDLL * ((v85[1] - *v85) >> 3);
    v129[0] = v148[0];
    v129[1] = v148[1];
    v130 = v149;
    ACAM::runOnce((uint64_t)v83, v86, v87, (uint64_t)v129, (uint64_t *)v84);
    v88 = (ACAMPersistentStates *)v159.__r_.__value_.__r.__words[0];
    if (v159.__r_.__value_.__r.__words[0])
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Running result: intermediate state #%lu"), 1);
        v89 = (NSString *)objc_claimAutoreleasedReturnValue();
        saveSnapshotIntoDebugBuffer(self, v88, v89);

        v88 = (ACAMPersistentStates *)*((_QWORD *)v88 + 100);
      }
      while (v88);
    }
    -[OnDeviceACAM addToBdcOutputBuffer::](self, "addToBdcOutputBuffer::", v150, *(double *)(*(_QWORD *)(v145 + 24 * v64 + 8) - 8));
    simpleList<ACAMPersistentStates>::clear(&v159);
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table((uint64_t)v150);
    ++v64;
    v65 = v79;
  }
  while (v64 < 0xAAAAAAAAAAAAAAABLL * ((v146 - v145) >> 3));
LABEL_115:
  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("Finished"));
  v90 = -[OnDeviceACAM model](self, "model");
  ACAMSerialization::Serialization::createBDCDailyFromACAM(v90, v91, v10, v92, v93);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v158[0] = v115;
  v157[0] = CFSTR("rawSmcKey");
  v157[1] = CFSTR("parsedTeq");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)v148);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v158[1] = v94;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v158, v157, 2);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  v155[0] = CFSTR("validDataCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v117);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v122;
  v155[1] = CFSTR("totalDataCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v116);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v156[1] = v124;
  v155[2] = CFSTR("numSubChunks");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0xAAAAAAAAAAAAAAABLL * ((v146 - v145) >> 3));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v156[2] = v95;
  v155[3] = CFSTR("amaInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v96;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v97;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154, 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v156[3] = v98;
  v155[4] = CFSTR("numBdcTriggers");
  v152[0] = CFSTR("SBC");
  v99 = (void *)MEMORY[0x24BDD16E0];
  std::string::basic_string[abi:ne180100]<0>(&v159, "SBC");
  v100 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v143, (unsigned __int8 *)&v159);
  if (!v100)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  objc_msgSend(v99, "numberWithUnsignedLong:", *((_QWORD *)v100 + 7));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v101;
  v152[1] = CFSTR("Daily");
  v102 = (void *)MEMORY[0x24BDD16E0];
  std::string::basic_string[abi:ne180100]<0>(v150, "Daily");
  v103 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v143, (unsigned __int8 *)v150);
  if (!v103)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  objc_msgSend(v102, "numberWithUnsignedLong:", *((_QWORD *)v103 + 7));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v153[1] = v104;
  v152[2] = CFSTR("Weekly");
  v105 = (void *)MEMORY[0x24BDD16E0];
  std::string::basic_string[abi:ne180100]<0>(v131, "Weekly");
  v106 = std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(v143, (unsigned __int8 *)v131);
  if (!v106)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  objc_msgSend(v105, "numberWithUnsignedLong:", *((_QWORD *)v106 + 7));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v153[2] = v107;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v153, v152, 3);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v156[4] = v108;
  v156[5] = v128;
  v155[5] = CFSTR("smcKeyInputs");
  v155[6] = CFSTR("postRunningSnapshot");
  v156[6] = v126;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v156, v155, 7);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (SBYTE7(v132) < 0)
    operator delete(v131[0]);

  if (v151 < 0)
    operator delete(v150[0]);

  if (SHIBYTE(v159.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v159.__r_.__value_.__l.__data_);

  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("Writing currentRunningInfo"));
  -[OnDeviceACAM runningInfo](self, "runningInfo");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "addObject:", v109);
  while (1)
  {

    -[OnDeviceACAM runningInfo](self, "runningInfo");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (unint64_t)objc_msgSend(v111, "count") > 0xA;

    if (!v112)
      break;
    -[OnDeviceACAM runningInfo](self, "runningInfo");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "removeObjectAtIndex:", 0);
  }
  -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("Finished currentRunningInfo"));

  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::~__hash_table((uint64_t)v143);
  v159.__r_.__value_.__r.__words[0] = (std::string::size_type)&v145;
  std::vector<std::vector<SmartBatteryData>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v159);

  return 0;
}

- (id)output
{
  void *v3;
  void *v4;
  int v5;
  const ACAMPersistentStates *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  void *v10;
  void *v11;
  objc_object *v12;
  void *v13;
  ACAMSerialization::Serialization *v14;
  const ACAM *v15;
  uint64_t v16;
  double *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  void *v31;
  objc_object *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[600];
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 __p;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[5];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  _QWORD v60[7];

  v60[4] = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  v46 = 0;
  v48 = 0;
  v47 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0;
  __p = 0u;
  v50 = 0u;
  v51 = 0u;
  ACAMPersistentStates::retrieve((ACAMPersistentStates *)v39, (const ACAM *)-[OnDeviceACAM model](self, "model"));
  -[OnDeviceACAM runTimeOptions](self, "runTimeOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SaveDebugInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v5)
    -[OnDeviceACAM multiLog:](self, "multiLog:", CFSTR("Persistent state is generated"));
  v59[0] = CFSTR("savedAlgoState");
  v53[0] = CFSTR("kSavedAlgoStateOnDeviceACAMInterface");
  -[OnDeviceACAM lastBDCOutputTimestamp](self, "lastBDCOutputTimestamp");
  v54 = objc_claimAutoreleasedReturnValue();
  v53[1] = CFSTR("kSavedAlgoStateOnDeviceACAMCoreAlgo");
  v34 = (void *)v54;
  ACAMSerialization::Serialization::createDiskStateFromPersistentState((ACAMSerialization::Serialization *)v39, v6);
  v55 = objc_claimAutoreleasedReturnValue();
  v53[2] = CFSTR("kSavedAlgoStateOnDeviceACAMDebugLog");
  v33 = (void *)v55;
  -[OnDeviceACAM debugLogBuffer](self, "debugLogBuffer");
  v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
  deep_copy_object(v32);
  v56 = objc_claimAutoreleasedReturnValue();
  v53[3] = CFSTR("kSavedAlgoStateOnDeviceACAMRunningInfo");
  v31 = (void *)v56;
  -[OnDeviceACAM runningInfo](self, "runningInfo");
  v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
  deep_copy_object(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v8;
  v53[4] = CFSTR("kSavedAlgoStateOnDeviceACAMFreshInitInfo");
  -[OnDeviceACAM freshInitInfo](self, "freshInitInfo");
  v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
  deep_copy_object(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, v53, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v11;
  v59[1] = CFSTR("kBDCOutputData");
  -[OnDeviceACAM bdcOutputBuffer](self, "bdcOutputBuffer");
  v12 = (objc_object *)objc_claimAutoreleasedReturnValue();
  deep_copy_object(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v13;
  v60[2] = MEMORY[0x24BDBD1B8];
  v59[2] = CFSTR("kPowerLogData");
  v59[3] = CFSTR("kCoreAnalyticsData");
  v14 = -[OnDeviceACAM model](self, "model");
  ACAMSerialization::Serialization::createCoreAnalyticsFromACAM(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 4);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  -[OnDeviceACAM debugLogBuffer](self, "debugLogBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[OnDeviceACAM bdcOutputBuffer](self, "bdcOutputBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[OnDeviceACAM bdcOutputBuffer](self, "bdcOutputBuffer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeAllObjects");

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v21);
  }

  v27 = *((_QWORD *)&v50 + 1);
  if (*((_QWORD *)&v50 + 1))
  {
    do
    {
      v28 = *(_QWORD *)(v27 + 40);
      MEMORY[0x23B8057D4]();
      v27 = v28;
    }
    while (v28);
  }
  *((_QWORD *)&v50 + 1) = 0;
  v51 = 0uLL;
  if (SBYTE7(v50) < 0)
    operator delete((void *)__p);
  if (SHIBYTE(v48) < 0)
    operator delete(v46);
  return v30;
}

- (void)multiLog:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *logger;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 *v15;
  uint64_t v16;
  _QWORD *v17;
  const std::locale::facet *v18;
  void *v19;
  void *v20;
  int v21;
  NSMutableArray *debugLogBuffer;
  NSString *v23;
  objc_object *v24;
  void *v25;
  std::locale v26;
  __int128 buf;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("YYYY-MM-dd HH:m:s.SSS"));
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v4, &v30);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_236E59000, logger, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
  }
  -[OnDeviceACAM runTimeOptions](self, "runTimeOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WriteStdOut"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v13)
  {
    v14 = objc_retainAutorelease(v9);
    std::string::basic_string[abi:ne180100](&buf, (void *)objc_msgSend(v14, "UTF8String"), objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4));

    v15 = (v28 & 0x80u) == 0 ? &buf : (__int128 *)buf;
    v16 = (v28 & 0x80u) == 0 ? v28 : *((_QWORD *)&buf + 1);
    v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)v15, v16);
    std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
    v18 = std::locale::use_facet(&v26, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
    std::locale::~locale(&v26);
    std::ostream::put();
    std::ostream::flush();
    if ((char)v28 < 0)
      operator delete((void *)buf);
  }
  -[OnDeviceACAM runTimeOptions](self, "runTimeOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("SaveDebugInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v21)
  {
    debugLogBuffer = self->_debugLogBuffer;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)v9, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](debugLogBuffer, "addObject:", v25);

  }
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)algoDescription
{
  return self->_algoDescription;
}

- (NSNumber)runPeriod
{
  return self->_runPeriod;
}

- (unint64_t)runType
{
  return self->_runType;
}

- (BOOL)freshInitNeeded
{
  return self->_freshInitNeeded;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void)model
{
  return self->_model;
}

- (void)setModel:(void *)a3
{
  self->_model = a3;
}

- (NSMutableDictionary)lastBDCOutputTimestamp
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastBDCOutputTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)bdcOutputBuffer
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBdcOutputBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableArray)debugLogBuffer
{
  return self->_debugLogBuffer;
}

- (void)setDebugLogBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugLogBuffer, a3);
}

- (NSDictionary)runTimeOptions
{
  return self->_runTimeOptions;
}

- (void)setRunTimeOptions:(id)a3
{
  objc_storeStrong((id *)&self->_runTimeOptions, a3);
}

- (NSDictionary)freshInitInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFreshInitInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableArray)runningInfo
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRunningInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningInfo, 0);
  objc_storeStrong((id *)&self->_freshInitInfo, 0);
  objc_storeStrong((id *)&self->_runTimeOptions, 0);
  objc_storeStrong((id *)&self->_debugLogBuffer, 0);
  objc_storeStrong((id *)&self->_bdcOutputBuffer, 0);
  objc_storeStrong((id *)&self->_lastBDCOutputTimestamp, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_runPeriod, 0);
  objc_storeStrong((id *)&self->_algoDescription, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
