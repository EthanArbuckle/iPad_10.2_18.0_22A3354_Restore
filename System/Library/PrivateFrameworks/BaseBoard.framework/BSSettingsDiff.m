@implementation BSSettingsDiff

- (unint64_t)_diffTypesForSetting:(unint64_t)a3
{
  BSSettings *changes;
  NSSet *flagRemovals;
  void *v7;
  unint64_t v8;
  BSSettings *v9;
  void *v10;
  int v11;
  NSSet *objectRemovals;
  void *v13;

  changes = self->_changes;
  v8 = 1;
  if (!changes || -[BSSettings flagForSetting:](changes, "flagForSetting:", a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    flagRemovals = self->_flagRemovals;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(flagRemovals) = -[NSSet containsObject:](flagRemovals, "containsObject:", v7);

    if (!(_DWORD)flagRemovals)
      v8 = 0;
  }
  v9 = self->_changes;
  if (v9
    && (-[BSSettings objectForSetting:](self->_changes, "objectForSetting:", a3),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = 1;
  }
  else
  {
    objectRemovals = self->_objectRemovals;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSSet containsObject:](objectRemovals, "containsObject:", v13);

    if (!v9)
      goto LABEL_12;
    v10 = 0;
  }

LABEL_12:
  if (v11)
    return v8 | 2;
  else
    return v8;
}

void __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForSetting:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_msgSend(v11, "isEqual:", v5) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[BSSettingsDiff diffFromSettings:toSettings:](BSSettingsDiff, "diffFromSettings:toSettings:", v5, v11);
      v6 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v6;
    }
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      v8 = objc_opt_new();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v7, "setObject:forSetting:", v11, a2);
  }

}

void __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = (void *)a1[4];
  if (!v5
    || (objc_msgSend(v5, "objectForSetting:", a2),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[BSSettingsDiff diffFromSettings:toSettings:](BSSettingsDiff, "diffFromSettings:toSettings:", v17, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      if (!v8)
      {
        v9 = objc_opt_new();
        v10 = *(_QWORD *)(a1[5] + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      }
      objc_msgSend(v8, "setObject:forSetting:", v7, a2);

    }
    v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v12)
    {
      v13 = objc_opt_new();
      v14 = *(_QWORD *)(a1[6] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);

  }
}

uint64_t __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = *(void **)(a1 + 32);
  if (!v6 || (result = objc_msgSend(v6, "flagForSetting:", a2), result != a3))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v8)
    {
      v9 = objc_opt_new();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    return objc_msgSend(v8, "setFlag:forSetting:", a3, a2);
  }
  return result;
}

void __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  if (!v4 || objc_msgSend(v4, "flagForSetting:", a2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      v6 = objc_opt_new();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:");

  }
}

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isKeyedSettings") & 1) != 0 || objc_msgSend(v7, "isKeyedSettings"))
  {
    +[BSKeyedSettingsDiff diffFromSettings:toSettings:](BSKeyedSettingsDiff, "diffFromSettings:toSettings:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__7;
    v49 = __Block_byref_object_dispose__7;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__7;
    v43 = __Block_byref_object_dispose__7;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__7;
    v37 = __Block_byref_object_dispose__7;
    v38 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke;
    v30[3] = &unk_1E1EBFB88;
    v10 = v6;
    v31 = v10;
    v32 = &v45;
    objc_msgSend(v7, "enumerateFlagsWithBlock:", v30);
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_2;
    v27[3] = &unk_1E1EBFBB0;
    v11 = v10;
    v28 = v11;
    v29 = &v45;
    objc_msgSend(v7, "enumerateObjectsWithBlock:", v27);
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_3;
    v24[3] = &unk_1E1EBFBD8;
    v12 = v7;
    v25 = v12;
    v26 = &v39;
    -[BSSettings _enumerateSettingsForFlagsWithBlock:]((uint64_t)v11, v24);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_4;
    v20[3] = &unk_1E1EBFC00;
    v13 = v12;
    v21 = v13;
    v22 = &v45;
    v23 = &v33;
    objc_msgSend(v11, "enumerateObjectsWithBlock:", v20);
    if (!BSSettingsIsEmpty((void *)v46[5])
      || objc_msgSend((id)v40[5], "count")
      || objc_msgSend((id)v34[5], "count"))
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

      objc_msgSend((id)v46[5], "setDescriptionProvider:", v17);
      v18 = (id *)objc_alloc((Class)a1);
      v8 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:](v18, (void *)v46[5], (void *)v40[5], (void *)v34[5]);
      objc_msgSend(v8, "setDescriptionProvider:", v17);

    }
    else
    {
      v8 = 0;
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
  }

  return v8;
}

