@implementation CSUCaptioningProcUtils

- (CSUCaptioningProcUtils)initWithDecoderConfiguration:(id)a3 beamWidth:(int)a4 beamScorerType:(unint64_t)a5 error:(id *)a6
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  size_t v42;
  size_t v43;
  __int128 *p_dst;
  uint64_t v45;
  uint64_t v46;
  void **v47;
  CSUCaptioningProcUtils *v48;
  _QWORD *v49;
  void **v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *p_shared_owners;
  unint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CSUCaptionRuntimeParameters *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  int v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _BOOL4 v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  CSUCaptionPostProcessingHandler *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t j;
  void *v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v125;
  void *v126;
  __int128 v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  _QWORD *v141;
  std::__shared_weak_count *v142;
  unint64_t *v143;
  unint64_t v144;
  void **v145;
  void *v146;
  void **v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  void *v154;
  int v155;
  void *v156;
  id v158;
  void *v160;
  id v161;
  char *v162;
  id obj;
  __int128 __dst;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  uint64_t v169;
  uint64_t v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  id v175;
  id v176;
  int v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  void *v182[2];
  void *v183[2];
  int v184;
  id v185;
  objc_super v186;
  int *v187;
  _BYTE v188[128];
  _BYTE v189[128];
  uint64_t v190;

  v190 = *MEMORY[0x24BDAC8D0];
  v161 = a3;
  v186.receiver = self;
  v186.super_class = (Class)CSUCaptioningProcUtils;
  v162 = -[CSUCaptioningProcUtils init](&v186, sel_init);
  if (v162)
  {
    v155 = a4;
    v12 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend_vocabularyModelPath(v161, v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithContentsOfFile_(v12, v14, (uint64_t)v13, v15, v16);
    v160 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v160)
    {
      if (a6)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v17, (uint64_t)CFSTR("No vocabulary data could be read!"), 0, v18);
        v48 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = 0;
      }
      goto LABEL_76;
    }
    v185 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v17, (uint64_t)v160, 0, (uint64_t)&v185);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v185;
    v156 = v19;
    if (!v19)
    {
      if (a6)
      {
        v158 = objc_retainAutorelease(v20);
        v48 = 0;
        *a6 = v158;
      }
      else
      {
        v158 = v20;
        v48 = 0;
      }
LABEL_75:

LABEL_76:
      goto LABEL_77;
    }
    v158 = v20;
    *(_OWORD *)v182 = 0u;
    *(_OWORD *)v183 = 0u;
    v184 = 1065353216;
    v178 = 0u;
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    obj = v19;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v178, (uint64_t)v189, 16);
    if (v25)
    {
      v26 = 0;
      v27 = *(_QWORD *)v179;
      for (i = *(_QWORD *)v179; ; i = *(_QWORD *)v179)
      {
        if (i != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * v26);
        objc_msgSend_objectForKey_(obj, v22, (uint64_t)v29, v23, v24);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = (char *)objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
        v36 = objc_retainAutorelease(v29);
        v41 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39, v40);
        v42 = strlen(v41);
        if (v42 >= 0x7FFFFFFFFFFFFFF8)
          sub_239FEBDE0();
        v43 = v42;
        if (v42 >= 0x17)
          break;
        BYTE7(v165) = v42;
        p_dst = &__dst;
        if (v42)
          goto LABEL_16;
LABEL_17:
        *((_BYTE *)p_dst + v43) = 0;
        v177 = std::stoi((const std::string *)&__dst, 0, 10);
        v187 = &v177;
        v47 = (void **)sub_23A003224((uint64_t)v182, (unsigned int *)&v177, (uint64_t)&unk_23A0A31B0, &v187);
        sub_239FFEAC4(v47 + 3, v35);
        if (SBYTE7(v165) < 0)
          operator delete((void *)__dst);

        if (++v26 >= v25)
        {
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v178, (uint64_t)v189, 16);
          if (!v25)
            goto LABEL_23;
          v26 = 0;
        }
      }
      v45 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v42 | 7) != 0x17)
        v45 = v42 | 7;
      v46 = v45 + 1;
      p_dst = (__int128 *)operator new(v45 + 1);
      *((_QWORD *)&__dst + 1) = v43;
      *(_QWORD *)&v165 = v46 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
