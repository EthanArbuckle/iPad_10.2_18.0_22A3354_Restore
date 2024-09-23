@implementation IKDiffEvaluator

- (IKDiffEvaluator)initWithObjects:(id)a3 oldObjects:(id)a4 hashing:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKDiffEvaluator *v11;
  uint64_t v12;
  NSArray *objects;
  uint64_t v14;
  NSArray *oldObjects;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IKDiffEvaluator;
  v11 = -[IKDiffEvaluator init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    objects = v11->_objects;
    v11->_objects = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    oldObjects = v11->_oldObjects;
    v11->_oldObjects = (NSArray *)v14;

    -[IKDiffEvaluator _evaluateWithHashing:](v11, "_evaluateWithHashing:", v10);
  }

  return v11;
}

- (void)enumerateCommonObjectsUsingBlock:(id)a3
{
  id v4;
  NSDictionary *oldIndexesByNewIndex;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  oldIndexesByNewIndex = self->_oldIndexesByNewIndex;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__IKDiffEvaluator_enumerateCommonObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E9F4DEB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](oldIndexesByNewIndex, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __52__IKDiffEvaluator_enumerateCommonObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = *(_QWORD *)(a1 + 40);
  v8 = a3;
  v9 = a2;
  v10 = objc_msgSend(v9, "integerValue");
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "integerValue");
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v15 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t, void *, uint64_t))(v7 + 16))(v7, v10, v17, v13, v16, a4);

}

