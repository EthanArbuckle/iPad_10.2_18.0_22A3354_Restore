@implementation CATPattern

+ (id)patternNameFromType:(unint64_t)a3
{
  char *v3;
  void **v4;
  void *v5;
  void *__p[2];
  char v8;

  if (a3 > 0x12)
    v3 = "UNKNOWN_PATTERN";
  else
    v3 = off_1E792D1B8[a3];
  std::string::basic_string[abi:ne180100]<0>(__p, v3);
  if (v8 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 < 0)
    operator delete(__p[0]);
  return v5;
}

+ (id)segment:(id)a3 settings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  char *v12;
  char *v13;
  char *v14;
  double v15;
  int v16;
  double v17;
  double v18;
  unsigned __int8 *v19;
  uint64_t v20;
  int v21;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  std::string::size_type size;
  std::string::size_type i;
  __int128 v30;
  std::string *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  std::string v37;
  int v38[4];
  std::string __p;
  void *v40;
  uint64_t v41;
  char v42;
  void *v43[2];
  char v44;
  std::string v45;
  std::string v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  char v58;
  std::string v59;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("windowType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("firstWindowSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("windowSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v9;
  objc_msgSend(v6, "objectForKey:", CFSTR("locale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v10;
  objc_msgSend(v6, "objectForKey:", CFSTR("followupWindowSize"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"The pattern setting/parameter 'followupWindowSize' is deprecated. See 'firstWindowSize' and 'windowSize'.", v11);
  if (v5)
    v12 = (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  else
    v12 = "";
  std::string::basic_string[abi:ne180100]<0>(&v59, v12);
  siri::dialogengine::SpeakableString::SpeakableString((siri::dialogengine::SpeakableString *)&v46);
  siri::dialogengine::SpeakableString::SetString((uint64_t)&v46, (uint64_t)&v59);
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v45, v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
  else
    v45 = v46;
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);
  v59 = v45;
  if (v7)
    v13 = (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  else
    v13 = "";
  std::string::basic_string[abi:ne180100]<0>(&v45, v13);
  if (v10)
    v14 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  else
    v14 = "en";
  std::string::basic_string[abi:ne180100]<0>(v43, v14);
  if (v9)
    objc_msgSend(v9, "doubleValue");
  else
    v15 = 1.0;
  v16 = (int)v15;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v18 = v17;
  }
  else
  {
    v18 = (double)v16;
  }
  siri::dialogengine::StringTrim(" \t\n\r", &v45, &__p);
  siri::dialogengine::StringToLower((uint64_t)&__p, (uint64_t)&v40);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((v42 & 0x80) == 0)
  {
    if (v42 != 4)
    {
      if (v42 != 8)
      {
        if (v42 == 9)
        {
          v19 = (unsigned __int8 *)&v40;
          goto LABEL_34;
        }
        goto LABEL_47;
      }
      v25 = v40;
LABEL_46:
      if (v25 == (void *)0x65636E65746E6573)
      {
        v23 = 1;
        goto LABEL_50;
      }
      goto LABEL_47;
    }
    v24 = (int)v40;
LABEL_43:
    if (v24 == 1685221239)
    {
      v23 = 2;
      goto LABEL_50;
    }
    goto LABEL_47;
  }
  switch(v41)
  {
    case 4:
      v24 = *(_DWORD *)v40;
      goto LABEL_43;
    case 8:
      v25 = *(void **)v40;
      goto LABEL_46;
    case 9:
      v19 = (unsigned __int8 *)v40;
LABEL_34:
      v20 = *(_QWORD *)v19;
      v21 = v19[8];
      if (v20 == 0x6574636172616863 && v21 == 114)
      {
        v23 = 3;
        goto LABEL_50;
      }
      break;
  }
LABEL_47:
  std::operator+<char>();
  siri::dialogengine::Log::LogWithLevel((uint64_t)&__p, 3u);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v23 = 0;
LABEL_50:
  v38[2] = v23;
  v38[3] = 0;
  v38[0] = v16;
  v38[1] = (int)v18;
  siri::dialogengine::GetICUTextSegments((uint64_t)&v59, (uint64_t)v43, v38, (uint64_t)&__p);
  v26 = v8;
  v27 = (void *)objc_opt_new();
  size = __p.__r_.__value_.__l.__size_;
  for (i = __p.__r_.__value_.__r.__words[0]; i != size; i += 24)
  {
    if (*(char *)(i + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v37, *(const std::string::value_type **)i, *(_QWORD *)(i + 8));
    }
    else
    {
      v30 = *(_OWORD *)i;
      v37.__r_.__value_.__r.__words[2] = *(_QWORD *)(i + 16);
      *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v30;
    }
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v31 = &v37;
    else
      v31 = (std::string *)v37.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v32);

    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
  }
  v37.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  if (v42 < 0)
    operator delete(v40);
  if (v44 < 0)
    operator delete(v43[0]);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (v58 < 0)
    operator delete(v57);
  if (v56 < 0)
    operator delete(v55);
  if (v54 < 0)
    operator delete(v53);
  if (v52 < 0)
    operator delete(v51);
  if (v50 < 0)
    operator delete(v49);
  if (v48 < 0)
    operator delete(v47);
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);

  return v27;
}

+ (void)load:(id)a3 patternId:(id)a4 options:(int)a5 completion:(id)a6
{
  id v6;

  v6 = PatternLoader((uint64_t)a3);
}

+ (void)load:(id)a3 patternId:(id)a4 completion:(id)a5
{
  id v5;

  v5 = PatternLoader((uint64_t)a3);
}

+ (id)executeCAT:(id)a3 templateDir:()basic_string<char catId:()std:(std::allocator<char>> *)data :char_traits<char> patternId:requestType:parameters:globals:patternContext:callback:options:error:
{
  uint64_t *v4;
  uint64_t *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  DEPatternContext *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  id v36;
  id v37;
  id v38;
  void *__p[2];
  char v40;
  _BYTE buf[12];
  __int16 v42;
  uint64_t *v43;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  _QWORD *v50;

  v8 = v6;
  v9 = v5;
  v10 = v4;
  v12 = v49;
  v45 = *MEMORY[0x1E0C80C00];
  v36 = v7;
  v37 = v46;
  v38 = v48;
  GetPatternLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  spid = v14;
  v17 = v14 - 1;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v18 = v9;
    if (*((char *)v9 + 23) < 0)
      v18 = (uint64_t *)*v9;
    v19 = v10;
    if (*((char *)v10 + 23) < 0)
      v19 = (uint64_t *)*v10;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v18;
    v42 = 2080;
    v43 = v19;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v16, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PatternExecute_ExecuteCAT", "PATTERN_ID = %s; CAT_ID = %s",
      buf,
      0x16u);
  }

  if (*((char *)v10 + 23) < 0)
    v10 = (uint64_t *)*v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10, spid);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0)
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", data);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTemplateDir:", v22);

  if (*((char *)v9 + 23) < 0)
    v9 = (uint64_t *)*v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPatternId:", v23);

  v24 = -[DEPatternContext initWithSharedPtr:]([DEPatternContext alloc], "initWithSharedPtr:", v47);
  objc_msgSend(v21, "setPatternContext:", v24);

  if (v8 == 1)
  {
    v12 = CATVisualMode | v49;
  }
  else if (!v8)
  {
    v12 = v49 & ~CATVisualMode;
  }
  +[CATCommonApi ConfigureDEExecutor:parameters:globalParameters:catId:callback:options:](CATCommonApi, "ConfigureDEExecutor:parameters:globalParameters:catId:callback:options:", v21, v36, v37, v20, v38, v12);
  objc_msgSend(v21, "execute");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v50)
  {
    objc_msgSend(v25, "status");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("success"));

    if ((v28 & 1) != 0)
    {
      std::string::basic_string[abi:ne180100]<0>(buf, "");
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      NSErrorFromString((uint64_t *)buf, (uint64_t *)__p);
      *v50 = (id)objc_claimAutoreleasedReturnValue();
      if (v40 < 0)
        operator delete(__p[0]);
      if (v44 < 0)
        operator delete(*(void **)buf);
    }
    else
    {
      objc_msgSend(v26, "error");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v29, "UTF8String"));
      objc_msgSend(v26, "status");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v30, "UTF8String"));
      NSErrorFromString((uint64_t *)buf, (uint64_t *)__p);
      *v50 = (id)objc_claimAutoreleasedReturnValue();
      if (v40 < 0)
        operator delete(__p[0]);

      if (v44 < 0)
        operator delete(*(void **)buf);

    }
  }
  v31 = v16;
  v32 = v31;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v32, OS_SIGNPOST_INTERVAL_END, spida, "PatternExecute_ExecuteCAT", ", buf, 2u);
  }

  return v26;
}

+ (void)execute:(id)a3 patternId:(id)a4 parameters:(id)a5 globals:(id)a6 options:(int)a7 completion:(id)a8
{
  +[CATPattern execute:patternId:parameters:globals:callback:options:completion:](CATPattern, "execute:patternId:parameters:globals:callback:options:completion:", a3, a4, a5, a6, 0, *(_QWORD *)&a7, a8);
}

+ (void)execute:(id)a3 patternId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *, void *);
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *__p[2];
  char v30;
  void *v31[2];
  char v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *, void *))a9;
  v20 = (void *)objc_opt_new();
  if (v14)
  {
    v28 = v15;
    objc_msgSend(v14, "bundleIdentifier");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v31, (char *)objc_msgSend(v21, "UTF8String"));
    +[DEExecutor bundleTemplateDir:](DEExecutor, "bundleTemplateDir:", v14);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v22, "UTF8String"));
    siri::dialogengine::GradingAllowListFactory::RegisterBundle((char *)v31, (__int128 *)__p);
    if (v30 < 0)
      operator delete(__p[0]);

    if (v32 < 0)
      operator delete(v31[0]);

    v23 = (void *)MEMORY[0x1E0C99E98];
    +[DEExecutor bundleTemplateDir:](DEExecutor, "bundleTemplateDir:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fileURLWithPath:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = a8;
    v15 = v28;
    +[CATPattern execute:templateDir:patternId:parameters:globals:callback:options:completion:](CATPattern, "execute:templateDir:patternId:parameters:globals:callback:options:completion:", 0, v25, v28, v16, v17, v18, v27, v19);

  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v31, "Nil bundle supplied");
    std::string::basic_string[abi:ne180100]<0>(__p, "request-error");
    NSErrorFromString((uint64_t *)v31, (uint64_t *)__p);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, v20, v26);

    if (v30 < 0)
      operator delete(__p[0]);
    if (v32 < 0)
      operator delete(v31[0]);
  }

}

+ (void)execute:(id)a3 templateDir:(id)a4 patternId:(id)a5 parameters:(id)a6 globals:(id)a7 options:(int)a8 completion:(id)a9
{
  uint64_t v9;

  LODWORD(v9) = a8;
  +[CATPattern execute:templateDir:patternId:parameters:globals:callback:options:completion:](CATPattern, "execute:templateDir:patternId:parameters:globals:callback:options:completion:", a3, a4, a5, a6, a7, 0, v9, a9);
}

