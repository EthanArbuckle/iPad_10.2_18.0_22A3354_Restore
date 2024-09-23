@implementation DEEvaluator

- (id)evaluate
{
  id v2;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  id v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  std::string *v31;
  __int128 v32;
  uint64_t v33;
  std::string *v34;
  __int128 v35;
  void **v36;
  std::string::size_type v37;
  std::string *v38;
  __int128 v39;
  std::string *v40;
  __int128 v41;
  void *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *p_shared_owners;
  unint64_t v46;
  std::string::size_type i;
  std::string::size_type size;
  siri::dialogengine::Context *v49;
  __int128 v50;
  siri::dialogengine::Context *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  siri::dialogengine::VariableArray *v63;
  _BOOL4 IsArrayType;
  _BOOL4 v65;
  void **v66;
  siri::dialogengine::VariableArray *v67;
  std::__shared_weak_count *v68;
  std::string *v69;
  void *v70;
  char v71;
  siri::dialogengine::Context *v72;
  siri::dialogengine::Context *v73;
  siri::dialogengine::VariableArray *v74;
  std::string *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  std::string *v89;
  __int128 v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  std::__shared_weak_count *v94;
  unint64_t *v95;
  unint64_t v96;
  void *v97;
  std::string *v98;
  std::string *v99;
  siri::dialogengine::Context *v100;
  std::__shared_weak_count *v101;
  unint64_t *v102;
  unint64_t v103;
  std::__shared_weak_count *v104;
  unint64_t *v105;
  unint64_t v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  std::__shared_weak_count *v110;
  std::string v111;
  __int128 v112;
  __int128 v113;
  std::string v114;
  void *v115;
  char v116;
  void *v117;
  char v118;
  void *v119;
  char v120;
  void *v121;
  char v122;
  void *v123;
  char v124;
  void *v125;
  char v126;
  std::string v127[2];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  void *__p[4];
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  std::string v147[2];
  siri::dialogengine::VariableArray *v148;
  std::__shared_weak_count *v149;
  __int128 lpsrc;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  std::__shared_weak_count *v154;
  siri::dialogengine::Context *v155;
  std::__shared_weak_count *v156;
  std::string v157;
  std::string v158;
  void *v159[2];
  unsigned __int8 v160;
  std::string v161;
  id v162;
  void *v163[2];
  char v164;
  void **v165;
  uint64_t v166;
  unsigned __int8 v167;
  std::string __str;
  void *v169[2];
  char v170;
  __int128 v171;
  const __CFString *v172;
  _QWORD v173[4];

  v173[1] = *MEMORY[0x1E0C80C00];
  -[DEEvaluator typeName](self, "typeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v9 = "No typeName specified for the evaluator";
LABEL_7:
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)v9, v5);
    return 0;
  }
  -[DEEvaluator propName](self, "propName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9 = "No propName specified for the evaluator";
    goto LABEL_7;
  }
  -[DEEvaluator locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[DEEvaluator locale](self, "locale");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (char *)objc_msgSend(v2, "UTF8String");
  }
  else
  {
    v8 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(v169, v8);
  if (v7)

  -[DEEvaluator typeName](self, "typeName");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v11, "UTF8String"));

  -[DEEvaluator propName](self, "propName");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v165, (char *)objc_msgSend(v12, "UTF8String"));

  std::string::basic_string[abi:ne180100]<0>(v163, "{}");
  v13 = (void *)objc_opt_new();
  if (v170 >= 0)
    v14 = v169;
  else
    v14 = (void **)v169[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("locale"));

  -[DEEvaluator globalParameters](self, "globalParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v16 == 0;

  if ((v15 & 1) == 0)
  {
    -[DEEvaluator globalParameters](self, "globalParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("globalParameters"));

  }
  -[DEEvaluator parameters](self, "parameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (!v19)
  {
    v172 = CFSTR("value");
    -[DEEvaluator parameters](self, "parameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v173[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, &v172, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v21, CFSTR("parameters"));

  }
  -[DEEvaluator templateDir](self, "templateDir");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    -[DEEvaluator templateDir](self, "templateDir");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v24, CFSTR("templateDir"));

  }
  -[DEEvaluator userSettings](self, "userSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26)
  {
    -[DEEvaluator userSettings](self, "userSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v27, CFSTR("userSettings"));

  }
  v162 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 3, &v162);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v162;

  if (v28)
  {
    v30 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v28, 4));
    MEMORY[0x1C3B8D53C](v163, objc_msgSend(v30, "UTF8String"));

  }
  std::operator+<char>();
  v31 = std::string::append(v127, "\" profanityFilter=\"yes\"/></parameters></cat>");
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v161.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v161.__r_.__value_.__l.__data_ = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v127[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127[0].__r_.__value_.__l.__data_);
  v33 = v167;
  if ((v167 & 0x80u) != 0)
    v33 = v166;
  if (v33)
    std::operator+<char>();
  else
    std::string::basic_string[abi:ne180100]<0>(v159, "value");
  std::operator+<char>();
  v34 = std::string::append(&v157, "\">        <all><dialog><var name=\");
  v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
  v114.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v114.__r_.__value_.__l.__data_ = v35;
  v34->__r_.__value_.__l.__size_ = 0;
  v34->__r_.__value_.__r.__words[2] = 0;
  v34->__r_.__value_.__r.__words[0] = 0;
  if ((v160 & 0x80u) == 0)
    v36 = v159;
  else
    v36 = (void **)v159[0];
  if ((v160 & 0x80u) == 0)
    v37 = v160;
  else
    v37 = (std::string::size_type)v159[1];
  v38 = std::string::append(&v114, (const std::string::value_type *)v36, v37);
  v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
  v127[0].__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v127[0].__r_.__value_.__l.__data_ = v39;
  v38->__r_.__value_.__l.__size_ = 0;
  v38->__r_.__value_.__r.__words[2] = 0;
  v38->__r_.__value_.__r.__words[0] = 0;
  v40 = std::string::append(v127, "\"/></dialog></all></cat>");
  v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v40->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v41;
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v127[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127[0].__r_.__value_.__l.__data_);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v114.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  std::string::basic_string[abi:ne180100]<0>(v127, "");
  siri::dialogengine::PrepareRequestFromJson((const char *)v163, &v161, &v158, v127, &v155);
  if (SHIBYTE(v127[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127[0].__r_.__value_.__l.__data_);
  v42 = v155;
  if (!v155)
    goto LABEL_201;
  v43 = *((_QWORD *)v155 + 63);
  v44 = (std::__shared_weak_count *)*((_QWORD *)v155 + 64);
  v153 = v43;
  v154 = v44;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v46 = __ldxr(p_shared_owners);
    while (__stxr(v46 + 1, p_shared_owners));
  }
  if (v43)
  {
    memset(v127, 0, 24);
    std::vector<siri::dialogengine::Parameter>::__init_with_size[abi:ne180100]<siri::dialogengine::Parameter*,siri::dialogengine::Parameter*>(v127, *(_QWORD *)(v43 + 176), *(_QWORD *)(v43 + 184), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*(_QWORD *)(v43 + 184) - *(_QWORD *)(v43 + 176)) >> 4));
    size = v127[0].__r_.__value_.__l.__size_;
    for (i = v127[0].__r_.__value_.__r.__words[0]; i != size; i += 336)
    {
      v49 = v155;
      if (*(char *)(i + 31) < 0)
      {
        std::string::__init_copy_ctor_external(&v114, *(const std::string::value_type **)(i + 8), *(_QWORD *)(i + 16));
      }
      else
      {
        v50 = *(_OWORD *)(i + 8);
        v114.__r_.__value_.__r.__words[2] = *(_QWORD *)(i + 24);
        *(_OWORD *)&v114.__r_.__value_.__l.__data_ = v50;
      }
      siri::dialogengine::Context::FindVariable((uint64_t)v49, (uint64_t)&v114, &v157);
      if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v114.__r_.__value_.__l.__data_);
      v51 = v155;
      v151 = *(_OWORD *)&v157.__r_.__value_.__l.__data_;
      if (v157.__r_.__value_.__l.__size_)
      {
        v52 = (unint64_t *)(v157.__r_.__value_.__l.__size_ + 8);
        do
          v53 = __ldxr(v52);
        while (__stxr(v53 + 1, v52));
      }
      siri::dialogengine::RemoveProfanity(v51, (uint64_t)&v151, &v152);
      v54 = (std::__shared_weak_count *)*((_QWORD *)&v152 + 1);
      if (*((_QWORD *)&v152 + 1))
      {
        v55 = (unint64_t *)(*((_QWORD *)&v152 + 1) + 8);
        do
          v56 = __ldaxr(v55);
        while (__stlxr(v56 - 1, v55));
        if (!v56)
        {
          ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
          std::__shared_weak_count::__release_weak(v54);
        }
      }
      v57 = (std::__shared_weak_count *)*((_QWORD *)&v151 + 1);
      if (*((_QWORD *)&v151 + 1))
      {
        v58 = (unint64_t *)(*((_QWORD *)&v151 + 1) + 8);
        do
          v59 = __ldaxr(v58);
        while (__stlxr(v59 - 1, v58));
        if (!v59)
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
      }
      v60 = (std::__shared_weak_count *)v157.__r_.__value_.__l.__size_;
      if (v157.__r_.__value_.__l.__size_)
      {
        v61 = (unint64_t *)(v157.__r_.__value_.__l.__size_ + 8);
        do
          v62 = __ldaxr(v61);
        while (__stlxr(v62 - 1, v61));
        if (!v62)
        {
          ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
          std::__shared_weak_count::__release_weak(v60);
        }
      }
    }
    v114.__r_.__value_.__r.__words[0] = (std::string::size_type)v127;
    std::vector<siri::dialogengine::Parameter>::__destroy_vector::operator()[abi:ne180100]((void ***)&v114);
    v42 = v155;
  }
  std::string::basic_string[abi:ne180100]<0>(v127, "");
  std::string::basic_string[abi:ne180100]<0>(&v114, "");
  siri::dialogengine::ResolveValue((uint64_t)v42, (uint64_t)v159, 1, (uint64_t)v127, (uint64_t)&v114, (uint64_t *)&lpsrc);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v114.__r_.__value_.__l.__data_);
  if (SHIBYTE(v127[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127[0].__r_.__value_.__l.__data_);
  if ((_QWORD)lpsrc)
  else
    v63 = 0;
  IsArrayType = siri::dialogengine::IsArrayType(&__str);
  if (v63)
    v65 = IsArrayType;
  else
    v65 = 0;
  if (v65)
  {
    siri::dialogengine::StringTrimRight("[]", &__str, &v157);
    if (siri::dialogengine::IsPrimitiveType((const void **)&v157.__r_.__value_.__l.__data_))
    {
      if ((char)v167 < 0)
      {
        if (v166 != 8)
          goto LABEL_95;
        v66 = v165;
      }
      else
      {
        if (v167 != 8)
          goto LABEL_95;
        v66 = (void **)&v165;
      }
      if (*v66 == (void *)0x676E697274536F74)
      {
        v89 = (std::string *)operator new();
        std::string::basic_string[abi:ne180100]<0>(&v114, "");
        (*(void (**)(std::string *__return_ptr, siri::dialogengine::VariableArray *))(*(_QWORD *)v63 + 48))(v127, v63);
        siri::dialogengine::VariableString::VariableString(v89, &v114, (const siri::dialogengine::SpeakableString *)v127);
        std::shared_ptr<siri::dialogengine::VariableString>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v171, (uint64_t)v89);
        v90 = v171;
        v171 = 0uLL;
        v91 = (std::__shared_weak_count *)*((_QWORD *)&lpsrc + 1);
        lpsrc = v90;
        if (v91)
        {
          v92 = (unint64_t *)&v91->__shared_owners_;
          do
            v93 = __ldaxr(v92);
          while (__stlxr(v93 - 1, v92));
          if (!v93)
          {
            ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
            std::__shared_weak_count::__release_weak(v91);
          }
        }
        v94 = (std::__shared_weak_count *)*((_QWORD *)&v171 + 1);
        if (*((_QWORD *)&v171 + 1))
        {
          v95 = (unint64_t *)(*((_QWORD *)&v171 + 1) + 8);
          do
            v96 = __ldaxr(v95);
          while (__stlxr(v96 - 1, v95));
          if (!v96)
          {
            ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
            std::__shared_weak_count::__release_weak(v94);
          }
        }
        if (SBYTE7(v135) < 0)
          operator delete((void *)v134);
        if (SHIBYTE(v133) < 0)
          operator delete(*((void **)&v132 + 1));
        if (SBYTE7(v132) < 0)
          operator delete((void *)v131);
        if (SHIBYTE(v130) < 0)
          operator delete(*((void **)&v129 + 1));
        if (SBYTE7(v129) < 0)
          operator delete((void *)v128);
        if (SHIBYTE(v127[1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(v127[1].__r_.__value_.__l.__data_);
        if (SHIBYTE(v127[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(v127[0].__r_.__value_.__l.__data_);
        if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v114.__r_.__value_.__l.__data_);
        goto LABEL_166;
      }
    }
LABEL_95:
    v67 = (siri::dialogengine::VariableArray *)operator new();
    siri::dialogengine::VariableArray::VariableArray(v67);
    v148 = v67;
    v68 = (std::__shared_weak_count *)operator new();
    v68->__vftable = (std::__shared_weak_count_vtbl *)&off_1E7937D58;
    v68->__shared_owners_ = 0;
    v68->__shared_weak_owners_ = 0;
    v68[1].__vftable = (std::__shared_weak_count_vtbl *)v67;
    v149 = v68;
    v146 = 0u;
    memset(v147, 0, sizeof(v147));
    v144 = 0u;
    v145 = 0u;
    v143 = 0u;
    v141 = 0u;
    memset(__p, 0, sizeof(__p));
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v128 = 0u;
    memset(v127, 0, sizeof(v127));
    std::operator+<char>();
    v69 = std::string::append(&v114, " }");
    v70 = (void *)v69->__r_.__value_.__r.__words[0];
    *(_QWORD *)&v171 = v69->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)&v171 + 7) = *(std::string::size_type *)((char *)&v69->__r_.__value_.__r.__words[1] + 7);
    v71 = HIBYTE(v69->__r_.__value_.__r.__words[2]);
    v69->__r_.__value_.__l.__size_ = 0;
    v69->__r_.__value_.__r.__words[2] = 0;
    v69->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    *(void **)((char *)&__p[1] + 7) = *(void **)((char *)&v171 + 7);
    __p[0] = v70;
    __p[1] = (void *)v171;
    HIBYTE(__p[2]) = v71;
    if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v114.__r_.__value_.__l.__data_);
    MEMORY[0x1C3B8D53C](v147, "value");
    std::string::operator=(&v147[1], &__str);
    siri::dialogengine::VariableArray::Iterate(v63, v155, (siri::dialogengine::FormatAttributes *)v127, (uint64_t)&v171);
    v73 = (siri::dialogengine::Context *)*((_QWORD *)&v171 + 1);
    v72 = (siri::dialogengine::Context *)v171;
    if ((_QWORD)v171 == *((_QWORD *)&v171 + 1))
      goto LABEL_128;
    do
    {
      siri::dialogengine::Dialog::ProcessString(v155, v72, (uint64_t)&v114);
      v74 = v148;
      v75 = (std::string *)operator new();
      std::string::basic_string[abi:ne180100]<0>(&v111, "");
      siri::dialogengine::VariableString::VariableString(v75, &v111, (const siri::dialogengine::SpeakableString *)&v114);
      std::shared_ptr<siri::dialogengine::VariableString>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v112, (uint64_t)v75);
      v110 = (std::__shared_weak_count *)*((_QWORD *)&v112 + 1);
      v113 = v112;
      v112 = 0uLL;
      siri::dialogengine::VariableArray::AddItem(v74, &v113);
      if (v110)
      {
        v76 = (unint64_t *)&v110->__shared_owners_;
        do
          v77 = __ldaxr(v76);
        while (__stlxr(v77 - 1, v76));
        if (!v77)
        {
          ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
          std::__shared_weak_count::__release_weak(v110);
        }
      }
      v78 = (std::__shared_weak_count *)*((_QWORD *)&v112 + 1);
      if (*((_QWORD *)&v112 + 1))
      {
        v79 = (unint64_t *)(*((_QWORD *)&v112 + 1) + 8);
        do
          v80 = __ldaxr(v79);
        while (__stlxr(v80 - 1, v79));
        if (!v80)
        {
          ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
          std::__shared_weak_count::__release_weak(v78);
        }
      }
      if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v111.__r_.__value_.__l.__data_);
      if (v126 < 0)
        operator delete(v125);
      if (v124 < 0)
        operator delete(v123);
      if (v122 < 0)
        operator delete(v121);
      if (v120 < 0)
        operator delete(v119);
      if (v118 < 0)
        operator delete(v117);
      if (v116 < 0)
        operator delete(v115);
      if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v114.__r_.__value_.__l.__data_);
      v72 = (siri::dialogengine::Context *)((char *)v72 + 168);
    }
    while (v72 != v73);
    v67 = v148;
    v68 = v149;
    if (v149)
    {
LABEL_128:
      v81 = (unint64_t *)&v68->__shared_owners_;
      do
        v82 = __ldxr(v81);
      while (__stxr(v82 + 1, v81));
    }
    v83 = (std::__shared_weak_count *)*((_QWORD *)&lpsrc + 1);
    *(_QWORD *)&lpsrc = v67;
    *((_QWORD *)&lpsrc + 1) = v68;
    if (v83)
    {
      v84 = (unint64_t *)&v83->__shared_owners_;
      do
        v85 = __ldaxr(v84);
      while (__stlxr(v85 - 1, v84));
      if (!v85)
      {
        ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
        std::__shared_weak_count::__release_weak(v83);
      }
    }
    v114.__r_.__value_.__r.__words[0] = (std::string::size_type)&v171;
    std::vector<siri::dialogengine::SpeakableString>::__destroy_vector::operator()[abi:ne180100]((void ***)&v114);
    siri::dialogengine::FormatAttributes::~FormatAttributes((void **)&v127[0].__r_.__value_.__l.__data_);
    v86 = v149;
    if (v149)
    {
      v87 = (unint64_t *)&v149->__shared_owners_;
      do
        v88 = __ldaxr(v87);
      while (__stlxr(v88 - 1, v87));
      if (!v88)
      {
        ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
        std::__shared_weak_count::__release_weak(v86);
      }
    }
LABEL_166:
    if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v157.__r_.__value_.__l.__data_);
  }
  v97 = (void *)lpsrc;
  if ((_QWORD)lpsrc)
  {
    if (v98)
    {
      v99 = v98;
      v100 = v155;
      (*(void (**)(std::string *__return_ptr))(v98->__r_.__value_.__r.__words[0] + 48))(&v114);
      siri::dialogengine::Dialog::ProcessString(v100, (siri::dialogengine::Context *)&v114, (uint64_t)v127);
      if (v126 < 0)
        operator delete(v125);
      if (v124 < 0)
        operator delete(v123);
      if (v122 < 0)
        operator delete(v121);
      if (v120 < 0)
        operator delete(v119);
      if (v118 < 0)
        operator delete(v117);
      if (v116 < 0)
        operator delete(v115);
      if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v114.__r_.__value_.__l.__data_);
      if (SHIBYTE(v127[0].__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v114, v127[0].__r_.__value_.__l.__data_, v127[0].__r_.__value_.__l.__size_);
      else
        v114 = v127[0];
      if (SHIBYTE(v127[1].__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v157, v127[1].__r_.__value_.__l.__data_, v127[1].__r_.__value_.__l.__size_);
      else
        v157 = v127[1];
      siri::dialogengine::SpeakableString::SetString(v99 + 3, &v114, &v157);
    }
  }
  DE_VariableToNSObject(v97, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (std::__shared_weak_count *)*((_QWORD *)&lpsrc + 1);
  if (*((_QWORD *)&lpsrc + 1))
  {
    v102 = (unint64_t *)(*((_QWORD *)&lpsrc + 1) + 8);
    do
      v103 = __ldaxr(v102);
    while (__stlxr(v103 - 1, v102));
    if (!v103)
    {
      ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
      std::__shared_weak_count::__release_weak(v101);
    }
  }
  v104 = v154;
  if (v154)
  {
    v105 = (unint64_t *)&v154->__shared_owners_;
    do
      v106 = __ldaxr(v105);
    while (__stlxr(v106 - 1, v105));
    if (!v106)
    {
      ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
      std::__shared_weak_count::__release_weak(v104);
    }
  }
LABEL_201:
  v107 = v156;
  if (v156)
  {
    v108 = (unint64_t *)&v156->__shared_owners_;
    do
      v109 = __ldaxr(v108);
    while (__stlxr(v109 - 1, v108));
    if (!v109)
    {
      ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
      std::__shared_weak_count::__release_weak(v107);
    }
  }
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if ((char)v160 < 0)
    operator delete(v159[0]);
  if (SHIBYTE(v161.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v161.__r_.__value_.__l.__data_);

  if (v164 < 0)
    operator delete(v163[0]);
  if ((char)v167 < 0)
    operator delete(v165);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v170 < 0)
    operator delete(v169[0]);
  return v42;
}

- (NSString)templateDir
{
  return self->_templateDir;
}

- (void)setTemplateDir:(id)a3
{
  objc_storeStrong((id *)&self->_templateDir, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (id)globalParameters
{
  return self->_globalParameters;
}

- (void)setGlobalParameters:(id)a3
{
  objc_storeStrong(&self->_globalParameters, a3);
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setTypeName:(id)a3
{
  objc_storeStrong((id *)&self->_typeName, a3);
}

- (NSString)propName
{
  return self->_propName;
}

- (void)setPropName:(id)a3
{
  objc_storeStrong((id *)&self->_propName, a3);
}

- (id)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong(&self->_parameters, a3);
}

- (id)userSettings
{
  return self->_userSettings;
}

- (void)setUserSettings:(id)a3
{
  objc_storeStrong(&self->_userSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userSettings, 0);
  objc_storeStrong(&self->_parameters, 0);
  objc_storeStrong((id *)&self->_propName, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong(&self->_globalParameters, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_templateDir, 0);
}

@end
