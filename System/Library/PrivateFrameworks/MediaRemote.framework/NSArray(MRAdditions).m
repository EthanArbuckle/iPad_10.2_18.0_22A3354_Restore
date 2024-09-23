@implementation NSArray(MRAdditions)

- (id)mr_first:()MRAdditions
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)mr_any:()MRAdditions
{
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)changeDescriptionTo:()MRAdditions keyBlock:isUpdatedBlock:descriptionBlock:
{
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t ii;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t jj;
  NSObject *v62;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  NSObject *v74;
  id obj;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
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
  _QWORD v97[4];
  NSObject *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v72 = a6;
  v13 = objc_msgSend(a1, "count");
  if (v13 <= objc_msgSend(v10, "count"))
    v14 = v10;
  else
    v14 = a1;
  v15 = objc_msgSend(v14, "count");
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = a1;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v109;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v109 != v19)
          objc_enumerationMutation(obj);
        v11[2](v11, *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i));
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          _MRLogForCategory(0);
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            -[NSArray(MRAdditions) changeDescriptionTo:keyBlock:isUpdatedBlock:descriptionBlock:].cold.1((uint64_t)v72);
          v41 = 0;
          goto LABEL_67;
        }
        v22 = (void *)v21;
        objc_msgSend(v76, "addObject:", v21);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
      if (v18)
        continue;
      break;
    }
  }

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", obj, v76);
  v74 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v73 = v10;
  v23 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v105;
    while (2)
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v105 != v25)
          objc_enumerationMutation(v73);
        v11[2](v11, *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j));
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          _MRLogForCategory(0);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[NSArray(MRAdditions) changeDescriptionTo:keyBlock:isUpdatedBlock:descriptionBlock:].cold.1((uint64_t)v72);
          v41 = 0;
          goto LABEL_66;
        }
        v28 = (void *)v27;
        -[NSObject addObject:](v74, "addObject:", v27);

      }
      v24 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
      if (v24)
        continue;
      break;
    }
  }
  v67 = v10;

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v73, v74);
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __85__NSArray_MRAdditions__changeDescriptionTo_keyBlock_isUpdatedBlock_descriptionBlock___block_invoke;
  v97[3] = &unk_1E30CEF78;
  v30 = obj;
  v98 = v30;
  v66 = v12;
  v102 = v12;
  v68 = v69;
  v99 = v68;
  v31 = v72;
  v103 = v31;
  v64 = v70;
  v100 = v64;
  v65 = v71;
  v101 = v65;
  v73 = v29;
  objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v97);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v76);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v74);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "minusSet:", v33);

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v34 = v32;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v94;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v94 != v37)
          objc_enumerationMutation(v34);
        -[NSObject objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * k));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v31 + 2))(v31, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v40);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v68, "count") || objc_msgSend(v65, "count") || objc_msgSend(v16, "count"))
  {
    v41 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v42 = v65;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v90;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v90 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(v41, "appendFormat:", CFSTR("+ %@\n"), *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * m), v64);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
      }
      while (v44);
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v47 = v64;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
    v12 = v66;
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v86;
      do
      {
        for (n = 0; n != v49; ++n)
        {
          if (*(_QWORD *)v86 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(v41, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * n));
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
      }
      while (v49);
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v52 = v68;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v81, v113, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v82;
      do
      {
        for (ii = 0; ii != v54; ++ii)
        {
          if (*(_QWORD *)v82 != v55)
            objc_enumerationMutation(v52);
          objc_msgSend(v41, "appendFormat:", CFSTR("* %@\n"), *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * ii));
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v81, v113, 16);
      }
      while (v54);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v57 = v16;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v77, v112, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v78;
      do
      {
        for (jj = 0; jj != v59; ++jj)
        {
          if (*(_QWORD *)v78 != v60)
            objc_enumerationMutation(v57);
          objc_msgSend(v41, "appendFormat:", CFSTR("- %@\n"), *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * jj));
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v77, v112, 16);
      }
      while (v59);
    }

  }
  else
  {
    v41 = 0;
    v12 = v66;
  }

  v62 = v98;
  v10 = v67;
LABEL_66:

LABEL_67:
  return v41;
}

- (id)mr_map:()MRAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "addObjectsFromArray:", v11);
        }
        else if (v11)
        {
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mr_filter:()MRAdditions
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)mr_all:()MRAdditions
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)))
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (uint64_t)mr_containsAnyOf:()MRAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(a1, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)mr_flatMap:()MRAdditions
{
  void (**v4)(id, _QWORD);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObjectsFromArray:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mr_compactMap:()MRAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)changeDescriptionTo:()MRAdditions keyBlock:isUpdatedBlock:descriptionBlock:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(void))(a1 + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12(&dword_193827000, v2, v3, "[changeDescription] Nil key returned for object: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_6();
}

@end
