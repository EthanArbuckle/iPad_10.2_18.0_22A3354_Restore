@implementation HDCloudSyncStartSequenceOperation

- (HDCloudSyncStartSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncStartSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6 replacingSequence:(id)a7 shouldClearRebaselineDeadline:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  HDCloudSyncStartSequenceOperation *v18;
  HDCloudSyncStartSequenceOperation *v19;
  objc_super v21;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncStartSequenceOperation;
  v18 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v21, sel_initWithConfiguration_cloudState_, a3, a4);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_target, a5);
    objc_storeStrong((id *)&v19->_sequenceRecord, a6);
    objc_storeStrong((id *)&v19->_replacedSequenceRecord, a7);
    v19->_shouldClearRebaselineDeadline = a8;
  }

  return v19;
}

- (BOOL)performWithError:(id *)a3
{
  HDCloudSyncStartSequenceOperation *v3;
  HDCloudSyncSequenceRecord *replacedSequenceRecord;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *sequenceState;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HDCloudSyncCachedZone *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  HDCloudSyncSequenceState *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  HDCloudSyncRegistryRecord *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  int v76;
  id v77;
  void *v78;
  id v79;
  HDCloudSyncSequenceState *v80;
  HDCloudSyncSequenceState *v81;
  HDCloudSyncTarget *target;
  NSObject *v84;
  void *v85;
  HDCloudSyncTarget *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  id *v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  BOOL v101;
  void *v102;
  _BYTE buf[12];
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  _QWORD v108[2];

  v3 = self;
  v108[1] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    replacedSequenceRecord = self->_replacedSequenceRecord;
    if (replacedSequenceRecord)
    {
      -[HDCloudSyncRecord recordID](replacedSequenceRecord, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }
    -[HDCloudSyncTarget zoneIdentifier](v3->_target, "zoneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");

    if (v9 != 2)
    {
      v32 = [HDCloudSyncSequenceState alloc];
      v33 = -[HDCloudSyncSequenceState initWithRecordsToSave:recordIDsToDelete:shouldClearRebaselineDeadline:](v32, "initWithRecordsToSave:recordIDsToDelete:shouldClearRebaselineDeadline:", MEMORY[0x1E0C9AA60], v7, v3->_shouldClearRebaselineDeadline);
      sequenceState = v3->_sequenceState;
      v3->_sequenceState = (HDCloudSyncSequenceState *)v33;
      LOBYTE(v3) = 1;
LABEL_45:

      return (char)v3;
    }
    v97 = v7;
    -[HDCloudSyncOperation configuration](v3, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "repository");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](v3, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryCKContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cachedOwnerIdentifierForContainer:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    sequenceState = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](v3, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "repository");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "syncIdentityManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentSyncIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identity");
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = [HDCloudSyncCachedZone alloc];
    -[HDCloudSyncTarget zoneIdentifier](v3->_target, "zoneIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](v3, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "repository");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](v3, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accessibilityAssertion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v21, "initForZoneIdentifier:repository:accessibilityAssertion:", v22, v24, v26);

    v100 = 0;
    objc_msgSend(v27, "recordsForClass:error:", objc_opt_class(), &v100);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v100;
    v30 = v29;
    if (!v28 && v29)
    {
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        target = v3->_target;
        v84 = v31;
        -[HDCloudSyncTarget zoneIdentifier](target, "zoneIdentifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v3;
        v104 = 2114;
        v105 = v85;
        v106 = 2114;
        v107 = v30;
        _os_log_error_impl(&dword_1B7802000, v84, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);

      }
      if (a3)
      {
        LOBYTE(v3) = 0;
        *a3 = objc_retainAutorelease(v30);
      }
      else
      {
        _HKLogDroppedError();
        LOBYTE(v3) = 0;
      }
      v7 = v97;
      goto LABEL_44;
    }
    v91 = a3;
    v94 = sequenceState;
    if ((unint64_t)objc_msgSend(v28, "count") >= 2)
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v86 = v3->_target;
        v87 = v34;
        -[HDCloudSyncTarget zoneIdentifier](v86, "zoneIdentifier");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v3;
        v104 = 2114;
        v105 = v88;
        _os_log_error_impl(&dword_1B7802000, v87, OS_LOG_TYPE_ERROR, "%{public}@ Retrieved multiple cached registry records for %{public}@,", buf, 0x16u);

      }
    }
    objc_msgSend(v28, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v35 == 0;
    if (!v35)
    {
      v89 = v30;
      v95 = v27;
      v36 = [HDCloudSyncRegistryRecord alloc];
      -[HDCloudSyncTarget zoneIdentifier](v3->_target, "zoneIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "zoneIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](v3, "configuration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "repository");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "profile");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "profileIdentifier");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = -[HDCloudSyncRegistryRecord initInZone:ownerProfileIdentifier:](v36, "initInZone:ownerProfileIdentifier:", v38, v42);

      v35 = v43;
      *(_QWORD *)buf = 0;
      LOBYTE(v42) = -[HDCloudSyncStartSequenceOperation _updateDisplayNameForRegistryRecord:error:](v3, v43, (uint64_t)buf);
      v44 = *(id *)buf;
      if ((v42 & 1) == 0)
      {
        v79 = v44;
        v27 = v95;
        v7 = v97;
        sequenceState = v94;
        v30 = v89;
        if (!v79)
          goto LABEL_42;
        goto LABEL_39;
      }

      v27 = v95;
      v30 = v89;
    }
    v96 = v35;
    objc_msgSend(v35, "storeIdentifiersForSyncIdentity:", v98);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncTarget store](v3->_target, "store");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "storeIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v45, "containsObject:", v47);

    if ((v48 & 1) == 0)
    {
      -[HDCloudSyncTarget store](v3->_target, "store");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "storeIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](v3, "configuration");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "repository");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "syncIdentityManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "currentSyncIdentity");
      v52 = v28;
      v53 = v27;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "identity");
      v55 = v30;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addStoreIdentifier:ownerIdentifier:syncIdentity:", v49, v94, v56);

      v30 = v55;
      v27 = v53;
      v28 = v52;

      v92 = 1;
    }
    -[HDCloudSyncTarget zoneIdentifier](v3->_target, "zoneIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "scope");

    if (v58 == 2)
    {
      v35 = v96;
      objc_msgSend(v96, "ownerProfileIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
      {
        -[HDCloudSyncOperation configuration](v3, "configuration");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "repository");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "profile");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "profileIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setOwnerProfileIdentifier:", v63);

        v35 = v96;
        v92 = 1;
      }
      objc_msgSend(v35, "sharedProfileIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v64)
      {
        -[HDCloudSyncOperation configuration](v3, "configuration");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "repository");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "profile");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "profileIdentifier");
        v68 = v30;
        v69 = v28;
        v70 = v27;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDCloudSyncRegistryRecord sharedProfileIdentifierForOwnerProfileIdentifier:](HDCloudSyncRegistryRecord, "sharedProfileIdentifierForOwnerProfileIdentifier:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setSharedProfileIdentifier:", v72);

        v27 = v70;
        v28 = v69;
        v30 = v68;

        v35 = v96;
        v92 = 1;
      }
    }
    else
    {
      v35 = v96;
    }
    -[HDCloudSyncOperation configuration](v3, "configuration");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "repository");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "profileType");

    if (v75 != 3)
    {
      v7 = v97;
      sequenceState = v94;
      if (!v92)
      {
        v79 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_37;
      }
LABEL_31:
      objc_msgSend(v35, "record");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v78;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
      v79 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
      v80 = -[HDCloudSyncSequenceState initWithRecordsToSave:recordIDsToDelete:shouldClearRebaselineDeadline:]([HDCloudSyncSequenceState alloc], "initWithRecordsToSave:recordIDsToDelete:shouldClearRebaselineDeadline:", v79, v7, v3->_shouldClearRebaselineDeadline);
      v81 = v3->_sequenceState;
      v3->_sequenceState = v80;

      v101 = 1;
LABEL_43:

      LOBYTE(v3) = v101;
LABEL_44:

      goto LABEL_45;
    }
    v99 = 0;
    v76 = -[HDCloudSyncStartSequenceOperation _updateDisplayNameForRegistryRecord:error:](v3, v35, (uint64_t)&v99);
    v77 = v99;
    v7 = v97;
    sequenceState = v94;
    if (v76)
    {

      goto LABEL_31;
    }
    v79 = v77;
    if (!v79)
    {
LABEL_42:

      v101 = v79 == 0;
      goto LABEL_43;
    }
LABEL_39:
    if (v91)
      *v91 = objc_retainAutorelease(v79);
    else
      _HKLogDroppedError();
    goto LABEL_42;
  }
  return (char)v3;
}

- (uint64_t)_updateDisplayNameForRegistryRecord:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v14;
  id v15;

  v5 = a2;
  objc_msgSend(a1, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legacyRepositoryProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v10 = objc_msgSend(v9, "fetchDisplayFirstName:lastName:error:", &v15, &v14, a3);
  v11 = v15;
  v12 = v14;

  if ((_DWORD)v10)
  {
    if (v11)
      objc_msgSend(v5, "setDisplayFirstName:", v11);
    if (v12)
      objc_msgSend(v5, "setDisplayLastName:", v12);
  }

  return v10;
}

- (HDCloudSyncSequenceState)sequenceState
{
  return self->_sequenceState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceState, 0);
  objc_storeStrong((id *)&self->_replacedSequenceRecord, 0);
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
