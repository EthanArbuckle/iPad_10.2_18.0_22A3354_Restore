@implementation HDDaemonSyncEngine

- (BOOL)applyAcknowledgedAnchorMap:(id)a3 forStore:(id)a4 resetNext:(BOOL)a5 resetInvalid:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  HDProfile **p_profile;
  id v12;
  id v13;
  id WeakRetained;

  v8 = a6;
  v9 = a5;
  p_profile = &self->_profile;
  v12 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a7) = +[HDSyncAnchorEntity setAcknowledgedAnchorsWithMap:store:resetNext:resetInvalid:profile:error:](HDSyncAnchorEntity, "setAcknowledgedAnchorsWithMap:store:resetNext:resetInvalid:profile:error:", v13, v12, v9, v8, WeakRetained, a7);

  return (char)a7;
}

- (BOOL)getReceivedAnchorMap:(id)a3 forStore:(id)a4 error:(id *)a5
{
  HDProfile **p_profile;
  id v8;
  id v9;
  id WeakRetained;

  p_profile = &self->_profile;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = +[HDSyncAnchorEntity getSyncAnchorsOfType:anchorMap:store:profile:error:](HDSyncAnchorEntity, "getSyncAnchorsOfType:anchorMap:store:profile:error:", 3, v9, v8, WeakRetained, a5);

  return (char)a5;
}

