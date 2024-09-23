@implementation MLItemSimilarityRecommender

- (const)modelData
{
  if (self->m_model_data)
    return (const char *)-[NSData bytes](self->m_model_data, "bytes");
  else
    return self->m_cached_model.__begin_;
}

- (id)_itemForIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  NSArray *m_item_integer_list;
  void *v9;
  id v10;

  v7 = 184;
  m_item_integer_list = self->m_item_integer_list;
  if (m_item_integer_list || (v7 = 176, (m_item_integer_list = self->m_item_string_list) != 0))
  {
    if (-[NSArray count](m_item_integer_list, "count") <= a3)
    {
      if (a4)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Internal Error: item index out of bounds."));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        *a4 = v10;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v7), "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (BOOL)_mapItemSequence:(id)a3 dest:(void *)a4 error:(id *)a5
{
  id v8;
  NSArray *m_item_string_list;
  const __CFString *v10;
  void *v11;
  NSArray *m_item_integer_list;
  unint64_t i;
  void *v14;
  unint64_t v15;
  NSDictionary *m_item_mapping;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  unint64_t j;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t *v41;
  _QWORD *v42;
  unint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  void *v51;
  unint64_t k;
  void *v53;
  unint64_t v54;
  NSDictionary *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t *v62;
  _QWORD *v63;
  uint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;

  v8 = a3;
  if (objc_msgSend(v8, "type") != 1 && objc_msgSend(v8, "type") != 3)
  {
    if (a5)
    {
      v10 = CFSTR("Input sequence of items for item similarity recommender must be strings or integers.");
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  *((_QWORD *)a4 + 1) = *(_QWORD *)a4;
  if (objc_msgSend(v8, "type") == 1)
  {
    m_item_string_list = self->m_item_string_list;
    if (m_item_string_list && -[NSArray count](m_item_string_list, "count"))
    {
      if (a5)
      {
        v10 = CFSTR("Input sequence of items for item similarity recommender with string item ids must be strings.");
LABEL_39:
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", v10);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      goto LABEL_40;
    }
    objc_msgSend(v8, "int64Values");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<long long>::reserve((void **)a4, objc_msgSend(v11, "count"));

    m_item_integer_list = self->m_item_integer_list;
    if (m_item_integer_list && -[NSArray count](m_item_integer_list, "count"))
    {
      for (i = 0; ; ++i)
      {
        objc_msgSend(v8, "int64Values");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (i >= v15)
          break;
        m_item_mapping = self->m_item_mapping;
        objc_msgSend(v8, "int64Values");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](m_item_mapping, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = objc_msgSend(v19, "unsignedLongValue");
          v21 = v20;
          v23 = (uint64_t *)*((_QWORD *)a4 + 1);
          v22 = *((_QWORD *)a4 + 2);
          if ((unint64_t)v23 >= v22)
          {
            v25 = *(uint64_t **)a4;
            v26 = ((uint64_t)v23 - *(_QWORD *)a4) >> 3;
            v27 = v26 + 1;
            if ((unint64_t)(v26 + 1) >> 61)
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            v28 = v22 - (_QWORD)v25;
            if (v28 >> 2 > v27)
              v27 = v28 >> 2;
            if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
              v29 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v29 = v27;
            if (v29)
            {
              v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v29);
              v25 = *(uint64_t **)a4;
              v23 = (uint64_t *)*((_QWORD *)a4 + 1);
            }
            else
            {
              v30 = 0;
            }
            v31 = (uint64_t *)(v29 + 8 * v26);
            *v31 = v21;
            v24 = v31 + 1;
            while (v23 != v25)
            {
              v32 = *--v23;
              *--v31 = v32;
            }
            *(_QWORD *)a4 = v31;
            *((_QWORD *)a4 + 1) = v24;
            *((_QWORD *)a4 + 2) = v29 + 8 * v30;
            if (v25)
              operator delete(v25);
          }
          else
          {
            *v23 = v20;
            v24 = v23 + 1;
          }
          *((_QWORD *)a4 + 1) = v24;
        }

      }
    }
    else
    {
      for (j = 0; ; ++j)
      {
        objc_msgSend(v8, "int64Values");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        if (j >= v36)
          break;
        objc_msgSend(v8, "int64Values");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", j);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "unsignedLongValue");

        if (v39 < self->m_num_items)
        {
          v41 = (unint64_t *)*((_QWORD *)a4 + 1);
          v40 = *((_QWORD *)a4 + 2);
          if ((unint64_t)v41 >= v40)
          {
            v43 = *(unint64_t **)a4;
            v44 = ((uint64_t)v41 - *(_QWORD *)a4) >> 3;
            v45 = v44 + 1;
            if ((unint64_t)(v44 + 1) >> 61)
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            v46 = v40 - (_QWORD)v43;
            if (v46 >> 2 > v45)
              v45 = v46 >> 2;
            if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8)
              v47 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v47 = v45;
            if (v47)
            {
              v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v47);
              v43 = *(unint64_t **)a4;
              v41 = (unint64_t *)*((_QWORD *)a4 + 1);
            }
            else
            {
              v48 = 0;
            }
            v49 = (unint64_t *)(v47 + 8 * v44);
            *v49 = v39;
            v42 = v49 + 1;
            while (v41 != v43)
            {
              v50 = *--v41;
              *--v49 = v50;
            }
            *(_QWORD *)a4 = v49;
            *((_QWORD *)a4 + 1) = v42;
            *((_QWORD *)a4 + 2) = v47 + 8 * v48;
            if (v43)
              operator delete(v43);
          }
          else
          {
            *v41 = v39;
            v42 = v41 + 1;
          }
          *((_QWORD *)a4 + 1) = v42;
        }
      }
    }
LABEL_84:
    v33 = 0;
    goto LABEL_85;
  }
  if (objc_msgSend(v8, "type") != 3)
  {
    if (a5)
    {
      v10 = CFSTR("Input sequence of items for item similarity recommender must be integers or strings.");
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  if (!-[NSArray count](self->m_item_integer_list, "count"))
  {
    if (!-[NSArray count](self->m_item_string_list, "count"))
    {
      if (!a5)
        goto LABEL_40;
      v10 = CFSTR("String items require string item ids to be be set.");
      goto LABEL_39;
    }
    objc_msgSend(v8, "stringValues");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<long long>::reserve((void **)a4, objc_msgSend(v51, "count"));

    for (k = 0; ; ++k)
    {
      objc_msgSend(v8, "stringValues");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      if (k >= v54)
        break;
      v55 = self->m_item_mapping;
      objc_msgSend(v8, "stringValues");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", k);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        v59 = objc_msgSend(v58, "unsignedLongValue");
        v60 = v59;
        v62 = (uint64_t *)*((_QWORD *)a4 + 1);
        v61 = *((_QWORD *)a4 + 2);
        if ((unint64_t)v62 >= v61)
        {
          v64 = *(uint64_t **)a4;
          v65 = ((uint64_t)v62 - *(_QWORD *)a4) >> 3;
          v66 = v65 + 1;
          if ((unint64_t)(v65 + 1) >> 61)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v67 = v61 - (_QWORD)v64;
          if (v67 >> 2 > v66)
            v66 = v67 >> 2;
          if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8)
            v68 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v68 = v66;
          if (v68)
          {
            v68 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v68);
            v64 = *(uint64_t **)a4;
            v62 = (uint64_t *)*((_QWORD *)a4 + 1);
          }
          else
          {
            v69 = 0;
          }
          v70 = (uint64_t *)(v68 + 8 * v65);
          *v70 = v60;
          v63 = v70 + 1;
          while (v62 != v64)
          {
            v71 = *--v62;
            *--v70 = v71;
          }
          *(_QWORD *)a4 = v70;
          *((_QWORD *)a4 + 1) = v63;
          *((_QWORD *)a4 + 2) = v68 + 8 * v69;
          if (v64)
            operator delete(v64);
        }
        else
        {
          *v62 = v59;
          v63 = v62 + 1;
        }
        *((_QWORD *)a4 + 1) = v63;
      }

    }
    goto LABEL_84;
  }
  if (a5)
  {
    v10 = CFSTR("Input sequence of items for item similarity recommender with integer item ids must be integers.");
    goto LABEL_39;
  }
LABEL_40:
  v33 = 1;
LABEL_85:

  return v33;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  MLPredictionEvent *v7;
  void *v8;
  MLDictionaryFeatureProvider *v9;
  vector<unsigned long long, std::allocator<unsigned long long>> *p_m_items;
  vector<double, std::allocator<double>> *p_m_scores;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v25;
  unint64_t *begin;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  double *v38;
  double *v39;
  double *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  unint64_t m_num_items;
  void *v49;
  uint64_t v50;
  vector<unsigned char, std::allocator<unsigned char>> *p_m_item_invalid_mask;
  unint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  size_t v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  unint64_t v61;
  char *v62;
  char *v63;
  void *v64;
  vector<unsigned long long, std::allocator<unsigned long long>> *p_m_item_buffer;
  unint64_t *v66;
  unint64_t *v67;
  int64_t v68;
  uint64_t v69;
  vector<unsigned long long, std::allocator<unsigned long long>> *v70;
  void *v71;
  vector<unsigned long long, std::allocator<unsigned long long>> *v72;
  unint64_t *v73;
  unint64_t *v74;
  uint64_t v75;
  unint64_t *v76;
  unint64_t *v77;
  uint64_t v78;
  int64_t v79;
  unint64_t v80;
  uint64_t v81;
  double *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  char *v86;
  double *v87;
  unint64_t *v88;
  unint64_t *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  _QWORD *v100;
  uint64_t v101;
  unint64_t v102;
  BOOL v103;
  char v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  double v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  vector<std::pair<unsigned long long, double>, std::allocator<std::pair<unsigned long long, double>>> *p_m_item_heap;
  void *v129;
  unint64_t v130;
  char *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  unint64_t v136;
  unint64_t j;
  double v138;
  char *v139;
  char *v140;
  void *v141;
  char *v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  double *v148;
  double *v149;
  double *v150;
  double *v151;
  uint64_t v152;
  double *v153;
  unint64_t v154;
  double *v155;
  double *v156;
  int v157;
  double v158;
  double v159;
  unint64_t v160;
  double *v161;
  double v162;
  double v163;
  double *v164;
  double *v165;
  double v166;
  double *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double *v174;
  double v175;
  double v176;
  double *v177;
  double v178;
  double v179;
  double *v180;
  double v181;
  double v182;
  uint64_t v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double *v191;
  double *v192;
  double *v193;
  uint64_t v194;
  uint64_t v195;
  _BYTE *v196;
  unint64_t v197;
  unint64_t v198;
  _BYTE *v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  char *v203;
  char *v204;
  uint64_t v205;
  char *v206;
  char *v207;
  char *v208;
  unint64_t v209;
  uint64_t v210;
  double *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  _QWORD *v216;
  _QWORD *v217;
  void *v218;
  void *v219;
  void *v220;
  unint64_t v222;
  void (**v223)(_QWORD);
  id v224;
  id v225;
  id obj;
  void *v228;
  _QWORD aBlock[6];
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  id v234[7];
  int v235;
  __int128 v236;
  __int128 v237;
  const char *v238;
  CoreML::Archiver::MMappedContentManager *v239;
  _QWORD v240[2];
  __int128 v241;
  __int128 v242;
  CoreML::Archiver::MMappedContentManager *v243;
  _QWORD v244[2];
  __int128 v245;
  __int128 v246;
  CoreML::Archiver::MMappedContentManager *v247;
  _QWORD v248[2];
  _BYTE v249[128];
  uint64_t v250;

  v250 = *MEMORY[0x1E0C80C00];
  v225 = a3;
  v224 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v7 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v234, v7, 4, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v224, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  objc_msgSend(v225, "featureValueForName:", self->m_item_data_feature_name);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel signpostID](self, "signpostID");
  kdebug_trace();
  if (objc_msgSend(v228, "type") == 7)
  {
    objc_msgSend(v228, "sequenceValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[MLItemSimilarityRecommender _mapItemSequence:dest:error:](self, "_mapItemSequence:dest:error:", v8, &self->_m_items, a5))goto LABEL_53;
    -[MLModel signpostID](self, "signpostID");
    v9 = 0;
    kdebug_trace();
    goto LABEL_311;
  }
  if (objc_msgSend(v228, "type") == 6)
  {
    p_m_items = &self->_m_items;
    self->_m_items.__end_ = self->_m_items.__begin_;
    p_m_scores = &self->_m_scores;
    self->_m_scores.__end_ = self->_m_scores.__begin_;
    objc_msgSend(v228, "dictionaryValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<long long>::reserve((void **)&self->_m_items.__begin_, objc_msgSend(v12, "count"));

    objc_msgSend(v228, "dictionaryValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<double>::reserve((void **)&self->_m_scores.__begin_, objc_msgSend(v13, "count"));

    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    objc_msgSend(v228, "dictionaryValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v230, v249, 16);
    if (!v14)
      goto LABEL_53;
    obj = v8;
    v15 = *(_QWORD *)v231;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v231 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * i);
        objc_msgSend(v228, "dictionaryValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[NSDictionary count](self->m_item_mapping, "count"))
        {
          -[NSDictionary objectForKeyedSubscript:](self->m_item_mapping, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v20)
            goto LABEL_47;
          v22 = objc_msgSend(v20, "unsignedLongValue");

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a5)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("String items require string item ids to be be set."));
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            -[MLModel signpostID](self, "signpostID");
            kdebug_trace();
            goto LABEL_307;
          }
          v22 = objc_msgSend(v17, "unsignedLongValue");
        }
        if (v22 < self->m_num_items)
        {
          end = self->_m_items.__end_;
          value = self->_m_items.__end_cap_.__value_;
          if (end >= value)
          {
            begin = p_m_items->__begin_;
            v27 = end - p_m_items->__begin_;
            v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 61)
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            v29 = (char *)value - (char *)begin;
            if (v29 >> 2 > v28)
              v28 = v29 >> 2;
            v30 = (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8;
            v31 = 0x1FFFFFFFFFFFFFFFLL;
            if (!v30)
              v31 = v28;
            if (v31)
            {
              v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v31);
              begin = p_m_items->__begin_;
              end = self->_m_items.__end_;
            }
            else
            {
              v32 = 0;
            }
            v33 = (unint64_t *)(v31 + 8 * v27);
            *v33 = v22;
            v25 = v33 + 1;
            while (end != begin)
            {
              v34 = *--end;
              *--v33 = v34;
            }
            p_m_items->__begin_ = v33;
            self->_m_items.__end_ = v25;
            self->_m_items.__end_cap_.__value_ = (unint64_t *)(v31 + 8 * v32);
            if (begin)
              operator delete(begin);
          }
          else
          {
            *end = v22;
            v25 = end + 1;
          }
          self->_m_items.__end_ = v25;
          objc_msgSend(v19, "doubleValue");
          v36 = v35;
          v38 = self->_m_scores.__end_;
          v37 = self->_m_scores.__end_cap_.__value_;
          if (v38 >= v37)
          {
            v40 = p_m_scores->__begin_;
            v41 = v38 - p_m_scores->__begin_;
            v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 61)
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            v43 = (char *)v37 - (char *)v40;
            if (v43 >> 2 > v42)
              v42 = v43 >> 2;
            v30 = (unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8;
            v44 = 0x1FFFFFFFFFFFFFFFLL;
            if (!v30)
              v44 = v42;
            if (v44)
            {
              v44 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v44);
              v40 = p_m_scores->__begin_;
              v38 = self->_m_scores.__end_;
            }
            else
            {
              v45 = 0;
            }
            v46 = (double *)(v44 + 8 * v41);
            *(_QWORD *)v46 = v36;
            v39 = v46 + 1;
            while (v38 != v40)
            {
              v47 = *((_QWORD *)v38-- - 1);
              *((_QWORD *)v46-- - 1) = v47;
            }
            p_m_scores->__begin_ = v46;
            self->_m_scores.__end_ = v39;
            self->_m_scores.__end_cap_.__value_ = (double *)(v44 + 8 * v45);
            if (v40)
              operator delete(v40);
          }
          else
          {
            *(_QWORD *)v38 = v35;
            v39 = v38 + 1;
          }
          self->_m_scores.__end_ = v39;
        }
