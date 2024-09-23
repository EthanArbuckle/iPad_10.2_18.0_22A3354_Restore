@implementation NoteResurrectionMergePolicy

+ (id)sharedNoteResurrectionMergePolicy
{
  void *v2;
  NoteResurrectionMergePolicy *v3;
  void *v4;

  v2 = (void *)sharedNoteResurrectionMergePolicy_sharedMergePolicy;
  if (!sharedNoteResurrectionMergePolicy_sharedMergePolicy)
  {
    v3 = -[NSMergePolicy initWithMergeType:]([NoteResurrectionMergePolicy alloc], "initWithMergeType:", 2);
    v4 = (void *)sharedNoteResurrectionMergePolicy_sharedMergePolicy;
    sharedNoteResurrectionMergePolicy_sharedMergePolicy = (uint64_t)v3;

    v2 = (void *)sharedNoteResurrectionMergePolicy_sharedMergePolicy;
  }
  return v2;
}

- (id)localStoreForNote:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97B88]);
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersistentStoreCoordinator:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Account"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntity:", v8);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("accountIdentifier == %@"), CFSTR("local://local/account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v9);
  v20 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error getting default account: %@, %@"), v12, v13);

  }
  objc_msgSend(v10, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defaultStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectWithID:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)accountExists:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v3 = (objc_class *)MEMORY[0x1E0C97B88];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersistentStoreCoordinator:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Account"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntity:", v9);
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "predicateWithFormat:", CFSTR("accountIdentifier == %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v12);
  v15 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "count") == 1;

  return (char)v11;
}

- (id)snapshotFromRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "objectSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "objectSnapshot");
  else
    objc_msgSend(v3, "cachedSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  int v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t k;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t n;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t ii;
  void *v80;
  void *v81;
  void *v82;
  BOOL v83;
  char v85;
  id v86;
  uint64_t v87;
  void *v88;
  id v89;
  NoteResurrectionMergePolicy *v90;
  uint64_t v91;
  int v92;
  id v93;
  void *v94;
  id v95;
  id obj;
  id obja;
  void *v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
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
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  objc_super v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v90 = self;
  v129.receiver = self;
  v129.super_class = (Class)NoteResurrectionMergePolicy;
  v7 = -[NSMergePolicy resolveConflicts:error:](&v129, sel_resolveConflicts_error_, v6, a4);
  v8 = v7;
  if (!v7)
    goto LABEL_98;
  v85 = v7;
  v93 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v95 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v100 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v99 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v86 = v6;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
  if (v9)
  {
    v10 = v9;
    v103 = 0;
    v104 = 0;
    v94 = 0;
    v98 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v126;
    v91 = *(_QWORD *)v126;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v126 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
        objc_msgSend(v15, "sourceObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "entity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v104)
        {
          objc_msgSend(v16, "managedObjectContext");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Note"), v18);
          v101 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("NoteBody"), v18);
          v19 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("NoteChange"), v18);
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Store"), v18);
          v21 = objc_claimAutoreleasedReturnValue();

          v104 = (void *)v18;
          objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Account"), v18);
          v22 = objc_claimAutoreleasedReturnValue();

          v94 = (void *)v22;
          v13 = v91;
          v98 = (void *)v21;
          v103 = (void *)v20;
          v11 = (void *)v19;
          v12 = (void *)v101;
        }
        if (!objc_msgSend(v15, "newVersionNumber"))
        {
          if (objc_msgSend(v17, "isEqual:", v12))
          {
            objc_msgSend(v16, "objectID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "setObject:forKey:", v16, v23);
          }
          else if (objc_msgSend(v17, "isEqual:", v11))
          {
            -[NoteResurrectionMergePolicy snapshotFromRecord:](v90, "snapshotFromRecord:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKey:", CFSTR("owner"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "setObject:forKey:", v16, v24);

          }
          else
          {
            if (objc_msgSend(v17, "isEqual:", v98))
            {
              objc_msgSend(v16, "objectID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v100;
            }
            else
            {
              if (!objc_msgSend(v17, "isEqual:", v94))
                goto LABEL_20;
              objc_msgSend(v16, "objectID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v99;
            }
            objc_msgSend(v25, "addObject:", v23);
          }

        }
LABEL_20:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
      if (!v10)
        goto LABEL_24;
    }
  }
  v103 = 0;
  v104 = 0;
  v94 = 0;
  v98 = 0;
  v11 = 0;
  v12 = 0;
LABEL_24:

  v26 = v95;
  v27 = v104;
  if (!objc_msgSend(v93, "count")
    && !objc_msgSend(v95, "count")
    && !objc_msgSend(v100, "count")
    && !objc_msgSend(v99, "count"))
  {
    goto LABEL_97;
  }
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend(v104, "insertedObjects");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
  v88 = v11;
  obja = v12;
  if (!v28)
    goto LABEL_53;
  v29 = v28;
  v30 = *(_QWORD *)v122;
  v87 = *(_QWORD *)v122;
  do
  {
    for (j = 0; j != v29; ++j)
    {
      if (*(_QWORD *)v122 != v30)
        objc_enumerationMutation(v89);
      v32 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
      objc_msgSend(v32, "entity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqual:", v12);
      if ((v34 & 1) != 0)
      {
        v102 = v33;
        v35 = v32;
        goto LABEL_37;
      }
      if ((objc_msgSend(v33, "isEqual:", v11) & 1) != 0)
      {
        v102 = v33;
        objc_msgSend(v32, "owner");
        v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
        v36 = v35;
        objc_msgSend(v35, "store");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v100, "containsObject:", v38))
        {

          goto LABEL_40;
        }
        objc_msgSend(v36, "store");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "account");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectID");
        v41 = v29;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v99, "containsObject:", v42);

        v29 = v41;
        v11 = v88;

        v30 = v87;
        if (v92)
        {
LABEL_40:
          objc_msgSend(v36, "objectID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v95;
          if (v34)
            v44 = v93;
          else
            v44 = v95;
          objc_msgSend(v44, "setObject:forKey:", v32, v43);

        }
        else
        {
          v26 = v95;
        }
        v12 = obja;
        v33 = v102;
        goto LABEL_50;
      }
      if (!objc_msgSend(v33, "isEqual:", v98))
        goto LABEL_51;
      v45 = v33;
      v36 = v32;
      objc_msgSend(v36, "account");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v99, "containsObject:", v47);

      if (v48)
      {
        objc_msgSend(v36, "objectID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addObject:", v49);

        objc_msgSend(v104, "deleteObject:", v36);
      }
      v12 = obja;
      v33 = v45;
      v11 = v88;
