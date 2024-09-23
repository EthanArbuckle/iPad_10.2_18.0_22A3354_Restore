@implementation CKDAssetTokenRequest

- (CKDAssetTokenRequest)init
{
  CKDAssetTokenRequest *v2;
  uint64_t v3;
  NSMutableArray *assetBatches;
  uint64_t v5;
  NSMutableSet *failedAssetBatches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDAssetTokenRequest;
  v2 = -[CKDAssetTokenRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    assetBatches = v2->_assetBatches;
    v2->_assetBatches = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    failedAssetBatches = v2->_failedAssetBatches;
    v2->_failedAssetBatches = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)addAssetBatch:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend_assetTokenRequest(v12, v4, v5);
  if (objc_claimAutoreleasedReturnValue())
    __assert_rtn("-[CKDAssetTokenRequest addAssetBatch:]", "CKDAssetTokenRequest.m", 35, "!assetBatch.assetTokenRequest");
  objc_msgSend_setAssetTokenRequest_(v12, v6, (uint64_t)self);
  objc_msgSend_addObject_(self->_assetBatches, v7, (uint64_t)v12);
  self->_sizeUpperBound += objc_msgSend_sizeUpperBound(v12, v8, v9);
  self->_size += objc_msgSend_size(v12, v10, v11);

}

- (void)addFailedBatch:(id)a3
{
  objc_msgSend_addObject_(self->_failedAssetBatches, a2, (uint64_t)a3);
}

- (unsigned)sizeUpperBound
{
  return self->_sizeUpperBound;
}

- (BOOL)hasSuccessfulBatches
{
  NSMutableArray *assetBatches;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  assetBatches = self->_assetBatches;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEA3DD14;
  v5[3] = &unk_1E782E9F0;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(assetBatches, a2, (uint64_t)v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)successfulBatches
{
  return (id)objc_msgSend_CKFilter_(self->_assetBatches, a2, (uint64_t)&unk_1E7830480);
}

- (BOOL)isEmpty
{
  uint64_t v2;

  return objc_msgSend_count(self->_assetBatches, a2, v2) == 0;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  unsigned int v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_assetBatches(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("assetBatchCount=%lu"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_failedAssetBatches(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v17, v18, v19);
  objc_msgSend_stringWithFormat_(v14, v21, (uint64_t)CFSTR("failedAssetBatchCount=%lu"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v23, (uint64_t)v22);

  v24 = (void *)MEMORY[0x1E0CB3940];
  v27 = objc_msgSend_sizeUpperBound(self, v25, v26);
  objc_msgSend_stringWithFormat_(v24, v28, (uint64_t)CFSTR("sizeUpperBound=%lu"), v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v30, (uint64_t)v29);

  objc_msgSend_componentsJoinedByString_(v3, v31, (uint64_t)CFSTR(", "));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetTokenRequest *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSMutableArray)assetBatches
{
  return self->_assetBatches;
}

- (void)setAssetBatches:(id)a3
{
  objc_storeStrong((id *)&self->_assetBatches, a3);
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  self->_size = a3;
}

- (void)setSizeUpperBound:(unsigned int)a3
{
  self->_sizeUpperBound = a3;
}

- (NSMutableSet)failedAssetBatches
{
  return self->_failedAssetBatches;
}

- (void)setFailedAssetBatches:(id)a3
{
  objc_storeStrong((id *)&self->_failedAssetBatches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedAssetBatches, 0);
  objc_storeStrong((id *)&self->_assetBatches, 0);
}

@end
