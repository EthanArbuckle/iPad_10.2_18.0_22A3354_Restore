@implementation MLNeuralNetworkV1Container

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  char *v17;
  char ***v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char **v25;
  char v26;
  std::string *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  BOOL v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  char *v63;
  char **v64;
  BOOL v65;
  void *v66;
  char **v67;
  void *v68;
  double v69;
  void *v70;
  char **v71;
  void *v72;
  double v73;
  void *v74;
  char **v75;
  void *v76;
  double v77;
  void *v78;
  char **v79;
  void *v80;
  double v81;
  void *v82;
  char **v83;
  void *v84;
  double v85;
  void *v86;
  char **v87;
  void *v88;
  double v89;
  void *v90;
  char **v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  double v98;
  BOOL v99;
  id v100;
  void *v101;
  double v102;
  void *v103;
  double v104;
  void *v105;
  double v106;
  void *v107;
  double v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t i;
  void *v119;
  void *v120;
  int v121;
  int hasNestedArchive;
  int v123;
  std::string::size_type *v124;
  std::string::size_type v125;
  unint64_t *v126;
  unint64_t v127;
  void *v128;
  char v129;
  void *v130;
  char v131;
  void *v132;
  char v133;
  std::__shared_weak_count *size;
  unint64_t *v135;
  unint64_t v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t n;
  uint64_t v141;
  char v142;
  void *v143;
  void *v144;
  int v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t k;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  int v154;
  void *v155;
  id v156;
  double v157;
  void *v158;
  id v159;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer m;
  id v162;
  std::vector<std::string>::pointer v163;
  void *v164;
  void *v165;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  void *v172;
  id *v173;
  void *v174;
  id v175;
  id v176;
  _MLModelInputArchiver *v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  uint64_t j;
  id obj;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  id v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  void *__p[2];
  char v203;
  std::string v204;
  char *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  uint64_t v210;
  uint64_t v211;
  std::vector<std::string> v212;
  uint64_t v213;
  char **v214;
  char *v215;
  uint64_t v216;
  char **v217;
  char *v218[2];
  char **v219;
  char *v220[2];
  char **v221;
  char *v222[2];
  char **v223;
  char *v224[2];
  char **v225;
  char *v226[2];
  char **v227;
  char *v228[2];
  char **v229;
  char *v230[2];
  char **v231;
  char *v232[2];
  char **v233;
  char *v234;
  uint64_t v235;
  void *v236[2];
  char v237;
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  uint64_t v242;

  v242 = *MEMORY[0x1E0C80C00];
  v175 = a4;
  v179 = a5;
  v176 = a6;
  v177 = (_MLModelInputArchiver *)a3;
  v173 = a7;
  objc_msgSend(a1, "readerFromArchive:error:", a3, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v182 = v12;
  if (!v12)
    goto LABEL_193;
  objc_msgSend(v12, "modelPath");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "modelName");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v236, (char *)objc_msgSend(v14, "UTF8String"));

  objc_msgSend(a1, "containerFromCompiledArchiveCommon:filename:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v174, v175, v179, v176, a7);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*a7)
  {
    v235 = 0;
    v234 = 0;
    v233 = &v234;
    v232[1] = 0;
    v232[0] = 0;
    v231 = v232;
    v230[1] = 0;
    v230[0] = 0;
    v229 = v230;
    v228[1] = 0;
    v228[0] = 0;
    v227 = v228;
    v226[1] = 0;
    v226[0] = 0;
    v225 = v226;
    v224[1] = 0;
    v224[0] = 0;
    v223 = v224;
    v222[1] = 0;
    v222[0] = 0;
    v221 = v222;
    v220[1] = 0;
    v220[0] = 0;
    v219 = v220;
    v218[1] = 0;
    v218[0] = 0;
    v217 = v218;
    v216 = 0;
    v215 = 0;
    v214 = &v215;
    +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 2, 0, &stru_1E3D68DC8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v179, "olderThan:", v15);

    v17 = IArchive::nestedArchive(a3, (uint64_t)v236);
    if ((v16 & 1) != 0)
    {
      v18 = &v214;
    }
    else
    {
      operator>><std::string,float>((uint64_t)v17, (uint64_t)&v233);
      v19 = IArchive::nestedArchive(a3, (uint64_t)v236);
      operator>><std::string,float>((uint64_t)v19, (uint64_t)&v231);
      v20 = IArchive::nestedArchive(a3, (uint64_t)v236);
      operator>><std::string,float>((uint64_t)v20, (uint64_t)&v229);
      v21 = IArchive::nestedArchive(a3, (uint64_t)v236);
      operator>><std::string,float>((uint64_t)v21, (uint64_t)&v227);
      v22 = IArchive::nestedArchive(a3, (uint64_t)v236);
      operator>><std::string,float>((uint64_t)v22, (uint64_t)&v225);
      v23 = IArchive::nestedArchive(a3, (uint64_t)v236);
      operator>><std::string,float>((uint64_t)v23, (uint64_t)&v223);
      v24 = IArchive::nestedArchive(a3, (uint64_t)v236);
      operator>><std::string,float>((uint64_t)v24, (uint64_t)&v221);
      v17 = IArchive::nestedArchive(a3, (uint64_t)v236);
      v18 = &v219;
    }
    operator>><std::string,float>((uint64_t)v17, (uint64_t)v18);
    if (v235)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v233;
      if (v233 == &v234)
        goto LABEL_112;
      v26 = 0;
      do
      {
        if (*((char *)v25 + 55) < 0)
          std::string::__init_copy_ctor_external(&v204, v25[4], (std::string::size_type)v25[5]);
        else
          v204 = *(std::string *)(v25 + 4);
        if ((v204.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v27 = &v204;
        else
          v27 = (std::string *)v204.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", MEMORY[0x1E0C9AAA0], &unk_1E3DA2B40, &unk_1E3DA2B40, &unk_1E3DA2B40, &unk_1E3DA2B40, &unk_1E3DA2B50, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v232 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v231, &v204))
        {
          v30 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v31) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v231, &v204);
          objc_msgSend(v30, "numberWithBool:", *(float *)&v31 != 0.0, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v32, 0);

        }
        if (v230 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v229, &v204))
        {
          v33 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v34) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v229, &v204);
          objc_msgSend(v33, "numberWithBool:", *(float *)&v34 != 0.0, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v35, 1);

        }
        if (v228 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v227, &v204))
        {
          v36 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v37) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v227, &v204);
          objc_msgSend(v36, "numberWithFloat:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v38, 2);

        }
        if (v226 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v225, &v204))
        {
          v39 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v40) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v225, &v204);
          objc_msgSend(v39, "numberWithFloat:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v41, 3);

        }
        if (v224 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v223, &v204))
        {
          v42 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v43) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v223, &v204);
          objc_msgSend(v42, "numberWithFloat:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v44, 4);

        }
        if (v222 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v221, &v204))
        {
          v45 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v46) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v221, &v204);
          objc_msgSend(v45, "numberWithFloat:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v47, 5);

        }
        if (v220 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v219, &v204))
        {
          v48 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v49) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v219, &v204);
          objc_msgSend(v48, "numberWithFloat:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v50, 6);

        }
        objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "doubleValue");
        if (fabs(v52) == 1.0)
        {
          objc_msgSend(v29, "objectAtIndexedSubscript:", 2);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "doubleValue");
          v55 = 1;
          if (v54 >= 0.0 && v54 <= 0.0)
          {
            objc_msgSend(v29, "objectAtIndexedSubscript:", 3);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "doubleValue");
            if (v57 >= 0.0 && v57 <= 0.0)
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", 4);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "doubleValue");
              if (v59 >= 0.0 && v59 <= 0.0)
              {
                objc_msgSend(v29, "objectAtIndexedSubscript:", 5);
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "doubleValue");
                if (v60 >= 0.0 && v60 <= 0.0)
                {
                  objc_msgSend(v29, "objectAtIndexedSubscript:", 6);
                  v168 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v168, "doubleValue");
                  v55 = v61 != 1.0;

                }
              }

            }
          }

        }
        else
        {
          v55 = 1;
        }

        v62 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(v180, "setObject:forKeyedSubscript:", v62, v28);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
        v63 = v25[1];
        if (v63)
        {
          do
          {
            v64 = (char **)v63;
            v63 = *(char **)v63;
          }
          while (v63);
        }
        else
        {
          do
          {
            v64 = (char **)v25[2];
            v65 = *v64 == (char *)v25;
            v25 = v64;
          }
          while (!v65);
        }
        v26 |= v55;
        v25 = v64;
      }
      while (v64 != &v234);
      if ((v26 & 1) == 0)
        goto LABEL_112;
    }
    else
    {
      if (!v216)
      {
        v100 = 0;
LABEL_113:
        v178 = v100;

        v180 = 0;
LABEL_114:
        v213 = 1;
        v188 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v182, "transformParams");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = v112;
        if (v112)
        {
          v113 = v112;

          v180 = 0;
          v178 = v113;
        }
        objc_msgSend(v172, "modelDescription");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "inputDescriptionsByName");
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        memset(&v212, 0, sizeof(v212));
        v211 = 0;
        v210 = 0;
        v206 = 0u;
        v207 = 0u;
        v208 = 0u;
        v209 = 0u;
        obj = v115;
        v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v241, 16);
        if (v116)
        {
          v117 = *(_QWORD *)v207;
          do
          {
            for (i = 0; i != v116; ++i)
            {
              if (*(_QWORD *)v207 != v117)
                objc_enumerationMutation(obj);
              v119 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * i);
              objc_msgSend(obj, "objectForKeyedSubscript:", v119);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = objc_msgSend(v120, "isOptional");

              if (v121)
              {
                std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(objc_retainAutorelease(v119), "UTF8String"));
                __p[0] = &v204;
                *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v217, &v204, (_OWORD **)__p)+ 14) = 0;
                if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v204.__r_.__value_.__l.__data_);
              }
            }
            v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v241, 16);
          }
          while (v116);
        }

        std::string::basic_string[abi:ne180100]<0>(&v204, "neural_network_optionals");
        hasNestedArchive = IArchive::hasNestedArchive(v177, &v204);
        v123 = hasNestedArchive;
        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v204.__r_.__value_.__l.__data_);
          if (v123)
            goto LABEL_128;
        }
        else if (hasNestedArchive)
        {
LABEL_128:
          std::string::basic_string[abi:ne180100]<0>(__p, "neural_network_optionals");
          v124 = (std::string::size_type *)IArchive::nestedArchive(v177, (uint64_t)__p);
          v125 = v124[1];
          v204.__r_.__value_.__r.__words[0] = *v124;
          v204.__r_.__value_.__l.__size_ = v125;
          if (v125)
          {
            v126 = (unint64_t *)(v125 + 8);
            do
              v127 = __ldxr(v126);
            while (__stxr(v127 + 1, v126));
          }
          std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)&v204.__r_.__value_.__r.__words[2], v124 + 2);
          if (v203 < 0)
            operator delete(__p[0]);
          operator>>((uint64_t)&v204);
          +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 2, 1, 0, &stru_1E3D68DC8);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v179, "olderThan:", v128);

          if ((v129 & 1) == 0)
            operator>><std::string>((uint64_t)&v204, &v212);
          +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 3, 0, 0, &stru_1E3D68DC8);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = objc_msgSend(v179, "olderThan:", v130);

          if ((v131 & 1) == 0)
          {
            operator>>((uint64_t)&v204);
            operator>>((uint64_t)&v204);
          }
          +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 4, 0, 0, &stru_1E3D68DC8);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = objc_msgSend(v179, "olderThan:", v132);

          if ((v133 & 1) == 0)
            operator>><std::string,float>((uint64_t)&v204, (uint64_t)&v217);
          std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v205);
          size = (std::__shared_weak_count *)v204.__r_.__value_.__l.__size_;
          if (v204.__r_.__value_.__l.__size_)
          {
            v135 = (unint64_t *)(v204.__r_.__value_.__l.__size_ + 8);
            do
              v136 = __ldaxr(v135);
            while (__stlxr(v136 - 1, v135));
            if (!v136)
            {
              ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
              std::__shared_weak_count::__release_weak(size);
            }
          }
