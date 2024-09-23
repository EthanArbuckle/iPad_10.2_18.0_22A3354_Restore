@implementation HDCloudSyncAddSharingParticipantOperation

- (HDCloudSyncAddSharingParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncAddSharingParticipantOperation *v4;
  HDCloudSyncAddSharingParticipantOperation *v5;
  NSMutableArray *v6;
  NSMutableArray *clonedParticipants;
  NSArray *zoneIdentifiers;
  NSArray *v9;
  HDSynchronousTaskGroup *v10;
  HDSynchronousTaskGroup *taskGroup;
  NSArray *shareURLs;
  NSDictionary *invitationTokensByShareURL;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAddSharingParticipantOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v15, sel_initWithConfiguration_cloudState_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    clonedParticipants = v5->_clonedParticipants;
    v5->_clonedParticipants = v6;

    zoneIdentifiers = v5->_zoneIdentifiers;
    v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v5->_zoneIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];

    v10 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v10;

    -[HDSynchronousTaskGroup setDelegate:](v5->_taskGroup, "setDelegate:", v5);
    shareURLs = v5->_shareURLs;
    v5->_shareURLs = v9;

    invitationTokensByShareURL = v5->_invitationTokensByShareURL;
    v5->_invitationTokensByShareURL = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v5;
}

- (CKShareParticipant)participant
{
  os_unfair_lock_s *p_lock;
  CKShareParticipant *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_participant;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setParticipant:(id)a3
{
  CKShareParticipant *v5;
  CKShareParticipant *participant;
  void *v7;

  v5 = (CKShareParticipant *)a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncAddSharingParticipantOperation.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  participant = self->_participant;
  self->_participant = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)zoneIdentifiers
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_zoneIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setZoneIdentifiers:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *zoneIdentifiers;
  void *v8;

  v5 = a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncAddSharingParticipantOperation.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  zoneIdentifiers = self->_zoneIdentifiers;
  self->_zoneIdentifiers = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)requireExistingRelationship
{
  HDCloudSyncAddSharingParticipantOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_requireExistingRelationship;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRequireExistingRelationship:(BOOL)a3
{
  void *v6;

  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncAddSharingParticipantOperation.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  self->_requireExistingRelationship = a3;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  HDCloudSyncAddSharingParticipantOperation *v2;
  CKShareParticipant *participant;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  HDCloudSyncCachedZone *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  HDCloudSyncAddSharingParticipantOperation *v29;
  _UNKNOWN **v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  CKShareParticipant *v53;
  id v54;
  id v55;
  void *v56;
  CKShareParticipant *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  HDCloudSyncAddSharingParticipantOperation *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  NSObject *v73;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  HDCloudSyncRegistryRecord *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  HDCloudSyncModifyRecordsOperation *v116;
  void *v117;
  HDCloudSyncModifyRecordsOperation *v118;
  uint64_t v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  void *v126;
  NSObject *v127;
  void *v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  void *v134;
  CKShareParticipant *v135;
  void *v136;
  uint64_t v137;
  id v138;
  id v139;
  id v140;
  void *v141;
  NSArray *obj;
  id obja;
  id objb;
  CKShareParticipant *v145;
  NSArray *v146;
  id v147;
  id v149;
  _QWORD v150[5];
  _QWORD v151[5];
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  id v156;
  uint8_t v157[128];
  _BYTE v158[24];
  void *v159;
  id v160;
  uint8_t v161[32];
  __int128 v162;
  __int128 v163;
  _BYTE buf[12];
  __int16 v165;
  id v166;
  __int16 v167;
  id v168;
  _BYTE v169[24];
  void *v170;
  CKShareParticipant *v171;
  uint64_t v172;

  v2 = self;
  v172 = *MEMORY[0x1E0C80C00];
  participant = self->_participant;
  if (!participant)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("_participant"), objc_opt_class(), a2);
    v149 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0);

    return;
  }
  if (self->_requireExistingRelationship)
  {
    v145 = participant;
    memset(v161, 0, sizeof(v161));
    v162 = 0u;
    v163 = 0u;
    obj = v2->_zoneIdentifiers;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v161, v158, 16);
    if (!v4)
      goto LABEL_17;
    v5 = v4;
    v6 = **(_QWORD **)&v161[16];
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (**(_QWORD **)&v161[16] != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*(_QWORD *)&v161[8] + 8 * i);
        v9 = [HDCloudSyncCachedZone alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "repository");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessibilityAssertion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v9, "initForZoneIdentifier:repository:accessibilityAssertion:", v8, v11, v13);

        *(_QWORD *)buf = 0;
        objc_msgSend(v14, "zoneShareWithError:", buf);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(id *)buf;
        v17 = v16;
        if (v15)
          v18 = 1;
        else
          v18 = v16 == 0;
        if (!v18)
        {
          _HKInitializeLogging();
          v23 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v169 = 138543874;
            *(_QWORD *)&v169[4] = self;
            *(_WORD *)&v169[12] = 2114;
            *(_QWORD *)&v169[14] = v8;
            *(_WORD *)&v169[22] = 2114;
            v170 = v17;
            _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v169, 0x20u);
          }
          v25 = objc_retainAutorelease(v17);

          v22 = v25;
          -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v22);
          goto LABEL_22;
        }
        if (v15)
        {
          objc_msgSend(v15, "participants");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v145);

          if ((v20 & 1) != 0)
          {

            v2 = self;
            goto LABEL_24;
          }
        }

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v161, v158, 16);
      if (!v5)
      {
LABEL_17:

        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 707, CFSTR("Participant not found on any zones: %@"), self->_participant);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v21);

        v22 = 0;
