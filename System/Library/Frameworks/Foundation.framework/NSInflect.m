@implementation NSInflect

_NSLexiconMorphunDictionary *___NSInflect_block_invoke(uint64_t a1, uint64_t a2)
{
  _NSLexiconMorphunDictionary *v4;
  void *v5;

  v4 = (_NSLexiconMorphunDictionary *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", a2);
  if (!v4)
  {
    v4 = -[_NSLexiconMorphunDictionary initWithLanguage:]([_NSLexiconMorphunDictionary alloc], "initWithLanguage:", a2);
    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v5)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, a2);
    }
  }
  return v4;
}

void ___NSInflect_block_invoke_2(uint64_t a1, NSInflectionRule *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  BOOL v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  __objc2_meth_list **p_opt_inst_meths;
  NSObject *v25;
  unint64_t v26;
  uint64_t v27;
  NSString *v28;
  int v29;
  NSString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  void *v35;
  uint64_t v36;
  NSUInteger v37;
  uint64_t v38;
  id v39;
  void *v40;
  NSObject *v41;
  NSUInteger v42;
  NSUInteger v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSString *v49;
  NSString *v50;
  NSString *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  NSObject *v59;
  NSString *v60;
  uint64_t v61;
  const char *v62;
  NSObject *v63;
  uint64_t v64;
  NSString *v65;
  uint64_t v66;
  const char *v67;
  NSObject *v68;
  uint32_t v69;
  NSString *v70;
  NSString *v71;
  uint64_t v72;
  NSObject *v73;
  _NSAttributedStringGrammarInflection *v74;
  _NSAttributedStringGrammarInflection *v75;
  BOOL v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  NSString *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t j;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t k;
  void *v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSString *v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  NSString *v112;
  _BOOL4 v113;
  NSObject *v114;
  const char *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  NSObject *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  NSString *v129;
  uint64_t v130;
  NSString *v131;
  uint64_t v132;
  NSObject *v133;
  NSString *v134;
  const char *v135;
  NSString *v136;
  NSString *v137;
  uint64_t v138;
  NSString *v139;
  uint64_t v140;
  NSString *v141;
  uint64_t v142;
  NSString *v143;
  uint64_t v144;
  NSString *v145;
  NSString *v146;
  uint64_t v147;
  NSString *v148;
  NSString *v149;
  NSString *v150;
  uint64_t v151;
  NSString *v152;
  uint64_t v153;
  int v154;
  NSString *v155;
  int v156;
  BOOL v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  id obj;
  id obja;
  NSUInteger v163;
  NSMorphology *v164;
  _QWORD v166[14];
  uint64_t v167[2];
  uint64_t (*v168)(uint64_t *, void *);
  void *v169;
  NSMorphology *v170;
  uint64_t v171;
  uint64_t v172;
  _QWORD *v173;
  _BYTE *v174;
  uint64_t *v175;
  _QWORD v176[2];
  uint64_t (*v177)(_QWORD *, void *, uint64_t);
  void *v178;
  uint64_t *v179;
  uint64_t *v180;
  uint64_t *v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  void (*v187)(uint64_t, uint64_t);
  void (*v188)(uint64_t);
  NSMorphology *v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  void (*v193)(uint64_t, uint64_t);
  void (*v194)(uint64_t);
  NSMorphology *v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  void (*v199)(uint64_t, uint64_t);
  void (*v200)(uint64_t);
  NSMorphology *v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  void (*v205)(uint64_t, uint64_t);
  void (*v206)(uint64_t);
  NSMorphology *v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  void (*v211)(uint64_t, uint64_t);
  void (*v212)(uint64_t);
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t *v216;
  uint64_t v217;
  uint64_t v218;
  uint8_t v219[4];
  void *v220;
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  NSMorphology *v224;
  _BYTE v225[128];
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  _BYTE v230[128];
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  _BYTE buf[24];
  NSString *v236;
  __int128 v237;
  _BYTE v238[128];
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  _BYTE v243[128];
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  uint64_t v248;
  NSRange v249;
  NSRange v250;
  NSRange v251;
  NSRange v252;
  NSRange v253;
  NSRange v254;
  NSRange v255;
  NSRange v256;
  NSRange v257;
  NSRange v258;
  NSRange v259;
  NSRange v260;
  NSRange v261;
  NSRange v262;
  NSRange v263;
  NSRange v264;
  NSRange v265;
  NSRange v266;
  NSRange v267;
  NSRange v268;
  NSRange v269;
  NSRange v270;

  v248 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v244 = 0u;
  v245 = 0u;
  v246 = 0u;
  v247 = 0u;
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v244, v243, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v245;
    v11 = a3 + a4;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v245 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "replacementRangeInResult");
        if (v14 + v15 >= v11)
          v16 = a3 + a4;
        else
          v16 = v14 + v15;
        if (a3 > v14 || v14 >= v11)
        {
          v18 = v14 > a3 || a3 >= v14 + v15;
          v14 = a3;
          if (v18)
            continue;
        }
        if (v16 != v14)
          objc_msgSend(v7, "addObject:", v13);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v244, v243, 16);
    }
    while (v9);
  }
  if (_NSInflectionLog_onceToken != -1)
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  v19 = _NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    v47 = objc_msgSend(*(id *)(a1 + 32), "count");
    v48 = objc_msgSend(v7, "count");
    v249.location = a3;
    v249.length = a4;
    *(_DWORD *)buf = 134349570;
    *(_QWORD *)&buf[4] = v47;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2114;
    v236 = NSStringFromRange(v249);
    _os_log_debug_impl(&dword_1817D9000, v19, OS_LOG_TYPE_DEBUG, "%{public}lld format specifiers are relevant (out of %{public}lld) in range %{public}@", buf, 0x20u);
  }
  if (!*(_BYTE *)(a1 + 136))
  {
LABEL_45:
    v215 = 0;
    v216 = &v215;
    v217 = 0x2020000000;
    v218 = 0;
    v164 = objc_alloc_init(NSMorphology);
    v214 = 0;
    p_opt_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.opt_inst_meths;
    if (-[NSInflectionRule isEqual:](a2, "isEqual:", MEMORY[0x1E0C9AAA0]))
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v25 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v250.location = a3;
        v250.length = a4;
        v49 = NSStringFromRange(v250);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v49;
        _os_log_debug_impl(&dword_1817D9000, v25, OS_LOG_TYPE_DEBUG, "NSInflect attribute is NO, not inflecting in range %{public}@", buf, 0xCu);
      }

