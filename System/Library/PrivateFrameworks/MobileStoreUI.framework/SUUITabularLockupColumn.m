@implementation SUUITabularLockupColumn

- (SUUITabularLockupColumn)initWithColumnIdentifier:(int64_t)a3
{
  SUUITabularLockupColumn *v4;
  NSMutableArray *v5;
  NSMutableArray *childViewElements;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUITabularLockupColumn;
  v4 = -[SUUITabularLockupColumn init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    childViewElements = v4->_childViewElements;
    v4->_childViewElements = v5;

    v4->_identifier = a3;
  }
  return v4;
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
  v9.super_class = (Class)SUUITabularLockupColumn;
  -[SUUITabularLockupColumn description](&v9, sel_description);
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
