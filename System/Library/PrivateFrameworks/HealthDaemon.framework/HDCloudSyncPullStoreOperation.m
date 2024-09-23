@implementation HDCloudSyncPullStoreOperation

- (HDCloudSyncPullStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncPullStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5
{
  id v9;
  HDCloudSyncPullStoreOperation *v10;
  HDCloudSyncPullStoreOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPullStoreOperation;
  v10 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_target, a5);
    v11->_hasAppliedChange = 0;
  }

  return v11;
}

- (void)main
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  HDCloudSyncTarget *target;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HDCloudSyncTarget *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  int v36;
  id v37;
  HDCloudSyncCachedZone *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  HDCloudSyncTarget *v52;
  NSObject *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  BOOL v94;
  void *v95;
  BOOL v96;
  void *v97;
  _BOOL4 v98;
  void *v99;
  void *v100;
  char v101;
  id v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  id v109;
  void *v110;
  void *v111;
  int v112;
  HDSyncAnchorMap *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  _BOOL4 v126;
  void *v127;
  NSObject *v128;
  HDCloudSyncCachedZone *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
  HDCloudSyncCompoundOperation *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  NSObject *v150;
  uint64_t i;
  void *v152;
  void *v153;
  void *v154;
  BOOL v155;
  id v156;
  id v157;
  BOOL v158;
  void *v159;
  BOOL v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  void *v170;
  BOOL v171;
  id v172;
  id v173;
  id v174;
  BOOL v175;
  void *v176;
  NSObject *v177;
  uint64_t v178;
  NSObject *v179;
  uint64_t v180;
  NSObject *v181;
  uint64_t v182;
  __CFString *v183;
  __CFString *v184;
  uint64_t v185;
  uint64_t v186;
  HDCloudSyncPullSequenceOperation *v187;
  void *v188;
  HDCloudSyncPullSequenceOperation *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  HDCloudSyncTarget *v197;
  NSObject *v198;
  void *v199;
  HDCloudSyncTarget *v200;
  NSObject *v201;
  void *v202;
  uint64_t v203;
  uint64_t (*v204)(uint64_t, uint64_t);
  id v205;
  void *v206;
  HDCloudSyncCompoundOperation *v207;
  id obj;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  id v212;
  uint64_t v213;
  id v214;
  void *v215;
  id v216;
  void *v217;
  id v218;
  id v219;
  _HDCloudSyncStorePersistableState *v221;
  _HDCloudSyncStorePersistableState *v222;
  id v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  id v230;
  void *v231;
  id v232;
  void *v233;
  uint64_t v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  _QWORD v240[5];
  id v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  _QWORD v246[4];
  id v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  id v252;
  uint64_t v253;
  uint64_t *v254;
  uint64_t v255;
  uint64_t (*v256)(uint64_t, uint64_t);
  void (*v257)(uint64_t);
  id v258;
  uint64_t v259;
  uint64_t *v260;
  uint64_t v261;
  char v262;
  _QWORD v263[2];
  _QWORD v264[2];
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  HDCloudSyncPullStoreOperation *v269;
  _BYTE *v270;
  _BYTE buf[24];
  uint64_t (*v272)(uint64_t, uint64_t);
  _BYTE v273[24];
  _BYTE v274[24];
  void *v275;
  __int128 v276;
  uint64_t *v277;
  uint64_t *v278;
  BOOL v279;
  uint64_t v280;

  v280 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiredProtocolVersion");

  if (v3 < 2)
  {
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "orderedSequenceRecords");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
      -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
      return;
    }
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "orderedSequenceRecords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    -[HDCloudSyncOperation progress](self, "progress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTotalUnitCount:", 300 * v21 + 200);

    -[HDCloudSyncTarget store](self->_target, "store");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = 0;
    objc_msgSend(v23, "persistedStateWithError:", &v239);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = v239;

    if (!v217)
    {
      -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v216);
      goto LABEL_144;
    }
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      target = self->_target;
      v26 = v24;
      -[HDCloudSyncTarget storeRecord](target, "storeRecord");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v28;
      _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Store: %{public}@", buf, 0x16u);

    }
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_target;
      v31 = v29;
      -[HDCloudSyncTarget storeRecord](v30, "storeRecord");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activeSequenceHeaderRecord");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v33;
      _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Sequence: %{public}@", buf, 0x16u);

    }
    if (objc_msgSend(v217, "syncProtocolVersion") == 16)
    {
      v230 = v216;
    }
    else
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        v36 = objc_msgSend(v217, "syncProtocolVersion");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v36;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = 16;
        _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: detected sync protocol version change %d -> %d", buf, 0x18u);

      }
      v238 = v216;
      v37 = v217;
      v38 = [HDCloudSyncCachedZone alloc];
      -[HDCloudSyncTarget zoneIdentifier](self->_target, "zoneIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](self, "configuration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "repository");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](self, "configuration");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "accessibilityAssertion");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v38, "initForZoneIdentifier:repository:accessibilityAssertion:", v39, v41, v43);

      v265 = 0;
      v266 = (uint64_t)&v265;
      v267 = 0x2020000000;
      LOBYTE(v268) = 0;
      v45 = objc_opt_class();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __55__HDCloudSyncPullStoreOperation__resetPullState_error___block_invoke;
      v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D108B0;
      *(_QWORD *)v273 = self;
      v46 = v37;
      *(_QWORD *)&v273[8] = v46;
      *(_QWORD *)&v273[16] = &v265;
      if ((objc_msgSend(v44, "recordsForClass:epoch:error:enumerationHandler:", v45, 0, &v238, buf) & 1) != 0)
      {
        if (*(_BYTE *)(v266 + 24))
        {
          -[HDCloudSyncTarget store](self->_target, "store");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v48) = objc_msgSend(v47, "resetReceivedSyncAnchorMapWithError:", &v238);

          if ((_DWORD)v48)
          {
            objc_msgSend(v46, "stateWithSyncProtocolVersion:", 16);
            v49 = objc_claimAutoreleasedReturnValue();

            -[HDCloudSyncTarget store](self->_target, "store");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v48) = objc_msgSend(v50, "persistState:error:", v49, &v238);

            if ((_DWORD)v48)
            {
              -[HDCloudSyncOperation configuration](self, "configuration");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "operationGroup");
              v48 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v48, "setExpectedReceiveSize:", 3);

              LOBYTE(v48) = 1;
            }
            v46 = (id)v49;
          }
        }
        else
        {
          _HKInitializeLogging();
          v62 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v274 = 138543362;
            *(_QWORD *)&v274[4] = self;
            _os_log_impl(&dword_1B7802000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: detected sync protocol version, but none of the change records have a greater protocol version. Skipping re-ingest.", v274, 0xCu);
          }
          LOBYTE(v48) = 1;
        }
      }
      else
      {
        LOBYTE(v48) = 0;
      }

      _Block_object_dispose(&v265, 8);
      v230 = v238;

      if ((v48 & 1) == 0)
      {
        -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v230);
        v216 = v230;
        goto LABEL_144;
      }
    }
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "activeSequenceHeaderRecord");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "baselineEpoch");
    LODWORD(v65) = v65 > objc_msgSend(v217, "baselineEpoch");

    if ((_DWORD)v65)
    {
      v237 = v230;
      v232 = v217;
      _HKInitializeLogging();
      v66 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v67 = v66;
        v68 = objc_msgSend(v232, "baselineEpoch");
        -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "activeSequenceHeaderRecord");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "baselineEpoch");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v68;
        *(_WORD *)&buf[22] = 2048;
        v272 = (uint64_t (*)(uint64_t, uint64_t))v71;
        _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: detected this is a pull of a new epoch %llu -> %llu", buf, 0x20u);

      }
      v221 = [_HDCloudSyncStorePersistableState alloc];
      -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "activeSequenceHeaderRecord");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      v218 = (id)objc_msgSend(v226, "baselineEpoch");
      objc_msgSend(v232, "rebaseDeadline");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "lastSyncDate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "emptyZoneDateByZoneID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "lastCheckDate");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "ownerIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncTarget container](self->_target, "container");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "containerIdentifier");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "syncIdentity");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v203) = objc_msgSend(v232, "syncProtocolVersion");
      v222 = -[_HDCloudSyncStorePersistableState initWithServerChangeToken:baselineEpoch:rebaseDeadline:lastSyncDate:emptyZones:lastCheckDate:ownerIdentifier:containerIdentifier:syncIdentity:syncProtocolVersion:](v221, "initWithServerChangeToken:baselineEpoch:rebaseDeadline:lastSyncDate:emptyZones:lastCheckDate:ownerIdentifier:containerIdentifier:syncIdentity:syncProtocolVersion:", 0, v218, v224, v72, v73, v74, v76, v78, v80, v203);

      -[HDCloudSyncTarget store](self->_target, "store");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "activeSequenceHeaderRecord");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "syncStoreForEpoch:", objc_msgSend(v83, "baselineEpoch"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v232, "hasEncounteredGapInCurrentEpoch"))
      {
        -[_HDCloudSyncStorePersistableState stateWithGapEncountered:](v222, "stateWithGapEncountered:", 0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v84, "resetReceivedSyncAnchorMapWithError:", &v237) & 1) == 0)
        {
LABEL_58:
          buf[0] = 0;
LABEL_60:

          v101 = buf[0];
          v216 = v237;

          if ((v101 & 1) == 0)
          {
            -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v216);
            goto LABEL_144;
          }
          v102 = v216;
          goto LABEL_65;
        }
      }
      else
      {
        -[HDCloudSyncTarget store](self->_target, "store");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = -[HDCloudSyncPullStoreOperation _copyAnchorsOfType:from:to:error:](self, v93, v84, (uint64_t)&v237);

        if (!v94
          || (-[HDCloudSyncTarget store](self->_target, "store"),
              v95 = (void *)objc_claimAutoreleasedReturnValue(),
              v96 = -[HDCloudSyncPullStoreOperation _copyAnchorsOfType:from:to:error:](self, v95, v84, (uint64_t)&v237),
              v95,
              !v96))
        {
          buf[0] = 0;
          v85 = v222;
          goto LABEL_60;
        }
        v85 = v222;
      }
      if ((objc_msgSend(v84, "persistState:error:", v85, &v237) & 1) != 0)
      {
        objc_msgSend(v85, "serverChangeToken");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v97 == 0;

        if (v98)
        {
          -[HDCloudSyncOperation configuration](self, "configuration");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "operationGroup");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setExpectedReceiveSize:", 3);

        }
        buf[0] = 1;
        goto LABEL_60;
      }
      goto LABEL_58;
    }
    v236 = v230;
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "tombstoneSequenceRecord");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v87)
      goto LABEL_43;
    v88 = -[HDCloudSyncPullStoreOperation _requiresSyncForSequence:error:]((id *)&self->super.super.isa, v87, (uint64_t)&v236);
    if (!v88)
    {
LABEL_77:

      v216 = v236;
      -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v216);
      goto LABEL_144;
    }
    if (v88 != 1)
    {
LABEL_43:
      -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "sequenceRecord");
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v90)
      {
LABEL_47:

        v216 = v236;
        _HKInitializeLogging();
        v92 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_1B7802000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping pull; local anchors are up-to-date.",
            buf,
            0xCu);
        }
        -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
        goto LABEL_144;
      }
      v91 = -[HDCloudSyncPullStoreOperation _requiresSyncForSequence:error:]((id *)&self->super.super.isa, v90, (uint64_t)&v236);
      if (!v91)
        goto LABEL_76;
      if (v91 != 1)
      {
        if (v91 == 2)
          goto LABEL_47;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "handleFailureInMethod:object:file:lineNumber:description:", sel__requiresSyncWithError_, self, CFSTR("HDCloudSyncPullStoreOperation.m"), 392, CFSTR("Invalid return value form _queue_requiresSyncForSequence:error:; fell out of switch."));

