@implementation KVIncrementalDatasetStream

- (unint64_t)priorVersion
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_donation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_priorVersion(v4, v5, v6, v7);

  return v8;
}

- (BOOL)addOrUpdateCascadeItem:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char updated;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  objc_msgSend_donation(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  updated = objc_msgSend_addOrUpdateItem_error_(v10, v11, (uint64_t)v6, (uint64_t)&v17);

  v13 = v17;
  if ((updated & 1) == 0)
  {
    sub_1B70E8948(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4 && v14)
      *a4 = objc_retainAutorelease(v14);

  }
  return updated;
}

- (BOOL)addOrUpdateItem:(id)a3 error:(id *)a4
{
  const char *v6;
  void *v7;
  char updated;

  objc_msgSend__cascadeItemFromItem_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    updated = objc_msgSend_addOrUpdateCascadeItem_error_(self, v6, (uint64_t)v7, (uint64_t)a4);
  else
    updated = 0;

  return updated;
}

- (BOOL)removeItemWithItemId:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  objc_msgSend_donation(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = objc_msgSend_removeItemWithSourceItemIdentifier_error_(v10, v11, (uint64_t)v6, (uint64_t)&v17);

  v13 = v17;
  if ((v12 & 1) == 0)
  {
    sub_1B70E8948(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4 && v14)
      *a4 = objc_retainAutorelease(v14);

  }
  return v12;
}

@end
