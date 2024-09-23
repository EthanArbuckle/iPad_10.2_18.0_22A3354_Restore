@implementation HDFakeDataCollector

- (HDFakeDataCollector)initWithProfile:(id)a3
{
  id v4;
  HDFakeDataCollector *v5;
  HDFakeDataCollector *v6;
  HKDataCollectorState *v7;
  HKDataCollectorState *state;
  uint64_t v9;
  OS_dispatch_queue *generationQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDFakeDataCollector;
  v5 = -[HDFakeDataCollector init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E0CB6578]);
    state = v6->_state;
    v6->_state = v7;

    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    generationQueue = v6->_generationQueue;
    v6->_generationQueue = (OS_dispatch_queue *)v9;

  }
  return v6;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDFakeDataCollector _lock_endFaking]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)HDFakeDataCollector;
  -[HDFakeDataCollector dealloc](&v4, sel_dealloc);
}

- (void)_lock_endFaking
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
  }
}

- (void)setConfiguration:(id)a3
{
  HDFakeDataCollectorConfiguration *configuration;
  HDFakeDataCollectorConfiguration *v6;
  double Current;
  OS_dispatch_source *v8;
  OS_dispatch_source *generationSource;
  NSObject *v10;
  HDFakeDataCollectorConfiguration *v11;
  _QWORD handler[4];
  id v13;
  id location;

  v11 = (HDFakeDataCollectorConfiguration *)a3;
  os_unfair_lock_lock(&self->_lock);
  configuration = self->_configuration;
  v6 = v11;
  if (configuration != v11)
  {
    if (!v11 || !-[HDFakeDataCollectorConfiguration isEqual:](configuration, "isEqual:", v11))
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      Current = CFAbsoluteTimeGetCurrent();
      -[HDFakeDataCollector _lock_setupGeneratorsForStartTime:]((uint64_t)self, Current);
    }
    v6 = self->_configuration;
  }
  if (v6)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    if (!self->_generationSource)
    {
      v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_generationQueue);
      generationSource = self->_generationSource;
      self->_generationSource = v8;

      dispatch_source_set_timer((dispatch_source_t)self->_generationSource, 0, 0x98968000uLL, 0x98968000uLL);
      objc_initWeak(&location, self);
      v10 = self->_generationSource;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __40__HDFakeDataCollector__lock_beginFaking__block_invoke;
      handler[3] = &unk_1E6CECE78;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume((dispatch_object_t)self->_generationSource);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[HDFakeDataCollector _lock_endFaking]((uint64_t)self);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_lock_setupGeneratorsForStartTime:(uint64_t)a1
{
  const os_unfair_lock *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  _HDFakeDataGenerator *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  _HDFakeDataGenerator *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _HDFakeDataGenerator *v32;
  void *v33;
  double v34;
  id v35;
  id v36;
  _HDFakeDataGenerator *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  _QWORD *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  _QWORD *v72;
  void *v73;
  _QWORD *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD *v86;
  void *v87;
  _QWORD *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  void *v97;
  _QWORD *v98;
  void *v99;
  void *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD *v103;
  void *v104;
  _QWORD *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  void *v114;
  _QWORD *v115;
  void *v116;
  void *v117;
  id v118;
  _QWORD *v119;
  void *v120;
  _QWORD *v121;
  id v122;
  _QWORD v123[5];
  const __CFString *aBlock;
  uint64_t v125;
  void *v126;
  void *v127;
  _QWORD *v128;
  _QWORD *v129;
  _QWORD v130[4];
  id v131;
  uint64_t v132;
  const __CFString *v133;
  uint64_t v134;
  _QWORD v135[4];
  id v136;
  uint64_t v137;
  const __CFString *v138;
  uint64_t v139;
  _QWORD v140[4];
  id v141;
  uint64_t v142;
  const __CFString *v143;
  uint64_t v144;
  const __CFString *v145;
  uint64_t v146;
  id (*v147)(uint64_t);
  void *v148;
  id v149;
  uint64_t v150;
  const __CFString *v151;
  uint64_t v152;
  const __CFString *v153;
  uint64_t v154;
  id (*v155)(uint64_t);
  void *v156;
  id v157;
  uint64_t v158;
  const __CFString *v159;
  uint64_t v160;
  const __CFString *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  id v165;
  double v166;
  _QWORD v167[4];
  id v168;
  _QWORD v169[4];
  id v170;
  _QWORD v171[3];
  int v172;
  _QWORD v173[4];
  const __CFString *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  id v178;
  double v179;
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (const os_unfair_lock *)(a1 + 16);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v5;

    v7 = (_QWORD *)objc_msgSend(*(id *)(a1 + 72), "activityType");
    v8 = [_HDFakeDataGenerator alloc];
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const __CFString *)MEMORY[0x1E0C809B0];
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __57__HDFakeDataCollector__lock_setupGeneratorsForStartTime___block_invoke;
    v123[3] = &__block_descriptor_40_e56____HDCollectedSensorDatum__32__0__HKQuantityType_8d16d24l;
    v123[4] = v7;
    v11 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v8, v9, v123, 5.0, a2);
    -[HDFakeDataCollector _lock_addGenerator:](a1, v11);

    os_unfair_lock_assert_owner(v4);
    v12 = [_HDFakeDataGenerator alloc];
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock = v10;
    v125 = 3221225472;
    v126 = __68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke;
    v127 = &__block_descriptor_40_e56____HDCollectedSensorDatum__32__0__HKQuantityType_8d16d24l;
    v128 = v7;
    v14 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v12, v13, &aBlock, 2.56, a2);
    -[HDFakeDataCollector _lock_addGenerator:](a1, v14);

    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A88]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = CFSTR("HKFakedData");
    v161 = (const __CFString *)MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v153, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v10;
    v175 = 3221225472;
    v176 = __68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke_2;
    v177 = &unk_1E6CF9C80;
    v178 = v15;
    v17 = v15;
    -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v17, v16, &v174, 2.56, a2);

    v18 = (unint64_t)v7 - 1;
    switch((unint64_t)v7)
    {
      case 1uLL:
      case 2uLL:
      case 4uLL:
        os_unfair_lock_assert_owner(v4);
        objc_msgSend(*(id *)(a1 + 72), "speed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValueForUnit:", v20);
        v22 = v21;

        v23 = 1.0;
        if (v18 <= 3)
          v23 = dbl_1B7F41068[v18];
        objc_msgSend(*(id *)(a1 + 72), "speed");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValueForUnit:", v25);
        v27 = v26;

        v173[0] = 0;
        v173[1] = v173;
        v173[2] = 0x2020000000;
        v173[3] = 0;
        v171[0] = 0;
        v171[1] = v171;
        v171[2] = 0x2020000000;
        v172 = 0;
        aBlock = v10;
        v125 = 3221225472;
        v126 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke;
        v127 = &unk_1E6CF9CA8;
        v128 = v173;
        v129 = v171;
        v28 = _Block_copy(&aBlock);
        v169[0] = v10;
        v169[1] = 3221225472;
        v169[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_2;
        v169[3] = &unk_1E6CF9CD0;
        v29 = v28;
        v170 = v29;
        v30 = _Block_copy(v169);
        v167[0] = v10;
        v167[1] = 3221225472;
        v167[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_3;
        v167[3] = &unk_1E6CF9CF8;
        v122 = v29;
        v168 = v122;
        v31 = _Block_copy(v167);
        v32 = [_HDFakeDataGenerator alloc];
        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v22 * 2.56;
        v174 = v10;
        v175 = 3221225472;
        v176 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_4;
        v177 = &unk_1E6CF9D20;
        v35 = v31;
        v178 = v35;
        v179 = v34;
        v36 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v32, v33, &v174, 2.56, a2);
        -[HDFakeDataCollector _lock_addGenerator:](a1, v36);

        v37 = [_HDFakeDataGenerator alloc];
        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D78]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = v10;
        v162 = 3221225472;
        v163 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_5;
        v164 = &unk_1E6CF9D20;
        v39 = v30;
        v165 = v39;
        v166 = v34 / v23;
        v40 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v37, v38, &v161, 2.56, a2);
        -[HDFakeDataCollector _lock_addGenerator:](a1, v40);

        if (v7 == (_QWORD *)2)
        {
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D40], v122);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = CFSTR("HKFakedData");
          v160 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = v10;
          v154 = 3221225472;
          v155 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_6;
          v156 = &unk_1E6CF9D48;
          v43 = v41;
          v157 = v43;
          v158 = 0x4069000000000000;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v43, v42, &v153, 2.56, a2);

          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D48]);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v151 = CFSTR("HKFakedData");
          v152 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = v10;
          v146 = 3221225472;
          v147 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_7;
          v148 = &unk_1E6CF9D48;
          v46 = v44;
          v149 = v46;
          v150 = v27;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v46, v45, &v145, 2.56, a2);

          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D50]);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v143 = CFSTR("HKFakedData");
          v144 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v140[0] = v10;
          v140[1] = 3221225472;
          v140[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_8;
          v140[3] = &unk_1E6CF9D48;
          v49 = v47;
          v141 = v49;
          v142 = 0x4052800000000000;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v49, v48, v140, 2.56, a2);

          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D38]);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v138 = CFSTR("HKFakedData");
          v139 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v135[0] = v10;
          v135[1] = 3221225472;
          v135[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_9;
          v135[3] = &unk_1E6CF9D48;
          v52 = v50;
          v136 = v52;
          v137 = 0x4069000000000000;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v52, v51, v135, 2.56, a2);

          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D58]);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v133 = CFSTR("HKFakedData");
          v134 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v130[0] = v10;
          v130[1] = 3221225472;
          v130[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_10;
          v130[3] = &unk_1E6CF9D48;
          v55 = v53;
          v131 = v55;
          v132 = 0x3FBC28F5C28F5C29;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v55, v54, v130, 2.56, a2);

        }
        _Block_object_dispose(v171, 8);
        _Block_object_dispose(v173, 8);
        break;
      case 3uLL:
        objc_msgSend(*(id *)(a1 + 72), "speed");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "doubleValueForUnit:", v57);
        v59 = v58;

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
        v60 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v140[0] = CFSTR("HKFakedData");
        v145 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, v140, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock = v10;
        v125 = 3221225472;
        v126 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke;
        v127 = &unk_1E6CF9D48;
        v128 = v60;
        v129 = v59;
        v62 = v60;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v62, v61, &aBlock, 2.56, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AF0]);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v130[0] = CFSTR("HKFakedData");
        v135[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, v130, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v10;
        v175 = 3221225472;
        v176 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_2;
        v177 = &unk_1E6CF9D48;
        v178 = v63;
        v179 = *(double *)&v59;
        v65 = v63;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v65, v64, &v174, 2.56, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AE8]);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        v167[0] = CFSTR("HKFakedData");
        v169[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v167, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = v10;
        v162 = 3221225472;
        v163 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_3;
        v164 = &unk_1E6CF9D48;
        v165 = v66;
        v166 = 200.0;
        v68 = v66;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v68, v67, &v161, 2.56, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AD8]);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v171[0] = CFSTR("HKFakedData");
        v173[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, v171, 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = v10;
        v154 = 3221225472;
        v155 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_4;
        v156 = &unk_1E6CF9D48;
        v157 = v69;
        v158 = 0x4054000000000000;
        v71 = v69;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v71, v70, &v153, 2.56, a2);

        break;
      case 6uLL:
        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C60]);
        v72 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v135[0] = CFSTR("HKFakedData");
        v140[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v135, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock = v10;
        v125 = 3221225472;
        v126 = __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke;
        v127 = &unk_1E6CF9C80;
        v128 = v72;
        v74 = v72;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v74, v73, &aBlock, 5.0, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D80]);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = *MEMORY[0x1E0CB55C8];
        v145 = CFSTR("HKFakedData");
        v146 = v76;
        v153 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        v154 = (uint64_t)&unk_1E6DFCB48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v145, 2);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v10;
        v175 = 3221225472;
        v176 = __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_212;
        v177 = &unk_1E6CF9C80;
        v178 = v75;
        v78 = v75;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v78, v77, &v174, 5.0, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD0]);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v169[0] = CFSTR("HKFakedData");
        v130[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v169, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = v10;
        v162 = 3221225472;
        v163 = __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_2;
        v164 = &unk_1E6CF9C80;
        v165 = v79;
        v81 = v79;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v81, v80, &v161, 60.0, a2);

        break;
      case 8uLL:
        objc_msgSend(*(id *)(a1 + 72), "speed");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "doubleValueForUnit:", v83);
        v85 = v84;

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C48]);
        v86 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v153 = CFSTR("HKFakedData");
        v161 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v153, 1);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock = v10;
        v125 = 3221225472;
        v126 = __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke;
        v127 = &unk_1E6CF9D48;
        v128 = v86;
        v129 = v85;
        v88 = v86;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v88, v87, &aBlock, 3.0, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CF8]);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        v140[0] = CFSTR("HKFakedData");
        v145 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, v140, 1);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v10;
        v175 = 3221225472;
        v176 = __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke_2;
        v177 = &unk_1E6CF9D48;
        v178 = v89;
        v179 = *(double *)&v85;
        v91 = v89;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v91, v90, &v174, 3.0, a2);

        break;
      case 9uLL:
        objc_msgSend(*(id *)(a1 + 72), "speed");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "doubleValueForUnit:", v93);
        v95 = v94;

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C58]);
        v96 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v161 = CFSTR("HKFakedData");
        v174 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v161, 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock = v10;
        v125 = 3221225472;
        v126 = __64__HDFakeDataCollector__lock_setupSkatingSportsGeneratorsAtTime___block_invoke;
        v127 = &unk_1E6CF9D48;
        v128 = v96;
        v129 = v95;
        v98 = v96;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v98, v97, &aBlock, 3.0, a2);

        break;
      case 0xAuLL:
        objc_msgSend(*(id *)(a1 + 72), "speed");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "doubleValueForUnit:", v100);
        v102 = v101;

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C50]);
        v103 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v153 = CFSTR("HKFakedData");
        v161 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v153, 1);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock = v10;
        v125 = 3221225472;
        v126 = __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke;
        v127 = &unk_1E6CF9D48;
        v128 = v103;
        v129 = v102;
        v105 = v103;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v105, v104, &aBlock, 3.0, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D30]);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        v140[0] = CFSTR("HKFakedData");
        v145 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, v140, 1);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v10;
        v175 = 3221225472;
        v176 = __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke_2;
        v177 = &unk_1E6CF9D48;
        v178 = v106;
        v179 = *(double *)&v102;
        v108 = v106;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v108, v107, &v174, 3.0, a2);

        break;
      case 0xBuLL:
        objc_msgSend(*(id *)(a1 + 72), "speed");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "doubleValueForUnit:", v110);
        v112 = v111;

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C30]);
        v113 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v153 = CFSTR("HKFakedData");
        v161 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v153, 1);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock = v10;
        v125 = 3221225472;
        v126 = __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke;
        v127 = &unk_1E6CF9D48;
        v128 = v113;
        v129 = v112;
        v115 = v113;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v115, v114, &aBlock, 3.0, a2);

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AD0]);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        v140[0] = CFSTR("HKFakedData");
        v145 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, v140, 1);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v10;
        v175 = 3221225472;
        v176 = __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke_2;
        v177 = &unk_1E6CF9D48;
        v178 = v116;
        v179 = *(double *)&v112;
        v118 = v116;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v118, v117, &v174, 3.0, a2);

        break;
      case 0xCuLL:
        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
        v119 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v161 = CFSTR("HKFakedData");
        v174 = (const __CFString *)MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v161, 1);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock = v10;
        v125 = 3221225472;
        v126 = __65__HDFakeDataCollector__lock_setupDownhillSkiingGeneratorsAtTime___block_invoke;
        v127 = &unk_1E6CF9C80;
        v128 = v119;
        v121 = v119;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v121, v120, &aBlock, 5.0, a2);

        break;
      default:
        return;
    }
  }
}

