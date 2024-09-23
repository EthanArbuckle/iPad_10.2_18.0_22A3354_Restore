@implementation LBFAggregator

- (LBFAggregator)init
{
  LBFAggregator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *stateDict;
  NSSet *v5;
  NSSet *usePrivateUpload;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LBFTrialStatusDetector *v11;
  LBFTrialStatusDetector *trialStatusDetector;
  NSString *lastAggregationDateKey;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LBFAggregator;
  v2 = -[LBFAggregator init](&v15, sel_init);
  if (v2)
  {
    LBFLoggingUtilsInit();
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    stateDict = v2->_stateDict;
    v2->_stateDict = v3;

    v5 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    usePrivateUpload = v2->_usePrivateUpload;
    v2->_usePrivateUpload = v5;

    objc_msgSend_fetchEvents(v2, v7, v8, v9, v10);
    v11 = objc_alloc_init(LBFTrialStatusDetector);
    trialStatusDetector = v2->_trialStatusDetector;
    v2->_trialStatusDetector = v11;

    v2->_strictDictChecks = 0;
    lastAggregationDateKey = v2->_lastAggregationDateKey;
    v2->_lastAggregationDateKey = (NSString *)CFSTR("lastAggregationDate");

    v2->_setMLHostMarkerInStateID = 0;
  }
  return v2;
}

- (id)initForMLHost
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;

  v5 = objc_msgSend_init(self, a2, v2, v3, v4);
  v6 = (_BYTE *)v5;
  if (v5)
  {
    v7 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = CFSTR("lastAggregationDate_MLHost");

    v6[9] = 1;
  }
  return v6;
}

- (id)getBucketEndDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_now(MEMORY[0x24BDBCE60], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v5, v6, v7, v8, v9);
  objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x24BDBCE60], v11, v12, v13, v14, (double)(86400 * (uint64_t)(v10 / 86400.0)));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)setUpBuckets
{
  NSMutableArray *v3;
  NSMutableArray *buckets;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  NSMutableArray *v20;
  LBFBucket *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  buckets = self->_buckets;
  self->_buckets = v3;

  objc_msgSend_getBucketEndDate(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_copy(v9, v10, v11, v12, v13);
  for (i = 0; i != 30; ++i)
  {
    v19 = v17;
    objc_msgSend_dateWithTimeInterval_sinceDate_(MEMORY[0x24BDBCE60], v14, (uint64_t)v17, v15, v16, -86400.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_buckets;
    v21 = [LBFBucket alloc];
    v23 = (void *)objc_msgSend_initWithInterval_endTimestamp_index_(v21, v22, (uint64_t)v17, (uint64_t)v19, i);
    objc_msgSend_addObject_(v20, v24, (uint64_t)v23, v25, v26);

  }
  return 1;
}

- (id)getBucketsNotAggregated
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;

  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  v7 = (void *)objc_msgSend_initWithSuiteName_(v3, v4, (uint64_t)CFSTR("LighthouseBitacoraFramework"), v5, v6);
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)self->_lastAggregationDateKey, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend_count(self->_buckets, v13, v14, v15, v16))
  {
    v21 = 0;
    do
    {
      objc_msgSend_objectAtIndex_(self->_buckets, v17, v21, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startTime(v22, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(objc_msgSend_compare_(v11, v28, (uint64_t)v27, v29, v30) + 1) <= 1)
      {
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v31, v21, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v12, v35, (uint64_t)v34, v36, v37);

      }
      ++v21;
    }
    while (objc_msgSend_count(self->_buckets, v38, v39, v40, v41) > v21);
  }
  v42 = (void *)objc_msgSend_copy(v12, v17, v18, v19, v20);

  return v42;
}

- (BOOL)fetchBuckets:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v4);
        v14 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v13), v7, v8, v9, v10);
        objc_msgSend_fetchBucket_(self, v15, v14, v16, v17);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v11);
  }

  return 1;
}

- (id)ensureExperimentEventsHolderInBucket:(id)a3 bucketIndex:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSMutableDictionary *stateDict;
  id v26;
  const char *v27;
  uint64_t v28;
  LBFExperimentEventsHolder *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;

  v6 = a3;
  objc_msgSend_objectAtIndex_(self->_buckets, v7, a4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventTree(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v15, v16, (uint64_t)v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v23 = v19;
  }
  else
  {
    objc_msgSend_objectForKey_(self->_stateDict, v20, (uint64_t)v6, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      stateDict = self->_stateDict;
      v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend_setObject_forKey_(stateDict, v27, (uint64_t)v26, (uint64_t)v6, v28);

    }
    v29 = [LBFExperimentEventsHolder alloc];
    v33 = (void *)objc_msgSend_initWithExperimentOrTaskId_(v29, v30, (uint64_t)v6, v31, v32);
    objc_msgSend_setValue_forKey_(v15, v34, (uint64_t)v33, (uint64_t)v6, v35);
    v23 = v33;

  }
  return v23;
}

