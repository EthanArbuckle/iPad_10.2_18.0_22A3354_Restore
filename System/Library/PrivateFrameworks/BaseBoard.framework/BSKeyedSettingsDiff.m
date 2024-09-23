@implementation BSKeyedSettingsDiff

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v6
    || (objc_msgSend(v6, "objectForKey:", v15),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v5, "isEqual:", v7),
        v7,
        (v8 & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSSettingsDiff diffFromSettings:toSettings:](BSSettingsDiff, "diffFromSettings:toSettings:", v9, v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v11)
    {
      v12 = objc_opt_new();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v11, "setObject:forKey:", v5, v15);
  }

}

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = (void *)a1[4];
  if (!v6
    || (objc_msgSend(v6, "objectForKey:", v17), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[BSSettingsDiff diffFromSettings:toSettings:](BSSettingsDiff, "diffFromSettings:toSettings:", v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      if (!v9)
      {
        v10 = objc_opt_new();
        v11 = *(_QWORD *)(a1[5] + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v9 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      }
      objc_msgSend(v9, "setObject:forKey:", v8, v17);

    }
    v13 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v13)
    {
      v14 = objc_opt_new();
      v15 = *(_QWORD *)(a1[6] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v13 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    }
    objc_msgSend(v13, "addObject:", v17);
  }

}

- (void)inspectKeyedChangesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, unint64_t, id);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, unint64_t, id))a3;
  v14 = objc_opt_class();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BSKeyedSettingsDiff allKeys](self, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = -[BSKeyedSettingsDiff _diffTypesForKey:](self, "_diffTypesForKey:", v9);
        if ((v10 & 2) != 0)
        {
          -[BSSettings objectForKey:](self->super._changes, "objectForKey:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v12 = v11;
            else
              v12 = 0;
          }
          else
          {
            v12 = 0;
          }
          v13 = v12;

          v4[2](v4, v9, v10, v13);
        }
        else
        {
          v4[2](v4, v9, v10, 0);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (unint64_t)_diffTypesForKey:(id)a3
{
  id v4;
  BSSettings *changes;
  _BOOL8 v6;
  BSSettings *v7;
  void *v8;
  _BOOL4 v9;
  unint64_t v10;

  v4 = a3;
  changes = self->super._changes;
  v6 = changes && -[BSSettings flagForKey:](changes, "flagForKey:", v4) != 0x7FFFFFFFFFFFFFFFLL
    || -[NSSet containsObject:](self->super._flagRemovals, "containsObject:", v4);
  v7 = self->super._changes;
  if (v7
    && (-[BSSettings objectForKey:](self->super._changes, "objectForKey:", v4),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = 1;
  }
  else
  {
    v9 = -[NSSet containsObject:](self->super._objectRemovals, "containsObject:", v4);
    if (!v7)
      goto LABEL_12;
    v8 = 0;
  }

LABEL_12:
  if (v9)
    v10 = v6 | 2;
  else
    v10 = v6;

  return v10;
}

- (id)allKeys
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[BSSettings allKeys](self->super._changes, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  objc_msgSend(v7, "unionSet:", self->super._flagRemovals);
  objc_msgSend(v7, "unionSet:", self->super._objectRemovals);
  return v7;
}

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  if (!v5 || objc_msgSend(v5, "flagForKey:", v10) != a3)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = objc_opt_new();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "setFlag:forKey:", a3, v10);
  }

}

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(void **)(a1 + 32);
  if (!v3 || objc_msgSend(v3, "flagForKey:", v8) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
  }

}

- (BOOL)_isKeyed
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (Class)_removalClass
{
  return (Class)objc_opt_class();
}

