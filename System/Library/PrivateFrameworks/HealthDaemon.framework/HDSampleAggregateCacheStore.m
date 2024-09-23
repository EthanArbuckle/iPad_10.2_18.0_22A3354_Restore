@implementation HDSampleAggregateCacheStore

- (HDSampleAggregateCacheStore)initWithProfile:(id)a3 queryDescriptor:(id)a4 cachingIdentifier:(id)a5 sourceEntity:(id)a6 anchorDate:(id)a7 intervalComponents:(id)a8 timeIntervalToBucketIndex:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HDSampleAggregateCacheStore *v23;
  HDSampleAggregateCacheStore *v24;
  uint64_t v25;
  HDQueryDescriptor *queryDescriptor;
  uint64_t v27;
  NSString *cachingIdentifier;
  uint64_t v29;
  HDSourceEntity *sourceEntity;
  uint64_t v31;
  id timeIntervalToBucketIndex;
  uint64_t v33;
  NSDate *anchorDate;
  uint64_t v35;
  NSDateComponents *intervalComponents;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HDSampleAggregateCacheStore;
  v23 = -[HDSampleAggregateCacheStore init](&v38, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_profile, a3);
    v25 = objc_msgSend(v17, "copy");
    queryDescriptor = v24->_queryDescriptor;
    v24->_queryDescriptor = (HDQueryDescriptor *)v25;

    v27 = objc_msgSend(v18, "copy");
    cachingIdentifier = v24->_cachingIdentifier;
    v24->_cachingIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    sourceEntity = v24->_sourceEntity;
    v24->_sourceEntity = (HDSourceEntity *)v29;

    v31 = objc_msgSend(v22, "copy");
    timeIntervalToBucketIndex = v24->_timeIntervalToBucketIndex;
    v24->_timeIntervalToBucketIndex = (id)v31;

    v33 = objc_msgSend(v20, "copy");
    anchorDate = v24->_anchorDate;
    v24->_anchorDate = (NSDate *)v33;

    v35 = objc_msgSend(v21, "copy");
    intervalComponents = v24->_intervalComponents;
    v24->_intervalComponents = (NSDateComponents *)v35;

  }
  return v24;
}

- (int64_t)cachesExistWithError:(id *)a3
{
  return +[HDSampleAggregateCacheEntity cachesExistForQueryIdentifier:sourceEntity:profile:error:](HDSampleAggregateCacheEntity, "cachesExistForQueryIdentifier:sourceEntity:profile:error:", self->_cachingIdentifier, self->_sourceEntity, self->_profile, a3);
}

- (id)persistentAnchorDateWithError:(id *)a3
{
  NSDate *persistentAnchorDate;
  NSString *cachingIdentifier;
  HDSourceEntity *sourceEntity;
  HDProfile *profile;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSDate *v14;
  id v15;
  void *v16;
  NSDate *v17;
  NSDate *v18;
  id v19;

  persistentAnchorDate = self->_persistentAnchorDate;
  if (persistentAnchorDate)
    return persistentAnchorDate;
  cachingIdentifier = self->_cachingIdentifier;
  sourceEntity = self->_sourceEntity;
  profile = self->_profile;
  v19 = 0;
  +[HDCachedQueryMetadataEntity cachedQueryMetadataForQueryIdentifier:sourceEntity:profile:error:](HDCachedQueryMetadataEntity, "cachedQueryMetadataForQueryIdentifier:sourceEntity:profile:error:", cachingIdentifier, sourceEntity, profile, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  v12 = v11;
  if (v10)
    v13 = 1;
  else
    v13 = v11 == 0;
  if (v13)
  {
    if (v10)
    {
      objc_msgSend(v10, "anchorDate");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = self->_anchorDate;
    }
    v17 = self->_persistentAnchorDate;
    self->_persistentAnchorDate = v14;

    v18 = self->_persistentAnchorDate;
  }
  else
  {
    v15 = v11;
    v16 = v15;
    if (a3)
      *a3 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();

    v18 = 0;
  }

  return v18;
}

- (BOOL)saveCaches:(id)a3 generationNumber:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;

  v8 = a3;
  v16 = 0;
  -[HDSampleAggregateCacheStore persistentAnchorDateWithError:](self, "persistentAnchorDateWithError:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v12 = +[HDSampleAggregateCacheEntity insertCachedData:forQueryIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:error:](HDSampleAggregateCacheEntity, "insertCachedData:forQueryIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:error:", v8, self->_cachingIdentifier, self->_sourceEntity, a4, v9, self->_intervalComponents, self->_profile, a5);
  }
  else
  {
    v13 = v10;
    v14 = v13;
    v12 = v13 == 0;
    if (v13)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

  }
  return v12;
}