LABEL_47:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v230, v249, 16);
      if (!v14)
      {
        v8 = obj;
LABEL_53:

        m_num_items = self->m_num_items;
        if (-[NSString length](self->m_num_recommendations_feature_name, "length"))
        {
          objc_msgSend(v225, "featureValueForName:", self->m_num_recommendations_feature_name);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "int64Value");
          if (v50 - 1 >= self->m_num_items)
            m_num_items = self->m_num_items;
          else
            m_num_items = v50;

        }
        p_m_item_invalid_mask = &self->_m_item_invalid_mask;
        v52 = self->m_num_items;
        v53 = self->_m_item_invalid_mask.__end_cap_.__value_;
        v54 = self->_m_item_invalid_mask.__begin_;
        if (v53 - v54 >= v52)
        {
          v59 = (char *)(self->_m_item_invalid_mask.__end_ - v54);
          if ((unint64_t)v59 >= v52)
            v60 = (char *)self->m_num_items;
          else
            v60 = (char *)(self->_m_item_invalid_mask.__end_ - v54);
          for (; v60; --v60)
            *v54++ = 0;
          v30 = v52 >= (unint64_t)v59;
          v61 = v52 - (_QWORD)v59;
          if (v61 != 0 && v30)
          {
            v62 = self->_m_item_invalid_mask.__end_;
            v63 = &v62[v61];
            do
            {
              *v62++ = 0;
              --v61;
            }
            while (v61);
            self->_m_item_invalid_mask.__end_ = v63;
          }
          else
          {
            self->_m_item_invalid_mask.__end_ = &p_m_item_invalid_mask->__begin_[v52];
          }
        }
        else
        {
          if (v54)
          {
            self->_m_item_invalid_mask.__end_ = v54;
            operator delete(v54);
            v53 = 0;
            p_m_item_invalid_mask->__begin_ = 0;
            self->_m_item_invalid_mask.__end_ = 0;
            self->_m_item_invalid_mask.__end_cap_.__value_ = 0;
          }
          if ((v52 & 0x8000000000000000) != 0)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v55 = 2 * (_QWORD)v53;
          if (2 * (uint64_t)v53 <= v52)
            v55 = v52;
          if ((unint64_t)v53 >= 0x3FFFFFFFFFFFFFFFLL)
            v56 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v56 = v55;
          std::vector<unsigned char>::__vallocate[abi:ne180100](&self->_m_item_invalid_mask.__begin_, v56);
          v57 = self->_m_item_invalid_mask.__end_;
          v58 = &v57[v52];
          do
          {
            *v57++ = 0;
            --v52;
          }
          while (v52);
          self->_m_item_invalid_mask.__end_ = v58;
        }
        if (!-[NSString length](self->m_item_restriction_feature_name, "length"))
          goto LABEL_98;
        objc_msgSend(v225, "featureValueForName:", self->m_item_restriction_feature_name);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v64;
        if (!v64)
          goto LABEL_97;
        if (objc_msgSend(v64, "type") == 7)
        {
          objc_msgSend(v8, "sequenceValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          p_m_item_buffer = &self->_m_item_buffer;
          if (-[MLItemSimilarityRecommender _mapItemSequence:dest:error:](self, "_mapItemSequence:dest:error:", v19, &self->_m_item_buffer, a5))
          {
LABEL_102:
            -[MLModel signpostID](self, "signpostID");
            kdebug_trace();
            obj = v8;
            goto LABEL_307;
          }
          v66 = p_m_item_buffer->__begin_;
          v67 = self->_m_item_buffer.__end_;
          if (p_m_item_buffer->__begin_ != v67)
          {
            v68 = self->_m_item_invalid_mask.__end_ - p_m_item_invalid_mask->__begin_;
            if (v68 >= 1)
            {
              memset(p_m_item_invalid_mask->__begin_, 1, v68);
              v66 = p_m_item_buffer->__begin_;
              v67 = self->_m_item_buffer.__end_;
            }
            while (v66 != v67)
            {
              v69 = *v66++;
              p_m_item_invalid_mask->__begin_[v69] = 0;
            }
          }

LABEL_97:
LABEL_98:
          v70 = &self->_m_items;
          if (!-[NSString length](self->m_item_exclusion_feature_name, "length")
            || (objc_msgSend(v225, "featureValueForName:", self->m_item_exclusion_feature_name),
                v71 = (void *)objc_claimAutoreleasedReturnValue(),
                (v8 = v71) == 0))
          {
            v73 = v70->__begin_;
            v74 = self->_m_items.__end_;
            if (v70->__begin_ != v74)
            {
              do
              {
                v75 = *v73++;
                p_m_item_invalid_mask->__begin_[v75] = 1;
              }
              while (v73 != v74);
            }
            goto LABEL_112;
          }
          if (objc_msgSend(v71, "type") == 7)
          {
            objc_msgSend(v8, "sequenceValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = &self->_m_item_buffer;
            if (-[MLItemSimilarityRecommender _mapItemSequence:dest:error:](self, "_mapItemSequence:dest:error:", v19, &self->_m_item_buffer, a5))
            {
              goto LABEL_102;
            }
            v76 = v72->__begin_;
            v77 = self->_m_item_buffer.__end_;
            if (v72->__begin_ != v77)
            {
              do
              {
                v78 = *v76++;
                p_m_item_invalid_mask->__begin_[v78] = 1;
              }
              while (v76 != v77);
            }

LABEL_112:
            std::vector<double>::resize((char **)&self->_m_item_predictions, self->m_num_items);
            v79 = (char *)self->_m_item_predictions.__end_ - (char *)self->_m_item_predictions.__begin_;
            if (v79 >= 1)
              bzero(self->_m_item_predictions.__begin_, 8 * (((unint64_t)v79 >> 3) - ((unint64_t)v79 > 7)) + 8);
            -[MLModel signpostID](self, "signpostID");
            kdebug_trace();
            v80 = -[MLModel signpostID](self, "signpostID");
            v81 = objc_msgSend(v224, "parentSignpostID");
            kdebug_trace();
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __68__MLItemSimilarityRecommender_predictionFromFeatures_options_error___block_invoke;
            aBlock[3] = &__block_descriptor_48_e5_v8__0l;
            aBlock[4] = v80;
            aBlock[5] = v81;
            v223 = (void (**)(_QWORD))_Block_copy(aBlock);
            v222 = m_num_items;
            v82 = self->_m_item_predictions.__begin_;
            v83 = -[MLItemSimilarityRecommender modelData](self, "modelData");
            v84 = v83 + 12;
            v85 = 8 - ((unint64_t)(v83 + 12) & 7);
            v86 = p_m_item_invalid_mask->__begin_;
            if (((unint64_t)(v83 + 12) & 7) == 0)
              v85 = 0;
            if (self->_m_scores.__begin_ == self->_m_scores.__end_)
              v87 = 0;
            else
              v87 = self->_m_scores.__begin_;
            v88 = v70->__begin_;
            v89 = self->_m_items.__end_;
            v240[0] = 0;
            v240[1] = 0;
            v236 = 0u;
            v237 = 0u;
            v238 = 0;
            v239 = (CoreML::Archiver::MMappedContentManager *)v240;
            v235 = 0;
            HIDWORD(v236) = 64;
            v244[0] = 0;
            v244[1] = 0;
            v241 = 0u;
            v242 = 0u;
            v243 = (CoreML::Archiver::MMappedContentManager *)v244;
            DWORD1(v241) = 64;
            v248[0] = 0;
            v248[1] = 0;
            v245 = 0u;
            v246 = 0u;
            v247 = (CoreML::Archiver::MMappedContentManager *)v248;
            v235 = *(_DWORD *)v83;
            v90 = *(_QWORD *)(v83 + 4);
            *(_QWORD *)&v236 = v90;
            v91 = &v84[v85];
            *((_QWORD *)&v236 + 1) = *(_QWORD *)&v84[v85];
            v237 = *(_OWORD *)&v84[v85 + 8];
            if ((_QWORD)v237)
            {
              *((_QWORD *)&v237 + 1) = *((_QWORD *)v91 + 3);
              v238 = v91 + 32;
              v92 = (uint64_t)&v91[8 * *((_QWORD *)&v237 + 1) + 32];
            }
            else
            {
              v92 = (uint64_t)(v91 + 24);
            }
            v93 = 8 - (v92 & 7);
            if ((v92 & 7) == 0)
              v93 = 0;
            v94 = v92 + v93;
            v95 = 8 - (v94 & 7);
            if ((v94 & 7) == 0)
              v95 = 0;
            v96 = v94 + v95;
            v241 = *(_OWORD *)v96;
            *(_QWORD *)&v242 = *(_QWORD *)(v96 + 16);
            if (*((_QWORD *)&v241 + 1))
            {
              *(_QWORD *)&v242 = *(_QWORD *)(v96 + 24);
              *((_QWORD *)&v242 + 1) = v96 + 32;
              v97 = v96 + 32 + 8 * v242;
            }
            else
            {
              v97 = v96 + 24;
            }
            v98 = 8 - (v97 & 7);
            if ((v97 & 7) == 0)
              v98 = 0;
            v99 = (_QWORD *)(v97 + v98);
            *(_QWORD *)&v245 = *v99;
            *((_QWORD *)&v245 + 1) = v99 + 1;
            v100 = &v99[v245 + 1];
            *(_QWORD *)&v246 = *v100;
            *((_QWORD *)&v246 + 1) = v100 + 1;
            if (v90 >= 1)
              bzero(v82, 8 * (v90 - ((v90 & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
            if (v89 == v88)
              v101 = v90;
            else
              v101 = v89 - v88;
            if (v101)
            {
              v102 = 0;
              if (v87)
                v103 = v89 == v88;
              else
                v103 = 1;
              v104 = v103;
              v105 = HIDWORD(v236);
              v106 = v238;
              v107 = ~(-1 << SBYTE12(v236));
              v108 = v246;
              v109 = DWORD1(v241);
              v110 = *((_QWORD *)&v242 + 1);
              v111 = ~(-1 << SBYTE4(v241));
              while (1)
              {
                if (v89 == v88)
                {
                  v113 = 0.0;
                  v112 = v102;
                  goto LABEL_150;
                }
                v112 = v88[v102];
                if (v112 < v90)
                  break;
LABEL_175:
                if (++v102 == v101)
                  goto LABEL_176;
              }
              if (v87)
                v113 = v87[v102];
              else
                v113 = 1.0;
LABEL_150:
              v114 = *(_QWORD *)&v106[(v112 * v105) >> 3];
              v115 = v105 + v105 * v112;
              if ((_DWORD)v105 == 64)
              {
                v116 = *(_QWORD *)&v106[v115 >> 3];
                if (!(_QWORD)v108)
                {
LABEL_155:
                  v117 = v116 - v114;
                  if ((v104 & 1) != 0)
                  {
                    if (v116 > v114)
                    {
                      v118 = 0;
                      v119 = 0;
                      v120 = *((_QWORD *)&v245 + 1) + 8 * v114;
                      v121 = v109 * v114;
                      do
                      {
                        v122 = *(_QWORD *)(v110 + (v121 >> 3));
                        if ((_DWORD)v109 != 64)
                          v122 = (v122 >> (v121 & 7)) & v111;
                        if (v118)
                          ++v119;
                        v119 += v122;
                        if (!v86[v119])
                          v82[v119] = *(double *)(v120 + 8 * v118) + v82[v119];
                        ++v118;
                        v121 += v109;
                      }
                      while (v117 != v118);
                    }
                  }
                  else if (v116 > v114)
                  {
                    v123 = 0;
                    v124 = 0;
                    v125 = *((_QWORD *)&v245 + 1) + 8 * v114;
                    v126 = v109 * v114;
                    do
                    {
                      v127 = *(_QWORD *)(v110 + (v126 >> 3));
                      if ((_DWORD)v109 != 64)
                        v127 = (v127 >> (v126 & 7)) & v111;
                      if (v123)
                        ++v124;
                      v124 += v127;
                      if (!v86[v124])
                        v82[v124] = v82[v124] + *(double *)(v125 + 8 * v123) * v113;
                      ++v123;
                      v126 += v109;
                    }
                    while (v117 != v123);
                  }
                  goto LABEL_175;
                }
              }
              else
              {
                v114 = (v114 >> ((v112 * v105) & 7)) & v107;
                v116 = (*(_QWORD *)&v106[v115 >> 3] >> (v115 & 7)) & v107;
                if (!(_QWORD)v108)
                  goto LABEL_155;
              }
              v113 = v113 - *(double *)(*((_QWORD *)&v108 + 1) + 8 * v112);
              goto LABEL_155;
            }
LABEL_176:
            while (v90)
            {
              *v82 = *v82 / (double)(unint64_t)v101;
              ++v82;
              --v90;
            }
            CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v247);
            CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v243);
            CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v239);
            v223[2](v223);

            -[MLModel signpostID](self, "signpostID");
            kdebug_trace();
            p_m_item_heap = &self->_m_item_heap;
            v129 = self->_m_item_heap.__begin_;
            self->_m_item_heap.__end_ = v129;
            v130 = self->m_num_items;
            if (v130 > ((char *)self->_m_item_heap.__end_cap_.__value_ - (char *)v129) >> 4)
            {
              if (v130 >> 60)
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              v131 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v130);
              v134 = (char *)p_m_item_heap->__begin_;
              v133 = (char *)self->_m_item_heap.__end_;
              v135 = v131;
              if (v133 != p_m_item_heap->__begin_)
              {
                do
                {
                  *((_OWORD *)v135 - 1) = *((_OWORD *)v133 - 1);
                  v135 -= 16;
                  v133 -= 16;
                }
                while (v133 != v134);
                v133 = (char *)p_m_item_heap->__begin_;
              }
              p_m_item_heap->__begin_ = v135;
              self->_m_item_heap.__end_ = v131;
              self->_m_item_heap.__end_cap_.__value_ = &v131[16 * v132];
              if (v133)
                operator delete(v133);
            }
            v136 = self->m_num_items;
            if (v136)
            {
              for (j = 0; j < v136; ++j)
              {
                if (!p_m_item_invalid_mask->__begin_[j])
                {
                  v138 = self->_m_item_predictions.__begin_[j];
                  v140 = (char *)self->_m_item_heap.__end_;
                  v139 = (char *)self->_m_item_heap.__end_cap_.__value_;
                  if (v140 >= v139)
                  {
                    v142 = (char *)p_m_item_heap->__begin_;
                    v143 = (v140 - (char *)p_m_item_heap->__begin_) >> 4;
                    v144 = v143 + 1;
                    if ((unint64_t)(v143 + 1) >> 60)
                      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                    v145 = v139 - v142;
                    if (v145 >> 3 > v144)
                      v144 = v145 >> 3;
                    if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFF0)
                      v146 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v146 = v144;
                    if (v146)
                    {
                      v146 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v146);
                      v142 = (char *)p_m_item_heap->__begin_;
                      v140 = (char *)self->_m_item_heap.__end_;
                    }
                    else
                    {
                      v147 = 0;
                    }
                    v148 = (double *)(v146 + 16 * v143);
                    *(_QWORD *)v148 = j;
                    v148[1] = v138;
                    v149 = v148;
                    if (v140 != v142)
                    {
                      do
                      {
                        *((_OWORD *)v149 - 1) = *((_OWORD *)v140 - 1);
                        v149 -= 2;
                        v140 -= 16;
                      }
                      while (v140 != v142);
                      v142 = (char *)p_m_item_heap->__begin_;
                    }
                    v141 = v148 + 2;
                    p_m_item_heap->__begin_ = v149;
                    self->_m_item_heap.__end_ = v148 + 2;
                    self->_m_item_heap.__end_cap_.__value_ = (void *)(v146 + 16 * v147);
                    if (v142)
                      operator delete(v142);
                  }
                  else
                  {
                    *(_QWORD *)v140 = j;
                    *((double *)v140 + 1) = v138;
                    v141 = v140 + 16;
                  }
                  self->_m_item_heap.__end_ = v141;
                  v136 = self->m_num_items;
                }
              }
            }
            v151 = (double *)p_m_item_heap->__begin_;
            v150 = (double *)self->_m_item_heap.__end_;
            v152 = (char *)v150 - (char *)p_m_item_heap->__begin_;
            if (v222 >= v152 >> 4)
              goto LABEL_289;
            v153 = &v151[2 * v222];
            while (v150 != v153)
            {
              v154 = ((char *)v150 - (char *)v151) >> 4;
              if (v154 < 2)
                break;
              if (v154 == 3)
              {
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::__wrap_iter<std::pair<unsigned long long,double> *>>(v151, v151 + 2, v150 - 2);
                break;
              }
              if (v154 == 2)
              {
                v188 = *(v150 - 1);
                v189 = v151[1];
                if (v188 > v189)
                {
                  v190 = *v151;
                  *v151 = *(v150 - 2);
                  *(v150 - 2) = v190;
                  v151[1] = v188;
                  *(v150 - 1) = v189;
                }
                break;
              }
              if ((char *)v150 - (char *)v151 <= 127)
              {
                while (v151 != v150 - 2)
                {
                  v191 = v151;
                  v151 += 2;
                  if (v191 != v150 && v151 != v150)
                  {
                    v192 = v151;
                    v193 = v191;
                    do
                    {
                      if (v192[1] > v193[1])
                        v193 = v192;
                      v192 += 2;
                    }
                    while (v192 != v150);
                    if (v193 != v191)
                    {
                      v194 = *(_QWORD *)v191;
                      *v191 = *v193;
                      *(_QWORD *)v193 = v194;
                      v195 = *((_QWORD *)v191 + 1);
                      v191[1] = v193[1];
                      *((_QWORD *)v193 + 1) = v195;
                    }
                  }
                }
                break;
              }
              v155 = &v151[2 * (v154 >> 1)];
              v156 = v150 - 2;
              v157 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::__wrap_iter<std::pair<unsigned long long,double> *>>(v151, v155, v150 - 2);
              v158 = v151[1];
              v159 = v155[1];
              if (v158 <= v159)
              {
                v161 = v150 - 2;
                while (1)
                {
                  v160 = (unint64_t)(v161 - 2);
                  if (v161 - 2 == v151)
                    break;
                  v162 = *(v161 - 1);
                  v161 -= 2;
                  if (v162 > v159)
                  {
                    v163 = *v151;
                    *v151 = *(double *)v160;
                    *(double *)v160 = v163;
                    v151[1] = v162;
                    *(double *)(v160 + 8) = v158;
                    ++v157;
                    goto LABEL_218;
                  }
                }
                v177 = v151 + 2;
                v178 = *(v150 - 1);
                if (v158 <= v178)
                {
                  while (v177 != v156)
                  {
                    v179 = v177[1];
                    if (v158 > v179)
                    {
                      v183 = *(_QWORD *)v177;
                      *v177 = *(v150 - 2);
                      *((_QWORD *)v150 - 2) = v183;
                      v177[1] = v178;
                      *(v150 - 1) = v179;
                      v177 += 2;
                      goto LABEL_249;
                    }
                    v177 += 2;
                  }
                  break;
                }
LABEL_249:
                if (v177 == v156)
                  break;
                while (1)
                {
                  v184 = v151[1];
                  do
                  {
                    v174 = v177;
                    v185 = v177[1];
                    v177 += 2;
                  }
                  while (v184 <= v185);
                  do
                  {
                    v186 = *(v156 - 1);
                    v156 -= 2;
                  }
                  while (v184 > v186);
                  if (v174 >= v156)
                    break;
                  v187 = *v174;
                  *v174 = *v156;
                  *v156 = v187;
                  v174[1] = v186;
                  v156[1] = v185;
                }
                if (v174 > v153)
                  break;
              }
              else
              {
                v160 = (unint64_t)(v150 - 2);
LABEL_218:
                v164 = v151 + 2;
                if ((unint64_t)(v151 + 2) >= v160)
                {
                  v167 = v151 + 2;
                }
                else
                {
                  v165 = v151 + 2;
                  while (1)
                  {
                    v166 = v155[1];
                    do
                    {
                      v167 = v165;
                      v168 = v165[1];
                      v165 += 2;
                    }
                    while (v168 > v166);
                    do
                    {
                      v169 = *(double *)(v160 - 8);
                      v160 -= 16;
                    }
                    while (v169 <= v166);
                    if ((unint64_t)v167 >= v160)
                      break;
                    v170 = *v167;
                    *v167 = *(double *)v160;
                    *(double *)v160 = v170;
                    v167[1] = v169;
                    *(double *)(v160 + 8) = v168;
                    ++v157;
                    if (v155 == v167)
                      v155 = (double *)v160;
                  }
                }
                if (v167 != v155)
                {
                  v171 = v155[1];
                  v172 = v167[1];
                  if (v171 > v172)
                  {
                    v173 = *v167;
                    *v167 = *v155;
                    *v155 = v173;
                    v167[1] = v171;
                    v155[1] = v172;
                    ++v157;
                  }
                }
                if (v167 == v153)
                  break;
                if (!v157)
                {
                  if (v167 <= v153)
                  {
                    v180 = v167 + 2;
                    while (v180 != v150)
                    {
                      v181 = v180[1];
                      v182 = *(v180 - 1);
                      v180 += 2;
                      if (v181 > v182)
                        goto LABEL_233;
                    }
                  }
                  else
                  {
                    while (v164 != v167)
                    {
                      v175 = v164[1];
                      v176 = *(v164 - 1);
                      v164 += 2;
                      if (v175 > v176)
                        goto LABEL_233;
                    }
                  }
                  break;
                }
LABEL_233:
                if (v167 <= v153)
                {
                  v174 = v167 + 2;
                }
                else
                {
                  v150 = v167;
                  v174 = v151;
                }
              }
              v151 = v174;
            }
            v196 = p_m_item_heap->__begin_;
            v150 = (double *)self->_m_item_heap.__end_;
            v197 = ((char *)v150 - (char *)p_m_item_heap->__begin_) >> 4;
            if (v222 <= v197)
            {
              if (v222 >= v197)
                goto LABEL_288;
              v150 = (double *)&v196[16 * v222];
            }
            else
            {
              v198 = v222 - v197;
              v199 = self->_m_item_heap.__end_cap_.__value_;
              if (v222 - v197 > (v199 - (_BYTE *)v150) >> 4)
              {
                if (v222 >> 60)
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                v200 = v199 - v196;
                v201 = v200 >> 3;
                if (v200 >> 3 <= v222)
                  v201 = v222;
                if ((unint64_t)v200 >= 0x7FFFFFFFFFFFFFF0)
                  v202 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v202 = v201;
                v203 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v202);
                v204 = &v203[16 * v197];
                v206 = &v203[16 * v205];
                bzero(v204, 16 * v198);
                v150 = (double *)&v204[16 * v198];
                v208 = (char *)p_m_item_heap->__begin_;
                v207 = (char *)self->_m_item_heap.__end_;
                if (v207 != p_m_item_heap->__begin_)
                {
                  do
                  {
                    *((_OWORD *)v204 - 1) = *((_OWORD *)v207 - 1);
                    v204 -= 16;
                    v207 -= 16;
                  }
                  while (v207 != v208);
                  v207 = (char *)p_m_item_heap->__begin_;
                }
                p_m_item_heap->__begin_ = v204;
                self->_m_item_heap.__end_ = v150;
                self->_m_item_heap.__end_cap_.__value_ = v206;
                if (v207)
                {
                  operator delete(v207);
                  v150 = (double *)self->_m_item_heap.__end_;
                }
LABEL_288:
                v151 = (double *)p_m_item_heap->__begin_;
                v152 = (char *)v150 - (char *)p_m_item_heap->__begin_;
LABEL_289:
                v209 = 126 - 2 * __clz(v152 >> 4);
                if (v150 == v151)
                  v210 = 0;
                else
                  v210 = v209;
                std::__introsort<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *,false>(v151, v150, v210, 1);
                v8 = (void *)objc_opt_new();
                obj = v8;
                if (-[NSString length](self->m_item_score_output_feature_name, "length"))
                {
                  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", ((char *)self->_m_item_heap.__end_ - (char *)self->_m_item_heap.__begin_) >> 4);
                  v211 = (double *)p_m_item_heap->__begin_;
                  v212 = self->_m_item_heap.__end_;
                  if (p_m_item_heap->__begin_ != v212)
                  {
                    while (1)
                    {
                      -[MLItemSimilarityRecommender _itemForIndex:error:](self, "_itemForIndex:error:", *(_QWORD *)v211, a5);
                      v213 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v213)
                        break;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v211[1]);
                      v214 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", v214, v213);

                      v211 += 2;
                      if (v211 == v212)
                        goto LABEL_296;
                    }
LABEL_306:
                    -[MLModel signpostID](self, "signpostID");
                    kdebug_trace();
LABEL_307:

                    v9 = 0;
                    v8 = obj;
LABEL_311:

                    goto LABEL_312;
                  }
LABEL_296:
                  +[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v19, a5);
                  v215 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obj, "setObject:forKeyedSubscript:", v215, self->m_item_score_output_feature_name);

                  if (a5 && *a5)
                    goto LABEL_306;

                  v8 = obj;
                }
                if (-[NSString length](self->m_item_list_output_feature_name, "length"))
                {
                  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ((char *)self->_m_item_heap.__end_ - (char *)self->_m_item_heap.__begin_) >> 4);
                  v216 = p_m_item_heap->__begin_;
                  v217 = self->_m_item_heap.__end_;
                  if (p_m_item_heap->__begin_ != v217)
                  {
                    v8 = obj;
                    do
                    {
                      -[MLItemSimilarityRecommender _itemForIndex:error:](self, "_itemForIndex:error:", *v216, a5);
                      v218 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v218)
                        goto LABEL_306;
                      objc_msgSend(v19, "insertObject:atIndex:", v218, objc_msgSend(v19, "count"));

                      v216 += 2;
                    }
                    while (v216 != v217);
                  }
                  if (self->m_item_string_list)
                    +[MLSequence sequenceWithStringArray:](MLSequence, "sequenceWithStringArray:", v19);
                  else
                    +[MLSequence sequenceWithInt64Array:](MLSequence, "sequenceWithInt64Array:", v19);
                  v219 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v219);
                  v220 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v220, self->m_item_list_output_feature_name);

                  v8 = obj;
                }
                -[MLModel signpostID](self, "signpostID");
                kdebug_trace();
                v9 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v8, a5);
                goto LABEL_311;
              }
              bzero(self->_m_item_heap.__end_, 16 * v198);
              v150 += 2 * v198;
            }
            self->_m_item_heap.__end_ = v150;
            goto LABEL_288;
          }
          if (a5)
          {
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input exclusion list of items for item similarity recommender must be a sequence."));
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else if (a5)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input restriction list of items for item similarity recommender must be a sequence."));
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        -[MLModel signpostID](self, "signpostID");
        v9 = 0;
        kdebug_trace();
        goto LABEL_311;
      }
    }
  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input items for item similarity recommender must be a dictionary or a sequence."));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MLModel signpostID](self, "signpostID");
  kdebug_trace();
  v9 = 0;
