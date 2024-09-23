@implementation JFXEffectAssetRequestOptions

- (JFXEffectAssetRequestOptions)init
{
  JFXEffectAssetRequestOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXEffectAssetRequestOptions;
  result = -[JFXEffectAssetRequestOptions init](&v3, sel_init);
  if (result)
    result->_priority = 2;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 24) = self->_priority;
  *(_BYTE *)(v4 + 8) = self->_networkAccessDisabled;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_filterOptionsArray, 1);
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  return (id)v4;
}

- (NSArray)filterOptionsArray
{
  return self->_filterOptionsArray;
}

- (void)setFilterOptionsArray:(id)a3
{
  objc_storeStrong((id *)&self->_filterOptionsArray, a3);
}

- (BOOL)isNetworkAccessDisabled
{
  return self->_networkAccessDisabled;
}

- (void)setNetworkAccessDisabled:(BOOL)a3
{
  self->_networkAccessDisabled = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterOptionsArray, 0);
}

@end