- (BOOL)applySyncChange:(id)a3 forStore:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  double Current;
  HDProfile **p_profile;
  id WeakRetained;
  uint64_t v13;
  os_log_t *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  os_signpost_id_t v23;
  os_log_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  HDProfile **v28;
  id v29;
  os_log_t *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  os_log_t v49;
  NSObject *v50;
  id v51;
  HDDaemonSyncEngine *v52;
  os_log_t v53;
  HDDaemonSyncEngine *v54;
  uint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  _BOOL4 v62;
  void *v64;
  uint64_t v65;
  id v66;
  char v67;
  os_log_t *v68;
  NSObject *v69;
  _BOOL4 v70;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  CFAbsoluteTime v76;
  os_log_t v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  int v86;
  int v87;
  uint64_t v88;
  HDDaemonSyncEngine *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  BOOL v96;
  unint64_t v97;
  NSObject *v98;
  void *v99;
  id v100;
  BOOL v101;
  id v102;
  NSObject *v103;
  void *v104;
  void *v105;
  os_signpost_id_t v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  HDDaemonSyncEngine *v112;
  id v114;
  id v115;
  _QWORD v116[4];
  id v117;
  id v118;
  HDDaemonSyncEngine *v119;
  uint8_t buf[4];
  HDDaemonSyncEngine *v121;
  __int16 v122;
  HDDaemonSyncEngine *v123;
  __int16 v124;
  id v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  double v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = &unk_1EF1C58A0;
  if ((objc_msgSend(v7, "conformsToProtocol:", v9) & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    NSStringFromProtocol((Protocol *)v9);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hk_assignError:code:format:", a5, 125, CFSTR("%@ does not conform to %@"), v7, v48);

    v46 = 0;
    goto LABEL_35;
  }
  Current = CFAbsoluteTimeGetCurrent();
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v13 = objc_msgSend(v7, "syncEntityClassForProfile:", WeakRetained);

  _HKInitializeLogging();
  v14 = (os_log_t *)MEMORY[0x1E0CB5370];
  v15 = *MEMORY[0x1E0CB5370];
  v112 = (HDDaemonSyncEngine *)v13;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = objc_msgSend(v7, "syncAnchorRange");
    objc_msgSend(v7, "syncAnchorRange");
    v18 = v8;
    v19 = v9;
    v21 = v20;
    objc_msgSend(v7, "sequenceNumber");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v121 = (HDDaemonSyncEngine *)v13;
    v122 = 2048;
    v123 = (HDDaemonSyncEngine *)v17;
    v14 = (os_log_t *)MEMORY[0x1E0CB5370];
    v124 = 2048;
    v125 = v21;
    v9 = v19;
    v8 = v18;
    p_profile = &self->_profile;
    v126 = 2114;
    v127 = (uint64_t)v22;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "Apply Sync change for %{public}@ over range (%lld, %lld) with sequence %{public}@", buf, 0x2Au);

    v15 = *v14;
  }
  v23 = os_signpost_id_make_with_pointer(v15, self);
  _HKInitializeLogging();
  v24 = *v14;
  if (os_signpost_enabled(*v14))
  {
    v25 = v24;
    v26 = v25;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v27 = objc_msgSend(v7, "syncAnchorRange");
      objc_msgSend(v7, "syncAnchorRange");
      v28 = p_profile;
      v29 = v8;
      v30 = v14;
      v32 = v31;
      objc_msgSend(v7, "sequenceNumber");
      v110 = v9;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "integerValue");
      *(_DWORD *)buf = 138544130;
      v121 = v112;
      v122 = 2048;
      v123 = (HDDaemonSyncEngine *)v27;
      v124 = 2048;
      v125 = v32;
      v14 = v30;
      v8 = v29;
      p_profile = v28;
      v126 = 2048;
      v127 = v34;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v23, "apply-sync-change", "syncEntityClass=%{public}@, start=%lld, end=%lld, sequence=%ld", buf, 0x2Au);

      v9 = v110;
    }

  }
  if (!v112)
  {
    _HKInitializeLogging();
    v53 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v50 = v53;
      objc_msgSend(v7, "syncEntityIdentifier");
      v89 = (HDDaemonSyncEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v121 = v89;
      _os_log_error_impl(&dword_1B7802000, v50, OS_LOG_TYPE_ERROR, "No sync entity available for change with sync entity identifier %{public}@; change will be ignored.",
        buf,
        0xCu);

      goto LABEL_55;
    }
LABEL_24:
    v46 = 1;
    goto LABEL_35;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[HDDaemonSyncEngine supportsSyncStore:](v112, "supportsSyncStore:", v8)
    || (objc_msgSend(v8, "canRecieveSyncObjectsForEntityClass:", v112) & 1) == 0)
  {
    _HKInitializeLogging();
    v49 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v50 = v49;
      -[HDDaemonSyncEngine syncEntityIdentifier](v112, "syncEntityIdentifier");
      v51 = v8;
      v52 = (HDDaemonSyncEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v121 = v112;
      v122 = 2114;
      v123 = v52;
      v124 = 2114;
      v125 = v51;
      _os_log_error_impl(&dword_1B7802000, v50, OS_LOG_TYPE_ERROR, "Ignoring sync change with sync entity class %{public}@ (%{public}@), unsupported by %{public}@", buf, 0x20u);

      v8 = v51;
LABEL_55:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v111 = v9;
  v35 = v7;
  v36 = v8;
  v37 = v36;
  if (!self)
  {

    goto LABEL_19;
  }
  if (!objc_msgSend(v36, "shouldEnforceSequenceOrdering"))
  {
LABEL_29:
    v106 = v23;
    v109 = v8;

    v58 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v58, "database");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __53__HDDaemonSyncEngine_applySyncChange_forStore_error___block_invoke;
    v116[3] = &unk_1E6CF4CA8;
    v119 = v112;
    v60 = v37;
    v117 = v60;
    v61 = v35;
    v118 = v61;
    v62 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncAnchorEntity, "performWriteTransactionWithHealthDatabase:error:block:", v59, a5, v116);

    if (!v62)
    {
LABEL_33:
      v46 = 0;
      v8 = v109;
      v9 = v111;
LABEL_34:

      goto LABEL_35;
    }
    if (objc_msgSend(v61, "isSpeculative"))
    {
      if ((objc_msgSend(v60, "supportsSpeculativeChangesForSyncEntityClass:", v112) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("%@ does not support speculative changes"), v112);
        goto LABEL_33;
      }
LABEL_40:
      v67 = -[HDDaemonSyncEngine _applySyncChange:entity:store:error:]((uint64_t)self, v61, (objc_class *)v112, v60, a5);
      _HKInitializeLogging();
      v68 = (os_log_t *)MEMORY[0x1E0CB5370];
      v69 = *MEMORY[0x1E0CB5370];
      v70 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO);
      if ((v67 & 1) != 0)
      {
        v105 = v60;
        if (v70)
        {
          v71 = v69;
          v72 = objc_msgSend(v61, "syncAnchorRange");
          objc_msgSend(v61, "syncAnchorRange");
          v74 = v73;
          objc_msgSend(v61, "sequenceNumber");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 138544386;
          v121 = v112;
          v122 = 2048;
          v123 = (HDDaemonSyncEngine *)v72;
          v124 = 2048;
          v125 = v74;
          v126 = 2114;
          v127 = (uint64_t)v75;
          v128 = 2048;
          v129 = v76 - Current;
          _os_log_impl(&dword_1B7802000, v71, OS_LOG_TYPE_INFO, "Applied sync change for %{public}@ over range (%lld, %lld) sequence %{public}@ in %.3f seconds", buf, 0x34u);

          v68 = (os_log_t *)MEMORY[0x1E0CB5370];
        }
        _HKInitializeLogging();
        v77 = *v68;
        v8 = v109;
        if (os_signpost_enabled(*v68))
        {
          v78 = v77;
          v79 = v78;
          if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
          {
            v80 = objc_msgSend(v61, "syncAnchorRange");
            objc_msgSend(v61, "syncAnchorRange");
            v82 = v81;
            objc_msgSend(v61, "sequenceNumber");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v83, "integerValue");
            *(_DWORD *)buf = 138544130;
            v121 = v112;
            v122 = 2048;
            v123 = (HDDaemonSyncEngine *)v80;
            v8 = v109;
            v124 = 2048;
            v125 = v82;
            v126 = 2048;
            v127 = v84;
            _os_signpost_emit_with_name_impl(&dword_1B7802000, v79, OS_SIGNPOST_INTERVAL_END, v106, "apply-sync-change", "syncEntityClass=%{public}@, start=%lld, end=%lld, sequence=%ld", buf, 0x2Au);

            v68 = (os_log_t *)MEMORY[0x1E0CB5370];
          }

        }
        objc_msgSend(v61, "sequenceNumber");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v61, "done");
        if (v85
          && ((v87 = v86, (objc_msgSend(v61, "done") & 1) == 0)
            ? (v88 = objc_msgSend(v85, "integerValue") + 1)
            : (v88 = 0),
              objc_msgSend(v105, "setExpectedSequenceNumber:forSyncEntityClass:", v88, v112),
              !v87)
          || (objc_msgSend(v61, "isSpeculative") & 1) != 0)
        {
          v46 = 1;
          v9 = v111;
        }
        else
        {
          v107 = v85;
          objc_msgSend(v61, "syncAnchorRange");
          v93 = v92;
          -[HDDaemonSyncEngine syncEntityIdentifier](v112, "syncEntityIdentifier");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_loadWeakRetained((id *)p_profile);
          v96 = +[HDSyncAnchorEntity updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:](HDSyncAnchorEntity, "updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:", v93, 3, v94, v105, 1, v95, a5);

          if (v96)
          {
            v97 = (unint64_t)objc_msgSend(v61, "versionRange") >> 32;
            if ((int)HDCurrentSyncVersionForSyncEntity(v112) >= (int)v97)
            {
              -[HDDaemonSyncEngine syncEntityIdentifier](v112, "syncEntityIdentifier");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_loadWeakRetained((id *)p_profile);
              v114 = 0;
              v101 = +[HDSyncAnchorEntity updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:](HDSyncAnchorEntity, "updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:", v93, 5, v99, v105, 1, v100, &v114);
              v102 = v114;

              v9 = v111;
              if (!v101)
              {
                _HKInitializeLogging();
                v103 = *v68;
                if (os_log_type_enabled(*v68, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v121 = self;
                  v122 = 2114;
                  v123 = v112;
                  v124 = 2114;
                  v125 = v102;
                  _os_log_error_impl(&dword_1B7802000, v103, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update validated anchor for %{public}@: %{public}@", buf, 0x20u);
                }
              }

              v46 = 1;
              v8 = v109;
            }
            else
            {
              v46 = 1;
              v8 = v109;
              v9 = v111;
            }
            v85 = v107;
          }
          else
          {
            _HKInitializeLogging();
            v98 = *v68;
            v8 = v109;
            v9 = v111;
            v85 = v107;
            if (os_log_type_enabled(*v68, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B7802000, v98, OS_LOG_TYPE_INFO, "failed to write received anchor", buf, 2u);
            }
            v46 = 0;
          }
        }

      }
      else
      {
        v8 = v109;
        v9 = v111;
        if (v70)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B7802000, v69, OS_LOG_TYPE_INFO, "Failed to apply object collection.", buf, 2u);
        }
        v46 = 0;
      }
      goto LABEL_34;
    }
    v115 = 0;
    v64 = v60;
    v65 = -[HDDaemonSyncEngine _validateAnchorsForSyncChange:store:error:]((uint64_t)self, v61, v60, &v115);
    v66 = v115;
    v8 = v109;
    if (v65 == 1)
    {
      v46 = 1;
      v9 = v111;
    }
    else
    {
      if (v65 != 2 || (objc_msgSend(v64, "shouldContinueAfterAnchorValidationError:", v66) & 1) != 0)
      {

        v60 = v64;
        goto LABEL_40;
      }
      v90 = v66;
      v91 = v90;
      v9 = v111;
      if (v90)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v90);
        else
          _HKLogDroppedError();
      }

      v46 = 0;
    }

    goto LABEL_34;
  }
  v38 = objc_loadWeakRetained((id *)p_profile);
  v39 = objc_msgSend(v35, "syncEntityClassForProfile:", v38);

  v108 = v35;
  objc_msgSend(v35, "sequenceNumber");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
    goto LABEL_28;
  v41 = v39;
  v42 = v39;
  v43 = v40;
  v44 = objc_msgSend(v37, "expectedSequenceNumberForSyncEntityClass:", v42);
  v104 = v43;
  v45 = objc_msgSend(v43, "integerValue");
  if (!v45)
  {
    v40 = v43;
    if (v44)
    {
      v54 = (HDDaemonSyncEngine *)v41;
      v55 = v44;
      _HKInitializeLogging();
      v56 = *MEMORY[0x1E0CB5370];
      v57 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO);
      v40 = v104;
      if (v57)
      {
        *(_DWORD *)buf = 138543618;
        v121 = v54;
        v122 = 2048;
        v123 = (HDDaemonSyncEngine *)v55;
        _os_log_impl(&dword_1B7802000, v56, OS_LOG_TYPE_INFO, "Received restart of sequence for %{public}@ (expecting %ld)", buf, 0x16u);
        v40 = v104;
      }
    }
    goto LABEL_28;
  }
  v40 = v43;
  if (v44 == v45)
  {
LABEL_28:

    v35 = v108;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 1402, CFSTR("Received out-of-order message for %@: Expected sequence number %ld but received %ld"), v41, v44, v45);

LABEL_19:
  v46 = 0;
  v9 = v111;
LABEL_35:

  return v46;
}

- (uint64_t)_validateAnchorsForSyncChange:(void *)a3 store:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_15;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v10 = (void *)objc_msgSend(v7, "syncEntityClassForProfile:", WeakRetained);

  objc_msgSend(v8, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requiredAnchorMapWithProfile:error:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 1400, CFSTR("invalid required anchor map"));
