@implementation CAFilter

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
  else
    _IMWarn();

}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "containsObject:", v9))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v8);
  else
    _IMWarn();

}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _IMWarn();

            goto LABEL_13;
          }
          objc_msgSend(v8, "addObject:", v14);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v6);
LABEL_13:

  }
  else
  {
    _IMWarn();
  }

}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  _IMWarn();

}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v20;
    objc_msgSend(v6, "_numberForKey:", CFSTR("x"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    objc_msgSend(v6, "_numberForKey:", CFSTR("y"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    objc_msgSend(v6, "_numberForKey:", CFSTR("width"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    objc_msgSend(v6, "_numberForKey:", CFSTR("height"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "floatValue");
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v9, v12, v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v19, v5);

  }
  else
  {
    _IMWarn();
  }

}

uint64_t __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_6()
{
  return _IMWarn();
}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  int v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  void *v76;
  void *v77;
  int v78;
  int v79;
  void *v80;
  void *v81;
  int v82;
  int v83;
  void *v84;
  void *v85;
  int v86;
  int v87;
  void *v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  int v102;
  id v103;
  id v104;
  _DWORD v105[20];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _IMWarn();
    goto LABEL_27;
  }
  v7 = v5;
  if (objc_msgSend(v7, "count") != 4)
  {
    _IMWarn();
    goto LABEL_26;
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
  if (!v9)
    goto LABEL_20;
  v10 = v9;
  v11 = *(_QWORD *)v111;
  v103 = v6;
  v104 = v7;
  v99 = *(_QWORD *)v111;
  v101 = a1;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v111 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = v103;
        _IMWarn();
LABEL_25:

        v7 = v104;
        goto LABEL_26;
      }
      v14 = v13;
      if (objc_msgSend(v14, "count") != 5)
      {
        v6 = v103;
        _IMWarn();
LABEL_24:

        goto LABEL_25;
      }
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v14 = v14;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v107;
        while (2)
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v107 != v17)
              objc_enumerationMutation(v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v6 = v103;
              _IMWarn();

              goto LABEL_24;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
          if (v16)
            continue;
          break;
        }
      }

      a1 = v101;
      v11 = v99;
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
    v6 = v103;
    v7 = v104;
    if (v10)
      continue;
    break;
  }
LABEL_20:

  v19 = v8;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v102 = v22;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v100 = v25;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v98 = v28;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  v97 = v31;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v96 = v34;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v95 = v37;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  v94 = v40;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "floatValue");
  v93 = v43;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectAtIndexedSubscript:", 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "floatValue");
  v92 = v46;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectAtIndexedSubscript:", 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  v91 = v49;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "floatValue");
  v90 = v52;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectAtIndexedSubscript:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  v89 = v55;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectAtIndexedSubscript:", 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "floatValue");
  v59 = v58;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectAtIndexedSubscript:", 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "floatValue");
  v63 = v62;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectAtIndexedSubscript:", 4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "floatValue");
  v67 = v66;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "floatValue");
  v71 = v70;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "objectAtIndexedSubscript:", 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "floatValue");
  v75 = v74;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectAtIndexedSubscript:", 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "floatValue");
  v79 = v78;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "objectAtIndexedSubscript:", 3);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "floatValue");
  v83 = v82;

  objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v84, "objectAtIndexedSubscript:", 4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "floatValue");
  v87 = v86;

  v105[0] = v102;
  v105[1] = v100;
  v105[2] = v98;
  v105[3] = v97;
  v105[4] = v96;
  v105[5] = v95;
  v105[6] = v94;
  v105[7] = v93;
  v105[8] = v92;
  v105[9] = v91;
  v105[10] = v90;
  v105[11] = v89;
  v105[12] = v59;
  v105[13] = v63;
  v105[14] = v67;
  v105[15] = v71;
  v105[16] = v75;
  v105[17] = v79;
  v105[18] = v83;
  v105[19] = v87;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v105);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v88, v6);

LABEL_26:
LABEL_27:

}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_8(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("type")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("name")) & 1) == 0)
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CA0]))
    {
LABEL_4:
      v6 = a1[4];
LABEL_7:
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v5, v8);
      goto LABEL_8;
    }
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CB0]))
    {
LABEL_6:
      v6 = a1[5];
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CB8])
      || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CC0])
      || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CC8]))
    {
      goto LABEL_4;
    }
    if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CD0])
      && !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CD8]))
    {
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CE0])
        || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CE8]))
      {
        goto LABEL_4;
      }
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CF0]))
        goto LABEL_6;
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2CF8]))
      {
        v6 = a1[7];
        goto LABEL_7;
      }
      if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D00])
        && !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D08])
        && !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D10]))
      {
        if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D18]))
        {
          v6 = a1[8];
          goto LABEL_7;
        }
        if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D20]))
        {
          v6 = a1[9];
          goto LABEL_7;
        }
        if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D28])
          || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D30]))
        {
          goto LABEL_4;
        }
        if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D38]))
        {
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D40]))
            goto LABEL_4;
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D48]))
            goto LABEL_6;
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D50])
            || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D58]))
          {
            goto LABEL_4;
          }
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D60]))
          {
            v7 = *(void (**)(void))(a1[10] + 16);
LABEL_36:
            v7();
            goto LABEL_8;
          }
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D68])
            || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D70])
            || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D78]))
          {
            goto LABEL_4;
          }
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D88]))
          {
            v7 = *(void (**)(void))(a1[10] + 16);
            goto LABEL_36;
          }
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D90]))
            goto LABEL_4;
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2D98]))
            goto LABEL_6;
          if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2DA0])
            || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2DA8]))
          {
            goto LABEL_4;
          }
          if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2DB0])
            && !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2DB8]))
          {
            if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2DC0])
              || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2DC8]))
            {
              goto LABEL_4;
            }
            if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2DD0]))
            {
              _IMWarn();
              goto LABEL_8;
            }
            goto LABEL_6;
          }
        }
      }
    }
    v6 = a1[6];
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

@end