- (id)ensureDeploymentEventsHolderInBucket:(id)a3 bucketIndex:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;

  v6 = a3;
  objc_msgSend_experimentIdentifiers(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_5;
  objc_msgSend_experimentIdentifiers(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialExperimentID(v16, v17, v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v43 = CFSTR("null_experiment");
    v52 = CFSTR("null_deployment");
    goto LABEL_7;
  }
  v26 = (void *)v21;
  objc_msgSend_experimentIdentifiers(v6, v22, v23, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialExperimentID(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32 == v37)
  {
LABEL_5:
    v43 = CFSTR("null_experiment");
    v52 = CFSTR("null_deployment");
    goto LABEL_8;
  }
  objc_msgSend_experimentIdentifiers(v6, v12, v13, v14, v15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialExperimentID(v38, v39, v40, v41, v42);
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_experimentIdentifiers(v6, v44, v45, v46, v47);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialDeploymentID(v16, v48, v49, v50, v51);
  v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
  objc_msgSend_bmltIdentifiers(v6, v12, v13, v14, v15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
    goto LABEL_13;
  objc_msgSend_bmltIdentifiers(v6, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialTaskID(v58, v59, v60, v61, v62);
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v68 = (void *)v63;
    objc_msgSend_bmltIdentifiers(v6, v64, v65, v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v69, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v75, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74 == v79)
      goto LABEL_13;
    objc_msgSend_bmltIdentifiers(v6, v54, v80, v81, v57);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v82, v83, v84, v85, v86);
    v87 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_bmltIdentifiers(v6, v88, v89, v90, v91);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v58, v92, v93, v94, v95);
    v96 = objc_claimAutoreleasedReturnValue();

    v52 = (__CFString *)v96;
    v43 = (__CFString *)v87;
  }

LABEL_13:
  objc_msgSend_ensureExperimentEventsHolderInBucket_bucketIndex_(self, v54, (uint64_t)v43, a4, v57);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_stateDict, v98, (uint64_t)v43, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v101, v102, (uint64_t)v52, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v105)
  {
    v109 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend_setObject_forKey_(v101, v110, (uint64_t)v109, (uint64_t)v52, v111);

    objc_msgSend_setObject_forKey_(self->_stateDict, v112, (uint64_t)v101, (uint64_t)v43, v113);
  }
  objc_msgSend_ensureDeploymentEventsHolder_(v97, v106, (uint64_t)v52, v107, v108);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  return v114;
}

- (BOOL)fetchBucket:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t i;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t j;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  NSObject *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  NSSet *v174;
  NSSet *usePrivateUpload;
  id v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t k;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  id v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t m;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  id v222;
  id obj;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  uint8_t v243[128];
  uint8_t buf[4];
  void *v245;
  __int16 v246;
  void *v247;
  __int16 v248;
  void *v249;
  __int16 v250;
  void *v251;
  uint64_t v252;

  v252 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_objectAtIndex_(self->_buckets, a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(self->_buckets, v8, 0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endTime(v11, v12, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_startTime(v7, v17, v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v219 = v7;
  objc_msgSend_endTime(v7, v22, v23, v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v218 = (void *)v16;
  objc_msgSend_dateWithTimeInterval_sinceDate_(MEMORY[0x24BDBCE60], v27, v16, v28, v29, -2419200.0);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_timeZoneWithAbbreviation_(MEMORY[0x24BDBCF38], v32, (uint64_t)CFSTR("UTC"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v31, v36, (uint64_t)v35, v37, v38);

  v220 = v31;
  objc_msgSend_setDateFormat_(v31, v39, (uint64_t)CFSTR("YYYY-MM-dd HH:mm:ss"), v40, v41);
  v42 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v47 = v42;
    objc_msgSend_stringFromDate_(v31, v48, v21, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v220, v52, v26, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v56, a3, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v220, v60, v30, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v245 = v51;
    v246 = 2112;
    v247 = v55;
    v248 = 2112;
    v249 = v59;
    v250 = 2112;
    v251 = v63;
    _os_log_impl(&dword_2402DE000, v47, OS_LOG_TYPE_INFO, "Finding objects between %@ and %@ for Bucket #%@. Trial Start: %@", buf, 0x2Au);

  }
  objc_msgSend_sharedInstance(LBFEventManager, v43, v44, v45, v46);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ensureBiomeManagerMLRuntimed(v64, v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readData_endDate_(v69, v70, v21, v26, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(LBFEventManager, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ensureBiomeManagerLighthouse(v77, v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = (void *)v21;
  objc_msgSend_readData_endDate_(v82, v83, v21, v26, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(LBFEventManager, v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ensureBiomeManagerTrial(v90, v91, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readData_endDate_(v95, v96, v30, v26, v97);
  v213 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(LBFEventManager, v98, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ensureBiomeManagerDprivacyd(v102, v103, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = (void *)v30;
  v216 = (void *)v26;
  objc_msgSend_readData_endDate_(v107, v108, v30, v26, v109);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  v238 = 0u;
  v239 = 0u;
  v236 = 0u;
  v237 = 0u;
  obj = v72;
  v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v110, (uint64_t)&v236, (uint64_t)v243, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v237;
    do
    {
      for (i = 0; i != v112; ++i)
      {
        if (*(_QWORD *)v237 != v113)
          objc_enumerationMutation(obj);
        v115 = *(void **)(*((_QWORD *)&v236 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_trialIdentifiers(v115, v116, v117, v118, v119, v213, v214);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v121, (uint64_t)v120, a3, v122);
          v123 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_appendMlruntimedEvent_(v123, v124, (uint64_t)v115, v125, v126);
        }
      }
      v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v116, (uint64_t)&v236, (uint64_t)v243, 16);
    }
    while (v112);
  }

  v234 = 0u;
  v235 = 0u;
  v232 = 0u;
  v233 = 0u;
  v222 = v85;
  v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v127, (uint64_t)&v232, (uint64_t)v242, 16);
  if (v128)
  {
    v129 = v128;
    v130 = *(_QWORD *)v233;
    do
    {
      for (j = 0; j != v129; ++j)
      {
        if (*(_QWORD *)v233 != v130)
          objc_enumerationMutation(v222);
        v132 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_trialIdentifiers(v132, v133, v134, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v138, (uint64_t)v137, a3, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();

          v141 = (void *)LBFLogContextAggregator;
          if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
          {
            v145 = v141;
            objc_msgSend_description(v132, v146, v147, v148, v149);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v245 = v150;
            _os_log_impl(&dword_2402DE000, v145, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

          }
          objc_msgSend_appendLighthousePluginEvent_(v140, v142, (uint64_t)v132, v143, v144, v213);
          if (objc_msgSend_usePrivateUpload(v132, v151, v152, v153, v154))
          {
            objc_msgSend_trialIdentifiers(v132, v155, v156, v157, v158);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_experimentIdentifiers(v159, v160, v161, v162, v163);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_trialExperimentID(v164, v165, v166, v167, v168);
            v169 = (void *)objc_claimAutoreleasedReturnValue();

            v170 = LBFLogContextAggregator;
            if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v245 = v169;
              _os_log_impl(&dword_2402DE000, v170, OS_LOG_TYPE_INFO, "Adding %@ to usePrivateUpload.", buf, 0xCu);
            }
            objc_msgSend_setByAddingObject_(self->_usePrivateUpload, v171, (uint64_t)v169, v172, v173);
            v174 = (NSSet *)objc_claimAutoreleasedReturnValue();
            usePrivateUpload = self->_usePrivateUpload;
            self->_usePrivateUpload = v174;

          }
        }
      }
      v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v133, (uint64_t)&v232, (uint64_t)v242, 16);
    }
    while (v129);
  }

  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v176 = v213;
  v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v177, (uint64_t)&v228, (uint64_t)v241, 16);
  if (v178)
  {
    v179 = v178;
    v180 = *(_QWORD *)v229;
    do
    {
      for (k = 0; k != v179; ++k)
      {
        if (*(_QWORD *)v229 != v180)
          objc_enumerationMutation(v176);
        v182 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_trialIdentifiers(v182, v183, v184, v185, v186);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v188, (uint64_t)v187, a3, v189);
          v190 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_appendTrialEvent_(v190, v191, (uint64_t)v182, v192, v193);
        }
      }
      v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v183, (uint64_t)&v228, (uint64_t)v241, 16);
    }
    while (v179);
  }
  v221 = v176;

  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v194 = v214;
  v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v224, (uint64_t)v240, 16);
  if (v196)
  {
    v197 = v196;
    v198 = *(_QWORD *)v225;
    do
    {
      for (m = 0; m != v197; ++m)
      {
        if (*(_QWORD *)v225 != v198)
          objc_enumerationMutation(v194);
        v200 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_trialIdentifiers(v200, v201, v202, v203, v204);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v206, (uint64_t)v205, a3, v207);
          v208 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_appendDprivacydEvent_(v208, v209, (uint64_t)v200, v210, v211);
        }
      }
      v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v201, (uint64_t)&v224, (uint64_t)v240, 16);
    }
    while (v197);
  }

  return 1;
}

- (BOOL)fetchEvents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend_setUpBuckets(self, a2, v2, v3, v4);
  if (objc_msgSend_count(self->_buckets, v6, v7, v8, v9))
  {
    v13 = 0;
    do
      objc_msgSend_fetchBucket_(self, v10, v13++, v11, v12);
    while (objc_msgSend_count(self->_buckets, v14, v15, v16, v17) > v13);
  }
  return 1;
}

- (id)getTrialIdentifierFromBMEvent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getTransitionProcessingEventArray:(id)a3 mlRuntimeInCurrentBucket:(BOOL)a4 mlRuntimeInPreviousBucket:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  _BOOL4 v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  id v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  NSObject *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  id v107;
  void *v108;
  NSObject *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v131;
  id obj;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t buf[4];
  void *v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v5 = a5;
  v6 = a4;
  v150 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v131 = v7;
  if (v6 && v5)
  {
    v9 = LBFLogContextAggregator;
    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2402DE000, v9, OS_LOG_TYPE_INFO, "MLRuntime in current, and previous bucket.", buf, 2u);
    }
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v10 = v7;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v141, (uint64_t)v149, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v142;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v142 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v16;
            if (objc_msgSend_eventType(v20, v21, v22, v23, v24) == 3)
              objc_msgSend_addObject_(v8, v25, (uint64_t)v20, v26, v27);

          }
          else
          {
            objc_msgSend_addObject_(v8, v17, (uint64_t)v16, v18, v19);
          }
        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v28, (uint64_t)&v141, (uint64_t)v149, 16);
      }
      while (v13);
    }
  }
  else
  {
    v29 = LBFLogContextAggregator;
    v30 = os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO);
    if (!v6 || v5)
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2402DE000, v29, OS_LOG_TYPE_INFO, "No MLRuntime events in current or previous buckets.", buf, 2u);
      }
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      obj = v7;
      v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v133, (uint64_t)v147, 16);
      if (v71)
      {
        v72 = v71;
        v73 = 0;
        v74 = 0;
        v75 = *(_QWORD *)v134;
        do
        {
          for (j = 0; j != v72; ++j)
          {
            if (*(_QWORD *)v134 != v75)
              objc_enumerationMutation(obj);
            v77 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v78 = v77;
              if (!((objc_msgSend_eventType(v78, v79, v80, v81, v82) != 1) | v73 & 1))
              {
                v87 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2402DE000, v87, OS_LOG_TYPE_INFO, "Saw first Allocation before MlRuntime, filtering future Allocated events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v88, (uint64_t)v78, v89, v90, v131);
                v73 = 1;
              }
              if (!((objc_msgSend_eventType(v78, v83, v84, v85, v86, v131) != 2) | v74 & 1))
              {
                v95 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2402DE000, v95, OS_LOG_TYPE_INFO, "Saw first Activation before MlRuntime, filtering future Activation events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v96, (uint64_t)v78, v97, v98);
                v74 = 1;
              }
              if (objc_msgSend_eventType(v78, v91, v92, v93, v94) == 3)
                objc_msgSend_addObject_(v8, v99, (uint64_t)v78, v100, v101);

            }
            else
            {
              v103 = LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2402DE000, v103, OS_LOG_TYPE_INFO, "Incorrect detection - updating filtering.", buf, 2u);
              }
              v104 = (void *)LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                v105 = v104;
                v106 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v146 = v106;
                v107 = v106;
                _os_log_impl(&dword_2402DE000, v105, OS_LOG_TYPE_INFO, "Event Type: %@", buf, 0xCu);

              }
              v108 = (void *)LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                v109 = v108;
                objc_msgSend_trialIdentifiers(v77, v110, v111, v112, v113);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v146 = v114;
                _os_log_impl(&dword_2402DE000, v109, OS_LOG_TYPE_INFO, "Event Identifiers: %@", buf, 0xCu);

              }
              v115 = (void *)LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                v119 = v115;
                objc_msgSend_timestamp(v77, v120, v121, v122, v123);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v146 = v124;
                _os_log_impl(&dword_2402DE000, v119, OS_LOG_TYPE_INFO, "Event Timestamp: %@", buf, 0xCu);

              }
              objc_msgSend_addObject_(v8, v116, (uint64_t)v77, v117, v118, v131);
              v73 = 1;
              v74 = 1;
            }
          }
          v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v102, (uint64_t)&v133, (uint64_t)v147, 16);
        }
        while (v72);
      }
    }
    else
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2402DE000, v29, OS_LOG_TYPE_INFO, "MLRuntime in current bucket only.", buf, 2u);
      }
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v31 = v7;
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v137, (uint64_t)v148, 16);
      if (v33)
      {
        v34 = v33;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = *(_QWORD *)v138;
        do
        {
          for (k = 0; k != v34; ++k)
          {
            if (*(_QWORD *)v138 != v38)
              objc_enumerationMutation(v31);
            v40 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v44 = v40;
              if (!((objc_msgSend_eventType(v44, v45, v46, v47, v48) != 1) | (v37 | v35) & 1))
              {
                v53 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2402DE000, v53, OS_LOG_TYPE_INFO, "Saw first Allocation before MlRuntime, filtering future Allocated events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v54, (uint64_t)v44, v55, v56, v131);
                v37 = 1;
              }
              if (!((objc_msgSend_eventType(v44, v49, v50, v51, v52, v131) != 2) | (v36 | v35) & 1))
              {
                v61 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2402DE000, v61, OS_LOG_TYPE_INFO, "Saw first Activation before MlRuntime, filtering future Activation events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v62, (uint64_t)v44, v63, v64);
                v36 = 1;
              }
              if (objc_msgSend_eventType(v44, v57, v58, v59, v60) == 3)
                objc_msgSend_addObject_(v8, v65, (uint64_t)v44, v66, v67);

            }
            else
            {
              objc_msgSend_addObject_(v8, v41, (uint64_t)v40, v42, v43);
              if ((v35 & 1) != 0)
              {
                v35 = 1;
              }
              else
              {
                v69 = LBFLogContextEventFiltering;
                v35 = 1;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2402DE000, v69, OS_LOG_TYPE_INFO, "Saw first MLRuntime, filtering future Trial events.", buf, 2u);
                }
              }
            }
          }
          v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v68, (uint64_t)&v137, (uint64_t)v148, 16);
        }
        while (v34);
      }
    }
  }

  v129 = (void *)objc_msgSend_copy(v8, v125, v126, v127, v128);
  return v129;
}