- (int64_t)datumCount
{
  os_unfair_lock_s *p_lock;
  int64_t datumCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  datumCount = self->_datumCount;
  os_unfair_lock_unlock(p_lock);
  return datumCount;
}

void __40__HDFakeDataCollector__lock_beginFaking__block_invoke(uint64_t a1)
{
  double Current;
  double v2;
  os_unfair_lock_s *WeakRetained;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  Current = CFAbsoluteTimeGetCurrent();
  if (WeakRetained)
  {
    v2 = Current;
    os_unfair_lock_lock(WeakRetained + 4);
    -[HDFakeDataCollector _lock_generateThrough:]((uint64_t)WeakRetained, v2);
    os_unfair_lock_unlock(WeakRetained + 4);
  }

}

- (void)generateForConfiguration:(id)a3 from:(id)a4 to:(id)a5
{
  HDFakeDataCollectorConfiguration *v8;
  id v9;
  id v10;
  HDFakeDataCollectorConfiguration *configuration;
  HDFakeDataCollectorConfiguration *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  HDFakeDataCollectorConfiguration *v17;

  v8 = (HDFakeDataCollectorConfiguration *)a3;
  v9 = a5;
  v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[HDFakeDataCollector _lock_endFaking]((uint64_t)self);
  configuration = self->_configuration;
  self->_configuration = v8;
  v12 = v8;

  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v14 = v13;

  -[HDFakeDataCollector _lock_setupGeneratorsForStartTime:]((uint64_t)self, v14);
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v16 = v15;

  -[HDFakeDataCollector _lock_generateThrough:]((uint64_t)self, v16);
  v17 = self->_configuration;
  self->_configuration = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_generateThrough:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    while (1)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v4 = *(id *)(a1 + 56);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (!v5)
        break;
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (double *)v11;
          if (v11 && *(double *)(v11 + 32) <= a2)
          {
            (*(void (**)(double))(*(_QWORD *)(v11 + 40) + 16))(*(double *)(v11 + 8));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v12[3];
            v14 = v12[4];
            v12[1] = v14;
            v12[4] = v14 + v15;

            if (v13)
            {
              objc_msgSend(*(id *)(a1 + 24), "aggregatorForType:", v10);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v13;
              v7 = 1;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "dataCollector:didCollectSensorData:device:", a1, v17, v18);

              ++*(_QWORD *)(a1 + 64);
            }
          }
          else
          {

            v13 = 0;
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);

      if ((v7 & 1) == 0)
        return;
    }

  }
}

