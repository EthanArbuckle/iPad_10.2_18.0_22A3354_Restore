@implementation CKSQLiteTableSearchEnumeratorSetupHelper

- (void)orderAscendingByProperty:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *orderByProperties;
  NSMutableArray *v7;
  NSMutableArray *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  orderByProperties = self->_orderByProperties;
  if (!orderByProperties)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_orderByProperties;
    self->_orderByProperties = v7;

    orderByProperties = self->_orderByProperties;
  }
  objc_msgSend_addObject_(orderByProperties, v4, MEMORY[0x1E0C9AAB0], v5);
  objc_msgSend_addObject_(self->_orderByProperties, v9, (uint64_t)v11, v10);

}

- (void)orderDescendingByProperty:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *orderByProperties;
  NSMutableArray *v7;
  NSMutableArray *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  orderByProperties = self->_orderByProperties;
  if (!orderByProperties)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_orderByProperties;
    self->_orderByProperties = v7;

    orderByProperties = self->_orderByProperties;
  }
  objc_msgSend_addObject_(orderByProperties, v4, MEMORY[0x1E0C9AAA0], v5);
  objc_msgSend_addObject_(self->_orderByProperties, v9, (uint64_t)v11, v10);

}

- (void)setupStatement:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v7 = objc_msgSend_count(self->_orderByProperties, v4, v5, v6);
  if (v7 >= 1)
  {
    v10 = v7;
    for (i = 0; i < v10; i += 2)
    {
      objc_msgSend_objectAtIndex_(self->_orderByProperties, v8, i, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);

      objc_msgSend_objectAtIndex_(self->_orderByProperties, v17, i + 1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orderByProperty_ascending_(v23, v20, (uint64_t)v19, v16);

    }
  }
  objc_msgSend_setLimit_(v23, v8, (uint64_t)self->_limit, v9);
  objc_msgSend_setOffset_(v23, v21, (uint64_t)self->_offset, v22);

}

- (NSArray)fetchedProperties
{
  return self->_fetchedProperties;
}

- (void)setFetchedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedProperties, a3);
}

- (NSArray)searchProperties
{
  return self->_searchProperties;
}

- (void)setSearchProperties:(id)a3
{
  objc_storeStrong((id *)&self->_searchProperties, a3);
}

- (NSPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (void)setSearchPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_searchPredicate, a3);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
  objc_storeStrong((id *)&self->_limit, a3);
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
  objc_storeStrong((id *)&self->_offset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_searchProperties, 0);
  objc_storeStrong((id *)&self->_fetchedProperties, 0);
  objc_storeStrong((id *)&self->_orderByProperties, 0);
}

@end
