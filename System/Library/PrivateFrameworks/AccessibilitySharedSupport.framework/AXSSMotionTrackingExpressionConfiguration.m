@implementation AXSSMotionTrackingExpressionConfiguration

- (AXSSMotionTrackingExpressionConfiguration)init
{
  AXSSMotionTrackingExpressionConfiguration *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *facialExpressionToSensitivity;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSSMotionTrackingExpressionConfiguration;
  v2 = -[AXSSMotionTrackingExpressionConfiguration init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultSensitivitiesForAllFacialExpressions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mutableCopy");
    facialExpressionToSensitivity = v2->__facialExpressionToSensitivity;
    v2->__facialExpressionToSensitivity = (NSMutableDictionary *)v4;

  }
  return v2;
}

+ (id)defaultExpressionConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (AXSSMotionTrackingExpressionConfiguration)initWithPlistDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  AXSSMotionTrackingExpressionConfiguration *v14;
  AXSSMotionTrackingExpressionConfiguration *v15;
  objc_super v17;
  _QWORD v18[4];
  AXSSMotionTrackingExpressionConfiguration *v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  objc_msgSend((id)objc_opt_class(), "_defaultSensitivitiesForAllFacialExpressions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v5, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    NSStringFromSelector(sel__facialExpressionToSensitivity);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v11, v7, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;

    if (!v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __69__AXSSMotionTrackingExpressionConfiguration_initWithPlistDictionary___block_invoke;
        v18[3] = &unk_1E5F98F40;
        v20 = &v22;
        v19 = self;
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);

      }
    }

  }
  v17.receiver = self;
  v17.super_class = (Class)AXSSMotionTrackingExpressionConfiguration;
  v14 = -[AXSSMotionTrackingExpressionConfiguration init](&v17, sel_init);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->__facialExpressionToSensitivity, (id)v23[5]);
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __69__AXSSMotionTrackingExpressionConfiguration_initWithPlistDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
      objc_msgSend(*(id *)(a1 + 32), "_safelySetSensitivity:forFacialExpression:inDictionary:", objc_msgSend(v5, "unsignedIntegerValue"), objc_msgSend(v9, "unsignedIntegerValue"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
  }

}

- (NSDictionary)plistDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AXSSMotionTrackingExpressionConfiguration _facialExpressionToSensitivity](self, "_facialExpressionToSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    -[AXSSMotionTrackingExpressionConfiguration _facialExpressionToSensitivity](self, "_facialExpressionToSensitivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    v14 = 0;
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    NSStringFromSelector(sel__facialExpressionToSensitivity);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v10);

    if (v9)
    {
      AXSSLogForCategory(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AXSSMotionTrackingExpressionConfiguration plistDictionary].cold.1(self, (uint64_t)v9, v11);

    }
  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v12;
}

- (unint64_t)sensitivityForFacialExpression:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  -[AXSSMotionTrackingExpressionConfiguration _facialExpressionToSensitivity](self, "_facialExpressionToSensitivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[AXSSMotionTrackingExpressionConfiguration _facialExpressionToSensitivity](self, "_facialExpressionToSensitivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  return v11;
}