LABEL_285:
      _Block_object_dispose(&v215, 8);
      return;
    }
    v163 = a4;
    if ((-[NSInflectionRule isEqual:](a2, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0
      && +[NSInflectionRule automaticRule](NSInflectionRule, "automaticRule") != a2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSMorphology mergeMorphology:override:]((uint64_t)v164, -[NSMorphology initWithInflection:]([NSMorphology alloc], "initWithInflection:", a2), 1);
          v216[3] |= 2uLL;
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v46 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            v255.location = a3;
            v255.length = a4;
            v70 = NSStringFromRange(v255);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v164;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v70;
            _os_log_debug_impl(&dword_1817D9000, v46, OS_LOG_TYPE_DEBUG, "NSInflect attribute is an internal inflection object (%@), using it in range %{public}@", buf, 0x16u);
          }
        }
        v156 = 0;
        v160 = 0;
        obja = 0;
        v28 = 0;
        v29 = 1;
        goto LABEL_139;
      }
      -[NSMorphology mergeMorphology:override:]((uint64_t)v164, (void *)-[NSInflectionRule morphology](a2, "morphology"), 1);
      v216[3] |= 2uLL;
      if (-[NSInflectionRule referentConcept](a2, "referentConcept"))
      {
        if (-[NSInflectionRule referentConcept](a2, "referentConcept") < 1
          || (v26 = -[NSInflectionRule referentConcept](a2, "referentConcept"),
              v26 > objc_msgSend(*(id *)(a1 + 64), "count")))
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v27 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
            goto LABEL_60;
          v269.location = a3;
          v269.length = a4;
          v150 = NSStringFromRange(v269);
          v151 = -[NSInflectionRule referentConcept](a2, "referentConcept");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v150;
          *(_WORD *)&buf[12] = 2050;
          *(_QWORD *)&buf[14] = v151;
          v67 = "NSInflectionReferentConcept attribute in range %{public}@ is set to %{public}ld which is out of bounds.";
          v68 = v27;
          v69 = 22;
LABEL_288:
          _os_log_error_impl(&dword_1817D9000, v68, OS_LOG_TYPE_ERROR, v67, buf, v69);
LABEL_60:
          v28 = 0;
          v29 = 0;
          goto LABEL_97;
        }
        v28 = (NSString *)objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", -[NSInflectionRule referentConcept](a2, "referentConcept") - 1);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v64 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
            goto LABEL_60;
          v254.location = a3;
          v254.length = a4;
          v65 = NSStringFromRange(v254);
          v66 = -[NSInflectionRule referentConcept](a2, "referentConcept");
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)&buf[4] = v65;
          *(_WORD *)&buf[12] = 2050;
          *(_QWORD *)&buf[14] = v66;
          *(_WORD *)&buf[22] = 2113;
          v236 = v28;
          v67 = "NSInflectionReferentConcept attribute in range %{public}@ is set to %{public}ld. Expected a 'TermOfAddre"
                "ss' concept, but found %{private}@ instead.";
          v68 = v64;
          v69 = 32;
          goto LABEL_288;
        }
      }
      else
      {
        v28 = 0;
      }
      v29 = 1;
