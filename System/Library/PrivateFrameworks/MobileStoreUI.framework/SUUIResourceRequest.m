@implementation SUUIResourceRequest

- (SUUIResourceRequest)init
{
  SUUIResourceRequest *result;
  unsigned int v3;
  signed int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIResourceRequest;
  result = -[SUUIResourceRequest init](&v5, sel_init);
  if (result)
  {
    do
    {
      v3 = __ldxr((unsigned int *)&init_sRequestID);
      v4 = v3 + 1;
    }
    while (__stxr(v4, (unsigned int *)&init_sRequestID));
    result->_requestID = v4;
  }
  return result;
}

- (id)_initSUUIResourceRequest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIResourceRequest;
  return -[SUUIResourceRequest init](&v3, sel_init);
}

- (BOOL)cachesInMemory
{
  return 0;
}

- (id)newLoadOperation
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIResourceRequest;
  -[SUUIResourceRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%lu]"), v4, self->_requestID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  return self->_requestID;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = -[SUUIResourceRequest requestIdentifier](self, "requestIdentifier");
    v6 = v7 == objc_msgSend(v4, "requestIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initSUUIResourceRequest");
  objc_storeStrong((id *)(v4 + 8), self->_cacheKey);
  *(_QWORD *)(v4 + 16) = self->_requestID;
  return (id)v4;
}

- (id)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong(&self->_cacheKey, a3);
}

- (unint64_t)requestIdentifier
{
  return self->_requestID;
}

- (void)setRequestIdentifier:(unint64_t)a3
{
  self->_requestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cacheKey, 0);
}

@end