- (BOOL)deleteCachesForIndexes:(id)a3 generationNumber:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;

  v8 = a3;
  v16 = 0;
  -[HDSampleAggregateCacheStore persistentAnchorDateWithError:](self, "persistentAnchorDateWithError:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v12 = +[HDSampleAggregateCacheEntity deleteCacheForBucketIndexes:forQueryIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:error:](HDSampleAggregateCacheEntity, "deleteCacheForBucketIndexes:forQueryIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:error:", v8, self->_cachingIdentifier, self->_sourceEntity, a4, v9, self->_intervalComponents, self->_profile, a5);
  }
  else
  {
    v13 = v10;
    v14 = v13;
    if (v13)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateForInterval:(id)a3 cachedClass:(Class)a4 anchorAfterDatabaseScan:(int64_t *)a5 error:(id *)a6 cacheHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a3;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[HDSampleAggregateCacheStore enumerateForInterval:cachedClass:anchorAfterDatabaseScan:nowDate:calendar:error:cacheHandler:](self, "enumerateForInterval:cachedClass:anchorAfterDatabaseScan:nowDate:calendar:error:cacheHandler:", v12, a4, a5, v14, v15, a6, v13);

  return (char)a6;
}

- (BOOL)enumerateForInterval:(id)a3 cachedClass:(Class)a4 anchorAfterDatabaseScan:(int64_t *)a5 nowDate:(id)a6 calendar:(id)a7 error:(id *)a8 cacheHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  Class v35;
  int64_t *v36;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = v19;
  if (!v16)
  {
    v29 = v19;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSampleAggregateCacheStore.mm"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interval != nil"));

    v20 = v29;
  }
  -[HDProfile database](self->_profile, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __124__HDSampleAggregateCacheStore_enumerateForInterval_cachedClass_anchorAfterDatabaseScan_nowDate_calendar_error_cacheHandler___block_invoke;
  v30[3] = &unk_1E6CEC508;
  v30[4] = self;
  v22 = v16;
  v31 = v22;
  v35 = a4;
  v23 = v17;
  v32 = v23;
  v24 = v18;
  v33 = v24;
  v25 = v20;
  v34 = v25;
  v36 = a5;
  v26 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSampleAggregateCacheEntity, "performReadTransactionWithHealthDatabase:error:block:", v21, a8, v30);

  return v26;
}

