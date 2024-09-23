@implementation MTRChannelClusterChannelPagingStruct

- (MTRChannelClusterChannelPagingStruct)init
{
  MTRChannelClusterChannelPagingStruct *v2;
  MTRChannelClusterChannelPagingStruct *v3;
  MTRChannelClusterPageTokenStruct *previousToken;
  MTRChannelClusterPageTokenStruct *nextToken;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRChannelClusterChannelPagingStruct;
  v2 = -[MTRChannelClusterChannelPagingStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    previousToken = v2->_previousToken;
    v2->_previousToken = 0;

    nextToken = v3->_nextToken;
    v3->_nextToken = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterChannelPagingStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRChannelClusterChannelPagingStruct);
  objc_msgSend_previousToken(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousToken_(v4, v8, (uint64_t)v7);

  objc_msgSend_nextToken(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNextToken_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: previousToken:%@; nextToken:%@; >"),
    v5,
    self->_previousToken,
    self->_nextToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRChannelClusterPageTokenStruct)previousToken
{
  return self->_previousToken;
}

- (void)setPreviousToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTRChannelClusterPageTokenStruct)nextToken
{
  return self->_nextToken;
}

- (void)setNextToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextToken, 0);
  objc_storeStrong((id *)&self->_previousToken, 0);
}

@end
