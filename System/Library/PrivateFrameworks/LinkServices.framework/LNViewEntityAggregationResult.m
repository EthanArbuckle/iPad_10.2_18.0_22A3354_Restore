@implementation LNViewEntityAggregationResult

- (LNViewEntityAggregationResult)init
{
  LNViewEntityAggregationResult *v2;
  LNViewEntityAggregationResult *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *entitiesByBundleId;
  NSMutableDictionary *v6;
  NSMutableDictionary *errors;
  LNViewEntityAggregationResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LNViewEntityAggregationResult;
  v2 = -[LNViewEntityAggregationResult init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entitiesByBundleId = v3->_entitiesByBundleId;
    v3->_entitiesByBundleId = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    errors = v3->_errors;
    v3->_errors = v6;

    v8 = v3;
  }

  return v3;
}

- (void)addResults:(id)a3 error:(id)a4 forBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__LNViewEntityAggregationResult_addResults_error_forBundle___block_invoke;
  aBlock[3] = &unk_1E45DDE18;
  aBlock[4] = self;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v8)
  {
    getLNLogCategoryView();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218242;
      v18 = v13;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1A18F6000, v12, OS_LOG_TYPE_INFO, "Successfully fetched %lu view entities from %@", buf, 0x16u);
    }
    v14 = 8;
    v15 = v8;
LABEL_9:

    objc_msgSend(*(id *)((char *)&self->super.isa + v14), "setValue:forKey:", v15, v10);
    goto LABEL_10;
  }
  if (v9)
  {
    getLNLogCategoryView();
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = (uint64_t)v10;
      v19 = 2112;
      v20 = v9;
      v14 = 16;
      _os_log_impl(&dword_1A18F6000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch view entities from %@: %@", buf, 0x16u);
    }
    v15 = v9;
    goto LABEL_9;
  }
LABEL_10:
  v11[2](v11);

}

- (NSDictionary)entities
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD aBlock[5];

  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__LNViewEntityAggregationResult_entities__block_invoke;
  aBlock[3] = &unk_1E45DDE18;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  v4 = (void *)-[NSMutableDictionary copy](self->_entitiesByBundleId, "copy");
  v3[2](v3);

  return (NSDictionary *)v4;
}

- (NSError)error
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__LNViewEntityAggregationResult_error__block_invoke;
  aBlock[3] = &unk_1E45DDE18;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[NSMutableDictionary count](self->_errors, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LNConnectionErrorDomain"), 1007, self->_errors);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)objc_msgSend(v4, "copy");

  v3[2](v3);
  return (NSError *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_entitiesByBundleId, 0);
}

void __38__LNViewEntityAggregationResult_error__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

void __41__LNViewEntityAggregationResult_entities__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

void __60__LNViewEntityAggregationResult_addResults_error_forBundle___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

@end