uint64_t __124__HDSampleAggregateCacheStore_enumerateForInterval_cachedClass_anchorAfterDatabaseScan_nowDate_calendar_error_cacheHandler___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  uint64_t v39;
  int v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  BOOL v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  BOOL v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t k;
  void *v98;
  double *v99;
  double *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  id v117;
  id v118;
  _BOOL8 v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  void *v124;
  char v125;
  void *v126;
  void *v127;
  id v128;
  BOOL v129;
  uint64_t v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  uint64_t v136;
  char v137;
  uint64_t v138;
  _QWORD *v139;
  char v140;
  id v141;
  uint64_t i;
  uint64_t v143;
  id obj;
  id v145;
  void *v146;
  id v147;
  id v148;
  void *v149;
  id v151;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  char v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  _QWORD *v168;
  id v169;
  id v170;
  _QWORD v171[6];
  _QWORD **v172;
  _QWORD *v173[2];
  char v174;
  id v175;
  id v176;
  _QWORD v177[8];
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t v188;
  __n128 (*v189)(__n128 *, __n128 *);
  void (*v190)(uint64_t);
  void *v191;
  void *__p;
  void *v193;
  uint64_t v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  _QWORD v199[5];
  id v200;
  _QWORD *v201;
  char v202;
  _QWORD aBlock[5];
  id v204;
  _QWORD *v205;
  char v206;
  char v207;
  uint64_t v208;
  _QWORD v209[3];
  _QWORD v210[5];
  id v211;
  id v212;
  id v213;
  id v214;
  uint64_t *v215;
  _QWORD *v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  char v221;
  uint64_t v222;

  v222 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v170 = 0;
  v7 = *(void **)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v153 = v3;
  v154 = v5;
  v155 = v6;
  v151 = v7;
  if (v4)
  {
    v9 = v4[2];
    v10 = v4[3];
    v168 = v4;
    v11 = v4[1];
    v176 = 0;
    +[HDCachedQueryMetadataEntity cachedQueryMetadataForQueryIdentifier:sourceEntity:profile:error:](HDCachedQueryMetadataEntity, "cachedQueryMetadataForQueryIdentifier:sourceEntity:profile:error:", v9, v10, v11, &v176);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v176;
    v14 = v13;
    if (v12)
      v15 = 1;
    else
      v15 = v13 == 0;
    if (!v15)
    {
      v19 = objc_retainAutorelease(v13);
      v20 = 0;
      v170 = v19;
      v156 = v19;
LABEL_87:

      goto LABEL_88;
    }
    if (v12 && !objc_msgSend(v12, "generationNumber"))
    {

      v12 = 0;
    }
    v143 = v8;
    v145 = v12;
    v16 = v4[2];
    v17 = v4[3];
    v18 = v4[1];
    v175 = v14;
    +[HDCachedQueryMetadataEntity lastUpdatedDateForQueryIdentifier:sourceEntity:profile:error:](HDCachedQueryMetadataEntity, "lastUpdatedDateForQueryIdentifier:sourceEntity:profile:error:", v16, v17, v18, &v175);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v175;

    if (!v149 && v156)
    {
      v170 = objc_retainAutorelease(v156);

      v20 = 0;
LABEL_86:

      v19 = v145;
      goto LABEL_87;
    }
    v21 = v12;
    v141 = v149;
    v22 = v155;
    v23 = v154;
    v146 = v21;
    objc_msgSend(v21, "anchorDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_18;
    v25 = (void *)v4[4];
    objc_msgSend(v21, "anchorDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    v28 = v26;
    if ((objc_msgSend(v27, "isEqual:", v28) & 1) == 0)
    {
      objc_msgSend(v27, "timeIntervalSinceReferenceDate");
      v34 = v33;
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      v36 = v35;
      objc_msgSend((id)v168[6], "hk_approximateDuration");
      v38 = (int)((v34 - v36) / v37);
      v39 = v38;
      v40 = v38 - 2;
      while (1)
      {
        objc_msgSend((id)v168[6], "hk_dateByAddingInterval:toDate:", v39, v28);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqual:", v27);

        if ((v42 & 1) != 0)
          break;
        if (++v40 > (int)v39)
        {

          goto LABEL_23;
        }
      }
    }

    objc_msgSend(v146, "intervalComponents");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v29;
    v30 = (void *)v168[6];
    if (v29 == v30)
    {

    }
    else
    {
      if (!v30)
      {
LABEL_23:
        v140 = 0;
        v137 = 0;
LABEL_33:

        goto LABEL_34;
      }
      objc_msgSend(v146, "intervalComponents");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqual:", v168[6]);

      if ((v32 & 1) == 0)
      {
LABEL_18:
        v140 = 0;
        v137 = 0;
LABEL_34:

        objc_msgSend(v146, "anchorDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (!v51)
          v52 = (void *)v168[4];
        v139 = v168 + 5;
        objc_storeStrong((id *)v168 + 5, v52);

        v174 = 0;
        v171[0] = 0;
        v171[1] = v171;
        v171[2] = 0x4812000000;
        v171[3] = __Block_byref_object_copy__25;
        v171[4] = __Block_byref_object_dispose__25;
        v173[0] = 0;
        v173[1] = 0;
        v171[5] = &unk_1B805FAAD;
        v172 = v173;
        v147 = v153;
        v148 = v146;
        objc_msgSend(v147, "startDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "timeIntervalSinceReferenceDate");
        v55 = v54;

        objc_msgSend(v147, "endDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "timeIntervalSinceReferenceDate");
        v58 = v57;

        objc_msgSend(v148, "queryStartIndex");
        v59 = v168;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          objc_msgSend(v147, "startDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v61 == 0;

          v59 = v168;
          if (!v62)
          {
            v63 = (*(uint64_t (**)(double))(v168[9] + 16))(v55);
            objc_msgSend(v148, "queryStartIndex");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "integerValue");

            v59 = v168;
            if (v63 < v65)
            {
              do
              {
                std::__tree<long>::__emplace_unique_key_args<long,long const&>((uint64_t *)&v172, v63, v63);
                ++v63;
              }
              while (v65 != v63);
            }
          }
        }
        objc_msgSend(v148, "queryEndIndex");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          objc_msgSend(v147, "endDate");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v67 == 0;

          v59 = v168;
          if (!v68)
          {
            v69 = (*(uint64_t (**)(double))(v168[9] + 16))(v58);
            objc_msgSend(v148, "queryEndIndex");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "integerValue");

            v59 = v168;
            if (v69 > v71)
            {
              do
              {
                ++v71;
                std::__tree<long>::__emplace_unique_key_args<long,long const&>((uint64_t *)&v172, v71, v71);
              }
              while (v69 != v71);
            }
          }
        }
        v72 = (void *)v59[8];
        if (v72)
        {
          objc_msgSend(v72, "arrayByAddingObject:", v59[7]);
        }
        else
        {
          v208 = v59[7];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v208, 1);
        }
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v186 = 0;
        v187 = &v186;
        v188 = 0x4812000000;
        v189 = __Block_byref_object_copy__206_0;
        v190 = __Block_byref_object_dispose__207_0;
        v191 = &unk_1B805FAAD;
        __p = 0;
        v194 = 0;
        v193 = 0;
        v182 = 0u;
        v183 = 0u;
        v184 = 0u;
        v185 = 0u;
        obj = v73;
        v136 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v182, aBlock, 16);
        if (v136)
        {
          v138 = *(_QWORD *)v183;
          do
          {
            for (i = 0; i != v136; ++i)
            {
              if (*(_QWORD *)v183 != v138)
                objc_enumerationMutation(obj);
              v74 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * i);
              v161 = objc_msgSend(v148, "maxAnchor");
              v75 = v74;
              v166 = v147;
              v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v197 = 0u;
              v198 = 0u;
              v195 = 0u;
              v196 = 0u;
              v163 = v76;
              objc_msgSend(v75, "sampleTypes");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v157 = v77;
              v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v195, v210, 16);
              if (v78)
              {
                v79 = *(_QWORD *)v196;
                do
                {
                  for (j = 0; j != v78; ++j)
                  {
                    if (*(_QWORD *)v196 != v79)
                      objc_enumerationMutation(v157);
                    v81 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * j);
                    +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v81, v168[1]);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v161);
                    v83 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "setAnchor:", v83);

                    HDSampleEntityPredicateForDateInterval(v166, v81);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v84, 0);
                    objc_msgSend(v75, "samplePredicate");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v83) = v86 == 0;

                    if ((v83 & 1) == 0)
                    {
                      objc_msgSend(v75, "samplePredicate");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "addObject:", v87);

                    }
                    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v85);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "setPredicate:", v88);

                    v209[0] = v84;
                    objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("start_date"));
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    v209[1] = v89;
                    objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("end_date"));
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    v209[2] = v90;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 3);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v91);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "setDeletedObjectsPredicate:", v92);

                    objc_msgSend(v163, "addObject:", v82);
                  }
                  v77 = v157;
                  v78 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v195, v210, 16);
                }
                while (v78);
              }

              v93 = (void *)objc_msgSend(v163, "copy");
              v178 = 0u;
              v179 = 0u;
              v180 = 0u;
              v181 = 0u;
              v94 = v93;
              v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
              if (v95)
              {
                v96 = *(_QWORD *)v179;
                while (2)
                {
                  for (k = 0; k != v95; ++k)
                  {
                    if (*(_QWORD *)v179 != v96)
                      objc_enumerationMutation(v94);
                    v98 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * k);
                    v177[0] = MEMORY[0x1E0C809B0];
                    v177[1] = 3221225472;
                    v177[2] = __126__HDSampleAggregateCacheStore__bucketIndexesWithSampleChanges_forInterval_queryMetadata_deletedObjectWithoutDatesAdded_error___block_invoke;
                    v177[3] = &unk_1E6CEC5A8;
                    *(double *)&v177[6] = v55;
                    *(double *)&v177[7] = v58;
                    v177[5] = &v174;
                    v177[4] = &v186;
                    if ((objc_msgSend(v98, "enumerateSampleTimesIncludingDeletedObjects:error:handler:", 1, &v170, v177) & 1) == 0)
                    {

                      v20 = 0;
                      goto LABEL_79;
                    }
                  }
                  v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
                  if (v95)
                    continue;
                  break;
                }
              }

            }
            v136 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v182, aBlock, 16);
          }
          while (v136);
        }

        v99 = (double *)v187[6];
        v100 = (double *)v187[7];
        while (v99 != v100)
        {
          v101 = (void *)MEMORY[0x1BCCACAC4]();
          v102 = (*(uint64_t (**)(double))(v168[9] + 16))(*v99);
          v103 = (*(uint64_t (**)(double))(v168[9] + 16))(v99[1]);
          if (v102 <= v103)
          {
            v104 = v103 + 1;
            do
            {
              std::__tree<long>::__emplace_unique_key_args<long,long const&>((uint64_t *)&v172, v102, v102);
              ++v102;
            }
            while (v104 != v102);
          }
          objc_autoreleasePoolPop(v101);
          v99 += 2;
        }
        v20 = 1;