- (void)_lock_addGenerator:(uint64_t)a1
{
  const os_unfair_lock *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (const os_unfair_lock *)(a1 + 16);
  v5 = a2;
  os_unfair_lock_assert_owner(v3);
  if (v5)
    v4 = v5[2];
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v5, v4);

}

HDHeartRateSensorDatum *__57__HDFakeDataCollector__lock_setupGeneratorsForStartTime___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v6;
  HDHeartRateSensorDatum *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HDHeartRateSensorDatum *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = [HDHeartRateSensorDatum alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", a4, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, (double)(int)(arc4random_uniform(dword_1B7F41088[*(_QWORD *)(a1 + 32)]) + dword_1B7F410BC[v12]));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("HKFakedData");
  v18[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](v7, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", v8, v9, v13, v14, 0);

  return v15;
}

HDQuantityDatum *__68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  HDQuantityDatum *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  HDQuantityDatum *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = [HDQuantityDatum alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v7, "canonicalUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 32);
  v14 = 0.0;
  if (v13 <= 0xC)
  {
    if (((1 << v13) & 0x1FC5) != 0)
    {
      v15 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.344 + -0.172;
      v16 = 0.172;
    }
    else if (v13 == 1)
    {
      v15 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.006 + -0.003;
      v16 = 0.033;
    }
    else
    {
      if (v13 != 3)
        goto LABEL_5;
      v15 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.266 + -0.133;
      v16 = 0.133;
    }
    v14 = v15 + v16;
  }
LABEL_5:
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, (a4 - a3) * v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("HKFakedData");
  v22[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](v8, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", v9, v10, v17, v18, 0);

  return v19;
}

id __68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "quantityWithUnit:doubleValue:", v2, (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.0 + 0.033);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_lock_setupFakeGeneratorForQuantityType:(void *)a3 interval:(void *)a4 time:(double)a5 metadata:(double)a6 quantity:
{
  id v11;
  id v12;
  id v13;
  _HDFakeDataGenerator *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a2;
  v14 = [_HDFakeDataGenerator alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__HDFakeDataCollector__lock_setupFakeGeneratorForQuantityType_interval_time_metadata_quantity___block_invoke;
  v18[3] = &unk_1E6CF9D70;
  v15 = v12;
  v20 = v15;
  v16 = v11;
  v19 = v16;
  v17 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v14, v13, v18, a5, a6);

  -[HDFakeDataCollector _lock_addGenerator:](a1, v17);
}

uint64_t __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v3 + 24) != a2)
  {
    *(double *)(v3 + 24) = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = arc4random_uniform(0xFFFFFFFF);
  }
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_2(uint64_t a1, int a2, int a3)
{
  return a2 - a3 + (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() % ((2 * a3) | 1u);
}

double __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_3(uint64_t a1, double a2, double a3, double a4)
{
  return a3 - (a4 - (a4 + a4) * ((double)(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() / 4294967300.0));
}

HDQuantityDatum *__70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_4(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  HDQuantityDatum *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HDQuantityDatum *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = [HDQuantityDatum alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v7, "canonicalUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a4, *(double *)(a1 + 40), *(double *)(a1 + 40) * 0.1);
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("HKFakedData");
  v18[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](v8, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", v9, v10, v13, v14, 0);

  return v15;
}

HDQuantityDatum *__70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_5(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  HDQuantityDatum *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  HDQuantityDatum *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = [HDQuantityDatum alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v7, "canonicalUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a4);
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, (double)(v13 & ~(v13 >> 31)));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("HKFakedData");
  v19[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](v8, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", v9, v10, v14, v15, 0);

  return v16;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "quantityWithUnit:doubleValue:", v2, (double)(int)(arc4random_uniform(3u) + 4));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_212(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "quantityWithUnit:doubleValue:", v2, (double)(int)(arc4random_uniform(7u) + 9));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "quantityWithUnit:doubleValue:", v2, (double)(int)(arc4random_uniform(1u) + 26));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.2- (*(double *)(a1 + 40) * 0.2 + *(double *)(a1 + 40) * 0.2) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __64__HDFakeDataCollector__lock_setupSkatingSportsGeneratorsAtTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __65__HDFakeDataCollector__lock_setupDownhillSkiingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "quantityWithUnit:doubleValue:", v2, (double)(int)(arc4random_uniform(3u) + 4));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)collectedTypes
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[27];

  v31[25] = *MEMORY[0x1E0C80C00];
  v22 = (id)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D78]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v29;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v28;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v27;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C60]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v26;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D80]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v25;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v24;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v21;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A88]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v20;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D48]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v19;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D40]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v18;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D50]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v17;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D38]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v16;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D58]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v15;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AE8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[14] = v14;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AD8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[15] = v13;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AF0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[16] = v2;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[17] = v3;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[18] = v4;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[19] = v5;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[20] = v6;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[21] = v7;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AD0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[22] = v8;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[23] = v9;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[24] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v11);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