LABEL_22:

        return;
      }
    }
  }
LABEL_24:
  -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  -[HDCloudSyncOperation configuration](v2, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "repository");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allCKContainers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = self;
  v129 = v28;
  v131 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v152, v157, 16);
  if (!v131)
    goto LABEL_107;
  v130 = *(_QWORD *)v153;
  v30 = &off_1E6CE2000;
  do
  {
    v31 = 0;
    do
    {
      if (*(_QWORD *)v153 != v130)
        objc_enumerationMutation(v129);
      v132 = v31;
      v32 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * v31);
      -[HDSynchronousTaskGroup beginTask](v29->_taskGroup, "beginTask");
      v135 = v29->_participant;
      v33 = v32;
      v133 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      memset(v161, 0, sizeof(v161));
      v162 = 0u;
      v163 = 0u;
      v146 = v29->_zoneIdentifiers;
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v146, "countByEnumeratingWithState:objects:count:", v161, v158, 16);
      if (v34)
      {
        v35 = (id)v34;
        v36 = **(_QWORD **)&v161[16];
        v137 = **(_QWORD **)&v161[16];
        v140 = v33;
        while (2)
        {
          v37 = 0;
          obja = v35;
          do
          {
            if (**(_QWORD **)&v161[16] != v36)
              objc_enumerationMutation(v146);
            v38 = *(void **)(*(_QWORD *)&v161[8] + 8 * (_QWORD)v37);
            objc_msgSend(v38, "containerIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "containerIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v39, "isEqualToString:", v40);

            if (v41)
            {
              v42 = objc_alloc((Class)v30[310]);
              -[HDCloudSyncOperation configuration](v29, "configuration");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "repository");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDCloudSyncOperation configuration](v29, "configuration");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "accessibilityAssertion");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)objc_msgSend(v42, "initForZoneIdentifier:repository:accessibilityAssertion:", v38, v44, v46);

              if (objc_msgSend(v47, "zoneType") != 4)
              {
                v156 = 0;
                objc_msgSend(v47, "zoneShareWithError:", &v156);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = v156;
                v50 = v49;
                if (!v48 && v49)
                {
                  _HKInitializeLogging();
                  v73 = *MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v169 = 138543874;
                    *(_QWORD *)&v169[4] = v29;
                    *(_WORD *)&v169[12] = 2114;
                    *(_QWORD *)&v169[14] = v38;
                    *(_WORD *)&v169[22] = 2114;
                    v170 = v50;
                    _os_log_error_impl(&dword_1B7802000, v73, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v169, 0x20u);
                  }
                  v72 = objc_retainAutorelease(v50);

                  v71 = 0;
                  v33 = v140;
                  v70 = v133;
                  goto LABEL_60;
                }
                if (!v48)
                {
                  v51 = objc_alloc(MEMORY[0x1E0C95110]);
                  objc_msgSend(v38, "zoneIdentifier");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = (void *)objc_msgSend(v51, "initWithRecordZoneID:", v52);

                }
                v53 = v135;
                v54 = v38;
                v55 = v48;
                objc_msgSend(v55, "participants");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)v169 = MEMORY[0x1E0C809B0];
                *(_QWORD *)&v169[8] = 3221225472;
                *(_QWORD *)&v169[16] = __90__HDCloudSyncAddSharingParticipantOperation__addParticipantIfNeeded_zoneIdentifier_share___block_invoke;
                v170 = &unk_1E6CF1B78;
                v57 = v53;
                v171 = v57;
                objc_msgSend(v56, "hk_firstObjectPassingTest:", v169);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58
                  && (v59 = v58,
                      v60 = objc_msgSend(v59, "acceptanceStatus"),
                      v61 = objc_msgSend(v59, "permission"),
                      v59,
                      v60 == 2)
                  && v61 == 3)
                {
                  _HKInitializeLogging();
                  v62 = *MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    v63 = self;
                    *(_QWORD *)&buf[4] = self;
                    v165 = 2114;
                    v166 = v54;
                    v167 = 2114;
                    v168 = v59;
                    _os_log_impl(&dword_1B7802000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Skipping, zone already contains this participant: %{public}@.", buf, 0x20u);
                    v64 = 0;
                  }
                  else
                  {
                    v64 = 0;
                    v63 = self;
                  }
                }
                else
                {
                  v64 = (void *)-[CKShareParticipant copy](v57, "copy");
                  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "UUIDString");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setParticipantID:", v66);

                  objc_msgSend(v64, "setPermission:", 3);
                  objc_msgSend(v55, "addParticipant:", v64);
                  v63 = self;
                  os_unfair_lock_lock(&self->_lock);
                  -[NSMutableArray addObject:](self->_clonedParticipants, "addObject:", v64);
                  os_unfair_lock_unlock(&self->_lock);
                }

                if (v64)
                {
                  _HKInitializeLogging();
                  v67 = *MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v169 = 138543874;
                    *(_QWORD *)&v169[4] = v63;
                    *(_WORD *)&v169[12] = 2114;
                    *(_QWORD *)&v169[14] = v54;
                    *(_WORD *)&v169[22] = 2114;
                    v170 = v64;
                    _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Added participant: %{public}@", v169, 0x20u);
                  }
                  objc_msgSend(v133, "setObject:forKeyedSubscript:", v55, v54);
                }
                objc_msgSend(v55, "owner");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncAddSharingParticipantOperation _foundOwnerParticipant:]((uint64_t)self, v68);

                v29 = self;
                v30 = &off_1E6CE2000;
              }

              v36 = v137;
              v33 = v140;
              v35 = obja;
            }
            v37 = (char *)v37 + 1;
          }
          while (v35 != v37);
          v69 = -[NSArray countByEnumeratingWithState:objects:count:](v146, "countByEnumeratingWithState:objects:count:", v161, v158, 16);
          v35 = (id)v69;
          if (v69)
            continue;
          break;
        }
      }

      v70 = v133;
      v71 = v133;
      v72 = 0;
