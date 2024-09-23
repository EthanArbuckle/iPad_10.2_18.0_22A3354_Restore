@implementation HDUserDomainConceptCollapser

- (HDUserDomainConceptCollapser)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)collapseUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id *v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _BOOL4 v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  NSObject *v67;
  void *v68;
  int v69;
  NSObject *v70;
  void *v71;
  int v72;
  int v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id *v82;
  void *v83;
  _BYTE buf[24];
  void *v85;
  id v86[4];

  v86[3] = *(id *)MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v12;
  v17 = v13;
  if (objc_msgSend(a1, "keepOldestConcept"))
  {
    objc_msgSend(v17, "creationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "creationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "hk_isBeforeDate:", v19);

    v21 = v16;
    v22 = v17;
    if ((v20 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v17, "modificationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "modificationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "hk_isAfterDate:", v24);

  v21 = v16;
  v22 = v17;
  if (v25)
  {
LABEL_5:

    v22 = v16;
    v21 = v17;
  }
LABEL_6:
  v26 = v22;
  v27 = v21;
  v28 = v14;
  v29 = v15;
  v30 = (void *)objc_opt_self();
  if (!objc_msgSend(v30, "preDeduplicationProcessingForUserDomainConcept:duplicateConcept:transaction:error:", v27, v26, v29, a7))goto LABEL_19;
  objc_msgSend(v26, "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "UUID");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = a7;
  v34 = (void *)v32;
  v82 = v33;
  v35 = +[HDUserDomainConceptEntity updateLinksTargetingUserDomainConceptUUID:toTargetUserDomainConceptUUID:profile:transaction:error:](HDUserDomainConceptEntity, "updateLinksTargetingUserDomainConceptUUID:toTargetUserDomainConceptUUID:profile:transaction:error:", v31, v32, v28, v29);

  if (!v35)
  {
LABEL_19:
    v65 = 0;
    goto LABEL_37;
  }
  v80 = v28;
  v77 = v17;
  v78 = v16;
  v36 = v27;
  v37 = v26;
  v79 = v30;
  objc_opt_self();
  v38 = v36;
  v39 = v37;
  objc_opt_self();
  objc_msgSend(v39, "propertyCollection");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)objc_msgSend(v38, "copyUserDomainConceptByMergingInPropertyCollection:", v40);
  v76 = v38;

  v75 = v41;
  v42 = v41;
  v43 = v39;
  objc_msgSend((id)objc_opt_self(), "mergeSubclassDataTo:fromDuplicateConcept:", v42, v43);
  v81 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "codingCollection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "codings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "mutableCopy");

  objc_msgSend(v43, "codingCollection");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "codings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __103__HDUserDomainConceptCollapser__migrateLinkAndCodingCollectionsAndSubclassDataFrom_to_outShouldUpdate___block_invoke;
  v85 = &unk_1E6CF5850;
  v49 = v46;
  v86[0] = v49;
  objc_msgSend(v49, "hk_addObjectsFromArray:passingTest:", v48, buf);

  v50 = objc_msgSend(v49, "count");
  objc_msgSend(v42, "codingCollection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "codings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "count");

  v55 = v50 != v53 || v81 != v42;
  v56 = v43;
  v57 = v42;
  objc_opt_self();
  objc_msgSend(v57, "linkCollection");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)MEMORY[0x1E0CB6D00];
  objc_msgSend(v56, "linkCollection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v56;

  objc_msgSend(v59, "collectionByMergingCollection:otherCollection:", v58, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61 != v58 && (!v58 || (objc_msgSend(v61, "isEqual:", v58) & 1) == 0))
  {

    goto LABEL_21;
  }

  if (v55)
  {
LABEL_21:
    v63 = v76;
    v17 = v77;
    v64 = v81;
    if (objc_msgSend(v49, "count"))
      objc_msgSend(v81, "userDomainConceptByReplacingLinks:andCodings:", v61, v49);
    else
      objc_msgSend(v81, "userDomainConceptByReplacingLinks:", v61);
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v74 = 1;
    goto LABEL_25;
  }
  v62 = v57;
  v74 = 0;
  v63 = v76;
  v17 = v77;
  v64 = v81;
LABEL_25:

  v66 = v62;
  if (v75 != v63 || v74)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v79;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v62;
      *(_WORD *)&buf[22] = 2114;
      v85 = v83;
      LOWORD(v86[0]) = 2114;
      *(id *)((char *)v86 + 2) = v63;
      _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: Update UDC %{public}@ during deduplication by merging %{public}@ into %{public}@", buf, 0x2Au);
    }

    objc_msgSend(v80, "userDomainConceptManager");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "updateUserDomainConcept:error:", v62, v82);

    if (!v69)
      goto LABEL_35;
  }
  if (!objc_msgSend(v79, "shouldDeleteDuplicateConcept"))
    goto LABEL_34;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v79;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v83;
    *(_WORD *)&buf[22] = 2114;
    v85 = v66;
    _os_log_impl(&dword_1B7802000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@: Delete duplicate UDC %{public}@ keeping UDC %{public}@", buf, 0x20u);
  }

  objc_msgSend(v80, "userDomainConceptManager");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "deleteUserDomainConcept:error:", v83, v82);

  if (v72)
LABEL_34:
    v65 = v66;
  else
LABEL_35:
    v65 = 0;
  v28 = v80;

  v16 = v78;
LABEL_37:

  return v65;
}

uint64_t __103__HDUserDomainConceptCollapser__migrateLinkAndCodingCollectionsAndSubclassDataFrom_to_outShouldUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v3, "codingSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CB5388];
    if (v6 == (void *)*MEMORY[0x1E0CB5388])
    {
      v4 = 0;
LABEL_17:

      goto LABEL_18;
    }
    if (v7)
    {
      objc_msgSend(v3, "codingSystem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", v7) & 1) != 0)
      {
        v4 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v18 = v9;
      v20 = v8;
    }
    objc_msgSend(v3, "codingSystem", v18, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = *MEMORY[0x1E0CB5390];
    v4 = v11 != *MEMORY[0x1E0CB5390];
    if (*MEMORY[0x1E0CB5390])
      v14 = v11 == v13;
    else
      v14 = 1;
    if (!v14)
    {
      objc_msgSend(v3, "codingSystem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v16, "isEqualToString:", v13) ^ 1;

    }
    v9 = v19;
    v8 = v21;
    if (!v7)
      goto LABEL_17;
    goto LABEL_16;
  }
  v4 = 0;
LABEL_18:

  return v4;
}

+ (BOOL)preDeduplicationProcessingForUserDomainConcept:(id)a3 duplicateConcept:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (id)mergeSubclassDataTo:(id)a3 fromDuplicateConcept:(id)a4
{
  return a3;
}

+ (BOOL)shouldDeleteDuplicateConcept
{
  return 1;
}

+ (BOOL)keepOldestConcept
{
  return 1;
}

@end