LABEL_312:

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v234);
  return v9;
}

- (void).cxx_destruct
{
  vector<std::pair<unsigned long long, double>, std::allocator<std::pair<unsigned long long, double>>> *p_m_item_heap;
  void *begin;
  double *v5;
  char *v6;
  unint64_t *v7;
  unint64_t *v8;
  double *v9;
  char *v10;

  p_m_item_heap = &self->_m_item_heap;
  begin = self->_m_item_heap.__begin_;
  if (begin)
  {
    p_m_item_heap->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_m_item_predictions.__begin_;
  if (v5)
  {
    self->_m_item_predictions.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_m_item_invalid_mask.__begin_;
  if (v6)
  {
    self->_m_item_invalid_mask.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_m_item_buffer.__begin_;
  if (v7)
  {
    self->_m_item_buffer.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_m_items.__begin_;
  if (v8)
  {
    self->_m_items.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_m_scores.__begin_;
  if (v9)
  {
    self->_m_scores.__end_ = v9;
    operator delete(v9);
  }
  objc_storeStrong((id *)&self->m_item_integer_list, 0);
  objc_storeStrong((id *)&self->m_item_string_list, 0);
  objc_storeStrong((id *)&self->m_item_mapping, 0);
  objc_storeStrong((id *)&self->m_item_score_output_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_list_output_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_exclusion_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_restriction_feature_name, 0);
  objc_storeStrong((id *)&self->m_num_recommendations_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_data_feature_name, 0);
  objc_storeStrong((id *)&self->m_model_data, 0);
  v10 = self->m_cached_model.__begin_;
  if (v10)
  {
    self->m_cached_model.__end_ = v10;
    operator delete(v10);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 37) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 39) = 0;
  return self;
}

uint64_t __68__MLItemSimilarityRecommender_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (double)predictionFromFeatures:(uint64_t)a3 options:(char)a4 error:
{
  double *v7;
  double *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double *v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  double *v18;
  double *v19;
  double *v20;
  double v21;
  double *v22;
  double v23;
  double *v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  BOOL v29;
  double *v30;
  double v31;
  double *v32;
  double v33;
  double *v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  double *v56;
  BOOL v58;
  uint64_t v59;
  double *v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  int64_t v67;
  int64_t v68;
  int64_t v69;
  uint64_t v70;
  double *v71;
  double v72;
  double v73;
  double *v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  double *v83;
  double *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  double v89;
  double v90;
  uint64_t v91;
  unint64_t v92;
  double *v93;
  double *v95;
  double v96;
  double v97;
  double v98;
  double *v99;
  double v100;

  v7 = result;
LABEL_2:
  v8 = v7;
  while (2)
  {
    v7 = v8;
    v9 = (char *)a2 - (char *)v8;
    v10 = ((char *)a2 - (char *)v8) >> 4;
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v42 = *(a2 - 1);
        v43 = v8[1];
        if (v42 > v43)
        {
          v44 = *v8;
          *v8 = *(a2 - 2);
          *(a2 - 2) = v44;
          v8[1] = v42;
          *(a2 - 1) = v43;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v8, v8 + 2, a2 - 2);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v8, v8 + 2, v8 + 4, a2 - 2);
      case 5uLL:
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v8, v8 + 2, v8 + 4, v8 + 6);
        v45 = *(a2 - 1);
        v46 = v8[7];
        if (v45 > v46)
        {
          v47 = *((_QWORD *)v8 + 6);
          v8[6] = *(a2 - 2);
          *((_QWORD *)a2 - 2) = v47;
          v8[7] = v45;
          *(a2 - 1) = v46;
          v48 = v8[7];
          v49 = v8[5];
          if (v48 > v49)
          {
            v50 = *((_QWORD *)v8 + 4);
            v51 = *((_QWORD *)v8 + 6);
            *((_QWORD *)v8 + 4) = v51;
            *((_QWORD *)v8 + 6) = v50;
            v8[5] = v48;
            v8[7] = v49;
            v52 = v8[3];
            if (v48 > v52)
            {
              v53 = *((_QWORD *)v8 + 2);
              *((_QWORD *)v8 + 2) = v51;
              *((_QWORD *)v8 + 4) = v53;
              v8[3] = v48;
              v8[5] = v52;
              v54 = v8[1];
              if (v48 > v54)
              {
                v55 = *v8;
                *(_QWORD *)v8 = v51;
                v8[2] = v55;
                v8[1] = v48;
                v8[3] = v54;
              }
            }
          }
        }
        return result;
      default:
        if (v9 <= 383)
        {
          v56 = v8 + 2;
          v58 = v8 == a2 || v56 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v58)
            {
              v59 = 0;
              v60 = v8;
              do
              {
                v61 = v60[3];
                v62 = v60[1];
                v60 = v56;
                if (v61 > v62)
                {
                  v63 = *v56;
                  v64 = v59;
                  while (1)
                  {
                    v65 = (double *)((char *)v8 + v64);
                    v65[2] = *(double *)((char *)v8 + v64);
                    v65[3] = *(double *)((char *)v8 + v64 + 8);
                    if (!v64)
                      break;
                    v64 -= 16;
                    if (v61 <= *(v65 - 1))
                    {
                      v66 = (uint64_t)v8 + v64 + 16;
                      goto LABEL_80;
                    }
                  }
                  v66 = (uint64_t)v8;
LABEL_80:
                  *(double *)v66 = v63;
                  *(double *)(v66 + 8) = v61;
                }
                v56 = v60 + 2;
                v59 += 16;
              }
              while (v60 + 2 != a2);
            }
          }
          else if (!v58)
          {
            v95 = v8 + 1;
            do
            {
              v96 = v7[3];
              v97 = v7[1];
              v7 = v56;
              if (v96 > v97)
              {
                v98 = *v56;
                v99 = v95;
                do
                {
                  v99[1] = *(v99 - 1);
                  v99[2] = *v99;
                  v100 = *(v99 - 2);
                  v99 -= 2;
                }
                while (v96 > v100);
                v99[1] = v98;
                v99[2] = v96;
              }
              v56 = v7 + 2;
              v95 += 2;
            }
            while (v7 + 2 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v8 != a2)
          {
            v67 = (v10 - 2) >> 1;
            v68 = v67;
            do
            {
              v69 = v68;
              if (v67 >= v68)
              {
                v70 = (2 * v68) | 1;
                v71 = &v8[2 * v70];
                if (2 * v69 + 2 < (uint64_t)v10 && v71[1] > v71[3])
                {
                  v71 += 2;
                  v70 = 2 * v69 + 2;
                }
                v72 = v71[1];
                v73 = v8[2 * v69 + 1];
                if (v72 <= v73)
                {
                  v74 = &v8[2 * v69];
                  v75 = *(_QWORD *)v74;
                  do
                  {
                    v76 = v74;
                    v74 = v71;
                    *v76 = *v71;
                    v76[1] = v72;
                    if (v67 < v70)
                      break;
                    v77 = 2 * v70;
                    v70 = (2 * v70) | 1;
                    v71 = &v8[2 * v70];
                    v78 = v77 + 2;
                    if (v78 < (uint64_t)v10 && v71[1] > v71[3])
                    {
                      v71 += 2;
                      v70 = v78;
                    }
                    v72 = v71[1];
                  }
                  while (v72 <= v73);
                  *(_QWORD *)v74 = v75;
                  v74[1] = v73;
                }
              }
              v68 = v69 - 1;
            }
            while (v69);
            v79 = (unint64_t)v9 >> 4;
            do
            {
              v80 = 0;
              v81 = *v8;
              v82 = *((_QWORD *)v8 + 1);
              v83 = v8;
              do
              {
                v84 = v83;
                v83 += 2 * v80 + 2;
                v85 = 2 * v80;
                v80 = (2 * v80) | 1;
                v86 = v85 + 2;
                if (v86 < v79 && v83[1] > v83[3])
                {
                  v83 += 2;
                  v80 = v86;
                }
                *v84 = *v83;
                v84[1] = v83[1];
              }
              while (v80 <= (uint64_t)((unint64_t)(v79 - 2) >> 1));
              if (v83 == a2 - 2)
              {
                *v83 = v81;
                *((_QWORD *)v83 + 1) = v82;
              }
              else
              {
                *v83 = *(a2 - 2);
                v83[1] = *(a2 - 1);
                *(a2 - 2) = v81;
                *((_QWORD *)a2 - 1) = v82;
                v87 = (char *)v83 - (char *)v8 + 16;
                if (v87 >= 17)
                {
                  v88 = (((unint64_t)v87 >> 4) - 2) >> 1;
                  v89 = v8[2 * v88 + 1];
                  v90 = v83[1];
                  if (v89 > v90)
                  {
                    v91 = *(_QWORD *)v83;
                    do
                    {
                      v92 = v88;
                      v93 = v83;
                      v83 = &v8[2 * v92];
                      *v93 = *v83;
                      v93[1] = v89;
                      if (!v92)
                        break;
                      v88 = (v92 - 1) >> 1;
                      v89 = v8[2 * v88 + 1];
                    }
                    while (v89 > v90);
                    *(_QWORD *)v83 = v91;
                    v8[2 * v92 + 1] = v90;
                  }
                }
              }
              a2 -= 2;
            }
            while (v79-- > 2);
          }
          return result;
        }
        v11 = v10 >> 1;
        v12 = &v8[2 * (v10 >> 1)];
        if ((unint64_t)v9 < 0x801)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(&v7[2 * (v10 >> 1)], v7, a2 - 2);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v7, &v7[2 * (v10 >> 1)], a2 - 2);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v7 + 2, v12 - 2, a2 - 4);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v7 + 4, &v7[2 * v11 + 2], a2 - 6);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v12 - 2, v12, &v7[2 * v11 + 2]);
          v13 = *v7;
          *v7 = *v12;
          *v12 = v13;
          v14 = *((_QWORD *)v7 + 1);
          v7[1] = v12[1];
          *((_QWORD *)v12 + 1) = v14;
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          v15 = v7[1];
          if (*(v7 - 1) > v15)
            goto LABEL_12;
          if (v15 <= *(a2 - 1))
          {
            v32 = v7 + 2;
            do
            {
              v8 = v32;
              if (v32 >= a2)
                break;
              v33 = v32[1];
              v32 += 2;
            }
            while (v15 <= v33);
          }
          else
          {
            v30 = v7;
            do
            {
              v8 = v30 + 2;
              v31 = v30[3];
              v30 += 2;
            }
            while (v15 <= v31);
          }
          v34 = a2;
          if (v8 < a2)
          {
            v35 = a2;
            do
            {
              v34 = v35 - 2;
              v36 = *(v35 - 1);
              v35 -= 2;
            }
            while (v15 > v36);
          }
          v37 = *v7;
          while (v8 < v34)
          {
            v38 = *v8;
            *v8 = *v34;
            *v34 = v38;
            v39 = *((_QWORD *)v8 + 1);
            v8[1] = v34[1];
            *((_QWORD *)v34 + 1) = v39;
            do
            {
              v40 = v8[3];
              v8 += 2;
            }
            while (v15 <= v40);
            do
            {
              v41 = *(v34 - 1);
              v34 -= 2;
            }
            while (v15 > v41);
          }
          if (v8 - 2 != v7)
          {
            *v7 = *(v8 - 2);
            v7[1] = *(v8 - 1);
          }
          a4 = 0;
          *(v8 - 2) = v37;
          *(v8 - 1) = v15;
          continue;
        }
        v15 = v7[1];
