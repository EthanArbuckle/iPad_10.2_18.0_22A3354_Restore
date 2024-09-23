@implementation _EARNnetUtil

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

+ (id)doBackPropWithNnetModelFile:(id)a3 inputFeatureVector:(id)a4 inputTargetVector:(id)a5 inputLearningRate:(float)a6 inputFreezeComponents:(id)a7 inputNumLocalIterations:(int)a8 inputGradNormFactor:(float)a9 inputGradNormType:(id)a10 inputBatchSize:(float)a11 inputObjectiveFunction:(id)a12 outTrainingLoss:(float *)a13 outModelLayersUpdated:(id *)a14
{
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v19;

  v19 = 0;
  +[_EARNnetUtil doBackPropWithNnetModelFile:inputFeatureVector:inputTargetVector:inputLearningRate:inputFreezeComponents:inputNumLocalIterations:inputGradNormFactor:inputGradNormType:inputBatchSize:inputObjectiveFunction:outTrainingLosses:outModelLayersUpdated:](_EARNnetUtil, "doBackPropWithNnetModelFile:inputFeatureVector:inputTargetVector:inputLearningRate:inputFreezeComponents:inputNumLocalIterations:inputGradNormFactor:inputGradNormType:inputBatchSize:inputObjectiveFunction:outTrainingLosses:outModelLayersUpdated:", a3, a4, a5, a7, *(_QWORD *)&a8, a10, a12, &v19, a14);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  *(_DWORD *)a13 = v17;

  return v14;
}