+ (void)execute:(id)a3 templateDir:(id)a4 patternId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  std::string *v10;
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
  id v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  std::string *v31;
  __int128 v32;
  std::string *p_s;
  std::string::size_type size;
  std::string *v35;
  __int128 v36;
  std::string *v37;
  __int128 v38;
  siri::dialogengine *has_internal_diagnostics;
  const char *v40;
  void *v41;
  void *v42;
  id v43;
  char *v44;
  void *v45;
  void *v46;
  id v47;
  char *v48;
  siri::dialogengine *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  siri::dialogengine::VariableObject *v55;
  unsigned int v56;
  const char *v57;
  void *v58;
  id v59;
  char v60;
  std::string::size_type v61;
  const char *v62;
  std::string *v63;
  void *first;
  std::string *v65;
  _OWORD *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  std::__split_buffer<std::string>::pointer end_high;
  std::string::size_type v71;
  uint64_t v72;
  int v73;
  int v74;
  BOOL v75;
  std::__split_buffer<std::string>::pointer v76;
  int v77;
  void *v78;
  std::string *v79;
  _OWORD *v80;
  void *v81;
  char *v82;
  void *v83;
  void *v84;
  unint64_t v85;
  std::string::size_type v86;
  void *v87;
  void *v88;
  void *p_end_cap;
  void *v90;
  std::string *v91;
  std::string *v92;
  __int128 *p_buf;
  _QWORD *v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  unint64_t *p_shared_owners;
  unint64_t v99;
  NSObject *v100;
  NSObject *v101;
  _QWORD *v102;
  siri::dialogengine::PatternFile *v103;
  std::string::size_type v104;
  std::allocator<std::string> *value;
  unint64_t *v106;
  unint64_t v107;
  std::string *v108;
  std::string *v109;
  uint64_t v110;
  uint64_t v111;
  std::__shared_weak_count *v112;
  uint64_t v113;
  unint64_t *v114;
  unint64_t v115;
  unint64_t v116;
  std::string *v117;
  __int128 v118;
  std::string::size_type v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  unint64_t *v126;
  unint64_t v127;
  std::string *v128;
  unint64_t *v129;
  unint64_t v130;
  std::allocator<std::string> *v131;
  unint64_t *v132;
  unint64_t v133;
  std::string *v134;
  std::string *v135;
  uint64_t **v136;
  _QWORD *v137;
  _QWORD *i;
  uint64_t v139;
  std::vector<std::string>::pointer end;
  __int128 v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  std::string *v145;
  std::string *v146;
  __int128 v147;
  std::string *v148;
  const char *v149;
  void **v150;
  _QWORD *v151;
  uint64_t v152;
  std::string *v153;
  __int128 v154;
  unint64_t v155;
  std::string *v156;
  std::string *v157;
  std::string::size_type v158;
  std::string *v159;
  __int128 v160;
  std::string *v161;
  __int128 v162;
  uint64_t v163;
  std::__shared_weak_count *v164;
  unint64_t *v165;
  unint64_t v166;
  siri::dialogengine::PatternSchema *v167;
  unint64_t *v168;
  unint64_t v169;
  char v170;
  uint64_t v171;
  std::string::size_type v172;
  _QWORD *v173;
  _QWORD *v174;
  _BYTE *v175;
  uint64_t v176;
  _QWORD *v177;
  _QWORD *v178;
  std::string *v179;
  std::string::size_type v180;
  _QWORD *v181;
  _QWORD *v182;
  std::string *v183;
  std::string::size_type v184;
  uint64_t v185;
  std::vector<std::string>::pointer v186;
  std::vector<std::string>::pointer v187;
  std::string *v188;
  _QWORD *v189;
  std::string *v190;
  std::string::size_type v191;
  _QWORD *v192;
  _QWORD *v193;
  std::string *v194;
  std::string::size_type v195;
  _QWORD *v196;
  _QWORD *v197;
  __int128 v198;
  _BYTE *v199;
  uint64_t v200;
  _QWORD *v201;
  _BYTE *v202;
  uint64_t v203;
  _QWORD *v204;
  _QWORD *v205;
  std::string *v206;
  std::string::size_type v207;
  _QWORD *v208;
  std::__shared_weak_count *v209;
  unint64_t *v210;
  unint64_t v211;
  std::__shared_weak_count *v212;
  unint64_t *v213;
  unint64_t v214;
  std::__shared_weak_count *v215;
  unint64_t *v216;
  unint64_t v217;
  int v218;
  uint64_t v219;
  int v220;
  uint64_t v221;
  id v222;
  const char *v223;
  void *v224;
  int v225;
  _BYTE *v226;
  const char *v227;
  void *v228;
  std::string::size_type v229;
  id v230;
  id v231;
  std::__split_buffer<std::string> *v232;
  std::__split_buffer<std::string> *v233;
  _QWORD *v234;
  _QWORD *v235;
  _QWORD *v236;
  _BYTE *v237;
  void *v238;
  _QWORD *v239;
  _QWORD *v240;
  id v241;
  uint64_t v242;
  id v243;
  uint64_t v244;
  std::string::size_type v245;
  uint64_t v246;
  int v247;
  _BYTE *v248;
  int v249;
  _BYTE *v250;
  std::string *v251;
  __int128 v252;
  id v253;
  std::string *v254;
  __int128 v255;
  const char *v256;
  std::__split_buffer<std::string>::pointer v257;
  DEResult *v258;
  void *v259;
  void *v260;
  const char *v261;
  _BYTE *v262;
  _BYTE *v263;
  std::string *v264;
  std::string *v265;
  std::string::size_type v266;
  std::string *v267;
  __int128 v268;
  std::string *v269;
  __int128 v270;
  std::__split_buffer<std::string>::pointer v271;
  const char *v272;
  std::__split_buffer<std::string>::pointer begin;
  DEResult *v274;
  void *v275;
  void *v276;
  const char *v277;
  std::string *v278;
  _BYTE *v279;
  std::string *v280;
  _BYTE *v281;
  _BYTE *v282;
  void *v283;
  std::string *v284;
  void *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  std::__split_buffer<std::string>::pointer v289;
  uint64_t v290;
  unint64_t v291;
  unint64_t v292;
  uint64_t v293;
  unint64_t v294;
  std::string *v295;
  _QWORD *v296;
  _QWORD *v297;
  uint64_t v298;
  int64x2_t v299;
  std::string *v300;
  _BYTE *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  std::__split_buffer<std::string>::pointer v305;
  uint64_t v306;
  unint64_t v307;
  unint64_t v308;
  uint64_t v309;
  unint64_t v310;
  std::string *v311;
  _QWORD *v312;
  _QWORD *v313;
  uint64_t v314;
  int64x2_t v315;
  std::string *v316;
  id v317;
  void *v318;
  std::string *v319;
  std::string::size_type v320;
  std::string *v321;
  __int128 v322;
  std::string *v323;
  __int128 v324;
  _BYTE *v325;
  _BYTE *v326;
  std::string *v327;
  std::string *v328;
  __int128 v329;
  const std::string::value_type *v330;
  std::string::size_type v331;
  std::string *v332;
  __int128 v333;
  std::string *v334;
  __int128 v335;
  std::string *v336;
  std::string::size_type v337;
  std::string *v338;
  __int128 v339;
  std::string *v340;
  __int128 v341;
  unint64_t *v342;
  unint64_t v343;
  const char *v344;
  std::__shared_weak_count *v345;
  unint64_t *v346;
  unint64_t v347;
  std::string *v348;
  __int128 v349;
  const std::string::value_type *v350;
  std::string::size_type v351;
  std::string *v352;
  __int128 v353;
  std::string *v354;
  __int128 v355;
  id v356;
  std::string *v357;
  __int128 v358;
  void *v359;
  _BYTE *v360;
  uint64_t v361;
  id v362;
  std::string *v363;
  _BYTE *v364;
  std::string *v365;
  std::string *v366;
  __int128 v367;
  const std::string::value_type *v368;
  std::string::size_type v369;
  std::string *v370;
  __int128 v371;
  std::string *v372;
  __int128 v373;
  std::string *v374;
  std::string::size_type v375;
  std::string *v376;
  __int128 v377;
  std::string *v378;
  __int128 v379;
  unint64_t *v380;
  unint64_t v381;
  std::__shared_weak_count *v382;
  unint64_t *v383;
  unint64_t v384;
  std::string *v385;
  __int128 v386;
  const std::string::value_type *v387;
  std::string::size_type v388;
  std::string *v389;
  __int128 v390;
  std::string *v391;
  __int128 v392;
  id v393;
  std::string *v394;
  __int128 v395;
  void *v396;
  std::string *v397;
  uint64_t v398;
  id v399;
  uint64_t v400;
  void *v401;
  void *v402;
  id v403;
  id v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t j;
  void *v412;
  void *v413;
  BOOL v414;
  uint64_t v415;
  const char *v416;
  void *v417;
  void *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t k;
  void *v422;
  void *v423;
  BOOL v424;
  uint64_t v425;
  const char *v426;
  void *v427;
  BOOL v428;
  void *v429;
  _QWORD *v430;
  uint64_t v431;
  unint64_t v432;
  void *v433;
  uint64_t v434;
  uint64_t v435;
  siri::dialogengine *v436;
  uint64_t v437;
  std::string *v438;
  __int128 v439;
  void *v440;
  id v441;
  id v442;
  int v443;
  const SnippetUI::Response_Section *v444;
  int v445;
  std::string *v446;
  _QWORD *v447;
  uint64_t v448;
  int v449;
  uint64_t *v450;
  uint64_t v451;
  void *v452;
  uint64_t v453;
  uint64_t v454;
  PatternExecutionResult *v455;
  const char *v456;
  id v457;
  std::string *v458;
  void *v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  void *v464;
  id v465;
  __int128 v466;
  void *v467;
  id v468;
  uint64_t v469;
  const char *v470;
  _BOOL4 v471;
  const char *v472;
  BOOL v473;
  _BYTE *v474;
  _BYTE *v475;
  char *v476;
  void *v477;
  void *v478;
  void *v479;
  std::string *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  int v492;
  std::string *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  std::string *v517;
  unsigned int v518;
  uint64_t v519;
  void *v520;
  void *v521;
  void *v522;
  _BOOL4 v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  const char *v527;
  uint64_t v528;
  const void *v529;
  uint64_t v530;
  unint64_t *v531;
  unint64_t v532;
  char *v533;
  const char *v534;
  unint64_t v535;
  unint64_t v536;
  int v537;
  unint64_t v538;
  unint64_t v539;
  int v540;
  _BOOL8 v541;
  uint64_t v542;
  const char *v543;
  char *v544;
  const char *v545;
  void *v546;
  std::__shared_weak_count *v547;
  unint64_t *v548;
  unint64_t v549;
  uint64_t v550;
  NSObject *v551;
  NSObject *v552;
  std::string *v553;
  __int128 v554;
  std::string *v555;
  std::string::size_type v556;
  std::string *v557;
  __int128 v558;
  std::string *v559;
  __int128 v560;
  std::string *v561;
  std::string::size_type v562;
  std::string *v563;
  __int128 v564;
  os_signpost_id_t v565;
  NSObject *v566;
  NSObject *v567;
  NSObject *v568;
  NSObject *v569;
  std::__shared_weak_count *v570;
  unint64_t *v571;
  unint64_t v572;
  std::__shared_weak_count *v573;
  unint64_t *v574;
  unint64_t v575;
  std::__shared_weak_count *v576;
  unint64_t *v577;
  unint64_t v578;
  std::__shared_weak_count *v579;
  unint64_t *v580;
  unint64_t v581;
  std::__shared_weak_count *v582;
  unint64_t *v583;
  unint64_t v584;
  std::__shared_weak_count *v585;
  unint64_t *v586;
  unint64_t v587;
  uint64_t v588;
  os_signpost_id_t spid;
  int v590;
  std::string *v591;
  std::string *v592;
  unint64_t v593;
  id v594;
  id v595;
  id v596;
  id v597;
  id v598;
  void *v599;
  NSObject *log;
  void (**v601)(id, PatternExecutionResult *, void *);
  id v602;
  std::string *v603;
  unsigned int v604;
  int v605;
  void *v606;
  std::string *v607;
  int v608;
  _QWORD *v609;
  uint64_t v610;
  int v611;
  id v612;
  unsigned int v613;
  id v614;
  id v615;
  void *v616;
  id v617;
  uint64_t v618;
  PatternExecutionResult *v619;
  PatternExecutionResult *v620;
  std::string *v621;
  id v622;
  uint64_t v623;
  std::__shared_weak_count *v624;
  std::string v625;
  std::string v626;
  std::string v627;
  std::string v628;
  id v629;
  uint64_t v630;
  std::__shared_weak_count *v631;
  std::string v632;
  std::string v633;
  std::string v634;
  std::string v635;
  std::string v636;
  std::string v637;
  siri::dialogengine::PatternSchema *v638;
  std::__shared_weak_count *v639;
  uint64_t v640;
  std::__shared_weak_count *v641;
  std::string v642;
  std::string v643;
  int64x2_t v644;
  std::string *v645;
  int64x2_t v646;
  std::string *v647;
  void *v648[2];
  char v649;
  std::vector<std::string> v650;
  _QWORD *v651;
  std::__shared_weak_count *v652;
  _QWORD *v653;
  _QWORD *v654;
  siri::dialogengine::PatternSchema *v655;
  std::__shared_weak_count *v656;
  _QWORD *v657;
  std::__shared_weak_count *v658;
  siri::dialogengine *v659;
  std::__shared_weak_count *v660;
  siri::dialogengine::VariableObject *v661;
  std::__shared_weak_count *v662;
  __n128 v663;
  std::string *v664;
  int v665[2];
  char v666;
  void *v667[2];
  char v668;
  std::string v669;
  std::string __s;
  _QWORD v671[3];
  char v672;
  char v673;
  _BYTE v674[32];
  __int128 v675;
  __int128 v676;
  _BYTE __str[32];
  __int128 v678;
  __int128 v679;
  std::__split_buffer<std::string> v680;
  id v681;
  id v682;
  id v683;
  id v684;
  id v685;
  id v686;
  std::string v687;
  id v688;
  std::string v689[15];
  __int128 buf;
  std::string::size_type v691;
  std::string v692;
  uint64_t v693;

  MEMORY[0x1E0C80A78](a1);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v693 = *MEMORY[0x1E0C80C00];
  v595 = v21;
  v596 = v20;
  v597 = v18;
  v594 = v16;
  v614 = v14;
  v598 = v12;
  v601 = (void (**)(id, PatternExecutionResult *, void *))a10;
  GetPatternLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_generate(v22);
  v24 = v22;
  v25 = v24;
  spid = v23;
  v593 = v23 - 1;
  log = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(objc_retainAutorelease(v597), "UTF8String");
    v25 = log;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, log, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PatternExecute", "PATTERN_ID = %s", (uint8_t *)&buf, 0xCu);
  }

  v619 = (PatternExecutionResult *)objc_opt_new();
  v673 = 0;
  memset(v671, 0, sizeof(v671));
  v672 = 0;
  siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v671);
  v26 = v595;
  v27 = v596;
  memset(&__s, 0, sizeof(__s));
  v606 = v26;
  v599 = v27;
  if (v26)
  {
    +[DEExecutor bundleTemplateDir:](DEExecutor, "bundleTemplateDir:", v26);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x1C3B8D53C](&__s, objc_msgSend(v28, "UTF8String"));

    objc_msgSend(v606, "bundleIdentifier");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v29, "UTF8String"));
    siri::dialogengine::GradingAllowListFactory::RegisterBundle((char *)&buf, (__int128 *)&__s);
    if (SHIBYTE(v691) < 0)
      operator delete((void *)buf);

  }
  else
  {
    objc_msgSend(v27, "path");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x1C3B8D53C](&__s, objc_msgSend(v30, "UTF8String"));

  }
  v602 = objc_retainAutorelease(v597);
  std::string::basic_string[abi:ne180100]<0>(&v669, (char *)objc_msgSend(v602, "UTF8String"));
  v612 = v594;
  v615 = v614;
  std::operator+<char>();
  v31 = std::string::append((std::string *)__str, "' with template dir '");
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v692.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v692.__r_.__value_.__l.__data_ = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_s = &__s;
  else
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  else
    size = __s.__r_.__value_.__l.__size_;
  v35 = std::string::append(&v692, (const std::string::value_type *)p_s, size);
  v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  v680.__end_ = (std::__split_buffer<std::string>::pointer)v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v680.__first_ = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  v37 = std::string::append((std::string *)&v680, "'");
  v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  v691 = v37->__r_.__value_.__r.__words[2];
  buf = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  siri::dialogengine::Log::LogWithLevel((uint64_t)&buf, 0);
  if (SHIBYTE(v691) < 0)
    operator delete((void *)buf);
  if (SHIBYTE(v680.__end_) < 0)
    operator delete(v680.__first_);
  if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v692.__r_.__value_.__l.__data_);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  has_internal_diagnostics = (siri::dialogengine *)os_variant_has_internal_diagnostics();
  if ((_DWORD)has_internal_diagnostics && siri::dialogengine::ShouldLogCATParameters(has_internal_diagnostics, v40))
  {
    *(_QWORD *)__str = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v612, 3, __str);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41 && (v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v41, 4)) != 0)
    {
      v43 = objc_retainAutorelease(v42);
      v44 = (char *)objc_msgSend(v43, "UTF8String");
    }
    else
    {
      v43 = 0;
      v44 = "unable to represent parameters as JSON";
    }
    std::string::basic_string[abi:ne180100]<0>(&buf, v44);
    std::operator+<char>();
    siri::dialogengine::Log::LogWithLevel((uint64_t)&v680, 0);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    *(_QWORD *)v674 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v615, 3, v674);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v45, 4);
      if (v46)
      {
        v47 = objc_retainAutorelease(v46);
        v48 = (char *)objc_msgSend(v47, "UTF8String");
      }
      else
      {
        v47 = 0;
        v48 = "unable to represent globals as JSON";
      }
    }
    else
    {
      v47 = 0;
      v48 = "unable to represent globals as JSON";
    }
    std::string::basic_string[abi:ne180100]<0>(&v680, v48);
    std::operator+<char>();
    siri::dialogengine::Log::LogWithLevel((uint64_t)&v692, 0);
    if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v692.__r_.__value_.__l.__data_);
    v666 = 1;
    std::string::basic_string[abi:ne180100]<0>(v667, "");
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);

    if (SHIBYTE(v691) < 0)
      operator delete((void *)buf);

  }
  else
  {
    v666 = 1;
    std::string::basic_string[abi:ne180100]<0>(v667, "");
  }

  if (siri::dialogengine::HasPreloadBeenCalled(v49))
    siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Performance: DialogEngine's 'preload' function has been called", v50);
  else
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Performance: DialogEngine's 'preload' function has not been called.", v50);
  siri::dialogengine::GetTemplateDirs((uint64_t)&__s, +[CATCommonApi UpdatesEnabled:](CATCommonApi, "UpdatesEnabled:"), (uint64_t)&v664);
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)&buf, &v664);
  siri::dialogengine::PatternFile::LoadFromId((uint64_t *)&buf, (uint64_t)&v669, 1, &v663);
  v51 = v663.n128_u64[0];
  if (!v663.n128_u64[0])
  {
    LogPatternExecutionResult(v619);
    v67 = log;
    v68 = v67;
    if (v593 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      LOWORD(v680.__first_) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BF794000, v68, OS_SIGNPOST_INTERVAL_END, v23, "PatternExecute", ", (uint8_t *)&v680, 2u);
    }

    std::operator+<char>();
    std::string::basic_string[abi:ne180100]<0>(&v692, "load-failed");
    NSErrorFromString((uint64_t *)&v680, (uint64_t *)&v692);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v601[2](v601, v619, v69);

    if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v692.__r_.__value_.__l.__data_);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    goto LABEL_1029;
  }
  std::string::basic_string[abi:ne180100]<0>(&v680, "globalParameters");
  objc_msgSend(v615, "objectForKeyedSubscript:", CFSTR("globalParameters"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  VariableFromNSDictionary((uint64_t *)&v661, (const std::string *)&v680, v52);

  if (SHIBYTE(v680.__end_) < 0)
    operator delete(v680.__first_);
  std::string::basic_string[abi:ne180100]<0>(&v680, "parameters");
  VariableFromNSDictionary((uint64_t *)&v659, (const std::string *)&v680, v612);
  if (SHIBYTE(v680.__end_) < 0)
    operator delete(v680.__first_);
  objc_msgSend(v615, "valueForKey:", CFSTR("responseMode"));
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v53)
    v53 = &stru_1E793AF80;
  v54 = objc_retainAutorelease(v53);
  std::string::basic_string[abi:ne180100]<0>(&v680, (char *)-[__CFString UTF8String](v54, "UTF8String"));
  v613 = siri::dialogengine::ParseResponseModeString((unint64_t)&v680);
  if (SHIBYTE(v680.__end_) < 0)
    operator delete(v680.__first_);

  v56 = v613 - 1;
  if (v613 == 1)
    goto LABEL_59;
  if (siri::dialogengine::DeviceIsHomePod(v659, v661, v55))
  {
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Device is a HomePod; Forcing response mode to voiceOnly",
      v57);
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v615);
    objc_msgSend(v58, "setValue:forKey:", CFSTR("voiceOnly"), CFSTR("responseMode"));
    v59 = v58;

    v615 = v59;
LABEL_59:
    v56 = 0;
    v60 = HIBYTE(v669.__r_.__value_.__r.__words[2]);
    v61 = v669.__r_.__value_.__r.__words[0];
    v613 = 1;
LABEL_60:
    std::string::basic_string[abi:ne180100]<0>(&v680, off_1E7930A68[v56]);
    v63 = &v669;
    if (v60 < 0)
      v63 = (std::string *)v61;
    if (SHIBYTE(v680.__end_) >= 0)
      first = &v680;
    else
      first = v680.__first_;
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Response mode for execution of pattern %s: %s", v62, v63, first);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    v51 = v663.n128_u64[0];
    goto LABEL_68;
  }
  v60 = HIBYTE(v669.__r_.__value_.__r.__words[2]);
  if (v613)
  {
    v61 = v669.__r_.__value_.__r.__words[0];
    goto LABEL_60;
  }
  v446 = (std::string *)v669.__r_.__value_.__r.__words[0];
  if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v446 = &v669;
  siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"WARNING: Response mode for execution of pattern %s was not specified", v57, v446);
  v613 = 0;
