@implementation HDOntologyEducationContentProvider

+ (BOOL)localizedEducationContentForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 localizedEducationContentOut:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *, void *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v10 = a3;
  v11 = a4;
  +[HDOntologyConceptManager predicateMatchingRelationshipsWithSubjectId:relationshipType:](HDOntologyConceptManager, "predicateMatchingRelationshipsWithSubjectId:relationshipType:", v10, 988);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __143__HDOntologyEducationContentProvider_localizedEducationContentForConceptWithIdentifier_ontologyTransaction_localizedEducationContentOut_error___block_invoke;
  v23 = &unk_1E6CFF360;
  v25 = &v32;
  v26 = &v28;
  v14 = v13;
  v24 = v14;
  v27 = a1;
  v15 = +[HDOntologyConceptManager enumerateRelationshipsMatchingPredicate:options:transaction:error:enumerationHandler:](HDOntologyConceptManager, "enumerateRelationshipsMatchingPredicate:options:transaction:error:enumerationHandler:", v12, 13, v11, a6, &v20);
  if (v15)
  {
    if (v33[3] != -1)
    {
      if (*((_BYTE *)v29 + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB69A0], "nullPropertyWithVersion:", v20, v21, v22, v23);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (objc_msgSend(v14, "count", v20, v21, v22, v23))
      {
        v17 = objc_alloc(MEMORY[0x1E0CB69A0]);
        v16 = objc_msgSend(v17, "initWithSections:version:timestamp:deleted:", v14, v33[3], 0, CFAbsoluteTimeGetCurrent());
LABEL_7:
        v18 = (void *)v16;
        if (!a5)
        {
LABEL_9:

          goto LABEL_10;
        }
LABEL_8:
        *a5 = objc_retainAutorelease(v18);
        goto LABEL_9;
      }
    }
    v18 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_10:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

uint64_t __143__HDOntologyEducationContentProvider_localizedEducationContentForConceptWithIdentifier_ontologyTransaction_localizedEducationContentOut_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  double Current;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  int64_t v76;
  uint64_t v77;
  id obj;
  id obja;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "version");
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(_QWORD *)(v5 + 24);
  if (v4 > v6)
    v6 = v4;
  *(_QWORD *)(v5 + 24) = v6;
  v7 = objc_msgSend(v3, "isDeleted");
  v8 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = v7;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  if ((objc_msgSend(v3, "isDeleted") & 1) == 0)
  {
    v67 = (void *)a1[4];
    v68 = v3;
    objc_msgSend(v3, "destination");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_self();
    v74 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v82 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    Current = CFAbsoluteTimeGetCurrent();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v66 = v10;
    objc_msgSend(v10, "attributes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v70 = v13;
    v71 = v12;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    if (!v83)
    {
      v18 = 0xFFFFFFFF80000000;
      v76 = 0xFFFFFFFF80000000;
      goto LABEL_43;
    }
    v80 = *(_QWORD *)v94;
    v18 = 0xFFFFFFFF80000000;
    v76 = 0xFFFFFFFF80000000;
    v69 = v11;
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v94 != v80)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v19);
        v21 = objc_msgSend(v20, "type");
        if (v21 <= 799)
        {
          switch(v21)
          {
            case 666:
              +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v82;
              v24 = v22;
              v25 = &unk_1E6DFE3D8;
              break;
            case 667:
              +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v82;
              v24 = v22;
              v25 = &unk_1E6DFE3F0;
              break;
            case 668:
              +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v82;
              v24 = v22;
              v25 = &unk_1E6DFE408;
              break;
            default:
              goto LABEL_36;
          }
LABEL_35:
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, v25);

        }
        else
        {
          switch(v21)
          {
            case 800:
              +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v82;
              v24 = v22;
              v25 = &unk_1E6DFE3A8;
              goto LABEL_35;
            case 801:
              +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v82;
              v24 = v22;
              v25 = &unk_1E6DFE3C0;
              goto LABEL_35;
            case 802:
              +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObject:", v38);

              break;
            case 803:
              objc_msgSend(v20, "stringValue");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "hk_addNonNilObject:", v39);

              v40 = objc_msgSend(v20, "version");
              v41 = v76;
              if (v76 <= v40)
                v41 = v40;
              v76 = v41;
              if ((v16 & 1) != 0)
                v16 = 1;
              else
                v16 = objc_msgSend(v20, "isDeleted");
              break;
            case 804:
              objc_msgSend(v20, "stringValue");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "hk_addNonNilObject:", v42);

              v43 = objc_msgSend(v20, "version");
              if (v18 <= v43)
                v18 = v43;
              if ((v15 & 1) != 0)
                v15 = 1;
              else
                v15 = objc_msgSend(v20, "isDeleted");
              break;
            default:
              if (v21 == 957)
              {
                +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v82;
                v24 = v22;
                v25 = &unk_1E6DFE390;
                goto LABEL_35;
              }
              if (v21 == 959)
              {
                v26 = objc_alloc(MEMORY[0x1E0CB6998]);
                objc_msgSend(v20, "stringValue");
                v72 = v17;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "componentsSeparatedByString:", CFSTR(","));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v16;
                v30 = v18;
                v31 = v15;
                v32 = HDOntologyEducationContentSectionDataTypeForAttributeType(objc_msgSend(v20, "type"));
                v33 = objc_msgSend(v20, "version");
                v34 = objc_msgSend(v20, "isDeleted");
                v35 = v26;
                v13 = v70;
                v36 = v32;
                v15 = v31;
                v18 = v30;
                v16 = v29;
                v37 = objc_msgSend(v35, "initWithStringValues:sectionDataType:version:timestamp:deleted:", v28, v36, v33, v34, Current);

                v11 = v69;
                v17 = (void *)v37;
                v12 = v71;
              }
              break;
          }
        }