- (void)setSensitivity:(unint64_t)a3 forFacialExpression:(unint64_t)a4
{
  id v7;

  -[AXSSMotionTrackingExpressionConfiguration _facialExpressionToSensitivity](self, "_facialExpressionToSensitivity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingExpressionConfiguration _safelySetSensitivity:forFacialExpression:inDictionary:](self, "_safelySetSensitivity:forFacialExpression:inDictionary:", a3, a4, v7);

}

+ (id)processIncomingExpressions:(id)a3 previousExpressions:(id)a4 expressionConfiguration:(id)a5 startExpressionsOutSet:(id *)a6 endExpressionsOutSet:(id *)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  int v22;
  void *v23;
  float v24;
  void *v25;
  float v26;
  void *v27;
  float v28;
  void *v29;
  float v30;
  void *v31;
  float v32;
  void *v33;
  float v34;
  void *v35;
  float v36;
  void *v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  void *v57;
  double v58;
  double v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  float v69;
  float v70;
  float v71;
  float v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  uint64_t v80;
  int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  _BOOL4 v86;
  _BOOL4 v87;
  _BOOL4 v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  int v110;
  int v111;
  unsigned int v112;
  float v113;
  float v114;
  float v115;
  float v116;
  void *v117;
  float v118;
  _BOOL4 v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  unsigned int v128;
  float v129;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TongueOut"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v127 = v13;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MouthSmileLeft"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v129 = v15;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MouthSmileRight"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v126 = v17;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("JawOpen"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MouthClose"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v110 = v22;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BrowOuterUpLeft"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v123 = v24;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BrowOuterUpRight"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v115 = v26;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EyeBlinkRight"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v121 = v28;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EyeBlinkLeft"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  v120 = v30;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NoseSneerRight"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v118 = v32;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NoseSneerLeft"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v116 = v34;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MouthRight"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  v124 = v36;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MouthLeft"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "floatValue");
  v125 = v38;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MouthPucker"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "floatValue");
  v122 = v40;

  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 4, v9);
  v42 = v41;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 3, v9);
  v113 = v43;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 2, v9);
  v45 = v44;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 1, v9);
  v47 = v46;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 5, v9);
  v49 = v48;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 6, v9);
  v51 = v50;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 7, v9);
  v114 = v52;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 8, v9);
  v54 = v53;
  objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:usingExpressionConfiguration:", 9, v9);
  v56 = v55;
  v117 = v9;
  *((float *)&v105 + 1) = v20;
  if (v20 <= v45)
  {
    v111 = 0;
  }
  else
  {
    v57 = (void *)objc_opt_class();
    *(float *)&v58 = v20;
    LODWORD(v59) = v110;
    v111 = objc_msgSend(v57, "_jawOpenStartingWithValue:mouthClose:expressionConfiguration:", v9, v58, v59);
  }
  v60 = objc_msgSend(v10, "containsObject:", &unk_1E5FA8848);
  v61 = objc_msgSend(v10, "containsObject:", &unk_1E5FA8860);
  v62 = objc_msgSend(v10, "containsObject:", &unk_1E5FA8878);
  v63 = objc_msgSend(v10, "containsObject:", &unk_1E5FA8890);
  v64 = objc_msgSend(v10, "containsObject:", &unk_1E5FA88A8);
  v65 = objc_msgSend(v10, "containsObject:", &unk_1E5FA88C0);
  v66 = objc_msgSend(v10, "containsObject:", &unk_1E5FA88D8);
  v67 = objc_msgSend(v10, "containsObject:", &unk_1E5FA88F0);
  v68 = objc_msgSend(v10, "containsObject:", &unk_1E5FA8908);
  v69 = v113 * 0.61538;
  v70 = v47 * 0.375;
  v71 = v49 * 0.95;
  v72 = v51 * 0.65;
  if (v127 > (float)(v42 * 0.1))
    v73 = v62;
  else
    v73 = 0;
  if (v129 > v69)
    v74 = v60;
  else
    v74 = 0;
  if (v126 > v69)
    v75 = v74;
  else
    v75 = 0;
  if (v123 > v70)
    v76 = v63;
  else
    v76 = 0;
  if (v115 <= v70)
    v76 = 0;
  LODWORD(v105) = v76;
  if (v120 > v71)
    v77 = v64;
  else
    v77 = 0;
  if (v121 > v71)
    v78 = v77;
  else
    v78 = 0;
  if (v116 > v72)
    v79 = v65;
  else
    v79 = 0;
  if (v118 <= v72)
    v79 = 0;
  v107 = v78;
  v108 = v79;
  if (v127 > v42)
    v80 = 1;
  else
    v80 = v73;
  v81 = v111 & ~(_DWORD)v80;
  if (v124 > (float)(v54 * 0.6))
    v82 = v67;
  else
    v82 = 0;
  v112 = v82;
  if (v125 > (float)(v56 * 0.6))
    v83 = v68;
  else
    v83 = 0;
  v128 = v83;
  if (v122 > (float)(v114 * 0.6))
    v84 = v66;
  else
    v84 = 0;
  v109 = v84;
  if (v20 > (float)(v45 * 0.5))
    v85 = v61;
  else
    v85 = 0;
  v86 = v116 > v51;
  if (v118 <= v51)
    v86 = 0;
  v119 = v86;
  v87 = v120 > v49 && v121 > v49;
  v88 = v115 > v47 && v123 > v47;
  v89 = v126 > v113 && v129 > v113;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v105);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v80);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v91, &unk_1E5FA8878);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v89 | v75);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v92, &unk_1E5FA8848);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v81 | v85);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v93, &unk_1E5FA8860);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v88 | v106);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v94, &unk_1E5FA8890);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v87 | v107);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v95, &unk_1E5FA88A8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v119 | v108);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v96, &unk_1E5FA88C0);

  if (v122 > v114)
    v97 = 1;
  else
    v97 = v109;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v98, &unk_1E5FA88D8);

  if (v124 > v54)
    v99 = 1;
  else
    v99 = v112;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v100, &unk_1E5FA88F0);

  if (v125 > v56)
    v101 = 1;
  else
    v101 = v128;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKey:", v102, &unk_1E5FA8908);

  objc_msgSend((id)objc_opt_class(), "_populateExpressionArraysForProcessedExpressions:previousExpressions:startExpressionsOutSet:endExpressionsOutSet:", v90, v10, a6, a7);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  return v103;
}