- (void)applyToSettings:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "applySettings:", self->super._changes);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->super._flagRemovals;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "setFlag:forKey:", 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v6);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = self->super._objectRemovals;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v4, "setObject:forKey:", 0, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id *v18;
  id *v19;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _BYTE *v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  _BYTE *v38;
  _QWORD v39[4];
  id v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE buf[24];
  id v55;
  __int128 v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7 && (objc_msgSend(v7, "isKeyedSettings") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!from || [from isKeyedSettings]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2048;
      v55 = a1;
      LOWORD(v56) = 2114;
      *(_QWORD *)((char *)&v56 + 2) = CFSTR("BSSettingsDiff.m");
      WORD5(v56) = 1024;
      HIDWORD(v56) = 404;
      v57 = 2114;
      v58 = v21;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    __break(0);
    JUMPOUT(0x18A19D824);
  }
  if (v8 && (objc_msgSend(v8, "isKeyedSettings") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!to || [to isKeyedSettings]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      v55 = a1;
      LOWORD(v56) = 2114;
      *(_QWORD *)((char *)&v56 + 2) = CFSTR("BSSettingsDiff.m");
      WORD5(v56) = 1024;
      HIDWORD(v56) = 405;
      v57 = 2114;
      v58 = v25;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    __break(0);
    JUMPOUT(0x18A19D928);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__7;
  *(_QWORD *)&v56 = __Block_byref_object_dispose__7;
  *((_QWORD *)&v56 + 1) = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__7;
  v52 = __Block_byref_object_dispose__7;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__7;
  v46 = __Block_byref_object_dispose__7;
  v47 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke;
  v39[3] = &unk_1E1EBFCF0;
  v10 = v7;
  v40 = v10;
  v41 = buf;
  objc_msgSend(v8, "enumerateKeyedFlagsWithBlock:", v39);
  v36[0] = v9;
  v36[1] = 3221225472;
  v36[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_2;
  v36[3] = &unk_1E1EBFD18;
  v11 = v10;
  v37 = v11;
  v38 = buf;
  objc_msgSend(v8, "enumerateKeyedObjectsWithBlock:", v36);
  v33[0] = v9;
  v33[1] = 3221225472;
  v33[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_3;
  v33[3] = &unk_1E1EBFCF0;
  v12 = v8;
  v34 = v12;
  v35 = &v48;
  objc_msgSend(v11, "enumerateKeyedFlagsWithBlock:", v33);
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_4;
  v29[3] = &unk_1E1EBFD40;
  v13 = v12;
  v30 = v13;
  v31 = buf;
  v32 = &v42;
  objc_msgSend(v11, "enumerateKeyedObjectsWithBlock:", v29);
  if (!BSSettingsIsEmpty(*(void **)(*(_QWORD *)&buf[8] + 40))
    || objc_msgSend((id)v49[5], "count")
    || objc_msgSend((id)v43[5], "count"))
  {
    objc_msgSend(v13, "descriptionProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v11, "descriptionProvider");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDescriptionProvider:", v17);
    v18 = (id *)objc_alloc((Class)a1);
    v19 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:](v18, *(void **)(*(_QWORD *)&buf[8] + 40), (void *)v49[5], (void *)v43[5]);
    objc_msgSend(v19, "setDescriptionProvider:", v17);

  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(buf, 8);
  return v19;
}

- (id)allSettings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BSKeyedSettingsDiff allKeys](self, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addValue:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "hash"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)copyWithKeys:(id)a3
{
  id v4;
  BSSettings *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  BSSettings *v17;
  id *v18;
  void *v19;
  BSKeyedSettingsDiff *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = self->super._changes;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[BSSettings allKeys](v5, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v21 = self;
    v7 = 0;
    if (v6)
    {
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[BSSettings objectForKey:](v5, "objectForKey:", v10, v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_opt_class();
          v13 = v11;
          if (v12)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v14 = v13;
            else
              v14 = 0;
          }
          else
          {
            v14 = 0;
          }
          v15 = v14;

          if (v15)
          {
            if (!v7)
              v7 = (void *)-[BSSettings mutableCopy](v21->super._changes, "mutableCopy");
            v16 = (void *)objc_msgSend(v15, "copyWithKeys:", v4);

            objc_msgSend(v7, "setObject:forKey:", v16, v10);
          }
          else if ((objc_msgSend(v4, "containsObject:", v10) & 1) != 0)
          {
            v16 = 0;
          }
          else
          {
            if (!v7)
              v7 = (void *)-[BSSettings mutableCopy](v21->super._changes, "mutableCopy");
            objc_msgSend(v7, "setObject:forKey:", 0, v10);
            objc_msgSend(v7, "setFlag:forKey:", 0x7FFFFFFFFFFFFFFFLL, v10);
            v16 = 0;
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v17 = (BSSettings *)objc_msgSend(v7, "copy");
    if (!v17)
    {
      v17 = v21->super._changes;
      if (!v17)
      {
        if (v21->super._flagRemovals)
        {
          v17 = 0;
        }
        else
        {
          v17 = 0;
          v18 = 0;
          if (!v21->super._objectRemovals)
          {
LABEL_30:

            goto LABEL_31;
          }
        }
      }
    }
    v18 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)[BSKeyedSettingsDiff alloc], v17, v21->super._flagRemovals, v21->super._objectRemovals);
    -[BSSettingsDiff descriptionProvider](v21, "descriptionProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDescriptionProvider:", v19);

    goto LABEL_30;
  }
  v18 = 0;
LABEL_31:

  return v18;
}

- (id)copyWithSettings:(id)a3
{
  id v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id result;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSKeyedSettingsDiff *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot call -copyWithSettings: on a keyed diff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("BSSettingsDiff.m");
    v19 = 1024;
    v20 = 542;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  result = (id)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (unint64_t)_diffTypesForSetting:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int64_t v10;
  void *v11;
  _BOOL8 v12;
  _BOOL4 v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[BSSettings allKeys](self->super._changes, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "hash") == a3)
        {
          v10 = -[BSSettings flagForSetting:](self->super._changes, "flagForSetting:", a3);
          -[BSSettings objectForSetting:](self->super._changes, "objectForSetting:", a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10 != 0x7FFFFFFFFFFFFFFFLL;
          v13 = v11 == 0;

          if (v13)
            v6 |= v12;
          else
            v6 |= v12 | 2;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->super._flagRemovals;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v14);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "hash") == a3;
      }
      v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self->super._objectRemovals;
  v19 = -[NSSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v18);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * k), "hash", (_QWORD)v23) == a3)
          v6 |= 2uLL;
      }
      v19 = -[NSSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

  return v6;
}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BSKeyedSettingsDiff allKeys](self, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
      if (objc_msgSend(v9, "hash") == a3)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v9;

    if (v10)
      return v10;
  }
  else
  {
LABEL_9:

  }
  v12.receiver = self;
  v12.super_class = (Class)BSKeyedSettingsDiff;
  -[BSSettingsDiff _keyDescriptionForSetting:](&v12, sel__keyDescriptionForSetting_, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  return v10;
}

@end
