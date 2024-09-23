@implementation MAIDayStreamDiagnosticLogger

- (MAIDayStreamDiagnosticLogger)initWithConfig:(id)a3
{
  id v4;
  MAIDayStreamDiagnosticLogger *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  std::string *v33;
  __int128 v34;
  uint64_t n;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  MAIDayStreamDiagnosticLogger *v39;
  _BYTE v41[8];
  uint64_t *v42;
  objc_super v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  _BYTE v46[8];
  uint64_t *v47;
  std::string v48;
  char v49;
  _BYTE v50[8];
  _QWORD v51[2];
  char v52;
  void *__p[2];
  void **v54;
  char v55;
  _BYTE v56[8];
  _QWORD v57[2];
  char v58;
  int v59;
  uint64_t *v60;
  int *v61;
  char v62;
  _BYTE v63[8];
  _QWORD v64[2];
  char v65;
  _BYTE v66[16];
  _BYTE *v67;
  char v68;
  _BYTE v69[8];
  uint64_t *v70;
  _BYTE *v71;
  char v72;
  _BYTE v73[16];
  _BYTE *v74;
  char v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)MAIDayStreamDiagnosticLogger;
  v5 = -[MAIDiagnosticLogger init](&v43, sel_init);
  if (v5)
  {
    v6 = v4;
    v41[0] = 0;
    v42 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v41);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v41);
    objc_msgSend(v6, "userReportedCycleLength");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v59 = objc_msgSend(v7, "intValue");
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[24],int>((uint64_t)v41, "userReportedCycleLength", &v59, (uint64_t)v66);
    }

    objc_msgSend(v6, "julianDayOfUserReportedCycleLength");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v59 = objc_msgSend(v9, "intValue");
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[35],int>((uint64_t)v41, "julianDayOfUserReportedCycleLength", &v59, (uint64_t)v66);
    }

    objc_msgSend(v6, "userReportedMenstruationLength");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v59 = objc_msgSend(v11, "intValue");
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[31],int>((uint64_t)v41, "userReportedMenstruationLength", &v59, (uint64_t)v66);
    }

    objc_msgSend(v6, "julianDayOfUserReportedMenstruationLength");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v59 = objc_msgSend(v13, "intValue");
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[42],int>((uint64_t)v41, "julianDayOfUserReportedMenstruationLength", &v59, (uint64_t)v66);
    }

    objc_msgSend(v6, "birthDateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[5],char [5],0>((uint64_t)&v59, "year");
      v61 = &v59;
      v62 = 1;
      v16 = objc_msgSend(v15, "year");
      v63[0] = 5;
      v64[0] = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v63);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v63);
      v64[1] = v63;
      v65 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v66, (uint64_t)&v59, 2, 1, 2);
      v67 = v66;
      v68 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>((uint64_t)__p, "month");
      v54 = __p;
      v55 = 1;
      v17 = objc_msgSend(v15, "month");
      v56[0] = 5;
      v57[0] = v17;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
      v57[1] = v56;
      v58 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v69, (uint64_t)__p, 2, 1, 2);
      v71 = v69;
      v72 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[4],char [4],0>((uint64_t)&v48, "day");
      v48.__r_.__value_.__r.__words[2] = (std::string::size_type)&v48;
      v49 = 1;
      v18 = objc_msgSend(v15, "day");
      v50[0] = 5;
      v51[0] = v18;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
      v51[1] = v50;
      v52 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v73, (uint64_t)&v48, 2, 1, 2);
      v74 = v73;
      v75 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v46, (uint64_t)v66, 3, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v41, "birthDateComponents", (uint64_t)v46, (uint64_t)&v44);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v46);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v47, v46[0]);
      for (i = 0; i != -96; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v73[i]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v73[i + 8], v73[i]);
      }
      for (j = 0; j != -8; j -= 4)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v50[j * 8]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v51[j], v50[j * 8]);
      }
      for (k = 0; k != -8; k -= 4)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v56[k * 8]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v57[k], v56[k * 8]);
      }
      for (m = 0; m != -8; m -= 4)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v63[m * 8]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v64[m], v63[m * 8]);
      }
    }

    v59 = objc_msgSend(v6, "todayAsJulianDay");
    objc_msgSend(v6, "deviationInput", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[17],unsigned int>((uint64_t)v41, "todayAsJulianDay", (unsigned int *)&v59, (uint64_t)v66));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v59, 0, 0, 0, 1);
      objc_msgSend(v23, "julianDayMinAnalysisWindowStartIrregular");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowStartIrregular"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v24, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      objc_msgSend(v23, "julianDayMinAnalysisWindowStartInfrequent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowStartInfrequent"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v25, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      objc_msgSend(v23, "julianDayMinAnalysisWindowStartProlonged");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowStartProlonged"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v26, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      objc_msgSend(v23, "julianDayMinAnalysisWindowStartSpotting");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowStartSpotting"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v27, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      objc_msgSend(v23, "julianDayMinAnalysisWindowEndIrregular");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowEndIrregular"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v28, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      objc_msgSend(v23, "julianDayMinAnalysisWindowEndInfrequent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowEndInfrequent"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v29, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      objc_msgSend(v23, "julianDayMinAnalysisWindowEndProlonged");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowEndProlonged"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v30, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      objc_msgSend(v23, "julianDayMinAnalysisWindowEndSpotting");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        __p[0] = (void *)objc_msgSend(CFSTR("julianDayMinAnalysisWindowEndSpotting"), "UTF8String");
        LODWORD(v48.__r_.__value_.__l.__data_) = objc_msgSend(v31, "intValue");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v59, (char **)__p, (int *)&v48, (uint64_t)v66);
      }

      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>&>((uint64_t)v41, "deviation", (uint64_t)&v59, (uint64_t)v66);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v59);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v60, v59);
    }

    -[MAIDiagnosticLogger inputJson](v5, "inputJson");
    v32 = v44;
    -[MAIDayStreamDiagnosticLogger jsonObjectName](v5, "jsonObjectName");
    v33 = std::string::append(&v48, ".init", 5uLL);
    v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    v54 = (void **)v33->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v66, (uint64_t)__p);
    v67 = v66;
    v68 = 1;
    v69[0] = v41[0];
    v70 = v42;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v41);
    v41[0] = 0;
    v42 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v69);
    v71 = v69;
    v72 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v59, (uint64_t)v66, 2, 1, 2);
    v61 = &v59;
    v62 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v46, (uint64_t)&v59, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v32, (uint64_t)v46);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v46);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v47, v46[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v59);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v60, v59);
    for (n = 0; n != -8; n -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v69[n * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&(&v70)[n], v69[n * 8]);
    }
    if (SHIBYTE(v54) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v48.__r_.__value_.__l.__data_);
    v36 = v45;
    if (v45)
    {
      p_shared_owners = (unint64_t *)&v45->__shared_owners_;
      do
        v38 = __ldaxr(p_shared_owners);
      while (__stlxr(v38 - 1, p_shared_owners));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
    v39 = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v41);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v42, v41[0]);
  }

  return v5;
}