LABEL_13:
    v18 = 2;
    goto LABEL_14;
  }
  objc_msgSend(v10, "syncEntityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)(a1 + 8));
  v15 = +[HDSyncAnchorEntity syncAnchorOfType:entityIdentifier:store:profile:error:](HDSyncAnchorEntity, "syncAnchorOfType:entityIdentifier:store:profile:error:", 3, v13, v8, v14, a4);

  if ((v15 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 1400, CFSTR("invalid last anchor %lld"), v15);
    goto LABEL_13;
  }
  v16 = objc_msgSend(v7, "syncAnchorRange");
  if ((v16 & 0x8000000000000000) != 0 || v17 < 0 || (uint64_t)v16 > v17)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    HDSyncAnchorRangeDescription(v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_assignError:code:format:", a4, 1400, CFSTR("invalid anchor range %@"), v20);

    goto LABEL_13;
  }
  if (v16 >= v15 || v17 > v15)
  {
    if (v16 <= v15)
    {
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 1;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__179;
      v35 = __Block_byref_object_dispose__179;
      v36 = 0;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __64__HDDaemonSyncEngine__validateAnchorsForSyncChange_store_error___block_invoke;
      v26[3] = &unk_1E6D0C8E0;
      v27 = v8;
      v28 = a1;
      v29 = &v31;
      v30 = &v37;
      objc_msgSend(v12, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v26);
      if (*((_BYTE *)v38 + 24))
      {
        v18 = 0;
      }
      else
      {
        v24 = (id)v32[5];
        v25 = v24;
        if (v24)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v24);
          else
            _HKLogDroppedError();
        }

        v18 = 2 * (*((_BYTE *)v38 + 24) == 0);
      }

      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v37, 8);
      goto LABEL_14;
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    HDSyncAnchorRangeDescription(v16, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hk_assignError:code:format:", a4, 1400, CFSTR("unexpected anchor range %@ for %@, last anchor %lld"), v23, v10, v15);

    goto LABEL_13;
  }
  v18 = 1;
LABEL_14:

LABEL_15:
  return v18;
}

void __64__HDDaemonSyncEngine__validateAnchorsForSyncChange_store_error___block_invoke(_QWORD *a1, void *a2, int64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id WeakRetained;
  int64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  v19 = 0;
  v10 = +[HDSyncAnchorEntity syncAnchorOfType:entityIdentifier:store:profile:error:](HDSyncAnchorEntity, "syncAnchorOfType:entityIdentifier:store:profile:error:", 3, v7, v8, WeakRetained, &v19);
  v11 = v19;
  v12 = v19;

  if (v10 == -1 && v12 != 0)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, "Failed to lookup existing anchor for sync entity: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v11);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    goto LABEL_11;
  }
  if (v10 < a3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 1400, CFSTR("change requires anchor %lld for %@, but we only have %lld"), a3, v7, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1[6] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

LABEL_11:
    *a4 = 1;
  }

}

- (HDDaemonSyncEngine)initWithProfile:(id)a3
{
  id v4;
  HDDaemonSyncEngine *v5;
  HDDaemonSyncEngine *v6;
  HDDaemonSyncEntityManager *v7;
  void *v8;
  uint64_t v9;
  HDDaemonSyncEntityManager *entityManager;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDaemonSyncEngine;
  v5 = -[HDDaemonSyncEngine init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [HDDaemonSyncEntityManager alloc];
    objc_msgSend(v4, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDDaemonSyncEntityManager initWithDaemon:](v7, "initWithDaemon:", v8);
    entityManager = v6->_entityManager;
    v6->_entityManager = (HDDaemonSyncEntityManager *)v9;

  }
  return v6;
}

- (NSArray)allOrderedSyncEntities
{
  return -[HDDaemonSyncEntityManager orderedSyncEntities](self->_entityManager, "orderedSyncEntities");
}

- (NSDictionary)allSyncEntitiesByIdentifier
{
  return -[HDDaemonSyncEntityManager syncEntitiesByIdentifier](self->_entityManager, "syncEntitiesByIdentifier");
}

- (BOOL)updateLocalVersionsForStore:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "orderedSyncEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke;
  v20[3] = &unk_1E6CFC3C8;
  v11 = v7;
  v21 = v11;
  objc_msgSend(v9, "hk_filter:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke_2;
  v17[3] = &unk_1E6CE7950;
  v18 = v12;
  v19 = v11;
  v14 = v11;
  v15 = v12;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncAnchorEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, a5, v17);

  return (char)a5;
}

uint64_t __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a2, "supportsSyncStore:", *(_QWORD *)(a1 + 32));
  else
    return 1;
}

uint64_t __64__HDDaemonSyncEngine_updateLocalVersionsForStore_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = HDCurrentSyncVersionForSyncEntity(v10);
        objc_msgSend(v10, "syncEntityIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[HDSyncAnchorEntity updateLocalVersion:entityIdentifier:store:transaction:error:](HDSyncAnchorEntity, "updateLocalVersion:entityIdentifier:store:transaction:error:", v11, v12, *(_QWORD *)(a1 + 40), v5, a3);

        if (!v13)
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (uint64_t)_applySyncChange:(objc_class *)a3 entity:(void *)a4 store:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id WeakRetained;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  BOOL v32;
  objc_class *v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  id v40;
  void *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  objc_class *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = v10;
  if (!a1)
    goto LABEL_7;
  if ((objc_msgSend(v10, "canRecieveSyncObjectsForEntityClass:", a3) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_assignError:code:format:", a5, 1401, CFSTR("Ignoring sync objects from %@; syncEntityClass was %@"),
      v25,
      v26);

LABEL_7:
    v27 = 0;
    goto LABEL_29;
  }
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1, CFSTR("ApplyChange"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(a1 + 8);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v48 = 0;
  objc_msgSend(v9, "decodedObjectsForProfile:error:", WeakRetained, &v48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v48;

  v45 = v15;
  if (v15)
  {
    v43 = a5;
    v44 = v12;
    v17 = objc_msgSend(v9, "versionRange");
    v47 = v16;
    v18 = v15;
    v19 = v11;
    v20 = objc_opt_respondsToSelector();
    v21 = objc_loadWeakRetained(v13);
    if ((v20 & 1) != 0)
      v22 = -[objc_class receiveSyncObjects:version:syncStore:profile:error:](a3, "receiveSyncObjects:version:syncStore:profile:error:", v18, v17, v19, v21, &v47);
    else
      v22 = -[objc_class receiveSyncObjects:syncStore:profile:error:](a3, "receiveSyncObjects:syncStore:profile:error:", v18, v19, v21, &v47);
    v29 = v22;

    v28 = v47;
    v12 = v44;
    if (v29 == 1)
    {
      if (objc_msgSend(v28, "hk_isHealthKitErrorWithCode:", 1403))
      {
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          v50 = a3;
          v51 = 2114;
          v52 = v19;
          v53 = 2114;
          v54 = v28;
          _os_log_fault_impl(&dword_1B7802000, v30, OS_LOG_TYPE_FAULT, "Client %{public}@ requested a reset of received sync anchor for store %{public}@ with error %{public}@.", buf, 0x20u);
        }
        v31 = objc_loadWeakRetained(v13);
        v46 = 0;
        v32 = +[HDSyncAnchorEntity resetSyncAnchorsOfType:store:profile:error:](HDSyncAnchorEntity, "resetSyncAnchorsOfType:store:profile:error:", 3, v19, v31, &v46);
        v33 = (objc_class *)v46;

        if (!v32)
        {
          _HKInitializeLogging();
          v34 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v50 = v33;
            _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "Failed to reset sync Anchors %{public}@", buf, 0xCu);
          }
        }

      }
      else
      {
        v35 = objc_msgSend(v28, "hk_isHealthKitErrorWithCode:", 123);
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB5370];
        v37 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR);
        if (!v35)
        {
          if (v37)
          {
            *(_DWORD *)buf = 138543618;
            v50 = a3;
            v51 = 2114;
            v52 = v28;
            _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "Failed to receive sync objects for '%{public}@' with ignorable error: %{public}@", buf, 0x16u);
          }
          v40 = objc_loadWeakRetained(v13);
          objc_msgSend(v40, "daemon");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "autoBugCaptureReporter");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "reportApplyDataFailure:duringSyncFromStore:error:", a3, v19, v28);

          v28 = 0;
          v27 = 1;
          a5 = v43;
          v12 = v44;
          goto LABEL_24;
        }
        if (v37)
        {
          *(_DWORD *)buf = 138543618;
          v50 = a3;
          v51 = 2114;
          v52 = v28;
          _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "Failed to receive sync objects for '%{public}@' because the journal is full: %{public}@", buf, 0x16u);
        }
      }
      v27 = 0;
    }
    else
    {
      v27 = 1;
    }
    a5 = v43;
  }
  else
  {
    v27 = 0;
    v28 = v16;
  }
