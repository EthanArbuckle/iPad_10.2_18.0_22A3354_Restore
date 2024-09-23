@implementation HDMedicalRecordEntityEncoder

uint64_t __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ontologyVersion");
}

id __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CB64B0];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_msgSend(v3, "conceptIdentifier");

  return (id)objc_msgSend(v4, "initWithRawIdentifier:", v5);
}

BOOL __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v5 = a1;
  v63 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = a2;
  v11 = v7;
  objc_opt_self();
  v12 = v11;
  v13 = v10;
  objc_opt_self();
  objc_msgSend(v13, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "ontologyDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ontologyContentVersionWithError:", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_22;
  if ((objc_msgSend(v16, "isEqual:", v12) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 1001, CFSTR("Failed to load concepts; ontology version (%@) does not match expected (%@)"),
      v16,
      v12);
LABEL_22:
    v42 = 0;
    v43 = v12;
LABEL_27:

    goto LABEL_28;
  }

  objc_msgSend(v13, "profile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ontologyConceptManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v18;
  objc_msgSend(v18, "conceptsForIdentifiers:options:error:", v19, 0, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v53 = a3;
    v49 = v9;
    v51 = v5;
    v47 = v20;
    objc_msgSend(v20, "hk_mapToDictionary:", &__block_literal_global_316);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v8;
    v22 = v8;
    v16 = v21;
    v48 = v13;
    v54 = v13;
    objc_opt_self();
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v24 = v22;
    v57 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v57)
    {
      v25 = *(_QWORD *)v59;
      v55 = v16;
      v56 = *MEMORY[0x1E0CB4A40];
LABEL_6:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v59 != v25)
          objc_enumerationMutation(v24);
        v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v26);
        objc_msgSend(v27, "keyPath");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v28);
        v29 = (id)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v27, "keyPath");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v30);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v27, "conceptIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v53, 1001, CFSTR("Unable to find concepts referenced from concept index entry."));
LABEL_25:

          v42 = 0;
          v16 = v55;
          goto LABEL_26;
        }
        objc_msgSend(v27, "keyPath");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v33, "isEqualToString:", v56))
          goto LABEL_17;
        v34 = v25;
        v35 = v23;
        v36 = v24;
        v37 = objc_msgSend(v32, "relationshipsAreLoaded");

        if ((v37 & 1) == 0)
          break;
        v24 = v36;
        v23 = v35;
        v25 = v34;
        v16 = v55;
LABEL_18:
        objc_msgSend(MEMORY[0x1E0CB67C8], "indexableObjectWithObject:compoundIndex:", v32, objc_msgSend(v27, "compoundIndex"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v41);

        if (v57 == ++v26)
        {
          v57 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (v57)
            goto LABEL_6;
          goto LABEL_20;
        }
      }
      objc_msgSend(v32, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "profile");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDOntologyConceptManager relationshipsForConceptWithIdentifier:profile:error:](HDOntologyConceptManager, "relationshipsForConceptWithIdentifier:profile:error:", v38, v39, v53);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v36;
      v23 = v35;
      if (!v33)
        goto LABEL_25;
      v40 = objc_msgSend(v32, "copyWithRelationships:", v33);

      v32 = (void *)v40;
      v25 = v34;
      v16 = v55;
LABEL_17:

      goto LABEL_18;
    }
LABEL_20:

    v42 = v23;
LABEL_26:

    v8 = v50;
    v5 = v51;
    v13 = v48;
    v9 = v49;
    v12 = v47;
    v43 = v52;
    goto LABEL_27;
  }
  v12 = 0;
  v42 = 0;
  v43 = v52;
LABEL_28:

  v44 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8);
  v45 = *(void **)(v44 + 40);
  *(_QWORD *)(v44 + 40) = v42;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 40) != 0;
}

void __152___HDMedicalRecordEntityEncoder__indexableConceptsByKeyPathForConceptIndexEntries_conceptIdentifiers_expectedOntologyVersion_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))a3)[2](v5, v7, v6);

}

@end