LABEL_36:
        ++v19;
      }
      while (v83 != v19);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
      v83 = v44;
      if (!v44)
      {
LABEL_43:

        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v45, "hk_addNonNilObject:", v17);
        if (objc_msgSend(v12, "count"))
        {
          v46 = objc_alloc(MEMORY[0x1E0CB6998]);
          objc_msgSend(v12, "allObjects");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v46, "initWithStringValues:sectionDataType:version:timestamp:deleted:", v47, 4, v76, v16 & 1, Current);

          objc_msgSend(v45, "addObject:", v48);
        }
        v73 = v17;
        if (objc_msgSend(v13, "count"))
        {
          v49 = objc_alloc(MEMORY[0x1E0CB6998]);
          objc_msgSend(v13, "allObjects");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v49, "initWithStringValues:sectionDataType:version:timestamp:deleted:", v50, 5, v18, v15 & 1, Current);

          objc_msgSend(v45, "addObject:", v51);
        }
        v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v75 = v74;
        v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
        if (v81)
        {
          v77 = *(_QWORD *)v90;
          obja = v45;
          do
          {
            v53 = 0;
            do
            {
              if (*(_QWORD *)v90 != v77)
                objc_enumerationMutation(v75);
              v84 = v53;
              objc_msgSend(v45, "arrayByAddingObject:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v53));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              v55 = v82;
              v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
              if (v56)
              {
                v57 = v56;
                v58 = *(_QWORD *)v86;
                do
                {
                  for (i = 0; i != v57; ++i)
                  {
                    if (*(_QWORD *)v86 != v58)
                      objc_enumerationMutation(v55);
                    v60 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                    objc_msgSend(v55, "objectForKeyedSubscript:", v60);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "arrayByAddingObject:", v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v62, "hk_mapToDictionary:", &__block_literal_global_161);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69A8]), "initWithSectionDataTypeMapping:sectionType:", v63, objc_msgSend(v60, "integerValue"));
                    objc_msgSend(v52, "addObject:", v64);

                  }
                  v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
                }
                while (v57);
              }

              v53 = v84 + 1;
              v45 = obja;
            }
            while (v84 + 1 != v81);
            v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
          }
          while (v81);
        }

        objc_msgSend(v67, "addObjectsFromArray:", v52);
        v3 = v68;
        break;
      }
    }
  }

  return 1;
}

+ (id)_localizedSectionDataForAttribute:(void *)a3 timestamp:
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\n"), CFSTR("\n"), 0, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\t"), CFSTR("\t"), 0, 0, objc_msgSend(v6, "length"));
  v7 = objc_alloc(MEMORY[0x1E0CB6998]);
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HDOntologyEducationContentSectionDataTypeForAttributeType(objc_msgSend(v4, "type"));
  v10 = objc_msgSend(v4, "version");
  v11 = objc_msgSend(v4, "isDeleted");

  v12 = (void *)objc_msgSend(v7, "initWithStringValues:sectionDataType:version:timestamp:deleted:", v8, v9, v10, v11, a1);
  return v12;
}

void __83__HDOntologyEducationContentProvider__localizedEducationContentSectionsForConcept___block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "sectionDataType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v6, v8, v7);

}

@end