HDQuantityDatum *__95__HDFakeDataCollector__lock_setupFakeGeneratorForQuantityType_interval_time_metadata_quantity___block_invoke(uint64_t a1, double a2, double a3)
{
  HDQuantityDatum *v6;
  void *v7;
  void *v8;
  void *v9;
  HDQuantityDatum *v10;

  v6 = [HDQuantityDatum alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](v6, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", v7, v8, v9, *(_QWORD *)(a1 + 32), 0);

  return v10;
}

- (id)sourceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C18], "_localDeviceSource", a3);
}

- (id)identifierForDataAggregator:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

- (void)registerWithAggregators
{
  HDDataCollectorMultiplexer *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  HDDataCollectorMultiplexer *v8;
  os_unfair_lock_s *p_lock;
  HDDataCollectorMultiplexer *multiplexer;
  HKDataCollectorState *v11;
  HDDataCollectorMultiplexer *v12;

  v3 = [HDDataCollectorMultiplexer alloc];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDFakeDataCollector collectedTypes](HDFakeDataCollector, "collectedTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDDataCollectorMultiplexer initForCollector:identifier:profile:types:](v3, "initForCollector:identifier:profile:types:", self, v5, WeakRetained, v7);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  multiplexer = self->_multiplexer;
  self->_multiplexer = v8;
  v12 = v8;

  v11 = self->_state;
  os_unfair_lock_unlock(p_lock);
  -[HDDataCollectorMultiplexer registerForCollectionWithState:](v12, "registerForCollectionWithState:", v11);

}

- (void)unregisterFromAggregators
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDDataCollectorMultiplexer unregisterForCollection](self->_multiplexer, "unregisterForCollection");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)canResumeCollectionFromLastSensorDatum
{
  return 0;
}

- (HDFakeDataCollectorConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_generatorsByType, 0);
  objc_storeStrong((id *)&self->_generationSource, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_multiplexer, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