- (id)getAggregatedStatesUpdateTimestamp:(BOOL)a3 skipNullIdentifiers:(BOOL)a4
{
  id v5;
  const char *v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  _BOOL8 v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  _BOOL4 v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  const char *v137;
  uint32_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  int isEqual;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char v157;
  uint64_t v158;
  uint64_t k;
  const char *v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  _BOOL8 v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  LBFAggregator *v206;
  LBFBitacoraStateTransition *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  _BOOL4 setMLHostMarkerInStateID;
  LBFBitacoraStateInfo *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  void *v234;
  uint64_t started;
  void *v236;
  const char *v237;
  uint64_t v238;
  LBFAggregator *v239;
  NSObject *v240;
  id v241;
  const char *v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  char v250;
  uint64_t n;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  double v257;
  double v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  double v268;
  BOOL v269;
  NSObject *v270;
  uint64_t v271;
  uint64_t v272;
  NSObject *v273;
  const char *v274;
  id v275;
  const char *v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  char v284;
  uint64_t m;
  void *v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  double v291;
  double v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  double v302;
  BOOL v303;
  uint64_t v304;
  NSObject *v305;
  NSObject *v306;
  _BOOL4 v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  int v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  id v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  void *v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  NSObject *v362;
  const char *v363;
  uint64_t v364;
  void *v365;
  _BOOL4 v367;
  id v368;
  id v369;
  uint64_t v370;
  void *v371;
  uint64_t v372;
  uint64_t v373;
  id v374;
  uint64_t v375;
  uint64_t v376;
  id v377;
  uint64_t v378;
  id v379;
  LBFStateDetector *v380;
  int v381;
  _BOOL4 v382;
  void *v383;
  int v384;
  void *v385;
  LBFAggregator *v386;
  uint64_t v387;
  void *v388;
  void *v389;
  uint64_t v390;
  uint64_t v391;
  int v392;
  void *v393;
  uint64_t v394;
  NSMutableDictionary *obj;
  id obja;
  uint64_t v397;
  void *v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  uint64_t v402;
  void *v403;
  char v404;
  char v405[15];
  char v406;
  char v407[15];
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  char v416;
  char v417[15];
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  char v422;
  char v423[15];
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  _BYTE v444[128];
  _BYTE v445[128];
  void *v446;
  void *v447;
  uint8_t v448[128];
  uint8_t buf[4];
  uint64_t v450;
  __int16 v451;
  void *v452;
  _BYTE v453[128];
  _BYTE v454[128];
  _BYTE v455[128];
  _BYTE v456[128];
  _BYTE v457[128];
  uint64_t v458;

  v382 = a4;
  v367 = a3;
  v458 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v440 = 0u;
  v441 = 0u;
  v442 = 0u;
  v443 = 0u;
  obj = self->_stateDict;
  v399 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v440, (uint64_t)v457, 16);
  v401 = v5;
  v386 = self;
  if (v399)
  {
    v397 = *(_QWORD *)v441;
    do
    {
      for (i = 0; i != v399; ++i)
      {
        if (*(_QWORD *)v441 != v397)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v440 + 1) + 8 * i);
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v402 = v8;
        objc_msgSend_objectForKey_(self->_stateDict, v10, v8, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v13, v14, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v436 = 0u;
        v437 = 0u;
        v438 = 0u;
        v439 = 0u;
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v436, (uint64_t)v456, 16);
        if (v20)
        {
          v23 = v20;
          v24 = *(_QWORD *)v437;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v437 != v24)
                objc_enumerationMutation(v18);
              v26 = *(_QWORD *)(*((_QWORD *)&v436 + 1) + 8 * j);
              objc_msgSend_setObject_forKey_(v9, v21, (uint64_t)&unk_25109D648, v26, v22);
              objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v27, 0, v28, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v13, v31, (uint64_t)v30, v26, v32);

            }
            v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v436, (uint64_t)v456, 16);
          }
          while (v23);
        }
        v5 = v401;
        objc_msgSend_setObject_forKey_(v401, v21, (uint64_t)v9, v402, v22);

        self = v386;
      }
      v399 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v440, (uint64_t)v457, 16);
    }
    while (v399);
  }

  objc_msgSend_getBucketsNotAggregated(self, v34, v35, v36, v37);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v39 = v38;
    objc_msgSend_description(v371, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v450 = (uint64_t)v44;
    _os_log_impl(&dword_2402DE000, v39, OS_LOG_TYPE_INFO, "To aggregate: %@", buf, 0xCu);

  }
  v368 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v380 = objc_alloc_init(LBFStateDetector);
  v432 = 0u;
  v433 = 0u;
  v434 = 0u;
  v435 = 0u;
  objc_msgSend_reverseObjectEnumerator(self->_buckets, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v49, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v369 = v54;
  v56 = v382;
  v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v432, (uint64_t)v455, 16);
  if (v372)
  {
    v370 = *(_QWORD *)v433;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v433 != v370)
          objc_enumerationMutation(v369);
        v373 = v61;
        v62 = *(void **)(*((_QWORD *)&v432 + 1) + 8 * v61);
        objc_msgSend_flattenEvents(v62, v57, v58, v59, v60);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v374 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v428 = 0u;
        v429 = 0u;
        v430 = 0u;
        v431 = 0u;
        v377 = v63;
        v376 = objc_msgSend_countByEnumeratingWithState_objects_count_(v377, v64, (uint64_t)&v428, (uint64_t)v454, 16);
        if (v376)
        {
          v375 = *(_QWORD *)v429;
          do
          {
            v68 = 0;
            do
            {
              if (*(_QWORD *)v429 != v375)
                objc_enumerationMutation(v377);
              v378 = v68;
              v69 = *(void **)(*((_QWORD *)&v428 + 1) + 8 * v68);
              if (!objc_msgSend_isEqualToString_(v69, v65, (uint64_t)CFSTR("null_experiment"), v66, v67))
                goto LABEL_33;
              v70 = LBFLogContextAggregator;
              v71 = os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO);
              if (!v56)
              {
                if (v71)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2402DE000, v70, OS_LOG_TYPE_INFO, "Including null exp in aggregation.", buf, 2u);
                }
LABEL_33:
                objc_msgSend_objectForKey_(v377, v65, (uint64_t)v69, v66, v67);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v379 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                objc_msgSend_objectForKey_(self->_stateDict, v73, (uint64_t)v69, v74, v75);
                v388 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(self->_stateDict, v76, (uint64_t)v69, v77, v78);
                v79 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v79)
                {
                  v80 = LBFLogContextAggregator;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v450 = (uint64_t)v69;
                    _os_log_impl(&dword_2402DE000, v80, OS_LOG_TYPE_INFO, "%@ not in state dict.", buf, 0xCu);
                  }
                }
                v426 = 0u;
                v427 = 0u;
                v424 = 0u;
                v425 = 0u;
                obja = v72;
                v391 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v81, (uint64_t)&v424, (uint64_t)v453, 16);
                if (!v391)
                {
LABEL_142:

                  objc_msgSend_setObject_forKey_(self->_stateDict, v316, (uint64_t)v388, (uint64_t)v69, v317);
                  v322 = (void *)objc_msgSend_copy(v379, v318, v319, v320, v321);
                  objc_msgSend_setObject_forKey_(v374, v323, (uint64_t)v322, (uint64_t)v69, v324);

                  goto LABEL_143;
                }
                v390 = *(_QWORD *)v425;
                v394 = (uint64_t)v69;
                while (2)
                {
                  v85 = 0;
LABEL_39:
                  if (*(_QWORD *)v425 != v390)
                    objc_enumerationMutation(obja);
                  v86 = *(_QWORD *)(*((_QWORD *)&v424 + 1) + 8 * v85);
                  if (v56
                    && objc_msgSend_isEqualToString_(v69, v82, (uint64_t)CFSTR("null_deployment"), v83, v84))
                  {
                    v87 = LBFLogContextAggregator;
                    v5 = v401;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2402DE000, v87, OS_LOG_TYPE_INFO, "Skipping aggregation for null deployment.", buf, 2u);
                    }