LABEL_24:
  objc_msgSend(v12, "invalidate");
  v38 = v28;
  if (v38)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v38);
    else
      _HKLogDroppedError();
  }

LABEL_29:
  return v27;
}

BOOL __53__HDDaemonSyncEngine_applySyncChange_forStore_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  void *v10;
  _BOOL8 v11;

  v5 = a2;
  v6 = HDCurrentSyncVersionForSyncEntity(*(void **)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "syncEntityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[HDSyncAnchorEntity updateLocalVersion:entityIdentifier:store:transaction:error:](HDSyncAnchorEntity, "updateLocalVersion:entityIdentifier:store:transaction:error:", v6, v7, *(_QWORD *)(a1 + 32), v5, a3);

  if (v8)
  {
    v9 = (unint64_t)objc_msgSend(*(id *)(a1 + 40), "versionRange") >> 32;
    objc_msgSend(*(id *)(a1 + 40), "syncEntityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[HDSyncAnchorEntity updateReceivedVersion:entityIdentifier:store:transaction:error:](HDSyncAnchorEntity, "updateReceivedVersion:entityIdentifier:store:transaction:error:", v9, v10, *(_QWORD *)(a1 + 32), v5, a3);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)syncAnchorRangesIfRequiredForSession:(id)a3 startingAnchors:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;
  HDMutableDatabaseTransactionContext *v23;
  id v24;
  void *v25;
  int v26;
  HDSyncAnchorRangeMap *v27;
  HDSyncAnchorRangeMap *v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  HDDaemonSyncEngine *v33;
  id v34;
  __int128 *p_buf;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  id v41;
  id v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "databaseAccessibilityAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "databaseAccessibilityAssertion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v12, "cloneAccessibilityAssertion:ownerIdentifier:error:", v13, v15, &v42);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v42;

    if (v16)
    {
LABEL_7:
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__179;
      v46 = __Block_byref_object_dispose__179;
      v47 = 0;
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      v23 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDMutableDatabaseTransactionContext setRequiresProtectedData:](v23, "setRequiresProtectedData:", 1);
      -[HDMutableDatabaseTransactionContext setCacheScope:](v23, "setCacheScope:", 1);
      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v23, "addAccessibilityAssertion:", v16);
      v24 = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(v24, "database");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke;
      v31[3] = &unk_1E6D0B648;
      p_buf = &buf;
      v32 = v8;
      v33 = self;
      v34 = v9;
      v36 = &v37;
      v26 = objc_msgSend(v25, "performTransactionWithContext:error:block:inaccessibilityHandler:", v23, a5, v31, 0);

      objc_msgSend(v16, "invalidate");
      if (v26)
      {
        if (*((_BYTE *)v38 + 24))
          v27 = (HDSyncAnchorRangeMap *)*(id *)(*((_QWORD *)&buf + 1) + 40);
        else
          v27 = objc_alloc_init(HDSyncAnchorRangeMap);
        v28 = v27;
      }
      else
      {
        v28 = 0;
      }

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_18;
    }
  }
  else
  {
    v17 = 0;
  }
  v18 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v18, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseAccessibilityTimeout");
  v41 = v17;
  objc_msgSend(v19, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v21, &v41);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v22 = v41;

  if (v16)
  {
    v17 = v22;
    goto LABEL_7;
  }
  if ((objc_msgSend(v22, "hk_isDatabaseAccessibilityError") & 1) == 0
    && (_HKInitializeLogging(),
        v29 = *MEMORY[0x1E0CB5370],
        os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR)))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v22;
    _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "Failed to acquire database accessibility assertion for sync: %{public}@", (uint8_t *)&buf, 0xCu);
    if (v22)
      goto LABEL_14;
  }
  else if (v22)
  {
LABEL_14:
    v16 = v22;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to acquire database accessibility assertion for sync with no error."));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = 0;
    v28 = 0;
LABEL_18:

    v22 = v17;
    goto LABEL_19;
  }
LABEL_22:
  if (a5)
    *a5 = objc_retainAutorelease(v16);
  else
    _HKLogDroppedError();

  v17 = 0;
  v28 = 0;
  if (!v22)
    goto LABEL_18;
LABEL_19:

  return v28;
}

BOOL __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "syncStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSyncEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_2;
  v21[3] = &unk_1E6CFC3C8;
  v9 = v6;
  v22 = v9;
  objc_msgSend(v7, "hk_filter:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDaemonSyncEngine _syncAnchorRangeMapForSession:store:syncEntities:startingAnchors:error:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), v10, *(void **)(a1 + 48), a3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v14)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_3;
    v16[3] = &unk_1E6D0C908;
    v16[4] = &v17;
    objc_msgSend(v14, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v16);
    if (*((_BYTE *)v18 + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "requiresSyncForChangesFromAnchorRangeMap:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40));
    _Block_object_dispose(&v17, 8);
  }

  return v14 != 0;
}

uint64_t __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a2, "supportsSyncStore:", *(_QWORD *)(a1 + 32));
  else
    return 1;
}

- (HDSyncAnchorRangeMap)_syncAnchorRangeMapForSession:(uint64_t)a1 store:(void *)a2 syncEntities:(void *)a3 startingAnchors:(void *)a4 error:(uint64_t)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  HDSyncAnchorRangeMap *v23;
  HDSyncAnchorRangeMap *v24;
  void *v26;
  id v27;
  HDSyncAnchorRangeMap *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v27 = v10;
    v28 = objc_alloc_init(HDSyncAnchorRangeMap);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v16, "syncEntityIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v11, "anchorForSyncEntityIdentifier:", v17);
          v19 = -[HDDaemonSyncEngine _nextSyncAnchorForEntity:session:startSyncAnchor:error:](a1, v16, v9, v18, a5);
          if ((v18 & 0x8000000000000000) != 0 || (v20 = v19, (v19 & 0x8000000000000000) != 0))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 1400, CFSTR("Start or final anchor is invalid."));

            v24 = 0;
            v23 = v28;
            goto LABEL_17;
          }
          if (v19 < v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncAnchorRangeMapForSession_store_syncEntities_startingAnchors_error_, a1, CFSTR("HDDaemonSyncEngine.m"), 748, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalAnchor >= startAnchor"));

          }
          if (v20 > v18)
          {
            v21 = HDSyncAnchorRangeMake(v18, v20);
            -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v28, "setAnchorRange:forSyncEntityIdentifier:", v21, v22, v17);
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v13)
          continue;
        break;
      }
    }

    v23 = v28;
    v24 = v28;
