@implementation HDDemoDataGenerator

- (HDDemoDataGenerator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDemoDataGenerator)initWithProfile:(id)a3 queue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  HDDemoDataGenerator *v11;

  v6 = (void *)MEMORY[0x1E0C99EA0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDemoDataGeneratorConfiguration configurationFromDefaults:](HDDemoDataGeneratorConfiguration, "configurationFromDefaults:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDDemoDataGenerator initWithProfile:configuration:queue:](self, "initWithProfile:configuration:queue:", v8, v10, v7);

  return v11;
}

- (HDDemoDataGenerator)initWithProfile:(id)a3 configuration:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDDemoDataGenerator *v11;
  HDDemoDataGenerator *v12;
  id v13;
  uint64_t v14;
  NSCalendar *gregorianCalendar;
  NSCalendar *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *appProvenances;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDDemoDataGenerator;
  v11 = -[HDDemoDataGenerator init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_queue, a5);
    v13 = objc_alloc(MEMORY[0x1E0C99D48]);
    v14 = objc_msgSend(v13, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    gregorianCalendar = v12->_gregorianCalendar;
    v12->_gregorianCalendar = (NSCalendar *)v14;

    v16 = v12->_gregorianCalendar;
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v16, "setTimeZone:", v17);

    v12->_isGeneratingDemoData = 0;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    appProvenances = v12->_appProvenances;
    v12->_appProvenances = v18;

    objc_storeStrong((id *)&v12->_configuration, a4);
  }

  return v12;
}

- (void)generateThroughEndDate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD aBlock[4];
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("demo-data-generation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke;
  aBlock[3] = &unk_1E6D01270;
  v21 = v9;
  v22 = v8;
  v11 = v9;
  v12 = _Block_copy(aBlock);
  queue = self->_queue;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke_2;
  v16[3] = &unk_1E6CFC080;
  v18 = v12;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v14 = v7;
  v15 = v12;
  dispatch_async(queue, v16);

}

void __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  if (v3)
  {
    -[HDDemoDataGenerator _queue_runDemoDataGeneratorForDemoPerson:endDate:completion:](v2, v3, *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 56), CFSTR("Unable to generate demo data bbefore a person has been set."));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v4 + 16))(v4, 0, 0, v5);

  }
}

- (void)_queue_runDemoDataGeneratorForDemoPerson:(void *)a3 endDate:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  id v15;
  void *v16;
  __objc2_class **v17;
  NSObject **v18;
  objc_class *v19;
  uint64_t v20;
  id v21;
  void *v22;
  objc_class *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id WeakRetained;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  id v31;
  void *v32;
  objc_class *v33;
  uint64_t v34;
  void *v35;
  objc_class *v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  uint64_t v40;
  void *v41;
  objc_class *v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  uint64_t v46;
  void *v47;
  objc_class *v48;
  uint64_t v49;
  void *v50;
  objc_class *v51;
  uint64_t v52;
  void *v53;
  objc_class *v54;
  uint64_t v55;
  void *v56;
  objc_class *v57;
  uint64_t v58;
  void *v59;
  objc_class *v60;
  uint64_t v61;
  void *v62;
  objc_class *v63;
  uint64_t v64;
  void *v65;
  id v66;
  objc_class *v67;
  uint64_t v68;
  void *v69;
  objc_class *v70;
  uint64_t v71;
  void *v72;
  objc_class *v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  NSObject *v89;
  NSObject *v90;
  const char *v91;
  NSObject *v92;
  const char *v93;
  const char *v94;
  HDDemoDataGeneratorState *v95;
  void *v96;
  HDDemoDataStatisticsSampleGenerator *v97;
  void *v98;
  HDDemoDataActivitySampleGenerator *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  HDDemoDataAudioExposureSampleGenerator *v104;
  void *v105;
  HDDemoDataAudiogramSampleGenerator *v106;
  void *v107;
  HDDemoDataAlcoholSampleGenerator *v108;
  void *v109;
  HDDemoDataBodySampleGenerator *v110;
  void *v111;
  HDDemoDataFoodSampleGenerator *v112;
  void *v113;
  HDDemoDataHealthDocumentSampleGenerator *v114;
  void *v115;
  HDDemoDataHeartSampleGenerator *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  HDDemoDataMindfulnessSampleGenerator *v121;
  void *v122;
  HDDemoDataMobilitySampleGenerator *v123;
  void *v124;
  id v125;
  HDDemoDataOtherAndAdditionalSampleGenerator *v126;
  void *v127;
  HDDemoDataPathologySampleGenerator *v128;
  void *v129;
  HDDemoDataReproductiveHealthSampleGenerator *v130;
  void *v131;
  id v132;
  HDDemoDataSleepSampleGenerator *v133;
  void *v134;
  id v135;
  void *v136;
  HDDemoDataVitalsSampleGenerator *v137;
  void *v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t i;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t j;
  id v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  uint64_t v157;
  void *v158;
  const __CFString *v159;
  uint64_t v160;
  void *v161;
  const __CFString *v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  id v177;
  void *v178;
  void *v179;
  os_log_t *v180;
  id v181;
  id v182;
  void *v183;
  void *v184;
  char v185;
  id v186;
  NSObject *v187;
  uint64_t v188;
  void *v189;
  double v190;
  double v191;
  NSObject *v192;
  double v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  os_log_t v198;
  void *v199;
  NSObject *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  double v205;
  void *v206;
  uint64_t v207;
  os_log_t v208;
  void *v209;
  NSObject *v210;
  void *v211;
  void *v212;
  int v213;
  void *v214;
  id v215;
  void *v216;
  void *v217;
  id obj;
  uint64_t v219;
  id v220;
  void *v221;
  uint64_t v222;
  void *v223;
  _QWORD aBlock[5];
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  id v249[16];
  _OWORD buf[8];
  uint64_t v251;

  v251 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = objc_msgSend(*(id *)(a1 + 96), "shouldGenerateMedicalID");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__HDDemoDataGenerator__queue_runDemoDataGeneratorForDemoPerson_endDate_completion___block_invoke;
    aBlock[3] = &unk_1E6D01298;
    aBlock[4] = a1;
    v225 = v9;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (*(_BYTE *)(a1 + 72))
    {
LABEL_108:

      goto LABEL_109;
    }
    v213 = v10;
    v214 = v11;
    v215 = v9;
    v216 = v8;
    *(_BYTE *)(a1 + 72) = 1;
    v13 = (objc_class *)objc_opt_class();
    v249[0] = 0;
    -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v13, (uint64_t)v249);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v249[0];
    v16 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v14;

    v17 = off_1E6CE3000;
    v18 = (NSObject **)MEMORY[0x1E0CB52C8];
    v217 = v7;
    if (!*(_QWORD *)(a1 + 48))
    {
      _HKInitializeLogging();
      v87 = *v18;
      if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
LABEL_69:

        goto LABEL_70;
      }
      LODWORD(buf[0]) = 138543362;
      *(_QWORD *)((char *)buf + 4) = v15;
      v88 = "Failed to unarchive data for HDDemoDataGeneratorState: %{public}@";
LABEL_32:
      _os_log_error_impl(&dword_1B7802000, v87, OS_LOG_TYPE_ERROR, v88, (uint8_t *)buf, 0xCu);
      goto LABEL_69;
    }
    v19 = (objc_class *)objc_opt_class();
    *(_QWORD *)&v245 = v15;
    -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v19, (uint64_t)&v245);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (id)v245;

    v22 = *(void **)(a1 + 216);
    *(_QWORD *)(a1 + 216) = v20;

    if (!*(_QWORD *)(a1 + 216))
    {
      _HKInitializeLogging();
      v89 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 138543362;
        *(_QWORD *)((char *)buf + 4) = v21;
        v94 = "Failed to unarchive data for HDDemoDataStatisticsSampleGenerator: %{public}@";
LABEL_48:
        _os_log_error_impl(&dword_1B7802000, v89, OS_LOG_TYPE_ERROR, v94, (uint8_t *)buf, 0xCu);
      }
