@implementation HMDResidentSyncAdapter

id __HMDResidentSyncAdapter_1_1_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  char *v16;
  void *v17;
  void *i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  void *v49;
  void *v50;
  id v52;
  void *v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
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
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v2;
  toManyRelationship(v2, CFSTR("users"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = objc_msgSend(v4, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = v4;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objectValue(v10, 1, CFSTR("privilege"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;

      if (!v13 || (v14 = objc_msgSend(v13, "unsignedIntegerValue"), v13, v14 == 2))
      {
        v4 = v9;
        objc_msgSend(v9, "removeObjectAtIndex:", v8);
        --v7;
        if (v5)
          objc_msgSend(v5, "addObject:", objectValue(v10, 0, CFSTR("modelID")));
      }
      else
      {
        ++v8;
        v4 = v9;
      }

    }
    while (v8 < v7);
  }

  v15 = v53;
  if (objc_msgSend(v5, "count"))
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v52 = v4;
    obj = v4;
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    if (v56)
    {
      v55 = *(_QWORD *)v87;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v87 != v55)
            objc_enumerationMutation(obj);
          v57 = v16;
          v17 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)v16);
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          toManyRelationship(v17, CFSTR("bulletinRegistrations"));
          v59 = (id)objc_claimAutoreleasedReturnValue();
          v63 = (id)objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
          if (v63)
          {
            v61 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v63; i = (char *)i + 1)
              {
                if (*(_QWORD *)v83 != v61)
                  objc_enumerationMutation(v59);
                v19 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
                v78 = 0u;
                v79 = 0u;
                v80 = 0u;
                v81 = 0u;
                toManyRelationship(v19, CFSTR("conditions"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = *(_QWORD *)v79;
                  do
                  {
                    for (j = 0; j != v22; ++j)
                    {
                      if (*(_QWORD *)v79 != v23)
                        objc_enumerationMutation(v20);
                      v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
                      if (objc_msgSend(objectValue(v25, 0, CFSTR("$type")), "isEqualToString:", CFSTR("MKFPresenceBulletinCondition")))
                      {
                        toManyRelationship(v25, CFSTR("users"));
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        pruneArrayOfRefs(v26, v5);

                      }
                    }
                    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
                  }
                  while (v22);
                }

              }
              v63 = (id)objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
            }
            while (v63);
          }

          v16 = v57 + 1;
        }
        while (v57 + 1 != (char *)v56);
        v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      }
      while (v56);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    toManyRelationship(v53, CFSTR("accessories"));
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v75 != v29)
            objc_enumerationMutation(v64);
          v31 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
          toManyRelationship(v31, CFSTR("usersWithListeningHistoryEnabled"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          pruneArrayOfRefs(v32, v5);

          toManyRelationship(v31, CFSTR("usersWithMediaContentProfileEnabled"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          pruneArrayOfRefs(v33, v5);

          toManyRelationship(v31, CFSTR("usersWithPersonalRequestsEnabled"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          pruneArrayOfRefs(v34, v5);

          toManyRelationship(v31, CFSTR("pairedUsers"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          pruneArrayOfRefs(v35, v5);

        }
        v28 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
      }
      while (v28);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    toManyRelationship(v53, CFSTR("triggers"));
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
    if (v62)
    {
      v60 = *(id *)v71;
      do
      {
        for (m = 0; m != v62; ++m)
        {
          if (*(id *)v71 != v60)
            objc_enumerationMutation(v58);
          v37 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
          objectValue(v37, 2, CFSTR("owner"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v39 = v38;
          else
            v39 = 0;
          v40 = v39;

          if (v40)
          {
            objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("modelID"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v5, "containsObject:", v41);

            if (v42)
            {
              objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKeyedSubscript:", 0, CFSTR("owner"));

            }
          }
          v65 = v40;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          toManyRelationship(v37, CFSTR("events"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v67;
            do
            {
              for (n = 0; n != v46; ++n)
              {
                if (*(_QWORD *)v67 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * n);
                if (objc_msgSend(objectValue(v49, 0, CFSTR("$type")), "isEqualToString:", CFSTR("Presence")))
                {
                  toManyRelationship(v49, CFSTR("users"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  pruneArrayOfRefs(v50, v5);

                }
              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
            }
            while (v46);
          }

        }
        v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
      }
      while (v62);
    }

    v4 = v52;
    v15 = v53;
  }

  return v15;
}

@end