LABEL_76:
        goto LABEL_77;
      }

    }
    v102 = v236;

LABEL_65:
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "isChild");

    if (v104)
    {
      v235 = v102;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v272 = __Block_byref_object_copy__205;
      *(_QWORD *)v273 = __Block_byref_object_dispose__205;
      *(_QWORD *)&v273[8] = 0;
      +[HDDatabaseTransactionContext contextForReading](HDDatabaseTransactionContext, "contextForReading");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation profile](self, "profile");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "database");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v265 = MEMORY[0x1E0C809B0];
      v266 = 3221225472;
      v267 = (uint64_t)__63__HDCloudSyncPullStoreOperation__childSyncIdentitiesWithError___block_invoke;
      v268 = &unk_1E6CEF700;
      v270 = buf;
      v269 = self;
      v108 = objc_msgSend(v107, "performTransactionWithContext:error:block:inaccessibilityHandler:", v105, &v235, &v265, 0);

      if ((v108 & 1) != 0)
        v109 = *(id *)(*(_QWORD *)&buf[8] + 40);
      else
        v109 = 0;

      _Block_object_dispose(buf, 8);
      if (v109
        && (-[HDCloudSyncTarget storeRecord](self->_target, "storeRecord"),
            v110 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v110, "syncIdentity"),
            v111 = (void *)objc_claimAutoreleasedReturnValue(),
            v112 = objc_msgSend(v109, "containsObject:", v111),
            v111,
            v110,
            v112))
      {
        v113 = objc_alloc_init(HDSyncAnchorMap);
        -[HDCloudSyncTarget store](self->_target, "store");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "repository");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "profile");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "legacyRepositoryProfile");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = +[HDSyncAnchorEntity getSyncAnchorsOfType:anchorMap:store:profile:error:](HDSyncAnchorEntity, "getSyncAnchorsOfType:anchorMap:store:profile:error:", 4, v113, v114, v118, &v235);

        if (v119)
        {
          -[HDCloudSyncOperation configuration](self, "configuration");
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v233, "syncDate");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncTarget store](self->_target, "store");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncOperation configuration](self, "configuration");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "repository");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "profile");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "legacyRepositoryProfile");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:](HDSyncAnchorEntity, "updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:", v113, 3, v120, v121, 2, 0, v125, &v235);

        }
        else
        {
          v126 = 0;
        }

      }
      else
      {
        v126 = 0;
      }

      v216 = v235;
      if (v126)
      {
        _HKInitializeLogging();
        v128 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_1B7802000, v128, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping pull from own child, updated received anchors", buf, 0xCu);
        }
        -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
        goto LABEL_144;
      }
    }
    else
    {
      v216 = v102;
    }
    v129 = [HDCloudSyncCachedZone alloc];
    -[HDCloudSyncTarget zoneIdentifier](self->_target, "zoneIdentifier");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "repository");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "accessibilityAssertion");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v129, "initForZoneIdentifier:repository:accessibilityAssertion:", v130, v132, v134);

    v135 = objc_opt_class();
    v240[0] = MEMORY[0x1E0C809B0];
    v240[1] = 3221225472;
    v240[2] = __52__HDCloudSyncPullStoreOperation__fetchChangeRecords__block_invoke;
    v240[3] = &unk_1E6CEA418;
    v240[4] = self;
    v241 = 0;
    objc_msgSend(v205, "recordsForClass:error:filter:", v135, &v241, v240);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = (uint64_t (*)(uint64_t, uint64_t))v241;
    if (!v206)
    {
      _HKInitializeLogging();
      v195 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v200 = self->_target;
        v201 = v195;
        -[HDCloudSyncTarget zoneIdentifier](v200, "zoneIdentifier");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v202;
        *(_WORD *)&buf[22] = 2114;
        v272 = v204;
        _os_log_error_impl(&dword_1B7802000, v201, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get change records for %{public}@, %{public}@", buf, 0x20u);

      }
      -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v204);
      goto LABEL_143;
    }
    if (!objc_msgSend(v206, "count"))
    {
      _HKInitializeLogging();
      v196 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v197 = self->_target;
        v198 = v196;
        -[HDCloudSyncTarget zoneIdentifier](v197, "zoneIdentifier");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v199;
        *(_WORD *)&buf[22] = 2114;
        v272 = v204;
        _os_log_impl(&dword_1B7802000, v198, OS_LOG_TYPE_DEFAULT, "%{public}@ No change records fetched from cache for %{public}@, %{public}@", buf, 0x20u);

      }
      -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
      goto LABEL_143;
    }
    v136 = v206;
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "orderedSequenceRecords");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke;
    v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D10900;
    v139 = v136;
    *(_QWORD *)v273 = v139;
    objc_msgSend(v138, "hk_mapToDictionary:", buf);
    v210 = (void *)objc_claimAutoreleasedReturnValue();

    v140 = [HDCloudSyncCompoundOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v140, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v141, 0, CFSTR("Pull Sequences"), 0);

    v245 = 0u;
    v243 = 0u;
    v244 = 0u;
    v242 = 0u;
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "orderedSequenceRecords");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v211 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, &v265, 16);
    if (!v211)
    {
LABEL_134:

      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke;
      v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE77A0;
      *(_QWORD *)v273 = self;
      -[HDCloudSyncOperation setOnError:](v207, "setOnError:", buf);
      *(_QWORD *)v274 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v274[8] = 3221225472;
      *(_QWORD *)&v274[16] = __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke_2;
      v275 = &unk_1E6CE7778;
      *(_QWORD *)&v276 = self;
      -[HDCloudSyncOperation setOnSuccess:](v207, "setOnSuccess:", v274);
      -[HDCloudSyncOperation progress](self, "progress");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation progress](v207, "progress");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation progress](self, "progress");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = objc_msgSend(v192, "totalUnitCount");
      -[HDCloudSyncOperation progress](self, "progress");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "addChild:withPendingUnitCount:", v191, v193 - objc_msgSend(v194, "completedUnitCount"));

      -[HDCloudSyncCompoundOperation start](v207, "start");
      goto LABEL_142;
    }
    v209 = *(_QWORD *)v243;
    while (1)
    {
      v143 = 0;
      do
      {
        if (*(_QWORD *)v243 != v209)
        {
          v144 = v143;
          objc_enumerationMutation(obj);
          v143 = v144;
        }
        v213 = v143;
        v145 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v143);
        objc_msgSend(v145, "recordID");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v210, "objectForKeyedSubscript:", v146);
        v215 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v215, "count"))
        {
          v147 = v215;
          v214 = v145;
          v223 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[HDCloudSyncTarget store](self->_target, "store");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "syncStoreForEpoch:", objc_msgSend(v214, "baselineEpoch"));
          v229 = (void *)objc_claimAutoreleasedReturnValue();

          v252 = 0;
          objc_msgSend(v229, "receivedSyncAnchorMapWithError:", &v252);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          v212 = v252;
          v149 = v231;
          if (!v231)
          {
            _HKInitializeLogging();
            v150 = *MEMORY[0x1E0CB5370];
            v149 = 0;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v212;
              _os_log_error_impl(&dword_1B7802000, v150, OS_LOG_TYPE_ERROR, "%{public}@: error calling receivedSyncAnchorMapWithError: %{public}@", buf, 0x16u);
            }
          }
          v227 = (void *)objc_msgSend(v149, "copy");
          v250 = 0u;
          v251 = 0u;
          v248 = 0u;
          v249 = 0u;
          v219 = v147;
          v234 = objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v248, buf, 16);
          if (v234)
          {
            v225 = *(_QWORD *)v249;
            do
            {
              for (i = 0; i != v234; ++i)
              {
                if (*(_QWORD *)v249 != v225)
                  objc_enumerationMutation(v219);
                v152 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * i);
                objc_msgSend(v152, "decodedSyncAnchorRangeMap");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v229, "shardPredicate");
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                v155 = objc_msgSend(v154, "type") == 2;
                v156 = v153;
                v157 = v227;
                if (v156 && (!objc_msgSend(v156, "anchorRangeCount") ? (v158 = 1) : (v158 = v227 == 0), !v158))
                {
                  -[HDCloudSyncOperation configuration](self, "configuration");
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v161, "repository");
                  v162 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v162, "profile");
                  v163 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v163, "legacyRepositoryProfile");
                  v164 = (void *)objc_claimAutoreleasedReturnValue();

                  v259 = 0;
                  v260 = &v259;
                  v261 = 0x2020000000;
                  v262 = 1;
                  v253 = 0;
                  v254 = &v253;
                  v255 = 0x3032000000;
                  v256 = __Block_byref_object_copy__205;
                  v257 = __Block_byref_object_dispose__205;
                  v258 = 0;
                  *(_QWORD *)v274 = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&v274[8] = 3221225472;
                  *(_QWORD *)&v274[16] = __93__HDCloudSyncPullStoreOperation__isValidAnchorRangeMap_lastAnchorMap_allowStartingGap_error___block_invoke;
                  v275 = &unk_1E6D10928;
                  v165 = v164;
                  *(_QWORD *)&v276 = v165;
                  v166 = v157;
                  v279 = v155;
                  *((_QWORD *)&v276 + 1) = v166;
                  v277 = &v253;
                  v278 = &v259;
                  objc_msgSend(v156, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v274);
                  v167 = (id)v254[5];
                  v159 = v167;
                  if (v167)
                    v168 = objc_retainAutorelease(v167);

                  v160 = *((_BYTE *)v260 + 24) != 0;
                  _Block_object_dispose(&v253, 8);

                  _Block_object_dispose(&v259, 8);
                }
                else
                {
                  v159 = 0;
                  v160 = 1;
                }

                v169 = v159;
                if (!v160)
                {
                  _HKInitializeLogging();
                  v170 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    v179 = v170;
                    v180 = objc_msgSend(v152, "changeIndex");
                    *(_DWORD *)v274 = 138544130;
                    *(_QWORD *)&v274[4] = self;
                    *(_WORD *)&v274[12] = 2048;
                    *(_QWORD *)&v274[14] = v180;
                    *(_WORD *)&v274[22] = 2114;
                    v275 = v156;
                    LOWORD(v276) = 2114;
                    *(_QWORD *)((char *)&v276 + 2) = v169;
                    _os_log_error_impl(&dword_1B7802000, v179, OS_LOG_TYPE_ERROR, "%{public}@: %lld %{public}@ - failed validity check: %{public}@", v274, 0x2Au);

                  }
                }
                v246[0] = MEMORY[0x1E0C809B0];
                v171 = v156 == 0;
                v246[1] = 3221225472;
                v246[2] = __95__HDCloudSyncPullStoreOperation__requiredRecordsWithOrderedChangeRecords_sequenceRecord_error___block_invoke;
                v246[3] = &unk_1E6CEB4E8;
                v247 = v157;
                objc_msgSend(v156, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v246);
                v172 = v156;
                v173 = v231;
                if (!v171 && objc_msgSend(v172, "anchorRangeCount") && objc_msgSend(v173, "anchorCount"))
                {
                  v253 = 0;
                  v254 = &v253;
                  v255 = 0x2020000000;
                  LOBYTE(v256) = 0;
                  *(_QWORD *)v274 = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&v274[8] = 3221225472;
                  *(_QWORD *)&v274[16] = __78__HDCloudSyncPullStoreOperation__shouldApplyAnchorRangeMap_receivedAnchorMap___block_invoke;
                  v275 = &unk_1E6CEB760;
                  v174 = v173;
                  *(_QWORD *)&v276 = v174;
                  *((_QWORD *)&v276 + 1) = &v253;
                  objc_msgSend(v172, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v274);
                  v175 = *((_BYTE *)v254 + 24) == 0;

                  _Block_object_dispose(&v253, 8);
                  if (v175)
                    goto LABEL_121;
                }
                else
                {

                }
                _HKInitializeLogging();
                v176 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                {
                  v177 = v176;
                  v178 = objc_msgSend(v152, "changeIndex");
                  *(_DWORD *)v274 = 138543874;
                  *(_QWORD *)&v274[4] = self;
                  *(_WORD *)&v274[12] = 2048;
                  *(_QWORD *)&v274[14] = v178;
                  *(_WORD *)&v274[22] = 2114;
                  v275 = v172;
                  _os_log_impl(&dword_1B7802000, v177, OS_LOG_TYPE_DEFAULT, "%{public}@: %lld %{public}@", v274, 0x20u);

                }
                objc_msgSend(v223, "addObject:", v152);