LABEL_97:
      if (-[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument"))
      {
        if (-[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument") >= 1)
        {
          v242 = 0u;
          v241 = 0u;
          v240 = 0u;
          v239 = 0u;
          v53 = *(void **)(a1 + 32);
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v239, v238, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v240;
LABEL_101:
            v56 = 0;
            while (1)
            {
              if (*(_QWORD *)v240 != v55)
                objc_enumerationMutation(v53);
              v160 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * v56);
              v57 = objc_msgSend(v160, "index");
              if (v57 == -[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument"))
                break;
              if (v54 == ++v56)
              {
                v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v239, v238, 16);
                a4 = v163;
                if (v54)
                  goto LABEL_101;
                goto LABEL_121;
              }
            }
            a4 = v163;
            if (!v160)
              goto LABEL_121;
            p_opt_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.opt_inst_meths;
            if (-[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept"))
            {
              if (_NSInflectionLog_onceToken != -1)
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              v63 = _NSInflectionLog_log;
              if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                obja = 0;
                goto LABEL_136;
              }
              v270.location = a3;
              v270.length = v163;
              v152 = NSStringFromRange(v270);
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v152;
              _os_log_error_impl(&dword_1817D9000, v63, OS_LOG_TYPE_ERROR, "Both NSInflectionAgreementArgument and NSInflectionAgreementConcept attributes specified in range %{public}@. The latter will be discarded.", buf, 0xCu);
            }
            goto LABEL_126;
          }
        }
LABEL_121:
        p_opt_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.opt_inst_meths;
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v59 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
LABEL_124:
          v29 = 0;
          v160 = 0;
          obja = 0;
LABEL_136:
          v73 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            v268.location = a3;
            v268.length = a4;
            v149 = NSStringFromRange(v268);
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = a2;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v164;
            *(_WORD *)&buf[22] = 2114;
            v236 = v149;
            _os_log_debug_impl(&dword_1817D9000, v73, OS_LOG_TYPE_DEBUG, "NSInflect attribute is an inflection rule (%@ / %@), using it in range %{public}@", buf, 0x20u);
          }
          v156 = 0;
LABEL_139:
          v158 = a4;
          v159 = a3;
          goto LABEL_140;
        }
        v256.location = a3;
        v256.length = a4;
        v71 = NSStringFromRange(v256);
        v72 = -[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v71;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v72;
        v62 = "NSInflectionAgreementArgument attribute in range %{public}@ is set to %{public}ld which is out of bounds.";
      }
      else
      {
        if (!-[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept"))
        {
          v160 = 0;
LABEL_126:
          obja = 0;
          goto LABEL_134;
        }
        if (-[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept") >= 1)
        {
          v58 = -[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept");
          if (v58 <= objc_msgSend(*(id *)(a1 + 64), "count"))
          {
            obja = (id)objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", -[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept") - 1);
            v160 = 0;
            goto LABEL_134;
          }
        }
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v59 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          goto LABEL_124;
        v253.location = a3;
        v253.length = a4;
        v60 = NSStringFromRange(v253);
        v61 = -[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v61;
        v62 = "NSInflectionAgreementConcept attribute in range %{public}@ is set to %{public}ld which is out of bounds.";
      }
      _os_log_error_impl(&dword_1817D9000, v59, OS_LOG_TYPE_ERROR, v62, buf, 0x16u);
      v160 = 0;
      obja = 0;
      v29 = 0;
LABEL_134:
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      goto LABEL_136;
    }
    if (objc_msgSend(v7, "count"))
    {
      if (objc_msgSend(v7, "count") == 1)
      {
        v30 = _NSInflectionLanguageWithLensAndRange(*(_QWORD *)(a1 + 88), a3, a4);
        v31 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "replacementRangeInResult");
        v33 = v32;
        v159 = v31;
        v34 = v31 - a3;
        v35 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        v36 = objc_msgSend(v35, "lowercaseStringWithLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v30));
        v37 = a4 - v33 - v34;
        v38 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        LOBYTE(v208) = 0;
        LOBYTE(v202) = 0;
        v39 = +[NSMorphology _heuristicMorphologyForLanguage:prefix:suffix:featureName:matchedPrefix:matchedSuffix:](NSMorphology, "_heuristicMorphologyForLanguage:prefix:suffix:featureName:matchedPrefix:matchedSuffix:", v30, v36, v38, &v214, &v208, &v202);
        if (v208 | v202)
        {
          v40 = v39;
          obj = v35;
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v41 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v40;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v214;
            _os_log_debug_impl(&dword_1817D9000, v41, OS_LOG_TYPE_DEBUG, "Found heuristic for prefix / suffix pair: %@, %@", buf, 0x16u);
          }
          if (v40)
            -[NSMorphology mergeMorphology:override:]((uint64_t)v164, v40, 1);
          objc_msgSend(v7, "removeAllObjects");
          if ((_BYTE)v208)
            v42 = v34;
          else
            v42 = 0;
          if ((_BYTE)v202)
            v43 = v37;
          else
            v43 = 0;
          v158 = a4 - v42 - v43;
          if ((_BYTE)v208)
          {
            v156 = objc_msgSend(obj, "isEqualToString:", v36) ^ 1;
          }
          else
          {
            v156 = 0;
            v159 = a3;
          }
          goto LABEL_81;
        }
      }
    }
    else
    {
      v44 = (void *)objc_msgSend(*(id *)(a1 + 56), "_morphologyForLanguage:", _NSInflectionLanguageWithLensAndRange(*(_QWORD *)(a1 + 88), a3, a4));
      -[NSMorphology mergeMorphology:override:]((uint64_t)v164, v44, 1);
      if (-[NSMorphology grammaticalGender](v164, "grammaticalGender") == NSGrammaticalGenderNeuter)
        -[NSMorphology setGrammaticalGender:](v164, "setGrammaticalGender:", 4);
    }
    v156 = 0;
    v158 = a4;
    v159 = a3;
LABEL_81:
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v45 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      v251.location = a3;
      v251.length = a4;
      v50 = NSStringFromRange(v251);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v164;
      _os_log_debug_impl(&dword_1817D9000, v45, OS_LOG_TYPE_DEBUG, "NSInflect attribute is YES, using automatic inflection in range %{public}@, initial target: %@", buf, 0x16u);
    }
    v160 = 0;
    obja = 0;
    v28 = 0;
    v29 = 1;
LABEL_140:
    if (-[NSMorphology isIdentity](v164))
    {
      v74 = (_NSAttributedStringGrammarInflection *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      if (_NSIsNSDictionary())
        v74 = -[_NSAttributedStringGrammarInflection initWithExternalRepresentationDictionary:error:]([_NSAttributedStringGrammarInflection alloc], "initWithExternalRepresentationDictionary:error:", v74, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v74 = -[_NSAttributedStringGrammarInflection initWithMorphology:]([_NSAttributedStringGrammarInflection alloc], "initWithMorphology:", v74);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v75 = v74;
      else
        v75 = 0;
      v76 = v75 != 0;
      if (v75)
      {
        -[NSMorphology mergeMorphology:override:]((uint64_t)v164, -[NSMorphology initWithInflection:]([NSMorphology alloc], "initWithInflection:", v75), 1);
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v77 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
        {
          v265.location = a3;
          v265.length = a4;
          v145 = NSStringFromRange(v265);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v164;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v145;
          _os_log_debug_impl(&dword_1817D9000, v77, OS_LOG_TYPE_DEBUG, "Inflection was identity; assumed inflection attribute value %{public}@ will be used instead in range %{public}@",
            buf,
            0x16u);
        }
        v29 = 1;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    }
    else
    {
      v76 = 0;
    }
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v78 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      v257.location = a3;
      v257.length = a4;
      v97 = NSStringFromRange(v257);
      v98 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v97;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v98;
      *(_WORD *)&buf[22] = 2112;
      v236 = (NSString *)a2;
      LOWORD(v237) = 2112;
      *(_QWORD *)((char *)&v237 + 2) = v164;
      _os_log_debug_impl(&dword_1817D9000, v78, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld will be inflected with requested inflection: %@, resolved inflection %@", buf, 0x2Au);
    }
    v157 = v76;
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    v79 = objc_msgSend(v7, "count");
    if (v160 || v79 || obja)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      v236 = (NSString *)__Block_byref_object_copy__7;
      *(_QWORD *)&v237 = __Block_byref_object_dispose__7;
      *((_QWORD *)&v237 + 1) = 0;
      v208 = 0;
      v209 = &v208;
      v210 = 0x3052000000;
      v211 = __Block_byref_object_copy__7;
      v212 = __Block_byref_object_dispose__7;
      v213 = 0;
      v202 = 0;
      v203 = &v202;
      v204 = 0x3052000000;
      v205 = __Block_byref_object_copy__7;
      v206 = __Block_byref_object_dispose__7;
      v207 = 0;
      v207 = objc_alloc_init(NSMorphology);
      v196 = 0;
      v197 = &v196;
      v198 = 0x3052000000;
      v199 = __Block_byref_object_copy__7;
      v200 = __Block_byref_object_dispose__7;
      v201 = 0;
      v201 = objc_alloc_init(NSMorphology);
      v190 = 0;
      v191 = &v190;
      v192 = 0x3052000000;
      v193 = __Block_byref_object_copy__7;
      v194 = __Block_byref_object_dispose__7;
      v195 = 0;
      v195 = objc_alloc_init(NSMorphology);
      v184 = 0;
      v185 = &v184;
      v186 = 0x3052000000;
      v187 = __Block_byref_object_copy__7;
      v188 = __Block_byref_object_dispose__7;
      v189 = 0;
      v154 = v29;
      v155 = v28;
      v189 = objc_alloc_init(NSMorphology);
      v176[0] = MEMORY[0x1E0C809B0];
      v176[1] = 3221225472;
      v177 = ___NSInflect_block_invoke_19;
      v178 = &unk_1E0F4E8C0;
      v179 = &v196;
      v180 = &v202;
      v181 = &v215;
      v182 = &v190;
      v183 = &v184;
      v167[0] = MEMORY[0x1E0C809B0];
      v167[1] = 3221225472;
      v168 = ___NSInflect_block_invoke_22;
      v169 = &unk_1E0F4E8E8;
      v174 = buf;
      v175 = &v208;
      v80 = *(_QWORD *)(a1 + 88);
      v172 = *(_QWORD *)(a1 + 104);
      v173 = v176;
      v170 = v164;
      v171 = v80;
      if (obja)
      {
        a4 = v163;
        v81 = _NSInflectionLanguageWithLensAndRange(v80, a3, v163);
        if (_NSIsNSString())
        {
          v82 = objc_msgSend((id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 104) + 16))(), "allPossibleWordAttributesForWord:", obja);
          v177(v176, (void *)v82, 0);
        }
        else if (_NSIsNSArray())
        {
          v234 = 0u;
          v232 = 0u;
          v233 = 0u;
          v231 = 0u;
          v83 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v231, v230, 16);
          if (v83)
          {
            v84 = *(_QWORD *)v232;
            while (2)
            {
              for (j = 0; j != v83; ++j)
              {
                if (*(_QWORD *)v232 != v84)
                  objc_enumerationMutation(obja);
                v86 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && objc_msgSend(v86, "_isSupportedInLanguage:", v81))
                {
                  v87 = (void *)objc_msgSend(v86, "_withExtrapolatedPronouns");
                  goto LABEL_197;
                }
              }
              v83 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v231, v230, 16);
              if (v83)
                continue;
              break;
            }
          }
          v87 = 0;
LABEL_197:
          v99 = (void *)objc_msgSend(v87, "_morphologyForLanguage:", v81);
          if (v99)
            -[NSMorphology mergeMorphology:override:]((uint64_t)v164, v99, 0);
        }
      }
      else
      {
        a4 = v163;
        if (v160)
        {
          ___NSInflect_block_invoke_22(v167, v160);
        }
        else
        {
          v228 = 0u;
          v229 = 0u;
          v226 = 0u;
          v227 = 0u;
          v88 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v226, v225, 16);
          if (v88)
          {
            v89 = *(_QWORD *)v227;
            do
            {
              for (k = 0; k != v88; ++k)
              {
                if (*(_QWORD *)v227 != v89)
                  objc_enumerationMutation(v7);
                v91 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * k);
                v92 = objc_msgSend(v91, "replacementRangeInResult");
                v94 = v93;
                if (objc_msgSend(v91, "replacementKind") != 2 && a3 <= v92 && a3 + v163 >= v92 + v94)
                  v168(v167, v91);
              }
              v88 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v226, v225, 16);
              a4 = v163;
            }
            while (v88);
          }
        }
      }
      -[NSMorphology mergeMorphology:override:]((uint64_t)v164, (void *)v203[5], 0);
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v100 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v261.location = a3;
        v261.length = a4;
        v137 = NSStringFromRange(v261);
        v138 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)v219 = 138543874;
        v220 = v137;
        v221 = 2048;
        v222 = v138;
        v223 = 2112;
        v224 = v164;
        _os_log_debug_impl(&dword_1817D9000, v100, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that are unambiguous nouns: %@.", v219, 0x20u);
      }
      -[NSMorphology mergeMorphology:override:]((uint64_t)v164, (void *)v197[5], 0);
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v101 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v262.location = a3;
        v262.length = a4;
        v139 = NSStringFromRange(v262);
        v140 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)v219 = 138543874;
        v220 = v139;
        v221 = 2048;
        v222 = v140;
        v223 = 2112;
        v224 = v164;
        _os_log_debug_impl(&dword_1817D9000, v101, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that could be nouns or adjectives: %@.", v219, 0x20u);
      }
      -[NSMorphology mergeMorphology:override:]((uint64_t)v164, (void *)v191[5], 0);
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v102 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v263.location = a3;
        v263.length = a4;
        v141 = NSStringFromRange(v263);
        v142 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)v219 = 138543874;
        v220 = v141;
        v221 = 2048;
        v222 = v142;
        v223 = 2112;
        v224 = v164;
        _os_log_debug_impl(&dword_1817D9000, v102, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that are unambiguous adjectives: %@.", v219, 0x20u);
      }
      -[NSMorphology mergeMorphology:override:]((uint64_t)v164, (void *)v185[5], 0);
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v103 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v264.location = a3;
        v264.length = a4;
        v143 = NSStringFromRange(v264);
        v144 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)v219 = 138543874;
        v220 = v143;
        v221 = 2048;
        v222 = v144;
        v223 = 2112;
        v224 = v164;
        _os_log_debug_impl(&dword_1817D9000, v103, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that are other words: %@.", v219, 0x20u);
      }

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && v209[5])
      {
        -[NSMorphology applyPluralityRulesForNumbers:inLanguages:](v164, "applyPluralityRulesForNumbers:inLanguages:");
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v104 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
        {
          v266.location = a3;
          v266.length = a4;
          v146 = NSStringFromRange(v266);
          v147 = *(_QWORD *)(a1 + 128);
          *(_DWORD *)v219 = 138543874;
          v220 = v146;
          v221 = 2048;
          v222 = v147;
          v223 = 2112;
          v224 = v164;
          _os_log_debug_impl(&dword_1817D9000, v104, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with numbers supplied as replacements with result: %@.", v219, 0x20u);
        }
      }

      p_opt_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.opt_inst_meths;
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v28 = v155;
      v29 = v154;
      v105 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v219 = 138543362;
        v220 = v164;
        _os_log_debug_impl(&dword_1817D9000, v105, OS_LOG_TYPE_DEBUG, "Target inflection after applying inflections inferred from replacements: %{public}@", v219, 0xCu);
      }
      _Block_object_dispose(&v184, 8);
      _Block_object_dispose(&v190, 8);
      _Block_object_dispose(&v196, 8);
      _Block_object_dispose(&v202, 8);
      _Block_object_dispose(&v208, 8);
      _Block_object_dispose(buf, 8);
    }
    v106 = *(void **)(a1 + 40);
    if (v106)
    {
      v107 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      v108 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      LOBYTE(v153) = v157;
      objc_msgSend(v106, "willProcessInflectableRange:sourceSubstring:inflectionRule:target:alternative:assumedInflectionFallback:fallbackWasUsed:", a3, a4, v107, a2, v164, v108, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))(), v153);
    }
    if ((v216[3] & 1) == 0)
    {
      v166[7] = MEMORY[0x1E0C809B0];
      v166[8] = 3221225472;
      v166[9] = ___NSInflect_block_invoke_30;
      v166[10] = &unk_1E0F4E910;
      v110 = *(_QWORD *)(a1 + 104);
      v109 = *(_QWORD *)(a1 + 112);
      v166[11] = *(_QWORD *)(a1 + 88);
      v166[12] = v110;
      v166[13] = &v215;
      (*(void (**)(void))(v109 + 16))();
    }
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v111 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      v258.location = a3;
      v258.length = a4;
      v129 = NSStringFromRange(v258);
      v130 = *(_QWORD *)(a1 + 128);
      v131 = (NSString *)v216[3];
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v129;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v130;
      *(_WORD *)&buf[22] = 2048;
      v236 = v131;
      _os_log_debug_impl(&dword_1817D9000, v111, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- determined final disambiguation hints: %lld.", buf, 0x20u);
    }
    v112 = _NSInflectionLanguageWithLensAndRange(*(_QWORD *)(a1 + 88), a3, a4);
    v113 = _NSRequiresMorphunInflectionForLanguageIdentifier(v112);
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v114 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
    {
      v115 = "false";
      if (v113)
        v115 = "true";
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v115;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v112;
      _os_log_impl(&dword_1817D9000, v114, OS_LOG_TYPE_INFO, "Inflection engine is enabled? %{public}s for language %{public}@", buf, 0x16u);
    }
    if ((v29 & v113) != 1)
      goto LABEL_276;
    v116 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    if (!v28)
    {
      v124 = (void *)_NSInflectionGrammarWithLensAndRange(*(_QWORD *)(a1 + 88), a3, v163);
      if (v124)
      {
        -[NSMorphology mergeMorphology:override:]((uint64_t)v164, v124, 0);
        -[NSMorphology setPartOfSpeech:](v164, "setPartOfSpeech:", objc_msgSend(v124, "partOfSpeech"));
      }
      v125 = (void *)_NSLexiconInflectedStringUsingMorphun(v116, v159, v158, (uint64_t)v112, v164, v214, v7);
      if (v156)
      {
        v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v112);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3010000000;
        v236 = (NSString *)&unk_1823C230D;
        v237 = 0uLL;
        v208 = 0;
        v209 = &v208;
        v210 = 0x3052000000;
        v211 = __Block_byref_object_copy__7;
        v212 = __Block_byref_object_dispose__7;
        v213 = 0;
        v127 = objc_msgSend(v125, "length");
        v166[0] = MEMORY[0x1E0C809B0];
        v166[1] = 3221225472;
        v166[2] = ___NSInflect_block_invoke_35;
        v166[3] = &unk_1E0F4E938;
        v166[4] = v126;
        v166[5] = &v208;
        v166[6] = buf;
        objc_msgSend(v125, "enumerateSubstringsInRange:options:usingBlock:", 0, v127, 2, v166);

        v128 = (void *)v209[5];
        p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSXPCListenerDelegate + 40);
        if (v128)
        {
          v125 = (void *)objc_msgSend(v128, "stringByAppendingString:", objc_msgSend(v125, "substringFromIndex:", *(_QWORD *)(*(_QWORD *)&buf[8] + 32) + *(_QWORD *)(*(_QWORD *)&buf[8] + 40)));

        }
        _Block_object_dispose(&v208, 8);
        _Block_object_dispose(buf, 8);
      }