LABEL_17:

    v10 = v27;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __81__HDDaemonSyncEngine_syncAnchorRangesIfRequiredForSession_startingAnchors_error___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a4 > a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (BOOL)performSyncSession:(id)a3 accessibilityAssertion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject **v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  double Current;
  void *v44;
  void *v45;
  int v46;
  NSObject *v47;
  double v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  int v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  int v63;
  id v64;
  char v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  id v70;
  uint64_t v71;
  double v72;
  NSObject *v73;
  const char *v74;
  double v75;
  NSObject *v76;
  const char *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  const char *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  NSObject *v86;
  id v87;
  id v88;
  id v89;
  void *v91;
  void *v92;
  id *v93;
  id v94;
  void *v95;
  os_signpost_id_t v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  HDMutableDatabaseTransactionContext *v101;
  id *location;
  void *v103;
  void *v104;
  uint64_t v105;
  id v106;
  HDDaemonSyncEngine *v107;
  HDMutableDatabaseTransactionContext *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  _BYTE v115[12];
  __int16 v116;
  uint64_t v117;
  __int128 v118;
  uint64_t (*v119)(uint64_t);
  void *v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE buf[40];
  HDDaemonSyncEngine *v127;
  id v128;
  id v129;
  __int128 *v130;
  char *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = a4;
    v9 = a3;
    objc_msgSend(v9, "syncWillBegin");
    v10 = v9;
    v11 = v8;
    v104 = v10;
    v93 = a5;
    v98 = v11;
    if (self)
    {
      v12 = v11;
      v107 = self;
      v94 = v12;
      if (v12)
      {
        v97 = 0;
        v99 = v12;
        goto LABEL_8;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "databaseAccessibilityTimeout");
      v109 = 0;
      objc_msgSend(v15, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v17, &v109);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v109;

      if (v99)
      {
        v10 = v104;
LABEL_8:
        objc_msgSend(v10, "syncStore");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _VerifySyncEntityOrderForStore(id<HDSyncStore>  _Nonnull __strong)");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, CFSTR("HDDaemonSyncEngine.m"), 1024, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

          v18 = 0;
        }
        v103 = v18;
        if ((objc_msgSend(v18, "enforceSyncEntityOrdering") & 1) == 0)
        {

          goto LABEL_31;
        }
        objc_msgSend(v103, "orderedSyncEntities");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v111;
          v105 = *(_QWORD *)v111;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v111 != v23)
                objc_enumerationMutation(v21);
              v25 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
              v122 = 0u;
              v123 = 0u;
              v124 = 0u;
              v125 = 0u;
              objc_msgSend(v103, "syncEntityDependenciesForSyncEntity:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v122, &v118, 16);
              if (v27)
              {
                v28 = *(_QWORD *)v123;
                do
                {
                  for (j = 0; j != v27; ++j)
                  {
                    if (*(_QWORD *)v123 != v28)
                      objc_enumerationMutation(v26);
                    v30 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * j);
                    if ((objc_msgSend(v20, "containsObject:", v30) & 1) == 0)
                    {
                      _HKInitializeLogging();
                      v31 = *MEMORY[0x1E0CB5370];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v115 = 138543618;
                        *(_QWORD *)&v115[4] = v30;
                        v116 = 2114;
                        v117 = v25;
                        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "%{public}@ is not ordered before %{public}@ in sync entities", v115, 0x16u);
                      }

                      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__performSyncSession_databaseAccessibilityAssertion_error_, v107, CFSTR("HDDaemonSyncEngine.m"), 916, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_VerifySyncEntityOrderForStore(store)"));

LABEL_31:
                      _HKInitializeLogging();
                      v33 = (NSObject **)MEMORY[0x1E0CB5370];
                      v34 = *MEMORY[0x1E0CB5370];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543618;
                        v35 = v104;
                        *(_QWORD *)&buf[4] = v104;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v103;
                        _os_log_impl(&dword_1B7802000, v34, OS_LOG_TYPE_DEFAULT, "beginning sync session %{public}@ with store %{public}@", buf, 0x16u);
                        v34 = *v33;
                      }
                      else
                      {
                        v35 = v104;
                      }
                      v96 = os_signpost_id_make_with_pointer(v34, v35);
                      v36 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(v35, "reason");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = objc_msgSend(v103, "syncStoreType");
                      objc_msgSend(v103, "syncStoreIdentifier");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "stringWithFormat:", CFSTR("reason=%@, storeType=%ld, storeID=%@, storeEpoch=%lld"), v37, v38, v39, objc_msgSend(v103, "syncEpoch"));
                      v95 = (void *)objc_claimAutoreleasedReturnValue();

                      _HKInitializeLogging();
                      v40 = (void *)*MEMORY[0x1E0CB5370];
                      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5370]))
                      {
                        v41 = v40;
                        v42 = v41;
                        if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
                        {
                          *(_DWORD *)buf = 138543362;
                          *(_QWORD *)&buf[4] = v95;
                          _os_signpost_emit_with_name_impl(&dword_1B7802000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v96, "sync-session", "%{public}@", buf, 0xCu);
                        }

                      }
                      Current = CFAbsoluteTimeGetCurrent();
                      v101 = objc_alloc_init(HDMutableDatabaseTransactionContext);
                      -[HDMutableDatabaseTransactionContext setRequiresProtectedData:](v101, "setRequiresProtectedData:", 1);
                      -[HDMutableDatabaseTransactionContext setCacheScope:](v101, "setCacheScope:", 1);
                      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v101, "addAccessibilityAssertion:", v99);
                      objc_msgSend(v104, "databaseAccessibilityAssertion");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v44)
                      {
                        objc_msgSend(v104, "databaseAccessibilityAssertion");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v101, "addAccessibilityAssertion:", v45);

                      }
                      v46 = 0;
                      v100 = 0;
                      location = (id *)&v107->_profile;
                      while (2)
                      {
                        _HKInitializeLogging();
                        v47 = *MEMORY[0x1E0CB5370];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543874;
                          *(_QWORD *)&buf[4] = v104;
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = v46;
                          *(_WORD *)&buf[18] = 2114;
                          *(_QWORD *)&buf[20] = v103;
                          _os_log_impl(&dword_1B7802000, v47, OS_LOG_TYPE_DEFAULT, "beginning sync session %{public}@ transaction %d with store %{public}@", buf, 0x1Cu);
                        }
                        v48 = CFAbsoluteTimeGetCurrent();
                        v49 = v104;
                        v50 = v103;
                        v108 = v101;
                        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_QWORD *)&v110 = 0;
                        *((_QWORD *)&v110 + 1) = &v110;
                        *(_QWORD *)&v111 = 0x2020000000;
                        *((_QWORD *)&v111 + 1) = 1;
                        v52 = objc_loadWeakRetained(location);
                        objc_msgSend(v52, "database");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_QWORD *)v115 = 0;
                        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                        *(_QWORD *)&buf[8] = 3221225472;
                        *(_QWORD *)&buf[16] = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke;
                        *(_QWORD *)&buf[24] = &unk_1E6D0C9A0;
                        v54 = v49;
                        *(_QWORD *)&buf[32] = v54;
                        v127 = v107;
                        v106 = v50;
                        v128 = v106;
                        v55 = v51;
                        v131 = sel__performSyncTransactionForSession_store_transactionContext_error_;
                        v129 = v55;
                        v130 = &v110;
                        v56 = objc_msgSend(v53, "performTransactionWithContext:error:block:inaccessibilityHandler:", v108, v115, buf, 0);
                        v57 = *(id *)v115;

                        v58 = _Block_copy(v107->_unitTest_didCompleteReadTransaction);
                        v59 = v58;
                        if (v58)
                          (*((void (**)(void *))v58 + 2))(v58);
                        if (v56)
                        {
                          v60 = (void *)-[HDMutableDatabaseTransactionContext mutableCopy](v108, "mutableCopy");
                          objc_msgSend(v60, "setRequiresWrite:", 1);
                          v61 = objc_loadWeakRetained(location);
                          objc_msgSend(v61, "database");
                          v62 = (void *)objc_claimAutoreleasedReturnValue();
                          v114 = v57;
                          *(_QWORD *)&v118 = MEMORY[0x1E0C809B0];
                          *((_QWORD *)&v118 + 1) = 3221225472;
                          v119 = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_333;
                          v120 = &unk_1E6CEBC00;
                          v121 = v55;
                          v63 = objc_msgSend(v62, "performTransactionWithContext:error:block:inaccessibilityHandler:", v60, &v114, &v118, 0);
                          v64 = v114;

                          if (!v63)
                          {
                            if (objc_msgSend(v64, "hk_isDatabaseAccessibilityError"))
                            {
                              _HKInitializeLogging();
                              v68 = *MEMORY[0x1E0CB5370];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
                              {
                                LODWORD(v122) = 138543362;
                                *(_QWORD *)((char *)&v122 + 4) = v64;
                                _os_log_debug_impl(&dword_1B7802000, v68, OS_LOG_TYPE_DEBUG, "error during sync write transaction: %{public}@", (uint8_t *)&v122, 0xCu);
                              }
                            }
                            else
                            {
                              _HKInitializeLogging();
                              v69 = *MEMORY[0x1E0CB5370];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                              {
                                LODWORD(v122) = 138543362;
                                *(_QWORD *)((char *)&v122 + 4) = v64;
                                _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "error during sync write transaction: %{public}@", (uint8_t *)&v122, 0xCu);
                              }
                            }

                            v57 = v64;
                            goto LABEL_63;
                          }
                          if (*(_QWORD *)(*((_QWORD *)&v110 + 1) + 24) == 2)
                          {
                            *(_QWORD *)&v122 = v64;
                            v65 = objc_msgSend(v54, "transactionDidEndWithError:", &v122);
                            v57 = (id)v122;

                            if ((v65 & 1) != 0)
                            {
                              v64 = v57;
                              goto LABEL_67;
                            }
LABEL_63:
                            *(_QWORD *)(*((_QWORD *)&v110 + 1) + 24) = 0;
                            v70 = v57;
                            if (v70)
                            {
                              v100 = objc_retainAutorelease(v70);
                              v64 = v100;
                              v60 = v100;
                            }
                            else
                            {
                              v60 = 0;
                              v64 = 0;
                            }
                          }
                          else
                          {

                          }