LABEL_79:
        _Block_object_dispose(&v186, 8);
        if (__p)
        {
          v193 = __p;
          operator delete(__p);
        }

        if ((v20 & 1) != 0)
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke;
          aBlock[3] = &unk_1E6CEC530;
          aBlock[4] = v168;
          v105 = v148;
          v204 = v105;
          v205 = v171;
          v206 = v137 ^ 1;
          v207 = v174;
          v164 = _Block_copy(aBlock);
          v199[0] = MEMORY[0x1E0C809B0];
          v199[1] = 3221225472;
          v199[2] = __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_2;
          v199[3] = &unk_1E6CEC558;
          v199[4] = v168;
          v106 = v105;
          v200 = v106;
          v201 = v171;
          v202 = v140;
          v167 = _Block_copy(v199);
          v107 = v168[9];
          objc_msgSend(v147, "startDate");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "timeIntervalSinceReferenceDate");
          v109 = (*(uint64_t (**)(uint64_t, _QWORD))(v107 + 16))(v107, *v139);

          v110 = v168[9];
          objc_msgSend(v147, "endDate");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "timeIntervalSinceReferenceDate");
          v112 = (*(uint64_t (**)(uint64_t, _QWORD))(v110 + 16))(v110, *v139);

          v186 = 0;
          v187 = &v186;
          v188 = 0x2020000000;
          v189 = (__n128 (*)(__n128 *, __n128 *))v109;
          v114 = v168[2];
          v113 = v168[3];
          v115 = v168[1];
          v210[0] = MEMORY[0x1E0C809B0];
          v210[1] = 3221225472;
          v210[2] = __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_3;
          v210[3] = &unk_1E6CEC580;
          v217 = v109;
          v218 = v112;
          v219 = sel__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler_;
          v210[4] = v168;
          v215 = &v186;
          v116 = v151;
          v212 = v116;
          v117 = v167;
          v213 = v117;
          v220 = v143;
          v211 = v106;
          v118 = v164;
          v221 = v140;
          v214 = v118;
          v216 = v171;
          v119 = +[HDSampleAggregateCacheEntity enumerateCachedDataForQueryIdentifier:sourceEntity:profile:startIndex:endIndex:error:enumerationHandler:](HDSampleAggregateCacheEntity, "enumerateCachedDataForQueryIdentifier:sourceEntity:profile:startIndex:endIndex:error:enumerationHandler:", v114, v113, v115, v109, v112, &v170, v210);
          if (v187[3] < v112)
          {
            do
            {
              v120 = (void *)MEMORY[0x1BCCACAC4](v119);
              v121 = (*((uint64_t (**)(id, uint64_t))v117 + 2))(v117, v187[3]);
              (*((void (**)(id, _QWORD, uint64_t, uint64_t, _QWORD))v116 + 2))(v116, 0, v121, v187[3], 0);
              objc_autoreleasePoolPop(v120);
              v122 = v187[3] + 1;
              v187[3] = v122;
            }
            while (v122 < v112);
          }

          _Block_object_dispose(&v186, 8);
        }
        _Block_object_dispose(v171, 8);
        std::__tree<long>::destroy(v173[0]);
        goto LABEL_86;
      }
    }
    objc_msgSend(v22, "hk_dateBySubtractingDays:fromDate:", *MEMORY[0x1E0CB4BE8] - 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v141, "hk_isBeforeOrEqualToDate:", v24) & 1) != 0)
      goto LABEL_26;
    objc_msgSend(v146, "buildVersion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v168[1], "daemon");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "behavior");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "currentOSBuild");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43 == v45)
    {

    }
    else
    {
      objc_msgSend((id)v168[1], "daemon");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "behavior");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "currentOSBuild");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47)
      {

        goto LABEL_26;
      }
      v159 = v43;
      objc_msgSend(v146, "buildVersion");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v168[1], "daemon");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "behavior");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "currentOSBuild");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend(v160, "isEqualToString:", v50);

      if ((v158 & 1) == 0)
      {
LABEL_26:
        v137 = 0;
        v140 = 1;
        goto LABEL_33;
      }
    }
    v140 = 1;
    v137 = 1;
    goto LABEL_33;
  }
  v20 = 0;