LABEL_34:
      v15 = v21;
      goto LABEL_69;
    }
    v23 = (objc_class *)objc_opt_class();
    *(_QWORD *)&v241 = v21;
    -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v23, (uint64_t)&v241);
    v24 = objc_claimAutoreleasedReturnValue();
    v15 = (id)v241;

    v25 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v24;

    v26 = *(void **)(a1 + 104);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    -[HDDemoDataGenerator _phoneProveance](a1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProfile:provenance:", WeakRetained, v28);

    if (*(_QWORD *)(a1 + 104))
    {
      v29 = (objc_class *)objc_opt_class();
      v240 = v15;
      -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v29, (uint64_t)&v240);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v240;

      v32 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v30;

      if (*(_QWORD *)(a1 + 112))
      {
        v33 = (objc_class *)objc_opt_class();
        v239 = v31;
        -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v33, (uint64_t)&v239);
        v34 = objc_claimAutoreleasedReturnValue();
        v15 = v239;

        v35 = *(void **)(a1 + 120);
        *(_QWORD *)(a1 + 120) = v34;

        if (!*(_QWORD *)(a1 + 120))
        {
          _HKInitializeLogging();
          v90 = *MEMORY[0x1E0CB52C8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
            goto LABEL_68;
          LODWORD(buf[0]) = 138543362;
          *(_QWORD *)((char *)buf + 4) = v15;
          v91 = "Failed to unarchive data for HDDemoDataAudioExposureSampleGenerator: %{public}@";
          goto LABEL_63;
        }
        v36 = (objc_class *)objc_opt_class();
        v238 = v15;
        -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v36, (uint64_t)&v238);
        v37 = objc_claimAutoreleasedReturnValue();
        v31 = v238;

        v38 = *(void **)(a1 + 128);
        *(_QWORD *)(a1 + 128) = v37;

        if (*(_QWORD *)(a1 + 128))
        {
          v39 = (objc_class *)objc_opt_class();
          v237 = v31;
          -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v39, (uint64_t)&v237);
          v40 = objc_claimAutoreleasedReturnValue();
          v15 = v237;

          v41 = *(void **)(a1 + 136);
          *(_QWORD *)(a1 + 136) = v40;

          if (!*(_QWORD *)(a1 + 136))
          {
            _HKInitializeLogging();
            v90 = *MEMORY[0x1E0CB52C8];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
              goto LABEL_68;
            LODWORD(buf[0]) = 138543362;
            *(_QWORD *)((char *)buf + 4) = v15;
            v91 = "Failed to unarchive data for HDDemoDataBodySampleGenerator: %{public}@";
            goto LABEL_63;
          }
          v42 = (objc_class *)objc_opt_class();
          v236 = v15;
          -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v42, (uint64_t)&v236);
          v43 = objc_claimAutoreleasedReturnValue();
          v31 = v236;

          v44 = *(void **)(a1 + 144);
          *(_QWORD *)(a1 + 144) = v43;

          if (*(_QWORD *)(a1 + 144))
          {
            v45 = (objc_class *)objc_opt_class();
            v235 = v31;
            -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v45, (uint64_t)&v235);
            v46 = objc_claimAutoreleasedReturnValue();
            v15 = v235;

            v47 = *(void **)(a1 + 152);
            *(_QWORD *)(a1 + 152) = v46;

            if (!*(_QWORD *)(a1 + 152))
            {
              _HKInitializeLogging();
              v90 = *MEMORY[0x1E0CB52C8];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                goto LABEL_68;
              LODWORD(buf[0]) = 138543362;
              *(_QWORD *)((char *)buf + 4) = v15;
              v91 = "Failed to unarchive data for HDDemoDataHealthDocumentSampleGenerator: %{public}@";
              goto LABEL_63;
            }
            v48 = (objc_class *)objc_opt_class();
            v234 = v15;
            -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v48, (uint64_t)&v234);
            v49 = objc_claimAutoreleasedReturnValue();
            v31 = v234;

            v50 = *(void **)(a1 + 160);
            *(_QWORD *)(a1 + 160) = v49;

            if (*(_QWORD *)(a1 + 160))
            {
              v51 = (objc_class *)objc_opt_class();
              v233 = v31;
              -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v51, (uint64_t)&v233);
              v52 = objc_claimAutoreleasedReturnValue();
              v15 = v233;

              v53 = *(void **)(a1 + 168);
              *(_QWORD *)(a1 + 168) = v52;

              if (!*(_QWORD *)(a1 + 168))
              {
                _HKInitializeLogging();
                v90 = *MEMORY[0x1E0CB52C8];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                  goto LABEL_68;
                LODWORD(buf[0]) = 138543362;
                *(_QWORD *)((char *)buf + 4) = v15;
                v91 = "Failed to unarchive data for HDDemoDataMindfulnessSampleGenerator: %{public}@";
                goto LABEL_63;
              }
              v54 = (objc_class *)objc_opt_class();
              v232 = v15;
              -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v54, (uint64_t)&v232);
              v55 = objc_claimAutoreleasedReturnValue();
              v31 = v232;

              v56 = *(void **)(a1 + 176);
              *(_QWORD *)(a1 + 176) = v55;

              if (*(_QWORD *)(a1 + 176))
              {
                v57 = (objc_class *)objc_opt_class();
                v231 = v31;
                -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v57, (uint64_t)&v231);
                v58 = objc_claimAutoreleasedReturnValue();
                v15 = v231;

                v59 = *(void **)(a1 + 184);
                *(_QWORD *)(a1 + 184) = v58;

                if (*(_QWORD *)(a1 + 184))
                {
                  v60 = (objc_class *)objc_opt_class();
                  v230 = v15;
                  -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v60, (uint64_t)&v230);
                  v61 = objc_claimAutoreleasedReturnValue();
                  v31 = v230;

                  v62 = *(void **)(a1 + 192);
                  *(_QWORD *)(a1 + 192) = v61;

                  if (*(_QWORD *)(a1 + 192))
                  {
                    v63 = (objc_class *)objc_opt_class();
                    v229 = v31;
                    -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v63, (uint64_t)&v229);
                    v64 = objc_claimAutoreleasedReturnValue();
                    v15 = v229;

                    v65 = *(void **)(a1 + 200);
                    *(_QWORD *)(a1 + 200) = v64;

                    if (*(_QWORD *)(a1 + 200))
                    {
                      v66 = objc_loadWeakRetained((id *)(a1 + 80));
                      objc_msgSend(*(id *)(a1 + 200), "setProfile:", v66);

                      v67 = (objc_class *)objc_opt_class();
                      v228 = v15;
                      -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v67, (uint64_t)&v228);
                      v68 = objc_claimAutoreleasedReturnValue();
                      v31 = v228;

                      v69 = *(void **)(a1 + 208);
                      *(_QWORD *)(a1 + 208) = v68;

                      if (*(_QWORD *)(a1 + 208))
                      {
                        v17 = off_1E6CE3000;
                        v70 = (objc_class *)objc_opt_class();
                        v227 = v31;
                        -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v70, (uint64_t)&v227);
                        v71 = objc_claimAutoreleasedReturnValue();
                        v15 = v227;

                        v72 = *(void **)(a1 + 224);
                        *(_QWORD *)(a1 + 224) = v71;

                        if (*(_QWORD *)(a1 + 224))
                        {
                          v73 = (objc_class *)objc_opt_class();
                          v226 = v15;
                          -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v73, (uint64_t)&v226);
                          v74 = objc_claimAutoreleasedReturnValue();
                          v21 = v226;

                          v75 = *(void **)(a1 + 232);
                          *(_QWORD *)(a1 + 232) = v74;

                          if (*(_QWORD *)(a1 + 232))
                          {
                            if (-[HDDemoDataGenerator _queue_unarchivePluginGenerators](a1))
                            {
                              _HKInitializeLogging();
                              v76 = *MEMORY[0x1E0CB52C8];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
                              {
                                LOWORD(buf[0]) = 0;
                                _os_log_impl(&dword_1B7802000, v76, OS_LOG_TYPE_DEFAULT, "Successfully restored state from last demo data generation", (uint8_t *)buf, 2u);
                              }

                              objc_msgSend(*(id *)(a1 + 48), "lastRunDate");
                              v77 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v77)
                              {
                                objc_msgSend(*(id *)(a1 + 48), "lastRunDate");
                                v78 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v8, "timeIntervalSinceDate:", v78);
                                v80 = v79;

                                _HKInitializeLogging();
                                v81 = (void *)*MEMORY[0x1E0CB52C8];
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
                                {
                                  v82 = *(void **)(a1 + 48);
                                  v83 = v81;
                                  objc_msgSend(v82, "lastSampleDate");
                                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                                  LODWORD(buf[0]) = 138412290;
                                  *(_QWORD *)((char *)buf + 4) = v84;
                                  _os_log_impl(&dword_1B7802000, v83, OS_LOG_TYPE_DEFAULT, "Last sample date: %@", (uint8_t *)buf, 0xCu);

                                }
                                _HKInitializeLogging();
                                v85 = *MEMORY[0x1E0CB52C8];
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
                                {
                                  LODWORD(buf[0]) = 134217984;
                                  *(double *)((char *)buf + 4) = v80 * 0.000277777778;
                                  _os_log_impl(&dword_1B7802000, v85, OS_LOG_TYPE_DEFAULT, "Elapsed time since last run date: %.2f hr", (uint8_t *)buf, 0xCu);
                                }
                                objc_msgSend(*(id *)(a1 + 48), "lastSampleDate");
                                v86 = (void *)objc_claimAutoreleasedReturnValue();
                                v7 = v217;
                                v12 = v214;
                                -[HDDemoDataGenerator _queue_generateDataForDemoPerson:startDate:endDate:firstRun:completionHandler:](a1, v217, v86, v8, 0, v214);
LABEL_107:
                                v9 = v215;

                                goto LABEL_108;
                              }
