@implementation HDDemoDataReproductiveHealthSampleGenerator

- (HDDemoDataReproductiveHealthSampleGenerator)init
{
  HDDemoDataReproductiveHealthSampleGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  result = -[HDDemoDataBaseSampleGenerator init](&v3, sel_init);
  if (result)
  {
    result->_nextSexualActivitySampleTime = 0.0;
    result->_nextCycleDaySampleTime = 0.0;
  }
  return result;
}

- (HDDemoDataReproductiveHealthSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataReproductiveHealthSampleGenerator *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataReproductiveHealthSampleHelperNextSexualActivitySampleTimeKey"));
    v5->_nextSexualActivitySampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataReproductiveHealthSampleHelperNextCycleDaySampleTimeKey"));
    v5->_nextCycleDaySampleTime = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataReproductiveHealthSampleHelperNextSexualActivitySampleTimeKey"), self->_nextSexualActivitySampleTime, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataReproductiveHealthSampleHelperNextCycleDaySampleTimeKey"), self->_nextCycleDaySampleTime);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id obj;
  id obja;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _QWORD v115[16];
  _QWORD v116[18];

  v116[16] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB6F18];
  v9 = a5;
  v10 = a4;
  v88 = a3;
  objc_msgSend(v8, "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v11, "isAppleWatch");

  if (!(_DWORD)a3)
  {
    v61 = v88;
    v62 = v10;
    obja = v9;
    if (!self)
      goto LABEL_69;
    -[HDDemoDataBaseSampleGenerator profile](self, "profile");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v63)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", sel_generatePhoneFirstRunSampleForDemoPerson_firstDate_objectCollection_, self, CFSTR("HDDemoDataReproductiveHealthSampleGenerator.m"), 99, CFSTR("HDProfile must be set"));

    }
    objc_msgSend(v61, "birthDateComponents");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = HDDemoData_ageBetweenNSDateComponentsAndDate(v64, v62);

    if (v65 < 11)
      goto LABEL_69;
    v85 = v9;
    -[HDDemoDataReproductiveHealthSampleGenerator completeOnboardingForDemoPerson:](self);
    objc_msgSend(v62, "dateByAddingTimeInterval:", -7776000.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EF199CE0 != -1)
      dispatch_once(&qword_1EF199CE0, &__block_literal_global_36);
    if (objc_msgSend(v66, "compare:", v62) == -1)
    {
      v87 = v10;
      v68 = 0;
      v69 = *MEMORY[0x1E0CB5588];
      do
      {
        v70 = -[HDDemoDataReproductiveHealthSampleGenerator menstrualFlowForDemoPerson:withSampleDate:]((uint64_t)self, v61, v66);
        if (v71 != 0xFFFFFFFF80000000)
        {
          v72 = v70;
          v73 = v71;
          v115[0] = v69;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v70 == 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v116[0] = v74;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 1);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:metadata:", _MergedGlobals_15, v73, v66, v66, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "addObjectFromPhone:", v76);
          if (!v68 && v72 == 1)
            v68 = v66;

        }
        objc_msgSend(v66, "dateByAddingTimeInterval:", 86400.0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = v67;
      }
      while (objc_msgSend(v67, "compare:", v62) == -1);
      v10 = v87;
      if (v68)
      {
        -[HDDemoDataReproductiveHealthSampleGenerator _computeFirstRunCycleFactorSamplesForDemoPerson:targetDate:](v61, v68);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v85;
        if (v77)
          objc_msgSend(obja, "addObjectsFromPhone:", v77);

        goto LABEL_68;
      }
    }
    else
    {
      v67 = v66;
    }
    v9 = v85;
LABEL_68:

LABEL_69:
    goto LABEL_70;
  }
  v12 = v88;
  v86 = v10;
  v13 = v10;
  v14 = v9;
  if (self && objc_msgSend(v12, "biologicalSex") != 2)
  {
    v82 = v12;
    v84 = v9;
    -[HDDemoDataReproductiveHealthSampleGenerator completeOnboardingForDemoPerson:](self);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF89C0);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF89D8);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF89F0);
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    obj = v15;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v109;
      do
      {
        v22 = 0;
        v23 = v20;
        do
        {
          if (*(_QWORD *)v109 != v21)
            objc_enumerationMutation(obj);
          v20 = *(id *)(*((_QWORD *)&v108 + 1) + 8 * v22);

          objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v20, "intValue")));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDemoDataReproductiveHealthSampleGenerator addMenstruationSampleForDemoPersonFromWatch:date:flow:objectCollection:](v24, 0, 4, v14);

          ++v22;
          v23 = v20;
        }
        while (v19 != v22);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
      }
      while (v19);

    }
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v25 = v16;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v105;
      do
      {
        v30 = 0;
        v31 = v28;
        do
        {
          if (*(_QWORD *)v105 != v29)
            objc_enumerationMutation(v25);
          v28 = *(id *)(*((_QWORD *)&v104 + 1) + 8 * v30);

          objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v28, "intValue")));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDemoDataReproductiveHealthSampleGenerator addMenstruationSampleForDemoPersonFromWatch:date:flow:objectCollection:](v32, 1, 3, v14);

          ++v30;
          v31 = v28;
        }
        while (v27 != v30);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
      }
      while (v27);

    }
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v33 = v17;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    if (v34)
    {
      v35 = v34;
      v36 = 0;
      v37 = *(_QWORD *)v101;
      do
      {
        v38 = 0;
        v39 = v36;
        do
        {
          if (*(_QWORD *)v101 != v37)
            objc_enumerationMutation(v33);
          v36 = *(id *)(*((_QWORD *)&v100 + 1) + 8 * v38);

          objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v36, "intValue")));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDemoDataReproductiveHealthSampleGenerator addMenstruationSampleForDemoPersonFromWatch:date:flow:objectCollection:](v40, 2, 2, v14);

          ++v38;
          v39 = v36;
        }
        while (v35 != v38);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
      }
      while (v35);

    }
    v81 = v33;

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8A08);
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8A20);
    objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4870]);
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48D0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v89 = v41;
    v45 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
    v83 = v25;
    if (v45)
    {
      v46 = v45;
      v79 = v42;
      v47 = 0;
      v48 = *(_QWORD *)v97;
      do
      {
        v49 = 0;
        v50 = v47;
        do
        {
          if (*(_QWORD *)v97 != v48)
            objc_enumerationMutation(v89);
          v47 = *(id *)(*((_QWORD *)&v96 + 1) + 8 * v49);

          objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v47, "intValue")));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDemoDataReproductiveHealthSampleGenerator addSymptomSampleForDemoPersonFromWatch:date:categoryType:objectCollection:]((uint64_t)v51, v43, v14);

          ++v49;
          v50 = v47;
        }
        while (v46 != v49);
        v46 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
      }
      while (v46);

      v25 = v83;
      v42 = v79;
    }
    v80 = (void *)v43;

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v52 = v42;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    if (v53)
    {
      v54 = v53;
      v55 = 0;
      v56 = *(_QWORD *)v93;
      do
      {
        v57 = 0;
        v58 = v55;
        do
        {
          if (*(_QWORD *)v93 != v56)
            objc_enumerationMutation(v52);
          v55 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * v57);

          objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v55, "intValue")));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDemoDataReproductiveHealthSampleGenerator addSymptomSampleForDemoPersonFromWatch:date:categoryType:objectCollection:]((uint64_t)v59, (uint64_t)v44, v14);

          ++v57;
          v58 = v55;
        }
        while (v54 != v57);
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      }
      while (v54);

      v25 = v83;
    }

    v12 = v82;
    -[HDDemoDataReproductiveHealthSampleGenerator _computeFirstRunCycleFactorSamplesForDemoPerson:targetDate:](v82, v13);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      objc_msgSend(v14, "addObjectsFromWatch:", v60);

    v9 = v84;
  }

  v10 = v86;
LABEL_70:

}