LABEL_268:
      if (v125)
      {
        if (v163 != v158)
          v116 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        if (objc_msgSend(v125, "isEqual:", v116))
        {
          if (p_opt_inst_meths[413] != (__objc2_meth_list *)-1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v133 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
            goto LABEL_282;
          v259.location = a3;
          v259.length = v163;
          v134 = NSStringFromRange(v259);
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v134;
          v135 = "Useful inflection but no replacement in range %{public}@";
        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
          if (p_opt_inst_meths[413] != (__objc2_meth_list *)-1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v133 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
            goto LABEL_282;
          v260.location = a3;
          v260.length = v163;
          v136 = NSStringFromRange(v260);
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v136;
          v135 = "Useful inflection with new replacement in range %{public}@";
        }
        _os_log_impl(&dword_1817D9000, v133, OS_LOG_TYPE_INFO, v135, buf, 0xCu);
LABEL_282:
        v123 = 1;
        v121 = objc_msgSend(v125, "length");
LABEL_283:

        if (v123)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, v121));
        goto LABEL_285;
      }
LABEL_276:
      v123 = 0;
      v121 = v163;
      goto LABEL_283;
    }
    v117 = preferredTermOfAddressForLanguageFromList((uint64_t)v112, v28);
    if (!v117 || (v118 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 104) + 16))()) == 0)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v121 = v163;
      v122 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v267.location = a3;
        v267.length = v163;
        v148 = NSStringFromRange(v267);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v148;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v112;
        _os_log_debug_impl(&dword_1817D9000, v122, OS_LOG_TYPE_DEBUG, "Could not find a term of address string in range %{public}@ that is compatible with language %{public}@.", buf, 0x16u);
      }
      v123 = 0;
      goto LABEL_283;
    }
    v119 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    if (v160)
    {
      v120 = (void *)objc_msgSend(v160, "argument");
      if ((_NSIsNSString() & 1) == 0)
      {
        if (_NSIsNSAttributedString())
        {
          v120 = (void *)objc_msgSend(v120, "string");
          goto LABEL_264;
        }
LABEL_263:
        v120 = 0;
      }
    }
    else
    {
      if (!obja)
        goto LABEL_263;
      if (_NSIsNSString())
        v120 = obja;
      else
        v120 = 0;
    }
