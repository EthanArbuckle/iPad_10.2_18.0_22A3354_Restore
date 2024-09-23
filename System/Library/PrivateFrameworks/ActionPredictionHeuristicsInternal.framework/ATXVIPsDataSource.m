@implementation ATXVIPsDataSource

- (ATXVIPsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXVIPsDataSource *v6;
  ATXVIPsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXVIPsDataSource;
  v6 = -[ATXVIPsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)vipsWithCallback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5590) & 1) != 0)
  {
    v20 = v3;
    v4 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "allVIPs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
          v12 = (void *)objc_opt_new();
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("identifier"));

          objc_msgSend(v11, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("name"));

          objc_msgSend(v11, "displayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("displayName"));

          objc_msgSend(v11, "emailAddresses");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("emailAddresses"));

          objc_msgSend(v4, "addObject:", v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

    v3 = v20;
    (*((void (**)(id, void *, _QWORD))v20 + 2))(v20, v4, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
