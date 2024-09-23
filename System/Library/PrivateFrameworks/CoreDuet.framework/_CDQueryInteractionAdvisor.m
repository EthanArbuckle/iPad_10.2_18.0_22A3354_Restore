@implementation _CDQueryInteractionAdvisor

- (_CDQueryInteractionAdvisor)initWithStore:(id)a3
{
  _CDInteractionStore *v4;
  _CDQueryInteractionAdvisor *v5;
  _CDInteractionStore *store;
  objc_super v8;

  v4 = (_CDInteractionStore *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_CDQueryInteractionAdvisor;
  v5 = -[_CDQueryInteractionAdvisor init](&v8, sel_init);
  store = v5->_store;
  v5->_store = v4;

  return v5;
}

- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4
{
  _CDInteractionStore *store;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char *v19;
  void *j;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  size_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  uint64_t n;
  void *v34;
  void *v35;
  float v36;
  uint64_t v37;
  float *v38;
  uint64_t v39;
  size_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  char *v53;
  uint64_t v54;
  _CDAdvisedInteraction *v55;
  void *v56;
  void *v57;
  BOOL v58;
  double v59;
  uint64_t v60;
  float *v61;
  float *v62;
  float v63;
  float v64;
  float v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  _QWORD v70[2];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  char *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  unint64_t v82;
  size_t v83;
  uint64_t i;
  id v85;
  id v86;
  char *v87;
  id v88;
  uint64_t v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[7];
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v74 = a4;
  store = self->_store;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[_CDInteractionStore countInteractionsUsingPredicate:error:](store, "countInteractionsUsingPredicate:error:", v7, 0);

  v73 = (id)objc_msgSend(v74, "copy");
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v74, "constrainKeywords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithSet:", v9);
  v72 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObjectsFromArray:", v11);

  objc_msgSend(v73, "setConstrainKeywords:", v72);
  objc_msgSend(v73, "interactionPredicate");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:error:](self->_store, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v71, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "componentsSeparatedByCharactersInSet:", v13);
  v88 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v88);
  v85 = (id)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "count");
  v126 = 0;
  v127 = &v126;
  v128 = 0x3032000000;
  v129 = __Block_byref_object_copy__7;
  v130 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 100);
  v131 = (id)objc_claimAutoreleasedReturnValue();
  v120 = 0;
  v121 = &v120;
  v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__7;
  v124 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
  v125 = (id)objc_claimAutoreleasedReturnValue();
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = __82___CDQueryInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke;
  v119[3] = &unk_1E26E4200;
  v119[4] = &v126;
  v119[5] = &v120;
  v119[6] = v89;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x193FEEAF4](v119);
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v76 = v12;
  v15 = (void *)objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
  if (v15)
  {
    v83 = *(_QWORD *)v116;
    do
    {
      for (i = 0; (void *)i != v15; ++i)
      {
        if (*(_QWORD *)v116 != v83)
          objc_enumerationMutation(v76);
        v16 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        objc_msgSend(v16, "keywords");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v111, v137, 16);
        if (v18)
        {
          v19 = *(char **)v112;
          v86 = v17;
          v87 = v19;
          do
          {
            v90 = v18;
            for (j = 0; j != v90; j = (char *)j + 1)
            {
              if (*(char **)v112 != v87)
                objc_enumerationMutation(v86);
              v21 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v85, "containsObject:", v21))
              {
                objc_msgSend(v16, "sender");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *, uint64_t))v14)[2](v14, v22, v21);

                v109 = 0u;
                v110 = 0u;
                v107 = 0u;
                v108 = 0u;
                objc_msgSend(v16, "recipients");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
                if (v24)
                {
                  v25 = *(_QWORD *)v108;
                  do
                  {
                    for (k = 0; k != v24; ++k)
                    {
                      if (*(_QWORD *)v108 != v25)
                        objc_enumerationMutation(v23);
                      v14[2](v14, *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * k), v21);
                    }
                    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
                  }
                  while (v24);
                }

              }
            }
            v17 = v86;
            v18 = (void *)objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v111, v137, 16);
          }
          while (v18);
        }

      }
      v15 = (void *)objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
    }
    while (v15);
  }

  v70[1] = v70;
  MEMORY[0x1E0C80A78]();
  v87 = (char *)v70 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = v27;
  bzero(v87, v27);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v28 = (id)v127[5];
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v104;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v104 != v30)
          objc_enumerationMutation(v28);
        objc_msgSend((id)v127[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * m));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v89)
        {
          for (n = 0; n != v89; ++n)
          {
            objc_msgSend(v88, "objectAtIndexedSubscript:", n);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKey:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
              *(float *)&v87[4 * n] = *(float *)&v87[4 * n] + 1.0;
          }
        }

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
    }
    while (v29);
  }

  if (v89)
  {
    v36 = (float)v82;
    v37 = v89;
    v38 = (float *)v87;
    do
    {
      *v38 = logf(v36 / *v38);
      ++v38;
      --v37;
    }
    while (v37);
  }
  v70[0] = objc_msgSend((id)v121[5], "count");
  MEMORY[0x1E0C80A78]();
  v77 = (char *)v70 - v39;
  bzero((char *)v70 - v39, v40);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v78 = (id)v121[5];
  v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v99, v134, 16);
  if (v80)
  {
    v81 = 0;
    v79 = *(_QWORD *)v100;
    do
    {
      v81 = (id)(int)v81;
      v82 = 0;
      i = (uint64_t)&v77[v83 * (int)v81];
      do
      {
        if (*(_QWORD *)v100 != v79)
          objc_enumerationMutation(v78);
        v41 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v82);
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v90 = v88;
        v42 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v95, v133, 16);
        if (v42)
        {
          v43 = 0;
          v44 = *(_QWORD *)v96;
          do
          {
            v45 = 0;
            v86 = (id)v43;
            v46 = (char *)(i + 4 * v43);
            do
            {
              if (*(_QWORD *)v96 != v44)
                objc_enumerationMutation(v90);
              v47 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v45);
              objc_msgSend((id)v127[5], "objectForKeyedSubscript:", v41);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "objectForKeyedSubscript:", v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v47) = objc_msgSend(v49, "intValue");

              *(float *)&v46[4 * v45++] = (float)(int)v47;
            }
            while (v42 != v45);
            v42 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v95, v133, 16);
            v43 = (_DWORD)v86 + v45;
          }
          while (v42);
        }

        i += v83;
        v81 = (char *)v81 + 1;
        ++v82;
      }
      while (v82 != v80);
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v99, v134, 16);
    }
    while (v80);
  }

  objc_msgSend(v76, "firstObject");
  v90 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v70[0]);
  i = objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v81 = (id)v121[5];
  v50 = (void *)objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v91, v132, 16);
  if (v50)
  {
    v51 = 0;
    v82 = *(_QWORD *)v92;
    do
    {
      v52 = 0;
      v53 = &v77[v83 * v51];
      v86 = v50;
      do
      {
        if (*(_QWORD *)v92 != v82)
          objc_enumerationMutation(v81);
        v54 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v52);
        v55 = objc_alloc_init(_CDAdvisedInteraction);
        -[_CDAdvisedInteraction setMechanism:](v55, "setMechanism:", objc_msgSend(v90, "mechanism"));
        objc_msgSend(v90, "bundleId");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDAdvisedInteraction setBundleId:](v55, "setBundleId:", v56);

        objc_msgSend(v90, "account");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDAdvisedInteraction setAccount:](v55, "setAccount:", v57);
        v58 = v89 == 0;

        v59 = 0.0;
        if (!v58)
        {
          v60 = v89;
          v61 = (float *)v53;
          v62 = (float *)v87;
          do
          {
            v63 = *v61++;
            v64 = v63;
            v65 = *v62++;
            v59 = v59 + (float)(v64 * v65);
            --v60;
          }
          while (v60);
        }
        -[_CDAdvisedInteraction setScore:](v55, "setScore:", v59);
        -[_CDAdvisedInteraction setContact:](v55, "setContact:", v54);
        objc_msgSend((id)i, "addObject:", v55);

        ++v51;
        v52 = (char *)v52 + 1;
        v53 += v83;
      }
      while (v52 != v86);
      v50 = (void *)objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v91, v132, 16);
    }
    while (v50);
  }

  objc_msgSend((id)i, "sortedArrayUsingComparator:", &__block_literal_global_21);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v74, "resultLimit");
  if (v67 < objc_msgSend(v66, "count"))
  {
    objc_msgSend(v66, "subarrayWithRange:", 0, objc_msgSend(v74, "resultLimit"));
    v68 = objc_claimAutoreleasedReturnValue();

    v66 = (void *)v68;
  }

  _Block_object_dispose(&v120, 8);
  _Block_object_dispose(&v126, 8);

  return v66;
}

- (_CDInteractionStore)store
{
  return (_CDInteractionStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
