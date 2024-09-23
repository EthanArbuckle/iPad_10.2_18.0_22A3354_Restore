@implementation HKCardioFitnessClassificationUtilities

+ (id)_cardioFitnessLevels
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)_cardioFitnessLookupTable;
  if (!_cardioFitnessLookupTable)
  {
    objc_msgSend(a1, "_queryCoreMotionClassifications");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_storeStrong((id *)&_cardioFitnessLookupTable, v4);
    }
    else
    {
      _HKInitializeLogging();
      v5 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        +[HKCardioFitnessClassificationUtilities _cardioFitnessLevels].cold.1((uint64_t)a1, v5);
      objc_msgSend(a1, "_stubbedCardioFitnessLevelData");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)_cardioFitnessLookupTable;
      _cardioFitnessLookupTable = v6;

    }
    v3 = (void *)_cardioFitnessLookupTable;
  }
  return v3;
}

+ (id)_stubbedCardioFitnessLevelData
{
  HKCardioFitnessLevelData *v2;
  HKCardioFitnessLevelData *v3;
  void *v4;
  HKCardioFitnessLevelData *v5;
  HKCardioFitnessLevelData *v6;
  HKCardioFitnessLevelData *v7;
  HKCardioFitnessLevelData *v8;
  void *v9;
  void *v10;
  void *v11;
  HKCardioFitnessLevelData *v13;
  void *v14;
  HKCardioFitnessLevelData *v15;
  void *v16;
  void *v17;
  HKCardioFitnessLevelData *v18;
  HKCardioFitnessLevelData *v19;
  HKCardioFitnessLevelData *v20;
  HKCardioFitnessLevelData *v21;
  void *v22;
  HKCardioFitnessLevelData *v23;
  HKCardioFitnessLevelData *v24;
  HKCardioFitnessLevelData *v25;
  HKCardioFitnessLevelData *v26;
  void *v27;
  HKCardioFitnessLevelData *v28;
  HKCardioFitnessLevelData *v29;
  HKCardioFitnessLevelData *v30;
  HKCardioFitnessLevelData *v31;
  void *v32;
  HKCardioFitnessLevelData *v33;
  HKCardioFitnessLevelData *v34;
  HKCardioFitnessLevelData *v35;
  HKCardioFitnessLevelData *v36;
  void *v37;
  HKCardioFitnessLevelData *v38;
  HKCardioFitnessLevelData *v39;
  HKCardioFitnessLevelData *v40;
  HKCardioFitnessLevelData *v41;
  void *v42;
  void *v43;
  HKCardioFitnessLevelData *v44;
  HKCardioFitnessLevelData *v45;
  HKCardioFitnessLevelData *v46;
  HKCardioFitnessLevelData *v47;
  void *v48;
  HKCardioFitnessLevelData *v49;
  HKCardioFitnessLevelData *v50;
  HKCardioFitnessLevelData *v51;
  HKCardioFitnessLevelData *v52;
  void *v53;
  HKCardioFitnessLevelData *v54;
  HKCardioFitnessLevelData *v55;
  HKCardioFitnessLevelData *v56;
  HKCardioFitnessLevelData *v57;
  void *v58;
  HKCardioFitnessLevelData *v59;
  HKCardioFitnessLevelData *v60;
  HKCardioFitnessLevelData *v61;
  HKCardioFitnessLevelData *v62;
  void *v63;
  HKCardioFitnessLevelData *v64;
  HKCardioFitnessLevelData *v65;
  HKCardioFitnessLevelData *v66;
  HKCardioFitnessLevelData *v67;
  HKCardioFitnessLevelData *v68;
  HKCardioFitnessLevelData *v69;
  void *v70;
  HKCardioFitnessLevelData *v71;
  HKCardioFitnessLevelData *v72;
  void *v73;
  HKCardioFitnessLevelData *v74;
  HKCardioFitnessLevelData *v75;
  HKCardioFitnessLevelData *v76;
  HKCardioFitnessLevelData *v77;
  HKCardioFitnessLevelData *v78;
  HKCardioFitnessLevelData *v79;
  HKCardioFitnessLevelData *v80;
  HKCardioFitnessLevelData *v81;
  _QWORD v82[4];
  _QWORD v83[4];
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[4];
  _QWORD v91[4];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[4];
  _QWORD v95[4];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[4];
  _QWORD v103[4];
  _QWORD v104[5];
  _QWORD v105[5];
  _QWORD v106[4];
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[4];
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[3];
  _QWORD v119[5];

  v119[3] = *MEMORY[0x1E0C80C00];
  v118[0] = &unk_1E3895278;
  v116[0] = &unk_1E3895290;
  v114[0] = &unk_1E38952A8;
  v67 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 20, 29, 35.0, 45.0);
  v115[0] = v67;
  v114[1] = &unk_1E3895278;
  v66 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 1, 20, 29, 45.0);
  v115[1] = v66;
  v114[2] = &unk_1E38952C0;
  v65 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 1, 20, 29, 55.0);
  v115[2] = v65;
  v114[3] = &unk_1E38952D8;
  v64 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 20, 29, 65.0);
  v115[3] = v64;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v63;
  v116[1] = &unk_1E38952F0;
  v112[0] = &unk_1E38952A8;
  v62 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 30, 39);
  v113[0] = v62;
  v112[1] = &unk_1E3895278;
  v61 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 1, 30, 39, 44.0);
  v113[1] = v61;
  v112[2] = &unk_1E38952C0;
  v60 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 1, 30, 39, 54.0);
  v113[2] = v60;
  v112[3] = &unk_1E38952D8;
  v59 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 30, 39, 64.0);
  v113[3] = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v58;
  v116[2] = &unk_1E3895308;
  v110[0] = &unk_1E38952A8;
  v57 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 40, 49);
  v111[0] = v57;
  v110[1] = &unk_1E3895278;
  v56 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 1, 40, 49, 43.0, 53.0);
  v111[1] = v56;
  v110[2] = &unk_1E38952C0;
  v55 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 1, 40, 49, 53.0, 63.0);
  v111[2] = v55;
  v110[3] = &unk_1E38952D8;
  v54 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 40, 49, 63.0);
  v111[3] = v54;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v53;
  v116[3] = &unk_1E3895320;
  v108[0] = &unk_1E38952A8;
  v52 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 50, 59);
  v109[0] = v52;
  v108[1] = &unk_1E3895278;
  v51 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 1, 50, 59, 42.0, 52.0);
  v109[1] = v51;
  v108[2] = &unk_1E38952C0;
  v50 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 1, 50, 59, 52.0, 62.0);
  v109[2] = v50;
  v108[3] = &unk_1E38952D8;
  v49 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 50, 59, 62.0);
  v109[3] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v117[3] = v48;
  v116[4] = &unk_1E3895338;
  v106[0] = &unk_1E38952A8;
  v47 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 60, 0x7FFFFFFFFFFFFFFFLL, 31.0, 41.0);
  v107[0] = v47;
  v106[1] = &unk_1E3895278;
  v46 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 1, 60, 0x7FFFFFFFFFFFFFFFLL, 41.0, 51.0);
  v107[1] = v46;
  v106[2] = &unk_1E38952C0;
  v45 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 1, 60, 0x7FFFFFFFFFFFFFFFLL, 51.0, 61.0);
  v107[2] = v45;
  v106[3] = &unk_1E38952D8;
  v44 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 60, 0x7FFFFFFFFFFFFFFFLL, 61.0);
  v107[3] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v117[4] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v42;
  v118[1] = &unk_1E38952C0;
  v104[0] = &unk_1E3895290;
  v102[0] = &unk_1E38952A8;
  v41 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 2, 20, 29, 35.0, 45.0);
  v103[0] = v41;
  v102[1] = &unk_1E3895278;
  v40 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 2, 20, 29, 45.0, 55.0);
  v103[1] = v40;
  v102[2] = &unk_1E38952C0;
  v39 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 2, 20, 29, 55.0, 65.0);
  v103[2] = v39;
  v102[3] = &unk_1E38952D8;
  v38 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 2, 20, 29, 65.0, 75.0);
  v103[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v37;
  v104[1] = &unk_1E38952F0;
  v100[0] = &unk_1E38952A8;
  v36 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 2, 30, 39, 34.0, 44.0);
  v101[0] = v36;
  v100[1] = &unk_1E3895278;
  v35 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 2, 30, 39, 44.0, 54.0);
  v101[1] = v35;
  v100[2] = &unk_1E38952C0;
  v34 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 2, 30, 39, 54.0, 64.0);
  v101[2] = v34;
  v100[3] = &unk_1E38952D8;
  v33 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 2, 30, 39, 64.0, 74.0);
  v101[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v32;
  v104[2] = &unk_1E3895308;
  v98[0] = &unk_1E38952A8;
  v31 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 2, 40, 49, 33.0, 43.0);
  v99[0] = v31;
  v98[1] = &unk_1E3895278;
  v30 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 2, 40, 49, 43.0, 53.0);
  v99[1] = v30;
  v98[2] = &unk_1E38952C0;
  v29 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 2, 40, 49, 53.0, 63.0);
  v99[2] = v29;
  v98[3] = &unk_1E38952D8;
  v28 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 2, 40, 49, 63.0, 73.0);
  v99[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v27;
  v104[3] = &unk_1E3895320;
  v96[0] = &unk_1E38952A8;
  v26 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 2, 50, 59, 32.0, 42.0);
  v97[0] = v26;
  v96[1] = &unk_1E3895278;
  v25 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 2, 50, 59, 42.0, 52.0);
  v97[1] = v25;
  v96[2] = &unk_1E38952C0;
  v24 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 2, 50, 59, 52.0, 62.0);
  v97[2] = v24;
  v96[3] = &unk_1E38952D8;
  v23 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 2, 50, 59, 62.0, 72.0);
  v97[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v105[3] = v22;
  v104[4] = &unk_1E3895338;
  v94[0] = &unk_1E38952A8;
  v21 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 2, 60, 0x7FFFFFFFFFFFFFFFLL, 31.0, 41.0);
  v95[0] = v21;
  v94[1] = &unk_1E3895278;
  v20 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 2, 60, 0x7FFFFFFFFFFFFFFFLL, 41.0, 51.0);
  v95[1] = v20;
  v94[2] = &unk_1E38952C0;
  v19 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 2, 60, 0x7FFFFFFFFFFFFFFFLL, 51.0, 61.0);
  v95[2] = v19;
  v94[3] = &unk_1E38952D8;
  v18 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 2, 60, 0x7FFFFFFFFFFFFFFFLL, 61.0, 71.0);
  v95[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v105[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v16;
  v118[2] = &unk_1E38952D8;
  v92[0] = &unk_1E3895290;
  v90[0] = &unk_1E38952A8;
  v15 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 3, 20, 29, 35.0, 45.0);
  v91[0] = v15;
  v90[1] = &unk_1E3895278;
  v75 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 3, 20, 29, 45.0, 55.0);
  v91[1] = v75;
  v90[2] = &unk_1E38952C0;
  v74 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 3, 20, 29, 55.0, 65.0);
  v91[2] = v74;
  v90[3] = &unk_1E38952D8;
  v81 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 3, 20, 29, 65.0, 75.0);
  v91[3] = v81;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v73;
  v92[1] = &unk_1E38952F0;
  v88[0] = &unk_1E38952A8;
  v80 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 3, 30, 39, 34.0, 44.0);
  v89[0] = v80;
  v88[1] = &unk_1E3895278;
  v72 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 3, 30, 39, 44.0, 54.0);
  v89[1] = v72;
  v88[2] = &unk_1E38952C0;
  v71 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 3, 30, 39, 54.0, 64.0);
  v89[2] = v71;
  v88[3] = &unk_1E38952D8;
  v79 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 3, 30, 39, 64.0, 74.0);
  v89[3] = v79;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v70;
  v92[2] = &unk_1E3895308;
  v86[0] = &unk_1E38952A8;
  v78 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 3, 40, 49, 33.0, 43.0);
  v87[0] = v78;
  v86[1] = &unk_1E3895278;
  v69 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 3, 40, 49, 43.0, 53.0);
  v87[1] = v69;
  v86[2] = &unk_1E38952C0;
  v68 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 3, 40, 49, 53.0, 63.0);
  v87[2] = v68;
  v86[3] = &unk_1E38952D8;
  v77 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 3, 40, 49, 63.0, 73.0);
  v87[3] = v77;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v14;
  v92[3] = &unk_1E3895320;
  v84[0] = &unk_1E38952A8;
  v76 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 3, 50, 59, 32.0, 42.0);
  v85[0] = v76;
  v84[1] = &unk_1E3895278;
  v13 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 3, 50, 59, 42.0, 52.0);
  v85[1] = v13;
  v84[2] = &unk_1E38952C0;
  v2 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 3, 50, 59, 52.0, 62.0);
  v85[2] = v2;
  v84[3] = &unk_1E38952D8;
  v3 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 3, 50, 59, 62.0, 72.0);
  v85[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v4;
  v92[4] = &unk_1E3895338;
  v82[0] = &unk_1E38952A8;
  v5 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 3, 60, 0x7FFFFFFFFFFFFFFFLL, 31.0, 41.0);
  v83[0] = v5;
  v82[1] = &unk_1E3895278;
  v6 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 3, 60, 0x7FFFFFFFFFFFFFFFLL, 41.0, 51.0);
  v83[1] = v6;
  v82[2] = &unk_1E38952C0;
  v7 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 3, 60, 0x7FFFFFFFFFFFFFFFLL, 51.0, 61.0);
  v83[2] = v7;
  v82[3] = &unk_1E38952D8;
  v8 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 3, 60, 0x7FFFFFFFFFFFFFFFLL, 61.0, 71.0);
  v83[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_parseCoreMotionClassificationData:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  HKCardioFitnessLevelData *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  HKCardioFitnessLevelData *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  SEL v50;
  id v51;
  void *v52;
  uint64_t v53;
  id obj;
  uint64_t v55;
  void *v56;
  void *context;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "biologicalSex");
    v8 = v7 - 4;
    if ((unint64_t)(v7 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
      v9 = v7;
    else
      v9 = 0;

    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ageLowerBound");
    if (v11 <= 59)
    {
      if (v11 <= 49)
      {
        if (v11 <= 39)
        {
          if (v11 <= 29)
          {
            if (v11 >= 20)
              v12 = 20;
            else
              v12 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v12 = 30;
          }
        }
        else
        {
          v12 = 40;
        }
      }
      else
      {
        v12 = 50;
      }
    }
    else
    {
      v12 = 60;
    }

    v13 = 0;
    if (v8 >= 0xFFFFFFFFFFFFFFFDLL && v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v51 = v5;
      obj = v5;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v14)
      {
        v15 = v14;
        v49 = a1;
        v50 = a2;
        v55 = *(_QWORD *)v60;
        do
        {
          v16 = 0;
          v17 = v12;
          v53 = v15;
          do
          {
            if (*(_QWORD *)v60 != v55)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v16);
            v19 = MEMORY[0x19AEC7968]();
            v20 = objc_msgSend(v18, "biologicalSex");
            if ((unint64_t)(v20 - 1) >= 3)
              v21 = 0;
            else
              v21 = v20;
            v22 = objc_msgSend(v18, "ageLowerBound");
            v23 = 20;
            if (v22 < 20)
              v23 = 0x7FFFFFFFFFFFFFFFLL;
            if (v22 > 29)
              v23 = 30;
            if (v22 > 39)
              v23 = 40;
            if (v22 > 49)
              v23 = 50;
            if (v22 <= 59)
              v12 = v23;
            else
              v12 = 60;
            context = (void *)v19;
            if (v21 != v9)
            {
              if (v21 <= v9)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v50, v49, CFSTR("HKCardioFitnessClassificationUtilities.m"), 303, CFSTR("HKCardioFitnessUtilities: CMVO2MaxClassificationData array must be sorted by biological sex ascending"));

              }
              v24 = (void *)objc_msgSend(v58, "copy");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v24, v25);

              objc_msgSend(v58, "removeAllObjects");
              v26 = (void *)objc_msgSend(v56, "copy");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "setObject:forKeyedSubscript:", v26, v27);

              objc_msgSend(v56, "removeAllObjects");
              v17 = v12;
              v9 = v21;
              v15 = v53;
            }
            if (v12 != v17)
            {
              if (v12 <= v17)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", v50, v49, CFSTR("HKCardioFitnessClassificationUtilities.m"), 320, CFSTR("HKCardioFitnessUtilities: CMVO2MaxClassificationData array must be sorted by age ascending: item != current"));

              }
              v28 = (void *)objc_msgSend(v58, "copy");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v28, v29);

              objc_msgSend(v58, "removeAllObjects");
            }
            v30 = objc_msgSend(v18, "classificationType");
            if (v30 >= 4)
              v31 = -1;
            else
              v31 = v30;
            v32 = [HKCardioFitnessLevelData alloc];
            v33 = v9;
            v34 = objc_msgSend(v18, "ageLowerBound");
            v35 = objc_msgSend(v18, "ageUpperBound");
            objc_msgSend(v18, "vo2MaxLowerBound");
            v37 = v36;
            objc_msgSend(v18, "vo2MaxUpperBound");
            v38 = v34;
            v9 = v33;
            v40 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:](v32, "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", v31, v21, v38, v35, v37, v39);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setObject:forKeyedSubscript:", v40, v41);

            objc_autoreleasePoolPop(context);
            ++v16;
            v17 = v12;
          }
          while (v15 != v16);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v15);
      }

      v44 = (void *)objc_msgSend(v58, "copy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v44, v45);

      v46 = (void *)objc_msgSend(v56, "copy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setObject:forKeyedSubscript:", v46, v47);

      v13 = (void *)objc_msgSend(v52, "copy");
      v5 = v51;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_queryCoreMotionClassifications
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CA56F8]);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke;
  v6[3] = &unk_1E37F19F0;
  v6[4] = &v7;
  v6[5] = a1;
  objc_msgSend(v3, "queryAllClassificationsWithHandler:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    _HKInitializeLogging();
    v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_INFO, "%{public}@: Retrieved all cardio fitness classifications", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_parseCoreMotionClassificationData:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke_cold_1(a1, v12, v6);
  }

}