- (id)_initWithChanges:(void *)a3 flagRemovals:(void *)a4 objectRemovals:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BSSettingsDiff;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)isEmpty
{
  int IsEmpty;

  IsEmpty = BSSettingsIsEmpty(self->_changes);
  if (IsEmpty)
  {
    if (-[NSSet count](self->_flagRemovals, "count"))
      LOBYTE(IsEmpty) = 0;
    else
      LOBYTE(IsEmpty) = -[NSSet count](self->_objectRemovals, "count") == 0;
  }
  return IsEmpty;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionProvider);
  objc_storeStrong((id *)&self->_objectRemovals, 0);
  objc_storeStrong((id *)&self->_flagRemovals, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_changes, CFSTR("_changes"));
  objc_msgSend(v4, "encodeCollection:forKey:", self->_flagRemovals, CFSTR("_flagRemovals"));
  objc_msgSend(v4, "encodeCollection:forKey:", self->_objectRemovals, CFSTR("_objectRemovals"));

}

- (BSSettingsDiff)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BSSettingsDiff *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_msgSend((id)objc_opt_class(), "_removalClass"), CFSTR("_flagRemovals"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_msgSend((id)objc_opt_class(), "_removalClass"), CFSTR("_objectRemovals"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (BSSettingsDiff *)-[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)&self->super.isa, v5, v7, v9);

  return v10;
}

+ (Class)_removalClass
{
  return (Class)objc_opt_class();
}

- (void)setDescriptionProvider:(id)a3
{
  objc_storeWeak((id *)&self->_descriptionProvider, a3);
}

- (void)applyToSettings:(id)a3
{
  id v4;
  NSSet *flagRemovals;
  uint64_t v6;
  id v7;
  NSSet *objectRemovals;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "applySettings:", self->_changes);
  flagRemovals = self->_flagRemovals;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__BSSettingsDiff_applyToSettings___block_invoke;
  v12[3] = &unk_1E1EBFC28;
  v7 = v4;
  v13 = v7;
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, flagRemovals, v12);
  objectRemovals = self->_objectRemovals;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __34__BSSettingsDiff_applyToSettings___block_invoke_2;
  v10[3] = &unk_1E1EBFC28;
  v9 = v7;
  v11 = v9;
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, objectRemovals, v10);

}

- (id)allSettings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  -[BSSettings allSettings](self->_changes, "allSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__BSSettingsDiff_allSettings__block_invoke;
  v12[3] = &unk_1E1EBFC28;
  v8 = v7;
  v13 = v8;
  v9 = (void *)MEMORY[0x18D769CFC](v12);
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, self->_flagRemovals, v9);
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, self->_objectRemovals, v9);
  v10 = v8;

  return v10;
}

- (void)_enumerateSettingsInSet:(void *)a3 withBlock:
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v5 = a3;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
  if (a1 && v5)
  {
    v18 = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v13;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        if (v18)
          break;
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          ((void (**)(_QWORD, uint64_t, char *))v6)[2](v6, objc_msgSend(v11, "unsignedIntegerValue"), &v18);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__enumerateSettingsInSet_withBlock_, a1, CFSTR("BSSettingsDiff.m"), 256, CFSTR("Unexpected type found in the hashtable."));

        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v8)
            goto LABEL_5;
          break;
        }
      }
    }

  }
}

- (void)inspectChangesWithBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[BSSettingsDiff allSettings](self, "allSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__BSSettingsDiff_inspectChangesWithBlock___block_invoke;
    v6[3] = &unk_1E1EBFC50;
    v6[4] = self;
    v7 = v5;
    objc_msgSend(v4, "enumerateWithBlock:", v6);

  }
}

uint64_t __42__BSSettingsDiff_inspectChangesWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, objc_msgSend(*(id *)(a1 + 32), "_diffTypesForSetting:", a2));
}

uint64_t __29__BSSettingsDiff_allSettings__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:", a2);
}

uint64_t __34__BSSettingsDiff_applyToSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forSetting:", 0, a2);
}

- (BSSettingsDiff)init
{
  return (BSSettingsDiff *)-[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)&self->super.isa, 0, 0, 0);
}

- (BSSettingsDiff)initWithXPCDictionary:(id)a3
{
  void *v4;
  BSSettingsDiff *v5;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSSettingsDiff initWithBSXPCCoder:](self, "initWithBSXPCCoder:", v4);

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSSettingsDiff encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_changes, CFSTR("changes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_flagRemovals, CFSTR("flagRemovals"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectRemovals, CFSTR("objectRemovals"));

}

- (BSSettingsDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BSSettingsDiff *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_msgSend((id)objc_opt_class(), "_removalClass"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("flagRemovals"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("objectRemovals"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (BSSettingsDiff *)-[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)&self->super.isa, v5, v9, v10);

  return v11;
}

uint64_t __34__BSSettingsDiff_applyToSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFlag:forSetting:", 0x7FFFFFFFFFFFFFFFLL, a2);
}

- (id)copyWithSettings:(id)a3
{
  id v4;
  void *v5;
  BSSettings *v6;
  id *v7;
  id WeakRetained;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__7;
    v17 = __Block_byref_object_dispose__7;
    v18 = 0;
    -[BSSettings allSettings](self->_changes, "allSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35__BSSettingsDiff_copyWithSettings___block_invoke;
    v10[3] = &unk_1E1EBFC78;
    v10[4] = self;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v5, "enumerateWithBlock:", v10);

    v6 = (BSSettings *)objc_msgSend((id)v14[5], "copy");
    if (!v6)
    {
      v6 = self->_changes;
      if (!v6)
      {
        if (self->_flagRemovals)
        {
          v6 = 0;
        }
        else
        {
          v6 = 0;
          v7 = 0;
          if (!self->_objectRemovals)
          {
LABEL_9:

            _Block_object_dispose(&v13, 8);
            goto LABEL_10;
          }
        }
      }
    }
    v7 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)[BSSettingsDiff alloc], v6, self->_flagRemovals, self->_objectRemovals);
    WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionProvider);
    objc_msgSend(v7, "setDescriptionProvider:", WeakRetained);

    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