LABEL_12:
        v16 = *v7;
        v17 = v7;
        do
        {
          v18 = v17;
          v17 += 2;
        }
        while (v18[3] > v15);
        v19 = a2;
        if (v18 == v7)
        {
          v22 = a2;
          while (v17 < v22)
          {
            v20 = v22 - 2;
            v23 = *(v22 - 1);
            v22 -= 2;
            if (v23 > v15)
              goto LABEL_22;
          }
          v20 = v22;
        }
        else
        {
          do
          {
            v20 = v19 - 2;
            v21 = *(v19 - 1);
            v19 -= 2;
          }
          while (v21 <= v15);
        }
LABEL_22:
        v8 = v17;
        if (v17 < v20)
        {
          v24 = v20;
          do
          {
            v25 = *v8;
            *v8 = *v24;
            *v24 = v25;
            v26 = *((_QWORD *)v8 + 1);
            v8[1] = v24[1];
            *((_QWORD *)v24 + 1) = v26;
            do
            {
              v27 = v8[3];
              v8 += 2;
            }
            while (v27 > v15);
            do
            {
              v28 = *(v24 - 1);
              v24 -= 2;
            }
            while (v28 <= v15);
          }
          while (v8 < v24);
        }
        if (v8 - 2 != v7)
        {
          *v7 = *(v8 - 2);
          v7[1] = *(v8 - 1);
        }
        *(v8 - 2) = v16;
        *(v8 - 1) = v15;
        if (v17 < v20)
        {
LABEL_33:
          result = (double *)std::__introsort<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *,false>(v7, v8 - 2, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v29 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v7, v8 - 2);
        result = (double *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v8, a2);
        if (!(_DWORD)result)
        {
          if (v29)
            continue;
          goto LABEL_33;
        }
        a2 = v8 - 2;
        if (!v29)
          goto LABEL_2;
        return result;
    }
  }
}