LABEL_88:

  v123 = v170;
  v124 = v123;
  if (v123)
    v125 = v20;
  else
    v125 = 1;
  if ((v125 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "database");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v124;
    +[HDHealthEntity maxRowIDForPredicate:healthDatabase:error:](HDSampleEntity, "maxRowIDForPredicate:healthDatabase:error:", 0, v126, &v169);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v169;

    if (v127)
      v129 = 1;
    else
      v129 = v128 == 0;
    v130 = v129;
    if (v129)
    {
      v131 = v127;
      if (*(_QWORD *)(a1 + 80))
        **(_QWORD **)(a1 + 80) = objc_msgSend(v127, "longLongValue");
    }
    else
    {
      v133 = v128;
      v134 = v133;
      if (a3)
        *a3 = objc_retainAutorelease(v133);
      else
        _HKLogDroppedError();

      v131 = v127;
    }
  }
  else
  {
    v132 = v123;
    v131 = v132;
    if (a3)
    {
      v128 = v132;
      v130 = 0;
      *a3 = objc_retainAutorelease(v132);
    }
    else
    {
      _HKLogDroppedError();
      v130 = 0;
      v128 = v131;
    }
  }

  return v130;
}

BOOL __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  _QWORD *v18;
  _BOOL8 result;

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "queryStartIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queryEndIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDSampleAggregateCacheStore _indexInRangeOfQueryStartIndex:endIndex:bucketIndex:](v6, v7, v8, a2);

  v10 = objc_msgSend(*(id *)(a1 + 40), "generationNumber");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(_QWORD **)(v11 + 56);
  v12 = (_QWORD *)(v11 + 56);
  v13 = v14;
  if (!v14)
    goto LABEL_11;
  v15 = v12;
  do
  {
    v16 = v13[4];
    v17 = v16 < a2;
    if (v16 >= a2)
      v18 = v13;
    else
      v18 = v13 + 1;
    if (!v17)
      v15 = v13;
    v13 = (_QWORD *)*v18;
  }
  while (*v18);
  if (v15 == v12 || v15[4] > a2)
