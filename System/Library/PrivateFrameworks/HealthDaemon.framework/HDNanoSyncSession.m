@implementation HDNanoSyncSession

- (BOOL)isPullRequest
{
  return self->_options & 1;
}

- (unint64_t)messageCount
{
  return self->_messageCount;
}

- (BOOL)isRequestedByRemote
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (void)invokeCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  void (**completion)(id, BOOL, id);
  id v6;

  completion = (void (**)(id, BOOL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    v6 = self->_completion;
    self->_completion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_syncPredicate, 0);
}

- (id)changeSetWithChanges:(id)a3 statusCode:(int)a4 error:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  -[HDSyncSession sessionUUID](self, "sessionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSyncSession startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableNanoSyncChangeSet changeSetWithChanges:sessionUUID:startDate:sessionError:statusCode:](HDCodableNanoSyncChangeSet, "changeSetWithChanges:sessionUUID:startDate:sessionError:statusCode:", v9, v10, v11, v8, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)incrementMessageCount
{
  ++self->_messageCount;
}

- (HDNanoSyncSession)initWithSyncStore:(id)a3 options:(unint64_t)a4 reason:(id)a5 delegate:(id)a6 completion:(id)a7
{
  id v12;
  HDNanoSyncSession *v13;
  HDNanoSyncSession *v14;
  uint64_t v15;
  id completion;
  void *v17;
  int v18;
  HDSyncPredicate *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  HDSyncPredicate *v57;
  HDSyncPredicate *syncPredicate;
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
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  HDSyncPredicate *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  objc_super v122;
  _QWORD v123[3];
  _QWORD v124[3];
  _QWORD v125[52];
  _QWORD v126[54];

  v126[52] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v122.receiver = self;
  v122.super_class = (Class)HDNanoSyncSession;
  v13 = -[HDSyncSession initWithSyncStore:reason:delegate:](&v122, sel_initWithSyncStore_reason_delegate_, a3, a5, a6);
  v14 = v13;
  if (v13)
  {
    v13->_options = a4;
    v15 = objc_msgSend(v12, "copy");
    completion = v14->_completion;
    v14->_completion = (id)v15;

    -[HDNanoSyncSession nanoSyncStore](v14, "nanoSyncStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isMaster");

    v19 = [HDSyncPredicate alloc];
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[HDSyncSession syncStore](v14, "syncStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithLongLong:", objc_msgSend(v22, "syncProvenance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithObject:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6120]);
      v121 = objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB4BE8]);
      v120 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v120 = 0;
      v121 = 0;
    }
    -[HDNanoSyncSession nanoSyncStore](v14, "nanoSyncStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isMaster");

    if (v26)
    {
      v110 = v19;
      v111 = v24;
      v112 = v23;
      v113 = v18;
      v114 = v22;
      v115 = v12;
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6118]);
      v27 = objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6158]);
      v28 = objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6138]);
      v29 = objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6130]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6140]);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6148]);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6160]);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E0CB6150]);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceReferenceDate");
      objc_msgSend(v31, "numberWithDouble:", -v33);
      v34 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 76);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v125[0] = v105;
      v109 = (void *)v27;
      v126[0] = v27;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 67);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v125[1] = v104;
      v126[1] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 180);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v125[2] = v103;
      v126[2] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 190);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v125[3] = v102;
      v126[3] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 299);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v125[4] = v101;
      v126[4] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 300);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v125[5] = v100;
      v126[5] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 105);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v125[6] = v99;
      v126[6] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 104);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v125[7] = v98;
      v126[7] = v34;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 249);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v125[8] = v97;
      v108 = (void *)v28;
      v126[8] = v28;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 118);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v125[9] = v96;
      v107 = (void *)v29;
      v126[9] = v29;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 95);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v125[10] = v95;
      v126[10] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 96);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v125[11] = v94;
      v126[11] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 91);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v125[12] = v93;
      v126[12] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 97);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v125[13] = v92;
      v126[13] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v125[14] = v91;
      v126[14] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 92);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v125[15] = v90;
      v126[15] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 243);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v125[16] = v89;
      v126[16] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 244);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v125[17] = v88;
      v126[17] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 157);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v125[18] = v87;
      v126[18] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 158);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v125[19] = v86;
      v126[19] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 159);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v125[20] = v85;
      v126[20] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 160);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v125[21] = v84;
      v126[21] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 161);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v125[22] = v83;
      v126[22] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 162);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v125[23] = v82;
      v126[23] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 163);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v125[24] = v81;
      v126[24] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 164);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v125[25] = v80;
      v126[25] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 165);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v125[26] = v79;
      v126[26] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 166);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v125[27] = v78;
      v126[27] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 167);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v125[28] = v77;
      v126[28] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 168);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v125[29] = v76;
      v126[29] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 169);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v125[30] = v75;
      v126[30] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 170);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v125[31] = v73;
      v126[31] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 171);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v125[32] = v72;
      v126[32] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 229);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v125[33] = v71;
      v126[33] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 230);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v125[34] = v70;
      v126[34] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 231);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v125[35] = v69;
      v126[35] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 232);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v125[36] = v68;
      v126[36] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 233);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v125[37] = v67;
      v126[37] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 234);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v125[38] = v66;
      v126[38] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 235);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v125[39] = v65;
      v126[39] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 192);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v125[40] = v64;
      v126[40] = v34;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 191);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v125[41] = v63;
      v126[41] = v34;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 193);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v125[42] = v62;
      v126[42] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 63);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v125[43] = v61;
      v126[43] = v119;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 197);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v125[44] = v60;
      v126[44] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 198);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v125[45] = v35;
      v126[45] = v34;
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 256);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v125[46] = v36;
      v126[46] = v30;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 284);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v125[47] = v37;
      v126[47] = v118;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 283);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v125[48] = v38;
      v106 = (void *)v34;
      v126[48] = v34;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 298);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v125[49] = v39;
      v126[49] = v117;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 304);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v125[50] = v40;
      v126[50] = v117;
      objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 79);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v125[51] = v41;
      v126[51] = v116;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 52);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDSyncSession syncStore](v14, "syncStore");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "profile");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "daemon");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "behavior");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "features");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = objc_msgSend(v46, "extendedLocalWatchData");

      if ((_DWORD)v38)
      {
        objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 139);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v123[0] = v47;
        v124[0] = v30;
        objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 14);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v123[1] = v48;
        v124[1] = v30;
        objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 61);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v123[2] = v49;
        v124[2] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 3);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "hk_dictionaryByAddingEntriesFromDictionary:", v50);
        v51 = objc_claimAutoreleasedReturnValue();

        v52 = (void *)v51;
        v22 = v114;
        v18 = v113;
        v24 = v111;
        v23 = v112;
        v54 = (void *)v120;
        v53 = (void *)v121;
      }
      else
      {
        v22 = v114;
        v18 = v113;
        v24 = v111;
        v23 = v112;
        v54 = (void *)v120;
        v53 = (void *)v121;
        v52 = v74;
      }

      v12 = v115;
      v19 = v110;
    }
    else
    {
      v52 = 0;
      v54 = (void *)v120;
      v53 = (void *)v121;
    }
    v55 = -[HDSyncPredicate initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:](v19, "initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:", v24, 0, 0, v53, v54, v52);
    v56 = v52;
    v57 = (HDSyncPredicate *)v55;

    if (v18)
    {

    }
    syncPredicate = v14->_syncPredicate;
    v14->_syncPredicate = v57;

  }
  return v14;
}

- (BOOL)isLastChance
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4
{
  +[HDCodableNanoSyncChange changeWithNanoSyncEntityClass:version:](HDCodableNanoSyncChange, "changeWithNanoSyncEntityClass:version:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    return 0x20000;
  else
    return -[HDNanoSyncSession maxEncodedBytesPerChangeSetForSyncEntityClass:](self, "maxEncodedBytesPerChangeSetForSyncEntityClass:", a3);
}

- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3
{
  return 0x100000;
}

- (id)_intervalForSecondsSinceDaysAgo:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateBySubtractingDays:fromDate:", a2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  objc_msgSend(v4, "numberWithDouble:", -v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)syncPredicate
{
  return self->_syncPredicate;
}

- (BOOL)shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty
{
  void *v2;
  BOOL v3;

  -[HDSyncSession syncStore](self, "syncStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "protocolVersion") < 12;

  return v3;
}

- (id)completion
{
  return self->_completion;
}

@end