LABEL_68:
  v66 = (_OWORD *)(v51 + 64);
  if (*(char *)(v51 + 87) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v680, *(const std::string::value_type **)(v51 + 64), *(_QWORD *)(v51 + 72));
  }
  else
  {
    *(_OWORD *)&v680.__first_ = *v66;
    v680.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 80);
  }
  if (SHIBYTE(v680.__end_) >= 0)
    end_high = (std::__split_buffer<std::string>::pointer)HIBYTE(v680.__end_);
  else
    end_high = v680.__begin_;
  v71 = HIBYTE(v669.__r_.__value_.__r.__words[2]);
  if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v71 = v669.__r_.__value_.__l.__size_;
  if (end_high != (std::__split_buffer<std::string>::pointer)v71)
  {
    if ((HIBYTE(v680.__end_) & 0x80) != 0)
      operator delete(v680.__first_);
    goto LABEL_102;
  }
  if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v65 = &v669;
  else
    v65 = (std::string *)v669.__r_.__value_.__r.__words[0];
  if ((HIBYTE(v680.__end_) & 0x80) == 0)
  {
    if (!HIBYTE(v680.__end_))
      goto LABEL_111;
    v72 = 0;
    do
    {
      v73 = *((unsigned __int8 *)&v680.__first_ + v72);
      v74 = v65->__r_.__value_.__s.__data_[v72];
      v75 = v73 != v74 || HIBYTE(v680.__end_) - 1 == v72++;
    }
    while (!v75);
    if (v73 == v74)
      goto LABEL_111;
LABEL_102:
    if (*(char *)(v51 + 87) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v680, *(const std::string::value_type **)(v51 + 64), *(_QWORD *)(v51 + 72));
    }
    else
    {
      *(_OWORD *)&v680.__first_ = *v66;
      v680.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 80);
    }
    v78 = &v680;
    if (SHIBYTE(v680.__end_) < 0)
      v78 = v680.__first_;
    v79 = &v669;
    if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v79 = (std::string *)v669.__r_.__value_.__r.__words[0];
    siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"The pattern ID in the pattern file [%s] does not match the requested pattern ID [%s]", (const char *)v65, v78, v79);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    goto LABEL_111;
  }
  v76 = v680.__first_;
  v77 = memcmp(v680.__first_, v65, (size_t)v680.__begin_);
  operator delete(v76);
  if (v77)
    goto LABEL_102;