- (void)completeOnboardingForDemoPerson:(void *)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id obj;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB6990]);
  v3 = *MEMORY[0x1E0CB5060];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v3, 2, v4, 0, 0);

  v34 = a1;
  objc_msgSend(a1, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onboardingCompletionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  LOBYTE(v4) = objc_msgSend(v7, "insertOnboardingCompletion:error:", v5, &v40);
  v8 = v40;

  if ((v4 & 1) != 0)
  {
    v30 = v8;
    v31 = v5;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "countryCode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB5068];
    v48[0] = *MEMORY[0x1E0CB5070];
    v48[1] = v11;
    v12 = *MEMORY[0x1E0CB5078];
    v48[2] = *MEMORY[0x1E0CB50B0];
    v48[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v16);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6990]), "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v17, 1, v10, v33, 102);
          objc_msgSend(v34, "profile");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "onboardingCompletionManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
          v21 = objc_msgSend(v20, "insertOnboardingCompletion:error:", v18, &v35);
          v22 = v35;

          if ((v21 & 1) == 0)
          {
            _HKInitializeLogging();
            v23 = (void *)*MEMORY[0x1E0CB52C8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
            {
              v24 = v23;
              v25 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v42 = v25;
              v43 = 2114;
              v44 = v17;
              v45 = 2114;
              v46 = v22;
              v26 = v25;
              _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to insert onboarding record for %{public}@: %{public}@", buf, 0x20u);

            }
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      }
      while (v14);
    }

    v8 = v30;
    v5 = v31;
  }
  else
  {
    _HKInitializeLogging();
    v27 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v8;
      _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "Failed to insert Cycle Tracking onboarding completion: %{public}@", buf, 0xCu);
    }
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.private.health.menstrual-cycles"));
  objc_msgSend(v28, "setBool:forKey:", 1, CFSTR("MenstruationNotificationsEnabled"));
  objc_msgSend(v28, "setBool:forKey:", 1, CFSTR("MenstruationProjectionsEnabled"));
  objc_msgSend(v28, "setBool:forKey:", 1, CFSTR("FertileWindowProjectionsEnabled"));
  objc_msgSend(v28, "setBool:forKey:", 1, CFSTR("FertileWindowNotificationsEnabled"));
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("ShouldHideByDisplayTypeIdentifier"));

}

void __115__HDDemoDataReproductiveHealthSampleGenerator_generatePhoneFirstRunSampleForDemoPerson_firstDate_objectCollection___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4920]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v0;

}

- (uint64_t)menstrualFlowForDemoPerson:(void *)a3 withSampleDate:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0C99D48];
    v7 = a2;
    objc_msgSend(v6, "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 16, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "biologicalSex");
    if (v10 == 2)
    {
      v11 = objc_msgSend(v9, "day");
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8A98);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8AB0);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8AC8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "day"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "containsObject:", v15);

      if (v16
        || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "day")),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v13, "containsObject:", v17),
            v17,
            v18))
      {
        v11 = objc_msgSend(v9, "day");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "components:fromDate:", 8, v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v20, "month") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "day"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "containsObject:", v21);

        }
        v11 = objc_msgSend(v9, "day");

      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_computeFirstRunCycleFactorSamplesForDemoPerson:(void *)a1 targetDate:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "biologicalSex") == 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(&unk_1E6DFA8F8, "intValue") - 280);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v6, "intValue")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(&unk_1E6DFA8F8, "intValue")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "birthDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HDDemoData_ageBetweenNSDateComponentsAndDate(v9, v7);

    if (v10 >= 21)
    {
      objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4950]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", v11, 0, v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(&unk_1E6DFA910, "intValue")));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "birthDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HDDemoData_ageBetweenNSDateComponentsAndDate(v14, v13);

    if (v15 >= 18)
    {
      objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4898]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB6378];
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "categorySampleWithType:value:startDate:endDate:", v16, 1, v13, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v19);
    }

  }
  return v5;
}

- (void)addMenstruationSampleForDemoPersonFromWatch:(void *)a1 date:(uint64_t)a2 flow:(uint64_t)a3 objectCollection:(void *)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB6380];
  v8 = *MEMORY[0x1E0CB4920];
  v9 = a4;
  v10 = a1;
  objc_msgSend(v7, "categoryTypeForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CB5588];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 == 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:metadata:", v11, a3, v10, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectFromWatch:", v14);
}