LABEL_16:
      memmove(p_dst, v41, v43);
      goto LABEL_17;
    }
LABEL_23:

    v49 = operator new(0xA0uLL);
    v49[1] = 0;
    v49[2] = 0;
    *v49 = &off_250B0D8C8;
    v50 = (void **)v162;
    *((_QWORD *)v162 + 4) = sub_23A028150(v49 + 3, v182, 0, 0, 1);
    v55 = (std::__shared_weak_count *)*((_QWORD *)v162 + 5);
    v153 = (uint64_t *)(v162 + 32);
    *((_QWORD *)v162 + 5) = v49;
    if (v55)
    {
      p_shared_owners = (unint64_t *)&v55->__shared_owners_;
      do
        v57 = __ldaxr(p_shared_owners);
      while (__stlxr(v57 - 1, p_shared_owners));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
    objc_msgSend_runTimeParamsPath(v161, v51, v52, v53, v54);
    v62 = objc_claimAutoreleasedReturnValue();
    v154 = (void *)v62;
    if (v62)
    {
      v176 = v158;
      objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x24BDBCE50], v58, v62, 0, (uint64_t)&v176);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v176;

      if (!v63)
      {
        if (a6)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v65, (uint64_t)CFSTR("could not load resources"), (uint64_t)v64, v66);
          v48 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v48 = 0;
        }
        v158 = v64;