LABEL_140:
                    if (++v85 == v391)
                    {
                      v391 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v82, (uint64_t)&v424, (uint64_t)v453, 16);
                      if (!v391)
                        goto LABEL_142;
                      continue;
                    }
                    goto LABEL_39;
                  }
                  break;
                }
                v400 = v85;
                objc_msgSend_objectForKey_(v388, v82, v86, v83, v84);
                v88 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v88)
                {
                  v92 = LBFLogContextAggregator;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v450 = v86;
                    v451 = 2112;
                    v452 = v69;
                    _os_log_impl(&dword_2402DE000, v92, OS_LOG_TYPE_INFO, "%@ not in Experiment '%@' State Dict.", buf, 0x16u);
                  }
                }
                objc_msgSend_objectForKey_(self->_stateDict, v89, (uint64_t)v69, v90, v91);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v93, v94, v86, v95, v96);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                v392 = objc_msgSend_intValue(v97, v98, v99, v100, v101);

                objc_msgSend_objectForKey_(obja, v102, v86, v103, v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend_count(v105, v106, v107, v108, v109))
                {
                  v85 = v400;
                  v5 = v401;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                    sub_240314540(&v404, v405);
                  goto LABEL_139;
                }
                v113 = v86;
                v398 = v105;
                objc_msgSend_objectAtIndex_(v105, v110, 0, v111, v112);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_getTrialIdentifierFromBMEvent_(self, v115, (uint64_t)v114, v116, v117);
                v118 = objc_claimAutoreleasedReturnValue();

                v122 = v401;
                if (!v118 && os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                  sub_2403145B8(&v422, v423);
                v403 = (void *)v118;
                objc_msgSend_objectForKey_(v401, v119, (uint64_t)v69, v120, v121);
                v123 = (void *)objc_claimAutoreleasedReturnValue();

                if (v123)
                {
                  objc_msgSend_objectForKey_(v401, v124, (uint64_t)v69, v125, v126);
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKey_(v127, v128, v113, v129, v130);
                  v131 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v131)
                  {
                    v135 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v450 = v113;
                      v451 = 2112;
                      v452 = v69;
                      v136 = v135;
                      v137 = "%@ not in MLRuntime Status '%@' Dict.";
                      v138 = 22;
                      goto LABEL_60;
                    }
                  }
                }
                else
                {
                  v139 = LBFLogContextAggregator;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v450 = (uint64_t)v69;
                    v136 = v139;
                    v137 = "%@ not in MLRuntime status dict.";
                    v138 = 12;
LABEL_60:
                    _os_log_impl(&dword_2402DE000, v136, OS_LOG_TYPE_INFO, v137, buf, v138);
                  }
                }
                objc_msgSend_objectForKey_(v401, v132, (uint64_t)v69, v133, v134);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v140, v141, v113, v142, v143);
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                isEqual = objc_msgSend_isEqual_(v144, v145, (uint64_t)&unk_25109D648, v146, v147);

                if (isEqual)
                {
                  v420 = 0u;
                  v421 = 0u;
                  v418 = 0u;
                  v419 = 0u;
                  v152 = v398;
                  v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v152, v153, (uint64_t)&v418, (uint64_t)v448, 16);
                  if (v154)
                  {
                    v155 = v154;
                    v156 = v113;
                    v157 = 0;
                    v158 = *(_QWORD *)v419;
                    do
                    {
                      for (k = 0; k != v155; ++k)
                      {
                        if (*(_QWORD *)v419 != v158)
                          objc_enumerationMutation(v152);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            continue;
                        }
                        v157 = 1;
                      }
                      v155 = objc_msgSend_countByEnumeratingWithState_objects_count_(v152, v160, (uint64_t)&v418, (uint64_t)v448, 16);
                    }
                    while (v155);

                    self = v386;
                    v56 = v382;
                    v69 = (void *)v394;
                    v113 = v156;
                    v122 = v401;
                    if ((v157 & 1) != 0)
                    {
                      objc_msgSend_objectForKey_(v401, v149, v394, v150, v151);
                      v152 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKey_(v152, v161, (uint64_t)&unk_25109D660, v113, v162);
                      objc_msgSend_setObject_forKey_(v401, v163, (uint64_t)v152, v394, v164);
                      goto LABEL_75;
                    }
                  }
                  else
                  {
                    v69 = (void *)v394;
LABEL_75:

                  }
                }
                v165 = v122;
                v166 = v56;
                v167 = isEqual ^ 1u;
                objc_msgSend_objectForKey_(v165, v149, (uint64_t)v69, v150, v151);
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v168, v169, v113, v170, v171);
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                v176 = objc_msgSend_isEqual_(v172, v173, (uint64_t)&unk_25109D660, v174, v175);

                v105 = v398;
                v384 = v176;
                objc_msgSend_getTransitionProcessingEventArray_mlRuntimeInCurrentBucket_mlRuntimeInPreviousBucket_(self, v177, (uint64_t)v398, v176, v167);
                v178 = objc_claimAutoreleasedReturnValue();
                v389 = (void *)v178;
                if (!v403)
                {
                  v69 = (void *)v394;
                  v56 = v166;
                  self = v386;
                  v85 = v400;
                  v5 = v401;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                    sub_240314568(&v406, v407);
                  goto LABEL_138;
                }
                v182 = (void *)v178;
                v387 = v113;
                objc_msgSend_IsEmptyTrialIdentifiers_(LBFUtils, v179, (uint64_t)v403, v180, v181);
                v381 = v392;
                if (objc_msgSend_count(v182, v183, v184, v185, v186))
                {
                  objc_msgSend_startTime(v62, v187, v188, v189, v190);
                  v191 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_processEventsStartingFromState_bucketStartTime_events_(v380, v192, v392, (uint64_t)v191, (uint64_t)v182);
                  v193 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_objectAtIndex_(v193, v194, 0, v195, v196);
                  v197 = (void *)objc_claimAutoreleasedReturnValue();
                  v202 = (int)objc_msgSend_intValue(v197, v198, v199, v200, v201);

                  objc_msgSend_objectAtIndex_(v193, v203, 1, v204, v205);
                  v393 = (void *)objc_claimAutoreleasedReturnValue();
                  v206 = v386;
                }
                else
                {
                  v207 = [LBFBitacoraStateTransition alloc];
                  objc_msgSend_startTime(v62, v208, v209, v210, v211);
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  v206 = v386;
                  if ((_DWORD)v176)
                  {
                    v213 = (void *)objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v207, v212, 19, v392, (uint64_t)v193, 0.0);
                    v447 = v213;
                    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v214, (uint64_t)&v447, 1, v215);
                    v393 = (void *)objc_claimAutoreleasedReturnValue();

                    v202 = 19;
                  }
                  else
                  {
                    v216 = (void *)objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v207, v212, 18, v392, (uint64_t)v193, 0.0);
                    v446 = v216;
                    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v217, (uint64_t)&v446, 1, v218);
                    v393 = (void *)objc_claimAutoreleasedReturnValue();

                    v202 = 18;
                  }
                }

                objc_msgSend_getTrialStatus_deploymentId_(v206->_trialStatusDetector, v219, v394, v387, v220);
                v221 = objc_claimAutoreleasedReturnValue();
                setMLHostMarkerInStateID = v206->_setMLHostMarkerInStateID;
                v223 = [LBFBitacoraStateInfo alloc];
                objc_msgSend_startTime(v62, v224, v225, v226, v227);
                v228 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_endTime(v62, v229, v230, v231, v232);
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                v383 = (void *)v221;
                if (setMLHostMarkerInStateID)
                {
                  v105 = v398;
                  started = objc_msgSend_initWithBitcoraStateMLHost_bucketStartTime_bucketEndTime_observedTrialStatus_bitacoraStateTransitions_bitacoraEvents_(v223, v233, (uint64_t)v403, (uint64_t)v228, (uint64_t)v234, v221, v393, v398);
                }
                else
                {
                  v105 = v398;
                  started = objc_msgSend_initWithBitcoraState_bucketStartTime_bucketEndTime_observedTrialStatus_bitacoraStateTransitions_bitacoraEvents_(v223, v233, (uint64_t)v403, (uint64_t)v228, (uint64_t)v234, v221, v393, v398);
                }
                v236 = (void *)started;

                v85 = v400;
                v239 = v206;
                v385 = v236;
                if (v236)
                {
                  v69 = (void *)v394;
                  if (v202 == 2)
                  {
                    v410 = 0u;
                    v411 = 0u;
                    v408 = 0u;
                    v409 = 0u;
                    v275 = v105;
                    v277 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v276, (uint64_t)&v408, (uint64_t)v444, 16);
                    if (v277)
                    {
                      v282 = v277;
                      v283 = *(_QWORD *)v409;
                      v284 = 1;
                      do
                      {
                        for (m = 0; m != v282; ++m)
                        {
                          if (*(_QWORD *)v409 != v283)
                            objc_enumerationMutation(v275);
                          objc_msgSend_timestamp(*(void **)(*((_QWORD *)&v408 + 1) + 8 * m), v278, v279, v280, v281);
                          v286 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_timeIntervalSince1970(v286, v287, v288, v289, v290);
                          v292 = v291;
                          objc_msgSend_startTime(v62, v293, v294, v295, v296);
                          v297 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_timeIntervalSince1970(v297, v298, v299, v300, v301);
                          v303 = v292 <= v302;

                          v284 &= v303;
                        }
                        v282 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v278, (uint64_t)&v408, (uint64_t)v444, 16);
                      }
                      while (v282);

                      if ((v284 & 1) == 0)
                      {
                        v202 = 2;
                        v239 = v386;
                        v69 = (void *)v394;
                        v105 = v398;
                        v85 = v400;
                        goto LABEL_135;
                      }
                      v202 = 19;
                      v239 = v386;
                      v69 = (void *)v394;
                      v85 = v400;
                    }
                    else
                    {

                      v202 = 19;
                    }
                    v105 = v398;
                    goto LABEL_132;
                  }
                  if (v202 == 1)
                  {
                    v240 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2402DE000, v240, OS_LOG_TYPE_INFO, "Emitting allocated.", buf, 2u);
                    }
                    v414 = 0u;
                    v415 = 0u;
                    v412 = 0u;
                    v413 = 0u;
                    v241 = v105;
                    v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v242, (uint64_t)&v412, (uint64_t)v445, 16);
                    if (v243)
                    {
                      v248 = v243;
                      v249 = *(_QWORD *)v413;
                      v250 = 1;
                      do
                      {
                        for (n = 0; n != v248; ++n)
                        {
                          if (*(_QWORD *)v413 != v249)
                            objc_enumerationMutation(v241);
                          objc_msgSend_timestamp(*(void **)(*((_QWORD *)&v412 + 1) + 8 * n), v244, v245, v246, v247);
                          v252 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_timeIntervalSince1970(v252, v253, v254, v255, v256);
                          v258 = v257;
                          objc_msgSend_startTime(v62, v259, v260, v261, v262);
                          v263 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_timeIntervalSince1970(v263, v264, v265, v266, v267);
                          v269 = v258 <= v268;

                          v250 &= v269;
                        }
                        v248 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v244, (uint64_t)&v412, (uint64_t)v445, 16);
                      }
                      while (v248);

                      v239 = v386;
                      v105 = v398;
                      v85 = v400;
                      if ((v250 & 1) == 0)
                      {
                        v270 = LBFLogContextAggregator;
                        if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_2402DE000, v270, OS_LOG_TYPE_INFO, "Events in question from current bucket.", buf, 2u);
                        }
                        v69 = (void *)v394;
                        if (v384)
                        {
                          v271 = LBFLogContextAggregator;
                          if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)buf = 0;
                            v273 = v271;
                            v274 = "Allocated in current bucket, but seen MLRuntime - Activated Idle State.";
                            goto LABEL_125;
                          }
                          goto LABEL_126;
                        }
                        v202 = 1;