+ (id)doBackPropWithNnetModelFile:(id)a3 inputFeatureVector:(id)a4 inputTargetVector:(id)a5 inputLearningRate:(float)a6 inputFreezeComponents:(id)a7 inputNumLocalIterations:(int)a8 inputGradNormFactor:(float)a9 inputGradNormType:(id)a10 inputBatchSize:(float)a11 inputObjectiveFunction:(id)a12 outTrainingLosses:(id *)a13 outModelLayersUpdated:(id *)a14
{
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  int v30;
  int v31;
  char *v32;
  void *v33;
  char *v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  int v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t j;
  id v54;
  int v55;
  int v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  void *v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id obj;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89[2];
  uint64_t v90;
  _QWORD v91[3];
  uint64_t v92[3];
  void *v93[2];
  uint64_t v94;
  void *v95[2];
  uint64_t v96;
  void (**v97)(kaldi::nnet1::NnetTrainOptions *__hidden);
  _OWORD v98[2];
  uint64_t ***v99;
  uint64_t ***v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t *v111[3];
  uint64_t v112[3];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  void *v117;
  char *v118;
  char *v119;
  void *__p[2];
  _OWORD v121[3];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  void *v130[2];
  uint64_t v131;
  void **v132;
  _BYTE v133[31];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v21 = a4;
  v80 = a5;
  v77 = a7;
  v78 = a10;
  v79 = a12;
  memset(v111, 0, sizeof(v111));
  v108 = 0;
  v109 = 0;
  v110 = 0;
  v105 = 0;
  v106 = 0;
  v107 = 0;
  v103 = 0;
  v104 = 0;
  v102 = 0;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  obj = v21;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
  if (v22)
  {
    v85 = *(_QWORD *)v123;
    do
    {
      v23 = 0;
      v87 = v22;
      do
      {
        if (*(_QWORD *)v123 != v85)
          objc_enumerationMutation(obj);
        v24 = *(id *)(*((_QWORD *)&v122 + 1) + 8 * v23);
        *(_QWORD *)&v121[0] = 0;
        __p[0] = 0;
        __p[1] = 0;
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        v129 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v126, &v132, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v127;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v127 != v27)
                objc_enumerationMutation(v25);
              v29 = *(id *)(*((_QWORD *)&v126 + 1) + 8 * i);
              objc_msgSend(v29, "floatValue");
              v31 = v30;
              v32 = (char *)__p[1];
              if (__p[1] >= (void *)*(_QWORD *)&v121[0])
              {
                v34 = (char *)__p[0];
                v35 = ((char *)__p[1] - (char *)__p[0]) >> 2;
                v36 = v35 + 1;
                if ((unint64_t)(v35 + 1) >> 62)
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                v37 = *(_QWORD *)&v121[0] - (unint64_t)__p[0];
                if ((uint64_t)(*(_QWORD *)&v121[0] - (unint64_t)__p[0]) >> 1 > v36)
                  v36 = v37 >> 1;
                if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
                  v38 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v38 = v36;
                if (v38)
                {
                  v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v121, v38);
                  v32 = (char *)__p[1];
                  v34 = (char *)__p[0];
                }
                else
                {
                  v39 = 0;
                }
                v40 = &v39[4 * v35];
                *(_DWORD *)v40 = v31;
                v33 = v40 + 4;
                while (v32 != v34)
                {
                  v41 = *((_DWORD *)v32 - 1);
                  v32 -= 4;
                  *((_DWORD *)v40 - 1) = v41;
                  v40 -= 4;
                }
                __p[0] = v40;
                __p[1] = v33;
                *(_QWORD *)&v121[0] = &v39[4 * v38];
                if (v34)
                  operator delete(v34);
              }
              else
              {
                *(_DWORD *)__p[1] = v30;
                v33 = v32 + 4;
              }
              __p[1] = v33;

            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v126, &v132, 16);
          }
          while (v26);
        }

        std::vector<std::vector<float>>::push_back[abi:ne180100](&v102, (uint64_t)__p);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        ++v23;
      }
      while (v23 != v87);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
    }
    while (v22);
  }

  v42 = v80;
  v100 = 0;
  v101 = 0;
  v99 = 0;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v81 = v42;
  v43 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v113, &v126, 16);
  if (v43)
  {
    v73 = *(_QWORD *)v114;
    do
    {
      v44 = 0;
      v72 = v43;
      do
      {
        if (*(_QWORD *)v114 != v73)
          objc_enumerationMutation(v81);
        v75 = v44;
        v45 = *(id *)(*((_QWORD *)&v113 + 1) + 8 * v44);
        memset(v112, 0, sizeof(v112));
        *(_OWORD *)__p = 0u;
        memset(v121, 0, sizeof(v121));
        v82 = v45;
        v46 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __p, v130, 16);
        if (v46)
        {
          v84 = **(_QWORD **)&v121[0];
          do
          {
            v47 = 0;
            v86 = v46;
            do
            {
              if (**(_QWORD **)&v121[0] != v84)
                objc_enumerationMutation(v82);
              v48 = *((id *)__p[1] + v47);
              v119 = 0;
              v117 = 0;
              v118 = 0;
              v122 = 0u;
              v123 = 0u;
              v124 = 0u;
              v125 = 0u;
              v49 = v48;
              v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v122, &v132, 16);
              v88 = v47;
              if (v50)
              {
                v51 = 0;
                v52 = *(_QWORD *)v123;
                do
                {
                  for (j = 0; j != v50; ++j)
                  {
                    if (*(_QWORD *)v123 != v52)
                      objc_enumerationMutation(v49);
                    v54 = *(id *)(*((_QWORD *)&v122 + 1) + 8 * j);
                    objc_msgSend(v54, "floatValue");
                    v56 = v55;
                    v57 = v118;
                    if (v118 >= v119)
                    {
                      v59 = (char *)v117;
                      v60 = (v118 - (_BYTE *)v117) >> 3;
                      v61 = v60 + 1;
                      if ((unint64_t)(v60 + 1) >> 61)
                        std::vector<int>::__throw_length_error[abi:ne180100]();
                      v62 = v119 - (_BYTE *)v117;
                      if ((v119 - (_BYTE *)v117) >> 2 > v61)
                        v61 = v62 >> 2;
                      if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
                        v63 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v63 = v61;
                      if (v63)
                      {
                        v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)&v119, v63);
                        v57 = v118;
                        v59 = (char *)v117;
                      }
                      else
                      {
                        v64 = 0;
                      }
                      v65 = &v64[8 * v60];
                      *(_DWORD *)v65 = v51;
                      *((_DWORD *)v65 + 1) = v56;
                      v66 = v65;
                      if (v57 != v59)
                      {
                        do
                        {
                          v67 = *((_QWORD *)v57 - 1);
                          v57 -= 8;
                          *((_QWORD *)v66 - 1) = v67;
                          v66 -= 8;
                        }
                        while (v57 != v59);
                        v59 = (char *)v117;
                      }
                      v58 = v65 + 8;
                      v117 = v66;
                      v118 = v65 + 8;
                      v119 = &v64[8 * v63];
                      if (v59)
                        operator delete(v59);
                    }
                    else
                    {
                      *(_DWORD *)v118 = v51;
                      *((_DWORD *)v57 + 1) = v55;
                      v58 = v57 + 8;
                    }
                    v118 = v58;

                    ++v51;
                  }
                  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v122, &v132, 16);
                }
                while (v50);
              }

              std::vector<std::vector<std::pair<int,float>>>::push_back[abi:ne180100](v112, (uint64_t)&v117);
              if (v117)
              {
                v118 = (char *)v117;
                operator delete(v117);
              }

              v47 = v88 + 1;
            }
            while (v88 + 1 != v86);
            v46 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __p, v130, 16);
          }
          while (v46);
        }

        std::vector<std::vector<std::vector<std::pair<int,float>>>>::push_back[abi:ne180100]((uint64_t *)&v99, (uint64_t)v112);
        v132 = (void **)v112;
        std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v132);

        v44 = v75 + 1;
      }
      while (v75 + 1 != v72);
      v43 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v113, &v126, 16);
    }
    while (v43);
  }

  v132 = (void **)&off_1E5D2D150;
  *(_OWORD *)v133 = xmmword_1AE13F660;
  *(_DWORD *)&v133[16] = -1082130432;
  *(_QWORD *)&v133[20] = 0x100000003;
  *(_WORD *)&v133[28] = 0;
  v133[30] = 0;
  kaldi::nnet1::GradientNormalizationParams::GradientNormalizationParams((kaldi::nnet1::GradientNormalizationParams *)&v126);
  *(float *)v133 = a6;
  v133[28] = 1;
  *(float *)&v126 = a9;
  if (v78)
  {
    objc_msgSend(v78, "ear_toString");
  }
  else
  {
    v130[1] = 0;
    v130[0] = 0;
    v131 = 0;
  }
  DWORD1(v126) = kaldi::nnet1::Component::MarkerToGradientNormType((kaldi::nnet1::Component *)v130);
  if (SHIBYTE(v131) < 0)
    operator delete(v130[0]);
  BYTE9(v126) = 0;
  v97 = &off_1E5D2D150;
  v98[0] = *(_OWORD *)v133;
  *(_OWORD *)((char *)v98 + 15) = *(_OWORD *)&v133[15];
  v68 = v126;
  v69 = DWORD2(v126);
  if (v79)
  {
    objc_msgSend(v79, "ear_toString");
    if (v77)
    {
LABEL_79:
      objc_msgSend(v77, "ear_toString");
      goto LABEL_82;
    }
  }
  else
  {
    v95[0] = 0;
    v95[1] = 0;
    v96 = 0;
    if (v77)
      goto LABEL_79;
  }
  v93[0] = 0;
  v93[1] = 0;
  v94 = 0;