+ (id)_queryCoreMotionClassificationsForBiologicalSex:(int64_t)a3 age:(int64_t)a4
{
  id v7;
  void *v8;
  int64_t v9;
  id v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v7 = objc_alloc_init(MEMORY[0x1E0CA56F8]);
  v8 = v7;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__36;
  v17 = __Block_byref_object_dispose__36;
  v18 = 0;
  if ((unint64_t)(a3 - 1) >= 3)
    v9 = 0;
  else
    v9 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__HKCardioFitnessClassificationUtilities__queryCoreMotionClassificationsForBiologicalSex_age___block_invoke;
  v12[3] = &unk_1E37F1A18;
  v12[6] = a3;
  v12[7] = a4;
  v12[4] = &v13;
  v12[5] = a1;
  objc_msgSend(v7, "queryClassificationForBiologicalSex:age:handler:", v9, a4, v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __94__HKCardioFitnessClassificationUtilities__queryCoreMotionClassificationsForBiologicalSex_age___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    _HKInitializeLogging();
    v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v15 = 138543875;
      v16 = v8;
      v17 = 2049;
      v18 = v9;
      v19 = 2049;
      v20 = v10;
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_INFO, "%{public}@: Retrieved cardio fitness classifications for biological sex: %{private}ld, age: %{private}ld", (uint8_t *)&v15, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_parseCoreMotionClassificationData:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke_cold_1(a1, v14, v6);
  }

}