- (id)notificationName
{
  return CFSTR("com.apple.HealthAlgorithms.DayStreamProcessor.WriteToJson");
}

- (id)baseFileName
{
  return CFSTR("day_stream_processor");
}

- (basic_string<char,)jsonObjectName
{
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::basic_string[abi:nn180100]<0>(retstr, "dayStreamProcessor");
}

- (void)finalizeDayStreamInputWithDay:(unsigned int)a3
{
  uint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t *v7;
  std::string *v8;
  __int128 v9;
  uint64_t i;
  uint64_t j;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  NSObject *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  std::string v34;
  void *__p[2];
  std::string::size_type v36;
  _BYTE v37[8];
  uint64_t *v38[2];
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t *v42;
  char v43;
  _BYTE v44[8];
  _QWORD v45[2];
  char v46;
  _BYTE v47[8];
  uint64_t *v48[2];
  char v49;
  uint8_t buf[8];
  std::__shared_weak_count *v51;
  uint8_t *v52;
  char v53;
  _BYTE v54[16];
  _BYTE *v55;
  char v56;
  unsigned __int8 v57[8];
  uint64_t *v58[2];
  char v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  if (!v51)
    goto LABEL_5;
  p_shared_owners = &v51->__shared_owners_;
  do
    v6 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
    std::__shared_weak_count::__release_weak(v51);
    if (!*(_QWORD *)buf)
      return;
  }
  else
  {
LABEL_5:
    if (!*(_QWORD *)buf)
      return;
  }
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v7 = v38[1];
  -[MAIDayStreamDiagnosticLogger jsonObjectName](self, "jsonObjectName");
  v8 = std::string::append(&v34, ".analyze", 8uLL);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v36 = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)buf, (uint64_t)__p);
  v52 = buf;
  v53 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[40],char [40],0>((uint64_t)&v40, "mostRecentMenstrualFlowJulianDayUpdated");
  v42 = &v40;
  v43 = 1;
  v44[0] = 6;
  v45[0] = a3;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v44);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v44);
  v45[1] = v44;
  v46 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v47, (uint64_t)&v40, 2, 1, 2);
  v48[1] = (uint64_t *)v47;
  v49 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v54, (uint64_t)v47, 1, 1, 2);
  v55 = v54;
  v56 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v57, (uint64_t)buf, 2, 1, 2);
  v58[1] = (uint64_t *)v57;
  v59 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v37, (uint64_t)v57, 1, 1, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v7, (uint64_t)v37);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v37);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v38, v37[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v57);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v58, v57[0]);
  for (i = 0; i != -64; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v54[i]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v54[i + 8], v54[i]);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v47);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v48, v47[0]);
  for (j = 0; j != -8; j -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v44[j * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v45[j], v44[j * 8]);
  }
  if (SHIBYTE(v36) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  v12 = v39;
  if (v39)
  {
    v13 = (unint64_t *)&v39->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  -[MAIDiagnosticLogger inputFile](self, "inputFile");
  v15 = *(uint64_t **)buf;
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v16 = nlohmann::operator<<(v15, v40);
  v57[0] = 10;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v57, 1);
  v17 = v41;
  if (v41)
  {
    v18 = (unint64_t *)&v41->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v51;
  if (v51)
  {
    v21 = &v51->__shared_owners_;
    do
      v22 = __ldaxr((unint64_t *)v21);
    while (__stlxr(v22 - 1, (unint64_t *)v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v32 = 0;
  v33 = 0;
  -[MAIDiagnosticLogger setInputFile:](self, "setInputFile:", &v32);
  v23 = v33;
  if (v33)
  {
    v24 = (unint64_t *)&v33->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v30 = 0;
  v31 = 0;
  -[MAIDiagnosticLogger setInputJson:](self, "setInputJson:", &v30);
  v26 = v31;
  if (v31)
  {
    v27 = (unint64_t *)&v31->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  ha_get_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221550000, v29, OS_LOG_TYPE_DEFAULT, "finished writing input file", buf, 2u);
  }

}

- (void)logDayStreamProcessorOutput:(MAIDayStreamProcessorOutput *)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __n128 v37;
  std::__shared_weak_count *v38;
  unint64_t *p_shared_owners;
  unint64_t v40;
  __n128 v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  __n128 v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  __n128 v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  __n128 v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  id var1;
  void *v59;
  void *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  id var2;
  void *v68;
  void *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  const char *v76;
  char *v77;
  uint64_t *v78;
  _BYTE v79[8];
  uint64_t *v80;
  _BYTE v81[8];
  uint64_t *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[8];
  uint64_t *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[8];
  uint64_t *v94;
  _BYTE v95[8];
  uint64_t *v96[5];
  uint64_t v97;
  std::__shared_weak_count *v98;
  _BYTE v99[24];
  _BYTE *v100;
  _BYTE v101[24];
  _BYTE *v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v5 = a3->var0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v93, 0, 0, 0, 2);
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend(v5, "menstruationPredictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v90;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v90 != v8)
          objc_enumerationMutation(v6);
        -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_5::operator()(*(void **)(*((_QWORD *)&v89 + 1) + 8 * v9), (uint64_t)v95);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v93, (uint64_t)v95);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v95);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v96, v95[0]);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
    }
    while (v7);
  }

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v87, 0, 0, 0, 2);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v5, "fertilityPredictions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v84;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v84 != v12)
          objc_enumerationMutation(v10);
        -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_5::operator()(*(void **)(*((_QWORD *)&v83 + 1) + 8 * v13), (uint64_t)v95);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v87, (uint64_t)v95);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v95);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v96, v95[0]);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
    }
    while (v11);
  }

  v81[0] = 0;
  v82 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v81);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v81);
  objc_msgSend(v5, "stats");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "medianCycleLength");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    LODWORD(v97) = objc_msgSend(v15, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[18],int>((uint64_t)v81, "medianCycleLength", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "medianMenstruationLength");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    LODWORD(v97) = objc_msgSend(v17, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[25],int>((uint64_t)v81, "medianMenstruationLength", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lowerCycleLengthPercentile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    LODWORD(v97) = objc_msgSend(v19, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[27],int>((uint64_t)v81, "lowerCycleLengthPercentile", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lowerMenstruationLengthPercentile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    LODWORD(v97) = objc_msgSend(v21, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],int>((uint64_t)v81, "lowerMenstruationLengthPercentile", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "upperCycleLengthPercentile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    LODWORD(v97) = objc_msgSend(v23, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[27],int>((uint64_t)v81, "upperCycleLengthPercentile", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "upperMenstruationLengthPercentile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    LODWORD(v97) = objc_msgSend(v25, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],int>((uint64_t)v81, "upperMenstruationLengthPercentile", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberOfCyclesFound");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    LODWORD(v97) = objc_msgSend(v27, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],int>((uint64_t)v81, "numberOfCyclesFound", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "julianDayOfFirstCycleStart");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    LODWORD(v97) = objc_msgSend(v29, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[27],int>((uint64_t)v81, "julianDayOfFirstCycleStart", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "stats");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "julianDayOfLastCycleStart");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    LODWORD(v97) = objc_msgSend(v31, "intValue");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[26],int>((uint64_t)v81, "julianDayOfLastCycleStart", (int *)&v97, (uint64_t)v95);
  }

  objc_msgSend(v5, "deviationAnalysis");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v79, 0, 0, 0, 1);
  objc_msgSend(v32, "irregularBleeding");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v77 = (char *)objc_msgSend(CFSTR("irregularBleeding"), "UTF8String");
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v33, (uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v79, &v77, (uint64_t)&v97, (uint64_t)v95);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v98, v97);
  }

  objc_msgSend(v32, "infrequentBleeding");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v77 = (char *)objc_msgSend(CFSTR("infrequentBleeding"), "UTF8String");
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v34, (uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v79, &v77, (uint64_t)&v97, (uint64_t)v95);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v98, v97);
  }

  objc_msgSend(v32, "prolongedBleeding");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v77 = (char *)objc_msgSend(CFSTR("prolongedBleeding"), "UTF8String");
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v35, (uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v79, &v77, (uint64_t)&v97, (uint64_t)v95);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v98, v97);
  }

  objc_msgSend(v32, "spotting");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v77 = (char *)objc_msgSend(CFSTR("spotting"), "UTF8String");
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v36, (uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v79, &v77, (uint64_t)&v97, (uint64_t)v95);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v97);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v98, v97);
  }

  -[MAIDiagnosticLogger outputJson](self, "outputJson");
  v37.n128_f64[0] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[24],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v97, "menstruationPredictions", (uint64_t)v93, (uint64_t)v95);
  v38 = v98;
  if (v98)
  {
    p_shared_owners = (unint64_t *)&v98->__shared_owners_;
    do
      v40 = __ldaxr(p_shared_owners);
    while (__stlxr(v40 - 1, p_shared_owners));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v38->__on_zero_shared)(v38, v37);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  -[MAIDiagnosticLogger outputJson](self, "outputJson", v37.n128_f64[0]);
  v41.n128_f64[0] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[21],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v97, "fertilityPredictions", (uint64_t)v87, (uint64_t)v95);
  v42 = v98;
  if (v98)
  {
    v43 = (unint64_t *)&v98->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v42->__on_zero_shared)(v42, v41);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  -[MAIDiagnosticLogger outputJson](self, "outputJson", v41.n128_f64[0]);
  v45.n128_f64[0] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[6],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v97, "stats", (uint64_t)v81, (uint64_t)v95);
  v46 = v98;
  if (v98)
  {
    v47 = (unint64_t *)&v98->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v46->__on_zero_shared)(v46, v45);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  -[MAIDiagnosticLogger outputJson](self, "outputJson", v45.n128_f64[0]);
  v49.n128_f64[0] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[11],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v97, "deviations", (uint64_t)v79, (uint64_t)v95);
  v50 = v98;
  if (v98)
  {
    v51 = (unint64_t *)&v98->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v50->__on_zero_shared)(v50, v49);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  -[MAIDiagnosticLogger outputJson](self, "outputJson", v49.n128_f64[0]);
  v53 = v97;
  LOBYTE(v77) = objc_msgSend(v5, "isUserInactive");
  v54.n128_f64[0] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>(v53, "userInactive", (unsigned __int8 *)&v77, (uint64_t)v95);
  v55 = v98;
  if (v98)
  {
    v56 = (unint64_t *)&v98->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v55->__on_zero_shared)(v55, v54);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  var1 = a3->var1;
  if (var1)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", var1, 0, 0, v54.n128_f64[0]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v59, 4);
    if (!objc_msgSend(v60, "length"))
    {
LABEL_78:

      goto LABEL_79;
    }
    -[MAIDiagnosticLogger outputJson](self, "outputJson");
    v61 = v97;
    v76 = (const char *)objc_msgSend(objc_retainAutorelease(v60), "UTF8String");
    v102 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(&v76, (uint64_t)v101, 1, (uint64_t)&v77);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v61, "coreAnalyticsForDayStreamAnalysis", (uint64_t)&v77, (uint64_t)v95);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v77);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v78, v77);
    v62 = v102;
    if (v102 == v101)
    {
      v63 = 4;
      v62 = v101;
    }
    else
    {
      if (!v102)
      {
LABEL_73:
        v64 = v98;
        if (v98)
        {
          v65 = (unint64_t *)&v98->__shared_owners_;
          do
            v66 = __ldaxr(v65);
          while (__stlxr(v66 - 1, v65));
          if (!v66)
          {
            ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
            std::__shared_weak_count::__release_weak(v64);
          }
        }
        goto LABEL_78;
      }
      v63 = 5;
    }
    (*(void (**)(void))(*v62 + 8 * v63))();
    goto LABEL_73;
  }
