@implementation LCFShadowEvaluation

- (id)init:(id)a3 modelStore:(id)a4
{
  id v7;
  id v8;
  LCFShadowEvaluation *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LCFShadowEvaluation;
  v9 = -[LCFShadowEvaluation init](&v11, sel_init);
  if (v9)
  {
    LCFModelMonitoringLoggingUtilsInit();
    objc_storeStrong((id *)&v9->_featureStore, a3);
    objc_storeStrong((id *)&v9->_modelStore, a4);
  }

  return v9;
}

- (id)evaluateModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  id v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  unint64_t v59;
  unsigned int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  void (**v88)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v89;
  id v90;
  uint64_t v91;
  unint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  __int128 v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  LCFShadowEvaluation *v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  id obj;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t v142;
  char v143[7];
  uint64_t v144;
  uint64_t v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint8_t buf[4];
  void *v152;
  __int16 v153;
  uint64_t v154;
  __int16 v155;
  _QWORD v156[3];
  _BYTE v157[128];
  _BYTE v158[128];
  _QWORD v159[4];

  v159[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v123 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "featureNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srcLabelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)LCFMMLogShadowEvaluation;
    if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
      -[LCFShadowEvaluation evaluateModels:].cold.1(v8, v4);
    v9 = 0;
    goto LABEL_79;
  }
  objc_msgSend(v4, "featureNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srcLabelName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v159, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v115 = (void *)v13;
  -[LCFFeatureStore getFeatureVectors:startDate:endDate:option:](self->_featureStore, "getFeatureVectors:startDate:endDate:option:", v13, 0, 0, 4);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE5F710], "fromMLProvider:");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BE5F720];
  objc_msgSend(v4, "featureNames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srcLabelName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vectorFeatureName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destLabelName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (void *)v14;
  objc_msgSend(v15, "toMultiArrayTypeBatchProvider:srcFeatureNames:srcLabelName:destFeatureName:destLabelName:", v14, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v4;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v20, "count"));
  if (objc_msgSend(v20, "count") >= 1)
  {
    v23 = 0;
    do
    {
      objc_msgSend(v20, "featuresAtIndex:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "groundTruthLabelFeatureName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "featureValueForName:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v26);

      ++v23;
    }
    while (v23 < objc_msgSend(v20, "count"));
  }
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v133 = v21;
  objc_msgSend(v21, "modelNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v158, 16);
  if (v129)
  {
    v128 = *(_QWORD *)v148;
    *(_QWORD *)&v27 = 138412802;
    v113 = v27;
    v119 = self;
    v132 = v20;
    v116 = v22;
LABEL_10:
    v28 = 0;
    v29 = v133;
    while (1)
    {
      if (*(_QWORD *)v148 != v128)
        objc_enumerationMutation(obj);
      v134 = v28;
      v30 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v28);
      objc_msgSend(v29, "preprocessHandler", v113);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v29, "preprocessHandler");
        v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v32)[2](v32, v30, v20);
        v33 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v33 = v20;
      }
      objc_msgSend(v29, "inferenceHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v136 = v33;
      if (v34)
      {
        objc_msgSend(v29, "inferenceHandler");
        v35 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v146 = 0;
        ((void (**)(_QWORD, void *, id, id *))v35)[2](v35, v30, v33, &v146);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v146;

        v135 = &unk_2510B88F0;
        v38 = v37;
      }
      else
      {
        -[LCFModelStore getModelURL:](self->_modelStore, "getModelURL:", v30);
        v39 = objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          v111 = LCFMMLogShadowEvaluation;
          if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v152 = v30;
            _os_log_error_impl(&dword_240989000, v111, OS_LOG_TYPE_ERROR, "could not find modelURl for %@", buf, 0xCu);
          }
          v36 = 0;
          v38 = 0;
          v135 = &unk_2510B88F0;
LABEL_77:

          v9 = 0;
          v22 = v116;
          goto LABEL_78;
        }
        v40 = (void *)v39;
        -[LCFModelStore getModelConfig:](self->_modelStore, "getModelConfig:", v30);
        v41 = objc_claimAutoreleasedReturnValue();
        v125 = (void *)v41;
        if (v41)
        {
          v144 = 0;
          v42 = (id *)&v144;
          objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v40, v41, &v144);
          v43 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v44 = LCFMMLogShadowEvaluation;
          if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v152 = v30;
            _os_log_impl(&dword_240989000, v44, OS_LOG_TYPE_INFO, "MLModelConfiguration was not stored %@", buf, 0xCu);
          }
          v145 = 0;
          v42 = (id *)&v145;
          objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v40, &v145);
          v43 = objc_claimAutoreleasedReturnValue();
        }
        v45 = (void *)v43;
        v46 = *v42;
        v126 = v45;
        if (v45)
        {
          v130 = v30;
          objc_msgSend(v45, "modelDescription");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "count"))
          {
            v118 = v40;
            v120 = v46;
            objc_msgSend(v33, "featuresAtIndex:", 0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = 0u;
            v139 = 0u;
            v140 = 0u;
            v141 = 0u;
            v117 = v48;
            objc_msgSend(v48, "featureNames");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v138, v157, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v139;
              while (2)
              {
                for (i = 0; i != v51; ++i)
                {
                  if (*(_QWORD *)v139 != v52)
                    objc_enumerationMutation(v49);
                  v54 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
                  objc_msgSend(v47, "inputFeatureNames");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v55, "containsObject:", v54))
                  {

                  }
                  else
                  {
                    objc_msgSend(v47, "outputFeatureNames");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v57 = objc_msgSend(v56, "containsObject:", v54);

                    if ((v57 & 1) == 0)
                    {
                      v71 = (void *)LCFMMLogShadowEvaluation;
                      if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
                      {
                        v108 = v71;
                        objc_msgSend(v47, "inputFeatureNames");
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v47, "outputFeatureNames");
                        v110 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = v113;
                        v152 = v54;
                        v153 = 2112;
                        v154 = (uint64_t)v109;
                        v155 = 2112;
                        v156[0] = v110;
                        _os_log_error_impl(&dword_240989000, v108, OS_LOG_TYPE_ERROR, "featureName %@ is not in modelDescription %@ %@", buf, 0x20u);

                      }
                      v36 = 0;
                      v68 = 1;
                      v135 = &unk_2510B88F0;
                      self = v119;
                      v38 = v120;
                      v20 = v132;
                      goto LABEL_53;
                    }
                  }
                }
                v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v138, v157, 16);
                if (v51)
                  continue;
                break;
              }
            }

            v137 = 0;
            objc_msgSend(v126, "predictionsFromBatch:error:", v136, &v137);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = v137;
            if (objc_msgSend(v116, "count"))
            {
              v59 = 0;
              v60 = 0;
              v61 = v116;
              do
              {
                objc_msgSend(v116, "objectAtIndexedSubscript:", v59);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "featuresAtIndex:", v59);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "predictedLabelFeatureName");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "featureValueForName:", v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v62, "isEqualToFeatureValue:", v65);

                v60 += v66;
                ++v59;
              }
              while (v59 < objc_msgSend(v116, "count"));
            }
            else
            {
              v60 = 0;
              v61 = v116;
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v60 / (double)(unint64_t)objc_msgSend(v61, "count"));
            v72 = objc_claimAutoreleasedReturnValue();
            v73 = (void *)LCFMMLogShadowEvaluation;
            v135 = (void *)v72;
            if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_INFO))
            {
              v74 = v73;
              v75 = objc_msgSend(v61, "count");
              *(_DWORD *)buf = 138413058;
              v152 = v130;
              v153 = 2112;
              v154 = v72;
              v155 = 1024;
              LODWORD(v156[0]) = v60;
              WORD2(v156[0]) = 2048;
              *(_QWORD *)((char *)v156 + 6) = v75;
              _os_log_impl(&dword_240989000, v74, OS_LOG_TYPE_INFO, "prediction accuracy modelName:%@ accuracy:%@ matchedCount:%d cout:%lu", buf, 0x26u);

            }
            v68 = 0;
            self = v119;
            v38 = v121;
            v20 = v132;
            v29 = v133;
            v36 = v58;