LABEL_60:

      v74 = v72;
      v75 = v74;
      if (!v71 && v74)
      {
        -[HDSynchronousTaskGroup failTaskWithError:](v29->_taskGroup, "failTaskWithError:", v74);
        goto LABEL_105;
      }
      objc_msgSend(v71, "allValues");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "count");

      if (!v77)
      {
        v29 = self;
        -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
        goto LABEL_105;
      }
      objc_msgSend(v71, "allValues");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v33;
      -[HDCloudSyncOperation configuration](self, "configuration");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "repository");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "behavior");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "tinkerModeEnabled");

      if (v83)
      {
        -[HDCloudSyncOperation configuration](self, "configuration");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "cachedCloudState");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v169 = 0;
        objc_msgSend(v85, "zonesByIdentifierWithError:", v169);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = *(id *)v169;

        if (!v86 && v87)
        {
          _HKInitializeLogging();
          v88 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v158 = 138543618;
            *(_QWORD *)&v158[4] = self;
            *(_WORD *)&v158[12] = 2114;
            *(_QWORD *)&v158[14] = v87;
            _os_log_error_impl(&dword_1B7802000, v88, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", v158, 0x16u);
          }
          v89 = 0;
          goto LABEL_101;
        }
        v141 = v86;
        objc_msgSend(v86, "allValues");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v158 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v158[8] = 3221225472;
        *(_QWORD *)&v158[16] = __88__HDCloudSyncAddSharingParticipantOperation__updatedRegistryRecordIfNeededForContainer___block_invoke;
        v159 = &unk_1E6CE93D8;
        v91 = v79;
        v160 = v91;
        objc_msgSend(v90, "hk_filter:", v158);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        v147 = v92;
        if ((unint64_t)objc_msgSend(v92, "count") >= 2)
        {
          _HKInitializeLogging();
          v93 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
          {
            v120 = v93;
            objc_msgSend(v91, "containerIdentifier");
            v139 = v87;
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "profileIdentifier");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            HDDatabaseForContainer(v91, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "databaseScope");
            CKDatabaseScopeString();
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v161 = 138543874;
            *(_QWORD *)&v161[4] = self;
            *(_WORD *)&v161[12] = 2114;
            *(_QWORD *)&v161[14] = v121;
            *(_WORD *)&v161[22] = 2114;
            *(_QWORD *)&v161[24] = v124;
            _os_log_fault_impl(&dword_1B7802000, v120, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple cached unified zone for container %{public}@, database %{public}@. This is unexpected.", v161, 0x20u);

            v30 = &off_1E6CE2000;
            v87 = v139;

          }
        }
        objc_msgSend(v147, "firstObject");
        v94 = objc_claimAutoreleasedReturnValue();
        objb = (id)v94;
        if (!v94)
        {
          _HKInitializeLogging();
          v100 = *MEMORY[0x1E0CB5370];
          v86 = v141;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v161 = 138543362;
            *(_QWORD *)&v161[4] = self;
            _os_log_error_impl(&dword_1B7802000, v100, OS_LOG_TYPE_ERROR, "%{public}@ Unified zone does not exist.", v161, 0xCu);
          }
          v89 = 0;
          goto LABEL_100;
        }
        v95 = (void *)v94;
        v138 = v87;
        v96 = objc_opt_class();
        *(_QWORD *)buf = 0;
        objc_msgSend(v95, "recordsForClass:error:", v96, buf);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = *(id *)buf;
        v86 = v141;
        v136 = v98;
        if (!v97 && v98)
        {
          _HKInitializeLogging();
          v99 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v125 = v99;
            objc_msgSend(v95, "zoneIdentifier");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v161 = 138543874;
            *(_QWORD *)&v161[4] = self;
            *(_WORD *)&v161[12] = 2114;
            *(_QWORD *)&v161[14] = v126;
            *(_WORD *)&v161[22] = 2114;
            *(_QWORD *)&v161[24] = v136;
            _os_log_error_impl(&dword_1B7802000, v125, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", v161, 0x20u);

          }
          v89 = 0;
LABEL_99:

          v87 = v138;
LABEL_100:

LABEL_101:
          goto LABEL_102;
        }
        if ((unint64_t)objc_msgSend(v97, "count") >= 2)
        {
          _HKInitializeLogging();
          v101 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
          {
            v127 = v101;
            objc_msgSend(objb, "zoneIdentifier");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v161 = 138543618;
            *(_QWORD *)&v161[4] = self;
            *(_WORD *)&v161[12] = 2114;
            *(_QWORD *)&v161[14] = v128;
            _os_log_fault_impl(&dword_1B7802000, v127, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@. This is unexpected.", v161, 0x16u);

          }
        }
        objc_msgSend(v97, "firstObject");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        if (v102)
        {
          v103 = v102;
          objc_msgSend(v102, "sharedProfileIdentifier");
          v104 = objc_claimAutoreleasedReturnValue();
          if (v104)
          {
            v105 = (void *)v104;
            objc_msgSend(v103, "ownerProfileIdentifier");
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            if (v106)
            {
              v89 = 0;
              goto LABEL_97;
            }
          }
          objc_msgSend(v103, "ownerProfileIdentifier");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v107)
          {
            objc_msgSend(v81, "profileIdentifier");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "setOwnerProfileIdentifier:", v108);

          }
          objc_msgSend(v103, "sharedProfileIdentifier");
          v109 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = &off_1E6CE2000;
          if (!v109)
          {
            objc_msgSend(v81, "profileIdentifier");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDCloudSyncRegistryRecord sharedProfileIdentifierForOwnerProfileIdentifier:](HDCloudSyncRegistryRecord, "sharedProfileIdentifierForOwnerProfileIdentifier:", v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "setSharedProfileIdentifier:", v111);

            v30 = &off_1E6CE2000;
          }
          objc_msgSend(v103, "record");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v112 = [HDCloudSyncRegistryRecord alloc];
          objc_msgSend(objb, "zoneIdentifier");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "zoneIdentifier");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "profileIdentifier");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = -[HDCloudSyncRegistryRecord initInZone:ownerProfileIdentifier:](v112, "initInZone:ownerProfileIdentifier:", v113, v114);

          objc_msgSend(v103, "record");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_97:
          v30 = &off_1E6CE2000;
        }

        goto LABEL_99;
      }
      v89 = 0;
