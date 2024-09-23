@implementation FIMutableTimeSliceGroup

- (FIMutableTimeSliceGroup)initWithTimeSlices:(id)a3
{
  id v5;
  FIMutableTimeSliceGroup *v6;
  FIMutableTimeSliceGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIMutableTimeSliceGroup;
  v6 = -[FIMutableTimeSliceGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_slices, a3);

  return v7;
}

+ (id)timeSliceGroupForQuantityTypes:(id)a3 startDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  FIMutableTimeSliceGroup *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  objc_msgSend(a3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__FIMutableTimeSliceGroup_timeSliceGroupForQuantityTypes_startDate___block_invoke;
  v11[3] = &unk_24CC4EA08;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "fi_mapUsingBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FIMutableTimeSliceGroup initWithTimeSlices:]([FIMutableTimeSliceGroup alloc], "initWithTimeSlices:", v8);
  return v9;
}

FIQuantityTimeSlice *__68__FIMutableTimeSliceGroup_timeSliceGroupForQuantityTypes_startDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FIQuantityTimeSlice *v4;

  v3 = a2;
  v4 = -[FIQuantityTimeSlice initWithQuantityType:startDate:]([FIQuantityTimeSlice alloc], "initWithQuantityType:startDate:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)commitAllSlicesToDate:(id)a3
{
  id v4;
  NSArray *slices;
  id v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__FIMutableTimeSliceGroup_commitAllSlicesToDate___block_invoke;
  v9[3] = &unk_24CC4EA30;
  v10 = v4;
  v6 = v4;
  -[NSArray fi_mapUsingBlock:](slices, "fi_mapUsingBlock:", v9);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_slices;
  self->_slices = v7;

}

uint64_t __49__FIMutableTimeSliceGroup_commitAllSlicesToDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "committingUntilDate:", *(_QWORD *)(a1 + 32));
}

- (void)updateSlicesWithEndDate:(id)a3
{
  id v4;
  NSArray *slices;
  id v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__FIMutableTimeSliceGroup_updateSlicesWithEndDate___block_invoke;
  v9[3] = &unk_24CC4EA30;
  v10 = v4;
  v6 = v4;
  -[NSArray fi_mapUsingBlock:](slices, "fi_mapUsingBlock:", v9);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_slices;
  self->_slices = v7;

}

uint64_t __51__FIMutableTimeSliceGroup_updateSlicesWithEndDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "settingEndDate:", *(_QWORD *)(a1 + 32));
}

- (void)updateSlicesWithSample:(id)a3
{
  id v4;
  NSArray *slices;
  id v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__FIMutableTimeSliceGroup_updateSlicesWithSample___block_invoke;
  v9[3] = &unk_24CC4EA30;
  v10 = v4;
  v6 = v4;
  -[NSArray fi_mapUsingBlock:](slices, "fi_mapUsingBlock:", v9);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_slices;
  self->_slices = v7;

}

id __50__FIMutableTimeSliceGroup_updateSlicesWithSample___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = *(id *)(a1 + 32);
    v8 = v3;
    v13 = 0;
    objc_msgSend(v8, "addingSample:error:", v7, &v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v10)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x24BDD3078];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v15 = v7;
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v10;
        _os_log_error_impl(&dword_21168F000, v11, OS_LOG_TYPE_ERROR, "Adding sample %@ to quantity slice %@ caused error: %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v9 = v3;
  }

  return v9;
}

- (BOOL)allSlicesFinalized
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_slices;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "finalized", (_QWORD)v9))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)slices
{
  return self->_slices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slices, 0);
}

@end
