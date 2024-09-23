@implementation MTRChannelClusterPageTokenStruct

- (MTRChannelClusterPageTokenStruct)init
{
  MTRChannelClusterPageTokenStruct *v2;
  MTRChannelClusterPageTokenStruct *v3;
  NSNumber *limit;
  NSString *after;
  NSString *before;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRChannelClusterPageTokenStruct;
  v2 = -[MTRChannelClusterPageTokenStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    limit = v2->_limit;
    v2->_limit = 0;

    after = v3->_after;
    v3->_after = 0;

    before = v3->_before;
    v3->_before = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterPageTokenStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTRChannelClusterPageTokenStruct);
  objc_msgSend_limit(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLimit_(v4, v8, (uint64_t)v7);

  objc_msgSend_after(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAfter_(v4, v12, (uint64_t)v11);

  objc_msgSend_before(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBefore_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: limit:%@; after:%@; before:%@; >"),
    v5,
    self->_limit,
    self->_after,
    self->_before);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)after
{
  return self->_after;
}

- (void)setAfter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)before
{
  return self->_before;
}

- (void)setBefore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_before, 0);
  objc_storeStrong((id *)&self->_after, 0);
  objc_storeStrong((id *)&self->_limit, 0);
}

@end