LABEL_102:

      if (v89)
      {
        objc_msgSend(v78, "arrayByAddingObject:", v89);
        v115 = objc_claimAutoreleasedReturnValue();

        v78 = (void *)v115;
      }
      v116 = [HDCloudSyncModifyRecordsOperation alloc];
      -[HDCloudSyncOperation configuration](self, "configuration");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v116, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v117, v79, v78, 0);

      v29 = self;
      -[HDCloudSyncModifyRecordsOperation setTreatAnyErrorAsFatal:](v118, "setTreatAnyErrorAsFatal:", 1);
      v119 = MEMORY[0x1E0C809B0];
      v151[0] = MEMORY[0x1E0C809B0];
      v151[1] = 3221225472;
      v151[2] = __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke;
      v151[3] = &unk_1E6CE77A0;
      v151[4] = self;
      -[HDCloudSyncOperation setOnError:](v118, "setOnError:", v151);
      v150[0] = v119;
      v150[1] = 3221225472;
      v150[2] = __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke_198;
      v150[3] = &unk_1E6CE7778;
      v150[4] = self;
      -[HDCloudSyncOperation setOnSuccess:](v118, "setOnSuccess:", v150);
      -[HDCloudSyncOperation start](v118, "start");

LABEL_105:
      v31 = v132 + 1;
    }
    while (v132 + 1 != v131);
    v131 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v152, v157, 16);
  }
  while (v131);
