@implementation ICCoreDataCoreSpotlightDelegate

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4 indexingPriority:(unint64_t)a5
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  result = -[NSCoreDataCoreSpotlightDelegate initForStoreWithDescription:coordinator:](&v7, sel_initForStoreWithDescription_coordinator_, a3, a4);
  if (result)
    *((_QWORD *)result + 16) = a5;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[ICCoreDataCoreSpotlightDelegate stopSpotlightIndexing](self, "stopSpotlightIndexing");
  v3.receiver = self;
  v3.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  -[NSCoreDataCoreSpotlightDelegate dealloc](&v3, sel_dealloc);
}

- (void)startSpotlightIndexing
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  -[NSCoreDataCoreSpotlightDelegate startSpotlightIndexing](&v2, sel_startSpotlightIndexing);
}

- (void)stopSpotlightIndexing
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  -[NSCoreDataCoreSpotlightDelegate stopSpotlightIndexing](&v2, sel_stopSpotlightIndexing);
}

- (BOOL)shouldIndexableObjectExistInIndexing:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isDeleted") & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isHiddenFromSearch") ^ 1;

  return v4;
}

- (id)attributeSetForObject:(id)a3
{
  id v4;
  os_log_t v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F04165D0))
  {
    v5 = (os_log_t)v4;
    v6 = -[ICCoreDataCoreSpotlightDelegate shouldIndexableObjectExistInIndexing:](self, "shouldIndexableObjectExistInIndexing:", v5);
    v7 = os_log_create("com.apple.notes", "SearchIndexer");
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
        -[ICCoreDataCoreSpotlightDelegate attributeSetForObject:].cold.1(v5);

      -[NSObject searchableItemAttributeSet](v5, "searchableItemAttributeSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject searchIndexingIdentifier](v5, "searchIndexingIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUniqueIdentifier:", v10);

      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setExpirationDate:", v11);

      -[NSObject searchDomainIdentifier](v5, "searchDomainIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDomainIdentifier:", v12);

      -[NSObject dataSourceIdentifier](v5, "dataSourceIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIc_dataSourceIdentifier:", v7);
    }
    else
    {
      if (v8)
        -[ICCoreDataCoreSpotlightDelegate attributeSetForObject:].cold.2(v5);

      v9 = 0;
    }

  }
  else
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICCoreDataCoreSpotlightDelegate attributeSetForObject:].cold.3(v5);
    v9 = 0;
  }

  return v9;
}

- (unint64_t)indexingPriority
{
  return self->_indexingPriority;
}

- (void)setIndexingPriority:(unint64_t)a3
{
  self->_indexingPriority = a3;
}

- (BOOL)isCheckingObjectConsistency
{
  return self->_isCheckingObjectConsistency;
}

- (void)setIsCheckingObjectConsistency:(BOOL)a3
{
  self->_isCheckingObjectConsistency = a3;
}

- (BOOL)shouldPerformConsistencyCheck
{
  return self->_shouldPerformConsistencyCheck;
}

- (void)attributeSetForObject:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "searchIndexingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v2, v3, "-attributeSetForObject: need to index ICSearchIndexable: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_13();
}

- (void)attributeSetForObject:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "searchIndexingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v2, v3, "-attributeSetForObject: NO need to index ICSearchIndexable: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_13();
}

- (void)attributeSetForObject:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DDAA5000, log, OS_LOG_TYPE_DEBUG, "-attributeSetForObject: called with a non-ICSearchIndexable object", v1, 2u);
}

@end