LABEL_135:
                        v304 = v387;
LABEL_136:
                        objc_msgSend_setObject_forKey_(v379, v237, (uint64_t)v385, v304, v238);
                        objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v308, v202, v309, v310);
                        v311 = objc_claimAutoreleasedReturnValue();
                        v312 = v304;
                        v313 = (void *)v311;
                        objc_msgSend_setObject_forKey_(v388, v314, v311, v312, v315);

LABEL_137:
                        v56 = v382;
                        self = v239;
                        v5 = v401;
LABEL_138:

LABEL_139:
                        goto LABEL_140;
                      }
                    }
                    else
                    {

                    }
                    v305 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2402DE000, v305, OS_LOG_TYPE_INFO, "All events from previous bucket.", buf, 2u);
                    }
                    v306 = LBFLogContextAggregator;
                    v307 = os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO);
                    v69 = (void *)v394;
                    if (v384)
                    {
                      if (v307)
                      {
                        *(_WORD *)buf = 0;
                        v273 = v306;
                        v274 = "Seen MLRuntime - must be Activated Idle.";
LABEL_125:
                        _os_log_impl(&dword_2402DE000, v273, OS_LOG_TYPE_INFO, v274, buf, 2u);
                      }
LABEL_126:
                      v202 = 19;
                    }
                    else
                    {
                      if (v307)
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_2402DE000, v306, OS_LOG_TYPE_INFO, "No MLRuntime - must be Allocated Idle.", buf, 2u);
                      }
                      v202 = 18;
                    }