+ (id)_flattenedThresholdsForLevelData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count") + 1);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "hk_sortedKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "cardioFitnessLevel"))
        {
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "vo2MaxLowerBound");
          objc_msgSend(v13, "numberWithDouble:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "vo2MaxUpperBound");
        objc_msgSend(v15, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)flattenedCardioFitnessDataForBiologicalSex:(int64_t)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_cardioFitnessLevels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v5 = a3;
  else
    v5 = 3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_sortedKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__HKCardioFitnessClassificationUtilities_flattenedCardioFitnessDataForBiologicalSex___block_invoke;
  v28[3] = &unk_1E37F1A40;
  v9 = v7;
  v29 = v9;
  objc_msgSend(v8, "hk_map:", v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v16);
        v18 = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "rangeValue", (_QWORD)v24));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_flattenedThresholdsForLevelData:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v21);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v11, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __85__HKCardioFitnessClassificationUtilities_flattenedCardioFitnessDataForBiologicalSex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E38952A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", objc_msgSend(v3, "ageLowerBound"), objc_msgSend(v3, "ageUpperBound") - objc_msgSend(v3, "ageLowerBound"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_cardioFitnessLevels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v5 = a3;
  else
    v5 = 3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "allKeys", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hk_allValuesBySortedKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)_cardioFitnessLevelTransitionDatesForDateInterval:(id)a3 biologicalSex:(int64_t)a4 dateOfBirth:(id)a5
{
  id v6;
  id v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  objc_msgSend(v6, "duration");
  if (v8 == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "year");
    v11 = v7;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = xmmword_19A44C020;
    v18 = xmmword_19A44C030;
    v19 = 60;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i != 40; i += 8)
    {
      objc_msgSend(v11, "setYear:", *(_QWORD *)((char *)&v17 + i) + v10, v17, v18, v19, v20);
      objc_msgSend(v12, "dateFromComponents:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "containsDate:", v15))
        objc_msgSend(v13, "addObject:", v15);

    }
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)cardioFitnessPropertiesForDate:(id)a3 healthStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  HKCardioFitnessLookupProperties *v13;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  objc_msgSend(v6, "biologicalSexWithError:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:].cold.2();
  }
  v15 = v8;
  objc_msgSend(v6, "dateOfBirthComponentsWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  if (!v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:].cold.1();
    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  v11 = objc_msgSend(v7, "biologicalSex");
  v12 = objc_msgSend(v9, "hk_ageWithCurrentDate:", v5);
  v13 = objc_alloc_init(HKCardioFitnessLookupProperties);
  -[HKCardioFitnessLookupProperties setAge:](v13, "setAge:", v12);
  -[HKCardioFitnessLookupProperties setBiologicalSex:](v13, "setBiologicalSex:", v11);
LABEL_10:

  return v13;
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3 age:(int64_t)a4
{
  uint64_t v5;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a4 <= 59)
  {
    if (a4 <= 49)
    {
      if (a4 <= 39)
      {
        if (a4 <= 29)
        {
          v5 = 20;
          if (a4 <= 19)
            return 0;
        }
        else
        {
          v5 = 30;
        }
      }
      else
      {
        v5 = 40;
      }
    }
    else
    {
      v5 = 50;
    }
  }
  else
  {
    v5 = 60;
  }
  objc_msgSend(a1, "_cardioFitnessLevels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v8 = a3;
  else
    v8 = 3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;

  return v12;
}

+ (id)cardioFitnessDataForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  objc_msgSend(a1, "cardioFitnessDataForBiologicalSex:age:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = &unk_1E38952A8;
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E38952A8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vo2MaxUpperBound");
    v11 = v10;

    if (v11 <= a3)
    {
      v8 = &unk_1E3895278;
      objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E3895278);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "vo2MaxUpperBound");
      v14 = v13;

      if (v14 <= a3)
      {
        v8 = &unk_1E38952C0;
        objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E38952C0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "vo2MaxUpperBound");
        v17 = v16;

        if (v17 <= a3)
        {
          v8 = &unk_1E38952D8;
          objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E38952D8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "vo2MaxUpperBound");

        }
      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "cardioFitnessDataForBiologicalSex:age:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 date:(id)a4 healthStore:(id)a5
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "cardioFitnessPropertiesForDate:healthStore:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(a1, "cardioFitnessDataForLevel:biologicalSex:age:", a3, objc_msgSend(v7, "biologicalSex"), objc_msgSend(v7, "age"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int64_t)cardioFitnessLevelForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a1, "cardioFitnessDataForVO2Max:biologicalSex:age:", a4, a5, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "cardioFitnessLevel");
  else
    v7 = -1;

  return v7;
}

