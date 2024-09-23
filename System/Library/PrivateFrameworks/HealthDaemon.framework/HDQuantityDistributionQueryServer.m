@implementation HDQuantityDistributionQueryServer

- (HDQuantityDistributionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDQuantityDistributionQueryServer *v11;
  HDQuantitySampleOverlapProcessor *v12;
  HDQuantitySampleOverlapProcessor *overlapProcessor;
  uint64_t v14;
  _HKQuantityDistributionQueryServerConfiguration *quantityDistributionQueryServerConfiguration;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDQuantityDistributionQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = -[HDQuantitySampleOverlapProcessor initWithOverlapFunction:]([HDQuantitySampleOverlapProcessor alloc], "initWithOverlapFunction:", 1);
    overlapProcessor = v11->_overlapProcessor;
    v11->_overlapProcessor = v12;

    v14 = objc_msgSend(v10, "copy");
    quantityDistributionQueryServerConfiguration = v11->_quantityDistributionQueryServerConfiguration;
    v11->_quantityDistributionQueryServerConfiguration = (_HKQuantityDistributionQueryServerConfiguration *)v14;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  id *p_isa;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDQuantitySampleAttenuationEngine *v9;
  HDQuantitySampleAttenuationEngine *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t (**v15)(void *, id *);
  void *v16;
  double v17;
  double v18;
  HDQuantityDistributionCalculator *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v33;
  void *v34;
  void *v35;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v36;
  void *v37;
  void *v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  uint64_t (**v77)(void *, id *);
  void *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  void *v82;
  int v83;
  char v84;
  uint64_t v85;
  HDQuantitySampleAttenuationProvider *v86;
  void *v87;
  uint64_t v88;
  HDQuantitySampleAttenuationEngine *v89;
  HDQuantitySampleAttenuationEngine *v90;
  id v91;
  id v92;
  HDQuantityDistributionCalculator *v93;
  id v94;
  HDQuantitySampleAttenuationEngine *v95;
  id v96;
  id v97;
  HDQuantityDistributionCalculator *v98;
  uint64_t v99;
  id v100;
  HDQuantitySampleAttenuationEngine *v101;
  id v102;
  uint64_t (**v103)(void *, id *);
  void *v104;
  void *v105;
  char v106;
  char v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  HDQuantityDistributionCalculator *v112;
  id v113;
  id v114;
  id v115;
  HDQuantityDistributionCalculator *v116;
  id v117;
  char v118;
  char v119;
  uint64_t (**v120)(void *, id *);
  id v121;
  id v122;
  void *v123;
  _QWORD *v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  void *v133;
  double v134;
  void *v135;
  double v136;
  unint64_t v137;
  unint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  id v143;
  uint64_t v144;
  void *v145;
  void *v146;
  id v147;
  unint64_t v148;
  _QWORD *v149;
  uint64_t v150;
  uint64_t v151;
  _QWORD *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  uint64_t (**v162)(void *, id *);
  uint64_t (**v163)(void *, id *);
  id v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  double v169;
  double v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t (**v184)(void *, id *);
  void *v185;
  id *v186;
  id v187;
  id v188;
  HDQuantitySampleAttenuationEngine *v189;
  void *v190;
  void *v191;
  uint64_t (**v192)(void *, id *);
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  HDQuantityDistributionCalculator *v202;
  void *v203;
  uint64_t (**v204)(void *, id *);
  id *v205;
  void *v206;
  id obj;
  id obja;
  void *v209;
  id v210;
  void *v211;
  id v212;
  void *v213;
  void *v214;
  uint64_t v215;
  uint64_t v216;
  id v217;
  void *v218;
  void *v219;
  uint64_t v220;
  id v221;
  void *v222;
  char v223;
  uint64_t v224;
  unint64_t v225;
  char v226;
  id v227;
  unint64_t v228;
  id v229;
  objc_super v230;
  id v231;
  id v232;
  void *v233;
  _QWORD v234[4];
  id v235;
  void *aBlock;
  uint64_t v237;
  uint64_t (*v238)(uint64_t, _QWORD *);
  void *v239;
  id *v240;
  id v241;
  id v242;
  HDQuantityDistributionCalculator *v243;
  id v244;
  HDQuantitySampleAttenuationEngine *v245;
  HDQuantitySampleAttenuationEngine *v246;
  char v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  uint64_t v252;

  p_isa = (id *)&self->super.super.isa;
  v252 = *MEMORY[0x1E0C80C00];
  v230.receiver = self;
  v230.super_class = (Class)HDQuantityDistributionQueryServer;
  -[HDQueryServer _queue_start](&v230, sel__queue_start);
  objc_msgSend(p_isa, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = 0;
  objc_msgSend(p_isa, "readAuthorizationStatusForType:error:", v4, &v229);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = (uint64_t (**)(void *, id *))v229;
  if (!v5)
  {
    objc_msgSend(p_isa, "queryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "client_deliverError:forQuery:", v204, v6);

  }
  v205 = p_isa;
  v203 = v5;
  if (!objc_msgSend(v5, "canRead"))
  {
    p_isa = (id *)MEMORY[0x1E0C9AA60];
    v15 = v204;
    goto LABEL_121;
  }
  v200 = v4;
  if (p_isa)
  {
    objc_msgSend(p_isa[25], "histogramBucketSize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(p_isa, "quantityType");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "canonicalUnit");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "_valueByConvertingValue:toUnit:", v8, 1.0);
    v10 = v9;
    objc_msgSend(p_isa[25], "histogramAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(p_isa[25], "histogramAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValueForUnit:", v8);
      v14 = v13;

    }
    else
    {
      v14 = 0.0;
    }
    objc_msgSend(p_isa[25], "histogramBucketSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValueForUnit:", v8);
    v18 = v17;

    v19 = [HDQuantityDistributionCalculator alloc];
    objc_msgSend(p_isa[25], "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[25], "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[25], "anchorDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[25], "intervalComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = -[HDQuantityDistributionCalculator initWithStartDate:endDate:anchorDate:intervalComponents:histogramBucketAnchor:histogramBucketSize:](v19, "initWithStartDate:endDate:anchorDate:intervalComponents:histogramBucketAnchor:histogramBucketSize:", v20, v21, v22, v23, v14, v18);

    v24 = v205;
    v25 = objc_msgSend(v205[25], "options");
    if ((v25 & 1) != 0)
    {
      objc_msgSend(v205[25], "intervalComponents");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "copy");

      objc_msgSend(v27, "calendar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setCalendar:", v29);

      }
      v30 = objc_alloc(MEMORY[0x1E0CB6F60]);
      objc_msgSend(v205[25], "anchorDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithAnchorDate:intervalComponents:", v31, v27);

      v33 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
      objc_msgSend(v205, "profile");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "quantityType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider initWithProfile:quantityType:](v33, "initWithProfile:quantityType:", v34, v35);

      objc_msgSend(v205, "quantityType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDStatisticsCollectionCalculator calculatorForQuantityType:intervalCollection:options:mergeStrategy:](HDStatisticsCollectionCalculator, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v37, v32, 66, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v205;
      objc_msgSend(v38, "setSourceOrderProvider:", v36);

      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v234[0] = MEMORY[0x1E0C809B0];
      v234[1] = 3221225472;
      v234[2] = __72__HDQuantityDistributionQueryServer__queue_fetchHistogramDataWithError___block_invoke;
      v234[3] = &unk_1E6CE97C8;
      v199 = v39;
      v235 = v199;
      objc_msgSend(v38, "setStatisticsHandler:", v234);
      v201 = v38;
      objc_msgSend(v38, "reset");

    }
    else
    {
      v199 = 0;
      v201 = 0;
    }
    v40 = objc_msgSend(v24[25], "options");
    v41 = objc_msgSend(v24[25], "contextStyle");
    v233 = 0;
    v206 = v8;
    v226 = v25;
    switch(v41)
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4928]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v42, (uint64_t)&v233);
        v222 = (void *)objc_claimAutoreleasedReturnValue();

        HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "profile");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "metadataManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *MEMORY[0x1E0CB72D0];
        objc_msgSend(v44, "predicateWithMetadataKey:exists:", *MEMORY[0x1E0CB72D0], 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = (void *)MEMORY[0x1E0D29840];
        aBlock = v219;
        v237 = (uint64_t)v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &aBlock, 2);
        v48 = v40;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "predicateMatchingAllPredicates:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v205, "profile");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "metadataManager");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E6DFE720);
        v53 = v3;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "predicateWithMetadataKey:allowedValues:", v45, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v53;
        v56 = (void *)MEMORY[0x1E0D29840];
        *(_QWORD *)&v248 = v50;
        *((_QWORD *)&v248 + 1) = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v248, 2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "predicateMatchingAnyPredicates:", v57);
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v222, v40);
        v58 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(v40) = v48;
        v8 = v206;

        v24 = v205;
        goto LABEL_22;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v65, (uint64_t)&v233);
        v58 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
        v66 = objc_opt_class();
        -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:errorOut:](v24, v58, v66, (uint64_t)&v233);
        v67 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 3:
        v59 = (v40 >> 1) & 1;
        v60 = v24;
        v61 = 140;
        goto LABEL_19;
      case 4:
        v59 = (v40 >> 1) & 1;
        v60 = v24;
        v61 = 147;
        goto LABEL_19;
      case 5:
        v59 = (v40 >> 1) & 1;
        v60 = v24;
        v61 = 178;