LABEL_121:

              }
              v234 = objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v248, buf, 16);
            }
            while (v234);
          }

          if (!v223)
          {
            -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, 0);

LABEL_142:
LABEL_143:

LABEL_144:
            return;
          }
          _HKInitializeLogging();
          v181 = (id)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
          {
            v182 = objc_msgSend(v214, "slot");
            if ((v182 - 1) >= 3)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v182);
              v183 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v183 = off_1E6D10948[(int)v182 - 1];
            }
            v184 = v183;
            v185 = objc_msgSend(v223, "count");
            v186 = objc_msgSend(v219, "count");
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v183;
            *(_WORD *)&buf[22] = 2048;
            v272 = (uint64_t (*)(uint64_t, uint64_t))v185;
            *(_WORD *)v273 = 2048;
            *(_QWORD *)&v273[2] = v186;
            _os_log_impl(&dword_1B7802000, v181, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %lu/%lu required changes.", buf, 0x2Au);

          }
          if (objc_msgSend(v223, "count"))
          {
            v187 = [HDCloudSyncPullSequenceOperation alloc];
            -[HDCloudSyncOperation configuration](self, "configuration");
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            v189 = -[HDCloudSyncPullSequenceOperation initWithConfiguration:cloudState:target:sequence:changes:](v187, "initWithConfiguration:cloudState:target:sequence:changes:", v188, 0, self->_target, v214, v223);

            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v207, "addOperation:transitionHandler:", v189, 0);
          }

        }
        v143 = v213 + 1;
      }
      while (v213 + 1 != v211);
      v211 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, &v265, 16);
      if (!v211)
        goto LABEL_134;
    }
  }
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v52 = self->_target;
    v53 = v4;
    -[HDCloudSyncTarget storeRecord](v52, "storeRecord");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "requiredProtocolVersion");
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "systemBuildVersion");
    v57 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "productType");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "deviceName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v55;
    *(_WORD *)&buf[22] = 2114;
    v272 = v57;
    *(_WORD *)v273 = 2114;
    *(_QWORD *)&v273[2] = v59;
    *(_WORD *)&v273[10] = 2114;
    *(_QWORD *)&v273[12] = v61;
    _os_log_error_impl(&dword_1B7802000, v53, OS_LOG_TYPE_ERROR, "%{public}@: Found incomprehensible required protocol version %ld (from %{public}@ on a %{public}@: '%{public}@')", buf, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 703, CFSTR("Health data from a future system version is present in iCloud and cannot be handled by this device."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v263[0] = *MEMORY[0x1E0CB4E08];
  -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1E6D11BB8;
  v264[0] = v9;
  v263[1] = *MEMORY[0x1E0CB4E10];
  -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "productType");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E6D11BB8;
  v264[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v264, v263, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_errorByAddingEntriesToUserInfo:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncPullStoreOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v15);
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncPullStoreOperation;
  v5 = -[HDCloudSyncOperation finishWithSuccess:error:](&v16, sel_finishWithSuccess_error_, a3, a4) && a3;
  if (v5 == 1)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "repository");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legacyRepositoryProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "profileType") != 3
      || (-[HDCloudSyncTarget storeRecord](self->_target, "storeRecord"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "deviceMode"),
          v10,
          v11 == 2))
    {
      -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "record");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "modificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      HDCloudSyncDidPullUpdateWithDate(v14, v9);
    }

  }
  return v5;
}