- (void)addSymptomSampleForDemoPersonFromWatch:(void *)a3 date:categoryType:objectCollection:
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB6378];
  v6 = a3;
  objc_msgSend(v5, "categorySampleWithType:value:startDate:endDate:", a2, 0, a1, a1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectFromWatch:", v7);

}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  NSArray *basalBodyTempMultiplierTable;
  NSArray *cervicalMucusTable;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v11, sel_setupWithDemoDataGenerator_, v4);
  basalBodyTempMultiplierTable = self->_basalBodyTempMultiplierTable;
  self->_basalBodyTempMultiplierTable = (NSArray *)&unk_1E6DF8A38;

  cervicalMucusTable = self->_cervicalMucusTable;
  self->_cervicalMucusTable = (NSArray *)&unk_1E6DF8A50;

  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    objc_msgSend(v4, "statisticsSampleGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "demoPerson");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "genericSampleTimeNoiseStdDev");
    objc_msgSend(v7, "computeNoiseFromTime:stdDev:", 0.0, v9);
    self->_nextSexualActivitySampleTime = v10 + 0.923611111;

  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  char v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  id v117;
  double v118;
  uint64_t v119;
  void *v120;
  int v121;
  unint64_t v122;
  void *v123;
  void *v124;
  double v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  char v144;
  void *v145;
  int v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  char v151;
  void *v152;
  id v153;
  id v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  id v163;
  int v164;
  BOOL v165;
  id v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  int v178;
  id v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  id v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  objc_super v197;
  uint64_t v198;
  void *v199;
  uint64_t v200;
  _QWORD v201[3];

  v201[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v197.receiver = self;
  v197.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v197, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v12, v13, a5, a5);
  if (qword_1EF199D28 != -1)
    dispatch_once(&qword_1EF199D28, &__block_literal_global_235);
  objc_msgSend(v12, "dateByAddingTimeInterval:", -86400.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  if (self)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentDateFromCurrentTime:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "birthDateComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HDDemoData_ageBetweenNSDateComponentsAndDate(v18, v17);

    if (v19 < 18 || self->_nextSexualActivitySampleTime > a5)
      goto LABEL_20;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "statisticsSampleGenerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "computeNoiseFromTime:stdDev:", a5, 0.00694444444);
    self->_nextSexualActivitySampleTime = v22 + 1.0 + self->_nextSexualActivitySampleTime;

    objc_msgSend(v15, "sexualActivityProbabilityPercentage");
    v24 = v23;
    objc_msgSend(v15, "sexualActivityProtectionProbabilityPercentage");
    v26 = v25;
    objc_msgSend(v15, "sexualActivityProtectionDocumentationProbabilityPercentage");
    v28 = v27;
    if (objc_msgSend(v15, "sexualActivityIsTryingToConceive"))
    {
      objc_msgSend(v15, "sexualActivityProbabilityPercentage");
      v24 = v29 * 1.5;
      v26 = 0.0;
    }
    if (objc_msgSend(v15, "biologicalSex") == 1)
    {
      v30 = v15;
      if (objc_msgSend(v30, "biologicalSex") == 2)
      {
LABEL_12:

        goto LABEL_13;
      }
      v195 = v14;
      v31 = v13;
      v32 = v12;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "currentDateFromCurrentTime:", a5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "birthDateComponents");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = HDDemoData_ageBetweenNSDateComponentsAndDate(v35, v34);

      if (v36 <= 10)
      {

        v12 = v32;
        v13 = v31;
        v14 = v195;
        goto LABEL_12;
      }
      v128 = (double)-[HDDemoDataReproductiveHealthSampleGenerator _computeNextLuteinizingHormoneSurgeForDemoPerson:atTime:](self, "_computeNextLuteinizingHormoneSurgeForDemoPerson:atTime:", v30, a5);

      v12 = v32;
      v13 = v31;
      v14 = v195;
      if ((double)(uint64_t)a5 == v128 && (objc_msgSend(v30, "sexualActivityIsTryingToConceive") & 1) != 0)
        goto LABEL_14;
    }
LABEL_13:
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "statisticsSampleGenerator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pseudoRandomDoubleFromTime:", a5 * 5.0);
    v40 = v39;

    if (v40 < v24)
    {
LABEL_14:
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "statisticsSampleGenerator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "pseudoRandomDoubleFromTime:", a5 * 6.0);
      v44 = v43;

      if (v44 < 0.1)
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "statisticsSampleGenerator");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "computeNoiseFromTime:stdDev:", a5, 0.0104166667);
        self->_nextSexualActivitySampleTime = self->_nextSexualActivitySampleTime - (v47 + 0.958333333);

      }
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "statisticsSampleGenerator");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "pseudoRandomDoubleFromTime:", a5 * 7.0);
      v51 = v50;

      if (v51 >= v28)
      {
        v56 = &unk_1E6DFAA60;
      }
      else
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "statisticsSampleGenerator");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "pseudoRandomDoubleFromTime:", a5 * 3.0);
        v55 = v54;

        if (v55 >= v26)
          v56 = &unk_1E6DFAA48;
        else
          v56 = &unk_1E6DFAA30;
      }
      goto LABEL_21;
    }