LABEL_19:
        v62 = 0;
        goto LABEL_27;
      case 6:
        _HKCategoryValueSleepAnalysisAsleepValues();
        v58 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6380], "dataTypeWithCode:", 63);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v68, (uint64_t)&v233);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          HDCategorySampleEntityPredicateEqualToValues((uint64_t)v58);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v69, v70);
          v71 = objc_claimAutoreleasedReturnValue();

          v69 = (void *)v71;
        }

        v72 = objc_opt_class();
        -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:errorOut:](v24, v69, v72, (uint64_t)&v233);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_29;
      case 7:
        v59 = (v40 >> 1) & 1;
        v62 = &unk_1E6DFE708;
        v60 = v24;
        v61 = 199;
LABEL_27:
        -[HDQuantityDistributionQueryServer _categoryPredicateWithTypeCode:matchingValue:errorOut:](v60, v61, v62, (uint64_t)&v233);
        v58 = (id)objc_claimAutoreleasedReturnValue();
        v73 = objc_opt_class();
        -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:includeUUID:errorOut:](v24, v58, v73, v59, (uint64_t)&v233);
        v67 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v64 = (void *)v67;
LABEL_29:

        v63 = v233;
        break;
      default:
        v63 = 0;
        v64 = 0;
        break;
    }
    v74 = v63;
    v75 = v74;
    if (!v64 && v74)
    {
      v76 = v74;
      v77 = (uint64_t (**)(void *, id *))objc_retainAutorelease(v74);
      p_isa = 0;
LABEL_119:

      goto LABEL_120;
    }
    v196 = v64;
    objc_msgSend(v24[25], "objectType");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v78, (uint64_t)&v232);
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v232;
    v194 = v75;
    v195 = (void *)v79;
    v193 = v80;
    if (!v79)
    {
      v102 = v80;
      if (v102)
      {
        v77 = (uint64_t (**)(void *, id *))objc_retainAutorelease(v102);
        p_isa = 0;
        v103 = v77;
      }
      else
      {
        v103 = 0;
        p_isa = 0;
        v77 = v204;
      }
      goto LABEL_118;
    }
    v220 = v226 & 1;
    v223 = v40;
    v81 = *MEMORY[0x1E0CB5C78];
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C78]);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = v78;
    v83 = objc_msgSend(v78, "isEqual:", v82);

    v84 = objc_msgSend(v24[25], "options");
    objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 272);
    v85 = objc_claimAutoreleasedReturnValue();
    v86 = [HDQuantitySampleAttenuationProvider alloc];
    objc_msgSend(v24, "profile");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = (void *)v85;
    v88 = -[HDQuantitySampleAttenuationProvider initWithQuantityType:profile:](v86, "initWithQuantityType:profile:", v85, v87);

    v190 = (void *)v88;
    v89 = -[HDQuantitySampleAttenuationEngine initWithAttenuationEngineDelegate:]([HDQuantitySampleAttenuationEngine alloc], "initWithAttenuationEngineDelegate:", v88);
    v189 = v89;
    if (v83 && (v84 & 4) != 0)
    {
      v90 = v89;
      v91 = v196;
      v92 = v195;
      v93 = v202;
      v94 = v201;
      v95 = v90;
      aBlock = (void *)MEMORY[0x1E0C809B0];
      v237 = 3221225472;
      v238 = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke;
      v239 = &unk_1E6D0C1E8;
      v240 = v205;
      v96 = v92;
      v241 = v96;
      v97 = v91;
      v242 = v97;
      v246 = v10;
      v98 = v93;
      v243 = v98;
      v99 = v226 & 1;
      v247 = v226 & 1;
      v100 = v94;
      v244 = v100;
      v101 = v95;
      v245 = v101;
      v192 = (uint64_t (**)(void *, id *))_Block_copy(&aBlock);

    }
    else
    {
      objc_msgSend(v205, "quantityType");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", v81);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v104, "isEqual:", v105);

      if ((v106 & 1) != 0)
      {
        v107 = 1;
      }
      else
      {
        objc_msgSend(v205, "quantityType");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CA8]);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v108, "isEqual:", v109);

      }
      v110 = v196;
      v111 = v195;
      v112 = v202;
      v113 = v201;
      aBlock = (void *)MEMORY[0x1E0C809B0];
      v237 = 3221225472;
      v238 = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke;
      v239 = &unk_1E6D0C170;
      v240 = v205;
      v114 = v111;
      v241 = v114;
      v115 = v110;
      v242 = v115;
      v245 = v10;
      LOBYTE(v246) = v107;
      v116 = v112;
      v243 = v116;
      v99 = v226 & 1;
      BYTE1(v246) = v226 & 1;
      v117 = v113;
      v244 = v117;
      v192 = (uint64_t (**)(void *, id *))_Block_copy(&aBlock);

    }
    v231 = 0;
    if (v99)
      v118 = objc_msgSend(v201, "performInitialStatisticsTransaction:error:", v192, &v231);
    else
      v118 = v192[2](v192, &v231);
    v119 = v118;
    v120 = (uint64_t (**)(void *, id *))v231;
    if ((v119 & 1) != 0)
    {
      v184 = v120;
      -[HDQuantityDistributionCalculator quantityDistributionsWithUnit:](v202, "quantityDistributionsWithUnit:", v8);
      v217 = (id)objc_claimAutoreleasedReturnValue();
      v185 = v3;
      if ((v223 & 2) != 0 && v196)
      {
        v121 = v217;
        v122 = v196;
        v123 = (void *)*((_QWORD *)v122 + 5);
        if (v123 && objc_msgSend(v123, "count"))
        {
          objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:", 0);
          v124 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v125 = 0;
          v126 = 0;
          if (v124)
            v126 = v124[1];
          *((_QWORD *)v122 + 1) = v126;

          objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:", 0);
          v127 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          if (v127)
            v125 = v127[2];
          *((_QWORD *)v122 + 2) = v125;

          *((_QWORD *)v122 + 3) = 0;
        }
        v217 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v248 = 0u;
        v249 = 0u;
        v250 = 0u;
        v251 = 0u;
        obj = v121;
        v224 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v248, &aBlock, 16);
        if (v224)
        {
          v215 = *(_QWORD *)v249;
          do
          {
            v128 = 0;
            do
            {
              if (*(_QWORD *)v249 != v215)
                objc_enumerationMutation(obj);
              v129 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * v128);
              objc_msgSend(v129, "startDate");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "timeIntervalSinceReferenceDate");
              v132 = v131;
              objc_msgSend(v129, "endDate");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "timeIntervalSinceReferenceDate");
              v135 = (void *)*((_QWORD *)v122 + 5);
              if (!v135)
                goto LABEL_89;
              if (!*((_BYTE *)v122 + 32))
                goto LABEL_89;
              v136 = v134;
              if (*((double *)v122 + 1) > v134)
                goto LABEL_89;
              v137 = *((_QWORD *)v122 + 3);
              if (v137 >= objc_msgSend(v135, "count"))
                goto LABEL_89;
              while (*((double *)v122 + 2) < v132)
              {
                v138 = *((_QWORD *)v122 + 3);
                if (v138 >= objc_msgSend(*((id *)v122 + 5), "count") - 1)
                  break;
                ++*((_QWORD *)v122 + 3);
                objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:");
                v139 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                v140 = 0;
                v141 = 0;
                if (v139)
                  v141 = v139[1];
                *((_QWORD *)v122 + 1) = v141;

                objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:", *((_QWORD *)v122 + 3));
                v142 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                if (v142)
                  v140 = v142[2];
                *((_QWORD *)v122 + 2) = v140;

              }
              if (*((double *)v122 + 1) < v136)
              {
                v143 = 0;
                while (1)
                {
                  objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:", *((_QWORD *)v122 + 3));
                  v144 = objc_claimAutoreleasedReturnValue();
                  v145 = (void *)v144;
                  if (v144)
                    v146 = *(void **)(v144 + 24);
                  else
                    v146 = 0;
                  v147 = v146;

                  if (v147)
                  {
                    if (!v143)
                      v143 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v143, "addObject:", v147);
                  }
                  if (*((double *)v122 + 2) > v136)
                    break;
                  v148 = *((_QWORD *)v122 + 3) + 1;
                  *((_QWORD *)v122 + 3) = v148;
                  if (v148 >= objc_msgSend(*((id *)v122 + 5), "count"))
                    break;
                  objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:", *((_QWORD *)v122 + 3));
                  v149 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                  v150 = 0;
                  v151 = 0;
                  if (v149)
                    v151 = v149[1];
                  *((_QWORD *)v122 + 1) = v151;

                  objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:", *((_QWORD *)v122 + 3));
                  v152 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                  if (v152)
                    v150 = v152[2];
                  *((_QWORD *)v122 + 2) = v150;

                  v78 = v214;
                  if (*((double *)v122 + 1) >= v136)
                    goto LABEL_90;
                }

                v78 = v214;
              }
              else
              {
LABEL_89:
                v143 = 0;
              }