LABEL_72:

        v145 = (void **)v183[0];
        if (v183[0])
        {
          do
          {
            v148 = (void **)*v145;
            if (*((char *)v145 + 47) < 0)
              operator delete(v145[3]);
            operator delete(v145);
            v145 = v148;
          }
          while (v148);
        }
        v146 = v182[0];
        v182[0] = 0;
        if (v146)
          operator delete(v146);
        goto LABEL_75;
      }
      v175 = v64;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v65, (uint64_t)v63, 0, (uint64_t)&v175);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = v175;

      if (!v67)
      {
        if (a6)
        {
          objc_msgSend_localizedDescription(v158, v68, v69, v70, v71);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v150, (uint64_t)v149, v151, v152);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v48 = 0;
        goto LABEL_72;
      }
      v72 = [CSUCaptionRuntimeParameters alloc];
      v76 = objc_msgSend_initWithOptions_(v72, v73, (uint64_t)v67, v74, v75);
      v77 = (void *)*((_QWORD *)v162 + 2);
      *((_QWORD *)v162 + 2) = v76;

      v50 = (void **)v162;
    }
    v78 = objc_msgSend_genderOption(v50[2], v58, v59, v60, v61);
    v83 = v78;
    if (v78)
    {
      *((_DWORD *)v50 + 2) = v78;
      if (v50[2])
      {
LABEL_34:
        v84 = objc_alloc(MEMORY[0x24BDBCEB8]);
        objc_msgSend_blackListRules(v50[2], v85, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = (void *)objc_msgSend_initWithArray_(v84, v90, (uint64_t)v89, v91, v92);

        v94 = [CSUCaptionPostProcessingHandler alloc];
        v98 = objc_msgSend_initWithRuntimeParameters_(v94, v95, *((_QWORD *)v162 + 2), v96, v97);
        v99 = (void *)*((_QWORD *)v162 + 3);
        *((_QWORD *)v162 + 3) = v98;
LABEL_45:

        if (!v83)
        {
          v173 = 0u;
          v174 = 0u;
          v171 = 0u;
          v172 = 0u;
          objc_msgSend_genderedTokens(*((void **)v162 + 2), v101, v102, v103, v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v106, (uint64_t)&v171, (uint64_t)v188, 16);
          if (v110)
          {
            v111 = *(_QWORD *)v172;
            do
            {
              for (j = 0; j != v110; ++j)
              {
                if (*(_QWORD *)v172 != v111)
                  objc_enumerationMutation(v105);
                v113 = (void *)MEMORY[0x24BDD1798];
                objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v107, (uint64_t)CFSTR("\\b%@\\b"), v108, v109, *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * j), v153, v154);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_regularExpressionWithPattern_options_error_(v113, v115, (uint64_t)v114, 1, 0);
                v116 = (void *)objc_claimAutoreleasedReturnValue();

                if (v116)
                  objc_msgSend_addObject_(v93, v117, (uint64_t)v116, v118, v119);

              }
              v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v107, (uint64_t)&v171, (uint64_t)v188, 16);
            }
            while (v110);
          }

        }
        __dst = 0u;
        v165 = 0u;
        v166 = 0u;
        v167 = 0u;
        BYTE8(__dst) = 1;
        __asm { FMOV            V0.2S, #1.0 }
        v168 = _D0;
        v169 = 0xA00000003;
        v170 = 1065353216;
        v162[136] = 0;
        *(_OWORD *)(v162 + 120) = __dst;
        sub_23A002C40((uint64_t)(v162 + 144), (uint64_t)&v165 + 8);
        v125 = *((_QWORD *)&v167 + 1);
        *((_QWORD *)&v167 + 1) = 0;
        v126 = (void *)*((_QWORD *)v162 + 22);
        *((_QWORD *)v162 + 22) = v125;

        v127 = v168;
        *((_QWORD *)v162 + 25) = v169;
        *(_OWORD *)(v162 + 184) = v127;
        *((_DWORD *)v162 + 52) = v170;

        if ((_BYTE)v167)
        {
          v132 = *((_QWORD *)&v165 + 1);
          if (*((_QWORD *)&v165 + 1))
          {
            v133 = v166;
            v134 = (void *)*((_QWORD *)&v165 + 1);
            if ((_QWORD)v166 != *((_QWORD *)&v165 + 1))
            {
              do
              {
                if (*(char *)(v133 - 1) < 0)
                  operator delete(*(void **)(v133 - 24));
                v133 -= 24;
              }
              while (v133 != v132);
              v134 = (void *)*((_QWORD *)&v165 + 1);
            }
            *(_QWORD *)&v166 = v132;
            operator delete(v134);
          }
        }
        *((_QWORD *)v162 + 24) = a5;
        *((_QWORD *)v162 + 15) = objc_msgSend_maxSeqLen(v161, v128, v129, v130, v131);
        *((_DWORD *)v162 + 50) = v155;
        v139 = objc_msgSend_copy(v93, v135, v136, v137, v138);
        v140 = (void *)*((_QWORD *)v162 + 22);
        *((_QWORD *)v162 + 22) = v139;

        v141 = operator new(0xF8uLL);
        sub_23A0035D4(v141, (uint64_t)(v162 + 120), v153);
        v142 = (std::__shared_weak_count *)*((_QWORD *)v162 + 7);
        *((_QWORD *)v162 + 6) = v141 + 3;
        *((_QWORD *)v162 + 7) = v141;
        if (v142)
        {
          v143 = (unint64_t *)&v142->__shared_owners_;
          do
            v144 = __ldaxr(v143);
          while (__stlxr(v144 - 1, v143));
          if (!v144)
          {
            ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
            std::__shared_weak_count::__release_weak(v142);
          }
        }
        v48 = v162;

        goto LABEL_72;
      }
    }
    else
    {
      v83 = objc_msgSend_excludeGenderStrategy(v50[2], v79, v80, v81, v82) == 2;
      *((_DWORD *)v50 + 2) = v83;
      if (v50[2])
        goto LABEL_34;
    }
    v100 = v50[22];
    v50[22] = 0;

    v93 = 0;
    v99 = (void *)*((_QWORD *)v162 + 3);
    *((_QWORD *)v162 + 3) = 0;
    goto LABEL_45;
  }
  v48 = 0;
LABEL_77:

  return v48;
}

- (shared_ptr<csu::CustomVocabulary>)vocabulary
{
  CustomVocabulary **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<csu::CustomVocabulary> result;

  cntrl = self->_vocabulary.__cntrl_;
  *v2 = self->_vocabulary.__ptr_;
  v2[1] = (CustomVocabulary *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CustomVocabulary *)self;
  return result;
}