LABEL_70:
                              v95 = objc_alloc_init(HDDemoDataGeneratorState);
                              v96 = *(void **)(a1 + 48);
                              *(_QWORD *)(a1 + 48) = v95;

                              v97 = objc_alloc_init(HDDemoDataStatisticsSampleGenerator);
                              v98 = *(void **)(a1 + 216);
                              *(_QWORD *)(a1 + 216) = v97;

                              v99 = objc_alloc_init(HDDemoDataActivitySampleGenerator);
                              v100 = *(void **)(a1 + 104);
                              *(_QWORD *)(a1 + 104) = v99;

                              v101 = *(void **)(a1 + 104);
                              v102 = objc_loadWeakRetained((id *)(a1 + 80));
                              -[HDDemoDataGenerator _phoneProveance](a1);
                              v103 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v101, "setProfile:provenance:", v102, v103);

                              v104 = objc_alloc_init(HDDemoDataAudioExposureSampleGenerator);
                              v105 = *(void **)(a1 + 120);
                              *(_QWORD *)(a1 + 120) = v104;

                              v106 = objc_alloc_init(HDDemoDataAudiogramSampleGenerator);
                              v107 = *(void **)(a1 + 128);
                              *(_QWORD *)(a1 + 128) = v106;

                              v108 = objc_alloc_init(HDDemoDataAlcoholSampleGenerator);
                              v109 = *(void **)(a1 + 112);
                              *(_QWORD *)(a1 + 112) = v108;

                              v110 = objc_alloc_init(HDDemoDataBodySampleGenerator);
                              v111 = *(void **)(a1 + 136);
                              *(_QWORD *)(a1 + 136) = v110;

                              v112 = objc_alloc_init(HDDemoDataFoodSampleGenerator);
                              v113 = *(void **)(a1 + 144);
                              *(_QWORD *)(a1 + 144) = v112;

                              v114 = objc_alloc_init(HDDemoDataHealthDocumentSampleGenerator);
                              v115 = *(void **)(a1 + 152);
                              *(_QWORD *)(a1 + 152) = v114;

                              v116 = objc_alloc_init(HDDemoDataHeartSampleGenerator);
                              v117 = *(void **)(a1 + 160);
                              *(_QWORD *)(a1 + 160) = v116;

                              v118 = *(void **)(a1 + 160);
                              v119 = objc_loadWeakRetained((id *)(a1 + 80));
                              -[HDDemoDataGenerator _phoneProveance](a1);
                              v120 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v118, "setProfile:provenance:", v119, v120);

                              v121 = objc_alloc_init(HDDemoDataMindfulnessSampleGenerator);
                              v122 = *(void **)(a1 + 168);
                              *(_QWORD *)(a1 + 168) = v121;

                              v123 = objc_alloc_init(HDDemoDataMobilitySampleGenerator);
                              v124 = *(void **)(a1 + 176);
                              *(_QWORD *)(a1 + 176) = v123;

                              v125 = objc_loadWeakRetained((id *)(a1 + 80));
                              objc_msgSend(*(id *)(a1 + 176), "setProfile:", v125);

                              v126 = objc_alloc_init(HDDemoDataOtherAndAdditionalSampleGenerator);
                              v127 = *(void **)(a1 + 184);
                              *(_QWORD *)(a1 + 184) = v126;

                              v128 = objc_alloc_init(HDDemoDataPathologySampleGenerator);
                              v129 = *(void **)(a1 + 192);
                              *(_QWORD *)(a1 + 192) = v128;

                              v130 = objc_alloc_init(HDDemoDataReproductiveHealthSampleGenerator);
                              v131 = *(void **)(a1 + 200);
                              *(_QWORD *)(a1 + 200) = v130;

                              v132 = objc_loadWeakRetained((id *)(a1 + 80));
                              objc_msgSend(*(id *)(a1 + 200), "setProfile:", v132);

                              v133 = objc_alloc_init(HDDemoDataSleepSampleGenerator);
                              v134 = *(void **)(a1 + 208);
                              *(_QWORD *)(a1 + 208) = v133;

                              v135 = objc_alloc_init(v17[257]);
                              v136 = *(void **)(a1 + 224);
                              *(_QWORD *)(a1 + 224) = v135;

                              v137 = objc_alloc_init(HDDemoDataVitalsSampleGenerator);
                              v138 = *(void **)(a1 + 232);
                              *(_QWORD *)(a1 + 232) = v137;

                              v139 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                              v220 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                              v140 = objc_loadWeakRetained((id *)(a1 + 80));
                              objc_msgSend(v140, "daemon");
                              v141 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v141, "pluginManager");
                              v142 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v142, "pluginsConformingToProtocol:", &unk_1EF252578);
                              v143 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v143, "allValues");
                              v144 = (void *)objc_claimAutoreleasedReturnValue();

                              v247 = 0u;
                              v248 = 0u;
                              v245 = 0u;
                              v246 = 0u;
                              obj = v144;
                              v222 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, buf, 16);
                              if (v222)
                              {
                                v219 = *(_QWORD *)v246;
                                do
                                {
                                  for (i = 0; i != v222; ++i)
                                  {
                                    if (*(_QWORD *)v246 != v219)
                                      objc_enumerationMutation(obj);
                                    objc_msgSend(*(id *)(*((_QWORD *)&v245 + 1) + 8 * i), "demoDataGeneratorClasses");
                                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                                    v241 = 0u;
                                    v242 = 0u;
                                    v243 = 0u;
                                    v244 = 0u;
                                    v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v241, v249, 16);
                                    if (v147)
                                    {
                                      v148 = v147;
                                      v149 = *(_QWORD *)v242;
                                      do
                                      {
                                        for (j = 0; j != v148; ++j)
                                        {
                                          if (*(_QWORD *)v242 != v149)
                                            objc_enumerationMutation(v146);
                                          v151 = objc_alloc_init(*(Class *)(*((_QWORD *)&v241 + 1) + 8 * j));
                                          v152 = objc_loadWeakRetained((id *)(a1 + 80));
                                          objc_msgSend(v151, "setDemoDataGenerationContextWithProfile:generatorState:", v152, *(_QWORD *)(a1 + 48));

                                          objc_msgSend(v139, "addObject:", v151);
                                        }
                                        v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v241, v249, 16);
                                      }
                                      while (v148);
                                    }
                                    objc_msgSend(v220, "addObjectsFromArray:", v146);

                                  }
                                  v222 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, buf, 16);
                                }
                                while (v222);
                              }

                              v153 = *(void **)(a1 + 32);
                              *(_QWORD *)(a1 + 32) = v220;
                              v154 = v220;

                              v155 = *(void **)(a1 + 24);
                              *(_QWORD *)(a1 + 24) = v139;

                              v249[0] = *(id *)MEMORY[0x1E0CB7808];
                              v156 = v217;
                              objc_msgSend(v156, "firstName");
                              v157 = objc_claimAutoreleasedReturnValue();
                              v158 = (void *)v157;
                              if (v157)
                                v159 = (const __CFString *)v157;
                              else
                                v159 = &stru_1E6D11BB8;
                              *(_QWORD *)&buf[0] = v159;
                              v249[1] = *(id *)MEMORY[0x1E0CB7810];
                              objc_msgSend(v156, "lastName");
                              v160 = objc_claimAutoreleasedReturnValue();
                              v161 = (void *)v160;
                              if (v160)
                                v162 = (const __CFString *)v160;
                              else
                                v162 = &stru_1E6D11BB8;
                              *((_QWORD *)&buf[0] + 1) = v162;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v249, 2);
                              v223 = (void *)objc_claimAutoreleasedReturnValue();

                              v163 = objc_loadWeakRetained((id *)(a1 + 80));
                              +[HDKeyValueDomain healthAppUserDefaultsDomainWithProfile:](HDKeyValueDomain, "healthAppUserDefaultsDomainWithProfile:", v163);
                              v221 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(v221, "setPropertyListValue:forKey:error:", v223, *MEMORY[0x1E0CB7820], 0);
                              objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C0]);
                              v164 = (void *)objc_claimAutoreleasedReturnValue();
                              v165 = objc_loadWeakRetained((id *)(a1 + 80));
                              objc_msgSend(v165, "userCharacteristicsManager");
                              v166 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v156, "biologicalSex"));
                              v167 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v166, "setUserCharacteristic:forType:error:", v167, v164, 0);

                              objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C8]);
                              v168 = (void *)objc_claimAutoreleasedReturnValue();
                              v169 = objc_loadWeakRetained((id *)(a1 + 80));
                              objc_msgSend(v169, "userCharacteristicsManager");
                              v170 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v156, "bloodType"));
                              v171 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v170, "setUserCharacteristic:forType:error:", v171, v168, 0);

                              objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D8]);
                              v172 = (void *)objc_claimAutoreleasedReturnValue();
                              v173 = objc_loadWeakRetained((id *)(a1 + 80));
                              objc_msgSend(v173, "userCharacteristicsManager");
                              v174 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v156, "fitzpatrickSkinType"));
                              v175 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v174, "setUserCharacteristic:forType:error:", v175, v172, 0);

                              objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
                              v176 = (void *)objc_claimAutoreleasedReturnValue();
                              v177 = objc_loadWeakRetained((id *)(a1 + 80));
                              objc_msgSend(v177, "userCharacteristicsManager");
                              v178 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v156, "birthDateComponents");
                              v179 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(v178, "setUserCharacteristic:forType:error:", v179, v176, 0);
                              v180 = (os_log_t *)MEMORY[0x1E0CB52C8];
                              if (v213)
                              {
                                objc_msgSend(v156, "updateMedicalIDData");
                                v181 = v156;
                                v182 = objc_loadWeakRetained((id *)(a1 + 80));
                                objc_msgSend(v182, "medicalIDDataManager");
                                v183 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v181, "medicalIDData");
                                v184 = (void *)objc_claimAutoreleasedReturnValue();

                                v249[0] = 0;
                                v185 = objc_msgSend(v183, "updateMedicalIDWithLocalData:error:", v184, v249);
                                v186 = v249[0];

                                if ((v185 & 1) == 0)
                                {
                                  _HKInitializeLogging();
                                  v187 = *v180;
                                  if (os_log_type_enabled(*v180, OS_LOG_TYPE_ERROR))
                                  {
                                    LODWORD(buf[0]) = 138543362;
                                    *(_QWORD *)((char *)buf + 4) = v186;
                                    _os_log_error_impl(&dword_1B7802000, v187, OS_LOG_TYPE_ERROR, "Error updating medical ID: %{public}@", (uint8_t *)buf, 0xCu);
                                  }
                                }

                              }
                              v8 = v216;
                              v188 = objc_msgSend(*(id *)(a1 + 96), "generationPeriodInDays");
                              objc_msgSend(*(id *)(a1 + 56), "startOfDayForDate:", v8);
                              v189 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v8, "timeIntervalSinceDate:", v189);
                              v191 = v190;

                              if (v191 < 0.0)
                                v191 = 0.0;
                              _HKInitializeLogging();
                              v192 = *v180;
                              if (os_log_type_enabled(*v180, OS_LOG_TYPE_DEFAULT))
                              {
                                LODWORD(buf[0]) = 134217984;
                                *(double *)((char *)buf + 4) = v191;
                                _os_log_impl(&dword_1B7802000, v192, OS_LOG_TYPE_DEFAULT, "Seconds elapsed today: %f", (uint8_t *)buf, 0xCu);
                              }
                              v193 = v191
                                   + -[HDDemoDataGenerator _timeIntervalFromInitialGenerationPeriod:currentDate:](a1, v188, v8);

                              v194 = *(void **)(a1 + 56);
                              objc_msgSend(v8, "dateByAddingTimeInterval:", -v193);
                              v195 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v194, "startOfDayForDate:", v195);
                              v196 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(*(id *)(a1 + 48), "setFirstSampleDate:", v196);

                              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1442102400.0);
                              v86 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(*(id *)(a1 + 48), "firstSampleDate");
                              v197 = (void *)objc_claimAutoreleasedReturnValue();
                              LODWORD(v195) = objc_msgSend(v197, "hk_isBeforeDate:", v86);

                              if ((_DWORD)v195)
                              {
                                _HKInitializeLogging();
                                v198 = *v180;
                                v7 = v217;
                                if (os_log_type_enabled(*v180, OS_LOG_TYPE_DEFAULT))
                                {
                                  v199 = *(void **)(a1 + 48);
                                  v200 = v198;
                                  objc_msgSend(v199, "firstSampleDate");
                                  v201 = (void *)objc_claimAutoreleasedReturnValue();
                                  LODWORD(buf[0]) = 138412290;
                                  *(_QWORD *)((char *)buf + 4) = v201;
                                  _os_log_impl(&dword_1B7802000, v200, OS_LOG_TYPE_DEFAULT, "We have a pre-historic current date (%@), setting to something sane.", (uint8_t *)buf, 0xCu);

                                }
                                objc_msgSend(*(id *)(a1 + 56), "startOfDayForDate:", v86);
                                v202 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(*(id *)(a1 + 48), "setFirstSampleDate:", v202);

                                v203 = objc_msgSend(*(id *)(a1 + 96), "generationPeriodInDays");
                                objc_msgSend(*(id *)(a1 + 48), "firstSampleDate");
                                v204 = (void *)objc_claimAutoreleasedReturnValue();
                                v205 = -[HDDemoDataGenerator _timeIntervalFromInitialGenerationPeriod:currentDate:](a1, v203, v204);

                                objc_msgSend(*(id *)(a1 + 48), "firstSampleDate");
                                v206 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v206, "dateByAddingTimeInterval:", v205);
                                v207 = objc_claimAutoreleasedReturnValue();

                                v8 = (id)v207;
                              }
                              else
                              {
                                v7 = v217;
                              }
                              _HKInitializeLogging();
                              v208 = *v180;
                              if (os_log_type_enabled(*v180, OS_LOG_TYPE_DEFAULT))
                              {
                                v209 = *(void **)(a1 + 48);
                                v210 = v208;
                                objc_msgSend(v209, "firstSampleDate");
                                v211 = (void *)objc_claimAutoreleasedReturnValue();
                                LODWORD(buf[0]) = 138412290;
                                *(_QWORD *)((char *)buf + 4) = v211;
                                _os_log_impl(&dword_1B7802000, v210, OS_LOG_TYPE_DEFAULT, "First sample date: %@", (uint8_t *)buf, 0xCu);

                              }
                              objc_msgSend(*(id *)(a1 + 48), "firstSampleDate");
                              v212 = (void *)objc_claimAutoreleasedReturnValue();
                              v12 = v214;
                              -[HDDemoDataGenerator _queue_generateDataForDemoPerson:startDate:endDate:firstRun:completionHandler:](a1, v156, v212, v8, 1, v214);

                              goto LABEL_107;
                            }
                            goto LABEL_34;
                          }
                          _HKInitializeLogging();
                          v89 = *MEMORY[0x1E0CB52C8];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                          {
                            LODWORD(buf[0]) = 138543362;
                            *(_QWORD *)((char *)buf + 4) = v21;
                            v94 = "Failed to unarchive data for HDDemoDataVitalsSampleGenerator: %{public}@";
                            goto LABEL_48;
                          }
                          goto LABEL_34;
                        }
                        _HKInitializeLogging();
                        v87 = *MEMORY[0x1E0CB52C8];
                        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                          goto LABEL_69;
                        LODWORD(buf[0]) = 138543362;
                        *(_QWORD *)((char *)buf + 4) = v15;
                        v88 = "Failed to unarchive data for HDDemoDataSymptomsSampleGenerator: %{public}@";
                        goto LABEL_32;
                      }
                      _HKInitializeLogging();
                      v92 = *MEMORY[0x1E0CB52C8];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                        goto LABEL_67;
                      LODWORD(buf[0]) = 138543362;
                      *(_QWORD *)((char *)buf + 4) = v31;
                      v93 = "Failed to unarchive data for HDDemoDataSleepSampleGenerator: %{public}@";
                      goto LABEL_66;
                    }
                    _HKInitializeLogging();
                    v90 = *MEMORY[0x1E0CB52C8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(buf[0]) = 138543362;
                      *(_QWORD *)((char *)buf + 4) = v15;
                      v91 = "Failed to unarchive data for HDDemoDataReproductiveHealthSampleGenerator: %{public}@";
                      goto LABEL_63;
                    }
