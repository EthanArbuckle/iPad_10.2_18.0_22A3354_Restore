@implementation MMCSRequestorContext

- (MMCSRequestorContext)initWithEngine:(id)a3 type:(int)a4
{
  id v6;
  MMCSRequestorContext *v7;
  MMCSRequestorContext *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MMCSRequestorContext;
  v7 = -[MMCSRequestorContext init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_engine, v6);
    v8->_type = a4;
  }

  return v8;
}

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  free(self->_itemIDs);
  free(self->_itemFlags);
  free(self->_signatures);
  if (self->_count)
  {
    v3 = 0;
    do
      free(self->_authTokens[v3++]);
    while (v3 < self->_count);
  }
  free(self->_authTokens);
  v4.receiver = self;
  v4.super_class = (Class)MMCSRequestorContext;
  -[MMCSRequestorContext dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (MMCSEngine)engine
{
  return (MMCSEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (char)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(char *)a3
{
  self->_signatures = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)itemIDs
{
  return self->_itemIDs;
}

- (void)setItemIDs:(unint64_t *)a3
{
  self->_itemIDs = a3;
}

- (unsigned)itemFlags
{
  return self->_itemFlags;
}

- (void)setItemFlags:(unsigned int *)a3
{
  self->_itemFlags = a3;
}

- (char)authTokens
{
  return self->_authTokens;
}

- (void)setAuthTokens:(char *)a3
{
  self->_authTokens = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
}

+ (id)contextWithEngine:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v5;
  MMCSRequestorContext *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[MMCSRequestorContext initWithEngine:type:]([MMCSRequestorContext alloc], "initWithEngine:type:", v5, v4);

  return v6;
}

@end
