@implementation MAIHistoricalDiagnosticLogger

- (id)notificationName
{
  return CFSTR("com.apple.HealthAlgorithms.HistoricalAnalyzer.WriteToJson");
}

- (id)baseFileName
{
  return CFSTR("historical_analyzer");
}

- (basic_string<char,)jsonObjectName
{
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::basic_string[abi:nn180100]<0>(retstr, "historicalAnalyzer");
}

- (void)finalizeHistoricalAnalyzerInput
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  std::string *v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  std::__shared_weak_count *size;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  std::string v30;
  void *__p[2];
  std::string::size_type v32;
  uint64_t v33;
  std::__shared_weak_count *v34;

  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  if (!__p[1])
    goto LABEL_5;
  v3 = (unint64_t *)((char *)__p[1] + 8);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  if (!v4)
  {
    (*(void (**)(void *))(*(_QWORD *)__p[1] + 16))(__p[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p[1]);
    if (!__p[0])
      return;
  }
  else
  {
LABEL_5:
    if (!__p[0])
      return;
  }
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v5 = v33;
  -[MAIHistoricalDiagnosticLogger jsonObjectName](self, "jsonObjectName");
  v6 = std::string::append(&v30, ".analyze", 8uLL);
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v32 = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<std::string>(v5, (uint64_t)__p);
  if (SHIBYTE(v32) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  v8 = v34;
  if (v34)
  {
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  -[MAIDiagnosticLogger inputFile](self, "inputFile");
  v11 = (uint64_t *)__p[0];
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v12 = nlohmann::operator<<(v11, (uint64_t)v30.__r_.__value_.__l.__data_);
  LOBYTE(v33) = 10;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v12, (uint64_t)&v33, 1);
  size = (std::__shared_weak_count *)v30.__r_.__value_.__l.__size_;
  if (v30.__r_.__value_.__l.__size_)
  {
    v14 = (unint64_t *)(v30.__r_.__value_.__l.__size_ + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v16 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v17 = (unint64_t *)((char *)__p[1] + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v28 = 0;
  v29 = 0;
  -[MAIDiagnosticLogger setInputFile:](self, "setInputFile:", &v28);
  v19 = v29;
  if (v29)
  {
    v20 = (unint64_t *)&v29->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v26 = 0;
  v27 = 0;
  -[MAIDiagnosticLogger setInputJson:](self, "setInputJson:", &v26);
  v22 = v27;
  if (v27)
  {
    v23 = (unint64_t *)&v27->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  ha_get_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_221550000, v25, OS_LOG_TYPE_DEFAULT, "finished writing input file", (uint8_t *)__p, 2u);
  }

}

- (void)logHistoricalAnalyzerOutput:(MAIHistoricalAnalyzerOutput)a3
{
  id var0;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  uint64_t v15;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;
  uint64_t mm;
  uint64_t nn;
  void *v24;
  void *v25;
  int v26;
  uint64_t *v27;
  unsigned __int8 v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t *v33;
  unsigned __int8 v34;
  uint64_t *v35;
  __n128 v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  id v49;
  id var1;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  unsigned __int8 v57[8];
  uint64_t *v58;
  unsigned __int8 v59[8];
  uint64_t *v60;
  void *v61[2];
  char v62;
  void *v63[2];
  char v64;
  unsigned __int8 v65[8];
  uint64_t *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[8];
  uint64_t *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[8];
  uint64_t *v78;
  _BYTE v79[24];
  _BYTE *v80;
  _BYTE v81[16];
  _BYTE *v82;
  char v83;
  _BYTE v84[8];
  _QWORD v85[2];
  char v86;
  _BYTE v87[16];
  _BYTE *v88;
  char v89;
  _BYTE v90[16];
  uint64_t v91;
  char v92;
  _BYTE v93[16];
  _BYTE *v94;
  char v95;
  _BYTE v96[16];
  uint64_t v97;
  char v98;
  _BYTE v99[16];
  _BYTE *v100;
  char v101;
  _BYTE v102[16];
  uint64_t v103;
  char v104;
  const char *v105[3];
  char v106;
  _BYTE v107[8];
  _QWORD v108[2];
  char v109;
  _BYTE v110[8];
  uint64_t *v111[2];
  char v112;
  _BYTE v113[8];
  _QWORD v114[2];
  char v115;
  uint64_t v116;
  std::__shared_weak_count *v117;
  uint64_t *v118;
  char v119;
  _BYTE v120[8];
  _QWORD v121[2];
  char v122;
  void *__p[2];
  void **v124;
  char v125;
  _QWORD v126[3];
  char v127;
  _QWORD v128[3];
  char v129;
  _QWORD v130[3];
  char v131;
  _QWORD v132[3];
  char v133;
  _QWORD v134[3];
  char v135;
  _BYTE v136[16];
  _BYTE *v137;
  char v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  var1 = a3.var1;
  var0 = a3.var0;
  v141 = *MEMORY[0x24BDAC8D0];
  v49 = a3.var0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v77, 0, 0, 0, 2);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = var0;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v140, 16, v49);
  if (v4)
  {
    v53 = *(_QWORD *)v74;
    do
    {
      v54 = v4;
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v74 != v53)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v71, 0, 0, 0, 2);
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v5, "phases");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v139, 16);
        v56 = v5;
        if (v7)
        {
          v8 = *(_QWORD *)v68;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v68 != v8)
                objc_enumerationMutation(v6);
              phase_to_string(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "intValue"), __p);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<std::string>((uint64_t)v71, (uint64_t)__p);
              if (SHIBYTE(v124) < 0)
                operator delete(__p[0]);
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v139, 16);
          }
          while (v7);
        }

        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[29],char [29],0>((uint64_t)&v116, "julianDayOfMenstruationStart");
        v118 = &v116;
        v119 = 1;
        v10 = objc_msgSend(v56, "julianDayOfMenstruationStart");
        v120[0] = 6;
        v121[0] = v10;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v120);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v120);
        v121[1] = v120;
        v122 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)__p, (uint64_t)&v116, 2, 1, 2);
        v124 = __p;
        v125 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[27],char [27],0>((uint64_t)v110, "julianDayOfMenstruationEnd");
        v111[1] = (uint64_t *)v110;
        v112 = 1;
        v11 = objc_msgSend(v56, "julianDayOfMenstruationEnd");
        v113[0] = 6;
        v114[0] = v11;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v113);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v113);
        v114[1] = v113;
        v115 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v126, (uint64_t)v110, 2, 1, 2);
        v126[2] = v126;
        v127 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[14],char [14],0>((uint64_t)v105, "isDeterminant");
        v105[2] = (const char *)v105;
        v106 = 1;
        v12 = objc_msgSend(v56, "isDeterminant");
        v107[0] = 4;
        v108[0] = v12;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v107);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v107);
        v108[1] = v107;
        v109 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v128, (uint64_t)v105, 2, 1, 2);
        v128[2] = v128;
        v129 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[24],char [24],0>((uint64_t)v99, "predictionPrimarySource");
        v100 = v99;
        v101 = 1;
        std::string::basic_string[abi:nn180100]<0>(v63, off_24E71CF68[(char)objc_msgSend(v56, "predictionPrimarySource")]);
        v103 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v102, (uint64_t)v63);
        v104 = 1;
        v130[2] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v130, (uint64_t)v99, 2, 1, 2);
        v131 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[7],char [7],0>((uint64_t)v93, "phases");
        v94 = v93;
        v95 = 1;
        v97 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v96, (uint64_t)v71);
        v98 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v132, (uint64_t)v93, 2, 1, 2);
        v132[2] = v132;
        v133 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[29],char [29],0>((uint64_t)v87, "ovulationConfirmationFailure");
        v88 = v87;
        v89 = 1;
        v13 = objc_msgSend(v56, "ovulationConfirmationFailure");
        v14 = "(invalid)";
        if (v13 <= 4)
          v14 = off_24E71CF88[(char)v13];
        std::string::basic_string[abi:nn180100]<0>(v61, v14);
        v91 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v90, (uint64_t)v61);
        v92 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v134, (uint64_t)v87, 2, 1, 2);
        v134[2] = v134;
        v135 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[35],char [35],0>((uint64_t)v81, "dailyEligibleWristTemperatureCount");
        v82 = v81;
        v83 = 1;
        v15 = objc_msgSend(v56, "dailyEligibleWristTemperatureCount");
        v84[0] = 5;
        v85[0] = v15;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v84);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v84);
        v85[1] = v84;
        v86 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v136, (uint64_t)v81, 2, 1, 2);
        v137 = v136;
        v138 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v65, (uint64_t)__p, 7, 1, 2);
        for (k = 0; k != -224; k -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v136[k]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v136[k + 8], v136[k]);
        }
        for (m = 0; m != -8; m -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v84[m * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v85[m], v84[m * 8]);
        }
        for (n = 0; n != -64; n -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v90[n]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v90[n + 8], v90[n]);
        }
        if (v62 < 0)
          operator delete(v61[0]);
        for (ii = 0; ii != -64; ii -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v96[ii]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v96[ii + 8], v96[ii]);
        }
        for (jj = 0; jj != -64; jj -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v102[jj]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v102[jj + 8], v102[jj]);
        }
        if (v64 < 0)
          operator delete(v63[0]);
        for (kk = 0; kk != -8; kk -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v107[kk * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v108[kk], v107[kk * 8]);
        }
        for (mm = 0; mm != -8; mm -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v113[mm * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v114[mm], v113[mm * 8]);
        }
        for (nn = 0; nn != -8; nn -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v120[nn * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v121[nn], v120[nn * 8]);
        }
        objc_msgSend(v56, "fertilityStartJulianDay");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v26 = objc_msgSend(v24, "intValue");
          v59[0] = 5;
          v60 = (uint64_t *)v26;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v59);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v59);
          v27 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v65, "julianDayOfFertilityStart");
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v59);
          v28 = *(_BYTE *)v27;
          *(_BYTE *)v27 = v59[0];
          v59[0] = v28;
          v29 = (uint64_t *)v27[1];
          v27[1] = (uint64_t)v60;
          v60 = v29;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v59);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v60, v59[0]);
        }

        objc_msgSend(v56, "fertilityEndJulianDay");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = objc_msgSend(v30, "intValue");
          v57[0] = 5;
          v58 = (uint64_t *)v32;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v57);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v57);
          v33 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v65, "julianDayOfFertilityEnd");
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v57);
          v34 = *(_BYTE *)v33;
          *(_BYTE *)v33 = v57[0];
          v57[0] = v34;
          v35 = (uint64_t *)v33[1];
          v33[1] = (uint64_t)v58;
          v58 = v35;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v57);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v58, v57[0]);
        }

        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v77, (uint64_t)v65);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v65);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v66, v65[0]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v71);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v72, v71[0]);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v140, 16);
    }
    while (v4);
  }

  -[MAIDiagnosticLogger outputJson](self, "outputJson");
  v36.n128_f64[0] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[7],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v116, "cycles", (uint64_t)v77, (uint64_t)__p);
  v37 = v117;
  if (v117)
  {
    p_shared_owners = (unint64_t *)&v117->__shared_owners_;
    do
      v39 = __ldaxr(p_shared_owners);
    while (__stlxr(v39 - 1, p_shared_owners));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v37->__on_zero_shared)(v37, v36);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  v40 = var1;
  if (var1)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", var1, 0, 0, v36.n128_f64[0]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v41, 4);
    if (!objc_msgSend(v42, "length"))
    {
LABEL_60:

      v40 = var1;
      goto LABEL_61;
    }
    -[MAIDiagnosticLogger outputJson](self, "outputJson");
    v43 = v116;
    v105[0] = (const char *)objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    v80 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(v105, (uint64_t)v79, 1, (uint64_t)v110);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[14],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v43, "coreAnalytics", (uint64_t)v110, (uint64_t)__p);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v110);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v111, v110[0]);
    v44 = v80;
    if (v80 == v79)
    {
      v45 = 4;
      v44 = v79;
    }
    else
    {
      if (!v80)
      {
LABEL_55:
        v46 = v117;
        if (v117)
        {
          v47 = (unint64_t *)&v117->__shared_owners_;
          do
            v48 = __ldaxr(v47);
          while (__stlxr(v48 - 1, v47));
          if (!v48)
          {
            ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
            std::__shared_weak_count::__release_weak(v46);
          }
        }
        goto LABEL_60;
      }
      v45 = 5;
    }
    (*(void (**)(void))(*v44 + 8 * v45))();
    goto LABEL_55;
  }
LABEL_61:
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v77);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v78, v77[0]);

}

@end
