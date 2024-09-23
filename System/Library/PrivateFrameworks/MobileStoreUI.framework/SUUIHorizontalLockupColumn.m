@implementation SUUIHorizontalLockupColumn

- (SUUIHorizontalLockupColumn)init
{
  SUUIHorizontalLockupColumn *v2;
  NSMutableArray *v3;
  NSMutableArray *childViewElements;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIHorizontalLockupColumn;
  v2 = -[SUUIHorizontalLockupColumn init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    childViewElements = v2->_childViewElements;
    v2->_childViewElements = v3;

  }
  return v2;
}

- (void)_addChildViewElement:(id)a3
{
  -[NSMutableArray addObject:](self->_childViewElements, "addObject:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t identifier;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalLockupColumn;
  -[SUUIHorizontalLockupColumn description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  NSStringFromCGSize(self->_size);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%ld, %@, %@]"), v4, identifier, v6, self->_childViewElements);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)childViewElements
{
  return &self->_childViewElements->super;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewElements, 0);
}

@end
