@implementation _HKMedicalUserDomainConceptComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  HDConceptResolutionConfiguration *v21;
  void *v22;
  HDConceptResolutionConfiguration *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  uint8_t v46[4];
  void *v47;
  __int16 v48;
  id v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB57B0]);

  if (v7)
  {
    if (a1)
    {
      v8 = objc_msgSend(a1, "operatorType") == 10;
      objc_msgSend(a1, "value");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v8)
        HDMedicalUserDomainConceptEntityPredicateForCategoryTypes(v9);
      else
        HDMedicalUserDomainConceptEntityPredicateForCategoryType(v9, objc_msgSend(a1, "operatorType") == 4);
LABEL_5:
      v11 = objc_claimAutoreleasedReturnValue();
      a1 = (void *)v11;

    }
  }
  else
  {
    objc_msgSend(a1, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB5810]);

    if (v13)
    {
      if (!a1)
        goto LABEL_20;
      v14 = objc_msgSend(a1, "operatorType") == 10;
      objc_msgSend(a1, "value");
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v15;
      if (v14)
        HDMedicalUserDomainConceptEntityPredicateForMedicalRecordWithUUIDs(v15);
      else
        HDMedicalUserDomainConceptEntityPredicateForMedicalRecordWithUUID(v15, objc_msgSend(a1, "operatorType") == 4);
      goto LABEL_5;
    }
    objc_msgSend(a1, "keyPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB58B8]);

    if (v17)
    {
      v42 = v5;
      if (a1)
      {
        objc_msgSend(a1, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        v19 = v42;
        v20 = v18;
        v21 = [HDConceptResolutionConfiguration alloc];
        objc_msgSend(v20, "countryCode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:](v21, "initWithCountryCode:recordCategoryType:options:", v22, objc_msgSend(v20, "recordCategoryType"), 0);

        objc_msgSend(v20, "codingCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        +[HDOntologyConceptManager conceptForCodingCollection:configuration:profile:error:](HDOntologyConceptManager, "conceptForCodingCollection:configuration:profile:error:", v24, v23, v19, &v43);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = (uint64_t (*)(uint64_t, uint64_t))v43;
        if (v25)
        {
          v26 = v25;
          v40 = v19;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v51 = __Block_byref_object_copy__76;
          v52 = __Block_byref_object_dispose__76;
          v53 = 0;
          v39 = v26;
          objc_msgSend(v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDOntologyConceptManager predicateMatchingConceptsWithRelationshipType:withSubjectId:](HDOntologyConceptManager, "predicateMatchingConceptsWithRelationshipType:withSubjectId:", 1013, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          +[HDOntologyConceptManager predicateToExcludeSentinel](HDOntologyConceptManager, "predicateToExcludeSentinel");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __104___HKMedicalUserDomainConceptComparisonFilter_HealthDaemon___grouperConceptPredicateForConcept_profile___block_invoke;
          v44[3] = &unk_1E6CEA110;
          v44[4] = buf;
          LOBYTE(v26) = +[HDOntologyConceptManager enumerateConceptsMatchingPredicate:profile:error:enumerationHandler:](HDOntologyConceptManager, "enumerateConceptsMatchingPredicate:profile:error:enumerationHandler:", v30, v40, &v45, v44);
          v31 = v45;
          if ((v26 & 1) != 0)
          {
            v32 = *(void **)(*(_QWORD *)&buf[8] + 40);
            if (!v32)
              v32 = v39;
            v33 = v32;
            objc_msgSend(v33, "coding");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            HDUserDomainConceptEntityPredicateForMedicalCoding(v34);
            a1 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            _HKInitializeLogging();
            HKLogHealthOntology();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v46 = 138543618;
              v47 = a1;
              v48 = 2114;
              v49 = v31;
              _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Error loading relationships for concept: %{public}@", v46, 0x16u);
            }

            objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
            a1 = (void *)objc_claimAutoreleasedReturnValue();
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          _HKInitializeLogging();
          HKLogHealthOntology();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543875;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2113;
            *(_QWORD *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2114;
            v51 = v41;
            _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform concept resolution for concept resolution definition: %{private}@ with error: %{public}@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
          a1 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKMedicalUserDomainConceptComparisonFilter+HealthDaemon.m"), 34, CFSTR("Unreachable code has been executed"));

      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_20:

  return a1;
}

@end