LABEL_20:
    v56 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v56 = 0;
LABEL_22:

  v57 = v56;
  v58 = v57;
  if (v57)
  {
    v59 = objc_msgSend(v57, "intValue");
    if (objc_msgSend(v58, "intValue") == 1)
    {
      v60 = 0;
    }
    else
    {
      v200 = *MEMORY[0x1E0CB55B8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59 == 3);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v201[0] = v61;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v201, &v200, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:metadata:", qword_1EF199CF0, 0, v14, v14, v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectFromPhone:", v62);

  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "currentDateFromCurrentTime:", a5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "birthDateComponents");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = HDDemoData_ageBetweenNSDateComponentsAndDate(v65, v64);

  if (objc_msgSend(v15, "biologicalSex") == 1 && v66 >= 12)
  {
    v194 = v64;
    v196 = v14;
    v67 = v15;
    v68 = v67;
    if (self)
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "currentDateFromCurrentTime:", a5);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v68, "birthDateComponents");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = HDDemoData_ageBetweenNSDateComponentsAndDate(v71, v70);

      if (v72 < 21)
        goto LABEL_35;
      v73 = a5 - (double)(uint64_t)a5;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "statisticsSampleGenerator");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "pseudoRandomDoubleFromTime:", (double)(uint64_t)a5);
      v77 = v76 * 3.0 + 4.0;

      v78 = v77 / 24.0;
      objc_msgSend(v68, "timeIncrement");
      v80 = v73 - v79;
      if (v73 >= v78 && v80 < v78)
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator", v80);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "vitalsSampleGenerator");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "_computeBodyTempInCelsiusForDemoPerson:atTime:addNoise:", v68, 0, a5);
        v86 = v85;

        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "statisticsSampleGenerator");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "bodyTempSampleNoiseStdDev");
        objc_msgSend(v88, "computeNoiseFromTime:stdDev:", a5, v89);
        v91 = v90;

        v92 = (void *)MEMORY[0x1E0CB37E8];
        v93 = __exp10(2.0);
        objc_msgSend(v92, "numberWithDouble:", (double)(uint64_t)((v86 + v91) * v93) / v93);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_35:
        v82 = 0;
      }

      if (v82)
      {
        v94 = (void *)MEMORY[0x1E0CB6A28];
        v95 = qword_1EF199CE8;
        objc_msgSend(v82, "doubleValue");
        objc_msgSend(v94, "quantityWithUnit:doubleValue:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199CF8, v96, v12, v12);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectFromPhone:", v97);

      }
      v193 = v82;
      v98 = v68;
      if (objc_msgSend(v98, "biologicalSex") != 2
        && (objc_msgSend(v98, "biologicalSex") != 1
         || objc_msgSend(v98, "sexualActivityIsTryingToConceive")))
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "currentDateFromCurrentTime:", a5);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v98, "birthDateComponents");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v190 = v100;
        v102 = HDDemoData_ageBetweenNSDateComponentsAndDate(v101, v100);

        if (v102 >= 11)
        {
          v186 = v12;
          v105 = a5 - (double)(uint64_t)a5;
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v106, "isDemoDataTimeInWeekend:calendar:", v107, a5);

          if ((v108 & 1) != 0)
            objc_msgSend(v98, "weekendSleepParameters");
          else
            objc_msgSend(v98, "weekdaySleepParameters");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "wakeUpTime");
          v110 = v109 + 0.00763888889;
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "statisticsSampleGenerator");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "genericSampleTimeNoiseStdDev");
          objc_msgSend(v112, "computeNoiseFromTime:stdDev:", a5, v113 * 0.5);
          v115 = v110 + v114;

          objc_msgSend(v98, "timeIncrement");
          v103 = 0;
          v12 = v186;
          if (v105 >= v115 && v105 - v116 < v115)
          {
            v182 = v58;
            v117 = v13;
            objc_msgSend(v98, "menstrualPeriodFrequency");
            v119 = (uint64_t)v118;
            -[NSArray objectAtIndexedSubscript:](self->_cervicalMucusTable, "objectAtIndexedSubscript:", -[HDDemoDataReproductiveHealthSampleGenerator cycleDayIndexAtTime:demoPerson:](self, "cycleDayIndexAtTime:demoPerson:", v98, a5));
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v120, "intValue");
            v122 = v121;

            if ((v121 & 0xFFFFFFFE) == 2)
            {
              -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "statisticsSampleGenerator");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "pseudoRandomDoubleFromTime:", a5);
              v122 = vcvtpd_s64_f64((double)(int)v122 - v125);

            }
            v126 = (uint64_t)a5 % v119;
            if (v119 >= 0)
              v127 = v119;
            else
              v127 = v119 + 1;
            v12 = v186;
            v13 = v117;
            if (v126 > (v127 >> 1) + 3)
            {
              v58 = v182;
              v103 = 0;
            }
            else
            {
              v58 = v182;
              v103 = 0;
              if (v122)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v122);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
          }

        }
        else
        {
          v103 = 0;
        }

        if (!v103)
        {
          v14 = v196;
          goto LABEL_68;
        }
        v14 = v196;
        objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", qword_1EF199D00, (int)objc_msgSend(v103, "intValue"), v196, v196);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectFromPhone:", v104);