LABEL_67:
                          v71 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 24);

                          _Block_object_dispose(&v110, 8);
                          v72 = CFAbsoluteTimeGetCurrent();
                          _HKInitializeLogging();
                          v73 = *MEMORY[0x1E0CB5370];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 67109890;
                            v74 = "YES";
                            if (!v71)
                              v74 = "NO";
                            *(_DWORD *)&buf[4] = v46;
                            *(_WORD *)&buf[8] = 2048;
                            *(double *)&buf[10] = v72 - v48;
                            *(_WORD *)&buf[18] = 2080;
                            *(_QWORD *)&buf[20] = v74;
                            *(_WORD *)&buf[28] = 2048;
                            *(_QWORD *)&buf[30] = v71;
                            _os_log_impl(&dword_1B7802000, v73, OS_LOG_TYPE_DEFAULT, "finished sync transaction %d in %lfs; success=%s, status=%ld",
                              buf,
                              0x26u);
                          }
                          ++v46;
                          if (v71 != 2)
                          {
                            if (!v94)
                              objc_msgSend(v99, "invalidate");
                            v75 = CFAbsoluteTimeGetCurrent();
                            _HKInitializeLogging();
                            v76 = *MEMORY[0x1E0CB5370];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138544130;
                              v77 = "YES";
                              if (!v71)
                                v77 = "NO";
                              *(_QWORD *)&buf[4] = v104;
                              *(_WORD *)&buf[12] = 2048;
                              *(double *)&buf[14] = v75 - Current;
                              *(_WORD *)&buf[22] = 1024;
                              *(_DWORD *)&buf[24] = v46;
                              *(_WORD *)&buf[28] = 2080;
                              *(_QWORD *)&buf[30] = v77;
                              _os_log_impl(&dword_1B7802000, v76, OS_LOG_TYPE_DEFAULT, "finished sync session %{public}@ in %lfs with %d transactions; success=%s",
                                buf,
                                0x26u);
                            }
                            _HKInitializeLogging();
                            v78 = (void *)*MEMORY[0x1E0CB5370];
                            if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5370]))
                            {
                              v79 = v78;
                              v80 = v79;
                              if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
                              {
                                v81 = "YES";
                                if (!v71)
                                  v81 = "NO";
                                *(_DWORD *)buf = 136315394;
                                *(_QWORD *)&buf[4] = v81;
                                *(_WORD *)&buf[12] = 2114;
                                *(_QWORD *)&buf[14] = v95;
                                _os_signpost_emit_with_name_impl(&dword_1B7802000, v80, OS_SIGNPOST_INTERVAL_END, v96, "sync-session", "success=%s, %{public}@", buf, 0x16u);
                              }

                            }
                            buf[0] = v71 != 0;

                            v82 = v97;
                            goto LABEL_86;
                          }
                          continue;
                        }
                        break;
                      }
                      if (objc_msgSend(v57, "hk_isDatabaseAccessibilityError"))
                      {
                        _HKInitializeLogging();
                        v66 = *MEMORY[0x1E0CB5370];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
                        {
                          LODWORD(v118) = 138543362;
                          *(_QWORD *)((char *)&v118 + 4) = v57;
                          _os_log_debug_impl(&dword_1B7802000, v66, OS_LOG_TYPE_DEBUG, "error during sync read transaction: %{public}@", (uint8_t *)&v118, 0xCu);
                        }
                      }
                      else
                      {
                        _HKInitializeLogging();
                        v67 = *MEMORY[0x1E0CB5370];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v118) = 138543362;
                          *(_QWORD *)((char *)&v118 + 4) = v57;
                          _os_log_error_impl(&dword_1B7802000, v67, OS_LOG_TYPE_ERROR, "error during sync read transaction: %{public}@", (uint8_t *)&v118, 0xCu);
                        }
                      }
                      goto LABEL_63;
                    }
                  }
                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v122, &v118, 16);
                }
                while (v27);
              }

              objc_msgSend(v20, "addObject:", v25);
              v23 = v105;
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
            v23 = v105;
          }
          while (v22);
        }

        goto LABEL_31;
      }
      if ((objc_msgSend(v97, "hk_isDatabaseAccessibilityError") & 1) == 0)
      {
        _HKInitializeLogging();
        v86 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v97;
          _os_log_error_impl(&dword_1B7802000, v86, OS_LOG_TYPE_ERROR, "Failed to acquire database accessibility assertion for sync: %{public}@", buf, 0xCu);
        }
      }
      v87 = v97;
      if (v87)
      {
        v88 = v87;
        v89 = objc_retainAutorelease(v87);
        v87 = v88;
      }
      v100 = v87;

      buf[0] = 0;
      v82 = v100;
LABEL_86:

      v13 = buf[0];
    }
    else
    {
      v100 = 0;
      v13 = 0;
    }

    v83 = v100;
    objc_msgSend(v104, "syncDidFinishWithSuccess:error:", v13, v83);

    if ((v13 & 1) == 0)
    {
      v84 = v83;
      v85 = v84;
      if (v84)
      {
        if (v93)
          *v93 = objc_retainAutorelease(v84);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (void)resetAnchorsWithFailedChanges:(id)a3 store:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HDProfile **p_profile;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v23 = a4;
  if (v23)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      p_profile = &self->_profile;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "syncAnchorRange");
          v14 = v13;
          WeakRetained = objc_loadWeakRetained((id *)p_profile);
          v16 = (void *)objc_msgSend(v11, "syncEntityClassForProfile:", WeakRetained);

          if ((v12 & 0x8000000000000000) == 0 && (v14 & 0x8000000000000000) == 0 && v12 <= v14 && v16 != 0)
          {
            objc_msgSend(v16, "syncEntityIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_loadWeakRetained((id *)p_profile);
            v25 = 0;
            v20 = +[HDSyncAnchorEntity updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:](HDSyncAnchorEntity, "updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:", v12, 0, v18, v23, 0, v19, &v25);
            v21 = v25;

            if (!v20)
            {
              _HKInitializeLogging();
              v22 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218498;
                v31 = v12;
                v32 = 2114;
                v33 = v16;
                v34 = 2114;
                v35 = v21;
                _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "failed to reset next anchor to %lld for %{public}@: %{public}@", buf, 0x20u);
              }
            }

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v7);
    }
  }

}

- (BOOL)resetNextAnchorsForStore:(id)a3 profile:(id)a4 minimumElapsedTime:(double)a5 error:(id *)a6
{
  return +[HDSyncAnchorEntity resetNextAnchorsIfNeededForStore:profile:minimumElapsedTime:error:](HDSyncAnchorEntity, "resetNextAnchorsIfNeededForStore:profile:minimumElapsedTime:error:", a3, a4, a6, a5);
}

