@implementation NAUniqueArrayDiff

+ (id)diffFromArray:(id)a3 toArray:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t n;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t (**v52)(_QWORD, _QWORD, _QWORD);
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t ii;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id obj;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
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
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _QWORD v124[2];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setFromArray:", v8);
  objc_msgSend(v11, "setToArray:", v9);
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInsertedIndexes:", v77);
LABEL_68:

    goto LABEL_71;
  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeletedIndexes:", v77);
    goto LABEL_68;
  }
  v82 = v11;
  v83 = v8;
  objc_msgSend(a1, "_createContainerSetFromArray:options:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v9;
  v86 = v10;
  objc_msgSend(a1, "_createContainerSetFromArray:options:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v120;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v120 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsObject:", v21))
          v22 = v15;
        else
          v22 = v14;
        objc_msgSend(v22, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v14;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v116 != v26)
          objc_enumerationMutation(obj);
        objc_msgSend(v23, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * j), "index"));
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
    }
    while (v25);
  }
  v84 = v23;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v90 = v13;
  v29 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v112 != v31)
          objc_enumerationMutation(v90);
        v33 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * k);
        if (objc_msgSend(v16, "containsObject:", v33))
          v34 = v98;
        else
          v34 = v28;
        objc_msgSend(v34, "addObject:", v33);
      }
      v30 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
    }
    while (v30);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v89 = v28;
  v35 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
  v36 = v86;
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v108;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v108 != v38)
          objc_enumerationMutation(v89);
        objc_msgSend(v95, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * m), "index"));
      }
      v37 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
    }
    while (v37);
  }

  v40 = objc_msgSend(v15, "count");
  if (v40 != objc_msgSend(v98, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v98, "count"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unexpected discrepancy between existing object counts! From %@ to %@"), v41, v42);

  }
  v80 = v16;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v84, "mutableCopy");
  v97 = (void *)objc_msgSend(v95, "mutableCopy");
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v88 = v15;
  v44 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v104;
    v92 = v43;
    do
    {
      for (n = 0; n != v45; ++n)
      {
        if (*(_QWORD *)v104 != v46)
          objc_enumerationMutation(v88);
        v48 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * n);
        objc_msgSend(v98, "member:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          objc_msgSend(v48, "object");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Missing object %@ in toSet!"), v59);
          goto LABEL_51;
        }
        objc_msgSend(v36, "changeComparator");
        v50 = objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v51 = (void *)v50;
          objc_msgSend(v36, "changeComparator");
          v52 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "object");
          v53 = v46;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "object");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = ((uint64_t (**)(_QWORD, void *, void *))v52)[2](v52, v54, v55);

          v46 = v53;
          v36 = v86;

          if (v56)
            objc_msgSend(v93, "addIndex:", objc_msgSend(v48, "index"));
        }
        v57 = objc_msgSend(v48, "index");
        v43 = v92;
        if (v57 != objc_msgSend(v49, "index"))
        {
          objc_msgSend(v92, "addIndex:", objc_msgSend(v48, "index"));
          objc_msgSend(v97, "addIndex:", objc_msgSend(v49, "index"));
          v58 = (void *)MEMORY[0x1E0CB36B0];
          v124[0] = objc_msgSend(v48, "index");
          v124[1] = objc_msgSend(v49, "index");
          objc_msgSend(v58, "indexPathWithIndexes:length:", v124, 2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "addObject:", v59);
LABEL_51:

        }
      }
      v45 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
    }
    while (v45);
  }

  objc_msgSend(v85, "allObjects");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v84, "mutableCopy");
  v64 = (void *)objc_msgSend(v95, "mutableCopy");
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v65 = v61;
  v66 = v63;
  v87 = v65;
  v96 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
  if (v96)
  {
    v94 = *(_QWORD *)v100;
    do
    {
      for (ii = 0; ii != v96; ++ii)
      {
        if (*(_QWORD *)v100 != v94)
          objc_enumerationMutation(v87);
        v68 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * ii);
        v69 = objc_msgSend(v68, "indexAtPosition:", 0);
        v70 = objc_msgSend(v68, "indexAtPosition:", 1);
        v71 = v43;
        v72 = v69 - objc_msgSend(v43, "countOfIndexesInRange:", 0, v69);
        if (v72 == v70 - objc_msgSend(v97, "countOfIndexesInRange:", 0, v70))
        {
          objc_msgSend(v71, "removeIndex:", v69);
          objc_msgSend(v97, "removeIndex:", v70);
        }
        else
        {
          objc_msgSend(v62, "addObject:", v68);
          objc_msgSend(v63, "addIndex:", v69);
          objc_msgSend(v64, "addIndex:", v70);
          objc_msgSend(v93, "removeIndex:", v69);
        }
        v43 = v71;
      }
      v96 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
    }
    while (v96);
  }

  v11 = v82;
  if (objc_msgSend(v86, "allowMoves"))
  {
    v73 = v84;
    objc_msgSend(v82, "setDeletedIndexes:", v84);
    v74 = v64;
    v75 = v95;
    objc_msgSend(v82, "setInsertedIndexes:", v95);
    objc_msgSend(v82, "setMovedIndexes:", v62);
    v76 = v80;
  }
  else
  {
    objc_msgSend(v82, "setDeletedIndexes:", v63);
    objc_msgSend(v82, "setInsertedIndexes:", v64);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setMovedIndexes:", v78);

    v76 = v80;
    v73 = v84;
    v74 = v64;
    v75 = v95;
  }
  objc_msgSend(v82, "setChangedIndexes:", v93);

  v8 = v83;
  v9 = v81;
  v10 = v86;