LABEL_132:
                    v304 = v387;
                    objc_msgSend_setLatestState_(v385, v237, v202, v272, v238);
                    goto LABEL_136;
                  }
                  if (v202 != 3)
                    goto LABEL_135;
                  v304 = v387;
                  if (v381 != 3)
                    goto LABEL_136;
                }
                else
                {
                  v69 = (void *)v394;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                    sub_240314590(&v416, v417);
                }

                goto LABEL_137;
              }
              if (v71)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2402DE000, v70, OS_LOG_TYPE_INFO, "Skipping aggregation for null experiment.", buf, 2u);
              }
LABEL_143:
              v68 = v378 + 1;
            }
            while (v378 + 1 != v376);
            v376 = objc_msgSend_countByEnumeratingWithState_objects_count_(v377, v65, (uint64_t)&v428, (uint64_t)v454, 16);
          }
          while (v376);
        }

        v325 = (void *)MEMORY[0x24BDD16E0];
        v330 = objc_msgSend_bucketIndex(v62, v326, v327, v328, v329);
        objc_msgSend_numberWithUnsignedInteger_(v325, v331, v330, v332, v333);
        v334 = (void *)objc_claimAutoreleasedReturnValue();
        v338 = objc_msgSend_containsObject_(v371, v335, (uint64_t)v334, v336, v337);

        if (v338)
        {
          v343 = (void *)objc_msgSend_copy(v374, v339, v340, v341, v342);
          objc_msgSend_addObject_(v368, v344, (uint64_t)v343, v345, v346);

        }
        v61 = v373 + 1;
      }
      while (v373 + 1 != v372);
      v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v369, v57, (uint64_t)&v432, (uint64_t)v455, 16);
    }
    while (v372);
  }

  v347 = objc_alloc(MEMORY[0x24BDBCF50]);
  v355 = (void *)objc_msgSend_initWithSuiteName_(v347, v348, (uint64_t)CFSTR("LighthouseBitacoraFramework"), v349, v350);
  if (v367)
  {
    objc_msgSend_objectAtIndex_(self->_buckets, v351, 0, v353, v354);
    v356 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endTime(v356, v357, v358, v359, v360);
    v361 = (void *)objc_claimAutoreleasedReturnValue();

    v362 = LBFLogContextAggregator;
    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v450 = (uint64_t)v361;
      _os_log_impl(&dword_2402DE000, v362, OS_LOG_TYPE_INFO, "Setting aggregation timestamp to: %@", buf, 0xCu);
    }
    objc_msgSend_setObject_forKey_(v355, v363, (uint64_t)v361, (uint64_t)self->_lastAggregationDateKey, v364);

  }
  v365 = (void *)objc_msgSend_copy(v368, v351, v352, v353, v354);

  return v365;
}