LABEL_111:
  -[PatternExecutionResult setPatternId:](v619, "setPatternId:", v602);
  v80 = (_OWORD *)(v51 + 112);
  if (*(char *)(v51 + 135) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v680, *(const std::string::value_type **)(v51 + 112), *(_QWORD *)(v51 + 120));
  }
  else
  {
    *(_OWORD *)&v680.__first_ = *v80;
    v680.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 128);
  }
  -[PatternExecutionResult setPatternType:](v619, "setPatternType:", PatternTypeFromName((uint64_t)&v680));
  if (SHIBYTE(v680.__end_) < 0)
    operator delete(v680.__first_);
  v81 = (void *)MEMORY[0x1E0CB3940];
  if (v613 - 1 > 3)
    v82 = "";
  else
    v82 = off_1E7930A68[v613 - 1];
  std::string::basic_string[abi:ne180100]<0>(&v680, v82);
  if (SHIBYTE(v680.__end_) >= 0)
    v83 = &v680;
  else
    v83 = v680.__first_;
  objc_msgSend(v81, "stringWithUTF8String:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[PatternExecutionResult setResponseMode:](v619, "setResponseMode:", v84);

  if (SHIBYTE(v680.__end_) < 0)
    operator delete(v680.__first_);
  v616 = (void *)objc_opt_new();
  v85 = 0x1E0CB3000uLL;
  std::map<std::string,std::string>::map[abi:ne180100]((uint64_t)&v692, (const void ***)(v51 + 184));
  v86 = v692.__r_.__value_.__r.__words[0];
  if ((std::string::size_type *)v692.__r_.__value_.__l.__data_ != &v692.__r_.__value_.__r.__words[1])
  {
    do
    {
      std::pair<std::string const,std::string>::pair[abi:ne180100]((std::string *)&v680, (__int128 *)(v86 + 32));
      if (SHIBYTE(v680.__end_) >= 0)
        v87 = &v680;
      else
        v87 = v680.__first_;
      objc_msgSend(*(id *)(v85 + 2368), "stringWithUTF8String:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v681) >= 0)
        p_end_cap = &v680.__end_cap_;
      else
        p_end_cap = v680.__end_cap_.__value_;
      objc_msgSend(*(id *)(v85 + 2368), "stringWithUTF8String:", p_end_cap);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v616, "setObject:forKey:", v90, v88);

      if (SHIBYTE(v681) < 0)
        operator delete(v680.__end_cap_.__value_);
      v85 = 0x1E0CB3000;
      if (SHIBYTE(v680.__end_) < 0)
        operator delete(v680.__first_);
      v91 = *(std::string **)(v86 + 8);
      if (v91)
      {
        do
        {
          v92 = v91;
          v91 = (std::string *)v91->__r_.__value_.__r.__words[0];
        }
        while (v91);
      }
      else
      {
        do
        {
          v92 = *(std::string **)(v86 + 16);
          v75 = v92->__r_.__value_.__r.__words[0] == v86;
          v86 = (std::string::size_type)v92;
        }
        while (!v75);
      }
      v86 = (std::string::size_type)v92;
    }
    while (v92 != (std::string *)&v692.__r_.__value_.__r.__words[1]);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((_QWORD *)v692.__r_.__value_.__l.__size_);
  -[PatternExecutionResult setMeta:](v619, "setMeta:", v616);
  p_buf = &buf;
  if (*(char *)(v51 + 135) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v680, *(const std::string::value_type **)(v51 + 112), *(_QWORD *)(v51 + 120));
  }
  else
  {
    *(_OWORD *)&v680.__first_ = *v80;
    v680.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 128);
  }
  siri::dialogengine::PatternFactory::Create((uint64_t)&v680, (uint64_t)&v657);
  if (SHIBYTE(v680.__end_) < 0)
    operator delete(v680.__first_);
  v94 = v657;
  if (v657)
  {
    v95 = (std::__shared_weak_count *)v663.n128_u64[1];
    if (v663.n128_u64[1])
    {
      v96 = (unint64_t *)(v663.n128_u64[1] + 8);
      do
        v97 = __ldxr(v96);
      while (__stxr(v97 + 1, v96));
      std::shared_ptr<siri::dialogengine::PatternSchemaUsage>::operator=[abi:ne180100](v94 + 1, v51, (uint64_t)v95);
      p_shared_owners = (unint64_t *)&v95->__shared_owners_;
      do
        v99 = __ldaxr(p_shared_owners);
      while (__stlxr(v99 - 1, p_shared_owners));
      if (!v99)
      {
        ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
        std::__shared_weak_count::__release_weak(v95);
      }
    }
    else
    {
      std::shared_ptr<siri::dialogengine::PatternSchemaUsage>::operator=[abi:ne180100](v657 + 1, v51, 0);
    }
    v102 = v657;
    std::shared_ptr<siri::dialogengine::PatternSchemaUsage>::operator=[abi:ne180100](v657 + 3, (uint64_t)v661, (uint64_t)v662);
    std::shared_ptr<siri::dialogengine::PatternSchemaUsage>::operator=[abi:ne180100](v102 + 5, (uint64_t)v659, (uint64_t)v660);
    if (v102 + 10 != &v664)
      std::vector<siri::dialogengine::UpdatableDir>::__assign_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>((uint64_t)(v102 + 10), v664, *(std::string **)v665, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)v665 - (_QWORD)v664) >> 5));
    v103 = (siri::dialogengine::PatternFile *)v663.n128_u64[0];
    if (*(char *)(v663.n128_u64[0] + 135) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v680, *(const std::string::value_type **)(v663.n128_u64[0] + 112), *(_QWORD *)(v663.n128_u64[0] + 120));
    }
    else
    {
      *(_OWORD *)&v680.__first_ = *(_OWORD *)(v663.n128_u64[0] + 112);
      v680.__end_ = *(std::__split_buffer<std::string>::pointer *)(v663.n128_u64[0] + 128);
    }
    siri::dialogengine::PatternRegistry::GetSchema((uint64_t *)&buf, (const std::string::value_type **)&v680, (uint64_t *)&v655);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    if (v655)
    {
      siri::dialogengine::PatternSchema::GetSettings(v655, (uint64_t)&v692);
      v104 = v692.__r_.__value_.__r.__words[0];
      if ((std::string::size_type *)v692.__r_.__value_.__l.__data_ != &v692.__r_.__value_.__r.__words[1])
      {
        do
        {
          std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100]((std::string *)&v680, (__int128 *)(v104 + 32));
          if (!v680.__end_cap_.__value_[9].__r_.__value_.__s.__data_[17])
          {
            v110 = v657[5];
            v111 = std::__tree<std::string>::find<std::string>(v110 + 72, (const void **)&v680.__first_);
            if (v110 + 80 != v111)
            {
              v113 = *(_QWORD *)(v111 + 56);
              v112 = *(std::__shared_weak_count **)(v111 + 64);
              if (v112)
              {
                v114 = (unint64_t *)&v112->__shared_owners_;
                do
                  v115 = __ldxr(v114);
                while (__stxr(v115 + 1, v114));
                do
                  v116 = __ldaxr(v114);
                while (__stlxr(v116 - 1, v114));
                if (!v116)
                {
                  ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
                  std::__shared_weak_count::__release_weak(v112);
                }
              }
              if (v113)
              {
                std::operator+<char>();
                v117 = std::string::append((std::string *)v674, "' cannot be overridden. Ignoring runtime value.");
                v118 = *(_OWORD *)&v117->__r_.__value_.__l.__data_;
                *(_QWORD *)&__str[16] = *((_QWORD *)&v117->__r_.__value_.__l + 2);
                *(_OWORD *)__str = v118;
                v117->__r_.__value_.__l.__size_ = 0;
                v117->__r_.__value_.__r.__words[2] = 0;
                v117->__r_.__value_.__r.__words[0] = 0;
                siri::dialogengine::Log::LogWithLevel((uint64_t)__str, 1u);
                if ((__str[23] & 0x80000000) != 0)
                  operator delete(*(void **)__str);
                if ((v674[23] & 0x80000000) != 0)
                  operator delete(*(void **)v674);
                siri::dialogengine::VariableObject::RemoveProperty(v657[5], (const void **)&v680.__first_);
              }
            }
          }
          value = v680.__end_cap_.__value_;
          if (v680.__end_cap_.__value_)
          {
            v106 = (unint64_t *)((char *)v680.__end_cap_.__value_ + 8);
            do
              v107 = __ldaxr(v106);
            while (__stlxr(v107 - 1, v106));
            if (!v107)
            {
              (*(void (**)(std::allocator<std::string> *))(*(_QWORD *)value + 16))(value);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)value);
            }
          }
          if (SHIBYTE(v680.__end_) < 0)
            operator delete(v680.__first_);
          v108 = *(std::string **)(v104 + 8);
          if (v108)
          {
            do
            {
              v109 = v108;
              v108 = (std::string *)v108->__r_.__value_.__r.__words[0];
            }
            while (v108);
          }
          else
          {
            do
            {
              v109 = *(std::string **)(v104 + 16);
              v75 = v109->__r_.__value_.__r.__words[0] == v104;
              v104 = (std::string::size_type)v109;
            }
            while (!v75);
          }
          v104 = (std::string::size_type)v109;
        }
        while (v109 != (std::string *)&v692.__r_.__value_.__r.__words[1]);
        v103 = (siri::dialogengine::PatternFile *)v663.n128_u64[0];
      }
      std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((_QWORD *)v692.__r_.__value_.__l.__size_);
    }
    siri::dialogengine::PatternFile::GetSettingsAsVariables(v103, (uint64_t)&v692);
    v119 = v692.__r_.__value_.__r.__words[0];
    if ((std::string::size_type *)v692.__r_.__value_.__l.__data_ != &v692.__r_.__value_.__r.__words[1])
    {
      do
      {
        std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100]((std::string *)&v680, (__int128 *)(v119 + 32));
        v120 = v657[5];
        v121 = std::__tree<std::string>::find<std::string>(v120 + 72, (const void **)&v680.__first_);
        if (v120 + 80 == v121)
        {
          if (v680.__end_cap_.__value_)
            goto LABEL_216;
        }
        else
        {
          v122 = *(_QWORD *)(v121 + 56);
          v123 = *(std::__shared_weak_count **)(v121 + 64);
          if (v123)
          {
            v124 = (unint64_t *)&v123->__shared_owners_;
            do
              v125 = __ldxr(v124);
            while (__stxr(v125 + 1, v124));
          }
          if (v122)
          {
            if (v123)
            {
              v126 = (unint64_t *)&v123->__shared_owners_;
              do
                v127 = __ldaxr(v126);
              while (__stlxr(v127 - 1, v126));
              if (!v127)
              {
                ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
                std::__shared_weak_count::__release_weak(v123);
              }
            }
            goto LABEL_217;
          }
          v128 = v680.__end_cap_.__value_;
          if (!v123)
            goto LABEL_215;
          v129 = (unint64_t *)&v123->__shared_owners_;
          do
            v130 = __ldaxr(v129);
          while (__stlxr(v130 - 1, v129));
          if (v130)
          {
LABEL_215:
            if (!v128)
              goto LABEL_217;
LABEL_216:
            siri::dialogengine::ExecutePatternBase::AddParameter((uint64_t)v657, (uint64_t *)&v680.__end_cap_);
            goto LABEL_217;
          }
          ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
          std::__shared_weak_count::__release_weak(v123);
          if (v128)
            goto LABEL_216;
        }
LABEL_217:
        v131 = v680.__end_cap_.__value_;
        if (v680.__end_cap_.__value_)
        {
          v132 = (unint64_t *)((char *)v680.__end_cap_.__value_ + 8);
          do
            v133 = __ldaxr(v132);
          while (__stlxr(v133 - 1, v132));
          if (!v133)
          {
            (*(void (**)(std::allocator<std::string> *))(*(_QWORD *)v131 + 16))(v131);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v131);
          }
        }
        if (SHIBYTE(v680.__end_) < 0)
          operator delete(v680.__first_);
        v134 = *(std::string **)(v119 + 8);
        if (v134)
        {
          do
          {
            v135 = v134;
            v134 = (std::string *)v134->__r_.__value_.__r.__words[0];
          }
          while (v134);
        }
        else
        {
          do
          {
            v135 = *(std::string **)(v119 + 16);
            v75 = v135->__r_.__value_.__r.__words[0] == v119;
            v119 = (std::string::size_type)v135;
          }
          while (!v75);
        }
        v119 = (std::string::size_type)v135;
      }
      while (v135 != (std::string *)&v692.__r_.__value_.__r.__words[1]);
    }
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((_QWORD *)v692.__r_.__value_.__l.__size_);
    (*(void (**)(_QWORD **__return_ptr))(*v657 + 16))(&v653);
    v136 = (uint64_t **)operator new(0x70uLL);
    v136[1] = 0;
    v136[2] = 0;
    *v136 = (uint64_t *)&off_1E792D178;
    siri::dialogengine::PatternContext::PatternContext((siri::dialogengine::PatternContext *)(v136 + 3));
    v651 = v136 + 3;
    v652 = (std::__shared_weak_count *)v136;
    siri::dialogengine::PatternFile::GetSettingsAsVariables((siri::dialogengine::PatternFile *)v663.n128_u64[0], (uint64_t)&v680);
    siri::dialogengine::PatternContext::AddPatternSettings(v136 + 3, (const char *)&v680);
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v680.__begin_->__r_.__value_.__r.__words);
    memset(&v650, 0, sizeof(v650));
    v137 = v653;
    for (i = v654; v137 != i; v137 += 7)
    {
      v139 = *v137;
      if (*(char *)(*v137 + 87) < 0)
        std::string::__init_copy_ctor_external(&v692, *(const std::string::value_type **)(v139 + 64), *(_QWORD *)(v139 + 72));
      else
        v692 = *(std::string *)(v139 + 64);
      end = v650.__end_;
      if (v650.__end_ >= v650.__end_cap_.__value_)
      {
        v10 = (std::string *)&buf;
        v142 = 0xAAAAAAAAAAAAAAABLL * (((char *)v650.__end_ - (char *)v650.__begin_) >> 3);
        v143 = v142 + 1;
        if (v142 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<BOOL>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (((char *)v650.__end_cap_.__value_ - (char *)v650.__begin_) >> 3) > v143)
          v143 = 0x5555555555555556 * (((char *)v650.__end_cap_.__value_ - (char *)v650.__begin_) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v650.__end_cap_.__value_ - (char *)v650.__begin_) >> 3) >= 0x555555555555555)
          v144 = 0xAAAAAAAAAAAAAAALL;
        else
          v144 = v143;
        v680.__end_cap_.__value_ = (std::allocator<std::string> *)&v650.__end_cap_;
        if (v144)
          v145 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v650.__end_cap_, v144);
        else
          v145 = 0;
        v146 = v145 + v142;
        v680.__first_ = v145;
        v680.__begin_ = v146;
        v680.__end_cap_.__value_ = &v145[v144];
        v147 = *(_OWORD *)&v692.__r_.__value_.__l.__data_;
        v146->__r_.__value_.__r.__words[2] = v692.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v146->__r_.__value_.__l.__data_ = v147;
        memset(&v692, 0, sizeof(v692));
        v680.__end_ = v146 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v650, &v680);
        v148 = v650.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&v680);
        v650.__end_ = v148;
        p_buf = &buf;
        if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v692.__r_.__value_.__l.__data_);
      }
      else
      {
        v141 = *(_OWORD *)&v692.__r_.__value_.__l.__data_;
        v650.__end_->__r_.__value_.__r.__words[2] = v692.__r_.__value_.__r.__words[2];
        *(_OWORD *)&end->__r_.__value_.__l.__data_ = v141;
        v650.__end_ = end + 1;
      }
    }
    std::string::basic_string[abi:ne180100]<0>(&v680, ", ");
    siri::dialogengine::StringJoinInternal<std::vector<std::string>>((uint64_t)v648, (uint64_t)v650.__begin_, (uint64_t)v650.__end_, (uint64_t)&v680);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    v150 = v648;
    if (v649 < 0)
      v150 = (void **)v648[0];
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Effective group names from pattern execute: %s", v149, v150);
    v646 = 0uLL;
    v647 = 0;
    v644 = 0uLL;
    v645 = 0;
    v151 = v653;
    v609 = v654;
    if (v653 != v654)
    {
      v607 = (std::string *)*MEMORY[0x1E0DE4F50];
      v603 = *(std::string **)(MEMORY[0x1E0DE4F50] + 64);
      v592 = *(std::string **)(MEMORY[0x1E0DE4F50] + 72);
      v590 = CATIsSpotlight & a9;
      v591 = (std::string *)(MEMORY[0x1E0DE4FB8] + 16);
      while (1)
      {
        v152 = *v151;
        if (*(char *)(*v151 + 87) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v674, *(const std::string::value_type **)(v152 + 64), *(_QWORD *)(v152 + 72));
        }
        else
        {
          *(_OWORD *)v674 = *(_OWORD *)(v152 + 64);
          *(_QWORD *)&v674[16] = *(_QWORD *)(v152 + 80);
        }
        std::operator+<char>();
        v153 = std::string::append(&v643, "' in pattern '");
        v154 = *(_OWORD *)&v153->__r_.__value_.__l.__data_;
        *(_QWORD *)&__str[16] = *((_QWORD *)&v153->__r_.__value_.__l + 2);
        *(_OWORD *)__str = v154;
        v153->__r_.__value_.__l.__size_ = 0;
        v153->__r_.__value_.__r.__words[2] = 0;
        v153->__r_.__value_.__r.__words[0] = 0;
        v155 = v663.n128_u64[0];
        v156 = (std::string *)(v663.n128_u64[0] + 64);
        if (*(char *)(v663.n128_u64[0] + 87) < 0)
        {
          std::string::__init_copy_ctor_external(&v642, *(const std::string::value_type **)(v663.n128_u64[0] + 64), *(_QWORD *)(v663.n128_u64[0] + 72));
        }
        else
        {
          *(_OWORD *)&v642.__r_.__value_.__l.__data_ = *(_OWORD *)&v156->__r_.__value_.__l.__data_;
          v642.__r_.__value_.__r.__words[2] = *(_QWORD *)(v663.n128_u64[0] + 80);
        }
        if ((v642.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v157 = &v642;
        else
          v157 = (std::string *)v642.__r_.__value_.__r.__words[0];
        if ((v642.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v158 = HIBYTE(v642.__r_.__value_.__r.__words[2]);
        else
          v158 = v642.__r_.__value_.__l.__size_;
        v159 = std::string::append((std::string *)__str, (const std::string::value_type *)v157, v158);
        v160 = *(_OWORD *)&v159->__r_.__value_.__l.__data_;
        v692.__r_.__value_.__r.__words[2] = v159->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v692.__r_.__value_.__l.__data_ = v160;
        v159->__r_.__value_.__l.__size_ = 0;
        v159->__r_.__value_.__r.__words[2] = 0;
        v159->__r_.__value_.__r.__words[0] = 0;
        v161 = std::string::append(&v692, "'");
        v162 = *(_OWORD *)&v161->__r_.__value_.__l.__data_;
        v680.__end_ = (std::__split_buffer<std::string>::pointer)v161->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v680.__first_ = v162;
        v161->__r_.__value_.__l.__size_ = 0;
        v161->__r_.__value_.__r.__words[2] = 0;
        v161->__r_.__value_.__r.__words[0] = 0;
        siri::dialogengine::Log::LogWithLevel((uint64_t)&v680, 0);
        if (SHIBYTE(v680.__end_) < 0)
          operator delete(v680.__first_);
        if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v692.__r_.__value_.__l.__data_);
        if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v642.__r_.__value_.__l.__data_);
        if ((__str[23] & 0x80000000) != 0)
          operator delete(*(void **)__str);
        if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v643.__r_.__value_.__l.__data_);
        v163 = *v151;
        v164 = (std::__shared_weak_count *)v151[1];
        v640 = *v151;
        v641 = v164;
        if (v164)
        {
          v165 = (unint64_t *)&v164->__shared_owners_;
          do
            v166 = __ldxr(v165);
          while (__stxr(v166 + 1, v165));
        }
        v167 = v655;
        v638 = v655;
        v639 = v656;
        if (v656)
        {
          v168 = (unint64_t *)&v656->__shared_owners_;
          do
            v169 = __ldxr(v168);
          while (__stxr(v169 + 1, v168));
        }
        if (*(char *)(v155 + 87) < 0)
        {
          std::string::__init_copy_ctor_external(&v643, *(const std::string::value_type **)(v155 + 64), *(_QWORD *)(v155 + 72));
          v163 = v640;
          v167 = v638;
        }
        else
        {
          v643 = *v156;
        }
        v170 = 0;
        if (v163)
        {
          if (v167)
            break;
        }
LABEL_399:
        if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v643.__r_.__value_.__l.__data_);
        v212 = v639;
        if (v639)
        {
          v213 = (unint64_t *)&v639->__shared_owners_;
          do
            v214 = __ldaxr(v213);
          while (__stlxr(v214 - 1, v213));
          if (!v214)
          {
            ((void (*)(std::__shared_weak_count *))v212->__on_zero_shared)(v212);
            std::__shared_weak_count::__release_weak(v212);
          }
        }
        v215 = v641;
        if (!v641)
          goto LABEL_410;
        v216 = (unint64_t *)&v641->__shared_owners_;
        do
          v217 = __ldaxr(v216);
        while (__stlxr(v217 - 1, v216));
        if (!v217)
        {
          ((void (*)(std::__shared_weak_count *))v215->__on_zero_shared)(v215);
          std::__shared_weak_count::__release_weak(v215);
          if ((v170 & 1) == 0)
          {
LABEL_413:
            v219 = v151[2];
            if (v219)
              v220 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v219 + 32))(v219) ^ 1;
            else
              v220 = 0;
            v221 = v151[6];
            v222 = v612;
            v224 = v222;
            if (v221)
              v225 = 1;
            else
              v225 = v220;
            if (v225 == 1)
            {
              v226 = v674;
              if (v674[23] < 0)
                v226 = *(_BYTE **)v674;
              siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Group '%s' has parameter modifications. Don't try to use cached CAT results.", v223, v226);
              v228 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v224);
              if (v220)
              {
                std::map<std::string,std::shared_ptr<siri::dialogengine::Variable>>::map[abi:ne180100]((uint64_t)&v680, (const void ***)(v151[2] + 72));
                v10 = v680.__first_;
                if ((std::__split_buffer<std::string>::pointer *)v680.__first_ != &v680.__begin_)
                {
                  do
                  {
                    v229 = v10[2].__r_.__value_.__l.__size_;
                    if (v229)
                    {
                      v692.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E792D118;
                      *(_OWORD *)&v692.__r_.__value_.__r.__words[1] = 0uLL;
                      (*(void (**)(std::string::size_type, std::string *))(*(_QWORD *)v229 + 16))(v229, &v692);
                      v230 = (id)v692.__r_.__value_.__r.__words[2];
                      v231 = (id)v692.__r_.__value_.__l.__size_;
                      objc_msgSend(v228, "setObject:forKey:", v230, v231);

                    }
                    v232 = (std::__split_buffer<std::string> *)v10->__r_.__value_.__l.__size_;
                    if (v232)
                    {
                      do
                      {
                        v233 = v232;
                        v232 = (std::__split_buffer<std::string> *)v232->__first_;
                      }
                      while (v232);
                    }
                    else
                    {
                      do
                      {
                        v233 = (std::__split_buffer<std::string> *)v10->__r_.__value_.__r.__words[2];
                        v75 = v233->__first_ == v10;
                        v10 = (std::string *)v233;
                      }
                      while (!v75);
                    }
                    v10 = (std::string *)v233;
                  }
                  while (v233 != (std::__split_buffer<std::string> *)&v680.__begin_);
                }
                std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v680.__begin_->__r_.__value_.__r.__words);
              }
              if (v221)
              {
                v234 = (_QWORD *)v151[4];
                if (v234 != v151 + 5)
                {
                  do
                  {
                    v235 = v234 + 4;
                    v236 = v234 + 4;
                    if (*((char *)v234 + 55) < 0)
                      v236 = (_QWORD *)*v235;
                    v237 = v674;
                    if (v674[23] < 0)
                      v237 = *(_BYTE **)v674;
                    siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Deleting parameter '%s' (if it exists) for group '%s'", v227, v236, v237);
                    if (*((char *)v234 + 55) < 0)
                      v235 = (_QWORD *)*v235;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v235);
                    v238 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v228, "removeObjectForKey:", v238);

                    v239 = (_QWORD *)v234[1];
                    if (v239)
                    {
                      do
                      {
                        v240 = v239;
                        v239 = (_QWORD *)*v239;
                      }
                      while (v239);
                    }
                    else
                    {
                      do
                      {
                        v240 = (_QWORD *)v234[2];
                        v75 = *v240 == (_QWORD)v234;
                        v234 = v240;
                      }
                      while (!v75);
                    }
                    v234 = v240;
                  }
                  while (v240 != v151 + 5);
                }
              }
              v241 = v228;

            }
            else
            {
              v241 = v222;
            }
            v242 = *v151;
            if (*(char *)(*v151 + 111) < 0)
              std::string::__init_copy_ctor_external(&v692, *(const std::string::value_type **)(v242 + 88), *(_QWORD *)(v242 + 96));
            else
              v692 = *(std::string *)(v242 + 88);
            if (v590)
            {
LABEL_453:
              v243 = 0;
              goto LABEL_454;
            }
            v245 = HIBYTE(v692.__r_.__value_.__r.__words[2]);
            if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v245 = v692.__r_.__value_.__l.__size_;
            if (!v245)
            {
              std::operator+<char>();
              v254 = std::string::append(&v642, "' in pattern '");
              v255 = *(_OWORD *)&v254->__r_.__value_.__l.__data_;
              v643.__r_.__value_.__r.__words[2] = v254->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v643.__r_.__value_.__l.__data_ = v255;
              v254->__r_.__value_.__l.__size_ = 0;
              v254->__r_.__value_.__r.__words[2] = 0;
              v254->__r_.__value_.__r.__words[0] = 0;
              if (*(char *)(v663.n128_u64[0] + 87) < 0)
                std::string::__init_copy_ctor_external(&v637, *(const std::string::value_type **)(v663.n128_u64[0] + 64), *(_QWORD *)(v663.n128_u64[0] + 72));
              else
                v637 = *(std::string *)(v663.n128_u64[0] + 64);
              if ((v637.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v319 = &v637;
              else
                v319 = (std::string *)v637.__r_.__value_.__r.__words[0];
              if ((v637.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v320 = HIBYTE(v637.__r_.__value_.__r.__words[2]);
              else
                v320 = v637.__r_.__value_.__l.__size_;
              v321 = std::string::append(&v643, (const std::string::value_type *)v319, v320);
              v322 = *(_OWORD *)&v321->__r_.__value_.__l.__data_;
              *(_QWORD *)&__str[16] = *((_QWORD *)&v321->__r_.__value_.__l + 2);
              *(_OWORD *)__str = v322;
              v321->__r_.__value_.__l.__size_ = 0;
              v321->__r_.__value_.__r.__words[2] = 0;
              v321->__r_.__value_.__r.__words[0] = 0;
              v323 = std::string::append((std::string *)__str, "'");
              v324 = *(_OWORD *)&v323->__r_.__value_.__l.__data_;
              v680.__end_ = (std::__split_buffer<std::string>::pointer)v323->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v680.__first_ = v324;
              v323->__r_.__value_.__l.__size_ = 0;
              v323->__r_.__value_.__r.__words[2] = 0;
              v323->__r_.__value_.__r.__words[0] = 0;
              siri::dialogengine::Log::LogWithLevel((uint64_t)&v680, 0);
              if (SHIBYTE(v680.__end_) < 0)
                operator delete(v680.__first_);
              if ((__str[23] & 0x80000000) != 0)
                operator delete(*(void **)__str);
              if (SHIBYTE(v637.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v637.__r_.__value_.__l.__data_);
              if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v643.__r_.__value_.__l.__data_);
              if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v642.__r_.__value_.__l.__data_);
              goto LABEL_453;
            }
            if ((v225 & 1) != 0)
            {
              v243 = 0;
              goto LABEL_699;
            }
            siri::dialogengine::PatternContext::FindPatternCacheEntry((uint64_t)v651, (const void **)&v692.__r_.__value_.__l.__data_, 0, (std::string *)&v680);
            if (SHIBYTE(v680.__end_) >= 0)
              begin = (std::__split_buffer<std::string>::pointer)HIBYTE(v680.__end_);
            else
              begin = v680.__begin_;
            if (begin)
            {
              v274 = [DEResult alloc];
              if (SHIBYTE(v680.__end_) >= 0)
                v275 = &v680;
              else
                v275 = v680.__first_;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v275);
              v276 = (void *)objc_claimAutoreleasedReturnValue();
              v243 = -[DEResult initFromJson:](v274, "initFromJson:", v276);

              v278 = &v692;
              if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v278 = (std::string *)v692.__r_.__value_.__r.__words[0];
              v279 = v674;
              if (v674[23] < 0)
                v279 = *(_BYTE **)v674;
              v280 = &v669;
              if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v280 = (std::string *)v669.__r_.__value_.__r.__words[0];
              siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Using cached result for dialog CAT '%s' for group '%s' in pattern '%s'", v277, v278, v279, v280);
            }
            else
            {
              v363 = &v692;
              if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v363 = (std::string *)v692.__r_.__value_.__r.__words[0];
              v364 = v674;
              if (v674[23] < 0)
                v364 = *(_BYTE **)v674;
              v365 = &v669;
              if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v365 = (std::string *)v669.__r_.__value_.__r.__words[0];
              v243 = 0;
              siri::dialogengine::Log::Info((siri::dialogengine::Log *)"No cached result found for dialog CAT '%s' for group '%s' in pattern '%s'", v272, v363, v364, v365);
            }
            if (SHIBYTE(v680.__end_) < 0)
            {
              operator delete(v680.__first_);
              if (!begin)
                goto LABEL_699;
              goto LABEL_454;
            }
            if (begin)
              goto LABEL_454;
LABEL_699:
            std::operator+<char>();
            v366 = std::string::append(&v636, "' for group '");
            v367 = *(_OWORD *)&v366->__r_.__value_.__l.__data_;
            v637.__r_.__value_.__r.__words[2] = v366->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v637.__r_.__value_.__l.__data_ = v367;
            v366->__r_.__value_.__l.__size_ = 0;
            v366->__r_.__value_.__r.__words[2] = 0;
            v366->__r_.__value_.__r.__words[0] = 0;
            if (v674[23] >= 0)
              v368 = v674;
            else
              v368 = *(const std::string::value_type **)v674;
            if (v674[23] >= 0)
              v369 = v674[23];
            else
              v369 = *(_QWORD *)&v674[8];
            v370 = std::string::append(&v637, v368, v369);
            v371 = *(_OWORD *)&v370->__r_.__value_.__l.__data_;
            v642.__r_.__value_.__r.__words[2] = v370->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v642.__r_.__value_.__l.__data_ = v371;
            v370->__r_.__value_.__l.__size_ = 0;
            v370->__r_.__value_.__r.__words[2] = 0;
            v370->__r_.__value_.__r.__words[0] = 0;
            v372 = std::string::append(&v642, "' in pattern '");
            v373 = *(_OWORD *)&v372->__r_.__value_.__l.__data_;
            v643.__r_.__value_.__r.__words[2] = v372->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v643.__r_.__value_.__l.__data_ = v373;
            v372->__r_.__value_.__l.__size_ = 0;
            v372->__r_.__value_.__r.__words[2] = 0;
            v372->__r_.__value_.__r.__words[0] = 0;
            if (*(char *)(v663.n128_u64[0] + 87) < 0)
              std::string::__init_copy_ctor_external(&v635, *(const std::string::value_type **)(v663.n128_u64[0] + 64), *(_QWORD *)(v663.n128_u64[0] + 72));
            else
              v635 = *(std::string *)(v663.n128_u64[0] + 64);
            if ((v635.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v374 = &v635;
            else
              v374 = (std::string *)v635.__r_.__value_.__r.__words[0];
            if ((v635.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v375 = HIBYTE(v635.__r_.__value_.__r.__words[2]);
            else
              v375 = v635.__r_.__value_.__l.__size_;
            v376 = std::string::append(&v643, (const std::string::value_type *)v374, v375);
            v377 = *(_OWORD *)&v376->__r_.__value_.__l.__data_;
            *(_QWORD *)&__str[16] = *((_QWORD *)&v376->__r_.__value_.__l + 2);
            *(_OWORD *)__str = v377;
            v376->__r_.__value_.__l.__size_ = 0;
            v376->__r_.__value_.__r.__words[2] = 0;
            v376->__r_.__value_.__r.__words[0] = 0;
            v378 = std::string::append((std::string *)__str, "'");
            v379 = *(_OWORD *)&v378->__r_.__value_.__l.__data_;
            v680.__end_ = (std::__split_buffer<std::string>::pointer)v378->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v680.__first_ = v379;
            v378->__r_.__value_.__l.__size_ = 0;
            v378->__r_.__value_.__r.__words[2] = 0;
            v378->__r_.__value_.__r.__words[0] = 0;
            siri::dialogengine::Log::LogWithLevel((uint64_t)&v680, 0);
            if (SHIBYTE(v680.__end_) < 0)
              operator delete(v680.__first_);
            if ((__str[23] & 0x80000000) != 0)
              operator delete(*(void **)__str);
            if (SHIBYTE(v635.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v635.__r_.__value_.__l.__data_);
            if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v643.__r_.__value_.__l.__data_);
            if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v642.__r_.__value_.__l.__data_);
            if (SHIBYTE(v637.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v637.__r_.__value_.__l.__data_);
            if (SHIBYTE(v636.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v636.__r_.__value_.__l.__data_);
            if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v634, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
            else
              v634 = __s;
            if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v633, v692.__r_.__value_.__l.__data_, v692.__r_.__value_.__l.__size_);
            else
              v633 = v692;
            if (SHIBYTE(v669.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v632, v669.__r_.__value_.__l.__data_, v669.__r_.__value_.__l.__size_);
            else
              v632 = v669;
            v630 = (uint64_t)v651;
            v631 = v652;
            if (v652)
            {
              v380 = (unint64_t *)&v652->__shared_owners_;
              do
                v381 = __ldxr(v380);
              while (__stxr(v381 + 1, v380));
            }
            v629 = 0;
            LODWORD(v588) = a9;
            +[CATPattern executeCAT:templateDir:catId:patternId:requestType:parameters:globals:patternContext:callback:options:error:](CATPattern, "executeCAT:templateDir:catId:patternId:requestType:parameters:globals:patternContext:callback:options:error:", v606, &v634, &v633, &v632, 0, v241, v615, &v630, v598, v588, &v629);
            v318 = (void *)objc_claimAutoreleasedReturnValue();
            v317 = v629;

            v382 = v631;
            if (v631)
            {
              v383 = (unint64_t *)&v631->__shared_owners_;
              do
                v384 = __ldaxr(v383);
              while (__stlxr(v384 - 1, v383));
              if (!v384)
              {
                ((void (*)(std::__shared_weak_count *))v382->__on_zero_shared)(v382);
                std::__shared_weak_count::__release_weak(v382);
              }
            }
            if (SHIBYTE(v632.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v632.__r_.__value_.__l.__data_);
            if (SHIBYTE(v633.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v633.__r_.__value_.__l.__data_);
            if (SHIBYTE(v634.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(v634.__r_.__value_.__l.__data_);
              if (!v317)
                goto LABEL_771;
LABEL_751:
              LogPatternExecutionResult(v619);
              std::operator+<char>();
              v385 = std::string::append(&v637, "' for group '");
              v386 = *(_OWORD *)&v385->__r_.__value_.__l.__data_;
              v642.__r_.__value_.__r.__words[2] = v385->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v642.__r_.__value_.__l.__data_ = v386;
              v385->__r_.__value_.__l.__size_ = 0;
              v385->__r_.__value_.__r.__words[2] = 0;
              v385->__r_.__value_.__r.__words[0] = 0;
              if (v674[23] >= 0)
                v387 = v674;
              else
                v387 = *(const std::string::value_type **)v674;
              if (v674[23] >= 0)
                v388 = v674[23];
              else
                v388 = *(_QWORD *)&v674[8];
              v389 = std::string::append(&v642, v387, v388);
              v390 = *(_OWORD *)&v389->__r_.__value_.__l.__data_;
              v643.__r_.__value_.__r.__words[2] = v389->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v643.__r_.__value_.__l.__data_ = v390;
              v389->__r_.__value_.__l.__size_ = 0;
              v389->__r_.__value_.__r.__words[2] = 0;
              v389->__r_.__value_.__r.__words[0] = 0;
              v391 = std::string::append(&v643, "': ");
              v392 = *(_OWORD *)&v391->__r_.__value_.__l.__data_;
              *(_QWORD *)&__str[16] = *((_QWORD *)&v391->__r_.__value_.__l + 2);
              *(_OWORD *)__str = v392;
              v391->__r_.__value_.__l.__size_ = 0;
              v391->__r_.__value_.__r.__words[2] = 0;
              v391->__r_.__value_.__r.__words[0] = 0;
              objc_msgSend(v317, "localizedDescription");
              v393 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v394 = std::string::append((std::string *)__str, (const std::string::value_type *)objc_msgSend(v393, "UTF8String"));
              v395 = *(_OWORD *)&v394->__r_.__value_.__l.__data_;
              v680.__end_ = (std::__split_buffer<std::string>::pointer)v394->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v680.__first_ = v395;
              v394->__r_.__value_.__l.__size_ = 0;
              v394->__r_.__value_.__r.__words[2] = 0;
              v394->__r_.__value_.__r.__words[0] = 0;

              if ((__str[23] & 0x80000000) != 0)
                operator delete(*(void **)__str);
              if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v643.__r_.__value_.__l.__data_);
              if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v642.__r_.__value_.__l.__data_);
              if (SHIBYTE(v637.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v637.__r_.__value_.__l.__data_);
              std::string::basic_string[abi:ne180100]<0>(__str, "request-error");
              NSErrorFromString((uint64_t *)&v680, (uint64_t *)__str);
              v396 = (void *)objc_claimAutoreleasedReturnValue();
              v601[2](v601, v619, v396);

              if ((__str[23] & 0x80000000) != 0)
                operator delete(*(void **)__str);
              if (SHIBYTE(v680.__end_) < 0)
                operator delete(v680.__first_);
              v218 = 1;
            }
            else
            {
              if (v317)
                goto LABEL_751;
LABEL_771:
              if ((v225 & 1) == 0)
              {
                v397 = &v692;
                if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v397 = (std::string *)v692.__r_.__value_.__r.__words[0];
                siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Caching result for dialog CAT '%s'", v223, v397);
                v398 = (uint64_t)v651;
                objc_msgSend(v318, "json");
                v399 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                std::string::basic_string[abi:ne180100]<0>(&v680, (char *)objc_msgSend(v399, "UTF8String"));
                siri::dialogengine::PatternContext::AddEntryToPatternCache(v398, (uint64_t)&v692, (uint64_t)&v680, 0);
                if (SHIBYTE(v680.__end_) < 0)
                  operator delete(v680.__first_);

              }
              v243 = v318;
LABEL_454:
              v244 = *v151;
              if (*(char *)(*v151 + 135) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v244 + 112), *(_QWORD *)(v244 + 120));
              }
              else
              {
                *(_OWORD *)__str = *(_OWORD *)(v244 + 112);
                *(_QWORD *)&__str[16] = *(_QWORD *)(v244 + 128);
              }
              v246 = __str[23];
              v247 = __str[23];
              if (__str[23] < 0)
                v246 = *(_QWORD *)&__str[8];
              if (!v246)
              {
                std::operator+<char>();
                v251 = std::string::append(&v637, "' in pattern '");
                v252 = *(_OWORD *)&v251->__r_.__value_.__l.__data_;
                v642.__r_.__value_.__r.__words[2] = v251->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v642.__r_.__value_.__l.__data_ = v252;
                v251->__r_.__value_.__l.__size_ = 0;
                v251->__r_.__value_.__r.__words[2] = 0;
                v251->__r_.__value_.__r.__words[0] = 0;
                if (*(char *)(v663.n128_u64[0] + 87) < 0)
                  std::string::__init_copy_ctor_external(&v636, *(const std::string::value_type **)(v663.n128_u64[0] + 64), *(_QWORD *)(v663.n128_u64[0] + 72));
                else
                  v636 = *(std::string *)(v663.n128_u64[0] + 64);
                if ((v636.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v265 = &v636;
                else
                  v265 = (std::string *)v636.__r_.__value_.__r.__words[0];
                if ((v636.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v266 = HIBYTE(v636.__r_.__value_.__r.__words[2]);
                else
                  v266 = v636.__r_.__value_.__l.__size_;
                v267 = std::string::append(&v642, (const std::string::value_type *)v265, v266);
                v268 = *(_OWORD *)&v267->__r_.__value_.__l.__data_;
                v643.__r_.__value_.__r.__words[2] = v267->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v643.__r_.__value_.__l.__data_ = v268;
                v267->__r_.__value_.__l.__size_ = 0;
                v267->__r_.__value_.__r.__words[2] = 0;
                v267->__r_.__value_.__r.__words[0] = 0;
                v269 = std::string::append(&v643, "'");
                v270 = *(_OWORD *)&v269->__r_.__value_.__l.__data_;
                v680.__end_ = (std::__split_buffer<std::string>::pointer)v269->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v680.__first_ = v270;
                v269->__r_.__value_.__l.__size_ = 0;
                v269->__r_.__value_.__r.__words[2] = 0;
                v269->__r_.__value_.__r.__words[0] = 0;
                siri::dialogengine::Log::LogWithLevel((uint64_t)&v680, 0);
                if (SHIBYTE(v680.__end_) < 0)
                  operator delete(v680.__first_);
                if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v643.__r_.__value_.__l.__data_);
                if (SHIBYTE(v636.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v636.__r_.__value_.__l.__data_);
                if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v642.__r_.__value_.__l.__data_);
                if (SHIBYTE(v637.__r_.__value_.__r.__words[2]) < 0)
                {
                  v271 = (std::__split_buffer<std::string>::pointer)v637.__r_.__value_.__r.__words[0];
                  goto LABEL_528;
                }
LABEL_529:
                v253 = 0;
                goto LABEL_530;
              }
              if (v613 == 1)
              {
                v248 = *(_BYTE **)__str;
                v249 = v674[23];
                v250 = *(_BYTE **)v674;
                if (*(char *)(v663.n128_u64[0] + 87) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)&v680, *(const std::string::value_type **)(v663.n128_u64[0] + 64), *(_QWORD *)(v663.n128_u64[0] + 72));
                }
                else
                {
                  *(_OWORD *)&v680.__first_ = *(_OWORD *)(v663.n128_u64[0] + 64);
                  v680.__end_ = *(std::__split_buffer<std::string>::pointer *)(v663.n128_u64[0] + 80);
                }
                v281 = v674;
                if (v249 < 0)
                  v281 = v250;
                v282 = __str;
                if (v247 < 0)
                  v282 = v248;
                v283 = &v680;
                if (SHIBYTE(v680.__end_) < 0)
                  v283 = v680.__first_;
                siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Skipping visual CAT '%s' for group '%s' in pattern '%s' because response mode is 'voiceOnly'", v223, v282, v281, v283);
                if (SHIBYTE(v680.__end_) < 0)
                {
                  v271 = v680.__first_;
LABEL_528:
                  operator delete(v271);
                }
                goto LABEL_529;
              }
              if ((v225 & 1) != 0)
              {
                v253 = 0;
                goto LABEL_609;
              }
              siri::dialogengine::PatternContext::FindPatternCacheEntry((uint64_t)v651, (const void **)__str, 1, (std::string *)&v680);
              if (SHIBYTE(v680.__end_) >= 0)
                v257 = (std::__split_buffer<std::string>::pointer)HIBYTE(v680.__end_);
              else
                v257 = v680.__begin_;
              if (v257)
              {
                v258 = [DEResult alloc];
                if (SHIBYTE(v680.__end_) >= 0)
                  v259 = &v680;
                else
                  v259 = v680.__first_;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v259);
                v260 = (void *)objc_claimAutoreleasedReturnValue();
                v253 = -[DEResult initFromJson:](v258, "initFromJson:", v260);

                v262 = __str;
                if (__str[23] < 0)
                  v262 = *(_BYTE **)__str;
                v263 = v674;
                if (v674[23] < 0)
                  v263 = *(_BYTE **)v674;
                v264 = &v669;
                if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v264 = (std::string *)v669.__r_.__value_.__r.__words[0];
                siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Using cached result for visual CAT '%s' for group '%s' in pattern '%s'", v261, v262, v263, v264);
              }
              else
              {
                v325 = __str;
                if (__str[23] < 0)
                  v325 = *(_BYTE **)__str;
                v326 = v674;
                if (v674[23] < 0)
                  v326 = *(_BYTE **)v674;
                v327 = &v669;
                if ((v669.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v327 = (std::string *)v669.__r_.__value_.__r.__words[0];
                v253 = 0;
                siri::dialogengine::Log::Info((siri::dialogengine::Log *)"No cached result found for visual CAT '%s' for group '%s' in pattern '%s'", v256, v325, v326, v327);
              }
              if (SHIBYTE(v680.__end_) < 0)
              {
                operator delete(v680.__first_);
                if (!v257)
                  goto LABEL_609;
                goto LABEL_530;
              }
              if (v257)
                goto LABEL_530;
LABEL_609:
              std::operator+<char>();
              v328 = std::string::append(&v635, "' for group '");
              v329 = *(_OWORD *)&v328->__r_.__value_.__l.__data_;
              v636.__r_.__value_.__r.__words[2] = v328->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v636.__r_.__value_.__l.__data_ = v329;
              v328->__r_.__value_.__l.__size_ = 0;
              v328->__r_.__value_.__r.__words[2] = 0;
              v328->__r_.__value_.__r.__words[0] = 0;
              if (v674[23] >= 0)
                v330 = v674;
              else
                v330 = *(const std::string::value_type **)v674;
              if (v674[23] >= 0)
                v331 = v674[23];
              else
                v331 = *(_QWORD *)&v674[8];
              v332 = std::string::append(&v636, v330, v331);
              v333 = *(_OWORD *)&v332->__r_.__value_.__l.__data_;
              v637.__r_.__value_.__r.__words[2] = v332->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v637.__r_.__value_.__l.__data_ = v333;
              v332->__r_.__value_.__l.__size_ = 0;
              v332->__r_.__value_.__r.__words[2] = 0;
              v332->__r_.__value_.__r.__words[0] = 0;
              v334 = std::string::append(&v637, "' in pattern '");
              v335 = *(_OWORD *)&v334->__r_.__value_.__l.__data_;
              v642.__r_.__value_.__r.__words[2] = v334->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v642.__r_.__value_.__l.__data_ = v335;
              v334->__r_.__value_.__l.__size_ = 0;
              v334->__r_.__value_.__r.__words[2] = 0;
              v334->__r_.__value_.__r.__words[0] = 0;
              if (*(char *)(v663.n128_u64[0] + 87) < 0)
                std::string::__init_copy_ctor_external(&v628, *(const std::string::value_type **)(v663.n128_u64[0] + 64), *(_QWORD *)(v663.n128_u64[0] + 72));
              else
                v628 = *(std::string *)(v663.n128_u64[0] + 64);
              if ((v628.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v336 = &v628;
              else
                v336 = (std::string *)v628.__r_.__value_.__r.__words[0];
              if ((v628.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v337 = HIBYTE(v628.__r_.__value_.__r.__words[2]);
              else
                v337 = v628.__r_.__value_.__l.__size_;
              v338 = std::string::append(&v642, (const std::string::value_type *)v336, v337);
              v339 = *(_OWORD *)&v338->__r_.__value_.__l.__data_;
              v643.__r_.__value_.__r.__words[2] = v338->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v643.__r_.__value_.__l.__data_ = v339;
              v338->__r_.__value_.__l.__size_ = 0;
              v338->__r_.__value_.__r.__words[2] = 0;
              v338->__r_.__value_.__r.__words[0] = 0;
              v340 = std::string::append(&v643, "'");
              v341 = *(_OWORD *)&v340->__r_.__value_.__l.__data_;
              v680.__end_ = (std::__split_buffer<std::string>::pointer)v340->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v680.__first_ = v341;
              v340->__r_.__value_.__l.__size_ = 0;
              v340->__r_.__value_.__r.__words[2] = 0;
              v340->__r_.__value_.__r.__words[0] = 0;
              siri::dialogengine::Log::LogWithLevel((uint64_t)&v680, 0);
              if (SHIBYTE(v680.__end_) < 0)
                operator delete(v680.__first_);
              if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v643.__r_.__value_.__l.__data_);
              if (SHIBYTE(v628.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v628.__r_.__value_.__l.__data_);
              if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v642.__r_.__value_.__l.__data_);
              if (SHIBYTE(v637.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v637.__r_.__value_.__l.__data_);
              if (SHIBYTE(v636.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v636.__r_.__value_.__l.__data_);
              if (SHIBYTE(v635.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v635.__r_.__value_.__l.__data_);
              if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
                std::string::__init_copy_ctor_external(&v627, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
              else
                v627 = __s;
              if ((__str[23] & 0x80000000) != 0)
                std::string::__init_copy_ctor_external(&v626, *(const std::string::value_type **)__str, *(std::string::size_type *)&__str[8]);
              else
                v626 = *(std::string *)__str;
              if (SHIBYTE(v669.__r_.__value_.__r.__words[2]) < 0)
                std::string::__init_copy_ctor_external(&v625, v669.__r_.__value_.__l.__data_, v669.__r_.__value_.__l.__size_);
              else
                v625 = v669;
              v623 = (uint64_t)v651;
              v624 = v652;
              if (v652)
              {
                v342 = (unint64_t *)&v652->__shared_owners_;
                do
                  v343 = __ldxr(v342);
                while (__stxr(v343 + 1, v342));
              }
              v622 = 0;
              LODWORD(v588) = a9;
              +[CATPattern executeCAT:templateDir:catId:patternId:requestType:parameters:globals:patternContext:callback:options:error:](CATPattern, "executeCAT:templateDir:catId:patternId:requestType:parameters:globals:patternContext:callback:options:error:", v606, &v627, &v626, &v625, 1, v241, v615, &v623, v598, v588, &v622);
              v317 = (id)objc_claimAutoreleasedReturnValue();
              v10 = (std::string *)v622;

              v345 = v624;
              if (v624)
              {
                v346 = (unint64_t *)&v624->__shared_owners_;
                do
                  v347 = __ldaxr(v346);
                while (__stlxr(v347 - 1, v346));
                if (!v347)
                {
                  ((void (*)(std::__shared_weak_count *))v345->__on_zero_shared)(v345);
                  std::__shared_weak_count::__release_weak(v345);
                }
              }
              if (SHIBYTE(v625.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v625.__r_.__value_.__l.__data_);
              if (SHIBYTE(v626.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v626.__r_.__value_.__l.__data_);
              if (SHIBYTE(v627.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v627.__r_.__value_.__l.__data_);
                if (!v10)
                  goto LABEL_681;
LABEL_661:
                LogPatternExecutionResult(v619);
                std::operator+<char>();
                v348 = std::string::append(&v636, "' for group '");
                v349 = *(_OWORD *)&v348->__r_.__value_.__l.__data_;
                v637.__r_.__value_.__r.__words[2] = v348->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v637.__r_.__value_.__l.__data_ = v349;
                v348->__r_.__value_.__l.__size_ = 0;
                v348->__r_.__value_.__r.__words[2] = 0;
                v348->__r_.__value_.__r.__words[0] = 0;
                if (v674[23] >= 0)
                  v350 = v674;
                else
                  v350 = *(const std::string::value_type **)v674;
                if (v674[23] >= 0)
                  v351 = v674[23];
                else
                  v351 = *(_QWORD *)&v674[8];
                v352 = std::string::append(&v637, v350, v351);
                v353 = *(_OWORD *)&v352->__r_.__value_.__l.__data_;
                v642.__r_.__value_.__r.__words[2] = v352->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v642.__r_.__value_.__l.__data_ = v353;
                v352->__r_.__value_.__l.__size_ = 0;
                v352->__r_.__value_.__r.__words[2] = 0;
                v352->__r_.__value_.__r.__words[0] = 0;
                v354 = std::string::append(&v642, "': ");
                v355 = *(_OWORD *)&v354->__r_.__value_.__l.__data_;
                v643.__r_.__value_.__r.__words[2] = v354->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v643.__r_.__value_.__l.__data_ = v355;
                v354->__r_.__value_.__l.__size_ = 0;
                v354->__r_.__value_.__r.__words[2] = 0;
                v354->__r_.__value_.__r.__words[0] = 0;
                unk_1EF58C170(v10, "localizedDescription");
                v356 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v357 = std::string::append(&v643, (const std::string::value_type *)objc_msgSend(v356, "UTF8String"));
                v358 = *(_OWORD *)&v357->__r_.__value_.__l.__data_;
                v680.__end_ = (std::__split_buffer<std::string>::pointer)v357->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v680.__first_ = v358;
                v357->__r_.__value_.__l.__size_ = 0;
                v357->__r_.__value_.__r.__words[2] = 0;
                v357->__r_.__value_.__r.__words[0] = 0;

                if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v643.__r_.__value_.__l.__data_);
                if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v642.__r_.__value_.__l.__data_);
                if (SHIBYTE(v637.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v637.__r_.__value_.__l.__data_);
                if (SHIBYTE(v636.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v636.__r_.__value_.__l.__data_);
                std::string::basic_string[abi:ne180100]<0>(&v643, "request-error");
                NSErrorFromString((uint64_t *)&v680, (uint64_t *)&v643);
                v359 = (void *)objc_claimAutoreleasedReturnValue();
                v601[2](v601, v619, v359);

                if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v643.__r_.__value_.__l.__data_);
                if (SHIBYTE(v680.__end_) < 0)
                  operator delete(v680.__first_);
                v218 = 1;
              }
              else
              {
                if (v10)
                  goto LABEL_661;
LABEL_681:
                if ((v225 & 1) == 0)
                {
                  v360 = __str;
                  if (__str[23] < 0)
                    v360 = *(_BYTE **)__str;
                  siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Caching result for visual CAT '%s'", v344, v360);
                  v361 = (uint64_t)v651;
                  objc_msgSend(v317, "json");
                  v362 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  std::string::basic_string[abi:ne180100]<0>(&v680, (char *)objc_msgSend(v362, "UTF8String"));
                  siri::dialogengine::PatternContext::AddEntryToPatternCache(v361, (uint64_t)__str, (uint64_t)&v680, 1);
                  if (SHIBYTE(v680.__end_) < 0)
                    operator delete(v680.__first_);

                }
                v253 = v317;
LABEL_530:
                if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v284 = &v692;
                else
                  v284 = (std::string *)v692.__r_.__value_.__r.__words[0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v284);
                v285 = (void *)objc_claimAutoreleasedReturnValue();
                +[CATCommonApi DEResultToCATResult:catId:](CATCommonApi, "DEResultToCATResult:catId:", v243, v285);
                v286 = objc_claimAutoreleasedReturnValue();
                v287 = v286;
                v288 = v646.i64[1];
                if (v646.i64[1] >= (unint64_t)v647)
                {
                  v290 = (v646.i64[1] - v646.i64[0]) >> 3;
                  if ((unint64_t)(v290 + 1) >> 61)
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  v291 = ((uint64_t)v647 - v646.i64[0]) >> 2;
                  if (v291 <= v290 + 1)
                    v291 = v290 + 1;
                  if ((unint64_t)v647 - v646.i64[0] >= 0x7FFFFFFFFFFFFFF8)
                    v292 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v292 = v291;
                  v680.__end_cap_.__value_ = (std::allocator<std::string> *)&v647;
                  if (v292)
                    v292 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<morphun::dialog::SemanticFeatureConceptBase *>>(v292);
                  else
                    v293 = 0;
                  v294 = v292 + 8 * v290;
                  v295 = (std::string *)(v292 + 8 * v293);
                  v680.__end_cap_.__value_ = v295;
                  *(_QWORD *)v294 = v287;
                  v289 = (std::__split_buffer<std::string>::pointer)(v294 + 8);
                  v680.__end_ = (std::__split_buffer<std::string>::pointer)(v294 + 8);
                  v296 = (_QWORD *)v646.i64[1];
                  v297 = (_QWORD *)v646.i64[0];
                  if (v646.i64[1] == v646.i64[0])
                  {
                    v299 = vdupq_n_s64(v646.u64[1]);
                  }
                  else
                  {
                    do
                    {
                      v298 = *--v296;
                      *v296 = 0;
                      *(_QWORD *)(v294 - 8) = v298;
                      v294 -= 8;
                    }
                    while (v296 != v297);
                    v299 = v646;
                    v289 = v680.__end_;
                    v295 = v680.__end_cap_.__value_;
                  }
                  v646.i64[0] = v294;
                  v646.i64[1] = (uint64_t)v289;
                  *(int64x2_t *)&v680.__begin_ = v299;
                  v300 = v647;
                  v647 = v295;
                  v680.__end_cap_.__value_ = v300;
                  v680.__first_ = (std::__split_buffer<std::string>::pointer)v299.i64[0];
                  std::__split_buffer<CATResult * {__strong}>::~__split_buffer((uint64_t)&v680);
                }
                else
                {
                  *(_QWORD *)v646.i64[1] = v286;
                  v289 = (std::__split_buffer<std::string>::pointer)(v288 + 8);
                }
                v646.i64[1] = (uint64_t)v289;

                if (__str[23] >= 0)
                  v301 = __str;
                else
                  v301 = *(_BYTE **)__str;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v301);
                v10 = (std::string *)objc_claimAutoreleasedReturnValue();
                +[CATCommonApi DEResultToCATResult:catId:](CATCommonApi, "DEResultToCATResult:catId:", v253, v10);
                v302 = objc_claimAutoreleasedReturnValue();
                v303 = v302;
                v304 = v644.i64[1];
                if (v644.i64[1] >= (unint64_t)v645)
                {
                  v306 = (v644.i64[1] - v644.i64[0]) >> 3;
                  if ((unint64_t)(v306 + 1) >> 61)
                    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                  v307 = ((uint64_t)v645 - v644.i64[0]) >> 2;
                  if (v307 <= v306 + 1)
                    v307 = v306 + 1;
                  if ((unint64_t)v645 - v644.i64[0] >= 0x7FFFFFFFFFFFFFF8)
                    v308 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v308 = v307;
                  v680.__end_cap_.__value_ = (std::allocator<std::string> *)&v645;
                  if (v308)
                    v308 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<morphun::dialog::SemanticFeatureConceptBase *>>(v308);
                  else
                    v309 = 0;
                  v310 = v308 + 8 * v306;
                  v311 = (std::string *)(v308 + 8 * v309);
                  v680.__end_cap_.__value_ = v311;
                  *(_QWORD *)v310 = v303;
                  v305 = (std::__split_buffer<std::string>::pointer)(v310 + 8);
                  v680.__end_ = (std::__split_buffer<std::string>::pointer)(v310 + 8);
                  v312 = (_QWORD *)v644.i64[1];
                  v313 = (_QWORD *)v644.i64[0];
                  if (v644.i64[1] == v644.i64[0])
                  {
                    v315 = vdupq_n_s64(v644.u64[1]);
                  }
                  else
                  {
                    do
                    {
                      v314 = *--v312;
                      *v312 = 0;
                      *(_QWORD *)(v310 - 8) = v314;
                      v310 -= 8;
                    }
                    while (v312 != v313);
                    v315 = v644;
                    v305 = v680.__end_;
                    v311 = v680.__end_cap_.__value_;
                  }
                  v644.i64[0] = v310;
                  v644.i64[1] = (uint64_t)v305;
                  *(int64x2_t *)&v680.__begin_ = v315;
                  v316 = v645;
                  v645 = v311;
                  v680.__end_cap_.__value_ = v316;
                  v680.__first_ = (std::__split_buffer<std::string>::pointer)v315.i64[0];
                  std::__split_buffer<CATResult * {__strong}>::~__split_buffer((uint64_t)&v680);
                }
                else
                {
                  *(_QWORD *)v644.i64[1] = v302;
                  v305 = (std::__split_buffer<std::string>::pointer)(v304 + 8);
                }
                v218 = 0;
                v644.i64[1] = (uint64_t)v305;
                v317 = v253;
              }

              if ((__str[23] & 0x80000000) != 0)
                operator delete(*(void **)__str);
              v318 = v243;
            }

            if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v692.__r_.__value_.__l.__data_);

            goto LABEL_575;
          }
        }
        else
        {
LABEL_410:
          if ((v170 & 1) == 0)
            goto LABEL_413;
        }
        v218 = 11;
LABEL_575:
        if ((v674[23] & 0x80000000) != 0)
          operator delete(*(void **)v674);
        if (v218 != 11 && v218)
          goto LABEL_1002;
        v151 += 7;
        if (v151 == v609)
        {
          p_buf = &buf;
          if (v654 != v653)
          {
            v400 = 0;
            do
            {
              v401 = *(void **)(v646.i64[0] + 8 * v400);
              v610 = v400;
              v402 = *(void **)(v644.i64[0] + 8 * v400);
              v620 = v619;
              v403 = v401;
              v404 = v402;
              v405 = (void *)MEMORY[0x1E0C99E08];
              v617 = v404;
              objc_msgSend(v404, "meta");
              v406 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v405, "dictionaryWithDictionary:", v406);
              v407 = (void *)objc_claimAutoreleasedReturnValue();

              v678 = 0u;
              v679 = 0u;
              memset(__str, 0, sizeof(__str));
              objc_msgSend(v617, "meta");
              v408 = (void *)objc_claimAutoreleasedReturnValue();
              v409 = objc_msgSend(v408, "countByEnumeratingWithState:objects:count:", __str, &v680, 16);
              if (v409)
              {
                v410 = **(_QWORD **)&__str[16];
                do
                {
                  for (j = 0; j != v409; ++j)
                  {
                    if (**(_QWORD **)&__str[16] != v410)
                      objc_enumerationMutation(v408);
                    v412 = *(void **)(*(_QWORD *)&__str[8] + 8 * j);
                    objc_msgSend(v403, "meta");
                    v10 = (std::string *)objc_claimAutoreleasedReturnValue();
                    unk_1EF58C178(v10, "objectForKey:", v412);
                    v413 = (void *)objc_claimAutoreleasedReturnValue();
                    v414 = v413 == 0;

                    if (!v414)
                    {
                      v415 = objc_msgSend(objc_retainAutorelease(v412), "UTF8String");
                      siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern result meta conflict, visual and dialog result meta both contain key '%s'", v416, v415);
                    }
                  }
                  v409 = objc_msgSend(v408, "countByEnumeratingWithState:objects:count:", __str, &v680, 16);
                }
                while (v409);
              }

              objc_msgSend(v403, "meta");
              v417 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v407, "addEntriesFromDictionary:", v417);

              v675 = 0u;
              v676 = 0u;
              memset(v674, 0, sizeof(v674));
              -[PatternExecutionResult meta](v620, "meta");
              v418 = (void *)objc_claimAutoreleasedReturnValue();
              v419 = objc_msgSend(v418, "countByEnumeratingWithState:objects:count:", v674, &v692, 16);
              if (v419)
              {
                v420 = **(_QWORD **)&v674[16];
                do
                {
                  for (k = 0; k != v419; ++k)
                  {
                    if (**(_QWORD **)&v674[16] != v420)
                      objc_enumerationMutation(v418);
                    v422 = *(void **)(*(_QWORD *)&v674[8] + 8 * k);
                    objc_msgSend(v407, "objectForKey:", v422);
                    v423 = (void *)objc_claimAutoreleasedReturnValue();
                    v424 = v423 == 0;

                    if (!v424)
                    {
                      v425 = objc_msgSend(objc_retainAutorelease(v422), "UTF8String");
                      siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern result meta conflict, visual/dialog result meta conflicts with pattern meta key '%s'", v426, v425);
                    }
                  }
                  v419 = objc_msgSend(v418, "countByEnumeratingWithState:objects:count:", v674, &v692, 16);
                }
                while (v419);
              }

              -[PatternExecutionResult meta](v620, "meta");
              v427 = (void *)objc_claimAutoreleasedReturnValue();
              v428 = v427 == 0;

              if (!v428)
              {
                -[PatternExecutionResult meta](v620, "meta");
                v429 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "addEntriesFromDictionary:", v429);

              }
              -[PatternExecutionResult setMeta:](v620, "setMeta:", v407);

              v400 = v610 + 1;
              v430 = v653;
              p_buf = &buf;
            }
            while (v610 + 1 < (unint64_t)(0x6DB6DB6DB6DB6DB7 * (v654 - v653)));
            if (v654 != v653)
            {
              v431 = 0;
              v432 = 0;
              do
              {
                objc_msgSend(*(id *)(v644.i64[0] + 8 * v432), "visualResponse");
                v433 = (void *)objc_claimAutoreleasedReturnValue();
                v434 = v430[v431];
                if (*(char *)(v434 + 207) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)&v680, *(const std::string::value_type **)(v434 + 184), *(_QWORD *)(v434 + 192));
                }
                else
                {
                  *(_OWORD *)&v680.__first_ = *(_OWORD *)(v434 + 184);
                  v680.__end_ = *(std::__split_buffer<std::string>::pointer *)(v434 + 200);
                }
                AppendVisualResultToPatternExecutionResult(v620, v433, (uint64_t)&v680);
                if (SHIBYTE(v680.__end_) < 0)
                  operator delete(v680.__first_);

                ++v432;
                v430 = v653;
                v431 += 7;
                p_buf = &buf;
              }
              while (v432 < 0x6DB6DB6DB6DB6DB7 * (v654 - v653));
            }
          }
          goto LABEL_809;
        }
      }
      std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v680);
      v171 = (uint64_t)v638;
      if (*(char *)(v640 + 87) < 0)
        std::string::__init_copy_ctor_external(&v692, *(const std::string::value_type **)(v640 + 64), *(_QWORD *)(v640 + 72));
      else
        v692 = *(std::string *)(v640 + 64);
      siri::dialogengine::PatternSchema::GetGroup(v171, (uint64_t)&v692, &v642);
      if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v692.__r_.__value_.__l.__data_);
      if (!v642.__r_.__value_.__r.__words[0])
      {
        std::string::basic_string[abi:ne180100]<0>(&v692, "");
        std::string::operator=(&v687, &v692);
        std::stringbuf::__init_buf_ptrs[abi:ne180100]((uint64_t)&v680.__end_cap_);
        if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v692.__r_.__value_.__l.__data_);
        v174 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v680.__end_, (uint64_t)"Group '", 7);
        if (*(char *)(v640 + 87) < 0)
          std::string::__init_copy_ctor_external(&v692, *(const std::string::value_type **)(v640 + 64), *(_QWORD *)(v640 + 72));
        else
          v692 = *(std::string *)(v640 + 64);
        if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v190 = &v692;
        else
          v190 = (std::string *)v692.__r_.__value_.__r.__words[0];
        if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v191 = HIBYTE(v692.__r_.__value_.__r.__words[2]);
        else
          v191 = v692.__r_.__value_.__l.__size_;
        v192 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v174, (uint64_t)v190, v191);
        v193 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v192, (uint64_t)"' in pattern '", 14);
        if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v194 = &v643;
        else
          v194 = (std::string *)v643.__r_.__value_.__r.__words[0];
        if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v195 = HIBYTE(v643.__r_.__value_.__r.__words[2]);
        else
          v195 = v643.__r_.__value_.__l.__size_;
        v196 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v193, (uint64_t)v194, v195);
        v197 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v196, (uint64_t)"' is not defined in the schema '", 32);
        if (*((char *)v638 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)v638, *((_QWORD *)v638 + 1));
        }
        else
        {
          v198 = *(_OWORD *)v638;
          *(_QWORD *)&__str[16] = *((_QWORD *)v638 + 2);
          *(_OWORD *)__str = v198;
        }
        if (__str[23] >= 0)
          v199 = __str;
        else
          v199 = *(_BYTE **)__str;
        if (__str[23] >= 0)
          v200 = __str[23];
        else
          v200 = *(_QWORD *)&__str[8];
        v201 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v197, (uint64_t)v199, v200);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v201, (uint64_t)"'", 1);
        if ((__str[23] & 0x80000000) != 0)
          operator delete(*(void **)__str);
        if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v692.__r_.__value_.__l.__data_);
        std::stringbuf::str();
        siri::dialogengine::Log::LogWithLevel((uint64_t)&v692, 1u);
        if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v692.__r_.__value_.__l.__data_);
        v170 = 0;
        goto LABEL_391;
      }
      (*(void (**)(std::string *__return_ptr))(*(_QWORD *)v642.__r_.__value_.__l.__data_ + 96))(&v692);
      v172 = HIBYTE(v692.__r_.__value_.__r.__words[2]);
      if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v172 = v692.__r_.__value_.__l.__size_;
      if (!v172)
        goto LABEL_341;
      std::string::basic_string[abi:ne180100]<0>(__str, "");
      std::string::operator=(&v687, (const std::string *)__str);
      std::stringbuf::__init_buf_ptrs[abi:ne180100]((uint64_t)&v680.__end_cap_);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);
      v173 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v680.__end_, (uint64_t)"Group '", 7);
      if (*(char *)(v640 + 87) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v640 + 64), *(_QWORD *)(v640 + 72));
      }
      else
      {
        *(_OWORD *)__str = *(_OWORD *)(v640 + 64);
        *(_QWORD *)&__str[16] = *(_QWORD *)(v640 + 80);
      }
      if (__str[23] >= 0)
        v175 = __str;
      else
        v175 = *(_BYTE **)__str;
      if (__str[23] >= 0)
        v176 = __str[23];
      else
        v176 = *(_QWORD *)&__str[8];
      v177 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v173, (uint64_t)v175, v176);
      v178 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v177, (uint64_t)"' in pattern '", 14);
      if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v179 = &v643;
      else
        v179 = (std::string *)v643.__r_.__value_.__r.__words[0];
      if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v180 = HIBYTE(v643.__r_.__value_.__r.__words[2]);
      else
        v180 = v643.__r_.__value_.__l.__size_;
      v181 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v178, (uint64_t)v179, v180);
      v182 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v181, (uint64_t)"' is deprecated: ", 17);
      if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v183 = &v692;
      else
        v183 = (std::string *)v692.__r_.__value_.__r.__words[0];
      if ((v692.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v184 = HIBYTE(v692.__r_.__value_.__r.__words[2]);
      else
        v184 = v692.__r_.__value_.__l.__size_;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v182, (uint64_t)v183, v184);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);
      std::stringbuf::str();
      siri::dialogengine::Log::LogWithLevel((uint64_t)__str, 1u);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);
      (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)v642.__r_.__value_.__l.__data_ + 104))(__str);
      if ((__str[23] & 0x80000000) != 0)
      {
        v185 = *(_QWORD *)&__str[8];
        operator delete(*(void **)__str);
        if (!v185)
          goto LABEL_341;
      }
      else if (!__str[23])
      {
        goto LABEL_341;
      }
      v186 = v650.__begin_;
      v187 = v650.__end_;
      (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)v642.__r_.__value_.__l.__data_ + 104))(__str);
      v188 = (std::string *)std::__find_impl[abi:ne180100]<std::string *,std::string *,std::string,std::__identity>((uint64_t)v186, (uint64_t)v187, (unsigned __int8 **)__str);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);
      if (v188 != v650.__end_)
      {
        std::string::basic_string[abi:ne180100]<0>(__str, "");
        std::string::operator=(&v687, (const std::string *)__str);
        std::stringbuf::__init_buf_ptrs[abi:ne180100]((uint64_t)&v680.__end_cap_);
        if ((__str[23] & 0x80000000) != 0)
          operator delete(*(void **)__str);
        v189 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v680.__end_, (uint64_t)"Skipping deprecated group '", 27);
        if (*(char *)(v640 + 87) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v640 + 64), *(_QWORD *)(v640 + 72));
        }
        else
        {
          *(_OWORD *)__str = *(_OWORD *)(v640 + 64);
          *(_QWORD *)&__str[16] = *(_QWORD *)(v640 + 80);
        }
        if (__str[23] >= 0)
          v202 = __str;
        else
          v202 = *(_BYTE **)__str;
        if (__str[23] >= 0)
          v203 = __str[23];
        else
          v203 = *(_QWORD *)&__str[8];
        v204 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v189, (uint64_t)v202, v203);
        v205 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v204, (uint64_t)"' in pattern '", 14);
        if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v206 = &v643;
        else
          v206 = (std::string *)v643.__r_.__value_.__r.__words[0];
        if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v207 = HIBYTE(v643.__r_.__value_.__r.__words[2]);
        else
          v207 = v643.__r_.__value_.__l.__size_;
        v208 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v205, (uint64_t)v206, v207);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v208, (uint64_t)"' because its replacement is also active", 40);
        if ((__str[23] & 0x80000000) != 0)
          operator delete(*(void **)__str);
        std::stringbuf::str();
        siri::dialogengine::Log::LogWithLevel((uint64_t)__str, 0);
        if ((__str[23] & 0x80000000) != 0)
          operator delete(*(void **)__str);
        v170 = 1;
        goto LABEL_389;
      }
