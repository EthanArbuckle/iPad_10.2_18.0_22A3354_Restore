@implementation ARTechniqueSequentialGatherContext

- (ARTechniqueSequentialGatherContext)initWithParentContext:(id)a3
{
  ARTechniqueSequentialGatherContext *v3;
  uint64_t v4;
  NSMutableArray *gatheredData;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARTechniqueSequentialGatherContext;
  v3 = -[ARTechniqueGatherContext initWithParentContext:](&v7, sel_initWithParentContext_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    gatheredData = v3->_gatheredData;
    v3->_gatheredData = (NSMutableArray *)v4;

  }
  return v3;
}

- (id)gatheredData
{
  return self->_gatheredData;
}

- (void)addResultData:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_gatheredData, "addObjectsFromArray:", a3);
}

- (void)mergeResultsOfContext:(id)a3 resultFilterBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "gatheredData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__ARTechniqueSequentialGatherContext_mergeResultsOfContext_resultFilterBlock___block_invoke;
  v10[3] = &unk_1E6674E50;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "ar_filter:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARTechniqueSequentialGatherContext addResultData:](self, "addResultData:", v9);
}

uint64_t __78__ARTechniqueSequentialGatherContext_mergeResultsOfContext_resultFilterBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARTechniqueSequentialGatherContext)initWithCoder:(id)a3
{
  id v4;
  ARTechniqueSequentialGatherContext *v5;
  uint64_t v6;
  NSMutableArray *gatheredData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueSequentialGatherContext;
  v5 = -[ARTechniqueGatherContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("gatheredData"));
    v6 = objc_claimAutoreleasedReturnValue();
    gatheredData = v5->_gatheredData;
    v5->_gatheredData = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  ARTechniqueSequentialGatherContext *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARTechniqueSequentialGatherContext *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ARTechniqueSequentialGatherContext;
  -[ARTechniqueGatherContext encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  v5 = self->_gatheredData;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_opt_new();
    v7 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = self;
    v8 = self->_gatheredData;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EF0889C8))
            v14 = (void *)v6;
          else
            v14 = v7;
          objc_msgSend(v14, "addObject:", v13);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      if (_ARLogDaemon_onceToken != -1)
        dispatch_once(&_ARLogDaemon_onceToken, &__block_literal_global_78);
      v15 = (void *)_ARLogDaemon_logObj;
      if (os_log_type_enabled((os_log_t)_ARLogDaemon_logObj, OS_LOG_TYPE_DEBUG))
      {
        v16 = v15;
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v18;
        v27 = 2048;
        v28 = v19;
        v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: got insecure contexts to encode for daemon connection: %@", buf, 0x20u);

      }
    }

    v5 = (NSMutableArray *)v6;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("gatheredData"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatheredData, 0);
}

@end
