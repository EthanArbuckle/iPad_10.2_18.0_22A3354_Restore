@implementation _ANEAnalyticsGroup

- (_ANEAnalyticsGroup)initWithID:(id)a3 layers:(id)a4 tasks:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ANEAnalyticsGroup *v12;
  _ANEAnalyticsGroup *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ANEAnalyticsGroup;
  v12 = -[_ANEAnalyticsGroup init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupID, a3);
    objc_storeStrong((id *)&v13->_layerInfo, a4);
    objc_storeStrong((id *)&v13->_taskInfo, a5);
  }

  return v13;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _QWORD v30[2];
  void *v31;
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_ANEAnalyticsGroup groupID](self, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_ANEAnalyticsGroup layerInfo](self, "layerInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "serialize");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[_ANEAnalyticsGroup taskInfo](self, "taskInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "serialize");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v14);
  }

  v30[1] = v12;
  v31 = v5;
  v29[0] = CFSTR("layers");
  v29[1] = CFSTR("tasks");
  v30[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (NSArray)layerInfo
{
  return self->_layerInfo;
}

- (NSArray)taskInfo
{
  return self->_taskInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_layerInfo, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

+ (id)objectWithID:(id)a3 layers:(id)a4 tasks:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithID:layers:tasks:", v8, v9, v10);

  return v11;
}

@end