+ (id)_populateExpressionArraysForProcessedExpressions:(id)a3 previousExpressions:(id)a4 startExpressionsOutSet:(id *)a5 endExpressionsOutSet:(id *)a6
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id *v44;
  id *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  void *v68;
  void *v70;

  v7 = (void *)MEMORY[0x1E0C99E20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "set");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)v10;
  v66 = (void *)v11;
  if (_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__onceToken != -1)
    dispatch_once(&_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__onceToken, &__block_literal_global_3);
  objc_msgSend(v9, "objectForKey:", &unk_1E5FA8878);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA8848);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA8860);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA8890);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA88A8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA88C0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA88D8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA88F0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", &unk_1E5FA8908);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = objc_msgSend(v20, "BOOLValue");
  v21 = objc_msgSend(v8, "containsObject:", &unk_1E5FA8848);
  v22 = objc_msgSend(v8, "containsObject:", &unk_1E5FA8860);
  v23 = objc_msgSend(v8, "containsObject:", &unk_1E5FA8878);
  v24 = objc_msgSend(v8, "containsObject:", &unk_1E5FA8890);
  v25 = objc_msgSend(v8, "containsObject:", &unk_1E5FA88A8);
  v26 = objc_msgSend(v8, "containsObject:", &unk_1E5FA88C0);
  v65 = objc_msgSend(v8, "containsObject:", &unk_1E5FA88D8);
  v61 = objc_msgSend(v8, "containsObject:", &unk_1E5FA88F0);
  v59 = objc_msgSend(v8, "containsObject:", &unk_1E5FA8908);

  if (!v55)
  {
    v30 = v70;
    v29 = v70;
    v27 = v68;
    v28 = v66;
    if (!v21)
      goto LABEL_8;
    goto LABEL_7;
  }
  v27 = v68;
  objc_msgSend(v68, "addObject:", &unk_1E5FA8848);
  v28 = v66;
  v29 = v66;
  v30 = v70;
  if ((v21 & 1) == 0)
LABEL_7:
    objc_msgSend(v29, "addObject:", &unk_1E5FA8848);