LABEL_79:
  var2 = a3->var2;
  if (var2)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", var2, 0, 0, v54.n128_f64[0]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v68, 4);
    if (!objc_msgSend(v69, "length"))
    {
LABEL_91:

      goto LABEL_92;
    }
    -[MAIDiagnosticLogger outputJson](self, "outputJson");
    v70 = v97;
    v76 = (const char *)objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
    v100 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(&v76, (uint64_t)v99, 1, (uint64_t)&v77);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v70, "coreAnalyticsForDeviationAnalysis", (uint64_t)&v77, (uint64_t)v95);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v77);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v78, v77);
    v71 = v100;
    if (v100 == v99)
    {
      v72 = 4;
      v71 = v99;
    }
    else
    {
      if (!v100)
      {
LABEL_86:
        v73 = v98;
        if (v98)
        {
          v74 = (unint64_t *)&v98->__shared_owners_;
          do
            v75 = __ldaxr(v74);
          while (__stlxr(v75 - 1, v74));
          if (!v75)
          {
            ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
            std::__shared_weak_count::__release_weak(v73);
          }
        }
        goto LABEL_91;
      }
      v72 = 5;
    }
    (*(void (**)(void))(*v71 + 8 * v72))();
    goto LABEL_86;
  }
LABEL_92:
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v79);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v80, v79[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v81);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v82, v81[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v87);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v88, v87[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v93);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v94, v93[0]);

}