LABEL_90:

              if (v143 && objc_msgSend(v143, "count"))
              {
                v212 = objc_alloc(MEMORY[0x1E0CB7000]);
                objc_msgSend(v129, "startDate");
                v209 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "endDate");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "minimumBucketValue");
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "minimumValue");
                v227 = v143;
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "maximumValue");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "averageValue");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "duration");
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "histogramCounts");
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                v160 = (void *)objc_msgSend(v212, "initWithStartDate:endDate:minimumBucketValue:minimumValue:maximumValue:averageValue:duration:histogramCounts:contextIdentifiers:", v209, v153, v154, v155, v156, v157, v158, v159, v227);

                v8 = v206;
                v143 = v227;

                v78 = v214;
                objc_msgSend(v217, "addObject:", v160);

              }
              else
              {
                objc_msgSend(v217, "addObject:", v129);
              }

              ++v128;
              v99 = v220;
            }
            while (v128 != v224);
            v161 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v248, &aBlock, 16);
            v224 = v161;
          }
          while (v161);
        }

        v3 = v185;
        v4 = v200;
      }
      v221 = v217;
      if (v99)
      {
        v164 = v199;
        v188 = v8;
        p_isa = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v221, "count"))
        {
          v225 = 0;
          v228 = 0;
          v186 = p_isa;
          v187 = v164;
          do
          {
            if (v228 >= objc_msgSend(v164, "count"))
              break;
            objc_msgSend(v221, "objectAtIndexedSubscript:", v225);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "objectAtIndexedSubscript:", v228);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "startDate");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "startDate");
            v216 = objc_claimAutoreleasedReturnValue();
            v218 = v167;
            if (objc_msgSend(v167, "isEqual:"))
            {
              objc_msgSend(v166, "averageQuantity");
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v168, "doubleValueForUnit:", v188);
              v170 = v169;

              objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v188, v170);
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              v210 = objc_alloc(MEMORY[0x1E0CB7000]);
              objc_msgSend(v165, "startDate");
              obja = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "endDate");
              v171 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "minimumBucketValue");
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "minimumValue");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "maximumValue");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "duration");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "histogramCounts");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "contextIdentifiers");
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              v178 = (void *)v171;
              v179 = objc_msgSend(v210, "initWithStartDate:endDate:minimumBucketValue:minimumValue:maximumValue:averageValue:duration:histogramCounts:contextIdentifiers:", obja, v171, v172, v173, v174, v213, v175, v176, v177);
              v211 = v166;
              v180 = (void *)v179;

              v78 = v214;
              v164 = v187;

              p_isa = v186;
              v4 = v200;

              objc_msgSend(v186, "addObject:", v180);
              ++v225;
              ++v228;

              v166 = v211;
              v181 = (void *)v216;
            }
            else
            {
              v182 = v167;
              v181 = (void *)v216;
              if (objc_msgSend(v182, "hk_isBeforeDate:", v216))
              {
                objc_msgSend(p_isa, "addObject:", v165);
                ++v225;
              }
              else
              {
                ++v228;
              }
            }

          }
          while (v225 < objc_msgSend(v221, "count"));
        }

        v77 = v204;
        v3 = v185;
        v8 = v206;
      }
      else
      {
        v77 = v204;
        p_isa = (id *)v221;
      }
      v163 = v184;
    }
    else
    {
      v162 = v120;
      if (v162)
      {
        v77 = objc_retainAutorelease(v162);
        p_isa = 0;
        v163 = v77;

LABEL_117:
        v103 = v192;
LABEL_118:

        v76 = v194;
        v64 = v196;
        goto LABEL_119;
      }
      v221 = 0;
      v163 = 0;
      p_isa = 0;
      v77 = v204;
    }

    goto LABEL_117;
  }
  v77 = v204;