- (BOOL)dumpFetchedEvents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  unint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_count(self->_buckets, a2, v2, v3, v4))
  {
    v10 = 0;
    *(_QWORD *)&v9 = 138412546;
    v58 = v9;
    do
    {
      objc_msgSend_objectAtIndex_(self->_buckets, v6, v10, v7, v8, v58);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_eventTree(v11, v12, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_count(v16, v17, v18, v19, v20);

      if (v21)
      {
        v22 = (void *)LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          v27 = v22;
          objc_msgSend_startTime(v11, v28, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endTime(v11, v33, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v58;
          v65 = v32;
          v66 = 2112;
          v67 = v37;
          _os_log_impl(&dword_2402DE000, v27, OS_LOG_TYPE_INFO, "Bucket from %@ to %@", buf, 0x16u);

        }
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend_eventTree(v11, v23, v24, v25, v26);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v38, v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v59, (uint64_t)v63, 16);
        if (v45)
        {
          v50 = v45;
          v51 = *(_QWORD *)v60;
          do
          {
            v52 = 0;
            do
            {
              if (*(_QWORD *)v60 != v51)
                objc_enumerationMutation(v43);
              objc_msgSend_dumpFetchedEvents(*(void **)(*((_QWORD *)&v59 + 1) + 8 * v52++), v46, v47, v48, v49);
            }
            while (v50 != v52);
            v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v59, (uint64_t)v63, 16);
          }
          while (v50);
        }

      }
      ++v10;
    }
    while (objc_msgSend_count(self->_buckets, v53, v54, v55, v56) > v10);
  }
  return 1;
}

- (id)fetchedEventsInDictionaries
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend_count(self->_buckets, v4, v5, v6, v7))
  {
    v12 = 0;
    *(_QWORD *)&v11 = 138412546;
    v64 = v11;
    do
    {
      objc_msgSend_objectAtIndex_(self->_buckets, v8, v12, v9, v10, v64);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_eventTree(v13, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_count(v18, v19, v20, v21, v22);

      if (v23)
      {
        v24 = (void *)LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          v29 = v24;
          objc_msgSend_startTime(v13, v30, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endTime(v13, v35, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v64;
          v71 = v34;
          v72 = 2112;
          v73 = v39;
          _os_log_impl(&dword_2402DE000, v29, OS_LOG_TYPE_INFO, "Bucket from %@ to %@", buf, 0x16u);

        }
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend_eventTree(v13, v25, v26, v27, v28);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v40, v41, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v65, (uint64_t)v69, 16);
        if (v47)
        {
          v52 = v47;
          v53 = *(_QWORD *)v66;
          do
          {
            v54 = 0;
            do
            {
              if (*(_QWORD *)v66 != v53)
                objc_enumerationMutation(v45);
              objc_msgSend_fetchedEventsInDictionaries(*(void **)(*((_QWORD *)&v65 + 1) + 8 * v54), v48, v49, v50, v51);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObjectsFromArray_(v3, v56, (uint64_t)v55, v57, v58);

              ++v54;
            }
            while (v52 != v54);
            v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v65, (uint64_t)v69, 16);
          }
          while (v52);
        }

      }
      ++v12;
    }
    while (objc_msgSend_count(self->_buckets, v59, v60, v61, v62) > v12);
  }
  return v3;
}

- (BOOL)upload
{
  return MEMORY[0x24BEDD108](self, sel_upload_uploadRawEvents_skipNullIdentifiers_, 1, 0, 0);
}

- (BOOL)isInternal
{
  return os_variant_has_internal_content();
}

- (double)getRandomCoinFlip
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], a2, v2, v3, v4);
  srand48(v5);
  return drand48();
}

- (BOOL)upload:(BOOL)a3 uploadRawEvents:(BOOL)a4 skipNullIdentifiers:(BOOL)a5
{
  _BOOL4 v5;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BOOL4 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  double v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v70 = a4;
  v5 = a3;
  v88 = *MEMORY[0x24BDAC8D0];
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend_getAggregatedStatesUpdateTimestamp_skipNullIdentifiers_(self, a2, a3, a5, a5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v79, (uint64_t)v87, 16);
  if (v64)
  {
    v63 = *(_QWORD *)v80;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v80 != v63)
          objc_enumerationMutation(obj);
        v65 = v12;
        v13 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v12);
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        objc_msgSend_allValues(v13, v8, v9, v10, v11);
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v14, (uint64_t)&v75, (uint64_t)v86, 16);
        if (v68)
        {
          v67 = *(_QWORD *)v76;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v76 != v67)
                objc_enumerationMutation(v66);
              v69 = v19;
              v20 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v19);
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v74 = 0u;
              objc_msgSend_allValues(v20, v15, v16, v17, v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v71, (uint64_t)v85, 16);
              if (v23)
              {
                v28 = v23;
                v29 = *(_QWORD *)v72;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v72 != v29)
                      objc_enumerationMutation(v21);
                    v31 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                    objc_msgSend_trialIdentifiers(v31, v24, v25, v26, v27);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_experimentIdentifiers(v32, v33, v34, v35, v36);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_trialExperimentID(v37, v38, v39, v40, v41);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!objc_msgSend_containsObject_(self->_usePrivateUpload, v43, (uint64_t)v42, v44, v45))goto LABEL_19;
                    if ((objc_msgSend_isInternal(self, v46, v47, v48, v49) & 1) != 0)
                    {
                      objc_msgSend_uploadToDedisco(v31, v50, v51, v52, v53);
LABEL_19:
                      if (v5)
                        objc_msgSend_uploadToCoreAnalytics(v31, v46, v47, v48, v49);
                      if (v70)
                        objc_msgSend_uploadRawEventsToCoreAnalytics(v31, v46, v47, v48, v49);
                      goto LABEL_27;
                    }
                    objc_msgSend_getRandomCoinFlip(self, v50, v51, v52, v53);
                    v55 = v54;
                    printf("DeDisco Upload Coin Flip: %f \n", v54);
                    v56 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 134217984;
                      v84 = v55;
                      _os_log_impl(&dword_2402DE000, v56, OS_LOG_TYPE_INFO, "DeDisco Upload Coin Flip: %f \n", buf, 0xCu);
                    }
                    if (v55 <= 0.1)
                      objc_msgSend_uploadToDedisco(v31, v57, v58, v59, v60);
LABEL_27:

                  }
                  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v71, (uint64_t)v85, 16);
                }
                while (v28);
              }

              v19 = v69 + 1;
            }
            while (v69 + 1 != v68);
            v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v15, (uint64_t)&v75, (uint64_t)v86, 16);
          }
          while (v68);
        }

        v12 = v65 + 1;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v79, (uint64_t)v87, 16);
    }
    while (v64);
  }

  return 1;
}