LABEL_68:
                    v17 = off_1E6CE3000;
                    goto LABEL_69;
                  }
                  _HKInitializeLogging();
                  v92 = *MEMORY[0x1E0CB52C8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf[0]) = 138543362;
                    *(_QWORD *)((char *)buf + 4) = v31;
                    v93 = "Failed to unarchive data for HDDemoDataPathologySampleGenerator: %{public}@";
                    goto LABEL_66;
                  }
LABEL_67:
                  v15 = v31;
                  goto LABEL_68;
                }
                _HKInitializeLogging();
                v90 = *MEMORY[0x1E0CB52C8];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                  goto LABEL_68;
                LODWORD(buf[0]) = 138543362;
                *(_QWORD *)((char *)buf + 4) = v15;
                v91 = "Failed to unarchive data for HDDemoDataOtherAndAdditionalSampleGenerator: %{public}@";
LABEL_63:
                _os_log_error_impl(&dword_1B7802000, v90, OS_LOG_TYPE_ERROR, v91, (uint8_t *)buf, 0xCu);
                goto LABEL_68;
              }
              _HKInitializeLogging();
              v92 = *MEMORY[0x1E0CB52C8];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                goto LABEL_67;
              LODWORD(buf[0]) = 138543362;
              *(_QWORD *)((char *)buf + 4) = v31;
              v93 = "Failed to unarchive data for HDDemoDataMobilitySampleGenerator: %{public}@";
            }
            else
            {
              _HKInitializeLogging();
              v92 = *MEMORY[0x1E0CB52C8];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
                goto LABEL_67;
              LODWORD(buf[0]) = 138543362;
              *(_QWORD *)((char *)buf + 4) = v31;
              v93 = "Failed to unarchive data for HDDemoDataHeartSampleGenerator: %{public}@";
            }
          }
          else
          {
            _HKInitializeLogging();
            v92 = *MEMORY[0x1E0CB52C8];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
              goto LABEL_67;
            LODWORD(buf[0]) = 138543362;
            *(_QWORD *)((char *)buf + 4) = v31;
            v93 = "Failed to unarchive data for HDDemoDataFoodSampleGenerator: %{public}@";
          }
        }
        else
        {
          _HKInitializeLogging();
          v92 = *MEMORY[0x1E0CB52C8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
            goto LABEL_67;
          LODWORD(buf[0]) = 138543362;
          *(_QWORD *)((char *)buf + 4) = v31;
          v93 = "Failed to unarchive data for HDDemoDataAudiogramSampleGenerator: %{public}@";
        }
      }
      else
      {
        _HKInitializeLogging();
        v92 = *MEMORY[0x1E0CB52C8];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
          goto LABEL_67;
        LODWORD(buf[0]) = 138543362;
        *(_QWORD *)((char *)buf + 4) = v31;
        v93 = "Failed to unarchive data for HDDemoDataAlcoholSampleGenerator: %{public}@";
      }
LABEL_66:
      _os_log_error_impl(&dword_1B7802000, v92, OS_LOG_TYPE_ERROR, v93, (uint8_t *)buf, 0xCu);
      goto LABEL_67;
    }
    _HKInitializeLogging();
    v90 = *MEMORY[0x1E0CB52C8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    LODWORD(buf[0]) = 138543362;
    *(_QWORD *)((char *)buf + 4) = v15;
    v91 = "Failed to unarchive data for HDDemoDataActivitySampleGenerator: %{public}@";
    goto LABEL_63;
  }
LABEL_109:

}

uint64_t __83__HDDemoDataGenerator__queue_runDemoDataGeneratorForDemoPerson_endDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  os_log_t v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[4];
  void *v45;
  __int16 v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isFirstRun"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("HealthDemoDataFirstRunDateKey"));

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "firstSampleDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("HealthDemoDataFirstSampleDateKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastSampleDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("HealthDemoDataLastSampleDateKey"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setLastRunDate:", v8);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastRunDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("HealthDemoDataLastRunDateKey"));

  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x1E0CB52C8];
  v12 = (void *)*MEMORY[0x1E0CB52C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v14 = v12;
    objc_msgSend(v13, "lastRunDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v15;
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Last run date: %@", buf, 0xCu);

  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 48);
  v43 = 0;
  v18 = -[HDDemoDataGenerator _archiveObject:error:](v16, v17, (uint64_t)&v43);
  v19 = v43;
  if ((v18 & 1) != 0)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = *(id *)(v16 + 16);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      while (2)
      {
        v24 = 0;
        v25 = v19;
        do
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v24);
          v38 = v25;
          v27 = -[HDDemoDataGenerator _archiveObject:error:](v16, v26, (uint64_t)&v38);
          v19 = v38;

          if ((v27 & 1) == 0)
          {
            _HKInitializeLogging();
            v33 = (void *)*MEMORY[0x1E0CB52C8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
            {
              v35 = v33;
              v36 = (objc_class *)objc_opt_class();
              NSStringFromClass(v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v44 = 138543618;
              v45 = v37;
              v46 = 2114;
              v47 = v19;
              _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ data: %{public}@", v44, 0x16u);

            }
            goto LABEL_21;
          }
          ++v24;
          v25 = v19;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
        if (v22)
          continue;
        break;
      }
    }

    _HKInitializeLogging();
    v28 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "Successfully saved state from demo data generation", v44, 2u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v29 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      v30 = v29;
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v32;
      v50 = 2114;
      v51 = v19;
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ data: %{public}@", buf, 0x16u);

    }
  }
