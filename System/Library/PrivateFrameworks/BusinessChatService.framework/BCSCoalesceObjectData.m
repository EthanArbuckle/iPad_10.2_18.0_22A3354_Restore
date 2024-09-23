@implementation BCSCoalesceObjectData

- (BCSCoalesceObjectData)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4
{
  id v6;
  id v7;
  BCSCoalesceObjectData *v8;
  uint64_t v9;
  id dataCompletionBlock;
  uint64_t v11;
  NSString *coalesceKey;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSCoalesceObjectData;
  v8 = -[BCSCoalesceObjectData init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dataCompletionBlock = v8->_dataCompletionBlock;
    v8->_dataCompletionBlock = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    coalesceKey = v8->_coalesceKey;
    v8->_coalesceKey = (NSString *)v11;

  }
  return v8;
}

- (NSString)coalesceKey
{
  return self->_coalesceKey;
}

- (id)dataCompletionBlock
{
  return self->_dataCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataCompletionBlock, 0);
  objc_storeStrong((id *)&self->_coalesceKey, 0);
}

@end
