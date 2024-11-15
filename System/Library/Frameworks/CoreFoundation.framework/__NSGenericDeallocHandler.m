@implementation __NSGenericDeallocHandler

- (unint64_t)retainCount
{
  return 1;
}

- (void)release
{
  void (**block)(id, SEL);

  block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    _Block_release(self->_block);
    self->_block = 0;
    object_dispose(self);
  }
  else
  {
    __break(1u);
  }
}

- (void)finalize
{
  void (**block)(id, SEL);

  block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    _Block_release(self->_block);
    self->_block = 0;
  }
  else
  {
    __break(1u);
  }
}

@end