LABEL_264:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v132 = v119;
    else
      v132 = 0;
    v125 = (void *)objc_msgSend(v118, "preferredPronoun:forTermOfAddress:morphology:dependency:", v116, v117, v132, v120);
    goto LABEL_268;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = -[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept")
       || -[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument")
       || -[NSInflectionRule referentConcept](a2, "referentConcept") != 0;
    if (objc_msgSend(v7, "count"))
    {
      if (!v20)
        goto LABEL_45;
      goto LABEL_38;
    }
  }
  else
  {
    if (objc_msgSend(v7, "count"))
      goto LABEL_45;
    v20 = 0;
  }
  if ((((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 72) + 16))() | v20) & 1) == 0)
    goto LABEL_45;
LABEL_38:
  if (_NSInflectionLog_onceToken != -1)
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  v21 = _NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    v252.location = a3;
    v252.length = a4;
    v51 = NSStringFromRange(v252);
    v52 = *(_QWORD *)(a1 + 128);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v52;
    _os_log_debug_impl(&dword_1817D9000, v21, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld has a format specifier or external dependency; not inflecting during preflight.",
      buf,
      0x16u);
  }
  v22 = *(void **)(a1 + 40);
  if (v22)
  {
    v23 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    objc_msgSend(v22, "didSkipInflectableRangeWithUnfilledFormatSpecifiers:sourceSubstring:inflectionRule:alternative:", a3, a4, v23, a2, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))());
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4));

}