void __35__BSSettingsDiff_copyWithSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForSetting:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    v17 = objc_msgSend(v8, "copyWithSettings:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forSetting:", v17, a2);
    v12 = (void *)v17;
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "containsValue:", a2) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v13)
    {
      v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v13, "setObject:forSetting:", 0, a2);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setFlag:forSetting:", 0x7FFFFFFFFFFFFFFFLL, a2);
    v12 = 0;
  }

}

- (id)copyWithKeys:(id)a3
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
  BSSettingsDiff *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot call -copyWithKeys: on a non-keyed diff"));
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
    v20 = 241;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  result = (id)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (BOOL)_isKeyed
{
  return 0;
}

- (unint64_t)_diffTypesForKey:(id)a3
{
  return 0;
}

- (BOOL)settingChangedForKey:(id)a3
{
  return -[BSSettingsDiff settingChangedForKey:type:](self, "settingChangedForKey:type:", a3, 0);
}

- (BOOL)settingChangedForKey:(id)a3 type:(unint64_t *)a4
{
  unint64_t v5;

  v5 = -[BSSettingsDiff _diffTypesForKey:](self, "_diffTypesForKey:", a3);
  if (a4)
    *a4 = v5;
  return v5 != 0;
}

- (NSString)description
{
  return (NSString *)-[BSSettingsDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSSettingsDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  BSSettingsDiff *v15;
  id v16;
  SEL v17;

  v5 = a3;
  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSSettingsDiff allSettings](self, "allSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke;
    v13[3] = &unk_1E1EBFCC8;
    v14 = v7;
    v15 = self;
    v8 = v6;
    v16 = v8;
    v17 = a2;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v13);
    v9 = v16;
    v10 = v8;

  }
  else
  {
    v11 = (id)objc_msgSend(v6, "appendObject:withName:", CFSTR("(empty)"), 0);
  }

  return v6;
}

void __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v5[3] = &unk_1E1EBFCA0;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateWithBlock:", v5);

}

void __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  if (v5)
  {
    v6 = objc_msgSend(v5, "flagForSetting:", a2);
    v4 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v4 + 8);
    if (v7)
    {
      objc_msgSend(v7, "objectForSetting:", a2);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "settings:keyDescriptionForSetting:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "_keyDescriptionForSetting:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(WeakRetained, "keyDescriptionForSetting:", a2);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if (!v9)
    goto LABEL_12;
LABEL_13:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "settings:valueDescriptionForFlag:object:ofSetting:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v6, v25, a2);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_20;
    objc_msgSend(WeakRetained, "valueDescriptionForFlag:object:ofSetting:", v6, v25, a2);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  if (!v11)
  {
LABEL_20:
    v13 = objc_msgSend(*(id *)(a1 + 32), "_diffTypesForSetting:", a2);
    v14 = (unint64_t)v25;
    if (!v25)
      v14 = (unint64_t)CFSTR("(removed)") & (v13 << 62 >> 63);
    v25 = (id)v14;
    if ((~(_BYTE)v13 & 3) != 0)
    {
      if ((v13 & 1) == 0)
      {
        if ((v13 & 2) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid diff type for %@"), v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v21 = (id)objc_claimAutoreleasedReturnValue();
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v27 = v21;
            v28 = 2114;
            v29 = v23;
            v30 = 2048;
            v31 = v24;
            v32 = 2114;
            v33 = CFSTR("BSSettingsDiff.m");
            v34 = 1024;
            v35 = 374;
            v36 = 2114;
            v37 = v20;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
          __break(0);
          JUMPOUT(0x18A202CF4);
        }
        +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v14, *(_QWORD *)(a1 + 40), v10);
        goto LABEL_29;
      }
      BSSettingFlagDescription(v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v19, *(_QWORD *)(a1 + 40), v10);
    }
    else
    {
      BSSettingFlagDescription(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [flag]"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v15, v16, v17);

      v18 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [obj]"), v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v25, v18, v19);
    }

LABEL_29:
    v12 = 0;
    goto LABEL_30;
  }
  +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", v11, *(_QWORD *)(a1 + 40), v10);
LABEL_30:

}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lu)"), a3);
}

- (id)succinctDescription
{
  return -[BSSettingsDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescriptionBuilder
{
  return -[BSSettingsDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", 0);
}

- (BSSettingDescriptionProvider)descriptionProvider
{
  return (BSSettingDescriptionProvider *)objc_loadWeakRetained((id *)&self->_descriptionProvider);
}

@end