+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  MLItemSimilarityRecommender *v8;
  MLModelConfiguration *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  _OWORD *v18;
  _QWORD *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  _QWORD **v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t *v26;
  unint64_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  BOOL v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  char *j;
  __int128 v51;
  unint64_t v52;
  char *v53;
  _QWORD *v54;
  _OWORD *v55;
  __int128 v56;
  int64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  _QWORD *v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  char *v82;
  char *v83;
  _QWORD *v84;
  void *v85;
  unint64_t *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  unint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD *v103;
  uint64_t v104;
  void *v105;
  _QWORD *v106;
  uint64_t v107;
  void *v108;
  _QWORD *v109;
  uint64_t v110;
  void *v111;
  _QWORD *v112;
  uint64_t v113;
  void *v114;
  _QWORD *v115;
  uint64_t v116;
  void *v117;
  _QWORD *v118;
  uint64_t v119;
  void *v120;
  std::__shared_weak_count *v121;
  unint64_t *v122;
  unint64_t v123;
  _QWORD *v125;
  _QWORD *v126;
  id v127;
  _QWORD *v128;
  _QWORD *v129;
  char *v130;
  uint64_t v131;
  std::__shared_weak_count *v132;
  void *__dst[2];
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t *v139;
  _QWORD *v140[2];
  uint64_t v141;
  std::__shared_weak_count *v142;
  char *v143;
  std::__shared_weak_count *v144;
  void **__src;
  _QWORD *v146[2];
  _BYTE v147[128];
  void *__p;
  uint64_t v149[5];
  CoreML::Archiver::MMappedContentManager *v150;
  _QWORD v151[2];
  _DWORD v152[8];
  CoreML::Archiver::MMappedContentManager *v153;
  _QWORD v154[2];
  unint64_t v155[2];
  void *v156[2];
  CoreML::Archiver::MMappedContentManager *v157;
  _QWORD v158[5];

  v158[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 501)
  {
    v8 = [MLItemSimilarityRecommender alloc];
    v9 = objc_alloc_init(MLModelConfiguration);
    v10 = -[MLModel initDescriptionOnlyWithSpecification:configuration:error:](v8, "initDescriptionOnlyWithSpecification:configuration:error:", a3, v9, a5);

    if (!v10)
    {
      v74 = 0;
LABEL_154:

      goto LABEL_155;
    }
    v128 = v10;
    CoreML::Recommender::constructAndValidateItemSimilarityRecommenderFromSpec((CoreML::Recommender *)&v141, *(const CoreML::Specification::Model **)a3);
    v140[0] = 0;
    v140[1] = 0;
    v139 = (uint64_t *)v140;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v136 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v15);
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17 = objc_msgSend(v16, "UTF8String");
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
          __src = &__p;
          v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v139, &__p, (_OWORD **)&__src);
          MEMORY[0x1A1AD5EAC]((char *)v18 + 56, v17);
          if (SHIBYTE(v149[1]) < 0)
            operator delete(__p);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
      }
      while (v12);
    }

    v19 = (_QWORD *)v141;
    v132 = v142;
    if (v142)
    {
      p_shared_owners = (unint64_t *)&v142->__shared_owners_;
      do
        v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
    }
    v151[0] = 0;
    v151[1] = 0;
    memset(v149, 0, sizeof(v149));
    v150 = (CoreML::Archiver::MMappedContentManager *)v151;
    LODWORD(__p) = 0;
    HIDWORD(v149[1]) = 64;
    v154[1] = 0;
    memset(v152, 0, sizeof(v152));
    v154[0] = 0;
    v153 = (CoreML::Archiver::MMappedContentManager *)v154;
    v152[1] = 64;
    v158[1] = 0;
    *(_OWORD *)v155 = 0u;
    *(_OWORD *)v156 = 0u;
    v158[0] = 0;
    v157 = (CoreML::Archiver::MMappedContentManager *)v158;
    v22 = v146;
    v146[0] = 0;
    v146[1] = 0;
    __src = (void **)v146;
    v23 = operator new(0x110uLL);
    v23[1] = 0;
    v23[2] = 0;
    *v23 = &off_1E3D5BBC0;
    v23[4] = 0;
    v23[3] = v23 + 4;
    v23[8] = 0;
    v23[7] = 0;
    v23[5] = 0;
    v23[6] = v23 + 7;
    *((_OWORD *)v23 + 5) = 0u;
    *((_OWORD *)v23 + 6) = 0u;
    *((_OWORD *)v23 + 7) = 0u;
    *((_OWORD *)v23 + 8) = 0u;
    *((_OWORD *)v23 + 9) = 0u;
    *((_OWORD *)v23 + 10) = 0u;
    *((_OWORD *)v23 + 11) = 0u;
    *((_OWORD *)v23 + 12) = 0u;
    *((_OWORD *)v23 + 13) = 0u;
    *((_OWORD *)v23 + 14) = 0u;
    *((_OWORD *)v23 + 15) = 0u;
    *((_OWORD *)v23 + 16) = 0u;
    v143 = (char *)(v23 + 3);
    v144 = (std::__shared_weak_count *)v23;
    v25 = v19 + 1;
    v24 = (_QWORD *)*v19;
    if ((_QWORD *)*v19 != v19 + 1)
    {
      do
      {
        std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t *)&__src, v24[4], v24[4]);
        v26 = (unint64_t *)v24[5];
        v27 = (unint64_t *)v24[6];
        while (v26 != v27)
        {
          std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t *)&__src, *v26, *v26);
          v26 += 2;
        }
        v28 = (_QWORD *)v24[1];
        if (v28)
        {
          do
          {
            v29 = v28;
            v28 = (_QWORD *)*v28;
          }
          while (v28);
        }
        else
        {
          do
          {
            v29 = (_QWORD *)v24[2];
            v30 = *v29 == (_QWORD)v24;
            v24 = v29;
          }
          while (!v30);
        }
        v24 = v29;
      }
      while (v29 != v25);
    }
    v31 = (_QWORD *)v19[3];
    if (v31 != v19 + 4)
    {
      do
      {
        std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t *)&__src, v31[4], v31[4]);
        v32 = (_QWORD *)v31[1];
        if (v32)
        {
          do
          {
            v33 = v32;
            v32 = (_QWORD *)*v32;
          }
          while (v32);
        }
        else
        {
          do
          {
            v33 = (_QWORD *)v31[2];
            v30 = *v33 == (_QWORD)v31;
            v31 = v33;
          }
          while (!v30);
        }
        v31 = v33;
      }
      while (v33 != v19 + 4);
    }
    v34 = v146[0];
    if (v146[0])
    {
      do
      {
        v35 = v34;
        v34 = (_QWORD *)v34[1];
      }
      while (v34);
    }
    else
    {
      do
      {
        v35 = v22[2];
        v30 = *v35 == (_QWORD)v22;
        v22 = (_QWORD **)v35;
      }
      while (v30);
    }
    v125 = v19 + 4;
    v126 = v19;
    v127 = v7;
    v149[0] = v35[4] + 1;
    v36 = (_QWORD *)*v19;
    if ((_QWORD *)*v19 != v25)
    {
      v129 = v19 + 1;
      v37 = 0;
      v38 = 0;
      v130 = 0;
      v39 = 0;
      while (1)
      {
        if (v36[4] <= (unint64_t)(v39 + 1))
          v40 = v39 + 1;
        else
          v40 = v36[4];
        v41 = v40 - v39;
        do
        {
          CoreML::Archiver::PackedIntegerVector::push_back((CoreML::Archiver::PackedIntegerVector *)&v149[1], v155[0]);
          --v41;
        }
        while (v41);
        v131 = v40;
        v43 = (char *)v36[5];
        v42 = (char *)v36[6];
        v44 = (v42 - v43) >> 4;
        v45 = (uint64_t)v130;
        if (v44 <= (v130 - (char *)v37) >> 4)
        {
          v52 = (uint64_t)(v38 - (_QWORD)v37) >> 4;
          if (v52 < v44)
          {
            v53 = &v43[16 * v52];
            if ((_QWORD *)v38 != v37)
            {
              v54 = v37;
              do
              {
                *v54 = *(_QWORD *)v43;
                v54[1] = *((_QWORD *)v43 + 1);
                v43 += 16;
                v54 += 2;
              }
              while (v43 != v53);
            }
            v55 = (_OWORD *)v38;
            while (v53 != v42)
            {
              v56 = *(_OWORD *)v53;
              v53 += 16;
              *v55++ = v56;
            }
            v57 = (int64_t)v55 - v38;
            goto LABEL_67;
          }
          for (j = (char *)v37; v43 != v42; v43 += 16)
          {
            *(_QWORD *)j = *(_QWORD *)v43;
            *((_QWORD *)j + 1) = *((_QWORD *)v43 + 1);
            j += 16;
          }
        }
        else
        {
          if (v37)
          {
            operator delete(v37);
            v45 = 0;
          }
          if (v42 - v43 < 0)
            goto LABEL_156;
          v46 = v45 >> 3;
          if (v45 >> 3 <= v44)
            v46 = (v42 - v43) >> 4;
          v47 = (unint64_t)v45 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v46;
          if (v47 >> 60)
LABEL_156:
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v47);
          v37 = v48;
          for (j = v48; v43 != v42; j += 16)
          {
            v51 = *(_OWORD *)v43;
            v43 += 16;
            *(_OWORD *)j = v51;
          }
          v130 = &v48[16 * v49];
        }
        v57 = j - (char *)v37;
        v38 = (unint64_t)v37;
LABEL_67:
        v38 += v57;
        v58 = 126 - 2 * __clz((uint64_t)(v38 - (_QWORD)v37) >> 4);
        if ((_QWORD *)v38 == v37)
          v59 = 0;
        else
          v59 = v58;
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned long long,double> *,false>(v37, v38, v59, 1);
        if ((_QWORD *)v38 != v37)
        {
          v60 = 0;
          v61 = 0;
          v62 = 1;
          v63 = (uint64_t)(v38 - (_QWORD)v37) >> 4;
          do
          {
            v64 = &v37[2 * v60];
            v67 = *v64;
            v65 = (double *)(v64 + 2);
            v66 = v67;
            if (v63 <= v60 + 1)
              v63 = v60 + 1;
            v68 = 0.0;
            while (1)
            {
              v68 = v68 + *(v65 - 1);
              if (v63 - 1 == v60)
                break;
              ++v60;
              v69 = *v65;
              v65 += 2;
              if (*(_QWORD *)&v69 != v66)
                goto LABEL_79;
            }
            v60 = v63;
LABEL_79:
            if (v68 == 0.0)
            {
              v63 = (uint64_t)(v38 - (_QWORD)v37) >> 4;
            }
            else
            {
              if ((v62 & 1) != 0)
                v70 = 0;
              else
                v70 = ~v61;
              CoreML::Archiver::PackedIntegerVector::push_back((CoreML::Archiver::PackedIntegerVector *)v152, v66 + v70);
              v71 = CoreML::Archiver::MMappedContentManager::extend_data_block<double>((uint64_t)&v157, (uint64_t *)v155, (void **)&v155[1], 1);
              v62 = 0;
              *(double *)(v155[1] + 8 * v71) = v68;
              v63 = (uint64_t)(v38 - (_QWORD)v37) >> 4;
              v61 = v66;
            }
          }
          while (v60 < v63);
        }
        v72 = (_QWORD *)v36[1];
        if (v72)
        {
          do
          {
            v73 = v72;
            v72 = (_QWORD *)*v72;
          }
          while (v72);
        }
        else
        {
          do
          {
            v73 = (_QWORD *)v36[2];
            v30 = *v73 == (_QWORD)v36;
            v36 = v73;
          }
          while (!v30);
        }
        v36 = v73;
        v39 = v131;
        if (v73 == v129)
          goto LABEL_98;
      }
    }
    v37 = 0;
