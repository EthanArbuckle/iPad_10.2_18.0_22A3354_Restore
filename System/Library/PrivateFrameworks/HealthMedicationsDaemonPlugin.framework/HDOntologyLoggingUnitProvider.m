@implementation HDOntologyLoggingUnitProvider

+ (id)loggingUnitsForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v8 = a4;
  v9 = *MEMORY[0x1E0D29308];
  v17 = 0;
  v18 = v9;
  v10 = objc_msgSend(MEMORY[0x1E0D29520], "followRelationshipsWithTypes:startingIdentifier:options:ontologyTransaction:conceptOut:deletedRelationshipVersionOut:error:", &unk_1E6E11520, a3, 12, v8, &v17, &v18, a5);
  v11 = v17;
  v12 = v11;
  v13 = 0;
  if (v10)
  {
    if (v11)
    {
      objc_msgSend(v11, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_localizedLoggingFormsForConceptWithIdentifier:ontologyTransaction:error:", v14, v8, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      goto LABEL_8;
    }
    if (v18 != v9)
    {
      objc_msgSend(MEMORY[0x1E0D29530], "nullLocalizedOntologyLoggingUnitsWithVersion:withUserDomainConceptPropertyType:", v18, 160018);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29530], "nullLocalizedOntologyLoggingUnitsWithVersion:withUserDomainConceptPropertyType:", v18, 160017);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_8:

  return v13;
}

+ (id)_localizedLoggingFormsForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v7 = (void *)MEMORY[0x1E0D29520];
  v8 = a4;
  objc_msgSend(v7, "predicateMatchingRelationshipsWithSubjectId:relationshipType:", a3, 797);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = (void *)MEMORY[0x1E0D29520];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__HDOntologyLoggingUnitProvider__localizedLoggingFormsForConceptWithIdentifier_ontologyTransaction_error___block_invoke;
  v16[3] = &unk_1E6E00790;
  v17 = v10;
  v12 = v10;
  LODWORD(a5) = objc_msgSend(v11, "enumerateRelationshipsMatchingPredicate:options:transaction:error:enumerationHandler:", v9, 5, v8, a5, v16);

  if ((_DWORD)a5)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

uint64_t __106__HDOntologyLoggingUnitProvider__localizedLoggingFormsForConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D29530];
  objc_msgSend(a2, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedLoggingUnitsForConcept:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  return 1;
}

@end