LABEL_341:
      v170 = 0;
LABEL_389:
      if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v692.__r_.__value_.__l.__data_);
LABEL_391:
      v209 = (std::__shared_weak_count *)v642.__r_.__value_.__l.__size_;
      if (v642.__r_.__value_.__l.__size_)
      {
        v210 = (unint64_t *)(v642.__r_.__value_.__l.__size_ + 8);
        do
          v211 = __ldaxr(v210);
        while (__stlxr(v211 - 1, v210));
        if (!v211)
        {
          ((void (*)(std::__shared_weak_count *))v209->__on_zero_shared)(v209);
          std::__shared_weak_count::__release_weak(v209);
        }
      }
      v680.__first_ = v607;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v680.__first_ + v607[-1].__r_.__value_.__r.__words[0]) = v603;
      v680.__end_ = v592;
      v680.__end_cap_.__value_ = v591;
      if (SHIBYTE(v687.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v687.__r_.__value_.__l.__data_);
      std::streambuf::~streambuf();
      std::iostream::~basic_iostream();
      MEMORY[0x1C3B8D80C](v689);
      goto LABEL_399;
    }
LABEL_809:
    v435 = v663.n128_u64[0];
    std::string::basic_string[abi:ne180100]<0>(&v692, "printSupportingDialogInDisplayModes");
    siri::dialogengine::PatternFile::GetSetting(v435, (const void **)&v692.__r_.__value_.__l.__data_, (std::string *)&v680);
    v611 = siri::dialogengine::StringToBool((const std::string *)&v680);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v692.__r_.__value_.__l.__data_);
    v436 = (siri::dialogengine *)v615;
    siri::dialogengine::ExtractUserSettings(v436, (NSDictionary *)1, (uint64_t)&v680);
    std::string::basic_string[abi:ne180100]<0>(&v692, "alwaysDisplayDialog");
    v437 = std::__tree<std::string>::find<std::string>((uint64_t)&v680, (const void **)&v692.__r_.__value_.__l.__data_);
    if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v692.__r_.__value_.__l.__data_);
    if (&v680.__begin_ == (std::__split_buffer<std::string>::pointer *)v437)
    {
      v605 = 0;
    }
    else
    {
      if (*(char *)(v437 + 79) < 0)
        std::string::__init_copy_ctor_external(&v692, *(const std::string::value_type **)(v437 + 56), *(_QWORD *)(v437 + 64));
      else
        v692 = *(std::string *)(v437 + 56);
      v605 = siri::dialogengine::StringToBool(&v692);
      if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v692.__r_.__value_.__l.__data_);
    }
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v680.__begin_->__r_.__value_.__r.__words);

    -[PatternExecutionResult visual](v619, "visual");
    v441 = (id)objc_claimAutoreleasedReturnValue();
    if (v441)
    {
      SnippetUI::Response::Response((SnippetUI::Response *)&v680);
      objc_msgSend(v441, "base64EncodedStringWithOptions:", 0);
      v442 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__str, (char *)objc_msgSend(v442, "UTF8String"));
      siri::dialogengine::DecodeBase64((std::string::size_type)__str, &v692);
      google::protobuf::MessageLite::ParseFromString(&v680, &v692);
      if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v692.__r_.__value_.__l.__data_);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);

      memset(__str, 0, 24);
      google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<SnippetUI::Response_Section>::TypeHandler>((int **)__str, (uint64_t)&v680.__end_);
      if (*(int *)&__str[8] < 1)
      {
LABEL_839:
        v608 = 0;
      }
      else
      {
        v443 = 0;
        while (1)
        {
          v444 = (const SnippetUI::Response_Section *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<SnippetUI::Response_Section>::TypeHandler>((uint64_t)__str, v443);
          SnippetUI::Response_Section::Response_Section((SnippetUI::Response_Section *)&v692, v444);
          memset(v674, 0, 24);
          google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<SnippetUI::Response_Component>::TypeHandler>((int **)v674, (uint64_t)&v692.__r_.__value_.__r.__words[2]);
          v445 = *(_DWORD *)&v674[8];
          google::protobuf::RepeatedPtrField<siri::dialogengine::SchemaBinary::Value>::~RepeatedPtrField((google::protobuf::internal::RepeatedPtrFieldBase *)v674);
          SnippetUI::Response_Section::~Response_Section((SnippetUI::Response_Section *)&v692);
          if (v445 > 0)
            break;
          if (++v443 >= *(int *)&__str[8])
            goto LABEL_839;
        }
        v608 = 1;
      }
      google::protobuf::RepeatedPtrField<siri::dialogengine::SchemaBinary::Value>::~RepeatedPtrField((google::protobuf::internal::RepeatedPtrFieldBase *)__str);
      SnippetUI::Response::~Response((SnippetUI::Response *)&v680);
    }
    else
    {
      v608 = 0;
    }

    v447 = v653;
    if (v654 != v653)
    {
      v448 = 0;
      v449 = v611 ^ 1;
      if (v613 - 3 > 1)
        v449 = 1;
      v604 = v608 & v449 & ~v605;
      while (1)
      {
        siri::dialogengine::CATResultDialogFilterAdapter::CATResultDialogFilterAdapter((siri::dialogengine::CATResultDialogFilterAdapter *)&v680, *(CATResult **)(v646.i64[0] + 8 * v448));
        v618 = v448;
        v450 = &v447[7 * v448];
        v451 = *v450;
        if (*(char *)(*v450 + 87) < 0)
          std::string::__init_copy_ctor_external(&v692, *(const std::string::value_type **)(v451 + 64), *(_QWORD *)(v451 + 72));
        else
          v692 = *(std::string *)(v451 + 64);
        siri::dialogengine::FilterDialogForModeAndSettings((uint64_t *)&v680, v613, v605, v611, v608, (uint64_t)&v692);
        if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v692.__r_.__value_.__l.__data_);
        v452 = *(void **)(v646.i64[0] + 8 * v448);
        v453 = *v450;
        if (*(char *)(*v450 + 183) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v674, *(const std::string::value_type **)(v453 + 160), *(_QWORD *)(v453 + 168));
        }
        else
        {
          *(_OWORD *)v674 = *(_OWORD *)(v453 + 160);
          *(_QWORD *)&v674[16] = *(_QWORD *)(v453 + 176);
        }
        v454 = *v450;
        if (*(char *)(*v450 + 87) < 0)
          std::string::__init_copy_ctor_external(&v643, *(const std::string::value_type **)(v454 + 64), *(_QWORD *)(v454 + 72));
        else
          v643 = *(std::string *)(v454 + 64);
        v455 = v619;
        v457 = v452;
        v458 = &v643;
        if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v458 = (std::string *)v643.__r_.__value_.__r.__words[0];
        siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Appending dialog for group '%s' to pattern execution result", v456, v458);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v604);
        v621 = (std::string *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v457, "speak");
        v459 = (void *)objc_claimAutoreleasedReturnValue();
        v460 = objc_msgSend(v459, "count");

        if (v460)
          break;