LABEL_98:
    v7 = v127;
    CoreML::Archiver::PackedIntegerVector::push_back((CoreML::Archiver::PackedIntegerVector *)&v149[1], v155[0]);
    if (v126[5])
    {
      CoreML::Archiver::MMappedContentManager::extend_data_block<double>((uint64_t)&v157, (uint64_t *)v156, &v156[1], v149[0]);
      v75 = v156[1];
      if (v149[0] >= 1)
        bzero(v156[1], 8 * (v149[0] - ((v149[0] & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
      v76 = (_QWORD *)v126[3];
      if (v76 != v125)
      {
        do
        {
          v75[v76[4]] = v76[5];
          v77 = (_QWORD *)v76[1];
          if (v77)
          {
            do
            {
              v78 = v77;
              v77 = (_QWORD *)*v77;
            }
            while (v77);
          }
          else
          {
            do
            {
              v78 = (_QWORD *)v76[2];
              v30 = *v78 == (_QWORD)v76;
              v76 = v78;
            }
            while (!v30);
          }
          v76 = v78;
        }
        while (v78 != v125);
      }
    }
    if (v37)
      operator delete(v37);
    v79 = v144;
    if (v144)
    {
      v80 = (unint64_t *)&v144->__shared_owners_;
      do
        v81 = __ldaxr(v80);
      while (__stlxr(v81 - 1, v80));
      if (!v81)
      {
        ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
        std::__shared_weak_count::__release_weak(v79);
      }
    }
    std::__tree<std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>,std::__map_value_compare<CoreML::TreeEnsembleBase::BranchMode,std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>,std::less<CoreML::TreeEnsembleBase::BranchMode>,true>,std::allocator<std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>>>::destroy(v146[0]);
    __dst[1] = 0;
    v134 = 0;
    __dst[0] = 0;
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, 0, (char *)&__p, (char *)&__p + 4, 4);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], (char *)v149, (char *)&v149[1], 8);
    CoreML::Archiver::PackedIntegerVector::export_to_image((char *)&v149[1], (char **)__dst, 1);
    CoreML::Archiver::PackedIntegerVector::export_to_image((char *)v152, (char **)__dst, 1);
    v82 = (char *)v155[1];
    __src = (void **)v155[0];
    std::vector<unsigned char>::reserve((unint64_t *)__dst, (char *)__dst[1] + v155[0] - (char *)__dst[0] + 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], (char *)&__src, (char *)v146, 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], v82, &v82[8 * (_QWORD)__src], 8 * (_QWORD)__src);
    v83 = (char *)v156[1];
    __src = (void **)v156[0];
    std::vector<unsigned char>::reserve((unint64_t *)__dst, (char *)v156[0] + (unint64_t)__dst[1] - (char *)__dst[0] + 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], (char *)&__src, (char *)v146, 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], v83, &v83[8 * (_QWORD)__src], 8 * (_QWORD)__src);
    CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v157);
    CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v153);
    CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v150);
    v84 = v128 + 10;
    v85 = (void *)v128[10];
    if (v85)
    {
      v128[11] = v85;
      operator delete(v85);
      *v84 = 0;
      v128[11] = 0;
      v128[12] = 0;
    }
    *(_OWORD *)v84 = *(_OWORD *)__dst;
    v128[12] = v134;
    __dst[0] = 0;
    __dst[1] = 0;
    v134 = 0;
    if (v132)
    {
      v86 = (unint64_t *)&v132->__shared_owners_;
      do
        v87 = __ldaxr(v86);
      while (__stlxr(v87 - 1, v86));
      if (!v87)
      {
        ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
        std::__shared_weak_count::__release_weak(v132);
      }
    }
    v88 = v141;
    v128[14] = *(_QWORD *)(v141 + 48);
    if (*(_QWORD *)(v88 + 200) == *(_QWORD *)(v88 + 208) && *(_QWORD *)(v88 + 224) == *(_QWORD *)(v88 + 232))
    {
LABEL_136:
      v103 = (_QWORD *)(v88 + 128);
      if (*(char *)(v88 + 151) < 0)
        v103 = (_QWORD *)*v103;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v103);
      v104 = objc_claimAutoreleasedReturnValue();
      v105 = (void *)v128[15];
      v128[15] = v104;

      v106 = (_QWORD *)(v141 + 80);
      if (*(char *)(v141 + 103) < 0)
        v106 = (_QWORD *)*v106;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v106);
      v107 = objc_claimAutoreleasedReturnValue();
      v108 = (void *)v128[16];
      v128[16] = v107;

      v109 = (_QWORD *)(v141 + 56);
      if (*(char *)(v141 + 79) < 0)
        v109 = (_QWORD *)*v109;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v109);
      v110 = objc_claimAutoreleasedReturnValue();
      v111 = (void *)v128[17];
      v128[17] = v110;

      v112 = (_QWORD *)(v141 + 104);
      if (*(char *)(v141 + 127) < 0)
        v112 = (_QWORD *)*v112;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v112);
      v113 = objc_claimAutoreleasedReturnValue();
      v114 = (void *)v128[18];
      v128[18] = v113;

      v115 = (_QWORD *)(v141 + 152);
      if (*(char *)(v141 + 175) < 0)
        v115 = (_QWORD *)*v115;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v115);
      v116 = objc_claimAutoreleasedReturnValue();
      v117 = (void *)v128[19];
      v128[19] = v116;

      v118 = (_QWORD *)(v141 + 176);
      if (*(char *)(v141 + 199) < 0)
        v118 = (_QWORD *)*v118;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v118);
      v119 = objc_claimAutoreleasedReturnValue();
      v120 = (void *)v128[20];
      v128[20] = v119;

      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v140[0]);
      v121 = v142;
      v10 = v128;
      if (v142)
      {
        v122 = (unint64_t *)&v142->__shared_owners_;
        do
          v123 = __ldaxr(v122);
        while (__stlxr(v123 - 1, v122));
        if (!v123)
        {
          ((void (*)(std::__shared_weak_count *))v121->__on_zero_shared)(v121);
          std::__shared_weak_count::__release_weak(v121);
        }
      }
      v74 = v128;
      goto LABEL_154;
    }
    v89 = *(_QWORD *)(v88 + 48);
    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v89);
    if (*(_QWORD *)(v141 + 200) == *(_QWORD *)(v141 + 208))
    {
      if (*(_QWORD *)(v141 + 224) == *(_QWORD *)(v141 + 232))
      {
LABEL_135:
        v102 = (void *)v128[21];
        v128[21] = v90;

        v88 = v141;
        goto LABEL_136;
      }
      v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v89);
      if (*(_QWORD *)(v141 + 232) != *(_QWORD *)(v141 + 224))
      {
        v97 = 0;
        v98 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "addObject:", v99);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v98);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "setObject:forKey:", v100, v99);

          ++v98;
          v97 += 24;
        }
        while (v98 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v141 + 232) - *(_QWORD *)(v141 + 224)) >> 3));
      }
      v96 = 22;
    }
    else
    {
      v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v89);
      v92 = *(_QWORD *)(v141 + 200);
      if (*(_QWORD *)(v141 + 208) != v92)
      {
        v93 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(v92 + 8 * v93));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "addObject:", v94);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v93);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "setObject:forKey:", v95, v94);

          ++v93;
          v92 = *(_QWORD *)(v141 + 200);
        }
        while (v93 < (*(_QWORD *)(v141 + 208) - v92) >> 3);
      }
      v96 = 23;
    }
    v101 = (void *)v128[v96];
    v128[v96] = v91;

    goto LABEL_135;
  }
  if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Interface type is not an ItemSimilarityRecommender"));
    v74 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = 0;
  }