- (void)_evaluateWithHashing:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  IKDiffEvaluator *v58;
  NSIndexSet *removedIndexes;
  uint64_t v60;
  NSIndexSet *addedIndexes;
  uint64_t v62;
  NSDictionary *movedIndexesByNewIndex;
  uint64_t v64;
  NSDictionary *oldIndexesByNewIndex;
  id v66;
  id v67;
  void *v68;
  IKDiffEvaluator *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke;
  v88[3] = &unk_1E9F4DF00;
  v71 = v4;
  v89 = v71;
  v6 = MEMORY[0x1DF092410](v88);
  (*(void (**)(uint64_t, NSArray *))(v6 + 16))(v6, self->_oldObjects);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = self;
  v70 = (void *)v6;
  (*(void (**)(uint64_t, NSArray *))(v6 + 16))(v6, self->_objects);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_3((uint64_t)v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_3((uint64_t)v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v5;
  v84[1] = 3221225472;
  v84[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_5;
  v84[3] = &unk_1E9F4DF50;
  v14 = v10;
  v85 = v14;
  v15 = v13;
  v86 = v15;
  v67 = v12;
  v87 = v67;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v84);
  v68 = v15;
  objc_msgSend(v7, "removeObjectsAtIndexes:", v15);
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v5;
  v81[1] = 3221225472;
  v81[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_6;
  v81[3] = &unk_1E9F4DF78;
  v18 = v9;
  v82 = v18;
  v66 = v17;
  v83 = v66;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v81);
  v76 = v8;
  objc_msgSend(v8, "objectsAtIndexes:", v66);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertObjects:atIndexes:", v19, v66);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v11);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v11);
  v20 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v20;
  if (v11 >= 1)
  {
    v21 = (void *)v20;
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectAtIndexedSubscript:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqualToString:", v24) & 1) == 0)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "integerValue");

          v28 = i - v27;
          v21 = v74;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v75;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v21;
        }
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v23);

        objc_msgSend(v21, "objectForKeyedSubscript:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "integerValue");

          v34 = i - v33;
          v21 = v74;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v75;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v21;
        }
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v24);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v11);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  v73 = v16;
  v39 = v76;
  if (v11 >= 1)
  {
    v40 = 0;
    v41 = 0;
    v72 = (void *)v37;
    while (1)
    {
      if (v40 >= objc_msgSend(v16, "count"))
      {
        v42 = 0;
      }
      else
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v41 >= objc_msgSend(v39, "count"))
      {
        v43 = 0;
      }
      else
      {
        objc_msgSend(v39, "objectAtIndexedSubscript:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((objc_msgSend(v42, "isEqualToString:", v43) & 1) != 0)
        break;
      if (!objc_msgSend(v38, "containsObject:", v42))
      {
        if (!objc_msgSend(v38, "containsObject:", v43))
        {
          objc_msgSend(v75, "objectForKeyedSubscript:", v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "integerValue");

          objc_msgSend(v75, "objectForKeyedSubscript:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "integerValue");

          if (v45 <= v47)
          {
            v38 = v72;
            objc_msgSend(v72, "addObject:", v43);
            ++v41;
          }
          else
          {
            v38 = v72;
            objc_msgSend(v72, "addObject:", v42);
            ++v40;
          }
          v16 = v73;
          v39 = v76;
          goto LABEL_30;
        }
        goto LABEL_22;
      }
      ++v40;
LABEL_30:

      if ((uint64_t)v40 >= v11 && (uint64_t)v41 >= v11)
        goto LABEL_32;
    }
    ++v40;
LABEL_22:
    ++v41;
    goto LABEL_30;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v49 = v38;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v78 != v52)
          objc_enumerationMutation(v49);
        v54 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
        objc_msgSend(v18, "objectForKeyedSubscript:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v55, v56);

      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    }
    while (v51);
  }

  if (objc_msgSend(v68, "count"))
  {
    v57 = objc_msgSend(v68, "copy");
    v58 = v69;
    removedIndexes = v69->_removedIndexes;
    v69->_removedIndexes = (NSIndexSet *)v57;
  }
  else
  {
    v58 = v69;
    removedIndexes = v69->_removedIndexes;
    v69->_removedIndexes = 0;
  }

  if (objc_msgSend(v66, "count"))
  {
    v60 = objc_msgSend(v66, "copy");
    addedIndexes = v58->_addedIndexes;
    v58->_addedIndexes = (NSIndexSet *)v60;
  }
  else
  {
    addedIndexes = v58->_addedIndexes;
    v58->_addedIndexes = 0;
  }

  if (objc_msgSend(v48, "count"))
  {
    v62 = objc_msgSend(v48, "copy");
    movedIndexesByNewIndex = v58->_movedIndexesByNewIndex;
    v58->_movedIndexesByNewIndex = (NSDictionary *)v62;
  }
  else
  {
    movedIndexesByNewIndex = v58->_movedIndexesByNewIndex;
    v58->_movedIndexesByNewIndex = 0;
  }

  if (objc_msgSend(v67, "count"))
  {
    v64 = objc_msgSend(v67, "copy");
    oldIndexesByNewIndex = v58->_oldIndexesByNewIndex;
    v58->_oldIndexesByNewIndex = (NSDictionary *)v64;
  }
  else
  {
    oldIndexesByNewIndex = v58->_oldIndexesByNewIndex;
    v58->_oldIndexesByNewIndex = 0;
  }

}

id __40__IKDiffEvaluator__evaluateWithHashing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_2;
  v12[3] = &unk_1E9F4DED8;
  v15 = *(id *)(a1 + 32);
  v13 = v5;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = v3 + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v8);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("_%ld"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

id __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_4;
  v8[3] = &unk_1E9F4DF28;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_5(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(a1[4], "objectForKeyedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v5, v6);

  }
  else
  {
    objc_msgSend(a1[5], "addIndex:", a3);
  }

}

void __40__IKDiffEvaluator__evaluateWithHashing___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (NSArray)objects
{
  return self->_objects;
}

- (NSArray)oldObjects
{
  return self->_oldObjects;
}

- (NSIndexSet)addedIndexes
{
  return self->_addedIndexes;
}

- (NSIndexSet)removedIndexes
{
  return self->_removedIndexes;
}

- (NSDictionary)movedIndexesByNewIndex
{
  return self->_movedIndexesByNewIndex;
}

- (NSDictionary)oldIndexesByNewIndex
{
  return self->_oldIndexesByNewIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_movedIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_removedIndexes, 0);
  objc_storeStrong((id *)&self->_addedIndexes, 0);
  objc_storeStrong((id *)&self->_oldObjects, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