LABEL_21:

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (double)_timeIntervalFromInitialGenerationPeriod:(void *)a3 currentDate:
{
  id v5;
  double v6;
  double v7;

  v5 = a3;
  if (a2 == -1)
    v6 = (double)(unint64_t)(objc_msgSend(*(id *)(a1 + 56), "ordinalityOfUnit:inUnit:forDate:", 16, 4, v5) - 1);
  else
    v6 = (double)(int)a2;
  v7 = v6 * 86400.0;

  return v7;
}

- (void)_queue_generateDataForDemoPerson:(void *)a3 startDate:(void *)a4 endDate:(uint64_t)a5 firstRun:(void *)a6 completionHandler:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  os_log_t *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_log_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  os_log_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  os_log_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  os_log_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  os_log_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  os_log_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  char v67;
  os_log_t *v68;
  double v69;
  os_log_t v70;
  void *v71;
  NSObject *v72;
  void *v73;
  os_log_t v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  os_log_t v78;
  void *v79;
  NSObject *v80;
  void *v81;
  os_log_t v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  os_log_t v86;
  void *v87;
  NSObject *v88;
  void *v89;
  os_log_t v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  double v94;
  os_log_t v95;
  void *v96;
  NSObject *v97;
  void *v98;
  NSObject *v99;
  _BOOL4 v100;
  const char *v101;
  id WeakRetained;
  void *v103;
  id v104;
  void *v105;
  HDDemoDataBaseSampleGeneratorObjectCollection *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  void *v112;
  void *v113;
  HDDemoDataBaseSampleGeneratorObjectCollection *v114;
  unint64_t v115;
  id v116;
  void *v117;
  void *v118;
  int v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  void *v130;
  double v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  double v156;
  double v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  uint64_t k;
  void *v165;
  double v166;
  double v167;
  double v168;
  double v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  double v176;
  double v177;
  HDDemoDataGeneratorWorkoutConfiguration *v180;
  void *v181;
  double v182;
  uint64_t v183;
  double v184;
  double v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  uint64_t m;
  void *v192;
  uint64_t v193;
  double v194;
  void *v195;
  double v196;
  void *v197;
  NSObject *v198;
  id v199;
  void *v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  void *v209;
  void *v210;
  NSObject *v211;
  id v212;
  void *v213;
  NSObject *v214;
  uint64_t v215;
  void *v216;
  double Current;
  void *v218;
  void *v219;
  void (**v220)(id, _QWORD, double);
  void *v221;
  void *v222;
  void *v223;
  void *context;
  id *location;
  uint64_t v226;
  void *v227;
  id *v228;
  id v229;
  unint64_t v230;
  void *v231;
  void *v232;
  id obj;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  _BYTE buf[24];
  __int128 v243;
  uint64_t v244;
  __int128 v245;
  __int128 v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  __int128 v250;
  uint64_t v251;
  uint64_t v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  uint64_t v257;

  v257 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v220 = a6;
  *(_QWORD *)(a1 + 64) = 0;
  DisplayNameForHDDemoDataProfileType(objc_msgSend(*(id *)(a1 + 96), "profileType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = v11;
  NSStringFromHKBiologicalSex(objc_msgSend(v11, "biologicalSex"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = v13;
  v222 = v12;
  objc_msgSend(v13, "timeIntervalSinceDate:", v12);
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 48), "setFirstRun:", a5);
  objc_msgSend(*(id *)(a1 + 48), "setFinished:", 0);
  objc_msgSend(*(id *)(a1 + 48), "startTime");
  objc_msgSend(*(id *)(a1 + 48), "setCurrentTime:");
  objc_msgSend(*(id *)(a1 + 48), "startTime");
  objc_msgSend(*(id *)(a1 + 48), "setEndTime:", v18 + v17 * 0.0000115740741);
  _HKInitializeLogging();
  v19 = (os_log_t *)MEMORY[0x1E0CB52C8];
  v20 = (void *)*MEMORY[0x1E0CB52C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    objc_msgSend(v14, "lowercaseString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&v243 = v17 * 0.0000115740741;
    _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Generating %@ %@ (gender) demo data for %.2f days", buf, 0x20u);

    v19 = (os_log_t *)MEMORY[0x1E0CB52C8];
  }
  _HKInitializeLogging();
  v24 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v17;
    _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "Generation time: %f", buf, 0xCu);
  }
  _HKInitializeLogging();
  v25 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(void **)(a1 + 48);
    v27 = v25;
    objc_msgSend(v26, "startTime");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v28;
    _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "When started Start time: %f", buf, 0xCu);

  }
  _HKInitializeLogging();
  v29 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *(void **)(a1 + 48);
    v31 = v29;
    objc_msgSend(v30, "startTime");
    objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v32;
    _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "When started Start date: %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v33 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    v34 = *(void **)(a1 + 48);
    v35 = v33;
    objc_msgSend(v34, "currentTime");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v36;
    _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "When started Current time: %f", buf, 0xCu);

  }
  _HKInitializeLogging();
  v37 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    v38 = *(void **)(a1 + 48);
    v39 = v37;
    objc_msgSend(v38, "currentTime");
    objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v40;
    _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "When started Current date: %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v41 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    v42 = *(void **)(a1 + 48);
    v43 = v41;
    objc_msgSend(v42, "endTime");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v44;
    _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_DEFAULT, "When started End time: %f", buf, 0xCu);

  }
  v218 = v15;
  v219 = v14;
  _HKInitializeLogging();
  v45 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    v46 = *(void **)(a1 + 48);
    v47 = v45;
    objc_msgSend(v46, "endTime");
    objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v48;
    _os_log_impl(&dword_1B7802000, v47, OS_LOG_TYPE_DEFAULT, "When started End date: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = *(_QWORD *)(a1 + 104);
  v51 = *(_QWORD *)(a1 + 112);
  v52 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)buf = *(_QWORD *)(a1 + 216);
  *(_QWORD *)&buf[8] = v50;
  v243 = *(_OWORD *)(a1 + 120);
  v53 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)&buf[16] = v51;
  v244 = v53;
  v54 = *(_OWORD *)(a1 + 160);
  v245 = *(_OWORD *)(a1 + 144);
  v246 = v54;
  v55 = *(_QWORD *)(a1 + 184);
  v247 = *(_QWORD *)(a1 + 176);
  v248 = v55;
  v56 = *(_QWORD *)(a1 + 192);
  v250 = *(_OWORD *)(a1 + 200);
  v249 = v56;
  v57 = *(_QWORD *)(a1 + 232);
  v251 = v52;
  v252 = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 17);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObjectsFromArray:", v58);

  objc_msgSend(v49, "addObjectsFromArray:", *(_QWORD *)(a1 + 24));
  v59 = (id *)(a1 + 16);
  objc_storeStrong((id *)(a1 + 16), v49);
  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  v60 = *(id *)(a1 + 16);
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v238, &v253, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v239;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v239 != v63)
          objc_enumerationMutation(v60);
        v65 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v65, "setupWithDemoDataGenerator:", a1);
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v238, &v253, 16);
    }
    while (v62);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKey:", &unk_1E6DFE4F8);

  Current = CFAbsoluteTimeGetCurrent();
  v67 = objc_msgSend(*(id *)(a1 + 48), "isFinished");
  v68 = (os_log_t *)MEMORY[0x1E0CB52C8];
  if ((v67 & 1) != 0)
    goto LABEL_27;
  location = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "dataManager");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "openObserverTransaction");

  v228 = (id *)(a1 + 16);
  if ((_DWORD)a5)
  {
    v104 = *(id *)(a1 + 88);
    v105 = (void *)MEMORY[0x1BCCACAC4]();
    v106 = objc_alloc_init(HDDemoDataBaseSampleGeneratorObjectCollection);
    v253 = 0u;
    v254 = 0u;
    v255 = 0u;
    v256 = 0u;
    v107 = *(id *)(a1 + 16);
    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v253, buf, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v254;
      do
      {
        for (j = 0; j != v109; ++j)
        {
          if (*(_QWORD *)v254 != v110)
            objc_enumerationMutation(v107);
          v112 = *(void **)(*((_QWORD *)&v253 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 48), "firstSampleDate");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:", v104, v113, v106);

        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v253, buf, 16);
      }
      while (v109);
    }

    -[HDDemoDataGenerator _insertIntoDatabaseObjectCollection:fromPerson:](a1, v106, v104);
    objc_autoreleasePoolPop(v105);

    v59 = (id *)(a1 + 16);
  }
  v226 = *MEMORY[0x1E0C996C8];
  v231 = (void *)a1;
  while (2)
  {
    v229 = *(id *)(a1 + 88);
    context = (void *)MEMORY[0x1BCCACAC4]();
    v114 = objc_alloc_init(HDDemoDataBaseSampleGeneratorObjectCollection);
    v115 = 0;
    v116 = 0;
    while (1)
    {
      v117 = (void *)MEMORY[0x1BCCACAC4]();
      objc_msgSend((id)a1, "generatorState");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "isExercising");

      if (v119)
        objc_msgSend(v229, "timeIncrementDuringExercise");
      else
        objc_msgSend(v229, "timeIncrement");
      v121 = v120;
      objc_msgSend(*(id *)(a1 + 48), "currentTime");
      v123 = v121 + v122;
      objc_msgSend(*(id *)(a1 + 48), "endTime");
      v124 = *(void **)(a1 + 48);
      if (v123 > v125)
        break;
      objc_msgSend(v124, "currentTime");
      v127 = v126;
      v128 = *(void **)(a1 + 48);
      objc_msgSend(v128, "currentTime");
      objc_msgSend(v128, "setCurrentTime:", v121 + v129);
      objc_msgSend(*(id *)(a1 + 48), "firstSampleDate");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentTime");
      objc_msgSend(v130, "dateByAddingTimeInterval:", v131 * 86400.0);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      v116 = v132;
      objc_msgSend((id)a1, "generatorState");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "workoutConfiguration");
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      v230 = v115;
      if (v134)
      {
        objc_msgSend((id)a1, "generatorState");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "currentTime");
        v137 = v136;
        objc_msgSend(v134, "endTime");
        v139 = v138;

        if (v137 <= v139)
          goto LABEL_94;
        objc_msgSend((id)a1, "generatorState");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setWorkoutConfiguration:", 0);
      }
      else
      {
        v141 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend((id)a1, "generatorState");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "numberWithInteger:", objc_msgSend(v142, "calendarDay"));
        v143 = objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)a1, "demoPerson");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "workoutPrototypesByCalendarDay");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = (void *)v143;
        objc_msgSend(v145, "objectForKeyedSubscript:", v143);
        v146 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDemoDataGeneratorConfiguration configurationFromDefaults:](HDDemoDataGeneratorConfiguration, "configurationFromDefaults:", v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        v227 = v117;
        if (objc_msgSend(v148, "shouldEnsureRecentWorkoutHasRoute"))
        {
          objc_msgSend((id)a1, "generatorState");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "currentDate");
          v150 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v226);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v151, "isDateInYesterday:", v150))
          {
            +[HDDemoDataWorkoutPrototype yogaAndRunningPrototypes](HDDemoDataWorkoutPrototype, "yogaAndRunningPrototypes");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v151, "isDateInToday:", v150))
          {
            v152 = (void *)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v152 = 0;
          }

        }
        else
        {
          v152 = 0;
        }

        if (v152)
          v153 = v152;
        else
          v153 = v146;
        v154 = v153;

        objc_msgSend((id)a1, "generatorState");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "currentTime");
        v157 = v156;

        objc_msgSend((id)a1, "generatorState");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = objc_msgSend(v158, "currentDay");

        v240 = 0u;
        v241 = 0u;
        v238 = 0u;
        v239 = 0u;
        obj = v154;
        v160 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
        if (v160)
        {
          v161 = v160;
          v162 = *(_QWORD *)v239;
          v163 = (double)v159;
          do
          {
            for (k = 0; k != v161; ++k)
            {
              if (*(_QWORD *)v239 != v162)
                objc_enumerationMutation(obj);
              v165 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * k);
              objc_msgSend(v165, "startTimeOffsetInDay");
              v167 = v166;
              objc_msgSend(v165, "duration");
              v169 = v168;
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6DF9E78);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "dateByAddingUnit:value:toDate:options:", 16, -90, v172, 0);
              v173 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v174, "isAppleWatch") & 1) != 0
                || (objc_msgSend(v170, "containsObject:", v232) & 1) != 0)
              {
                v175 = 1;
              }
              else
              {
                v175 = objc_msgSend(v116, "hk_isAfterDate:", v173);
              }
              v176 = v167 + v163;
              v177 = v176 + v169 * 0.0000115740741;

              if (v157 > v176 && v157 < v177 && v175 != 0)
              {
                v180 = -[HDDemoDataGeneratorWorkoutConfiguration initWithPrototype:currentDemoDataTime:]([HDDemoDataGeneratorWorkoutConfiguration alloc], "initWithPrototype:currentDemoDataTime:", v165, v157);
                objc_msgSend(v231, "generatorState");
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "setWorkoutConfiguration:", v180);

              }
            }
            v161 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
          }
          while (v161);
        }

        v115 = v230;
        a1 = (uint64_t)v231;
        v117 = v227;
        v59 = v228;
        v134 = 0;
        v140 = v232;
      }