LABEL_155:
          v197 = 0;
          objc_msgSend(v182, "loadUpdatableParams:", &v197);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = v197;
          if (v169)
          {
            +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in unarchiving updatable params."));
            v13 = 0;
            *v173 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v181 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v195 = 0u;
            v196 = 0u;
            v193 = 0u;
            v194 = 0u;
            v185 = obj;
            v141 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v193, v239, 16);
            if (v141)
            {
              v142 = 0;
              v183 = *(_QWORD *)v194;
              v184 = v141;
              do
              {
                for (j = 0; j != v184; ++j)
                {
                  if (*(_QWORD *)v194 != v183)
                    objc_enumerationMutation(v185);
                  v143 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * j);
                  objc_msgSend(v185, "objectForKeyedSubscript:", v143);
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  v145 = objc_msgSend(v144, "isOptional");

                  if (v145)
                  {
                    v191 = 0u;
                    v192 = 0u;
                    v189 = 0u;
                    v190 = 0u;
                    objc_msgSend(v182, "layerInfos");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v189, v238, 16);
                    if (v147)
                    {
                      v148 = *(_QWORD *)v190;
                      do
                      {
                        for (k = 0; k != v147; ++k)
                        {
                          if (*(_QWORD *)v190 != v148)
                            objc_enumerationMutation(v146);
                          v150 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * k);
                          objc_msgSend(v150, "concatenatedInputNames");
                          v151 = (void *)objc_claimAutoreleasedReturnValue();
                          v152 = objc_msgSend(v151, "containsString:", v143);

                          if (v152)
                          {
                            objc_msgSend(v150, "type");
                            v153 = (void *)objc_claimAutoreleasedReturnValue();
                            v154 = objc_msgSend(v153, "isEqualToString:", CFSTR("sequence_concat"));

                            if (v154)
                            {
                              objc_msgSend(v188, "setObject:forKeyedSubscript:", &unk_1E3DA21D0, v143);
                              v142 = 1;
                            }
                            else
                            {
                              objc_msgSend(v188, "setObject:forKeyedSubscript:", &unk_1E3DA21E8, v143);
                            }
                          }
                        }
                        v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v189, v238, 16);
                      }
                      while (v147);
                    }

                    v155 = (void *)MEMORY[0x1E0CB37E8];
                    v156 = objc_retainAutorelease(v143);
                    std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(v156, "UTF8String"));
                    __p[0] = &v204;
                    LODWORD(v157) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v217, &v204, (_OWORD **)__p)+ 14);
                    objc_msgSend(v155, "numberWithFloat:", v157);
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v181, "setObject:forKeyedSubscript:", v158, v156);

                    if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
                      operator delete(v204.__r_.__value_.__l.__data_);
                  }
                }
                v184 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v193, v239, 16);
              }
              while (v184);
            }
            else
            {
              v142 = 0;
            }

            v159 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            begin = v212.__begin_;
            for (m = v212.__end_; begin != m; ++begin)
            {
              v162 = objc_alloc(MEMORY[0x1E0CB3940]);
              v163 = begin;
              if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
                v163 = (std::vector<std::string>::pointer)begin->__r_.__value_.__r.__words[0];
              v164 = (void *)objc_msgSend(v162, "initWithCString:encoding:", v163, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
              objc_msgSend(v159, "addObject:", v164);

            }
            objc_msgSend(v172, "setHasBidirectionalLayer:", v213 != 0);
            objc_msgSend(v172, "setHasOptionalInputSequenceConcat:", v142 & 1);
            objc_msgSend(v172, "setHasDynamicLayer:", v210 != 0);
            objc_msgSend(v172, "setOptionalInputTypes:", v188);
            objc_msgSend(v172, "setNdArrayInterpretation:", v211 != 0);
            objc_msgSend(v172, "setHasDynamicLayer:", v210 != 0);
            objc_msgSend(v172, "setUpdatableModelCompiledParams:", v171);
            if (v180)
              objc_msgSend(v172, "setImageParameters:", v180);
            if (v178)
              objc_msgSend(v172, "setImagePreprocessingParams:", v178);
            objc_msgSend(v172, "setConfigurationList:", v159);
            objc_msgSend(v172, "setOptionalInputDefaultValues:", v181);
            objc_msgSend(v182, "copyLayerShapesToContainer:", v172);
            neuralNetworkOutputFromArchive(v177);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "setCompilerOutput:", v165);

            v13 = v172;
          }

          v204.__r_.__value_.__r.__words[0] = (std::string::size_type)&v212;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v204);

          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v215);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v218[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v220[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v222[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v224[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v226[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v228[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v230[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v232[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v234);
          goto LABEL_190;
        }
        v213 = 0;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        objc_msgSend(v182, "layerInfos");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v198, v240, 16);
        if (v138)
        {
          v139 = *(_QWORD *)v199;
          while (2)
          {
            for (n = 0; n != v138; ++n)
            {
              if (*(_QWORD *)v199 != v139)
                objc_enumerationMutation(v137);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v198 + 1) + 8 * n), "bidirectional"))
              {
                v213 = 1;

                goto LABEL_155;
              }
            }
            v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v198, v240, 16);
            if (v138)
              continue;
            break;
          }
        }

        goto LABEL_155;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", MEMORY[0x1E0C9AAA0], &unk_1E3DA2B40, &unk_1E3DA2B40, &unk_1E3DA2B40, &unk_1E3DA2B40, &unk_1E3DA2B50, MEMORY[0x1E0C9AAB0], 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("isOrderedBgr"), "UTF8String"));
      v67 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v204);
      if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v204.__r_.__value_.__l.__data_);
      if (&v215 != v67)
      {
        v68 = (void *)MEMORY[0x1E0CB37E8];
        std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("isOrderedBgr"), "UTF8String"));
        LODWORD(v69) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v204);
        objc_msgSend(v68, "numberWithBool:", *(float *)&v69 != 0.0, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:atIndexedSubscript:", v70, 0);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
      }
      std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("isGrayScale"), "UTF8String"));
      v71 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v204);
      if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v204.__r_.__value_.__l.__data_);
      if (&v215 != v71)
      {
        v72 = (void *)MEMORY[0x1E0CB37E8];
        std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("isGrayScale"), "UTF8String"));
        LODWORD(v73) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v204);
        objc_msgSend(v72, "numberWithBool:", *(float *)&v73 != 0.0, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:atIndexedSubscript:", v74, 1);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
      }
      std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("blueBias"), "UTF8String"));
      v75 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v204);
      if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v204.__r_.__value_.__l.__data_);
      if (&v215 != v75)
      {
        v76 = (void *)MEMORY[0x1E0CB37E8];
        std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("blueBias"), "UTF8String"));
        LODWORD(v77) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v204);
        objc_msgSend(v76, "numberWithFloat:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:atIndexedSubscript:", v78, 2);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
      }
      std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("greenBias"), "UTF8String"));
      v79 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v204);
      if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v204.__r_.__value_.__l.__data_);
      if (&v215 != v79)
      {
        v80 = (void *)MEMORY[0x1E0CB37E8];
        std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("greenBias"), "UTF8String"));
        LODWORD(v81) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v204);
        objc_msgSend(v80, "numberWithFloat:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:atIndexedSubscript:", v82, 3);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
      }
      std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("redBias"), "UTF8String"));
      v83 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v204);
      if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v204.__r_.__value_.__l.__data_);
      if (&v215 != v83)
      {
        v84 = (void *)MEMORY[0x1E0CB37E8];
        std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("redBias"), "UTF8String"));
        LODWORD(v85) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v204);
        objc_msgSend(v84, "numberWithFloat:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:atIndexedSubscript:", v86, 4);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
      }
      std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("grayBias"), "UTF8String"));
      v87 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v204);
      if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v204.__r_.__value_.__l.__data_);
      if (&v215 != v87)
      {
        v88 = (void *)MEMORY[0x1E0CB37E8];
        std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("grayBias"), "UTF8String"));
        LODWORD(v89) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v204);
        objc_msgSend(v88, "numberWithFloat:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:atIndexedSubscript:", v90, 5);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
      }
      std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("scale"), "UTF8String"));
      v91 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v204);
      if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v204.__r_.__value_.__l.__data_);
      if (&v215 != v91)
      {
        v92 = (void *)MEMORY[0x1E0CB37E8];
        std::string::basic_string[abi:ne180100]<0>(&v204, (char *)objc_msgSend(CFSTR("scale"), "UTF8String"));
        LODWORD(v93) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v204);
        objc_msgSend(v92, "numberWithFloat:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setObject:atIndexedSubscript:", v94, 6);

        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v204.__r_.__value_.__l.__data_);
      }
      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "doubleValue");
      if (v96 == 1.0)
      {
        objc_msgSend(v66, "objectAtIndexedSubscript:", 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "doubleValue");
        if (v98 == 1.0)
        {
          objc_msgSend(v66, "objectAtIndexedSubscript:", 2);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "doubleValue");
          v99 = 1;
          if (v102 >= 0.0 && v102 <= 0.0)
          {
            objc_msgSend(v66, "objectAtIndexedSubscript:", 3);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "doubleValue");
            if (v104 >= 0.0 && v104 <= 0.0)
            {
              objc_msgSend(v66, "objectAtIndexedSubscript:", 4);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "doubleValue");
              if (v106 >= 0.0 && v106 <= 0.0)
              {
                objc_msgSend(v66, "objectAtIndexedSubscript:", 5);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "doubleValue");
                if (v108 >= 0.0 && v108 <= 0.0)
                {
                  objc_msgSend(v66, "objectAtIndexedSubscript:", 6);
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "doubleValue");
                  v99 = v110 != 1.0;

                }
              }

            }
          }

        }
        else
        {
          v99 = 1;
        }

      }
      else
      {
        v99 = 1;
      }

      v111 = (void *)objc_msgSend(v66, "copy");
      objc_msgSend(v180, "setObject:forKeyedSubscript:", v111, CFSTR("placeHolderInputName"));

      if (!v99)
      {
LABEL_112:
        v100 = v180;
        goto LABEL_113;
      }
    }
    v178 = 0;
    goto LABEL_114;
  }
  v13 = 0;
LABEL_190:

  if (v237 < 0)
    operator delete(v236[0]);

LABEL_193:
  return v13;
}

+ (id)readerFromArchive:(void *)a3 error:(id *)a4
{
  int v6;
  __objc2_class **v7;

  v6 = (*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)a3 + 56))(*(_QWORD *)a3, a2);
  v7 = off_1E3D41BE8;
  if (v6 != 1)
    v7 = &off_1E3D41C00;
  -[__objc2_class readerFromArchiver:error:](*v7, "readerFromArchiver:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