uint64_t __52__HDCloudSyncPullStoreOperation__fetchChangeRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  objc_msgSend(a2, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 112), "storeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tombstoneSequenceRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(v2 + 112), "storeRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tombstoneSequenceRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[HDCloudSyncChangeRecord isChangeRecord:inSequence:](HDCloudSyncChangeRecord, "isChangeRecord:inSequence:", v3, v7);

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(*(id *)(v2 + 112), "storeRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sequenceRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v8 | +[HDCloudSyncChangeRecord isChangeRecord:inSequence:](HDCloudSyncChangeRecord, "isChangeRecord:inSequence:", v3, v10);
  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      v14 = v12;
      objc_msgSend(v3, "recordID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v2;
      v18 = 2114;
      v19 = v15;
      _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: is not in tombstone sequence or pull sequence, do not add", (uint8_t *)&v16, 0x16u);

    }
  }

  return v11;
}

uint64_t __55__HDCloudSyncPullStoreOperation__resetPullState_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "storeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSequenceHeaderRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HDCloudSyncChangeRecord isChangeRecord:inSequence:](HDCloudSyncChangeRecord, "isChangeRecord:inSequence:", v4, v6))
  {

  }
  else
  {
    objc_msgSend(v3, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "storeRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oldSequenceHeaderRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[HDCloudSyncChangeRecord isChangeRecord:inSequence:](HDCloudSyncChangeRecord, "isChangeRecord:inSequence:", v7, v9);

    if (!v10)
    {
      v12 = 1;
      goto LABEL_7;
    }
  }
  v11 = objc_msgSend(v3, "protocolVersion");
  v12 = 1;
  if (v11 > (int)objc_msgSend(*(id *)(a1 + 40), "syncProtocolVersion"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v12 = 0;
  }
LABEL_7:

  return v12;
}

- (BOOL)_copyAnchorsOfType:(void *)a1 from:(void *)a2 to:(void *)a3 error:(uint64_t)a4
{
  id v7;
  HDSyncAnchorMap *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  id v23;

  v23 = a3;
  v7 = a2;
  v8 = objc_alloc_init(HDSyncAnchorMap);
  objc_msgSend(a1, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[HDSyncAnchorEntity getSyncAnchorsOfType:anchorMap:store:profile:error:](HDSyncAnchorEntity, "getSyncAnchorsOfType:anchorMap:store:profile:error:", 3, v8, v7, v12, a4);

  if (v13)
  {
    objc_msgSend(a1, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "syncDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "repository");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "legacyRepositoryProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;
    v21 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:](HDSyncAnchorEntity, "updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:", v8, 3, v15, v23, 2, 0, v19, a4);

  }
  else
  {
    v21 = 0;
    v20 = v23;
  }

  return v21;
}

- (uint64_t)_requiresSyncForSequence:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDSyncAnchorMap *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v5 = a2;
  objc_msgSend(a1[14], "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;
  objc_msgSend(v6, "syncStoreForEpoch:", objc_msgSend(v5, "baselineEpoch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "repository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "legacyRepositoryProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a3;
  LODWORD(a3) = objc_msgSend(v10, "updateLocalVersionsForStore:profile:error:", v7, v14, a3);

  if ((_DWORD)a3)
  {
    v15 = v30;
    objc_msgSend(v30, "syncAnchorMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(HDSyncAnchorMap);
    objc_msgSend(a1, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "repository");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "legacyRepositoryProfile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[HDSyncAnchorEntity getSyncAnchorsOfType:anchorMap:store:profile:error:](HDSyncAnchorEntity, "getSyncAnchorsOfType:anchorMap:store:profile:error:", 3, v17, v7, v21, v29);

    v23 = v7;
    if (v22)
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__205;
      v38 = __Block_byref_object_dispose__205;
      v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "orderedSyncEntities");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke;
      v31[3] = &unk_1E6D03998;
      v25 = v24;
      v32 = v25;
      v33 = &v34;
      objc_msgSend(v16, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v31);
      +[HDSyncAnchorMap syncAnchorMapWithDictionary:](HDSyncAnchorMap, "syncAnchorMapWithDictionary:", v35[5]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (HDSyncAnchorMapIsSuperset(v26, v17))
        v27 = 2;
      else
        v27 = 1;

      _Block_object_dispose(&v34, 8);
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
    v15 = v30;
    v23 = v7;
  }

  return v27;
}

void __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke_2;
  v9[3] = &unk_1E6CFC3C8;
  v8 = v5;
  v10 = v8;
  if (objc_msgSend(v6, "hk_containsObjectPassingTest:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v7, v8);

  }
}

uint64_t __64__HDCloudSyncPullStoreOperation__requiresSyncForSequence_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "syncEntityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    v7 = 1;
  }
  else if (v5)
  {
    objc_msgSend(a2, "syncEntityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

uint64_t __55__HDCloudSyncPullStoreOperation__fetchedChangeRecords___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

void __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke_2;
  v12[3] = &unk_1E6D108D8;
  v11 = v5;
  v13 = v11;
  objc_msgSend(v7, "hk_filter:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v11, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10, v9);

  }
}

uint64_t __97__HDCloudSyncPullStoreOperation__orderedChangeRecordsBySequenceRecordIDWithFetchedChangeRecords___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sequenceRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __95__HDCloudSyncPullStoreOperation__requiredRecordsWithOrderedChangeRecords_sequenceRecord_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnchor:forSyncEntityIdentifier:", a4, a2);
}

void __93__HDCloudSyncPullStoreOperation__isValidAnchorRangeMap_lastAnchorMap_allowStartingGap_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id obj;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "syncEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allSyncEntitiesByIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "objectForKeyedSubscript:", v9);

  if (v12)
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "anchorForSyncEntityIdentifier:", v9);
    if (a3 > v13)
    {
      v14 = v13;
      if (v13 > 0 || !*(_BYTE *)(a1 + 64))
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v16 + 40);
        HDSyncAnchorRangeDescription(a3, a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hk_assignError:code:format:", &obj, 1400, CFSTR("anchor range %@ invalid for %@, last anchor %lld"), v17, v9, v14);
        objc_storeStrong((id *)(v16 + 40), obj);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *a5 = 1;
      }
    }
  }

}

uint64_t __78__HDCloudSyncPullStoreOperation__shouldApplyAnchorRangeMap_receivedAnchorMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:", a2);
  if (a4 > result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

BOOL __63__HDCloudSyncPullStoreOperation__childSyncIdentitiesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncIdentityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childIdentitiesForCurrentSyncIdentityWithTransaction:error:", v6, a3);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)hasAppliedChange
{
  return self->_hasAppliedChange;
}

- (HDCloudSyncTarget)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
}

@end
