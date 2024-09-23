@implementation CKDTransactionState

- (CKDTransactionState)init
{
  CKDTransactionState *v2;
  uint64_t v3;
  NSMutableDictionary *itemsByAssetId;
  uint64_t v5;
  NSMutableDictionary *itemsByAssetIdIgnoreRefSignature;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDTransactionState;
  v2 = -[CKDTransactionState init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    itemsByAssetId = v2->_itemsByAssetId;
    v2->_itemsByAssetId = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    itemsByAssetIdIgnoreRefSignature = v2->_itemsByAssetIdIgnoreRefSignature;
    v2->_itemsByAssetIdIgnoreRefSignature = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (CKDAssetBatch)assetBatch
{
  return self->_assetBatch;
}

- (void)setAssetBatch:(id)a3
{
  objc_storeStrong((id *)&self->_assetBatch, a3);
}

- (NSMutableDictionary)itemsByAssetId
{
  return self->_itemsByAssetId;
}

- (void)setItemsByAssetId:(id)a3
{
  objc_storeStrong((id *)&self->_itemsByAssetId, a3);
}

- (NSMutableDictionary)itemsByAssetIdIgnoreRefSignature
{
  return self->_itemsByAssetIdIgnoreRefSignature;
}

- (void)setItemsByAssetIdIgnoreRefSignature:(id)a3
{
  objc_storeStrong((id *)&self->_itemsByAssetIdIgnoreRefSignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByAssetIdIgnoreRefSignature, 0);
  objc_storeStrong((id *)&self->_itemsByAssetId, 0);
  objc_storeStrong((id *)&self->_assetBatch, 0);
}

@end