- (void)setVocabulary:(shared_ptr<csu::CustomVocabulary>)a3
{
  __shared_weak_count *v3;
  CustomVocabulary *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(CustomVocabulary **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_vocabulary.__cntrl_;
  self->_vocabulary.__ptr_ = v4;
  self->_vocabulary.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (shared_ptr<csu::BeamSearch>)beamSearch
{
  BeamSearch **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<csu::BeamSearch> result;

  cntrl = self->_beamSearch.__cntrl_;
  *v2 = self->_beamSearch.__ptr_;
  v2[1] = (BeamSearch *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BeamSearch *)self;
  return result;
}

- (void)setBeamSearch:(shared_ptr<csu::BeamSearch>)a3
{
  __shared_weak_count *v3;
  BeamSearch *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(BeamSearch **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_beamSearch.__cntrl_;
  self->_beamSearch.__ptr_ = v4;
  self->_beamSearch.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (BeamSearchOptions)beamSearchOptions
{
  optional<std::vector<std::string>> *p_excludeTokens;
  BeamSearchOptions *result;

  *(_OWORD *)&retstr->maxSeqLen = *(_OWORD *)&self->_beamSearchOptions.maxSeqLen;
  retstr->maxSteps.__engaged_ = self->_beamSearchOptions.maxSteps.__engaged_;
  retstr->excludeTokens.var0.__null_state_ = 0;
  p_excludeTokens = &retstr->excludeTokens;
  retstr->excludeTokens.__engaged_ = 0;
  if (self->_beamSearchOptions.excludeTokens.__engaged_)
  {
    p_excludeTokens->var0.__val_.__begin_ = 0;
    *(_OWORD *)&retstr->excludeTokens.var0.__val_.__end_ = 0uLL;
    sub_239FF559C(&p_excludeTokens->var0.__null_state_, (uint64_t)self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_, (uint64_t)self->_beamSearchOptions.excludeTokens.var0.__val_.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_beamSearchOptions.excludeTokens.var0.__val_.__end_- (char *)self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_) >> 3));
    retstr->excludeTokens.__engaged_ = 1;
  }
  result = self->_beamSearchOptions.denyListRules;
  retstr->denyListRules = (NSArray *)result;
  *(_OWORD *)&retstr->lengthNormalizationAlpha = *(_OWORD *)&self->_beamSearchOptions.lengthNormalizationAlpha;
  *(_QWORD *)&retstr->beamWidth = *(_QWORD *)&self->_beamSearchOptions.beamWidth;
  retstr->lengthNormalizationAlpha_2 = self->_beamSearchOptions.lengthNormalizationAlpha_2;
  return result;
}

- (void)setBeamSearchOptions:(BeamSearchOptions *)a3
{
  __int128 v5;
  uint64_t v6;

  v5 = *(_OWORD *)&a3->maxSeqLen;
  self->_beamSearchOptions.maxSteps.__engaged_ = a3->maxSteps.__engaged_;
  *(_OWORD *)&self->_beamSearchOptions.maxSeqLen = v5;
  sub_23A002D7C((uint64_t)&self->_beamSearchOptions.excludeTokens, (uint64_t)&a3->excludeTokens);
  objc_storeStrong((id *)&self->_beamSearchOptions.denyListRules, a3->denyListRules);
  *(_OWORD *)&self->_beamSearchOptions.lengthNormalizationAlpha = *(_OWORD *)&a3->lengthNormalizationAlpha;
  v6 = *(_QWORD *)&a3->beamWidth;
  self->_beamSearchOptions.lengthNormalizationAlpha_2 = a3->lengthNormalizationAlpha_2;
  *(_QWORD *)&self->_beamSearchOptions.beamWidth = v6;
}

- (EspressoTensor)encodedFeaturesBuffer
{
  EspressoTensor *v3;
  int begin;
  unint64_t *value;
  unint64_t *end;
  int64_t v8;
  unint64_t *v9;
  unint64_t *v10;
  __shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;

  v3 = self;
  retstr->_vptr$Tensor = (void **)&off_250B0DCE8;
  begin = (int)self[1].shape_.sizes_.__begin_;
  retstr->shape_.sizes_.__begin_ = 0;
  retstr->type_ = begin;
  retstr->shape_.sizes_.__end_ = 0;
  retstr->shape_.sizes_.__end_cap_.__value_ = 0;
  end = self[1].shape_.sizes_.__end_;
  value = self[1].shape_.sizes_.__end_cap_.__value_;
  v8 = (char *)value - (char *)end;
  if (value != end)
  {
    if (v8 < 0)
      sub_239FEBE68();
    v9 = (unint64_t *)operator new((char *)value - (char *)end);
    retstr->shape_.sizes_.__begin_ = v9;
    v10 = &v9[v8 >> 3];
    retstr->shape_.sizes_.__end_cap_.__value_ = v10;
    self = (EspressoTensor *)memcpy(v9, end, v8);
    retstr->shape_.sizes_.__end_ = v10;
  }
  v11 = (__shared_weak_count *)v3[2]._vptr$Tensor;
  retstr->storage_.__ptr_ = (TensorStorage *)v3[1].storage_.__cntrl_;
  retstr->storage_.__cntrl_ = v11;
  if (v11)
  {
    v12 = (unint64_t *)((char *)v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  retstr->_vptr$Tensor = (void **)&off_250B0DB88;
  return self;
}

- (void)setEncodedFeaturesBuffer:(EspressoTensor *)a3
{
  __shared_weak_count *cntrl;
  TensorStorage *ptr;
  unint64_t *v7;
  unint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;

  self->_encodedFeaturesBuffer.type_ = a3->type_;
  if (&self->_encodedFeaturesBuffer != a3)
    sub_239FF49DC(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)a3->shape_.sizes_.__begin_, (char *)a3->shape_.sizes_.__end_, a3->shape_.sizes_.__end_ - a3->shape_.sizes_.__begin_);
  ptr = a3->storage_.__ptr_;
  cntrl = a3->storage_.__cntrl_;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  self->_encodedFeaturesBuffer.storage_.__ptr_ = ptr;
  self->_encodedFeaturesBuffer.storage_.__cntrl_ = cntrl;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v9 + 16))(v9);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
    }
  }
}