- (void)resetStore:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  BOOL v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (os_log_t *)MEMORY[0x1E0CB5370];
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "resetting store %@", buf, 0xCu);
    }
    v7 = v4;
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v12 = 0;
      v9 = +[HDSyncAnchorEntity resetSyncStore:profile:error:](HDSyncAnchorEntity, "resetSyncStore:profile:error:", v7, WeakRetained, &v12);
      v10 = v12;

      if (!v9)
      {
        _HKInitializeLogging();
        v11 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v14 = v7;
          v15 = 2114;
          v16 = v10;
          _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "failed to reset sync store %{public}@: %{public}@", buf, 0x16u);
        }
      }

    }
  }

}

void __110__HDDaemonSyncEngine__synchronizeSyncEntityClass_session_startAnchor_finalAnchor_postTransactionBlocks_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentAnchor");
  objc_msgSend(*(id *)(a1 + 56), "syncEntityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  v9 = 0;
  LOBYTE(v2) = +[HDSyncAnchorEntity updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:](HDSyncAnchorEntity, "updateSyncAnchor:type:entityIdentifier:store:updatePolicy:profile:error:", v2, 0, v3, v4, 1, WeakRetained, &v9);
  v6 = v9;

  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Failed to update next sync anchor for %{public}@: %{public}@", buf, 0x16u);
    }
  }

}

uint64_t __59__HDDaemonSyncEngine__prepareSyncAnchorsForStore_entities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "syncEntityIdentifier");
}

- (uint64_t)_nextSyncAnchorForEntity:(void *)a3 session:(uint64_t)a4 startSyncAnchor:(uint64_t)a5 error:
{
  id v9;
  char v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;

  v9 = a3;
  v10 = objc_opt_respondsToSelector();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if ((v10 & 1) != 0)
    v12 = objc_msgSend(a2, "nextSyncAnchorWithSession:startSyncAnchor:profile:error:", v9, a4, WeakRetained, a5);
  else
    v12 = objc_msgSend(a2, "nextSyncAnchorWithSession:predicate:startSyncAnchor:profile:error:", v9, 0, a4, WeakRetained, a5);
  v13 = v12;

  return v13;
}

uint64_t __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  HDSyncAnchorMap *v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  uint64_t i;
  void *v24;
  id v25;
  int64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  HDSyncAnchorMap *v53;
  id v54;
  uint64_t v55;
  id obj;
  id obja[2];
  uint64_t v58;
  int8x16_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v58 = a3;
  LODWORD(v6) = objc_msgSend(v6, "syncDidBeginWithProfile:error:", WeakRetained, a3);

  if ((_DWORD)v6)
  {
    v52 = v5;
    v55 = a1;
    v8 = (id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 48), "orderedSyncEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_2;
    v70[3] = &unk_1E6CFC3C8;
    v71 = *(id *)(a1 + 48);
    objc_msgSend(v9, "hk_filter:", v70);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (uint64_t *)(a1 + 40);
    v11 = *v12;
    v13 = *(void **)(v55 + 56);
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_3;
    v67[3] = &unk_1E6CE7FB8;
    v67[4] = v11;
    v68 = *v8;
    v14 = v10;
    v69 = v14;
    v15 = (void *)objc_msgSend(v67, "copy");
    v16 = _Block_copy(v15);
    objc_msgSend(v13, "addObject:", v16);

    v17 = *v12;
    v18 = *v8;
    v54 = v14;
    if (v17)
    {
      v19 = objc_alloc_init(HDSyncAnchorMap);
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      obj = v54;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v73;
        v22 = (id *)(v17 + 8);
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v73 != v21)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "syncEntityIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_loadWeakRetained(v22);
            v26 = +[HDSyncAnchorEntity syncAnchorOfType:entityIdentifier:store:profile:error:](HDSyncAnchorEntity, "syncAnchorOfType:entityIdentifier:store:profile:error:", 0, v24, v18, v25, v58);

            if (v26 < 0)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v58, 1400, CFSTR("Failed to lookup next anchor for %@."), v24);

              v53 = 0;
              goto LABEL_14;
            }
            -[HDSyncAnchorMap setAnchor:forSyncEntityIdentifier:](v19, "setAnchor:forSyncEntityIdentifier:", v26, v24);

          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
          if (v20)
            continue;
          break;
        }
      }

      v53 = v19;
LABEL_14:

    }
    else
    {
      v53 = 0;
    }

    -[HDDaemonSyncEngine _syncAnchorRangeMapForSession:store:syncEntities:startingAnchors:error:](*(_QWORD *)(v55 + 40), *(void **)(v55 + 32), v54, v53, v58);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      if (objc_msgSend(v28, "anchorRangeCount"))
      {
        if ((objc_msgSend(*(id *)(v55 + 32), "requiresSyncForChangesFromAnchorRangeMap:", v29) & 1) != 0)
        {
          objc_msgSend(*(id *)(v55 + 32), "willSyncAnchorRanges:", v29);
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v50 = v54;
          v30 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
          if (v30)
          {
            v51 = *(_QWORD *)v64;
            while (2)
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v64 != v51)
                  objc_enumerationMutation(v50);
                v32 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
                objc_msgSend(v32, "syncEntityIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = 0;
                v62 = 0;
                v61 = HDSyncAnchorRangeMake(-1, -1);
                v62 = v34;
                if ((objc_msgSend(v29, "getAnchorRange:forSyncEntityIdentifier:", &v61, v33) & 1) != 0)
                {
                  *(_QWORD *)&v72 = 0;
                  *((_QWORD *)&v72 + 1) = &v72;
                  *(_QWORD *)&v73 = 0x2020000000;
                  v36 = v61;
                  v35 = v62;
                  *((_QWORD *)&v73 + 1) = v61;
                  v37 = v55;
                  if (v62 < v61)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v55 + 72), *(_QWORD *)(v55 + 40), CFSTR("HDDaemonSyncEngine.m"), 823, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalAnchor >= startAnchor"));

                    v36 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 24);
                    v37 = v55;
                  }
                  if (v35 > v36)
                  {
                    while (1)
                    {
                      *(_OWORD *)obja = *(_OWORD *)(v37 + 32);
                      v38 = obja[0];
                      v59 = vextq_s8(*(int8x16_t *)obja, *(int8x16_t *)obja, 8uLL);
                      v60 = *(id *)(v37 + 56);
                      if ((HKWithAutoreleasePool() & 1) == 0)
                        break;
                      if (*(_QWORD *)(*((_QWORD *)&v72 + 1) + 24) <= v36)
                      {
                        _HKInitializeLogging();
                        v39 = *MEMORY[0x1E0CB5370];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                        {
                          v40 = *(void **)(*((_QWORD *)&v72 + 1) + 24);
                          *(_DWORD *)buf = 134218754;
                          v78 = v36;
                          v79 = 2048;
                          v80 = v40;
                          v81 = 2048;
                          v82 = v35;
                          v83 = 2114;
                          v84 = v32;
                          _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "Start anchor did not increase (original: %lld, updated: %lld, expected final: %lld) during sync of %{public}@; skipping this entity.",
                            buf,
                            0x2Au);
                        }
                        goto LABEL_36;
                      }
                      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v37 + 64) + 8) + 24) == 2)
                      {
                        _HKInitializeLogging();
                        v41 = *MEMORY[0x1E0CB5370];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
                        {
                          v42 = *(_QWORD *)(v37 + 32);
                          *(_DWORD *)buf = 138543618;
                          v78 = v42;
                          v79 = 2114;
                          v80 = v32;
                          _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_INFO, "Delegate for sync session %{public}@ signaled that this sync session should start a new transaction, stop getting changes for %{public}@", buf, 0x16u);
                        }
LABEL_36:

                        v37 = v55;
                        goto LABEL_37;
                      }

                      v36 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 24);
                      v37 = v55;
                      if (v35 <= v36)
                        goto LABEL_37;
                    }

                    _HKInitializeLogging();
                    v46 = *MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v78 = (uint64_t)v32;
                      _os_log_impl(&dword_1B7802000, v46, OS_LOG_TYPE_INFO, "Sync for entity %{public}@ was unsuccessful. Skipping sync.", buf, 0xCu);
                    }
                    v27 = 0;
                    goto LABEL_49;
                  }