LABEL_8:
  if (!v56)
  {
    v31 = v30;
    if (!v22)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(v27, "addObject:", &unk_1E5FA8860);
  v31 = v28;
  if ((v22 & 1) == 0)
LABEL_12:
    objc_msgSend(v31, "addObject:", &unk_1E5FA8860);
LABEL_13:
  if (!v60)
  {
    v32 = v30;
    if (!v23)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(v27, "addObject:", &unk_1E5FA8878);
  v32 = v28;
  if ((v23 & 1) == 0)
LABEL_17:
    objc_msgSend(v32, "addObject:", &unk_1E5FA8878);
LABEL_18:
  if (!v57)
  {
    v33 = v30;
    if (!v24)
      goto LABEL_23;
    goto LABEL_22;
  }
  objc_msgSend(v27, "addObject:", &unk_1E5FA8890);
  v33 = v28;
  if ((v24 & 1) == 0)
LABEL_22:
    objc_msgSend(v33, "addObject:", &unk_1E5FA8890);
LABEL_23:
  if (v58)
  {
    objc_msgSend(v27, "addObject:", &unk_1E5FA88A8);
    if ((v25 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate;
      _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate = v34;

    }
  }
  else if (v25)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeIntervalSinceDate:", _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate);
    v38 = v37;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "timeIntervalSinceDate:", _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate);
    v41 = v40;

    v30 = v70;
    if (v38 >= 0.3 && v41 <= 2.0)
    {
      objc_msgSend(v28, "addObject:", &unk_1E5FA88A8);
      v30 = v70;
      objc_msgSend(v70, "addObject:", &unk_1E5FA88A8);
    }
  }
  if (!v63)
  {
    v42 = v30;
    if (!v26)
      goto LABEL_35;
    goto LABEL_34;
  }
  objc_msgSend(v27, "addObject:", &unk_1E5FA88C0);
  v42 = v28;
  if ((v26 & 1) == 0)
LABEL_34:
    objc_msgSend(v42, "addObject:", &unk_1E5FA88C0);
LABEL_35:
  if (!v62)
  {
    v43 = v30;
    v44 = a6;
    v45 = a5;
    if (!v59)
      goto LABEL_40;
    goto LABEL_39;
  }
  objc_msgSend(v27, "addObject:", &unk_1E5FA8908);
  v43 = v28;
  v44 = a6;
  v45 = a5;
  if ((v59 & 1) == 0)
LABEL_39:
    objc_msgSend(v43, "addObject:", &unk_1E5FA8908);
LABEL_40:
  if (v64)
  {
    objc_msgSend(v27, "addObject:", &unk_1E5FA88F0);
    v46 = v28;
    if ((v61 & 1) != 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  v46 = v30;
  if (v61)
LABEL_44:
    objc_msgSend(v46, "addObject:", &unk_1E5FA88F0);
LABEL_45:
  if ((objc_msgSend(v27, "containsObject:", &unk_1E5FA88F0) & 1) != 0
    || (objc_msgSend(v27, "containsObject:", &unk_1E5FA8908) & 1) != 0
    || ((v54 ^ 1) & 1) != 0)
  {
    if (!v65)
      goto LABEL_54;
    v52 = v30;
LABEL_53:
    objc_msgSend(v52, "addObject:", &unk_1E5FA88D8);
LABEL_54:
    if (!v45)
      goto LABEL_56;
    goto LABEL_55;
  }
  objc_msgSend(v27, "addObject:", &unk_1E5FA88D8);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  v49 = (void *)_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate;
  if ((v65 & 1) != 0)
  {
    objc_msgSend(v47, "timeIntervalSinceDate:", _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate);
    v51 = v50;

    v30 = v70;
    if (v51 <= 0.15)
      goto LABEL_54;
    v52 = v28;
    goto LABEL_53;
  }
  _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate = (uint64_t)v47;

  v30 = v70;
  if (v45)
LABEL_55:
    *v45 = (id)objc_msgSend(v28, "copy");
LABEL_56:
  if (v44)
    *v44 = (id)objc_msgSend(v30, "copy");

  return v27;
}

void __158__AXSSMotionTrackingExpressionConfiguration__populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate;
  _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate = v0;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate;
  _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate = v2;

}

+ ($569BC8A4F588CCDEF576D5B50041512B)convertIncomingExpressionsToExclaveBlendshapesOutput:(SEL)a3
{
  id v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  $569BC8A4F588CCDEF576D5B50041512B *result;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TongueOut"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v48 = v7;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MouthSmileLeft"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v47 = v9;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MouthSmileRight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v46 = v11;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JawOpen"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v45 = v13;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MouthClose"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v44 = v15;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BrowOuterUpLeft"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v43 = v17;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BrowOuterUpRight"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EyeBlinkRight"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v23 = v22;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EyeBlinkLeft"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v26 = v25;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NoseSneerRight"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v29 = v28;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NoseSneerLeft"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  v32 = v31;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MouthRight"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v35 = v34;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MouthLeft"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v38 = v37;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MouthPucker"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "floatValue");
  v41 = v40;

  retstr->var0 = v48;
  retstr->var1 = v47;
  retstr->var2 = v46;
  retstr->var3 = v45;
  retstr->var4 = v44;
  retstr->var5 = v43;
  retstr->var6 = v20;
  retstr->var7 = v23;
  retstr->var8 = v26;
  retstr->var9 = v29;
  retstr->var10 = v32;
  retstr->var11 = v35;
  retstr->var12 = v38;
  retstr->var13 = v41;
  return result;
}

+ (id)processExclaveDetectedExpressions:(id *)a3 previousExpressions:(id)a4 expressionConfiguration:(id)a5 startExpressionsOutSet:(id *)a6 endExpressionsOutSet:(id *)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  void *v59;
  void *v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  unint64_t var8;

  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_class();
  v16 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v16;
  var8 = a3->var8;
  v17 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v17;
  v18 = objc_msgSend(v15, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 4, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v19, &unk_1E5FA8878);

  v20 = (void *)objc_opt_class();
  v21 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v21;
  var8 = a3->var8;
  v22 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v22;
  v23 = objc_msgSend(v20, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 3, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v24, &unk_1E5FA8848);

  v25 = (void *)objc_opt_class();
  v26 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v26;
  var8 = a3->var8;
  v27 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v27;
  v28 = objc_msgSend(v25, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 2, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v29, &unk_1E5FA8860);

  v30 = (void *)objc_opt_class();
  v31 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v31;
  var8 = a3->var8;
  v32 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v32;
  v33 = objc_msgSend(v30, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 1, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v34, &unk_1E5FA8890);

  v35 = (void *)objc_opt_class();
  v36 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v36;
  var8 = a3->var8;
  v37 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v37;
  v38 = objc_msgSend(v35, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 5, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v39, &unk_1E5FA88A8);

  v40 = (void *)objc_opt_class();
  v41 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v41;
  var8 = a3->var8;
  v42 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v42;
  v43 = objc_msgSend(v40, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 6, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v44, &unk_1E5FA88C0);

  v45 = (void *)objc_opt_class();
  v46 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v46;
  var8 = a3->var8;
  v47 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v47;
  v48 = objc_msgSend(v45, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 7, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v49, &unk_1E5FA88D8);

  v50 = (void *)objc_opt_class();
  v51 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v51;
  var8 = a3->var8;
  v52 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v52;
  v53 = objc_msgSend(v50, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 8, &v62, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v54, &unk_1E5FA88F0);

  v55 = (void *)objc_opt_class();
  v56 = *(_OWORD *)&a3->var6;
  v64 = *(_OWORD *)&a3->var4;
  v65 = v56;
  var8 = a3->var8;
  v57 = *(_OWORD *)&a3->var2;
  v62 = *(_OWORD *)&a3->var0;
  v63 = v57;
  v58 = objc_msgSend(v55, "_expressionIsActive:usingExclaveOutput:expressionConfiguration:", 9, &v62, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v59, &unk_1E5FA8908);

  objc_msgSend((id)objc_opt_class(), "_populateExpressionArraysForProcessedExpressions:previousExpressions:startExpressionsOutSet:endExpressionsOutSet:", v14, v13, a6, a7);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

+ (BOOL)_expressionIsActive:(unint64_t)a3 usingExclaveOutput:(id *)a4 expressionConfiguration:(id)a5
{
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  _OWORD v15[4];
  unint64_t var8;

  v7 = objc_msgSend(a5, "sensitivityForFacialExpression:");
  v8 = (void *)objc_opt_class();
  v9 = *(_OWORD *)&a4->var6;
  v15[2] = *(_OWORD *)&a4->var4;
  v15[3] = v9;
  var8 = a4->var8;
  v10 = *(_OWORD *)&a4->var2;
  v15[0] = *(_OWORD *)&a4->var0;
  v15[1] = v10;
  v11 = objc_msgSend(v8, "_activationForFacialExpression:usingExclaveExpressions:", a3, v15);
  v12 = v11 > 1;
  v13 = v11 != 0;
  if (v7 != 1)
    v13 = 0;
  if (v7 != 2)
    v12 = v13;
  if (v7 == 3)
    return v11 > 2;
  else
    return v12;
}

+ (unint64_t)_activationForFacialExpression:(unint64_t)a3 usingExclaveExpressions:(id *)a4
{
  unint64_t result;

  switch(a3)
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 8);
      goto LABEL_11;
    case 3uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 16);
      goto LABEL_11;
    case 4uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 24);
      goto LABEL_11;
    case 5uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 32);
      goto LABEL_11;
    case 6uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 40);
      goto LABEL_11;
    case 7uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 48);
      goto LABEL_11;
    case 8uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 64);
      goto LABEL_11;
    case 9uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 56);