uint64_t ___NSInflect_block_invoke_19(_QWORD *a1, void *a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "count"))
    return 5;
  if (_NSInflectionLog_onceToken != -1)
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    v6 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "Adding attributes of a single word";
      v25 = 2114;
      v26 = a2;
      _os_log_debug_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: %{public}@", buf, 0x16u);
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (!v7)
    return 4;
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(a2);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "partOfSpeech");
      if (!a3 || v15 != a3)
      {
        if (v9 || v15 != 9)
        {
          if (v10 || v15 != 6)
          {
            if (!v11)
              v11 = v14;
          }
          else
          {
            v10 = v14;
          }
        }
        else
        {
          v9 = v14;
        }
        if (v9 && v10 != 0)
        {
          -[NSMorphology mergeMorphology:override:](*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), v9, 1);
LABEL_33:
          -[NSMorphology mergeMorphology:override:](*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), v9, 0);
          return 2;
        }
      }
    }
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v8)
      continue;
    break;
  }
  if (v9 && !v10)
  {
    -[NSMorphology mergeMorphology:override:](*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), v9, 0);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) |= 1uLL;
    return 1;
  }
  if (v9)
    goto LABEL_33;
  if (v10)
  {
    -[NSMorphology mergeMorphology:override:](*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), v10, 0);
    return 3;
  }
  if (v11)
    -[NSMorphology mergeMorphology:override:](*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), v11, 0);
  return 4;
}