LABEL_896:
        v517 = &v643;
        if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v517 = (std::string *)v643.__r_.__value_.__r.__words[0];
        siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Done appending dialog for group '%s'", v461, v517);

        if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v643.__r_.__value_.__l.__data_);
        if ((v674[23] & 0x80000000) != 0)
          operator delete(*(void **)v674);

        v448 = v618 + 1;
        v447 = v653;
        if (v618 + 1 >= (unint64_t)(0x6DB6DB6DB6DB6DB7 * (v654 - v653)))
        {
          v518 = v613 - 3;
          goto LABEL_905;
        }
      }
      v462 = 0;
      while (1)
      {
        v463 = v674[23];
        if (v674[23] < 0)
          v463 = *(_QWORD *)&v674[8];
        if (v463)
        {
          objc_msgSend(v457, "dialogId");
          v464 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v464, "objectAtIndexedSubscript:", v462);
          v465 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(__str, (char *)objc_msgSend(v465, "UTF8String"));
          siri::dialogengine::StringSplit(__str, "#", &v692);
          if ((__str[23] & 0x80000000) != 0)
            operator delete(*(void **)__str);

          if (v692.__r_.__value_.__r.__words[0] == v692.__r_.__value_.__l.__size_)
          {
            std::string::basic_string[abi:ne180100]<0>(__str, "");
          }
          else if (*(char *)(v692.__r_.__value_.__l.__size_ - 1) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v692.__r_.__value_.__l.__size_ - 24), *(_QWORD *)(v692.__r_.__value_.__l.__size_ - 16));
          }
          else
          {
            v466 = *(_OWORD *)(v692.__r_.__value_.__l.__size_ - 24);
            *(_QWORD *)&__str[16] = *(_QWORD *)(v692.__r_.__value_.__l.__size_ - 8);
            *(_OWORD *)__str = v466;
          }
          v471 = siri::dialogengine::StringGlobMatch((std::string *)__str, (const std::string *)v674);
          v473 = v471;
          v474 = __str;
          if (__str[23] < 0)
            v474 = *(_BYTE **)__str;
          v475 = v674;
          if (v674[23] < 0)
            v475 = *(_BYTE **)v674;
          if (v471)
            v476 = "Dialog ID '%s' matches pattern '%s'; Including it in result";
          else
            v476 = "Dialog ID '%s' does not match pattern '%s'; Excluding it from result";
          siri::dialogengine::Log::Info((siri::dialogengine::Log *)v476, v472, v474, v475);
          if ((__str[23] & 0x80000000) != 0)
            operator delete(*(void **)__str);
          *(_QWORD *)__str = &v692;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__str);
          if (!v473)
            goto LABEL_895;
        }
        else
        {
          objc_msgSend(v457, "dialogId");
          v467 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v467, "objectAtIndexedSubscript:", v462);
          v468 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v469 = objc_msgSend(v468, "UTF8String");
          siri::dialogengine::Log::Info((siri::dialogengine::Log *)"No dialog ID pattern specified; Including dialog with ID '%s' in output",
            v470,
            v469);

        }
        v477 = (void *)objc_opt_new();
        objc_msgSend(v457, "dialogId");
        v478 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v478, "objectAtIndexedSubscript:", v462);
        v479 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setDialogId:", v479);

        if ((v643.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v480 = &v643;
        else
          v480 = (std::string *)v643.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v480);
        v481 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setGroupName:", v481);

        objc_msgSend(v457, "print");
        v482 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v482, "objectAtIndexedSubscript:", v462);
        v483 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setFullPrint:", v483);

        objc_msgSend(v457, "speak");
        v484 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v484, "objectAtIndexedSubscript:", v462);
        v485 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setFullSpeak:", v485);

        objc_msgSend(v457, "captionPrint");
        v486 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v486, "objectAtIndexedSubscript:", v462);
        v487 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setSupportingPrint:", v487);

        objc_msgSend(v457, "captionSpeak");
        v488 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v488, "objectAtIndexedSubscript:", v462);
        v489 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setSupportingSpeak:", v489);

        objc_msgSend(v457, "spokenOnlyDefined");
        v490 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v490, "objectAtIndexedSubscript:", v462);
        v491 = (void *)objc_claimAutoreleasedReturnValue();
        v492 = objc_msgSend(v491, "BOOLValue");
        v493 = v621;
        if (v492)
        {
          objc_msgSend(v457, "spokenOnly", v621);
          p_buf = (__int128 *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(p_buf, "objectAtIndexedSubscript:", v462);
          v10 = (std::string *)objc_claimAutoreleasedReturnValue();
          v493 = v10;
        }
        objc_msgSend(v477, "setSpokenOnly:", v493);
        if (v492)
        {

        }
        objc_msgSend(v457, "printOnly");
        v494 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v494, "objectAtIndexedSubscript:", v462);
        v495 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setPrintOnly:", v495);

        objc_msgSend(v457, "unfilteredPrint");
        v496 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v496, "objectAtIndexedSubscript:", v462);
        v497 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setUnfilteredFullPrint:", v497);

        objc_msgSend(v457, "unfilteredSpeak");
        v498 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v498, "objectAtIndexedSubscript:", v462);
        v499 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setUnfilteredFullSpeak:", v499);

        objc_msgSend(v457, "unfilteredCaptionPrint");
        v500 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v500, "objectAtIndexedSubscript:", v462);
        v501 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setUnfilteredSupportingPrint:", v501);

        objc_msgSend(v457, "unfilteredCaptionSpeak");
        v502 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v502, "objectAtIndexedSubscript:", v462);
        v503 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setUnfilteredSupportingSpeak:", v503);

        objc_msgSend(v457, "redactedPrint");
        v504 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v504, "objectAtIndexedSubscript:", v462);
        v505 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setRedactedFullPrint:", v505);

        objc_msgSend(v457, "redactedSpeak");
        v506 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v506, "objectAtIndexedSubscript:", v462);
        v507 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setRedactedFullSpeak:", v507);

        objc_msgSend(v457, "redactedCaptionPrint");
        v508 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v508, "objectAtIndexedSubscript:", v462);
        v509 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setRedactedSupportingPrint:", v509);

        objc_msgSend(v457, "redactedCaptionSpeak");
        v510 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v510, "objectAtIndexedSubscript:", v462);
        v511 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setRedactedSupportingSpeak:", v511);

        objc_msgSend(v457, "isApprovedForGrading");
        v512 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v512, "objectAtIndexedSubscript:", v462);
        v513 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v477, "setIsApprovedForGrading:", objc_msgSend(v513, "BOOLValue"));

        -[PatternExecutionResult dialog](v455, "dialog");
        v514 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v512) = v514 == 0;

        if ((_DWORD)v512)
        {
          v515 = (void *)objc_opt_new();
          -[PatternExecutionResult setDialog:](v455, "setDialog:", v515);

        }
        -[PatternExecutionResult dialog](v455, "dialog");
        v516 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v516, "addObject:", v477);