LABEL_11:
      result = a4->var0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AXSSMotionTrackingExpressionConfiguration _facialExpressionToSensitivity](self, "_facialExpressionToSensitivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXSSMotionTrackingExpressionConfiguration _facialExpressionToSensitivity](self, "_facialExpressionToSensitivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel__facialExpressionToSensitivity);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v5, v6);

  }
}

- (AXSSMotionTrackingExpressionConfiguration)initWithCoder:(id)a3
{
  id v4;
  AXSSMotionTrackingExpressionConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSMutableDictionary *facialExpressionToSensitivity;

  v4 = a3;
  v5 = -[AXSSMotionTrackingExpressionConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultSensitivitiesForAllFacialExpressions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel__facialExpressionToSensitivity);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;

      v7 = v13;
    }
    v14 = objc_msgSend(v7, "mutableCopy");
    facialExpressionToSensitivity = v5->__facialExpressionToSensitivity;
    v5->__facialExpressionToSensitivity = (NSMutableDictionary *)v14;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  AXSSMotionTrackingExpressionConfiguration *v4;

  -[AXSSMotionTrackingExpressionConfiguration plistDictionary](self, "plistDictionary", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXSSMotionTrackingExpressionConfiguration initWithPlistDictionary:]([AXSSMotionTrackingExpressionConfiguration alloc], "initWithPlistDictionary:", v3);

  return v4;
}