uint64_t ___NSInflect_block_invoke_22(uint64_t *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t result;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend(a2, "replacementRangeInResult");
  v6 = v5;
  if (objc_msgSend(a2, "replacementKind") == 1 || (objc_msgSend(a2, "argument"), _NSIsNSNumber()))
  {
    if (objc_msgSend(a2, "replacementKind") == 1)
    {
      objc_msgSend(a2, "argument");
      if ((_NSIsNSNumber() & 1) == 0)
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void _NSInflect(NSLocale * _Nullable, NSArray<_NSAttributedStringReplacement *> * _Nonnull, NSArray<NSObject *> * _Nullable, NSTermOfAddress * _Nullable, NSUInteger (^ _Nonnull)(void), BOOL, void (^ _Nonnull)(NSAttributedStringKey, NSRange, __attribute__((noescape)) void (^)(id _Nullable, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSRange, __attribute__((noescape)) void (^)(id _Nullable, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSRange, __attribute__((noescape)) void (^)(NSLocalizedNumberFormatRule *, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSAttributedStringKey, NSRange), BOOL (^ _Nonnull)(NSRange), id  _Nullable (^ _Nonnull)(NSAttributedStringKey, NSRange), NSString *(^ _Nonnull)(NSRange), void (^ _Nonnull)(NSRange, __attribute__((noescape)) void (^)(NSString * _Nullable, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSRange, id), void (^ _Nonnull)(NSRange, NSAttributedStringKey, id), id  _Nullable (^ _Nonnull)(id))_block_invoke"), CFSTR("NSAttributedString_Inflection.m"), 513, CFSTR("Attribute string replacement argument should be a NSNumber when the formatting specifier is numeric"));
    }
    v7 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    if (!v7)
    {
      *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    }
    objc_msgSend(v7, "addObject:", objc_msgSend(a2, "argument"));
    v8 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
    if (!v8)
    {
      *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
    }
    return objc_msgSend(v8, "addObject:", _NSInflectionLanguageWithLensAndRange(a1[5], v4, v6));
  }
  v10 = (void *)objc_msgSend(a2, "argument");
  v11 = a1[5];
  v12 = objc_msgSend(a2, "replacementRangeInResult");
  v14 = (void *)_NSInflectionGrammarWithLensAndRange(v11, v12, v13);
  result = _NSIsNSString();
  if ((result & 1) != 0)
    goto LABEL_14;
  result = _NSIsNSAttributedString();
  if ((_DWORD)result)
  {
    result = objc_msgSend(v10, "string");
    v10 = (void *)result;
LABEL_14:
    if (v10)
    {
      if (v14)
        v15 = objc_msgSend(v14, "partOfSpeech");
      else
        v15 = 0;
      _NSInflectionLanguageWithLensAndRange(a1[5], v4, v6);
      v16 = (void *)(*(uint64_t (**)(void))(a1[6] + 16))();
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], objc_msgSend(v16, "allPossibleWordAttributesForWord:", v10), v15);
    }
  }
  if (v14)
    return -[NSMorphology mergeMorphology:override:](a1[4], v14, 0);
  return result;
}

void *___NSInflect_block_invoke_30(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *result;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _NSInflectionLanguageWithLensAndRange(a1[4], a3, a4);
  result = (void *)(*(uint64_t (**)(void))(a1[5] + 16))();
  if (result)
  {
    v9 = (void *)objc_msgSend(result, "allPossibleWordAttributesForWord:", a2);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    result = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (result)
    {
      v10 = result;
      v11 = *(_QWORD *)v15;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        result = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "partOfSpeech");
        if (result != (void *)9)
          break;
        if (v10 == (void *)++v12)
        {
          result = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
          v10 = result;
          if (result)
            goto LABEL_4;
          *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) |= 1uLL;
          *a5 = 1;
          return result;
        }
      }
    }
  }
  return result;
}

