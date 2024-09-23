@implementation AMSLRUCacheItem

- (AMSLRUCacheItem)initWithKey:(id)a3 object:(id)a4
{
  id v6;
  AMSLRUCacheItem *v7;
  uint64_t v8;
  NSCopying *key;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSLRUCacheItem;
  v7 = -[AMSDoubleLinkedListNode initWithObject:](&v11, sel_initWithObject_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copyWithZone:", 0);
    key = v7->_key;
    v7->_key = (NSCopying *)v8;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSCopying)key
{
  return self->_key;
}

@end