LABEL_37:
                  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v37 + 64) + 8) + 24) == 2)
                  {
                    _HKInitializeLogging();
                    v48 = *MEMORY[0x1E0CB5370];
                    v27 = 1;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
                    {
                      v49 = *(_QWORD *)(v55 + 32);
                      *(_DWORD *)buf = 138543362;
                      v78 = v49;
                      _os_log_impl(&dword_1B7802000, v48, OS_LOG_TYPE_INFO, "Delegate for sync session %{public}@ signaled that this sync session should start a new transaction, stop getting changes for any sync entity", buf, 0xCu);
                    }
LABEL_49:
                    _Block_object_dispose(&v72, 8);

                    goto LABEL_51;
                  }
                  _Block_object_dispose(&v72, 8);
                }

              }
              v30 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
              v27 = 1;
              if (v30)
                continue;
              break;
            }
          }
          else
          {
            v27 = 1;
          }
LABEL_51:

          goto LABEL_52;
        }
        _HKInitializeLogging();
        v44 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v45 = *(_QWORD *)(v55 + 32);
          *(_DWORD *)buf = 138543618;
          v78 = v45;
          v79 = 2114;
          v80 = v29;
          _os_log_impl(&dword_1B7802000, v44, OS_LOG_TYPE_DEFAULT, "session %{public}@ does not require sync for computed anchor map %{public}@", buf, 0x16u);
        }
      }
      v27 = 1;
    }
    else
    {
      v27 = 0;
    }
LABEL_52:

    v5 = v52;
    goto LABEL_53;
  }
  v27 = 0;
LABEL_53:

  return v27;
}

uint64_t __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a2, "supportsSyncStore:", *(_QWORD *)(a1 + 32));
  else
    return 1;
}

void __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;
  BOOL v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v2, "hk_map:", &__block_literal_global_214);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    v9 = 0;
    v6 = +[HDSyncAnchorEntity prepareSyncAnchorsForEntityIdentifiers:store:profile:error:](HDSyncAnchorEntity, "prepareSyncAnchorsForEntityIdentifiers:store:profile:error:", v4, v3, WeakRetained, &v9);
    v7 = v9;

    if (!v6)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v11 = v3;
        v12 = 2114;
        v13 = v7;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Failed to prepare sync entities for store %{public}@: %{public}@", buf, 0x16u);
      }
    }

  }
}

BOOL __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_330(uint64_t a1, HDDaemonSyncMessageHandler **a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  HDSyncAnchorMap *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  id v22;
  HDDaemonSyncMessageHandler *v23;
  id WeakRetained;
  char v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  HDDaemonSyncMessageHandler *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE aBlock[24];
  void *v53;
  HDDaemonSyncMessageHandler *v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 72);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(void **)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v45 = v7;
  if (!v3)
  {
    v30 = 0;
    v28 = v45;
    goto LABEL_41;
  }
  objc_msgSend(v8, "syncStore");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  v9 = HDSyncAnchorRangeMake(*(_QWORD *)(v5 + 24), v6);
  v41 = v10;
  v47 = 0;
  v11 = v8;
  objc_msgSend(v11, "syncStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "syncEntityDependenciesForSyncEntity:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(HDSyncAnchorMap);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, aBlock, 16);
  v46 = v8;
  v42 = v4;
  if (v16)
  {
    v17 = v16;
    v40 = v9;
    v18 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v21 = -[HDDaemonSyncEngine _nextSyncAnchorForEntity:session:startSyncAnchor:error:](v3, v20, v11, 0, (uint64_t)&v47);
        if (v21 < 0)
        {

          v14 = 0;
          goto LABEL_12;
        }
        -[HDSyncAnchorMap setAnchor:forSyncEntity:](v14, "setAnchor:forSyncEntity:", v21, v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, aBlock, 16);
      if (v17)
        continue;
      break;
    }
LABEL_12:
    v8 = v46;
    v4 = v42;
    v9 = v40;
  }

  v22 = v47;
  if (!v14)
  {
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)aBlock = 138543618;
      *(_QWORD *)&aBlock[4] = v4;
      *(_WORD *)&aBlock[12] = 2114;
      *(_QWORD *)&aBlock[14] = v22;
      _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Failed to retrieve sync anchor map for entity class %{public}@: %{public}@", aBlock, 0x16u);
    }
    v33 = (HDDaemonSyncMessageHandler *)v22;
    v23 = v33;
    if (v33)
    {
      v28 = v45;
      v29 = v43;
      if (a2)
      {
        v23 = objc_retainAutorelease(v33);
        v30 = 0;
        *a2 = v23;
      }
      else
      {
        _HKLogDroppedError();
        v30 = 0;
      }
      v26 = v23;
    }
    else
    {
      v26 = 0;
      v30 = 0;
      v28 = v45;
      v29 = v43;
    }
    goto LABEL_40;
  }
  v23 = -[HDDaemonSyncMessageHandler initWithSyncEntityClass:anchorRange:session:requiredAnchorMap:]([HDDaemonSyncMessageHandler alloc], "initWithSyncEntityClass:anchorRange:session:requiredAnchorMap:", v4, v9, v41, v11, v14);
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
  *(_QWORD *)&v48 = v22;
  v25 = objc_msgSend(v4, "generateSyncObjectsForSession:syncAnchorRange:profile:messageHandler:error:", v11, v9, v41, WeakRetained, v23, &v48);
  v26 = (id)v48;

  if ((v25 & 1) == 0)
  {
    -[HDDaemonSyncMessageHandler abandonUnsentChangesForError:](v23, "abandonUnsentChangesForError:", v26);
    v34 = v26;
    v35 = v34;
    v28 = v45;
    v8 = v46;
    v29 = v43;
    if (v34)
    {
      if (a2)
        *a2 = (HDDaemonSyncMessageHandler *)objc_retainAutorelease(v34);
      else
        _HKLogDroppedError();
    }

LABEL_30:
    -[HDDaemonSyncMessageHandler sendChangesError](v23, "sendChangesError");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[HDDaemonSyncMessageHandler sendChangesError](v23, "sendChangesError");
      v37 = objc_claimAutoreleasedReturnValue();

      v26 = (id)v37;
    }
    if (v26)
    {
      v26 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 124, CFSTR("Unknown error generating and sending sync messages for entity %@"), v42);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
LABEL_39:
        v30 = 0;
        goto LABEL_40;
      }
    }
    if (a2)
      *a2 = (HDDaemonSyncMessageHandler *)objc_retainAutorelease(v26);
    else
      _HKLogDroppedError();

    goto LABEL_39;
  }
  v27 = -[HDDaemonSyncMessageHandler sendChangesStatus](v23, "sendChangesStatus");
  v28 = v45;
  v8 = v46;
  v29 = v43;
  if (!v27)
    goto LABEL_30;
  v30 = v27;
  *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
  *(_QWORD *)&aBlock[8] = 3221225472;
  *(_QWORD *)&aBlock[16] = __110__HDDaemonSyncEngine__synchronizeSyncEntityClass_session_startAnchor_finalAnchor_postTransactionBlocks_error___block_invoke;
  v53 = &unk_1E6D0C930;
  v23 = v23;
  v54 = v23;
  v57 = v42;
  v55 = v43;
  v56 = v3;
  v31 = _Block_copy(aBlock);
  objc_msgSend(v45, "addObject:", v31);

  *(_QWORD *)(v39 + 24) = -[HDDaemonSyncMessageHandler currentAnchor](v23, "currentAnchor");
LABEL_40:

LABEL_41:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v30;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 0;
}

uint64_t __87__HDDaemonSyncEngine__performSyncTransactionForSession_store_transactionContext_error___block_invoke_333(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return 1;
}

- (id)unitTest_didCompleteReadTransaction
{
  return self->_unitTest_didCompleteReadTransaction;
}

- (void)setUnitTest_didCompleteReadTransaction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didCompleteReadTransaction, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