LABEL_120:
  v15 = v77;

  if (!p_isa)
  {
    objc_msgSend(v205, "queryUUID");
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "client_deliverError:forQuery:", v15, p_isa);
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(v205, "queryUUID");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "client_deliverDistributionCollection:forQuery:", p_isa, v183);

LABEL_122:
}

uint64_t __72__HDQuantityDistributionQueryServer__queue_fetchHistogramDataWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)_sqlitePredicateForObjectType:(uint64_t)a3 errorOut:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  HDSampleEntityPredicateForDataType(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "filter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    objc_msgSend(a1, "filter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "builder_filterWithDataTypes:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "profile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateWithProfile:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
    }
    else
    {
      objc_msgSend(a1, "profile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateWithProfile:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Error building predicate for query"));
      v16 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v14, v6);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v6;
  }
  v16 = v15;
LABEL_10:

  return v16;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  char v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  char v32;
  char v33;
  id v34;
  _QWORD v35[3];
  char v36;

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 1;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v34 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_2;
  v25[3] = &unk_1E6D0C148;
  v7 = *(id *)(a1 + 48);
  v31 = *(_QWORD *)(a1 + 72);
  v32 = *(_BYTE *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 32);
  v26 = v7;
  v27 = v8;
  v30 = v35;
  v28 = *(id *)(a1 + 56);
  v33 = *(_BYTE *)(a1 + 81);
  v29 = *(id *)(a1 + 64);
  LOBYTE(v4) = -[HDQuantityDistributionQueryServer _walkSampleValuesWithPredicate:errorOut:handler:](v4, v5, (uint64_t)&v34, v25);
  v9 = v34;
  v10 = v9;
  if ((v4 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 208);
      v24 = v9;
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_4;
      v19[3] = &unk_1E6D0C120;
      v19[4] = v11;
      v20 = *(id *)(a1 + 56);
      v23 = *(_BYTE *)(a1 + 81);
      v21 = *(id *)(a1 + 64);
      v22 = *(_QWORD *)(a1 + 72);
      v13 = objc_msgSend(v12, "fetchFinalOverlapSamplesWithErrorOut:handler:", &v24, v19);
      v14 = v24;

      if ((v13 & 1) == 0)
      {
        v15 = v14;
        v16 = v15;
        if (v15)
        {
          if (a2)
            *a2 = objc_retainAutorelease(v15);
          else
            _HKLogDroppedError();
        }

      }
    }
    else
    {
      v13 = 1;
      v14 = v9;
    }
  }
  else
  {
    v17 = v9;
    v14 = v17;
    if (v17)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    v13 = 0;
  }

  _Block_object_dispose(v35, 8);
  return v13;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  double v24;
  double v25;
  double v26;
  char v27;
  _BYTE v28[7];
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t v33;
  char v34;

  v12 = *(_QWORD *)(a1 + 32);
  if (v12
    && (-[_HDQuantityDateIntervals insideRanges:](v12, a5) & 1) == 0
    && !-[_HDQuantityDateIntervals insideRanges:](*(_QWORD *)(a1 + 32), a6))
  {
    return 1;
  }
  v13 = *(double *)(a1 + 72);
  v14 = v13 * a4;
  v15 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 80))
  {
    v16 = *(void **)(v15 + 208);
    v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_3;
    v30[3] = &unk_1E6D0C120;
    v30[4] = v15;
    v31 = *(id *)(a1 + 48);
    v34 = *(_BYTE *)(a1 + 81);
    v32 = *(id *)(a1 + 56);
    v33 = *(_QWORD *)(a1 + 72);
    v24 = a5;
    v25 = a6;
    v26 = v14;
    v27 = 1;
    memset(v28, 0, sizeof(v28));
    v29 = a2;
    v18 = objc_msgSend(v16, "fetchOverlapProcessSamplesFrom:setAnchorTime:errorOut:handler:", &v24, v17, a3, v30);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v19 + 24))
      *(_BYTE *)(v19 + 24) = 0;

  }
  else
  {
    v20 = *(unsigned __int8 *)(a1 + 81);
    v21 = *(void **)(a1 + 48);
    v22 = *(void **)(a1 + 56);
    v24 = a5;
    v25 = a6;
    v26 = v14;
    v18 = 1;
    v27 = 1;
    memset(v28, 0, sizeof(v28));
    v29 = a2;
    -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](v15, &v24, v21, v20, v22, v13);
  }
  return v18;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int128 v8;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 >= 1)
  {
    v12 = v3;
    v13 = v4;
    v6 = a2;
    do
    {
      v8 = *(_OWORD *)(a3 + 16);
      v10[0] = *(_OWORD *)a3;
      v10[1] = v8;
      v11 = *(_QWORD *)(a3 + 32);
      -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](*(_QWORD *)(a1 + 32), (double *)v10, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 48), *(double *)(a1 + 56));
      a3 += 40;
      --v6;
    }
    while (v6);
  }
  return 1;
}