- (id)dumpAggregate
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  id obj;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  uint64_t v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getAggregatedStatesUpdateTimestamp_skipNullIdentifiers_(self, a2, 0, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    v104 = objc_msgSend_count(v3, v6, v7, v8, v9);
    _os_log_impl(&dword_2402DE000, v5, OS_LOG_TYPE_INFO, "%lu Buckets", buf, 0xCu);

  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v3;
  v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v96, (uint64_t)v102, 16);
  if (v80)
  {
    v79 = *(_QWORD *)v97;
    v82 = v10;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v97 != v79)
          objc_enumerationMutation(obj);
        v81 = v12;
        v13 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v12);
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v85 = v13;
        v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v14, (uint64_t)&v92, (uint64_t)v101, 16);
        if (v84)
        {
          v83 = *(_QWORD *)v93;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v93 != v83)
                objc_enumerationMutation(v85);
              v19 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v18);
              objc_msgSend_objectForKey_(v85, v15, v19, v16, v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend_objectForKey_(v10, v22, v19, v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v86 = v19;
              v87 = v18;
              if (v25)
              {
                objc_msgSend_objectForKey_(v10, v26, v19, v27, v28);
                v29 = objc_claimAutoreleasedReturnValue();

                v21 = (id)v29;
              }
              v90 = 0u;
              v91 = 0u;
              v88 = 0u;
              v89 = 0u;
              v30 = v20;
              v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v88, (uint64_t)v100, 16);
              if (v32)
              {
                v36 = v32;
                v37 = *(_QWORD *)v89;
                do
                {
                  for (i = 0; i != v36; ++i)
                  {
                    if (*(_QWORD *)v89 != v37)
                      objc_enumerationMutation(v30);
                    v39 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
                    objc_msgSend_objectForKey_(v30, v33, v39, v34, v35);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = (void *)LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      v42 = v41;
                      v47 = objc_msgSend_latestState(v40, v43, v44, v45, v46);
                      *(_DWORD *)buf = 134217984;
                      v104 = v47;
                      _os_log_impl(&dword_2402DE000, v42, OS_LOG_TYPE_INFO, "State: %lu", buf, 0xCu);

                    }
                    v48 = (void *)LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      v49 = v48;
                      objc_msgSend_getDictionaryRepresentation(v40, v50, v51, v52, v53);
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v104 = (uint64_t)v54;
                      _os_log_impl(&dword_2402DE000, v49, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

                    }
                    v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                    objc_msgSend_objectForKey_(v21, v56, v39, v57, v58);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v59)
                    {
                      objc_msgSend_objectForKey_(v21, v60, v39, v62, v63);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObjectsFromArray_(v55, v65, (uint64_t)v64, v66, v67);

                    }
                    objc_msgSend_getDictionaryRepresentation(v40, v60, v61, v62, v63);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v55, v69, (uint64_t)v68, v70, v71);

                    objc_msgSend_setObject_forKey_(v21, v72, (uint64_t)v55, v39, v73);
                  }
                  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v88, (uint64_t)v100, 16);
                }
                while (v36);
              }

              v10 = v82;
              objc_msgSend_setObject_forKey_(v82, v74, (uint64_t)v21, v86, v75);

              v18 = v87 + 1;
            }
            while (v87 + 1 != v84);
            v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v15, (uint64_t)&v92, (uint64_t)v101, 16);
          }
          while (v84);
        }

        v12 = v81 + 1;
      }
      while (v81 + 1 != v80);
      v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v96, (uint64_t)v102, 16);
    }
    while (v80);
  }

  return v10;
}

- (void)enumerateAggregation:(id)a3
{
  void (**v4)(id, void *, void *, void *);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  char v71;
  _BYTE v72[15];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, void *))a3;
  objc_msgSend_getBucketsNotAggregated(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v15 = v10;
    objc_msgSend_description(v9, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v89 = v20;
    _os_log_impl(&dword_2402DE000, v15, OS_LOG_TYPE_INFO, "To aggregate: %@", buf, 0xCu);

  }
  v62 = v9;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend_reverseObjectEnumerator(self->_buckets, v11, v12, v13, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v26;
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v81, (uint64_t)v87, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v82;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v82 != v64)
          objc_enumerationMutation(obj);
        v66 = v32;
        v33 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v32);
        objc_msgSend_flattenEvents(v33, v28, v29, v30, v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v69 = v34;
        v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v77, (uint64_t)v86, 16);
        if (v68)
        {
          v67 = *(_QWORD *)v78;
          do
          {
            v39 = 0;
            do
            {
              if (*(_QWORD *)v78 != v67)
                objc_enumerationMutation(v69);
              v70 = v39;
              objc_msgSend_objectForKey_(v69, v36, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v39), v37, v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = 0u;
              v74 = 0u;
              v75 = 0u;
              v76 = 0u;
              v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v73, (uint64_t)v85, 16);
              if (v42)
              {
                v46 = v42;
                v47 = *(_QWORD *)v74;
                do
                {
                  for (i = 0; i != v46; ++i)
                  {
                    if (*(_QWORD *)v74 != v47)
                      objc_enumerationMutation(v40);
                    objc_msgSend_objectForKey_(v40, v43, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i), v44, v45);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend_count(v49, v50, v51, v52, v53))
                    {
                      objc_msgSend_objectAtIndex_(v49, v54, 0, v55, v56);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_getTrialIdentifierFromBMEvent_(self, v58, (uint64_t)v57, v59, v60);
                      v61 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v61)
                      {
                        v4[2](v4, v33, v61, v49);
                      }
                      else if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                      {
                        sub_240314568(buf, &buf[1]);
                      }

                    }
                    else if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                    {
                      sub_240314540(&v71, v72);
                    }

                  }
                  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v73, (uint64_t)v85, 16);
                }
                while (v46);
              }

              v39 = v70 + 1;
            }
            while (v70 + 1 != v68);
            v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v36, (uint64_t)&v77, (uint64_t)v86, 16);
          }
          while (v68);
        }

        v32 = v66 + 1;
      }
      while (v66 + 1 != v65);
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v81, (uint64_t)v87, 16);
    }
    while (v65);
  }

}

- (id)dateToStringInUTCAndLocal:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend_setDateFormat_(v5, v6, (uint64_t)CFSTR("yyyy-MM-dd HH:mm:ss zzz"), v7, v8);
  objc_msgSend_localTimeZone(MEMORY[0x24BDBCF38], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v5, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_stringFromDate_(v5, v17, (uint64_t)v4, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeZoneWithName_(MEMORY[0x24BDBCF38], v21, (uint64_t)CFSTR("UTC"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v5, v25, (uint64_t)v24, v26, v27);

  objc_msgSend_stringFromDate_(v5, v28, (uint64_t)v4, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v32, (uint64_t)CFSTR("%@ %@"), v33, v34, v31, v20);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (void)dumpTimestamps
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_2402E85AC;
  v4[3] = &unk_251095168;
  v4[4] = self;
  objc_msgSend_enumerateAggregation_(self, a2, (uint64_t)v4, v2, v3);
}

- (NSMutableArray)buckets
{
  return self->_buckets;
}

- (NSSet)usePrivateUpload
{
  return self->_usePrivateUpload;
}

- (NSMutableDictionary)stateDict
{
  return self->_stateDict;
}

- (NSString)lastAggregationDateKey
{
  return self->_lastAggregationDateKey;
}

- (BOOL)strictDictChecks
{
  return self->_strictDictChecks;
}

- (void)setStrictDictChecks:(BOOL)a3
{
  self->_strictDictChecks = a3;
}

- (LBFTrialStatusDetector)trialStatusDetector
{
  return self->_trialStatusDetector;
}

- (BOOL)setMLHostMarkerInStateID
{
  return self->_setMLHostMarkerInStateID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialStatusDetector, 0);
  objc_storeStrong((id *)&self->_lastAggregationDateKey, 0);
  objc_storeStrong((id *)&self->_stateDict, 0);
  objc_storeStrong((id *)&self->_usePrivateUpload, 0);
  objc_storeStrong((id *)&self->_buckets, 0);
}

@end