LABEL_155:

  return v74;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  +[MLItemSimilarityRecommender loadModelFromSpecificationWithCompilationOptions:options:error:](MLItemSimilarityRecommender, "loadModelFromSpecificationWithCompilationOptions:options:error:", a3, MEMORY[0x1E0C9AA70], a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  std::vector<std::string>::pointer end;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  std::string *v37;
  std::string *v38;
  __int128 v39;
  std::string *v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  id v45;
  id *v46;
  _QWORD **v47;
  void *v48[2];
  std::string::size_type v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *v58;
  uint64_t *v59;
  unint64_t v60;
  std::vector<std::string> v61;
  _QWORD *v62;
  std::__shared_weak_count *v63;
  std::__split_buffer<std::string> __p;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v45 = a5;
  v47 = (_QWORD **)a4;
  +[MLModel serializeInterfaceAndMetadata:toArchive:error:](MLModel, "serializeInterfaceAndMetadata:toArchive:error:", a3, a4, a6);
  v9 = (void *)objc_opt_new();
  +[MLItemSimilarityRecommender loadModelFromSpecification:configuration:error:](MLItemSimilarityRecommender, "loadModelFromSpecification:configuration:error:", a3, v9, a6);
  v10 = objc_claimAutoreleasedReturnValue();

  v46 = (id *)v10;
  if (!v10)
  {
    v12 = 0;
    goto LABEL_81;
  }
  memset(&__p, 0, 24);
  operator<<<unsigned char>((uint64_t)v47, (uint64_t *)&__p);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&unk_19CB39696);
  OArchive::uniqueBlob(&v62, v47[1], (const void **)&__p.__first_);
  if (SHIBYTE(__p.__end_) < 0)
    operator delete(__p.__first_);
  v11 = v62;
  operator<<((uint64_t)v47, v62 + 72);
  if (!((*(_QWORD *)(v10 + 88) - *(_QWORD *)(v10 + 80)) >> 31))
  {
    if (!*(_BYTE *)v11 && !v11[78])
      Archiver::_ODataBlobImpl::_openAsStream(v11);
    std::ostream::write();
    operator<<((uint64_t)v47, *(_QWORD *)(v10 + 112));
    memset(&v61, 0, sizeof(v61));
    v58 = 0;
    v59 = 0;
    v60 = 0;
    if (objc_msgSend(*(id *)(v10 + 184), "count"))
    {
      std::vector<long long>::reserve(&v58, *(_QWORD *)(v10 + 112));
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v13 = *(id *)(v10 + 184);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v55;
        v16 = v60;
        v17 = (uint64_t *)v58;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v55 != v15)
              objc_enumerationMutation(v13);
            v19 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "longValue");
            v20 = v19;
            v21 = v59;
            if ((unint64_t)v59 >= v16)
            {
              v23 = v59 - v17;
              v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 61)
              {
                v58 = v17;
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v16 - (_QWORD)v17) >> 2 > v24)
                v24 = (uint64_t)(v16 - (_QWORD)v17) >> 2;
              if (v16 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
                v25 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v25 = v24;
              if (v25)
                v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v25);
              else
                v26 = 0;
              v27 = (uint64_t *)(v25 + 8 * v23);
              *v27 = v20;
              v22 = v27 + 1;
              while (v21 != v17)
              {
                v28 = *--v21;
                *--v27 = v28;
              }
              v16 = v25 + 8 * v26;
              v59 = v22;
              if (v17)
                operator delete(v17);
              v17 = v27;
            }
            else
            {
              *v59 = v19;
              v22 = v21 + 1;
            }
            v59 = v22;
          }
          v60 = v16;
          v58 = v17;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        }
        while (v14);
      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(v10 + 176), "count"))
      {
LABEL_61:
        operator<<<long long>((uint64_t)v47, (uint64_t *)&v58);
        operator<<<std::string>((uint64_t)v47, (uint64_t *)&v61);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v46[15], "UTF8String"));
        operator<<((uint64_t)v47, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0)
          operator delete(__p.__first_);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v46[16], "UTF8String"));
        operator<<((uint64_t)v47, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0)
          operator delete(__p.__first_);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v46[17], "UTF8String"));
        operator<<((uint64_t)v47, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0)
          operator delete(__p.__first_);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v46[18], "UTF8String"));
        operator<<((uint64_t)v47, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0)
          operator delete(__p.__first_);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v46[19], "UTF8String"));
        operator<<((uint64_t)v47, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0)
          operator delete(__p.__first_);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v46[20], "UTF8String"));
        operator<<((uint64_t)v47, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0)
          operator delete(__p.__first_);
        +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", v47);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
          operator delete(v58);
        __p.__first_ = (std::__split_buffer<std::string>::pointer)&v61;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        goto LABEL_76;
      }
      std::vector<std::string>::reserve(&v61, *(_QWORD *)(v10 + 112));
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v13 = *(id *)(v10 + 176);
      v29 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v51 != v30)
              objc_enumerationMutation(v13);
            std::string::basic_string[abi:ne180100]<0>(v48, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j)), "UTF8String"));
            end = v61.__end_;
            if (v61.__end_ >= v61.__end_cap_.__value_)
            {
              v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v61.__end_ - (char *)v61.__begin_) >> 3);
              v35 = v34 + 1;
              if (v34 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * (((char *)v61.__end_cap_.__value_ - (char *)v61.__begin_) >> 3) > v35)
                v35 = 0x5555555555555556 * (((char *)v61.__end_cap_.__value_ - (char *)v61.__begin_) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v61.__end_cap_.__value_ - (char *)v61.__begin_) >> 3) >= 0x555555555555555)
                v36 = 0xAAAAAAAAAAAAAAALL;
              else
                v36 = v35;
              __p.__end_cap_.__value_ = (std::allocator<std::string> *)&v61.__end_cap_;
              if (v36)
                v37 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v61.__end_cap_, v36);
              else
                v37 = 0;
              v38 = v37 + v34;
              __p.__first_ = v37;
              __p.__begin_ = v38;
              __p.__end_cap_.__value_ = &v37[v36];
              v39 = *(_OWORD *)v48;
              v38->__r_.__value_.__r.__words[2] = v49;
              *(_OWORD *)&v38->__r_.__value_.__l.__data_ = v39;
              v48[1] = 0;
              v49 = 0;
              v48[0] = 0;
              __p.__end_ = v38 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v61, &__p);
              v40 = v61.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__p);
              v61.__end_ = v40;
              if (SHIBYTE(v49) < 0)
                operator delete(v48[0]);
            }
            else
            {
              v33 = *(_OWORD *)v48;
              v61.__end_->__r_.__value_.__r.__words[2] = v49;
              *(_OWORD *)&end->__r_.__value_.__l.__data_ = v33;
              v61.__end_ = end + 1;
            }
          }
          v29 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
        }
        while (v29);
      }
    }

    goto LABEL_61;
  }
  if (a6)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Internal error: model too large to be compiled."));
    v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_76:
  v41 = v63;
  if (v63)
  {
    p_shared_owners = (unint64_t *)&v63->__shared_owners_;
    do
      v43 = __ldaxr(p_shared_owners);
    while (__stlxr(v43 - 1, p_shared_owners));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
LABEL_81:

  return v12;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("generic"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  char *v20;
  std::__shared_weak_count *v21;
  unint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  std::string *v37;
  void *v38;
  id v39;
  std::string *v40;
  void *v41;
  id v42;
  std::string *v43;
  void *v44;
  id v45;
  std::string *v46;
  void *v47;
  id v48;
  std::string *v49;
  void *v50;
  id v51;
  std::string *v52;
  void *v53;
  id v54;
  id *v55;
  void *v57;
  id v58;
  std::string v59;
  void *p_p;
  std::__shared_weak_count *v61;
  uint64_t v62;
  std::string __p;

  v9 = a5;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("generic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "majorVersion");
  if (v11 >= objc_msgSend(v9, "majorVersion"))
  {
    v14 = -[MLModel initInterfaceAndMetadataWithCompiledArchive:error:]([MLItemSimilarityRecommender alloc], "initInterfaceAndMetadataWithCompiledArchive:error:", a3, a7);
    a7 = (id *)v14;
    if (!v14)
    {
LABEL_51:

      goto LABEL_52;
    }
    operator>><unsigned char>((uint64_t)a3, v14 + 10);
    if (a7[10] == a7[11])
    {
      memset(&__p, 0, sizeof(__p));
      operator>>((uint64_t)a3, &__p);
      IArchive::blob(&p_p, *(_QWORD *)a3, (uint64_t)&__p);
      (*(void (**)(void *))(*(_QWORD *)p_p + 32))(p_p);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a7[13];
      a7[13] = v15;

      v17 = v61;
      if (v61)
      {
        p_shared_owners = (unint64_t *)&v61->__shared_owners_;
        do
          v19 = __ldaxr(p_shared_owners);
        while (__stlxr(v19 - 1, p_shared_owners));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    operator>>((uint64_t)a3);
    memset(&__p, 0, sizeof(__p));
    p_p = 0;
    v61 = 0;
    v62 = 0;
    operator>><long long>((uint64_t)a3, (char **)&p_p);
    operator>><std::string>((uint64_t)a3, (std::vector<std::string> *)&__p);
    v20 = (char *)p_p;
    v21 = v61;
    v22 = 0x1E0CB3000;
    if (p_p == v61 && __p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
    {
LABEL_28:
      memset(&v59, 0, sizeof(v59));
      operator>>((uint64_t)a3, &v59);
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v37 = &v59;
      else
        v37 = (std::string *)v59.__r_.__value_.__r.__words[0];
      objc_msgSend(*(id *)(v22 + 2368), "stringWithUTF8String:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = a7[15];
      a7[15] = v38;

      operator>>((uint64_t)a3, &v59);
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v40 = &v59;
      else
        v40 = (std::string *)v59.__r_.__value_.__r.__words[0];
      objc_msgSend(*(id *)(v22 + 2368), "stringWithUTF8String:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = a7[16];
      a7[16] = v41;

      operator>>((uint64_t)a3, &v59);
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v43 = &v59;
      else
        v43 = (std::string *)v59.__r_.__value_.__r.__words[0];
      objc_msgSend(*(id *)(v22 + 2368), "stringWithUTF8String:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = a7[17];
      a7[17] = v44;

      operator>>((uint64_t)a3, &v59);
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v46 = &v59;
      else
        v46 = (std::string *)v59.__r_.__value_.__r.__words[0];
      objc_msgSend(*(id *)(v22 + 2368), "stringWithUTF8String:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = a7[18];
      a7[18] = v47;

      operator>>((uint64_t)a3, &v59);
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v49 = &v59;
      else
        v49 = (std::string *)v59.__r_.__value_.__r.__words[0];
      objc_msgSend(*(id *)(v22 + 2368), "stringWithUTF8String:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = a7[19];
      a7[19] = v50;

      operator>>((uint64_t)a3, &v59);
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v52 = &v59;
      else
        v52 = (std::string *)v59.__r_.__value_.__r.__words[0];
      objc_msgSend(*(id *)(v22 + 2368), "stringWithUTF8String:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = a7[20];
      a7[20] = v53;

      v55 = a7;
      if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v59.__r_.__value_.__l.__data_);
      if (p_p)
        operator delete(p_p);
      p_p = &__p;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
      goto LABEL_51;
    }
    v23 = a7[14];
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v23);
    if (v20 == (char *)v21)
    {
      if (__p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
      {
LABEL_27:
        v36 = a7[21];
        a7[21] = v24;

        goto LABEL_28;
      }
      v57 = v10;
      v58 = v9;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v23);
      if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
      {
        v31 = 0;
        v32 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v33);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v34, v33);

          ++v32;
          v31 += 24;
        }
        while (v32 < 0xAAAAAAAAAAAAAAABLL
                    * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3));
      }
      v30 = 22;
    }
    else
    {
      v57 = v10;
      v58 = v9;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v23);
      v26 = 0;
      if ((unint64_t)(((char *)v21 - v20) >> 3) <= 1)
        v27 = 1;
      else
        v27 = ((char *)v21 - v20) >> 3;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)&v20[8 * v26]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v28);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v29, v28);

        ++v26;
      }
      while (v27 != v26);
      v30 = 23;
    }
    v35 = a7[v30];
    a7[v30] = v25;

    v10 = v57;
    v9 = v58;
    v22 = 0x1E0CB3000uLL;
    goto LABEL_27;
  }
  if (a7)
  {
    objc_msgSend(v9, "versionNumberString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "versionNumberString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("compiler major version for compiled model is %@ and is more recent than this framework major version %@."), v12, v13);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }
LABEL_52:

  return a7;
}

@end