+ (int64_t)cardioFitnessLevelForVO2MaxSample:(id)a3 inHealthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  int64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cardioFitnessPropertiesForDate:healthStore:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "quantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quantityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "canonicalUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v12);
    v14 = objc_msgSend(a1, "cardioFitnessLevelForVO2Max:biologicalSex:age:", objc_msgSend(v9, "biologicalSex"), objc_msgSend(v9, "age"), v13);

  }
  else
  {
    v14 = -1;
  }

  return v14;
}

+ (id)cardioFitnessLevelDateIntervalsWithDateInterval:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35 = 0;
  objc_msgSend(v7, "biologicalSexWithError:", &v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v35;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:].cold.2();
  }
  v34 = v9;
  objc_msgSend(v7, "dateOfBirthComponentsWithError:", &v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v34;

  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:].cold.1();
    goto LABEL_16;
  }
  if (!v8)
  {
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v29 = v7;
  v27 = v10;
  objc_msgSend(a1, "_cardioFitnessLevelTransitionDatesForDateInterval:biologicalSex:dateOfBirth:", v6, objc_msgSend(v8, "biologicalSex"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "startDate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  v28 = v11;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      v19 = 0;
      v20 = v14;
      do
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v19);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v20, v21);
        objc_msgSend(v13, "addObject:", v22);
        v14 = v21;

        ++v19;
        v20 = v14;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v17);
  }

  v23 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithStartDate:endDate:", v14, v24);

  objc_msgSend(v13, "addObject:", v25);
  v11 = v28;
  v7 = v29;
  v10 = v27;
LABEL_17:

  return v13;
}

+ (id)analyticsStringForLevel:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return &stru_1E37FD4C0;
  else
    return off_1E37F1A60[a3 + 1];
}

+ (void)_cardioFitnessLevels
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "%{public}@: falling back to stubbed cardio fitness level data", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = OUTLINED_FUNCTION_6_0(a1, a2);
  objc_msgSend(a3, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, v4, v6, "%{public}@: Error retrieving cardio fitness classifications from Core Motion: %{public}@", v7);

  OUTLINED_FUNCTION_4_2();
}

+ (void)cardioFitnessPropertiesForDate:healthStore:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Unable to retrieve date of birth: %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)cardioFitnessPropertiesForDate:healthStore:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Unable to retrieve biological sex: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