- (void)logDayStreamProcessorOutput:
{
  unsigned int v2;
  unsigned int v3;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t m;
  void *v15;
  void *v16;
  char isKindOfClass;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char *v27;
  char *v28;
  _BYTE v29[128];
  _QWORD v30[6];
  char *v31[3];
  char v32;
  _BYTE v33[8];
  _QWORD v34[2];
  char v35;
  _BYTE v36[8];
  uint64_t *v37[2];
  char v38;
  _BYTE v39[8];
  _QWORD v40[2];
  char v41;
  _BYTE v42[16];
  _BYTE *v43;
  char v44;
  _BYTE v45[16];
  _BYTE *v46;
  char v47;
  uint64_t v48;

  v21 = a2;
  v48 = *MEMORY[0x24BDAC8D0];
  v22 = a1;
  v28 = (char *)objc_msgSend(CFSTR("julianDayOfAnalysisWindowStart"), "UTF8String");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v36, &v28);
  v37[1] = (uint64_t *)v36;
  v38 = 1;
  v2 = objc_msgSend(v22, "julianDayOfAnalysisWindowStart");
  v39[0] = 6;
  v40[0] = v2;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v39);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v39);
  v40[1] = v39;
  v41 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v42, (uint64_t)v36, 2, 1, 2);
  v43 = v42;
  v44 = 1;
  v27 = (char *)objc_msgSend(CFSTR("julianDayOfAnalysisWindowEnd"), "UTF8String");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v31, &v27);
  v31[2] = (char *)v31;
  v32 = 1;
  v3 = objc_msgSend(v22, "julianDayOfAnalysisWindowEnd");
  v33[0] = 6;
  v34[0] = v3;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  v34[1] = v33;
  v35 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v45, (uint64_t)v31, 2, 1, 2);
  v46 = v45;
  v47 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(v21, (uint64_t)v42, 2, 1, 2);
  for (i = 0; i != -64; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45[i]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v45[i + 8], v45[i]);
  }
  for (j = 0; j != -8; j -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v33[j * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v34[j], v33[j * 8]);
  }
  for (k = 0; k != -8; k -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v39[k * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v40[k], v39[k * 8]);
  }
  objc_msgSend(v22, "metricsForCoreAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF20];
    v30[0] = CFSTR("deviationTrueBeforeRules");
    v30[1] = CFSTR("passedRuleMinWindowStart");
    v30[2] = CFSTR("passedRuleMinWindowEnd");
    v30[3] = CFSTR("passedRuleEnoughData");
    v30[4] = CFSTR("passedRuleFactorEndInWashout");
    v30[5] = CFSTR("passedRuleFactorInWindow");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v36, 0, 0, 0, 1);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v7, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      do
      {
        for (m = 0; m != v12; ++m)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * m);
          objc_msgSend(v7, "objectForKeyedSubscript:", v15, v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            if (objc_msgSend(v10, "containsObject:", v15))
            {
              v18 = objc_retainAutorelease(v15);
              v31[0] = (char *)objc_msgSend(v18, "UTF8String");
              objc_msgSend(v7, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v28) = objc_msgSend(v19, "BOOLValue");
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,BOOL>((uint64_t)v36, v31, (unsigned __int8 *)&v28, (uint64_t)v42);
            }
            else
            {
              v20 = objc_retainAutorelease(v15);
              v31[0] = (char *)objc_msgSend(v20, "UTF8String");
              objc_msgSend(v7, "objectForKeyedSubscript:", v20);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v28) = objc_msgSend(v19, "intValue");
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)v36, v31, (int *)&v28, (uint64_t)v42);
            }

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v12);
    }

    v31[0] = (char *)objc_msgSend(CFSTR("metricsForCoreAnalytics"), "UTF8String");
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>&>(v21, v31, (uint64_t)v36, (uint64_t)v42);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v36);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v37, v36[0]);

  }
}

@end
