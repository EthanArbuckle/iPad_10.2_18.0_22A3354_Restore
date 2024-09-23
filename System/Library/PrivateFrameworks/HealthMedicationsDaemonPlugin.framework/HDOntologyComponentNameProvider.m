@implementation HDOntologyComponentNameProvider

+ (id)componentNamesForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0D29308];
  v22 = 0;
  v23 = v10;
  v11 = objc_msgSend(a1, "_conceptIdentifiersFollowingFormOfRelationshipForNodeWithIdentifier:ontologyTransaction:conceptIdentifierOut:deletedFormOfRelationshipVersionOut:error:", v8, v9, &v22, &v23, a5);
  v12 = v22;
  v13 = 0;
  if (v11)
  {
    v21 = v10;
    objc_msgSend(a1, "_conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier:ontologyTransaction:maximumComponentDeletedRelationshipVersionOut:error:", v8, v9, &v21, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v16 = v23;
    if (v12)
    {
      v24[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v14, "count"))
      {
        v18 = 0;
        goto LABEL_9;
      }
      v17 = v15;
    }
    v18 = v17;
LABEL_9:
    if (v16 == v10)
      v19 = v21;
    else
      v19 = v16;
    objc_msgSend(a1, "_componentNamesFromClinicalProductIdentifiers:deletedRelationshipVersion:ontologyTransaction:error:", v18, v19, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

+ (BOOL)_conceptIdentifiersFollowingFormOfRelationshipForNodeWithIdentifier:(id)a3 ontologyTransaction:(id)a4 conceptIdentifierOut:(id *)a5 deletedFormOfRelationshipVersionOut:(int64_t *)a6 error:(id *)a7
{
  int v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  v8 = objc_msgSend(MEMORY[0x1E0D29520], "followRelationshipsWithTypes:startingIdentifier:options:ontologyTransaction:conceptOut:deletedRelationshipVersionOut:error:", &unk_1E6E115B0, a3, 12, a4, &v12, a6, a7);
  v9 = v12;
  v10 = v9;
  if (a5 && v8)
  {
    objc_msgSend(v9, "identifier");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier:(id)a3 ontologyTransaction:(id)a4 maximumComponentDeletedRelationshipVersionOut:(int64_t *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingRelationshipsWithSubjectId:relationshipType:", v9, 809);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = *MEMORY[0x1E0D29308];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v13 = (void *)MEMORY[0x1E0D29520];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __187__HDOntologyComponentNameProvider__conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier_ontologyTransaction_maximumComponentDeletedRelationshipVersionOut_error___block_invoke;
  v18[3] = &unk_1E6E00FE8;
  v20 = &v26;
  v21 = &v22;
  v14 = v12;
  v19 = v14;
  v15 = objc_msgSend(v13, "enumerateRelationshipsMatchingPredicate:options:transaction:error:enumerationHandler:", v11, 8, v10, a6, v18);
  if (a5 && *((_BYTE *)v23 + 24))
    *a5 = v27[3];
  if (v15)
    v16 = v14;
  else
    v16 = 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

uint64_t __187__HDOntologyComponentNameProvider__conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier_ontologyTransaction_maximumComponentDeletedRelationshipVersionOut_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (objc_msgSend(v3, "isDeleted"))
  {
    v4 = objc_msgSend(v3, "version");

    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (v4 > v6)
      v6 = v4;
    *(_QWORD *)(v5 + 24) = v6;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    v7 = (void *)a1[4];
    objc_msgSend(v3, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  return 1;
}

+ (id)_componentNamesFromClinicalProductIdentifiers:(id)a3 deletedRelationshipVersion:(int64_t)a4 ontologyTransaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(a1, "_componentNamesFromClinicalProductConceptWithIdentifier:ontologyTransaction:error:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17), v11, a6, (_QWORD)v22);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
          {

            v20 = 0;
            goto LABEL_12;
          }
          v19 = (void *)v18;
          objc_msgSend(v12, "addObjectsFromArray:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
          continue;
        break;
      }
    }

    v20 = v12;
LABEL_12:

  }
  else if (*MEMORY[0x1E0D29308] == a4)
  {
    v20 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29530], "nullLocalizedOntologyPreferredNamesWithVersion:withUserDomainConceptPropertyType:", a4, 160022);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)_componentNamesFromClinicalProductConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
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
  objc_msgSend(v7, "predicateMatchingRelationshipsWithSubjectId:relationshipType:", a3, 809);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = (void *)MEMORY[0x1E0D29520];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__HDOntologyComponentNameProvider__componentNamesFromClinicalProductConceptWithIdentifier_ontologyTransaction_error___block_invoke;
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

uint64_t __117__HDOntologyComponentNameProvider__componentNamesFromClinicalProductConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D29530];
  v4 = a2;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "version");

  objc_msgSend(v6, "numberWithLongLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedOntologyPreferredNamesForConcept:version:withUserDomainConceptPropertyType:", v5, v8, 160022);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v9);
  return 1;
}

@end