LABEL_67:

LABEL_68:
        if (self->_nextCycleDaySampleTime <= a5)
        {
          v129 = -[HDDemoDataReproductiveHealthSampleGenerator menstrualFlowForDemoPerson:withSampleDate:]((uint64_t)self, v68, v14);
          if (v130 != 0xFFFFFFFF80000000)
          {
            v131 = v130;
            v198 = *MEMORY[0x1E0CB5588];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v129 == 0);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v199 = v132;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
            v133 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:metadata:", qword_1EF199D08, v131, v196, v196, v133);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObjectFromPhone:", v134);

            v14 = v196;
          }
          v191 = v103;
          v135 = v68;
          v136 = v14;
          v185 = v135;
          if (objc_msgSend(v135, "biologicalSex") == 2)
          {
            v137 = 0;
          }
          else
          {
            v183 = v58;
            v138 = v13;
            v187 = v12;
            v139 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8A68);
            v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8A80);
            objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "components:fromDate:", 16, v136);
            v142 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v142, "day"));
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            v144 = objc_msgSend(v139, "containsObject:", v143);

            if ((v144 & 1) != 0)
            {
              v137 = &unk_1E6DFAA48;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v142, "day"));
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              v146 = objc_msgSend(v140, "containsObject:", v145);

              if (v146)
                v137 = &unk_1E6DFAA60;
              else
                v137 = 0;
            }

            v135 = v185;
            v12 = v187;
            v13 = v138;
            v58 = v183;
          }
          v192 = v13;

          v147 = v137;
          v148 = v147;
          if (v147)
          {
            objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", qword_1EF199D10, (int)objc_msgSend(v147, "intValue"), v136, v136);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObjectFromPhone:", v149);

          }
          v188 = v148;
          objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = objc_msgSend(v150, "isAppleWatch");

          if ((v151 & 1) == 0)
          {
            v152 = (void *)MEMORY[0x1E0C99D48];
            v153 = v136;
            v154 = v135;
            objc_msgSend(v152, "currentCalendar");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v155, "components:fromDate:", 16, v153);
            v156 = (void *)objc_claimAutoreleasedReturnValue();

            v157 = objc_msgSend(v154, "biologicalSex");
            v158 = &unk_1E6DFAAD8;
            if (v157 != 2)
            {
              v184 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8AE0);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v156, "day"));
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              v160 = v153;
              v161 = v156;
              v162 = v58;
              v163 = v12;
              v164 = objc_msgSend(v184, "containsObject:", v159);

              v165 = v164 == 0;
              v12 = v163;
              v58 = v162;
              v156 = v161;
              v153 = v160;
              if (!v165)
                v158 = &unk_1E6DFA9B8;

            }
            v166 = v158;
            if (objc_msgSend(v166, "isEqualToNumber:", &unk_1E6DFA9B8))
            {
              objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", qword_1EF199D18, 0, v153, v153);
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v192, "addObjectFromPhone:", v167);

            }
            v135 = v185;
          }
          v168 = v12;
          v169 = (void *)MEMORY[0x1E0C99D48];
          v170 = v136;
          v171 = v135;
          objc_msgSend(v169, "currentCalendar");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "components:fromDate:", 16, v170);
          v173 = (void *)objc_claimAutoreleasedReturnValue();

          v174 = objc_msgSend(v171, "biologicalSex");
          v175 = &unk_1E6DFAAD8;
          if (v174 != 2)
          {
            v176 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6DF8AF8);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v173, "day"));
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v178 = objc_msgSend(v176, "containsObject:", v177);

            if (v178)
              v175 = &unk_1E6DFA9B8;

          }
          v179 = v175;
          v13 = v192;
          if (objc_msgSend(v179, "isEqualToNumber:", &unk_1E6DFA9B8))
          {
            objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", qword_1EF199D20, 0, v170, v170);
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "addObjectFromPhone:", v180);

          }
          self->_nextCycleDaySampleTime = a5 + 1.0;

          v12 = v168;
          v14 = v196;
          v103 = v191;
        }

        v64 = v194;
        goto LABEL_98;
      }
      v103 = 0;
    }
    else
    {

      v181 = v68;
      v103 = 0;
      v193 = 0;
    }
    v104 = v68;
    v14 = v196;
    goto LABEL_67;
  }