LABEL_53:
            v40 = v118;
            v69 = v125;

            v33 = v136;
          }
          else
          {
            v70 = LCFMMLogShadowEvaluation;
            if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
              -[LCFShadowEvaluation evaluateModels:].cold.2(&v142, v143, v70);
            v36 = 0;
            v68 = 1;
            v135 = &unk_2510B88F0;
            v33 = v136;
            v38 = v46;
            v69 = v125;
          }

          v30 = v130;
        }
        else
        {
          v67 = (void *)LCFMMLogShadowEvaluation;
          if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
          {
            v106 = v67;
            objc_msgSend(v46, "description");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v152 = v40;
            v153 = 2112;
            v154 = (uint64_t)v107;
            _os_log_error_impl(&dword_240989000, v106, OS_LOG_TYPE_ERROR, "could not load a model %@: %@", buf, 0x16u);

          }
          v36 = 0;
          v68 = 1;
          v135 = &unk_2510B88F0;
          v38 = v46;
          v33 = v136;
          v69 = v125;
        }

        if (v68)
          goto LABEL_77;
      }
      if (v38)
      {
        v76 = v36;
        v77 = LCFMMLogShadowEvaluation;
        if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v152 = v38;
          _os_log_error_impl(&dword_240989000, v77, OS_LOG_TYPE_ERROR, "predictionsFromBatch failed %@", buf, 0xCu);
        }
        v78 = objc_alloc(MEMORY[0x24BE5F760]);
        v79 = objc_alloc(MEMORY[0x24BE5F728]);
        objc_msgSend(MEMORY[0x24BE5F710], "fromMLProvider:", v20);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "srcLabelName");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)objc_msgSend(v79, "init:labelFeatureName:", v80, v81);
        v83 = v78;
        v84 = v135;
        v85 = (id)objc_msgSend(v83, "init:inputBachProviderInfo:evaluatedPredictions:accuracy:succeeded:evaluationError:", v30, v82, 0, v135, &unk_2510B88D8, v38);

        objc_msgSend(MEMORY[0x24BE5F740], "emitShadowEvaluationEvent:", v85);
        v86 = v134;
        v36 = v76;
        goto LABEL_71;
      }
      objc_msgSend(v29, "metricsHandler");
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      if (v87)
      {
        objc_msgSend(v29, "metricsHandler");
        v88 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, id, void *))v88)[2](v88, v30, v33, v36);
        v89 = v30;
        v85 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v89 = v30;
        v85 = v36;
      }
      v131 = v89;
      objc_msgSend(v123, "setObject:forKey:", v85, v89);
      if (objc_msgSend(v85, "count") < 1)
      {
        v90 = 0;
      }
      else
      {
        v90 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (objc_msgSend(v85, "count") >= 1)
        {
          v127 = v36;
          v91 = 0;
          v92 = 0x24BE5F000uLL;
          do
          {
            objc_msgSend(*(id *)(v92 + 1808), "fromMLProvider:", v132);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "featureProviders");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "objectAtIndexedSubscript:", v91);
            v95 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v85, "featuresAtIndex:", v91);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_alloc(MEMORY[0x24BE5F768]);
            objc_msgSend(v29, "destLabelName");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = (void *)objc_msgSend(v97, "init:predictedFeatureSet:outputLabelFeatureName:", v95, v96, v98);

            objc_msgSend(v90, "addObject:", v99);
            ++v91;
            v100 = objc_msgSend(v85, "count");
            v92 = 0x24BE5F000;
          }
          while (v91 < v100);
          self = v119;
          v36 = v127;
          goto LABEL_70;
        }
      }
      v92 = 0x24BE5F000uLL;
