@implementation FACacheImageMarqueeOperationWrapper

- (FACacheImageMarqueeOperationWrapper)initWithFamilyCircle:(id)a3
{
  id v4;
  FACacheImageMarqueeOperationWrapper *v5;
  FACacheImageMarqueeOperation *v6;
  FACacheImageMarqueeOperation *cacheImageOperation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FACacheImageMarqueeOperationWrapper;
  v5 = -[FACacheImageMarqueeOperationWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = -[FACacheImageMarqueeOperation initWithFamilyCircle:]([FACacheImageMarqueeOperation alloc], "initWithFamilyCircle:", v4);
    cacheImageOperation = v5->_cacheImageOperation;
    v5->_cacheImageOperation = v6;

  }
  return v5;
}

- (void)createAndCacheData
{
  NSObject *v3;
  uint8_t v4[16];

  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "FACacheImageMarqueeOperationWrapper createAndCacheData", v4, 2u);
  }

  -[FACacheImageMarqueeOperation createAndCacheData](self->_cacheImageOperation, "createAndCacheData");
}

- (void)generateMarqueeWith:(unint64_t)a3
{
  const __CFString *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3 < 3 || a3 == 1000)
    v5 = CFSTR("Return-Valid-Cache-Else-Load");
  else
    v5 = CFSTR("unknown");
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "FACacheImageMarqueeOperationWrapper createAndCacheData with cachePolicy %@", (uint8_t *)&v7, 0xCu);
  }

  -[FACacheImageMarqueeOperation generateMarqueeWith:](self->_cacheImageOperation, "generateMarqueeWith:", a3);
}

- (FACacheImageMarqueeOperation)cacheImageOperation
{
  return self->_cacheImageOperation;
}

- (void)setCacheImageOperation:(id)a3
{
  objc_storeStrong((id *)&self->_cacheImageOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheImageOperation, 0);
}

@end
