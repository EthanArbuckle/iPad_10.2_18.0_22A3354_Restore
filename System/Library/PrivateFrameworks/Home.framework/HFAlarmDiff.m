@implementation HFAlarmDiff

+ (id)generateAlarmDiffFromSet:(id)a3 toSet:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  char v25;
  char v26;
  id v28;
  void *v29;
  id obj;
  id v31;
  _QWORD aBlock[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = a4;
  if (objc_msgSend(MEMORY[0x1E0D4FA50], "hf_areAlarms:equalToAlarms:includeModificationDate:", v5))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setUnmodifiedAlarms:", v5);
  }
  else
  {
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    v29 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v28 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v14);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke;
          v37[3] = &unk_1EA7353A8;
          v37[4] = v15;
          objc_msgSend(v31, "na_firstObjectPassingTest:", v37);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v7;
          if (v16)
          {
            if (objc_msgSend(v16, "isEqualIgnoringLastModifiedDate:", v15))
              v17 = v9;
            else
              v17 = v8;
          }
          objc_msgSend(v17, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v12);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v31;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke_2;
          aBlock[3] = &unk_1EA7353A8;
          aBlock[4] = v22;
          v23 = _Block_copy(aBlock);
          v24 = objc_msgSend(v7, "na_any:", v23);
          v25 = objc_msgSend(v8, "na_any:", v23);
          v26 = objc_msgSend(v9, "na_any:", v23);
          if ((v24 & 1) == 0 && (v25 & 1) == 0 && (v26 & 1) == 0)
            objc_msgSend(v29, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v19);
    }

    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setAddedAlarms:", v7);
    objc_msgSend(v6, "setDeletedAlarms:", v29);
    objc_msgSend(v6, "setUpdatedAlarms:", v8);
    objc_msgSend(v6, "setUnmodifiedAlarms:", v9);

    v5 = v28;
  }

  return v6;
}

uint64_t __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __46__HFAlarmDiff_generateAlarmDiffFromSet_toSet___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)inputWasEqual
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[HFAlarmDiff addedAlarms](self, "addedAlarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[HFAlarmDiff deletedAlarms](self, "deletedAlarms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[HFAlarmDiff updatedAlarms](self, "updatedAlarms");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "count") == 0;

    }
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAlarmDiff addedAlarms](self, "addedAlarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v5, CFSTR("addedAlarms"), 1, 0);

  -[HFAlarmDiff deletedAlarms](self, "deletedAlarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v7, CFSTR("deletedAlarms"), 1, 0);

  -[HFAlarmDiff updatedAlarms](self, "updatedAlarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v9, CFSTR("updatedAlarms"), 1, 0);

  -[HFAlarmDiff unmodifiedAlarms](self, "unmodifiedAlarms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v11, CFSTR("unmodifiedAlarms"), 1, 0);

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSSet)updatedAlarms
{
  return self->_updatedAlarms;
}

- (void)setUpdatedAlarms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)addedAlarms
{
  return self->_addedAlarms;
}

- (void)setAddedAlarms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)deletedAlarms
{
  return self->_deletedAlarms;
}

- (void)setDeletedAlarms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)unmodifiedAlarms
{
  return self->_unmodifiedAlarms;
}

- (void)setUnmodifiedAlarms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmodifiedAlarms, 0);
  objc_storeStrong((id *)&self->_deletedAlarms, 0);
  objc_storeStrong((id *)&self->_addedAlarms, 0);
  objc_storeStrong((id *)&self->_updatedAlarms, 0);
}

@end
