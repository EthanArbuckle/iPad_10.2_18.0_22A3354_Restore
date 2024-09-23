@implementation AXMOutputRequestHandle

- (AXMOutputRequestHandle)init
{
  AXMOutputRequestHandle *v2;
  uint64_t v3;
  NSMutableArray *actionHandles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMOutputRequestHandle;
  v2 = -[AXMOutputRequestHandle init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    actionHandles = v2->_actionHandles;
    v2->_actionHandles = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addActionHandle:(id)a3
{
  -[NSMutableArray addObject:](self->_actionHandles, "addObject:", a3);
}

- (NSArray)actionHandles
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_actionHandles, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandles, 0);
}

@end