- (void)_addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:(void *)a3 distributionCalculator:(int)a4 computeAverageAndDuration:(void *)a5 calculatorForAverageAndDuration:(double)a6 dataFactor:
{
  id v11;
  id v12;

  v12 = a3;
  v11 = a5;
  if (a1)
  {
    objc_msgSend(v12, "addDataPoint:startTime:endTime:", a2[2], *a2, a2[1]);
    if (a4)
      objc_msgSend(v11, "addSampleValue:startTime:endTime:sourceID:error:", *((_QWORD *)a2 + 4), 0, a2[2] / a6, *a2, a2[1]);
  }

}

- (BOOL)_walkSampleValuesWithPredicate:(uint64_t)a3 errorOut:(void *)a4 handler:
{
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  if (a1)
  {
    v8 = a2;
    objc_msgSend(a1, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__HDQuantityDistributionQueryServer__walkSampleValuesWithPredicate_errorOut_handler___block_invoke;
    v12[3] = &unk_1E6D0C210;
    v13 = v7;
    v10 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:profile:options:error:handler:", v8, v9, 4, a3, v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int128 v8;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 >= 1)
  {
    v12 = v3;
    v13 = v4;
    v6 = a2;
    do
    {
      v8 = *(_OWORD *)(a3 + 16);
      v10[0] = *(_OWORD *)a3;
      v10[1] = v8;
      v11 = *(_QWORD *)(a3 + 32);
      -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](*(_QWORD *)(a1 + 32), (double *)v10, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 48), *(double *)(a1 + 56));
      a3 += 40;
      --v6;
    }
    while (v6);
  }
  return 1;
}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  char v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  char v41;
  id v42;
  _QWORD v43[3];
  char v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 1;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v42 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_2;
  v33[3] = &unk_1E6D0C1C0;
  v7 = *(id *)(a1 + 48);
  v40 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 32);
  v34 = v7;
  v35 = v8;
  v39 = v43;
  v36 = *(id *)(a1 + 56);
  v41 = *(_BYTE *)(a1 + 88);
  v37 = *(id *)(a1 + 64);
  v38 = *(id *)(a1 + 72);
  LOBYTE(v4) = -[HDQuantityDistributionQueryServer _walkSampleValuesWithPredicate:errorOut:handler:](v4, v5, (uint64_t)&v42, v33);
  v9 = v42;
  v10 = v9;
  if ((v4 & 1) != 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 208);
    v32 = v9;
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_4;
    v27[3] = &unk_1E6D0C198;
    v27[4] = v11;
    v28 = *(id *)(a1 + 56);
    v31 = *(_BYTE *)(a1 + 88);
    v29 = *(id *)(a1 + 64);
    v30 = *(id *)(a1 + 72);
    v13 = objc_msgSend(v12, "fetchFinalOverlapSamplesWithErrorOut:handler:", &v32, v27);
    v14 = v32;

    if ((v13 & 1) != 0)
    {
      v15 = *(void **)(a1 + 72);
      v26 = 0;
      v16 = objc_msgSend(v15, "delegateLoadingWasSuccessful:", &v26);
      v17 = v26;
      v18 = v17;
      if ((v16 & 1) == 0)
      {
        v19 = v17;
        v20 = v19;
        if (v19)
        {
          if (a2)
            *a2 = objc_retainAutorelease(v19);
          else
            _HKLogDroppedError();
        }

      }
    }
    else
    {
      v22 = v14;
      v23 = v22;
      if (v22)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v22);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v23;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Unable to fetch hearing protection samples: %{public}@", buf, 0xCu);
      }
      v16 = 0;
    }

  }
  else
  {
    v21 = v9;
    v14 = v21;
    if (v21)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v21);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }

  _Block_object_dispose(v43, 8);
  return v16;
}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  char v22;
  _BYTE v23[7];
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  char v29;

  v12 = *(_QWORD *)(a1 + 32);
  if (v12
    && (-[_HDQuantityDateIntervals insideRanges:](v12, a5) & 1) == 0
    && !-[_HDQuantityDateIntervals insideRanges:](*(_QWORD *)(a1 + 32), a6))
  {
    return 1;
  }
  v13 = *(double *)(a1 + 80) * a4;
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v16 = *(void **)(v14 + 208);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[2] = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_3;
  v25[3] = &unk_1E6D0C198;
  v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v25[1] = 3221225472;
  v25[4] = v14;
  v26 = v15;
  v29 = *(_BYTE *)(a1 + 88);
  v27 = *(id *)(a1 + 56);
  v28 = *(id *)(a1 + 64);
  *(double *)v21 = a5;
  *(double *)&v21[1] = a6;
  *(double *)&v21[2] = v13;
  v22 = 1;
  memset(v23, 0, sizeof(v23));
  v24 = a2;
  v18 = objc_msgSend(v16, "fetchOverlapProcessSamplesFrom:setAnchorTime:errorOut:handler:", v21, v17, a3, v25);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v19 + 24))
    *(_BYTE *)(v19 + 24) = 0;

  return v18;
}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[HDQuantityDistributionQueryServer _addAttenuatedSamplesUsingAttenuateSamples:sampleCount:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:attenuationEngine:](*(_QWORD *)(a1 + 32), a3, a2, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 56));
  return 1;
}