LABEL_11:
    v15 = v12;
  if (v10 < a3 || !v9)
    return 1;
  result = 1;
  if (!*(_BYTE *)(a1 + 56) && v15 == v12)
    return *(_BYTE *)(a1 + 57) != 0;
  return result;
}

- (BOOL)_indexInRangeOfQueryStartIndex:(void *)a3 endIndex:(uint64_t)a4 bucketIndex:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1)
  {
    a1 = 0;
    if (v7)
    {
      if (v8)
      {
        v10 = objc_msgSend(v7, "integerValue");
        v11 = objc_msgSend(v9, "integerValue");
        a1 = v10 <= a4 && v11 >= a4;
      }
    }
  }

  return a1;
}

uint64_t __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  _QWORD *v15;
  unsigned int v16;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "queryStartIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queryEndIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSampleAggregateCacheStore _indexInRangeOfQueryStartIndex:endIndex:bucketIndex:](v4, v5, v6, a2);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(_QWORD **)(v8 + 56);
  v9 = (_QWORD *)(v8 + 56);
  v10 = v11;
  if (!v11)
    goto LABEL_11;
  v12 = v9;
  do
  {
    v13 = v10[4];
    v14 = v13 < a2;
    if (v13 >= a2)
      v15 = v10;
    else
      v15 = v10 + 1;
    if (!v14)
      v12 = v10;
    v10 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v12 == v9 || v12[4] > a2)