- (BOOL)isEqualToMotionTrackingExpressionConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSSMotionTrackingExpressionConfiguration plistDictionary](self, "plistDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plistDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSSMotionTrackingExpressionConfiguration plistDictionary](self, "plistDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[AXSSMotionTrackingExpressionConfiguration isEqualToMotionTrackingExpressionConfiguration:](self, "isEqualToMotionTrackingExpressionConfiguration:", v4);

  return v5;
}

+ (id)_defaultSensitivitiesForAllFacialExpressions
{
  if (_defaultSensitivitiesForAllFacialExpressions_onceToken != -1)
    dispatch_once(&_defaultSensitivitiesForAllFacialExpressions_onceToken, &__block_literal_global_49);
  return (id)_defaultSensitivitiesForAllFacialExpressions_facialExpressionToSensitivity;
}

void __89__AXSSMotionTrackingExpressionConfiguration__defaultSensitivitiesForAllFacialExpressions__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[9];
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E08];
  v7[0] = &unk_1E5FA8890;
  v7[1] = &unk_1E5FA8860;
  v8[0] = &unk_1E5FA8860;
  v8[1] = &unk_1E5FA8860;
  v7[2] = &unk_1E5FA8848;
  v1 = (void *)MEMORY[0x1E0CB37E8];
  if (_AXSMossdeepEnabled())
    v2 = 1;
  else
    v2 = 2;
  objc_msgSend(v1, "numberWithUnsignedInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  v8[3] = &unk_1E5FA8860;
  v7[3] = &unk_1E5FA8878;
  v7[4] = &unk_1E5FA88A8;
  v8[4] = &unk_1E5FA8860;
  v8[5] = &unk_1E5FA8860;
  v7[5] = &unk_1E5FA88C0;
  v7[6] = &unk_1E5FA88D8;
  v8[6] = &unk_1E5FA8860;
  v8[7] = &unk_1E5FA8860;
  v7[7] = &unk_1E5FA8908;
  v7[8] = &unk_1E5FA88F0;
  v8[8] = &unk_1E5FA8860;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithDictionary:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_defaultSensitivitiesForAllFacialExpressions_facialExpressionToSensitivity;
  _defaultSensitivitiesForAllFacialExpressions_facialExpressionToSensitivity = v5;

}

- (void)_safelySetSensitivity:(unint64_t)a3 forFacialExpression:(unint64_t)a4 inDictionary:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (a3 - 1 <= 2 && a4 - 1 <= 8)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = a5;
    objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
}

+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 usingExpressionConfiguration:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_facialExpressionToSensitivityToValueMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "sensitivityForFacialExpression:", a3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  return v13;
}

