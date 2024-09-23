@implementation _EARResultCombiner

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARResultCombiner)initWithConfiguration:(id)a3
{
  id v4;
  _EARResultCombiner *v5;
  char *v6;
  quasar::ResultCombiner *v7;
  ResultCombiner *value;
  _EARResultCombiner *v9;
  objc_super v11;
  void *__p[2];
  char v13;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EARResultCombiner;
  v5 = -[_EARResultCombiner init](&v11, sel_init);
  if (!v5)
    goto LABEL_7;
  v6 = (char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
  v7 = (quasar::ResultCombiner *)operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, v6);
  quasar::RankingResultCombiner::RankingResultCombiner((uint64_t)v7, (__int128 *)__p);
  if (v13 < 0)
    operator delete(__p[0]);
  value = v5->_combiner.__ptr_.__value_;
  v5->_combiner.__ptr_.__value_ = (ResultCombiner *)v7;
  if (value)
  {
    (*(void (**)(ResultCombiner *))(*(_QWORD *)value + 32))(value);
    v7 = (quasar::ResultCombiner *)v5->_combiner.__ptr_.__value_;
  }
  if ((quasar::ResultCombiner::init(v7) & 1) == 0)
    v9 = 0;
  else
LABEL_7:
    v9 = v5;

  return v9;
}