LABEL_11:
    v12 = v9;
  v16 = !v7;
  if (!*(_BYTE *)(a1 + 56))
    v16 = 1;
  if (v12 == v9)
    return v16;
  else
    return 1;
}

uint64_t __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t *v24;
  NSObject *v25;
  uint64_t *v27;
  BOOL v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (*(_QWORD *)(a1 + 88) > a3 || *(_QWORD *)(a1 + 96) < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32), CFSTR("HDSampleAggregateCacheStore.mm"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bucketIndex >= requestedStartIndex && bucketIndex <= requestedEndIndex"));

  }
  while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) < a3)
  {
    v7 = (void *)MEMORY[0x1BCCACAC4]();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), 0);
    objc_autoreleasePoolPop(v7);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  v10 = *(_QWORD *)(a1 + 112);
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", v10, v5, &v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v30;
  if (v11)
  {
    v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v14 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      if (*(_BYTE *)(a1 + 120))
        v15 = v11;
      else
        v15 = 0;
      (*(void (**)(uint64_t, void *, uint64_t, uint64_t, _QWORD))(v14 + 16))(v14, v15, 1, a3, 0);
      v16 = *(_QWORD **)(*(_QWORD *)(a1 + 80) + 8);
      v17 = (uint64_t *)v16[7];
      if (v17)
      {
        v18 = v16 + 7;
        v19 = (_QWORD *)v16[7];
        do
        {
          v20 = v19[4];
          v21 = v20 < a3;
          if (v20 >= a3)
            v22 = v19;
          else
            v22 = v19 + 1;
          if (!v21)
            v18 = v19;
          v19 = (_QWORD *)*v22;
        }
        while (*v22);
        if (v18 != v16 + 7 && v18[4] <= a3)
        {
          v23 = (uint64_t *)v18[1];
          if (v23)
          {
            do
            {
              v24 = v23;
              v23 = (uint64_t *)*v23;
            }
            while (v23);
          }
          else
          {
            v27 = v18;
            do
            {
              v24 = (uint64_t *)v27[2];
              v28 = *v24 == (_QWORD)v27;
              v27 = v24;
            }
            while (!v28);
          }
          if ((uint64_t *)v16[6] == v18)
            v16[6] = v24;
          --v16[8];
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v17, v18);
          operator delete(v18);
        }
      }
    }
    else
    {
      (*(void (**)(uint64_t, void *, _QWORD, uint64_t, _QWORD))(v14 + 16))(v14, v11, 0, a3, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v32 = v29;
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "Failure to decode cache for query %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

  return 1;
}

BOOL __126__HDSampleAggregateCacheStore__bucketIndexesWithSampleChanges_forInterval_queryMetadata_deletedObjectWithoutDatesAdded_error___block_invoke(uint64_t a1, double a2, double a3)
{
  _BOOL8 v3;
  double v4;
  uint64_t *v5;

  v3 = a3 != 2.22507386e-308 && a2 != 2.22507386e-308;
  if (v3)
  {
    v4 = *(double *)(a1 + 48);
    if (v4 <= a2)
      v4 = a2;
    if (*(double *)(a1 + 56) <= a3)
      a3 = *(double *)(a1 + 56);
    if (v4 <= a3)
    {
      v5 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
      if (v4 >= a3)
        a3 = v4;
      HKIntervalMask<double>::_insertInterval(v5, v4, a3);
    }
  }
  else
  {
    **(_BYTE **)(a1 + 40) = 1;
  }
  return v3;
}

- (HDQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (NSArray)invalidationQueryDescriptors
{
  return self->_invalidationQueryDescriptors;
}

- (void)setInvalidationQueryDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)timeIntervalToBucketIndex
{
  return self->_timeIntervalToBucketIndex;
}

- (void)setTimeIntervalToBucketIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeIntervalToBucketIndex, 0);
  objc_storeStrong((id *)&self->_invalidationQueryDescriptors, 0);
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_persistentAnchorDate, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