_QWORD *___NSInflect_block_invoke_35(_QWORD *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  _QWORD *v10;
  uint64_t v11;

  if (a2)
  {
    v10 = result;
    result = (id)objc_msgSend(a2, "capitalizedStringWithLocale:", result[4]);
    *(_QWORD *)(*(_QWORD *)(v10[5] + 8) + 40) = result;
    v11 = *(_QWORD *)(v10[6] + 8);
    *(_QWORD *)(v11 + 32) = a3;
    *(_QWORD *)(v11 + 40) = a4;
  }
  *a7 = 1;
  return result;
}

uint64_t ___NSInflect_block_invoke_37(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t (*v20)(void);
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = result;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = *(void **)(result + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      v11 = a3 + a4;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "rangeValue");
          if (v11 >= v13 + v14)
            v15 = v13 + v14;
          else
            v15 = a3 + a4;
          v16 = v13 > a3 || a3 >= v13 + v14;
          v17 = a3;
          if (v16)
          {
            v18 = a3 > v13 || v13 >= v11;
            v17 = v13;
            if (v18)
              continue;
          }
          if (v15 != v17)
          {
            v20 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 48) + 16);
            return v20();
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
    if (objc_msgSend(*(id *)(v6 + 40), "count")
      && (v19 = (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 56) + 16))()) != 0
      && v19 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    {
      v20 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 64) + 16);
    }
    else
    {
      v20 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 64) + 16);
    }
    return v20();
  }
  return result;
}

void ___NSInflect_block_invoke_2_39(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint8_t v15[8];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v9 = (*(uint64_t (**)(void))(a1[5] + 16))();
    if (!v9 || (v10 = v9, (_NSIsNSString() & 1) == 0))
      v10 = (*(uint64_t (**)(void))(a1[6] + 16))();
    v11 = (void *)objc_msgSend(a2, "_formattedString:withStringLocale:andDisplayLocale:", v10, objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", _NSInflectionLanguageWithLensAndRange(a1[5], a3, a4)), a1[4]);
    if (v11)
    {
      v12 = v11;
      if ((objc_msgSend(v11, "isEqualToString:", v10) & 1) == 0)
      {
        (*(void (**)(void))(a1[7] + 16))();
        (*(void (**)(_QWORD, uint64_t, uint64_t, void *))(a1[8] + 16))(a1[8], a3, a4, v12);
      }
    }
  }
  else
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v14 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
    }
    *a5 = 1;
  }
}

@end