- (void)_addAttenuatedSamplesUsingAttenuateSamples:(uint64_t)a3 sampleCount:(void *)a4 distributionCalculator:(int)a5 computeAverageAndDuration:(void *)a6 calculatorForAverageAndDuration:(void *)a7 attenuationEngine:
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (a1 && a3 >= 1)
  {
    v16 = 0;
    do
    {
      v30 = 0;
      v28 = 0u;
      v29 = 0u;
      if (v15)
      {
        v17 = (__int128 *)(a2 + 40 * v16);
        v18 = v17[1];
        v25 = *v17;
        v26 = v18;
        v27 = *((_QWORD *)v17 + 4);
        objc_msgSend(v15, "attenuateSample:", &v25);
        while (*((double *)&v28 + 1) - *(double *)&v28 > 0.000001)
        {
          v25 = v28;
          v26 = v29;
          v27 = v30;
          -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](a1, (double *)&v25, v13, a5, v14, 1.0);
          v19 = *(__int128 *)((char *)v17 + 8);
          if (*(double *)&v19 - *((double *)&v28 + 1) <= 0.000001)
            break;
          v20 = *((unsigned __int8 *)v17 + 24);
          v21 = *((_QWORD *)&v28 + 1);
          v22 = v19;
          v23 = v20;
          v24 = 0;
          objc_msgSend(v15, "attenuateSample:", &v21);
          v28 = v25;
          v29 = v26;
          v30 = v27;
        }
      }
      ++v16;
    }
    while (v16 != a3);
  }

}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[HDQuantityDistributionQueryServer _addAttenuatedSamplesUsingAttenuateSamples:sampleCount:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:attenuationEngine:](*(_QWORD *)(a1 + 32), a3, a2, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 56));
  return 1;
}