LABEL_107:

  -[HDSynchronousTaskGroup finishTask](v29->_taskGroup, "finishTask");
}

void __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update shares: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "failTaskWithError:", v4);

}

void __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke_198(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v65 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated share records", buf, 0xCu);
  }
  objc_msgSend(v3, "savedRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_map:", &__block_literal_global_56);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  v9 = v7;
  if (v8)
  {
    v40 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 104));
    v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v39 = v9;
    obj = v9;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, buf, 16);
    if (!v43)
      goto LABEL_33;
    v42 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v52 != v42)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v11, "owner", v39);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncAddSharingParticipantOperation _foundOwnerParticipant:](v8, v12);

        _HKInitializeLogging();
        v13 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v55 = 138543618;
          v56 = v8;
          v57 = 2114;
          v58 = v11;
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Looking for added participant on share: %{public}@", v55, 0x16u);
        }
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(v11, "participants");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        if (!v15)
        {

LABEL_29:
          _HKInitializeLogging();
          v30 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v31 = v30;
            objc_msgSend(v11, "participants");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "recordID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "zoneID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v55 = 138543874;
            v56 = v8;
            v57 = 2114;
            v58 = v32;
            v59 = 2114;
            v60 = v34;
            _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find a matching participant with pending status in the participants (%{public}@) for zone %{public}@", v55, 0x20u);

          }
          continue;
        }
        v16 = v15;
        v44 = i;
        v17 = 0;
        v18 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v48 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            _HKInitializeLogging();
            v21 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v55 = 138543618;
              v56 = v8;
              v57 = 2114;
              v58 = v20;
              _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Found candidate participant: %{public}@", v55, 0x16u);
            }
            if (objc_msgSend(*(id *)(v8 + 120), "containsObject:", v20))
            {
              if (objc_msgSend(v20, "acceptanceStatus") == 1)
              {
                objc_msgSend(v11, "URL");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                {
                  objc_msgSend(v11, "URL");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "addObject:", v23);

                  objc_msgSend(v20, "invitationToken");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "URL");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "setObject:forKeyedSubscript:", v24, v25);

                  _HKInitializeLogging();
                  v26 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    v27 = v26;
                    objc_msgSend(v11, "URL");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "invitationToken");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v55 = 138544130;
                    v56 = v8;
                    v57 = 2114;
                    v58 = v20;
                    v59 = 2114;
                    v60 = v28;
                    v61 = 2114;
                    v62 = v29;
                    _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Found added participant: %{public}@ with share URL: %{public}@ and token: %{public}@", v55, 0x2Au);

                  }
                  v17 = 1;
                }
              }
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        }
        while (v16);

        i = v44;
        if ((v17 & 1) == 0)
          goto LABEL_29;
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, buf, 16);
      if (!v43)
      {
LABEL_33:

        objc_msgSend(*(id *)(v8 + 152), "arrayByAddingObjectsFromArray:", v45);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = *(void **)(v8 + 152);
        *(_QWORD *)(v8 + 152) = v35;

        objc_msgSend(*(id *)(v8 + 160), "hk_dictionaryByAddingEntriesFromDictionary:", v46);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(v8 + 160);
        *(_QWORD *)(v8 + 160) = v37;

        os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
        v9 = v39;
        a1 = v40;
        break;
      }
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "finishTask");
}

id __49__HDCloudSyncAddSharingParticipantOperation_main__block_invoke_199(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "hd_isCKShare"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t __88__HDCloudSyncAddSharingParticipantOperation__updatedRegistryRecordIfNeededForContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "zoneType") == 2)
  {
    objc_msgSend(v3, "zoneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __90__HDCloudSyncAddSharingParticipantOperation__addParticipantIfNeeded_zoneIdentifier_share___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (void)_foundOwnerParticipant:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (!*(_QWORD *)(a1 + 168))
  {
    objc_msgSend(v4, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C94730]);

    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5370];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v12 = 138543618;
        v13 = a1;
        v14 = 2114;
        v15 = v5;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring candidate owner %{public}@ with default record name.", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if (v11)
      {
        v12 = 138543618;
        v13 = a1;
        v14 = 2114;
        v15 = v5;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Found owner participant: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      objc_storeStrong((id *)(a1 + 168), a2);
    }
  }

}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (NSDictionary)invitationTokensByShareURL
{
  return self->_invitationTokensByShareURL;
}

- (CKShareParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_invitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_zoneIdentifiers, 0);
  objc_storeStrong((id *)&self->_clonedParticipants, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

@end