LABEL_71:

  return v11;
}

uint64_t __51__NAUniqueArrayDiff_diffFromArray_toArray_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "indexAtPosition:", 0);
  v7 = objc_msgSend(v5, "indexAtPosition:", 1);

  v8 = objc_msgSend(v4, "indexAtPosition:", 0);
  v9 = objc_msgSend(v4, "indexAtPosition:", 1);

  v10 = v7 - v6;
  if (v6 > v7)
    v10 = v6 - v7;
  v11 = v9 - v8;
  if (v8 > v9)
    v11 = v8 - v9;
  if (v6 < v8)
    v12 = -1;
  else
    v12 = 1;
  v13 = v10 == v11;
  if (v10 < v11)
    v14 = -1;
  else
    v14 = 1;
  if (v13)
    return v12;
  else
    return v14;
}

+ (id)_createContainerSetFromArray:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__NAUniqueArrayDiff__createContainerSetFromArray_options___block_invoke;
  v14[3] = &unk_1E6227DB0;
  v8 = v7;
  v15 = v8;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v5, "count"))
    NSLog(CFSTR("Detected an attempt to use NAUniqueArrayDiff with duplicate array members. This is not supported and will lead to undefined behavior. Array: %@"), v5);
  v11 = v16;
  v12 = v8;

  return v12;
}

void __58__NAUniqueArrayDiff__createContainerSetFromArray_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v6, "equalComparator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hashGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_NASetContainer containerWithObject:atIndex:comparator:hashGenerator:](_NASetContainer, "containerWithObject:atIndex:comparator:hashGenerator:", v7, a3, v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v9);
}

- (NSIndexSet)insertedIndexes
{
  NSIndexSet *insertedIndexes;

  insertedIndexes = self->_insertedIndexes;
  if (insertedIndexes)
    return insertedIndexes;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSIndexSet)deletedIndexes
{
  NSIndexSet *deletedIndexes;

  deletedIndexes = self->_deletedIndexes;
  if (deletedIndexes)
    return deletedIndexes;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSIndexSet)changedIndexes
{
  NSIndexSet *changedIndexes;

  changedIndexes = self->_changedIndexes;
  if (changedIndexes)
    return changedIndexes;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSSet)movedIndexes
{
  NSSet *movedIndexes;

  movedIndexes = self->_movedIndexes;
  if (movedIndexes)
    return movedIndexes;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)numberOfOperations
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[NAUniqueArrayDiff deletedIndexes](self, "deletedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[NAUniqueArrayDiff insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[NAUniqueArrayDiff movedIndexes](self, "movedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[NAUniqueArrayDiff changedIndexes](self, "changedIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "count");

  return v10;
}

- (void)enumerateInsertsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NAUniqueArrayDiff insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NAUniqueArrayDiff_enumerateInsertsUsingBlock___block_invoke;
  v7[3] = &unk_1E6227DD8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v7);

}

uint64_t __48__NAUniqueArrayDiff_enumerateInsertsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateDeletesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NAUniqueArrayDiff deletedIndexes](self, "deletedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NAUniqueArrayDiff_enumerateDeletesUsingBlock___block_invoke;
  v7[3] = &unk_1E6227DD8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateIndexesWithOptions:usingBlock:", 2, v7);

}

uint64_t __48__NAUniqueArrayDiff_enumerateDeletesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NAUniqueArrayDiff changedIndexes](self, "changedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NAUniqueArrayDiff_enumerateChangesUsingBlock___block_invoke;
  v7[3] = &unk_1E6227DD8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v7);

}

uint64_t __48__NAUniqueArrayDiff_enumerateChangesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateMovesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[NAUniqueArrayDiff movedIndexes](self, "movedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_69);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "indexAtPosition:", 0, (_QWORD)v13), objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "indexAtPosition:", 1));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

uint64_t __46__NAUniqueArrayDiff_enumerateMovesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSArray)fromArray
{
  return self->_fromArray;
}

- (void)setFromArray:(id)a3
{
  objc_storeStrong((id *)&self->_fromArray, a3);
}

- (NSArray)toArray
{
  return self->_toArray;
}

- (void)setToArray:(id)a3
{
  objc_storeStrong((id *)&self->_toArray, a3);
}

- (void)setDeletedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_deletedIndexes, a3);
}

- (void)setInsertedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_insertedIndexes, a3);
}

- (void)setChangedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_changedIndexes, a3);
}

- (void)setMovedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_movedIndexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedIndexes, 0);
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_toArray, 0);
  objc_storeStrong((id *)&self->_fromArray, 0);
}

@end
