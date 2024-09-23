@implementation HFDictionaryCombinator

+ (BOOL)_isKindOfContainerClass:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_MergedGlobals_304 != -1)
    dispatch_once(&_MergedGlobals_304, &__block_literal_global_2_31);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)qword_1ED379B98;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

void __50__HFDictionaryCombinator__isKindOfContainerClass___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379B98;
  qword_1ED379B98 = v3;

}

- (id)combineResultDictionary:(id)a3 withResultDictionary:(id)a4 reconcilationHandler:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v61 = a5;
  if (v61)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDictionaryCombinator.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reconcilationHandler"));

    if (v9)
    {
LABEL_3:
      if (!v10)
      {
        v11 = (id)v9;
LABEL_9:
        v13 = v11;
        goto LABEL_10;
      }
    }
  }
  if (!v9 && v10)
  {
    v11 = (id)v10;
    goto LABEL_9;
  }
  if (!(v9 | v10))
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_10;
  }
  v13 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x1E0C99E60];
  v62 = (void *)v9;
  objc_msgSend((id)v9, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = (void *)v10;
  objc_msgSend((id)v10, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  v58 = (void *)v21;
  v59 = v17;
  objc_msgSend(v17, "na_setByIntersectingWithSet:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  v60 = v22;
  if (!v23)
    goto LABEL_41;
  v24 = v23;
  v25 = *(_QWORD *)v72;
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v72 != v25)
        objc_enumerationMutation(v22);
      v27 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
      -[HFDictionaryCombinator keysToSkip](self, "keysToSkip");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "containsObject:", v27);

      if ((v29 & 1) == 0)
      {
        -[HFDictionaryCombinator keysToReconcile](self, "keysToReconcile");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "containsObject:", v27);

        if (v31)
        {
          -[HFDictionaryCombinator _reconcileKey:fromDictionary:andDictionary:intoResultDictionary:withReconcilationHandler:](self, "_reconcileKey:fromDictionary:andDictionary:intoResultDictionary:withReconcilationHandler:", v27, v62, v19, v13, v61);
          continue;
        }
        objc_msgSend(v62, "objectForKeyedSubscript:", v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v27);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if (v32)
          v35 = v33 == 0;
        else
          v35 = 1;
        if (!v35 && objc_msgSend(v32, "isEqual:", v33))
        {
          v36 = v13;
          v37 = v32;
          goto LABEL_36;
        }
        v38 = objc_opt_class();
        if (v38 == objc_opt_class()
          && objc_msgSend((id)objc_opt_class(), "_isKindOfContainerClass:", v32))
        {
          -[HFDictionaryCombinator _mergeVal1:withVal2:](self, "_mergeVal1:withVal2:", v32, v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v39, v27);

          goto LABEL_32;
        }
        if (!v32 || v34)
        {
          v22 = v60;
          if (v32 || !v34)
          {
            -[HFDictionaryCombinator _reconcileKey:fromDictionary:andDictionary:intoResultDictionary:withReconcilationHandler:](self, "_reconcileKey:fromDictionary:andDictionary:intoResultDictionary:withReconcilationHandler:", v27, v62, v19, v13, v61);
          }
          else
          {
            v36 = v13;
            v37 = v34;
LABEL_36:
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v27);
          }
        }
        else
        {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, v27);
LABEL_32:
          v22 = v60;
        }

        continue;
      }
    }
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  }
  while (v24);
LABEL_41:
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v59, "na_setByRemovingObjectsFromSet:", v22);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v68 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
        -[HFDictionaryCombinator keysToSkip](self, "keysToSkip");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "containsObject:", v45);

        if ((v47 & 1) == 0)
        {
          objc_msgSend(v62, "objectForKeyedSubscript:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v48, v45);

        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v42);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v58, "na_setByRemovingObjectsFromSet:", v60);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v64 != v52)
          objc_enumerationMutation(v49);
        v54 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k);
        -[HFDictionaryCombinator keysToSkip](self, "keysToSkip");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "containsObject:", v54);

        if ((v56 & 1) == 0)
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", v54);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v57, v54);

        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v51);
  }

  v9 = (unint64_t)v62;
  v10 = (unint64_t)v19;
LABEL_10:

  return v13;
}

- (id)_mergeVal1:(id)a3 withVal2:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v10, "addEntriesFromDictionary:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDictionaryCombinator.m"), 126, CFSTR("Error; should not have called merge if it isn't mergable. (%@ && %@)"),
      v7,
      v8);

    v10 = 0;
  }
LABEL_6:

  return v10;
}

- (void)_reconcileKey:(id)a3 fromDictionary:(id)a4 andDictionary:(id)a5 intoResultDictionary:(id)a6 withReconcilationHandler:(id)a7
{
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v11 = a6;
  (*((void (**)(id, id, id, id))a7 + 2))(a7, a4, a5, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v13);

}

- (NSSet)keysToReconcile
{
  return self->_keysToReconcile;
}

- (void)setKeysToReconcile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)keysToSkip
{
  return self->_keysToSkip;
}

- (void)setKeysToSkip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToSkip, 0);
  objc_storeStrong((id *)&self->_keysToReconcile, 0);
}

@end
