@implementation COBrowserObserver

- (COBrowserObserver)initWithBlock:(id)a3
{
  id v4;
  COBrowserObserver *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COBrowserObserver;
  v5 = -[COBrowserObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x2199F3D40](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
