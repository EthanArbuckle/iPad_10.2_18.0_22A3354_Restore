@implementation BlockDeallocator

- (BlockDeallocator)initWithBlock:(id)a3
{
  BlockDeallocator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BlockDeallocator;
  v4 = -[BlockDeallocator init](&v6, sel_init);
  if (v4)
    v4->_block = _Block_copy(a3);
  return v4;
}

- (void)dealloc
{
  void (**block)(id, SEL);
  objc_super v4;

  block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    _Block_release(self->_block);
  }
  v4.receiver = self;
  v4.super_class = (Class)BlockDeallocator;
  -[BlockDeallocator dealloc](&v4, sel_dealloc);
}

@end