LABEL_94:
      objc_msgSend(*(id *)(a1 + 48), "currentTime");
      v183 = (uint64_t)v182;
      if (objc_msgSend(*(id *)(a1 + 48), "currentDay") != (uint64_t)v182)
      {
        objc_msgSend(*(id *)(a1 + 48), "setCurrentDay:", v183);
        objc_msgSend(*(id *)(a1 + 216), "randomDoubleFromGenerator");
        objc_msgSend(v229, "setRestingHeartRate:", (uint64_t)(v184 * 10.0) + 50);
        objc_msgSend(*(id *)(a1 + 216), "randomDoubleFromGenerator");
        objc_msgSend(v229, "setExerciseIntensityPercentage:", fabs(v185 * 0.2) + 0.6);
      }
      v236 = 0u;
      v237 = 0u;
      v234 = 0u;
      v235 = 0u;
      v186 = *v59;
      v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v234, &v253, 16);
      if (v187)
      {
        v188 = v187;
        v189 = v117;
        v190 = *(_QWORD *)v235;
        do
        {
          for (m = 0; m != v188; ++m)
          {
            if (*(_QWORD *)v235 != v190)
              objc_enumerationMutation(v186);
            v192 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * m);
            v193 = *(_QWORD *)(a1 + 88);
            objc_msgSend(*(id *)(a1 + 48), "currentTime");
            objc_msgSend(v192, "generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:", v193, v116, v114, v127, v194);
          }
          v188 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v234, &v253, 16);
        }
        while (v188);

        objc_autoreleasePoolPop(v189);
        v115 = v230;
        v59 = v228;
        if (v230 >= 0x63)
          goto LABEL_108;
      }
      else
      {

        objc_autoreleasePoolPop(v117);
        if (v115 > 0x62)
          goto LABEL_108;
      }
      ++v115;
    }
    objc_msgSend(v124, "setFinished:", 1);
    objc_msgSend(*(id *)(a1 + 48), "firstSampleDate");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "currentTime");
    objc_msgSend(v195, "dateByAddingTimeInterval:", v196 * 86400.0);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setLastSampleDate:", v197);

    objc_autoreleasePoolPop(v117);
LABEL_108:
    _HKInitializeLogging();
    v68 = (os_log_t *)MEMORY[0x1E0CB52C8];
    v198 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v116;
      _os_log_impl(&dword_1B7802000, v198, OS_LOG_TYPE_DEFAULT, "Last sample date for iteration: %@", buf, 0xCu);
    }
    -[HDDemoDataGenerator _insertIntoDatabaseObjectCollection:fromPerson:](a1, v114, v229);

    objc_autoreleasePoolPop(context);
    v199 = objc_loadWeakRetained(location);
    objc_msgSend(v199, "dataManager");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "closeObserverTransaction");

    objc_msgSend(*(id *)(a1 + 48), "currentTime");
    v202 = v201;
    objc_msgSend(*(id *)(a1 + 48), "startTime");
    v204 = v202 - v203;
    objc_msgSend(*(id *)(a1 + 48), "endTime");
    v206 = v205;
    objc_msgSend(*(id *)(a1 + 48), "startTime");
    v208 = v204 / (v206 - v207) * 100.0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v208);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "setObject:forKey:", v210, CFSTR("HealthDemoDataProgressKey"));

    _HKInitializeLogging();
    v211 = *v68;
    if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v208;
      _os_log_impl(&dword_1B7802000, v211, OS_LOG_TYPE_DEFAULT, "Current demo data generation progress: %.1f%%", buf, 0xCu);
    }
    if (!objc_msgSend(*(id *)(a1 + 48), "isFinished"))
    {
      v212 = objc_loadWeakRetained(location);
      objc_msgSend(v212, "dataManager");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "openObserverTransaction");

      continue;
    }
    break;
  }
LABEL_27:
  v69 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v70 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v71 = *(void **)(a1 + 48);
    v72 = v70;
    objc_msgSend(v71, "lastSampleDate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v73;
    _os_log_impl(&dword_1B7802000, v72, OS_LOG_TYPE_DEFAULT, "When ended Last sample date: %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v74 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v75 = *(void **)(a1 + 48);
    v76 = v74;
    objc_msgSend(v75, "startTime");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v77;
    _os_log_impl(&dword_1B7802000, v76, OS_LOG_TYPE_DEFAULT, "When ended Start time: %f", buf, 0xCu);

  }
  _HKInitializeLogging();
  v78 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v79 = *(void **)(a1 + 48);
    v80 = v78;
    objc_msgSend(v79, "startTime");
    objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v81;
    _os_log_impl(&dword_1B7802000, v80, OS_LOG_TYPE_DEFAULT, "When ended Start date: %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v82 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v83 = *(void **)(a1 + 48);
    v84 = v82;
    objc_msgSend(v83, "currentTime");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v85;
    _os_log_impl(&dword_1B7802000, v84, OS_LOG_TYPE_DEFAULT, "When ended Current time: %f", buf, 0xCu);

  }
  _HKInitializeLogging();
  v86 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v87 = *(void **)(a1 + 48);
    v88 = v86;
    objc_msgSend(v87, "currentTime");
    objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v89;
    _os_log_impl(&dword_1B7802000, v88, OS_LOG_TYPE_DEFAULT, "When ended Current date: %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v90 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v91 = *(void **)(a1 + 48);
    v92 = v90;
    objc_msgSend(v91, "endTime");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v93;
    _os_log_impl(&dword_1B7802000, v92, OS_LOG_TYPE_DEFAULT, "When ended End time: %f", buf, 0xCu);

  }
  v94 = v69 - Current;
  _HKInitializeLogging();
  v95 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v96 = *(void **)(a1 + 48);
    v97 = v95;
    objc_msgSend(v96, "endTime");
    objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v98;
    _os_log_impl(&dword_1B7802000, v97, OS_LOG_TYPE_DEFAULT, "When ended End date: %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v99 = *v68;
  v100 = os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT);
  if (v94 <= 1.0)
  {
    if (v100)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = (uint64_t)(v94 * 1000.0);
      v101 = "Total runtime to generate: %ld ms";
LABEL_116:
      _os_log_impl(&dword_1B7802000, v99, OS_LOG_TYPE_DEFAULT, v101, buf, 0xCu);
    }
  }
  else if (v100)
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = (uint64_t)v94;
    v101 = "Total runtime to generate: %ld s";
    goto LABEL_116;
  }
  _HKInitializeLogging();
  v214 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v215 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v215;
    _os_log_impl(&dword_1B7802000, v214, OS_LOG_TYPE_DEFAULT, "Total samples written: %ld", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "setObject:forKey:", &unk_1E6DFEC30, CFSTR("HealthDemoDataProgressKey"));

  objc_msgSend(*(id *)(a1 + 48), "currentTime");
  objc_msgSend(*(id *)(a1 + 48), "setStartTime:");
  if (v220)
    v220[2](v220, *(_QWORD *)(a1 + 64), v94);

}

