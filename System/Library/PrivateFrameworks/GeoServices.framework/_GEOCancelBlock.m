@implementation _GEOCancelBlock

- (void)cancel
{
  id block;
  void (**v4)(void);

  v4 = (void (**)(void))MEMORY[0x18D765024](self->_block, a2);
  block = self->_block;
  self->_block = 0;

  v4[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