- (CSUCaptionRuntimeParameters)runTimeParams
{
  return self->_runTimeParams;
}

- (void)setRunTimeParams:(id)a3
{
  objc_storeStrong((id *)&self->_runTimeParams, a3);
}

- (int)genderOptionForBeamSearch
{
  return self->_genderOptionForBeamSearch;
}

- (void)setGenderOptionForBeamSearch:(int)a3
{
  self->_genderOptionForBeamSearch = a3;
}

- (CSUCaptionPostProcessingHandler)postProcessingHandler
{
  return self->_postProcessingHandler;
}

- (void)setPostProcessingHandler:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessingHandler, a3);
}

- (void).cxx_destruct
{
  void **begin;
  void **end;
  void *v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  __shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;

  if (self->_beamSearchOptions.excludeTokens.__engaged_)
  {
    begin = (void **)self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_;
    if (begin)
    {
      end = (void **)self->_beamSearchOptions.excludeTokens.var0.__val_.__end_;
      v5 = self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_;
      if (end != begin)
      {
        do
        {
          if (*((char *)end - 1) < 0)
            operator delete(*(end - 3));
          end -= 3;
        }
        while (end != begin);
        v5 = self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_;
      }
      self->_beamSearchOptions.excludeTokens.var0.__val_.__end_ = begin;
      operator delete(v5);
    }
  }
  self->_encodedFeaturesBuffer._vptr$Tensor = (void **)&off_250B0DCE8;
  cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      v9 = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
      if (!v9)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  v9 = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
  if (v9)
  {
LABEL_15:
    self->_encodedFeaturesBuffer.shape_.sizes_.__end_ = v9;
    operator delete(v9);
  }
LABEL_16:
  v10 = self->_beamSearch.__cntrl_;
  if (!v10)
    goto LABEL_20;
  v11 = (unint64_t *)((char *)v10 + 8);
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v10 + 16))(v10);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
    v13 = self->_vocabulary.__cntrl_;
    if (!v13)
      goto LABEL_28;
  }
  else
  {
LABEL_20:
    v13 = self->_vocabulary.__cntrl_;
    if (!v13)
      goto LABEL_28;
  }
  v14 = (unint64_t *)((char *)v13 + 8);
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v13 + 16))(v13);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
  }
LABEL_28:
  objc_storeStrong((id *)&self->_postProcessingHandler, 0);
  objc_storeStrong((id *)&self->_runTimeParams, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 18) = 4;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 8) = &off_250B0DB88;
  *((_BYTE *)self + 128) = 1;
  *((_BYTE *)self + 132) = 0;
  *((_BYTE *)self + 136) = 0;
  *((_BYTE *)self + 144) = 0;
  *((_BYTE *)self + 168) = 0;
  *((_QWORD *)self + 22) = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *((_QWORD *)self + 23) = _D0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0xA00000003;
  *((_DWORD *)self + 52) = 1065353216;
  return self;
}

@end