LABEL_50:

      v27 = v104;
LABEL_51:

    }
    v29 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
  }
  while (v29);
LABEL_53:

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v50 = v93;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
  if (v51)
  {
    v52 = v51;
    v53 = 0;
    v54 = *(_QWORD *)v118;
    do
    {
      for (k = 0; k != v52; ++k)
      {
        if (*(_QWORD *)v118 != v54)
          objc_enumerationMutation(v50);
        v56 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * k);
        objc_msgSend(v50, "objectForKey:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          objc_msgSend(v27, "_forceInsertionForObject:", v57);
          objc_msgSend(v27, "_forceInsertionForObject:", v58);
          if (!v53)
          {
            -[NoteResurrectionMergePolicy localStoreForNote:](v90, "localStoreForNote:", v57);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v57, "setStore:", v53);
        }
        else
        {
          objc_msgSend(v27, "deleteObject:", v57);
        }
        objc_msgSend(v26, "removeObjectForKey:", v56);

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
    }
    while (v52);
  }
  else
  {
    v53 = 0;
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v59 = v26;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v114;
    do
    {
      for (m = 0; m != v61; ++m)
      {
        if (*(_QWORD *)v114 != v62)
          objc_enumerationMutation(v59);
        objc_msgSend(v59, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * m));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deleteObject:", v64);

      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
    }
    while (v61);
  }

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(v27, "insertedObjects");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v110;
    do
    {
      for (n = 0; n != v67; ++n)
      {
        if (*(_QWORD *)v110 != v68)
          objc_enumerationMutation(v65);
        v70 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * n);
        objc_msgSend(v70, "entity");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v71, "isEqual:", v103))
        {
          objc_msgSend(v70, "store");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectID");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v100, "containsObject:", v73);

          if (v74)
            objc_msgSend(v104, "deleteObject:", v70);
        }

      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
    }
    while (v67);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v75 = v100;
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
  v26 = v95;
  v27 = v104;
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v106;
    do
    {
      for (ii = 0; ii != v77; ++ii)
      {
        if (*(_QWORD *)v106 != v78)
          objc_enumerationMutation(v75);
        objc_msgSend(v104, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * ii));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "account");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
        {
          objc_msgSend(v81, "objectID");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v99, "containsObject:", v82))
          {

          }
          else
          {
            v83 = -[NoteResurrectionMergePolicy accountExists:](v90, "accountExists:", v81);

            if (!v83)
              objc_msgSend(v104, "deleteObject:", v81);
          }
        }

      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
    }
    while (v77);
  }

  v11 = v88;
  v12 = obja;
LABEL_97:

  v6 = v86;
  v8 = v85;
LABEL_98:

  return v8;
}

@end