uint64_t __85__HDQuantityDistributionQueryServer__walkSampleValuesWithPredicate_errorOut_handler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  return (*(uint64_t (**)(double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a4, a5, a6);
}

- (id)_walkSampleDatesWithPredicate:(uint64_t)a3 entityClass:(uint64_t)a4 errorOut:
{
  -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:includeUUID:errorOut:](a1, a2, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_categoryPredicateWithTypeCode:(void *)a3 matchingValue:(uint64_t)a4 errorOut:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB6380], "dataTypeWithCode:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](a1, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    HDCategorySampleEntityPredicateForValue(1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
}

- (id)_walkSampleDatesWithPredicate:(uint64_t)a3 entityClass:(char)a4 includeUUID:(uint64_t)a5 errorOut:
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  _HDQuantityDateIntervals *v25;

  v9 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__174;
  v24 = __Block_byref_object_dispose__174;
  v25 = objc_alloc_init(_HDQuantityDateIntervals);
  objc_msgSend(a1, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke;
  v15[3] = &unk_1E6D0C260;
  v18 = a3;
  v12 = v9;
  v19 = a4;
  v16 = v12;
  v17 = &v20;
  LODWORD(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  if ((_DWORD)a5)
    v13 = (id)v21[5];
  else
    v13 = 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  char v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D298A0];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setEntityClass:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOrderingTerms:", v9);

  objc_msgSend(v7, "setPredicate:", *(_QWORD *)(a1 + 32));
  v10 = objc_alloc(MEMORY[0x1E0D29898]);
  objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithDatabase:descriptor:", v11, v7);
  v13 = (void *)MEMORY[0x1E0C99DE8];
  v25[0] = CFSTR("start_date");
  v25[1] = CFSTR("end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_BYTE *)(a1 + 56);
  if (v16)
  {
    objc_msgSend(v15, "addObject:", CFSTR("uuid"));
    v16 = *(_BYTE *)(a1 + 56);
  }
  v24 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke_2;
  v22[3] = &unk_1E6D0C238;
  v23 = v16;
  v22[4] = *(_QWORD *)(a1 + 40);
  v17 = objc_msgSend(v12, "enumerateProperties:error:enumerationHandler:", v15, &v24, v22);
  v18 = v24;
  v19 = v18;
  if ((v17 & 1) == 0)
  {
    v20 = v18;
    if (v20)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

  }
  return v17;
}

uint64_t __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _HDQuantityIntervalPair *v13;
  id v14;
  _HDQuantityIntervalPair *v15;
  objc_super v17;

  v5 = MEMORY[0x1BCCAB1A4](a3, 0);
  v6 = MEMORY[0x1BCCAB1A4](a3, 1);
  if (*(_BYTE *)(a1 + 40))
  {
    MEMORY[0x1BCCAB1E0](a3, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9 = v7;
  if (v8)
  {
    v10 = *(_QWORD *)(v8 + 40);
    if (!v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v11;

    }
    v13 = [_HDQuantityIntervalPair alloc];
    v14 = v9;
    if (v13)
    {
      v17.receiver = v13;
      v17.super_class = (Class)_HDQuantityIntervalPair;
      v15 = (_HDQuantityIntervalPair *)objc_msgSendSuper2(&v17, sel_init);
      v13 = v15;
      if (v15)
      {
        v15->_startInterval = v5;
        v15->_endInterval = v6;
        objc_storeStrong((id *)&v15->_uuid, v7);
      }
    }

    objc_msgSend(*(id *)(v8 + 40), "addObject:", v13);
    if (v10)
    {
      if (!v14)
        goto LABEL_16;
    }
    else
    {
      *(double *)(v8 + 8) = v5;
      *(double *)(v8 + 16) = v6;
      *(_QWORD *)(v8 + 24) = 0;
      if (!v14)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    if (!*(_BYTE *)(v8 + 32))
      *(_BYTE *)(v8 + 32) = 1;
    goto LABEL_16;
  }
LABEL_17:

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlapProcessor, 0);
  objc_storeStrong((id *)&self->_quantityDistributionQueryServerConfiguration, 0);
}

@end