LABEL_82:
  memset(v92, 0, sizeof(v92));
  std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v92, v102, v103, 0xAAAAAAAAAAAAAAABLL * ((v103 - v102) >> 3));
  memset(v91, 0, sizeof(v91));
  std::vector<std::vector<std::vector<std::pair<int,float>>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<std::pair<int,float>>>*,std::vector<std::vector<std::pair<int,float>>>*>(v91, v99, v100, 0xAAAAAAAAAAAAAAABLL * (v100 - v99));
  if (v76)
  {
    objc_msgSend(v76, "ear_toString");
  }
  else
  {
    v89[0] = 0;
    v89[1] = 0;
    v90 = 0;
  }
  kaldi::nnet1::DoBackProp((const kaldi::nnet1::NnetTrainOptions *)&v97, v68, v69, (uint64_t)v95, (uint64_t)v93, a8, v92, v91, a11, (uint64_t)v89, (uint64_t *)v111, (uint64_t)&v105, (uint64_t)&v108);
  if (SHIBYTE(v90) < 0)
    operator delete(v89[0]);
  v130[0] = v91;
  std::vector<std::vector<std::vector<unsigned long>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v130);
  v130[0] = v92;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v130);
  if (SHIBYTE(v94) < 0)
    operator delete(v93[0]);
  if (SHIBYTE(v96) < 0)
    operator delete(v95[0]);
  kaldi::nnet1::NnetTrainOptions::~NnetTrainOptions((kaldi::nnet1::NnetTrainOptions *)&v97);
  if (a14)
  {
    EARHelpers::VectorToArray<int>((unsigned int **)&v108);
    *a14 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a13)
  {
    EARHelpers::VectorToArray<float>((uint64_t)&v105);
    *a13 = (id)objc_claimAutoreleasedReturnValue();
  }
  EARHelpers::MultiArrayFromJaggedVec(v111);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  kaldi::nnet1::NnetTrainOptions::~NnetTrainOptions((kaldi::nnet1::NnetTrainOptions *)&v132);
  v132 = (void **)&v99;
  std::vector<std::vector<std::vector<unsigned long>>>::__destroy_vector::operator()[abi:ne180100](&v132);
  v132 = (void **)&v102;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v132);
  if (v105)
  {
    v106 = v105;
    operator delete(v105);
  }
  if (v108)
  {
    v109 = v108;
    operator delete(v108);
  }
  v132 = (void **)v111;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v132);

  return v70;
}

@end