LABEL_70:
      objc_msgSend(*(id *)(v92 + 1808), "fromMLProvider:", v122);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_alloc(MEMORY[0x24BE5F728]);
      objc_msgSend(v29, "srcLabelName");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = (void *)objc_msgSend(v102, "init:labelFeatureName:", v101, v103);

      v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5F760]), "init:inputBachProviderInfo:evaluatedPredictions:accuracy:succeeded:evaluationError:", v131, v104, v90, v135, &unk_2510B88D8, 0);
      objc_msgSend(MEMORY[0x24BE5F740], "emitShadowEvaluationEvent:", v105);

      v84 = v135;
      v38 = 0;
      v86 = v134;
LABEL_71:

      v28 = v86 + 1;
      v20 = v132;
      if (v28 == v129)
      {
        v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v158, 16);
        v22 = v116;
        if (v129)
          goto LABEL_10;
        break;
      }
    }
  }

  v9 = v123;
LABEL_78:

  v4 = v133;
LABEL_79:

  return v9;
}

- (LCFFeatureStore)featureStore
{
  return self->_featureStore;
}

- (LCFModelStore)modelStore
{
  return self->_modelStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStore, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
}

- (void)evaluateModels:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "srcLabelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_240989000, v3, OS_LOG_TYPE_ERROR, "Parameter labelName %@ is in the featureNames.", (uint8_t *)&v5, 0xCu);

}

- (void)evaluateModels:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_240989000, log, OS_LOG_TYPE_ERROR, "batchProvider has no features", buf, 2u);
}

@end