LABEL_895:
        if (v460 == ++v462)
          goto LABEL_896;
      }
    }
    v518 = v613 - 3;
LABEL_905:
    if (v518 <= 1)
      v519 = v611 | v608 ^ 1u;
    else
      v519 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v519);
    v520 = (void *)objc_claimAutoreleasedReturnValue();
    -[PatternExecutionResult setPrintSupportingDialog:](v619, "setPrintSupportingDialog:", v520);

    -[PatternExecutionResult visualInfo](v619, "visualInfo");
    v521 = (void *)objc_claimAutoreleasedReturnValue();
    -[PatternExecutionResult visualInfo](v619, "visualInfo");
    v522 = (void *)objc_claimAutoreleasedReturnValue();
    v523 = v522 == 0;

    if (v523)
    {
      v524 = objc_opt_new();

      v521 = (void *)v524;
    }
    objc_msgSend(v521, "setVisualLocation:", 0);
    -[PatternExecutionResult setVisualInfo:](v619, "setVisualInfo:", v521);
    if (_os_feature_enabled_impl())
    {
      v525 = (uint64_t)v651;
      std::string::basic_string[abi:ne180100]<0>(&v680, "visualLocation");
      v526 = std::__tree<std::string>::find<std::string>(v525, (const void **)&v680.__first_);
      if (v525 + 8 == v526)
      {
        v529 = 0;
        *(_OWORD *)__str = 0uLL;
      }
      else
      {
        v528 = v526;
        v529 = *(const void **)(v526 + 56);
        v530 = *(_QWORD *)(v528 + 64);
        *(_QWORD *)__str = v529;
        *(_QWORD *)&__str[8] = v530;
        if (v530)
        {
          v531 = (unint64_t *)(v530 + 8);
          do
            v532 = __ldxr(v531);
          while (__stxr(v532 + 1, v531));
        }
      }
      if (SHIBYTE(v680.__end_) < 0)
      {
        operator delete(v680.__first_);
        v529 = *(const void **)__str;
      }
      if (v529)
      {
        if (v533)
        {
          if (v533[95] < 0)
            std::string::__init_copy_ctor_external(&v692, *((const std::string::value_type **)v533 + 9), *((_QWORD *)v533 + 10));
          else
            v692 = *(std::string *)(v533 + 3);
          siri::dialogengine::StringToLower((uint64_t)&v692, (uint64_t)&v680);
          if (SHIBYTE(v680.__end_) < 0)
          {
            if (v680.__begin_ == (std::__split_buffer<std::string>::pointer)17)
            {
              v538 = 0x636F6E7665727361;
              v539 = bswap64(v680.__first_->__r_.__value_.__r.__words[0]);
              if (v539 == 0x636F6E7665727361
                && (v538 = 0x74696F6E73706163,
                    v539 = bswap64(v680.__first_->__r_.__value_.__l.__size_),
                    v539 == 0x74696F6E73706163))
              {
                v540 = v680.__first_->__r_.__value_.__s.__data_[16] - 101;
              }
              else if (v539 < v538)
              {
                v540 = -1;
              }
              else
              {
                v540 = 1;
              }
              v541 = v540 == 0;
            }
            else
            {
              v541 = 0;
            }
            operator delete(v680.__first_);
          }
          else if (SHIBYTE(v680.__end_) == 17)
          {
            v535 = 0x636F6E7665727361;
            v536 = bswap64((unint64_t)v680.__first_);
            if (v536 == 0x636F6E7665727361
              && (v535 = 0x74696F6E73706163,
                  v536 = bswap64((unint64_t)v680.__begin_),
                  v536 == 0x74696F6E73706163))
            {
              v537 = LOBYTE(v680.__end_) - 101;
            }
            else if (v536 < v535)
            {
              v537 = -1;
            }
            else
            {
              v537 = 1;
            }
            v541 = v537 == 0;
          }
          else
          {
            v541 = 0;
          }
          objc_msgSend(v521, "setVisualLocation:", v541);
          if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v692.__r_.__value_.__l.__data_);
          v542 = objc_msgSend(v521, "visualLocation");
          v543 = "Invalid";
          if (!v542)
            v543 = "SnippetSpace";
          if (v542 == 1)
            v544 = "ConversationSpace";
          else
            v544 = (char *)v543;
          std::string::basic_string[abi:ne180100]<0>(&v680, v544);
          if (SHIBYTE(v680.__end_) >= 0)
            v546 = &v680;
          else
            v546 = v680.__first_;
          siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Visual location: %s", v545, v546);
          if (SHIBYTE(v680.__end_) < 0)
            operator delete(v680.__first_);
        }
        else
        {
          siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern setting 'visualLocation' is not a string; Using default value",
            v534);
        }
      }
      else
      {
        siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern setting 'visualLocation' not found; Using default value",
          v527);
      }
      v547 = *(std::__shared_weak_count **)&__str[8];
      if (*(_QWORD *)&__str[8])
      {
        v548 = (unint64_t *)(*(_QWORD *)&__str[8] + 8);
        do
          v549 = __ldaxr(v548);
        while (__stlxr(v549 - 1, v548));
        if (!v549)
        {
          ((void (*)(std::__shared_weak_count *))v547->__on_zero_shared)(v547);
          std::__shared_weak_count::__release_weak(v547);
        }
      }
    }
    siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v680, (const siri::dialogengine::RequestInfo *)((char *)&buf + 8));
    std::string::operator=(v689, &v669);
    siri::dialogengine::Context::SetRequestInfo((siri::dialogengine::Context *)&buf, (const siri::dialogengine::RequestInfo *)&v680);
    siri::dialogengine::Context::UpdatePatternState((siri::dialogengine::Context *)&buf, v550, 0);
    LogPatternExecutionResult(v619);
    v551 = log;
    v552 = v551;
    if (v593 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v551))
    {
      LOWORD(v692.__r_.__value_.__l.__data_) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BF794000, v552, OS_SIGNPOST_INTERVAL_END, spid, "PatternExecute", ", (uint8_t *)&v692, 2u);
    }

    std::operator+<char>();
    v553 = std::string::append(&v642, "' of type '");
    v554 = *(_OWORD *)&v553->__r_.__value_.__l.__data_;
    v643.__r_.__value_.__r.__words[2] = v553->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v643.__r_.__value_.__l.__data_ = v554;
    v553->__r_.__value_.__l.__size_ = 0;
    v553->__r_.__value_.__r.__words[2] = 0;
    v553->__r_.__value_.__r.__words[0] = 0;
    if (*(char *)(v663.n128_u64[0] + 135) < 0)
      std::string::__init_copy_ctor_external(&v637, *(const std::string::value_type **)(v663.n128_u64[0] + 112), *(_QWORD *)(v663.n128_u64[0] + 120));
    else
      v637 = *(std::string *)(v663.n128_u64[0] + 112);
    if ((v637.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v555 = &v637;
    else
      v555 = (std::string *)v637.__r_.__value_.__r.__words[0];
    if ((v637.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v556 = HIBYTE(v637.__r_.__value_.__r.__words[2]);
    else
      v556 = v637.__r_.__value_.__l.__size_;
    v557 = std::string::append(&v643, (const std::string::value_type *)v555, v556);
    v558 = *(_OWORD *)&v557->__r_.__value_.__l.__data_;
    *(_QWORD *)&v674[16] = *((_QWORD *)&v557->__r_.__value_.__l + 2);
    *(_OWORD *)v674 = v558;
    v557->__r_.__value_.__l.__size_ = 0;
    v557->__r_.__value_.__r.__words[2] = 0;
    v557->__r_.__value_.__r.__words[0] = 0;
    v559 = std::string::append((std::string *)v674, "' in ");
    v560 = *(_OWORD *)&v559->__r_.__value_.__l.__data_;
    *(_QWORD *)&__str[16] = *((_QWORD *)&v559->__r_.__value_.__l + 2);
    *(_OWORD *)__str = v560;
    v559->__r_.__value_.__l.__size_ = 0;
    v559->__r_.__value_.__r.__words[2] = 0;
    v559->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v671, &v636);
    if ((v636.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v561 = &v636;
    else
      v561 = (std::string *)v636.__r_.__value_.__r.__words[0];
    if ((v636.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v562 = HIBYTE(v636.__r_.__value_.__r.__words[2]);
    else
      v562 = v636.__r_.__value_.__l.__size_;
    v563 = std::string::append((std::string *)__str, (const std::string::value_type *)v561, v562);
    v564 = *(_OWORD *)&v563->__r_.__value_.__l.__data_;
    v692.__r_.__value_.__r.__words[2] = v563->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v692.__r_.__value_.__l.__data_ = v564;
    v563->__r_.__value_.__l.__size_ = 0;
    v563->__r_.__value_.__r.__words[2] = 0;
    v563->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)&v692, 0);
    if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v692.__r_.__value_.__l.__data_);
    if (SHIBYTE(v636.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v636.__r_.__value_.__l.__data_);
    if ((__str[23] & 0x80000000) != 0)
      operator delete(*(void **)__str);
    if ((v674[23] & 0x80000000) != 0)
      operator delete(*(void **)v674);
    if (SHIBYTE(v637.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v637.__r_.__value_.__l.__data_);
    if (SHIBYTE(v643.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v643.__r_.__value_.__l.__data_);
    if (SHIBYTE(v642.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v642.__r_.__value_.__l.__data_);
    v565 = os_signpost_id_generate(v552);
    v566 = v552;
    v567 = v566;
    if (v565 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v566))
    {
      LOWORD(v692.__r_.__value_.__l.__data_) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BF794000, v567, OS_SIGNPOST_INTERVAL_BEGIN, v565, "PatternClientCallback", ", (uint8_t *)&v692, 2u);
    }

    v601[2](v601, v619, 0);
    v568 = v567;
    v569 = v568;
    if (v565 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v568))
    {
      LOWORD(v692.__r_.__value_.__l.__data_) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BF794000, v569, OS_SIGNPOST_INTERVAL_END, v565, "PatternClientCallback", ", (uint8_t *)&v692, 2u);
    }

    siri::dialogengine::RequestInfo::~RequestInfo((void **)&v680.__first_);
LABEL_1002:
    v680.__first_ = (std::__split_buffer<std::string>::pointer)&v644;
    std::vector<CATResult * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v680);
    v680.__first_ = (std::__split_buffer<std::string>::pointer)&v646;
    std::vector<CATResult * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v680);
    if (v649 < 0)
      operator delete(v648[0]);
    v680.__first_ = (std::__split_buffer<std::string>::pointer)&v650;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v680);
    v570 = v652;
    if (v652)
    {
      v571 = (unint64_t *)&v652->__shared_owners_;
      do
        v572 = __ldaxr(v571);
      while (__stlxr(v572 - 1, v571));
      if (!v572)
      {
        ((void (*)(std::__shared_weak_count *))v570->__on_zero_shared)(v570);
        std::__shared_weak_count::__release_weak(v570);
      }
    }
    v680.__first_ = (std::__split_buffer<std::string>::pointer)&v653;
    std::vector<siri::dialogengine::ExecutePatternBase::Stage>::__destroy_vector::operator()[abi:ne180100]((void ***)&v680);
    v573 = v656;
    if (v656)
    {
      v574 = (unint64_t *)&v656->__shared_owners_;
      do
        v575 = __ldaxr(v574);
      while (__stlxr(v575 - 1, v574));
      if (!v575)
      {
        ((void (*)(std::__shared_weak_count *))v573->__on_zero_shared)(v573);
        std::__shared_weak_count::__release_weak(v573);
      }
    }
  }
  else
  {
    LogPatternExecutionResult(v619);
    v100 = log;
    v101 = v100;
    if (v593 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
    {
      LOWORD(v680.__first_) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BF794000, v101, OS_SIGNPOST_INTERVAL_END, spid, "PatternExecute", ", (uint8_t *)&v680, 2u);
    }

    if (*(char *)(v51 + 135) < 0)
    {
      std::string::__init_copy_ctor_external(&v692, *(const std::string::value_type **)(v51 + 112), *(_QWORD *)(v51 + 120));
    }
    else
    {
      *(_OWORD *)&v692.__r_.__value_.__l.__data_ = *v80;
      v692.__r_.__value_.__r.__words[2] = *(_QWORD *)(v51 + 128);
    }
    v438 = std::string::insert(&v692, 0, "Pattern type is unsupported: ");
    v439 = *(_OWORD *)&v438->__r_.__value_.__l.__data_;
    v680.__end_ = (std::__split_buffer<std::string>::pointer)v438->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v680.__first_ = v439;
    v438->__r_.__value_.__l.__size_ = 0;
    v438->__r_.__value_.__r.__words[2] = 0;
    v438->__r_.__value_.__r.__words[0] = 0;
    std::string::basic_string[abi:ne180100]<0>(__str, "load-failed");
    NSErrorFromString((uint64_t *)&v680, (uint64_t *)__str);
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    v601[2](v601, v619, v440);

    if ((__str[23] & 0x80000000) != 0)
      operator delete(*(void **)__str);
    if (SHIBYTE(v680.__end_) < 0)
      operator delete(v680.__first_);
    if (SHIBYTE(v692.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v692.__r_.__value_.__l.__data_);
  }
  v576 = v658;
  if (v658)
  {
    v577 = (unint64_t *)&v658->__shared_owners_;
    do
      v578 = __ldaxr(v577);
    while (__stlxr(v578 - 1, v577));
    if (!v578)
    {
      ((void (*)(std::__shared_weak_count *))v576->__on_zero_shared)(v576);
      std::__shared_weak_count::__release_weak(v576);
    }
  }

  v579 = v660;
  if (v660)
  {
    v580 = (unint64_t *)&v660->__shared_owners_;
    do
      v581 = __ldaxr(v580);
    while (__stlxr(v581 - 1, v580));
    if (!v581)
    {
      ((void (*)(std::__shared_weak_count *))v579->__on_zero_shared)(v579);
      std::__shared_weak_count::__release_weak(v579);
    }
  }
  v582 = v662;
  if (v662)
  {
    v583 = (unint64_t *)&v662->__shared_owners_;
    do
      v584 = __ldaxr(v583);
    while (__stlxr(v584 - 1, v583));
    if (!v584)
    {
      ((void (*)(std::__shared_weak_count *))v582->__on_zero_shared)(v582);
      std::__shared_weak_count::__release_weak(v582);
    }
  }
LABEL_1029:
  v585 = (std::__shared_weak_count *)v663.n128_u64[1];
  if (v663.n128_u64[1])
  {
    v586 = (unint64_t *)(v663.n128_u64[1] + 8);
    do
      v587 = __ldaxr(v586);
    while (__stlxr(v587 - 1, v586));
    if (!v587)
    {
      ((void (*)(std::__shared_weak_count *))v585->__on_zero_shared)(v585);
      std::__shared_weak_count::__release_weak(v585);
    }
  }
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)&buf);
  *(_QWORD *)&buf = &v664;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v668 < 0)
    operator delete(v667[0]);
  if (SHIBYTE(v669.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v669.__r_.__value_.__l.__data_);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);

}

@end