- (id)_phoneProveance
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[3];
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "sourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v3, "localDeviceSourceWithError:", &v35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v35;

  if (v4)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "deviceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v5;
    objc_msgSend(v7, "deviceEntityForNoDeviceWithError:", &v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v34;

    if (v8)
    {
      v10 = objc_loadWeakRetained(v1);
      objc_msgSend(v10, "daemon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "behavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_loadWeakRetained(v1);
      v29 = objc_msgSend(v31, "currentSyncIdentityPersistentID");
      objc_msgSend(v12, "currentDeviceProductType");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("UnknownDevice");
      v30 = (void *)v13;
      if (v13)
        v14 = (const __CFString *)v13;
      v28 = v14;
      objc_msgSend(v12, "currentOSBuild");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("UnknownBuild");
      if (v15)
        v17 = (const __CFString *)v15;
      v27 = v17;
      v32 = v9;
      if (v12)
        objc_msgSend(v12, "currentOSVersionStruct");
      else
        memset(v33, 0, sizeof(v33));
      objc_msgSend(v12, "currentOSVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localTimeZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "persistentID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, v29, v28, v27, v33, v21, v23, v24, v25, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v32;
    }
    else
    {
      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v9;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Error creating local phone device entity %{public}@", buf, 0xCu);
      }
      v19 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v5;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Error creating local phone source entity %{public}@", buf, 0xCu);
    }
    v19 = 0;
    v9 = v5;
  }

  return v19;
}

- (void)_insertIntoDatabaseObjectCollection:(void *)a3 fromPerson:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  const __CFString *v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  id *location;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  _QWORD v61[5];
  id v62;
  id v63;
  _QWORD v64[5];
  id v65;
  id v66;
  __int128 buf;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectsFromPhone");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsFromWatch");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsFromPhoneApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataGenerator _phoneProveance](a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v57 = v6;
  objc_msgSend(v6, "firstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@'s Watch"), v10);
  v11 = objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "sourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA"));
  v66 = 0;
  v56 = (void *)v11;
  objc_msgSend(v13, "sourceForAppleDeviceWithUUID:identifier:name:productType:createIfNecessary:error:", v14, CFSTR("com.apple.health.demo_watch"), v11, CFSTR("Watch1,2"), 1, &v66);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v66;

  location = (id *)(a1 + 80);
  if (v15)
  {
    v17 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v17, "deviceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v16;
    objc_msgSend(v18, "deviceEntityForNoDeviceWithError:", &v65);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v65;

    v52 = a1;
    if (v19)
    {
      v54 = v7;
      v20 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v20, "daemon");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "behavior");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = objc_loadWeakRetained((id *)(a1 + 80));
      v47 = objc_msgSend(v48, "currentSyncIdentityPersistentID");
      objc_msgSend(v22, "currentOSBuild");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = CFSTR("UnknownBuild");
      if (v23)
        v25 = (const __CFString *)v23;
      v46 = v25;
      v49 = v8;
      v50 = v5;
      v26 = v19;
      if (v22)
      {
        objc_msgSend(v22, "currentOSVersionStruct");
      }
      else
      {
        buf = 0uLL;
        v68 = 0;
      }
      objc_msgSend(v22, "currentOSVersion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localTimeZone");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "persistentID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v19, "persistentID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, v47, CFSTR("Watch1,2"), v46, &buf, v32, v34, v35, v36, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v49;
      v5 = v50;
      v7 = v54;
    }
    else
    {
      v26 = 0;
      _HKInitializeLogging();
      v31 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        v16 = v51;
        *(_QWORD *)((char *)&buf + 4) = v51;
        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Error creating watch device entity %{public}@", (uint8_t *)&buf, 0xCu);
        v28 = 0;
        v30 = v56;
        v29 = v57;
        goto LABEL_15;
      }
      v28 = 0;
    }
    v30 = v56;
    v29 = v57;
    v16 = v51;
LABEL_15:

    a1 = v52;
    goto LABEL_16;
  }
  _HKInitializeLogging();
  v27 = *MEMORY[0x1E0CB52C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Error creating watch source entity %{public}@", (uint8_t *)&buf, 0xCu);
  }
  v28 = 0;
  v30 = v56;
  v29 = v57;
LABEL_16:

  if (v28 && v8)
  {
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke;
    v64[3] = &unk_1E6D012C0;
    v64[4] = a1;
    v55 = v7;
    objc_msgSend(v7, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, v64);
    *(_QWORD *)(a1 + 64) += objc_msgSend(v59, "count");
    v37 = objc_loadWeakRetained(location);
    objc_msgSend(v37, "dataManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v39 = objc_msgSend(v38, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v59, v8, 1, &v63, CFAbsoluteTimeGetCurrent());
    v40 = v63;

    if ((v39 & 1) != 0)
    {
      *(_QWORD *)(a1 + 64) += objc_msgSend(v58, "count");
      v41 = objc_loadWeakRetained(location);
      objc_msgSend(v41, "dataManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v40;
      objc_msgSend(v42, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v58, v28, 1, &v62, CFAbsoluteTimeGetCurrent());
      v43 = v62;

      v44 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_275;
      v61[3] = &unk_1E6D012E8;
      v61[4] = a1;
      objc_msgSend(v5, "enumerateObjectAssociations:", v61);
      v60[0] = v44;
      v60[1] = 3221225472;
      v60[2] = __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_278;
      v60[3] = &unk_1E6D012E8;
      v60[4] = a1;
      objc_msgSend(v5, "enumerateLooseObjectAssociations:", v60);
      v40 = v43;
    }
    else
    {
      _HKInitializeLogging();
      v45 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v40;
        _os_log_error_impl(&dword_1B7802000, v45, OS_LOG_TYPE_ERROR, "Error inserting phone samples: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    v7 = v55;

  }
}

void __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  char v40;
  id v41;
  NSObject *v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint8_t buf[32];
  _QWORD v58[2];
  id v59[4];

  v59[2] = *(id *)MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(v5 + 40), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v52 = v6;
      v9 = v7;
      v10 = *MEMORY[0x1E0CB47D8];
      v58[0] = *MEMORY[0x1E0CB5140];
      v58[1] = v10;
      v59[0] = (id)MEMORY[0x1E0C9AAB0];
      v59[1] = (id)MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(v5 + 80));
      objc_msgSend(WeakRetained, "sourceManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6F90], "entitlementsWithDictionary:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      v54 = v9;
      objc_msgSend(v13, "sourceForApplicationIdentifier:createOrUpdateIfNecessary:entitlements:name:error:", v9, 1, v14, 0, &v56);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v56;

      v17 = v15;
      if (v15)
      {
        v18 = v15;
      }
      else
      {
        _HKInitializeLogging();
        v19 = *MEMORY[0x1E0CB52C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v54;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v16;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Error creating local phone app source entity with bundle id %{public}@ %{public}@", buf, 0x16u);
        }
      }

      v20 = objc_loadWeakRetained((id *)(v5 + 80));
      objc_msgSend(v20, "deviceManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = 0;
      objc_msgSend(v21, "deviceEntityForNoDeviceWithError:", v59);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v59[0];

      if (v22)
      {
        v24 = objc_loadWeakRetained((id *)(v5 + 80));
        objc_msgSend(v24, "daemon");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "behavior");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_loadWeakRetained((id *)(v5 + 80));
        v45 = objc_msgSend(v27, "currentSyncIdentityPersistentID");
        objc_msgSend(v26, "currentDeviceProductType");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("UnknownDevice");
        v47 = (void *)v28;
        if (v28)
          v29 = (const __CFString *)v28;
        v44 = v29;
        objc_msgSend(v26, "currentOSBuild");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = CFSTR("UnknownBuild");
        v46 = (void *)v30;
        if (v30)
          v31 = (const __CFString *)v30;
        v43 = v31;
        v49 = v23;
        v50 = v7;
        v51 = v22;
        v48 = v27;
        v32 = v17;
        if (v26)
          objc_msgSend(v26, "currentOSVersionStruct");
        else
          memset(buf, 0, 24);
        v6 = v52;
        objc_msgSend(v26, "currentOSVersion");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localTimeZone");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v32, "persistentID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "persistentID"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, v45, v44, v43, buf, v34, v35, v36, v37, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v32;
        objc_msgSend(*(id *)(v5 + 40), "setObject:forKeyedSubscript:", v8, v54);

        v23 = v49;
        v7 = v50;
      }
      else
      {
        _HKInitializeLogging();
        v33 = *MEMORY[0x1E0CB52C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v23;
          _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Error creating local phone device entity for app provenance %{public}@", buf, 0xCu);
        }
        v8 = 0;
        v6 = v52;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) += objc_msgSend(v6, "count");
  v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(v38, "dataManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v40 = objc_msgSend(v39, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v6, v8, 1, &v55, CFAbsoluteTimeGetCurrent());

  v41 = v55;
  if ((v40 & 1) == 0)
  {
    _HKInitializeLogging();
    v42 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v41;
      _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "Error inserting phone app samples: %{public}@", buf, 0xCu);
    }
  }

}

void __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_275(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(*(_QWORD *)(a1 + 32) + 80);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v11 = 0;
  v8 = +[HDAssociationEntity insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:](HDAssociationEntity, "insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:", v6, v5, 0, 0, WeakRetained, &v11);

  v9 = v11;
  if (!v8)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Error associating objects with object: %{public}@", buf, 0xCu);
    }
  }

}

