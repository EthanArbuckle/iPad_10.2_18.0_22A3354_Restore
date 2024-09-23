@implementation LSDisplayHumanReadableData

void ___LSDisplayHumanReadableData_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  id v12;
  NSString *v13;
  void *v14;
  FILE *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void (*v40)(uint64_t);
  char *v41;
  void *v42;
  void *v43;
  char *v44;
  char *v45;
  void *v46;
  id v47;
  void *context;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  FILE *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __n128 (*v64)(__n128 *, __n128 *);
  void (*v65)(uint64_t);
  const char *v66;
  void *__p;
  void *v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(*(id *)(a1 + 32), "descriptionOfUnit:inTable:", a2, *(unsigned int *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v9 = *(unsigned int *)(a1 + 72);
    v10 = *(_DWORD *)(a1 + 76);
    v55 = *(FILE **)(a1 + 64);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v50 = v5;
    v54 = v5;
    v52 = v7;
    v12 = v8;
    v51 = (void *)MEMORY[0x186DAE7A0]();
    v53 = v12;
    if (!v12 || (v56 = v54, objc_msgSend(v12, "evaluateWithObject:")))
    {
      if ((v10 & 0x10) != 0)
      {
        v56 = v54;
        v36 = v52;
        v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (v36)
          v38 = objc_msgSend(v36, "count");
        else
          v38 = -1;
        v39 = (void *)MEMORY[0x1E0D18B90];
        v61 = MEMORY[0x1E0C809B0];
        v62 = 3221225472;
        v63 = (uint64_t)___ZN14LaunchServices21DatabaseVisualizationL34getPropertyListFromUnitDescriptionEjjP18NSAttributedStringP5NSSetIP8NSStringE_block_invoke;
        v64 = (__n128 (*)(__n128 *, __n128 *))&unk_1E1042E78;
        v40 = (void (*)(uint64_t))v36;
        v65 = v40;
        v41 = (char *)v37;
        v66 = v41;
        __p = (void *)v38;
        objc_msgSend(v39, "enumerateValuesForTitlesInDescription:block:", v56, &v61);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, CFSTR("tableID"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, CFSTR("unitID"));

        v44 = (char *)v66;
        v45 = v41;

        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v45, 0, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          if (!*(_BYTE *)(v11 + 24))
            fputc(44, v55);
          *(_BYTE *)(v11 + 24) = 0;
          v47 = objc_retainAutorelease(v46);
          fwrite((const void *)objc_msgSend(v47, "bytes"), 1uLL, objc_msgSend(v47, "length"), v55);
        }

      }
      else
      {
        CSStore2::AttributedStringWriter::Separator((CSStore2::AttributedStringWriter *)0x2D, 0, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v55;
        objc_msgSend(v14, "cs_writeToFileHandle:", v55);

        fputc(10, v55);
        v56 = v54;
        if (v53)
        {
          v49 = v4;
          v16 = (id)objc_msgSend(v54, "mutableCopy");
          v17 = MEMORY[0x186DAE7A0]();
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v56 = v16;
          objc_msgSend(v16, "cs_rangesMatchingPredicate:", v53);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          context = (void *)v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, &v61, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v58;
            v21 = *MEMORY[0x1E0D18D48];
            v22 = *MEMORY[0x1E0D18D38];
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v58 != v20)
                  objc_enumerationMutation(v18);
                v24 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "rangeValue");
                v26 = v25;
                objc_msgSend(v56, "addAttribute:value:range:", v21, &unk_1E10756A8, v24, v25);
                objc_msgSend(v56, "addAttribute:value:range:", v22, &unk_1E10756C0, v24, v26);
              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, &v61, 16);
            }
            while (v19);
          }

          v4 = v49;
          objc_autoreleasePoolPop(context);

          v15 = v55;
        }
        if (v52)
        {
          v27 = objc_msgSend(v52, "count");
          v61 = 0;
          v62 = (uint64_t)&v61;
          v63 = 0x4812000000;
          v64 = __Block_byref_object_copy__54;
          v65 = __Block_byref_object_dispose__55;
          v66 = "";
          __p = 0;
          v68 = 0;
          v69 = 0;
          v28 = (void *)MEMORY[0x1E0D18B90];
          *(_QWORD *)&v57 = MEMORY[0x1E0C809B0];
          *((_QWORD *)&v57 + 1) = 3221225472;
          *(_QWORD *)&v58 = ___ZN14LaunchServices21DatabaseVisualizationL20writeUnitDescriptionEP7__sFILEjjP18NSAttributedStringP5NSSetIP8NSStringEP11NSPredicatejPb_block_invoke;
          *((_QWORD *)&v58 + 1) = &unk_1E1042E50;
          *(_QWORD *)&v59 = v52;
          *((_QWORD *)&v59 + 1) = &v61;
          *(_QWORD *)&v60 = v27;
          v29 = objc_msgSend(v28, "enumerateValuesForTitlesInDescription:block:", v56, &v57);
          v30 = *(uint64_t **)(v62 + 48);
          v31 = *(uint64_t **)(v62 + 56);
          while (v30 != v31)
          {
            v32 = *v30;
            v33 = v30[1];
            v34 = (void *)MEMORY[0x186DAE7A0](v29);
            objc_msgSend(v56, "attributedSubstringFromRange:", v32, v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "cs_writeToFileHandle:", v55);
            fputc(10, v55);

            objc_autoreleasePoolPop(v34);
            v30 += 2;
          }

          _Block_object_dispose(&v61, 8);
          if (__p)
          {
            v68 = __p;
            operator delete(__p);
          }
        }
        else
        {
          objc_msgSend(v56, "cs_writeToFileHandle:", v15);
          fputc(10, v55);
        }
      }
    }
    objc_autoreleasePoolPop(v51);

    v6 = v50;
  }

  objc_autoreleasePoolPop(v4);
}

@end