+ (id)_facialExpressionToSensitivityToValueMapping
{
  if (_facialExpressionToSensitivityToValueMapping_onceToken != -1)
    dispatch_once(&_facialExpressionToSensitivityToValueMapping_onceToken, &__block_literal_global_50);
  return (id)_facialExpressionToSensitivityToValueMapping_facialExpressionToSensitivityToValueMapping;
}

void __89__AXSSMotionTrackingExpressionConfiguration__facialExpressionToSensitivityToValueMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[9];
  _QWORD v30[11];

  v30[9] = *MEMORY[0x1E0C80C00];
  v29[0] = &unk_1E5FA8890;
  v27[0] = &unk_1E5FA8890;
  v27[1] = &unk_1E5FA8860;
  v28[0] = &unk_1E5FA9148;
  v28[1] = &unk_1E5FA9158;
  v27[2] = &unk_1E5FA8848;
  v28[2] = &unk_1E5FA9168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  v29[1] = &unk_1E5FA8860;
  v25[0] = &unk_1E5FA8890;
  v25[1] = &unk_1E5FA8860;
  v26[0] = &unk_1E5FA9178;
  v26[1] = &unk_1E5FA9158;
  v25[2] = &unk_1E5FA8848;
  v26[2] = &unk_1E5FA9188;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v9;
  v29[2] = &unk_1E5FA8848;
  v23[0] = &unk_1E5FA8890;
  v23[1] = &unk_1E5FA8860;
  v24[0] = &unk_1E5FA9198;
  v24[1] = &unk_1E5FA91A8;
  v23[2] = &unk_1E5FA8848;
  v24[2] = &unk_1E5FA91B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v8;
  v29[3] = &unk_1E5FA8878;
  v21[0] = &unk_1E5FA8890;
  v21[1] = &unk_1E5FA8860;
  v22[0] = &unk_1E5FA9148;
  v22[1] = &unk_1E5FA91B8;
  v21[2] = &unk_1E5FA8848;
  v22[2] = &unk_1E5FA91C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v7;
  v29[4] = &unk_1E5FA88A8;
  v19[0] = &unk_1E5FA8890;
  v19[1] = &unk_1E5FA8860;
  v20[0] = &unk_1E5FA9158;
  v20[1] = &unk_1E5FA91B8;
  v19[2] = &unk_1E5FA8848;
  v20[2] = &unk_1E5FA91D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v6;
  v29[5] = &unk_1E5FA88C0;
  v17[0] = &unk_1E5FA8890;
  v17[1] = &unk_1E5FA8860;
  v18[0] = &unk_1E5FA91E8;
  v18[1] = &unk_1E5FA91A8;
  v17[2] = &unk_1E5FA8848;
  v18[2] = &unk_1E5FA9188;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v0;
  v29[6] = &unk_1E5FA88D8;
  v15[0] = &unk_1E5FA8890;
  v15[1] = &unk_1E5FA8860;
  v16[0] = &unk_1E5FA91F8;
  v16[1] = &unk_1E5FA9158;
  v15[2] = &unk_1E5FA8848;
  v16[2] = &unk_1E5FA9208;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v1;
  v29[7] = &unk_1E5FA8908;
  v13[0] = &unk_1E5FA8890;
  v13[1] = &unk_1E5FA8860;
  v14[0] = &unk_1E5FA9218;
  v14[1] = &unk_1E5FA9158;
  v13[2] = &unk_1E5FA8848;
  v14[2] = &unk_1E5FA9188;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v2;
  v29[8] = &unk_1E5FA88F0;
  v11[0] = &unk_1E5FA8890;
  v11[1] = &unk_1E5FA8860;
  v12[0] = &unk_1E5FA9218;
  v12[1] = &unk_1E5FA9158;
  v11[2] = &unk_1E5FA8848;
  v12[2] = &unk_1E5FA9188;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_facialExpressionToSensitivityToValueMapping_facialExpressionToSensitivityToValueMapping;
  _facialExpressionToSensitivityToValueMapping_facialExpressionToSensitivityToValueMapping = v4;

}

+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 expressionConfiguration:(id)a5
{
  uint64_t v7;
  float v8;

  v7 = objc_msgSend(a5, "sensitivityForFacialExpression:", 2);
  v8 = a3 - a4;
  if ((unint64_t)(v7 - 1) <= 1)
    return v8 >= 0.05;
  return v8 >= 0.1 && v7 == 3;
}