- (id)combinedResultWithSystemResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t m;
  id v9;
  void *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t n;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t ii;
  id v41;
  int v42;
  int v43;
  char *v44;
  _DWORD *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  int v53;
  uint64_t **v54;
  uint64_t *v55;
  uint64_t *jj;
  unsigned __int128 v57;
  void *v58;
  const quasar::Token *kk;
  const quasar::Token *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t mm;
  uint64_t v67;
  void *v68;
  _QWORD *nn;
  std::string::size_type size;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  _DWORD *i1;
  _DWORD *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  unint64_t i2;
  __int128 v83;
  std::string *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD *v88;
  _QWORD *v89;
  void *v90;
  void *v91;
  void *v92;
  _QWORD *v93;
  _QWORD *v94;
  void *v95;
  void *v96;
  _EARCombinedResult *v97;
  uint64_t v99;
  void *v100;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t i;
  id obj;
  id v107;
  id j;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id k;
  id v117;
  id v118;
  _EARCombinedResult *v119;
  uint64_t **v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  uint64_t **v125;
  uint64_t *v126;
  void *v127;
  void *v128;
  _QWORD *v129;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135[3];
  uint64_t v136[3];
  uint64_t v137[3];
  void *v138;
  _QWORD *v139;
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD v153[7];
  void **v154;
  _BYTE v155[128];
  unsigned __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _QWORD v161[14];
  _BYTE v162[32];
  __int128 v163;
  __int128 v164;
  char v165;
  uint64_t v166;
  void *v167;
  char v168;
  uint64_t v169;
  void *v170;
  char v171;
  void *v172;
  char v173;
  std::string v174[2];
  __int128 v175;
  _QWORD v176[4];
  __int128 v177;
  _QWORD v178[4];
  __int128 v179;
  __int128 v180;
  __int128 __p;
  _QWORD v182[8];

  v182[5] = *MEMORY[0x1E0C80C00];
  memset(v137, 0, sizeof(v137));
  memset(v136, 0, sizeof(v136));
  memset(v135, 0, sizeof(v135));
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = a3;
  v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v155, 16);
  if (v99)
  {
    v102 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v99; ++i)
      {
        if (*(_QWORD *)v132 != v102)
          objc_enumerationMutation(obj);
        v100 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        objc_msgSend(v100, "sausage");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        v129 = 0;
        v130 = 0;
        v128 = 0;
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        v144 = 0u;
        v107 = v3;
        v103 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v141, &v156, 16);
        if (v103)
        {
          v104 = *(_QWORD *)v142;
          do
          {
            for (j = 0; j != (id)v103; j = (char *)j + 1)
            {
              if (*(_QWORD *)v142 != v104)
                objc_enumerationMutation(v107);
              v4 = *(id *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)j);
              v139 = 0;
              v140 = 0;
              v138 = 0;
              v148 = 0u;
              v149 = 0u;
              v150 = 0u;
              v151 = 0u;
              v110 = v4;
              v114 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v148, &v160, 16);
              if (v114)
              {
                v112 = *(_QWORD *)v149;
                do
                {
                  for (k = 0; k != (id)v114; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v149 != v112)
                      objc_enumerationMutation(v110);
                    v5 = *(id *)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)k);
                    v146 = 0;
                    v147 = 0;
                    v145 = 0;
                    v152 = 0u;
                    memset(v153, 0, 48);
                    v122 = v5;
                    v6 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v152, v162, 16);
                    if (v6)
                    {
                      v7 = *(_QWORD *)v153[0];
                      do
                      {
                        for (m = 0; m != v6; ++m)
                        {
                          if (*(_QWORD *)v153[0] != v7)
                            objc_enumerationMutation(v122);
                          v9 = *(id *)(*((_QWORD *)&v152 + 1) + 8 * m);
                          v10 = v9;
                          if (v9)
                          {
                            objc_msgSend(v9, "quasarToken");
                          }
                          else
                          {
                            memset(v182, 0, 32);
                            v180 = 0u;
                            __p = 0u;
                            v179 = 0u;
                            v177 = 0u;
                            memset(v178, 0, sizeof(v178));
                            memset(v176, 0, sizeof(v176));
                            v175 = 0u;
                            memset(v174, 0, sizeof(v174));
                          }

                          v11 = v146;
                          if (v146 >= v147)
                          {
                            v146 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v145, (__int128 *)v174);
                            if (SHIBYTE(v182[0]) < 0)
                              operator delete((void *)__p);
                          }
                          else
                          {
                            v12 = *(_OWORD *)&v174[0].__r_.__value_.__l.__data_;
                            *(_QWORD *)(v146 + 16) = *((_QWORD *)&v174[0].__r_.__value_.__l + 2);
                            *(_OWORD *)v11 = v12;
                            memset(v174, 0, 24);
                            v13 = *(std::string::size_type *)((char *)&v174[1].__r_.__value_.__r.__words[1] + 6);
                            *(_OWORD *)(v11 + 24) = *(_OWORD *)&v174[1].__r_.__value_.__l.__data_;
                            *(_QWORD *)(v11 + 38) = v13;
                            v14 = v176[0];
                            *(_OWORD *)(v11 + 48) = v175;
                            *(_QWORD *)(v11 + 64) = v14;
                            *(_QWORD *)(v11 + 72) = 0;
                            v176[0] = 0;
                            v175 = 0uLL;
                            *(_QWORD *)(v11 + 80) = 0;
                            *(_QWORD *)(v11 + 88) = 0;
                            *(_OWORD *)(v11 + 72) = *(_OWORD *)&v176[1];
                            *(_QWORD *)(v11 + 88) = v176[3];
                            memset(&v176[1], 0, 24);
                            v15 = v177;
                            *(_QWORD *)(v11 + 112) = v178[0];
                            *(_QWORD *)(v11 + 120) = 0;
                            *(_OWORD *)(v11 + 96) = v15;
                            v178[0] = 0;
                            v177 = 0uLL;
                            *(_QWORD *)(v11 + 128) = 0;
                            *(_QWORD *)(v11 + 136) = 0;
                            *(_OWORD *)(v11 + 120) = *(_OWORD *)&v178[1];
                            *(_QWORD *)(v11 + 136) = v178[3];
                            memset(&v178[1], 0, 24);
                            v16 = v179;
                            *(_QWORD *)(v11 + 160) = v180;
                            *(_OWORD *)(v11 + 144) = v16;
                            *(_QWORD *)&v180 = 0;
                            v179 = 0uLL;
                            LODWORD(v14) = DWORD2(v180);
                            *(_WORD *)(v11 + 172) = WORD6(v180);
                            *(_DWORD *)(v11 + 168) = v14;
                            v17 = __p;
                            *(_QWORD *)(v11 + 192) = v182[0];
                            *(_OWORD *)(v11 + 176) = v17;
                            v182[0] = 0;
                            __p = 0uLL;
                            v18 = *(_OWORD *)&v182[1];
                            *(_DWORD *)(v11 + 216) = v182[3];
                            *(_OWORD *)(v11 + 200) = v18;
                            v146 = v11 + 224;
                          }
                          if (SBYTE7(v180) < 0)
                            operator delete((void *)v179);
                          v154 = (void **)&v178[1];
                          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v154);
                          if (SHIBYTE(v178[0]) < 0)
                            operator delete((void *)v177);
                          v154 = (void **)&v176[1];
                          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v154);
                          if (SHIBYTE(v176[0]) < 0)
                            operator delete((void *)v175);
                          if (SHIBYTE(v174[0].__r_.__value_.__r.__words[2]) < 0)
                            operator delete(v174[0].__r_.__value_.__l.__data_);

                        }
                        v6 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v152, v162, 16);
                      }
                      while (v6);
                    }

                    std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100]((uint64_t *)&v138, (uint64_t)&v145);
                    v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v145;
                    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

                  }
                  v114 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v148, &v160, 16);
                }
                while (v114);
              }

              std::vector<std::vector<std::vector<quasar::Token>>>::push_back[abi:ne180100]((uint64_t *)&v128, (uint64_t)&v138);
              v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v138;
              std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

            }
            v103 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v141, &v156, 16);
          }
          while (v103);
        }

        std::vector<std::vector<std::vector<std::vector<quasar::Token>>>>::push_back[abi:ne180100](v137, (uint64_t)&v128);
        v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v128;
        std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

        objc_msgSend(v100, "nBestIndexes");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v149 = 0;
        v148 = 0uLL;
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        v109 = v19;
        v20 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v156, v162, 16);
        if (v20)
        {
          v111 = *(id *)v157;
          do
          {
            v21 = 0;
            v113 = v20;
            do
            {
              if (*(id *)v157 != v111)
                objc_enumerationMutation(v109);
              v22 = *(id *)(*((_QWORD *)&v156 + 1) + 8 * v21);
              v153[0] = 0;
              v152 = 0uLL;
              v160 = 0u;
              memset(v161, 0, 48);
              v117 = v22;
              v23 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v160, v174, 16);
              v115 = v21;
              if (v23)
              {
                v123 = *(id *)v161[0];
                do
                {
                  for (n = 0; n != v23; ++n)
                  {
                    if (*(id *)v161[0] != v123)
                      objc_enumerationMutation(v117);
                    v25 = *(id *)(*((_QWORD *)&v160 + 1) + 8 * n);
                    v26 = objc_msgSend(v25, "unsignedLongValue");
                    v27 = v26;
                    v28 = (char *)*((_QWORD *)&v152 + 1);
                    if (*((_QWORD *)&v152 + 1) >= v153[0])
                    {
                      v30 = (char *)v152;
                      v31 = (uint64_t)(*((_QWORD *)&v152 + 1) - v152) >> 3;
                      v32 = v31 + 1;
                      if ((unint64_t)(v31 + 1) >> 61)
                        std::vector<int>::__throw_length_error[abi:ne180100]();
                      v33 = v153[0] - v152;
                      if ((uint64_t)(v153[0] - v152) >> 2 > v32)
                        v32 = v33 >> 2;
                      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
                        v34 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v34 = v32;
                      if (v34)
                      {
                        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)v153, v34);
                        v28 = (char *)*((_QWORD *)&v152 + 1);
                        v30 = (char *)v152;
                      }
                      else
                      {
                        v35 = 0;
                      }
                      v36 = (uint64_t *)&v35[8 * v31];
                      *v36 = v27;
                      v29 = v36 + 1;
                      while (v28 != v30)
                      {
                        v37 = *((_QWORD *)v28 - 1);
                        v28 -= 8;
                        *--v36 = v37;
                      }
                      *(_QWORD *)&v152 = v36;
                      *((_QWORD *)&v152 + 1) = v29;
                      v153[0] = &v35[8 * v34];
                      if (v30)
                        operator delete(v30);
                    }
                    else
                    {
                      **((_QWORD **)&v152 + 1) = v26;
                      v29 = v28 + 8;
                    }
                    *((_QWORD *)&v152 + 1) = v29;

                  }
                  v23 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v160, v174, 16);
                }
                while (v23);
              }

              std::vector<std::vector<unsigned long>>::push_back[abi:ne180100]((uint64_t *)&v148, (uint64_t)&v152);
              if ((_QWORD)v152)
              {
                *((_QWORD *)&v152 + 1) = v152;
                operator delete((void *)v152);
              }

              v21 = v115 + 1;
            }
            while (v115 + 1 != v113);
            v20 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v156, v162, 16);
          }
          while (v20);
        }

        std::vector<std::vector<std::vector<unsigned long>>>::push_back[abi:ne180100](v136, (uint64_t)&v148);
        v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v148;
        std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

        objc_msgSend(v100, "confidences");
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v161[0] = 0;
        v160 = 0uLL;
        memset(v162, 0, sizeof(v162));
        v163 = 0u;
        v164 = 0u;
        v118 = v38;
        v39 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", v162, v174, 16);
        if (v39)
        {
          v124 = **(id **)&v162[16];
          do
          {
            for (ii = 0; ii != v39; ++ii)
            {
              if (**(id **)&v162[16] != v124)
                objc_enumerationMutation(v118);
              v41 = *(id *)(*(_QWORD *)&v162[8] + 8 * ii);
              objc_msgSend(v41, "floatValue");
              v43 = v42;
              v44 = (char *)*((_QWORD *)&v160 + 1);
              if (*((_QWORD *)&v160 + 1) >= v161[0])
              {
                v46 = (char *)v160;
                v47 = (uint64_t)(*((_QWORD *)&v160 + 1) - v160) >> 2;
                v48 = v47 + 1;
                if ((unint64_t)(v47 + 1) >> 62)
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                v49 = v161[0] - v160;
                if ((uint64_t)(v161[0] - v160) >> 1 > v48)
                  v48 = v49 >> 1;
                if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL)
                  v50 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v50 = v48;
                if (v50)
                {
                  v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v161, v50);
                  v44 = (char *)*((_QWORD *)&v160 + 1);
                  v46 = (char *)v160;
                }
                else
                {
                  v51 = 0;
                }
                v52 = &v51[4 * v47];
                *(_DWORD *)v52 = v43;
                v45 = v52 + 4;
                while (v44 != v46)
                {
                  v53 = *((_DWORD *)v44 - 1);
                  v44 -= 4;
                  *((_DWORD *)v52 - 1) = v53;
                  v52 -= 4;
                }
                *(_QWORD *)&v160 = v52;
                *((_QWORD *)&v160 + 1) = v45;
                v161[0] = &v51[4 * v50];
                if (v46)
                  operator delete(v46);
              }
              else
              {
                **((_DWORD **)&v160 + 1) = v42;
                v45 = v44 + 4;
              }
              *((_QWORD *)&v160 + 1) = v45;

            }
            v39 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", v162, v174, 16);
          }
          while (v39);
        }

        std::vector<std::vector<float>>::push_back[abi:ne180100](v135, (uint64_t)&v160);
        if ((_QWORD)v160)
        {
          *((_QWORD *)&v160 + 1) = v160;
          operator delete((void *)v160);
        }

      }
      v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v155, 16);
    }
    while (v99);
  }

  v152 = 0uLL;
  v153[0] = 0;
  v148 = 0uLL;
  *(_QWORD *)&v149 = 0;
  v141 = 0uLL;
  *(_QWORD *)&v142 = 0;
  v145 = 0;
  v146 = 0;
  v147 = 0;
  v138 = 0;
  v139 = 0;
  v140 = 0;
  v128 = 0;
  v129 = 0;
  v130 = 0;
  (**(void (***)(ResultCombiner *, uint64_t *, uint64_t *, uint64_t *, __int128 *, __int128 *, __int128 *, uint64_t *, void **, void **))self->_combiner.__ptr_.__value_)(self->_combiner.__ptr_.__value_, v137, v136, v135, &v152, &v148, &v141, &v145, &v138, &v128);
  v119 = objc_alloc_init(_EARCombinedResult);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (uint64_t **)*((_QWORD *)&v152 + 1);
  v54 = (uint64_t **)v152;
  if ((_QWORD)v152 != *((_QWORD *)&v152 + 1))
  {
    do
    {
      v156 = 0uLL;
      *(_QWORD *)&v157 = 0;
      v125 = v54;
      std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v156, *v54, v54[1], 0xAAAAAAAAAAAAAAABLL * (v54[1] - *v54));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (uint64_t *)*((_QWORD *)&v156 + 1);
      v57 = v156;
      v126 = (uint64_t *)(v57 >> 64);
      for (jj = (uint64_t *)v57; jj != v55; jj += 3)
      {
        v160 = 0uLL;
        v161[0] = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v160, *jj, jj[1], 0x6DB6DB6DB6DB6DB7 * ((jj[1] - *jj) >> 5));
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (const quasar::Token *)*((_QWORD *)&v160 + 1);
        for (kk = (const quasar::Token *)v160; kk != v60; kk = (const quasar::Token *)((char *)kk + 224))
        {
          quasar::Token::Token(v174, kk);
          quasar::Token::Token((std::string *)v162, (const quasar::Token *)v174);
          v61 = -[_EARSpeechRecognitionToken _initWithQuasarToken:]([_EARSpeechRecognitionToken alloc], "_initWithQuasarToken:", v162);
          objc_msgSend(v58, "addObject:", v61);

          if (v173 < 0)
            operator delete(v172);
          if (v171 < 0)
            operator delete(v170);
          v154 = (void **)&v169;
          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (v168 < 0)
            operator delete(v167);
          v154 = (void **)&v166;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (v165 < 0)
            operator delete((void *)v164);
          if ((v162[23] & 0x80000000) != 0)
            operator delete(*(void **)v162);
          if (SHIBYTE(v182[0]) < 0)
            operator delete((void *)__p);
          if (SBYTE7(v180) < 0)
            operator delete((void *)v179);
          v154 = (void **)&v178[1];
          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (SHIBYTE(v178[0]) < 0)
            operator delete((void *)v177);
          v154 = (void **)&v176[1];
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (SHIBYTE(v176[0]) < 0)
            operator delete((void *)v175);
          if (SHIBYTE(v174[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(v174[0].__r_.__value_.__l.__data_);
        }
        v62 = (void *)objc_msgSend(v58, "copy");

        objc_msgSend(v127, "addObject:", v62);
        v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v160;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
        v55 = v126;
      }
      v63 = (void *)objc_msgSend(v127, "copy");

      objc_msgSend(v121, "addObject:", v63);
      v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v156;
      std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
      v54 = v125 + 3;
    }
    while (v125 + 3 != v120);
  }
  v64 = (void *)objc_msgSend(v121, "copy");

  -[_EARSystemResult setSausage:](v119, "setSausage:", v64);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = *((_QWORD *)&v148 + 1);
  for (mm = v148; mm != v67; mm += 24)
  {
    memset(v174, 0, 24);
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v174, *(const void **)mm, *(_QWORD *)(mm + 8), (uint64_t)(*(_QWORD *)(mm + 8) - *(_QWORD *)mm) >> 3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    size = v174[0].__r_.__value_.__l.__size_;
    for (nn = (_QWORD *)v174[0].__r_.__value_.__r.__words[0]; nn != (_QWORD *)size; ++nn)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *nn);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addObject:", v71);

    }
    v72 = (void *)objc_msgSend(v68, "copy");

    objc_msgSend(v65, "addObject:", v72);
    if (v174[0].__r_.__value_.__r.__words[0])
    {
      v174[0].__r_.__value_.__l.__size_ = v174[0].__r_.__value_.__r.__words[0];
      operator delete(v174[0].__r_.__value_.__l.__data_);
    }
  }
  v73 = (void *)objc_msgSend(v65, "copy");

  -[_EARSystemResult setNBestIndexes:](v119, "setNBestIndexes:", v73);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (_DWORD *)*((_QWORD *)&v141 + 1);
  for (i1 = (_DWORD *)v141; i1 != v77; ++i1)
  {
    LODWORD(v75) = *i1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObject:", v78);

  }
  v79 = (void *)objc_msgSend(v74, "copy");

  -[_EARSystemResult setConfidences:](v119, "setConfidences:", v79);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v145;
  for (i2 = v146; v81 != i2; v81 += 24)
  {
    if (*(char *)(v81 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v174, *(const std::string::value_type **)v81, *(_QWORD *)(v81 + 8));
    }
    else
    {
      v83 = *(_OWORD *)v81;
      v174[0].__r_.__value_.__r.__words[2] = *(_QWORD *)(v81 + 16);
      *(_OWORD *)&v174[0].__r_.__value_.__l.__data_ = v83;
    }
    if ((v174[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v84 = v174;
    else
      v84 = (std::string *)v174[0].__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addObject:", v85);

    if (SHIBYTE(v174[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v174[0].__r_.__value_.__l.__data_);
  }
  v86 = (void *)objc_msgSend(v80, "copy");

  -[_EARCombinedResult setNBestStrings:](v119, "setNBestStrings:", v86);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v138;
  v89 = v139;
  if (v138 != v139)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *v88);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "addObject:", v90);

      ++v88;
    }
    while (v88 != v89);
  }
  v91 = (void *)objc_msgSend(v87, "copy");

  -[_EARCombinedResult setNBestSourceIndexes:](v119, "setNBestSourceIndexes:", v91);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v128;
  v94 = v129;
  if (v128 != v129)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *v93);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "addObject:", v95);

      ++v93;
    }
    while (v93 != v94);
  }
  v96 = (void *)objc_msgSend(v92, "copy");

  -[_EARCombinedResult setOriginalRanks:](v119, "setOriginalRanks:", v96);
  v97 = v119;

  if (v128)
  {
    v129 = v128;
    operator delete(v128);
  }
  if (v138)
  {
    v139 = v138;
    operator delete(v138);
  }
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v145;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  if ((_QWORD)v141)
  {
    *((_QWORD *)&v141 + 1) = v141;
    operator delete((void *)v141);
  }
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v148;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v152;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v135;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v136;
  std::vector<std::vector<std::vector<unsigned long>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v137;
  std::vector<std::vector<std::vector<std::vector<quasar::Token>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

  return v97;
}

- (void).cxx_destruct
{
  ResultCombiner *value;

  value = self->_combiner.__ptr_.__value_;
  self->_combiner.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ResultCombiner *))(*(_QWORD *)value + 32))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