void __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(*(_QWORD *)(a1 + 32) + 80);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v11 = 0;
  v8 = +[HDAssociationEntity insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:](HDAssociationEntity, "insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:", v6, v5, 1, 0, WeakRetained, &v11);

  v9 = v11;
  if (!v8)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Error loose associating objects with object: %{public}@", buf, 0xCu);
    }
  }

}

- (HDKeyValueDomain)_keyValueDomain
{
  HDKeyValueDomain *v2;
  id WeakRetained;
  HDKeyValueDomain *v4;

  v2 = [HDKeyValueDomain alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v2, "initWithCategory:domainName:profile:", 3, CFSTR("DemoData"), WeakRetained);

  return v4;
}

- (uint64_t)_archiveObject:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  -[HDDemoDataGenerator _keyValueDomain](a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v6, "setData:forKey:error:", v9, v8, a3);
  else
    v10 = 0;

  return v10;
}

- (id)_unarchiveDataWithClass:(uint64_t)a3 error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HDDemoDataGenerator _keyValueDomain](a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForKey:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a2, v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)_queue_unarchivePluginGenerators
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v14;
  void *v15;
  id obj;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unsigned __int8 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v9 = *(objc_class **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v17 = v8;
        -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v9, (uint64_t)&v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v17;

        if (!v10)
        {
          _HKInitializeLogging();
          v12 = (void *)*MEMORY[0x1E0CB52C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
          {
            v14 = v12;
            NSStringFromClass(v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v24 = v15;
            v25 = 2114;
            v26 = v5;
            _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to unarchive data for %{public}@: %{public}@", buf, 0x16u);

          }
          v22 = 0;

          goto LABEL_15;
        }
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
        objc_msgSend(v10, "setDemoDataGenerationContextWithProfile:generatorState:", WeakRetained, *(_QWORD *)(a1 + 48));

        objc_msgSend(v2, "addObject:", v10);
        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }

  objc_storeStrong((id *)(a1 + 24), v2);
  v22 = 1;
LABEL_15:

  return v22;
}

- (id)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (id)firstSampleDate
{
  return -[HDDemoDataGeneratorState firstSampleDate](self->_generatorState, "firstSampleDate");
}

- (int64_t)firstSampleDayOfYear
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HDDemoDataGenerator_firstSampleDayOfYear__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  if (qword_1ED5524F0 != -1)
    dispatch_once(&qword_1ED5524F0, block);
  return _MergedGlobals_221;
}

void __43__HDDemoDataGenerator_firstSampleDayOfYear__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  objc_msgSend(*(id *)(v1 + 48), "firstSampleDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_221 = objc_msgSend(v2, "ordinalityOfUnit:inUnit:forDate:", 16, 4, v3);

}

- (id)currentDateFromCurrentTime:(double)a3
{
  void *v4;
  void *v5;

  -[HDDemoDataGeneratorState firstSampleDate](self->_generatorState, "firstSampleDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", a3 * 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDemoDataTimeInWeekend:(double)a3 calendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HDDemoDataGenerator currentDateFromCurrentTime:](self, "currentDateFromCurrentTime:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 512, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "weekday") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "hk_weekendDays");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "weekday"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "containsObject:", v12);

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      v14 = v9;
      v15 = (void *)objc_opt_class();
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = v15;
      objc_msgSend(v16, "numberWithDouble:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v15;
      v21 = 2114;
      v22 = v18;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to determine weekday components from time %{public}@", (uint8_t *)&v19, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDDemoDataPerson)demoPerson
{
  return self->_demoPerson;
}

- (void)setDemoPerson:(id)a3
{
  objc_storeStrong((id *)&self->_demoPerson, a3);
}

- (HDDemoDataGeneratorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (HDDemoDataActivitySampleGenerator)activitySampleGenerator
{
  return self->_activitySampleGenerator;
}

- (void)setActivitySampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_activitySampleGenerator, a3);
}

- (HDDemoDataAlcoholSampleGenerator)alcoholSampleGenerator
{
  return self->_alcoholSampleGenerator;
}

- (void)setAlcoholSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_alcoholSampleGenerator, a3);
}

- (HDDemoDataAudioExposureSampleGenerator)audioExposureSampleGenerator
{
  return self->_audioExposureSampleGenerator;
}

- (void)setAudioExposureSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_audioExposureSampleGenerator, a3);
}

- (HDDemoDataAudiogramSampleGenerator)audiogramSampleGenerator
{
  return self->_audiogramSampleGenerator;
}

- (void)setAudiogramSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_audiogramSampleGenerator, a3);
}

- (HDDemoDataBodySampleGenerator)bodySampleGenerator
{
  return self->_bodySampleGenerator;
}

- (void)setBodySampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_bodySampleGenerator, a3);
}

- (HDDemoDataFoodSampleGenerator)foodSampleGenerator
{
  return self->_foodSampleGenerator;
}

- (void)setFoodSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_foodSampleGenerator, a3);
}

- (HDDemoDataHealthDocumentSampleGenerator)healthDocumentSampleGenerator
{
  return self->_healthDocumentSampleGenerator;
}

- (void)setHealthDocumentSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_healthDocumentSampleGenerator, a3);
}

- (HDDemoDataHeartSampleGenerator)heartSampleGenerator
{
  return self->_heartSampleGenerator;
}

- (void)setHeartSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_heartSampleGenerator, a3);
}

- (HDDemoDataMindfulnessSampleGenerator)mindfulnessSampleGenerator
{
  return self->_mindfulnessSampleGenerator;
}

- (void)setMindfulnessSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_mindfulnessSampleGenerator, a3);
}

- (HDDemoDataMobilitySampleGenerator)mobilitySampleGenerator
{
  return self->_mobilitySampleGenerator;
}

- (void)setMobilitySampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_mobilitySampleGenerator, a3);
}

- (HDDemoDataOtherAndAdditionalSampleGenerator)otherAndAdditionalSampleGenerator
{
  return self->_otherAndAdditionalSampleGenerator;
}

- (void)setOtherAndAdditionalSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_otherAndAdditionalSampleGenerator, a3);
}

- (HDDemoDataPathologySampleGenerator)pathologySampleGenerator
{
  return self->_pathologySampleGenerator;
}

- (void)setPathologySampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_pathologySampleGenerator, a3);
}

- (HDDemoDataReproductiveHealthSampleGenerator)reproductiveHealthSampleGenerator
{
  return self->_reproductiveHealthSampleGenerator;
}

- (void)setReproductiveHealthSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_reproductiveHealthSampleGenerator, a3);
}

- (HDDemoDataSleepSampleGenerator)sleepSampleGenerator
{
  return self->_sleepSampleGenerator;
}

- (void)setSleepSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_sleepSampleGenerator, a3);
}

- (HDDemoDataStatisticsSampleGenerator)statisticsSampleGenerator
{
  return self->_statisticsSampleGenerator;
}

- (void)setStatisticsSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsSampleGenerator, a3);
}

- (HDDemoDataSymptomsSampleGenerator)symptomsSampleGenerator
{
  return self->_symptomsSampleGenerator;
}

- (void)setSymptomsSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_symptomsSampleGenerator, a3);
}

- (HDDemoDataVitalsSampleGenerator)vitalsSampleGenerator
{
  return self->_vitalsSampleGenerator;
}

- (void)setVitalsSampleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_vitalsSampleGenerator, a3);
}

- (HDDemoDataGeneratorState)generatorState
{
  return self->_generatorState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vitalsSampleGenerator, 0);
  objc_storeStrong((id *)&self->_symptomsSampleGenerator, 0);
  objc_storeStrong((id *)&self->_statisticsSampleGenerator, 0);
  objc_storeStrong((id *)&self->_sleepSampleGenerator, 0);
  objc_storeStrong((id *)&self->_reproductiveHealthSampleGenerator, 0);
  objc_storeStrong((id *)&self->_pathologySampleGenerator, 0);
  objc_storeStrong((id *)&self->_otherAndAdditionalSampleGenerator, 0);
  objc_storeStrong((id *)&self->_mobilitySampleGenerator, 0);
  objc_storeStrong((id *)&self->_mindfulnessSampleGenerator, 0);
  objc_storeStrong((id *)&self->_heartSampleGenerator, 0);
  objc_storeStrong((id *)&self->_healthDocumentSampleGenerator, 0);
  objc_storeStrong((id *)&self->_foodSampleGenerator, 0);
  objc_storeStrong((id *)&self->_bodySampleGenerator, 0);
  objc_storeStrong((id *)&self->_audiogramSampleGenerator, 0);
  objc_storeStrong((id *)&self->_audioExposureSampleGenerator, 0);
  objc_storeStrong((id *)&self->_alcoholSampleGenerator, 0);
  objc_storeStrong((id *)&self->_activitySampleGenerator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_demoPerson, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_generatorState, 0);
  objc_storeStrong((id *)&self->_appProvenances, 0);
  objc_storeStrong((id *)&self->_dataGeneratorClassesFromPlugins, 0);
  objc_storeStrong((id *)&self->_dataGeneratorsFromPlugins, 0);
  objc_storeStrong((id *)&self->_demoDataGenerators, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