LABEL_98:

}

void __121__HDDemoDataReproductiveHealthSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeCelsiusUnit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF199CE8;
  qword_1EF199CE8 = v0;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4970]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EF199CF0;
  qword_1EF199CF0 = v2;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A80]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1EF199CF8;
  qword_1EF199CF8 = v4;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4890]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1EF199D00;
  qword_1EF199D00 = v6;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4920]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1EF199D08;
  qword_1EF199D08 = v8;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4940]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1EF199D10;
  qword_1EF199D10 = v10;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4870]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1EF199D18;
  qword_1EF199D18 = v12;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48D0]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)qword_1EF199D20;
  qword_1EF199D20 = v14;

}

- (int64_t)cycleDayIndexAtTime:(double)a3 demoPerson:(id)a4
{
  id v6;
  int64_t v7;
  double v8;
  double v9;

  v6 = a4;
  v7 = -[HDDemoDataReproductiveHealthSampleGenerator _computeNextLuteinizingHormoneSurgeForDemoPerson:atTime:](self, "_computeNextLuteinizingHormoneSurgeForDemoPerson:atTime:", v6, a3)+ 1;
  objc_msgSend(v6, "menstrualPeriodFrequency");
  v9 = v8;

  return (uint64_t)a3 % (uint64_t)v9 + v7 / (uint64_t)v9 * (uint64_t)v9 - v7 + 15;
}

- (id)_basalBodyTempMultiplier
{
  return self->_basalBodyTempMultiplierTable;
}

- (int64_t)_computeNextLuteinizingHormoneSurgeForDemoPerson:(id)a3 atTime:(double)a4
{
  id v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  objc_msgSend(v5, "menstrualPeriodFrequency");
  v7 = (uint64_t)(v6 * 0.5 + -1.0);
  objc_msgSend(v5, "menstrualPeriodFrequency");
  v9 = (double)(uint64_t)((double)(uint64_t)a4 / v8);
  objc_msgSend(v5, "menstrualPeriodFrequency");
  v11 = v10;

  return (uint64_t)(v11 * v9) + v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cervicalMucusTable, 0);
  objc_storeStrong((id *)&self->_basalBodyTempMultiplierTable, 0);
}

@end
