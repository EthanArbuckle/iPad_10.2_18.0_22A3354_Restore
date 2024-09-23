@implementation MPSGraphRegion

- (MPSGraphRegion)init
{
  MPSGraphRegion *v2;
  uint64_t v3;
  NSMutableArray *blocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPSGraphRegion;
  v2 = -[MPSGraphRegion init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_claimAutoreleasedReturnValue();
  blocks = v2->_blocks;
  v2->_blocks = (NSMutableArray *)v3;

  return v2;
}

- (id)appendNewBlock
{
  id *v3;
  id *WeakRetained;
  id *v5;

  v3 = (id *)objc_opt_new();
  objc_storeWeak(v3 + 4, self);
  -[NSMutableArray addObject:](self->_blocks, "addObject:", v3);
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parentOp);
  v5 = (id *)objc_loadWeakRetained(WeakRetained + 1);
  objc_storeStrong(v5 + 22, v3);

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentOp);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