- (NSMutableDictionary)_facialExpressionToSensitivity
{
  return self->__facialExpressionToSensitivity;
}

- (void)set_facialExpressionToSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->__facialExpressionToSensitivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__facialExpressionToSensitivity, 0);
}

void __96__AXSSMotionTrackingExpressionConfiguration_Exclave__facialExpressionToActivationToValueMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[9];
  _QWORD v30[11];

  v30[9] = *MEMORY[0x1E0C80C00];
  v29[0] = &unk_1E5FA8968;
  v27[0] = &unk_1E5FA8920;
  v27[1] = &unk_1E5FA8938;
  v28[0] = &unk_1E5FA9228;
  v28[1] = &unk_1E5FA9238;
  v27[2] = &unk_1E5FA8950;
  v28[2] = &unk_1E5FA9248;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  v29[1] = &unk_1E5FA8920;
  v25[0] = &unk_1E5FA8920;
  v25[1] = &unk_1E5FA8938;
  v26[0] = &unk_1E5FA9258;
  v26[1] = &unk_1E5FA9238;
  v25[2] = &unk_1E5FA8950;
  v26[2] = &unk_1E5FA9268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v9;
  v29[2] = &unk_1E5FA8938;
  v23[0] = &unk_1E5FA8920;
  v23[1] = &unk_1E5FA8938;
  v24[0] = &unk_1E5FA9278;
  v24[1] = &unk_1E5FA9288;
  v23[2] = &unk_1E5FA8950;
  v24[2] = &unk_1E5FA9298;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v8;
  v29[3] = &unk_1E5FA8950;
  v21[0] = &unk_1E5FA8920;
  v21[1] = &unk_1E5FA8938;
  v22[0] = &unk_1E5FA9228;
  v22[1] = &unk_1E5FA9298;
  v21[2] = &unk_1E5FA8950;
  v22[2] = &unk_1E5FA92A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v7;
  v29[4] = &unk_1E5FA8980;
  v19[0] = &unk_1E5FA8920;
  v19[1] = &unk_1E5FA8938;
  v20[0] = &unk_1E5FA9238;
  v20[1] = &unk_1E5FA9298;
  v19[2] = &unk_1E5FA8950;
  v20[2] = &unk_1E5FA92B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v6;
  v29[5] = &unk_1E5FA8998;
  v17[0] = &unk_1E5FA8920;
  v17[1] = &unk_1E5FA8938;
  v18[0] = &unk_1E5FA92C8;
  v18[1] = &unk_1E5FA9288;
  v17[2] = &unk_1E5FA8950;
  v18[2] = &unk_1E5FA9268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v0;
  v29[6] = &unk_1E5FA89B0;
  v15[0] = &unk_1E5FA8920;
  v15[1] = &unk_1E5FA8938;
  v16[0] = &unk_1E5FA92D8;
  v16[1] = &unk_1E5FA9238;
  v15[2] = &unk_1E5FA8950;
  v16[2] = &unk_1E5FA92E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v1;
  v29[7] = &unk_1E5FA89C8;
  v13[0] = &unk_1E5FA8920;
  v13[1] = &unk_1E5FA8938;
  v14[0] = &unk_1E5FA92F8;
  v14[1] = &unk_1E5FA9238;
  v13[2] = &unk_1E5FA8950;
  v14[2] = &unk_1E5FA9268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v2;
  v29[8] = &unk_1E5FA89E0;
  v11[0] = &unk_1E5FA8920;
  v11[1] = &unk_1E5FA8938;
  v12[0] = &unk_1E5FA92F8;
  v12[1] = &unk_1E5FA9238;
  v11[2] = &unk_1E5FA8950;
  v12[2] = &unk_1E5FA9268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_facialExpressionToActivationToValueMapping_facialExpressionToSensitivityToValueMapping;
  _facialExpressionToActivationToValueMapping_facialExpressionToSensitivityToValueMapping = v4;

}

- (void)plistDictionary
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_facialExpressionToSensitivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AF5CC000, a3, OS_LOG_TYPE_ERROR, "ERROR: Couldn't encode object %@, encountered error: %@", (uint8_t *)&v6, 0x16u);

}

@end
