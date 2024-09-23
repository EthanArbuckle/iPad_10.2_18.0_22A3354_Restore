@implementation XRSpaceBlockOp

- (XRSpaceBlockOp)initWithSpaceBlock:(id)a3
{
  id v4;
  XRSpaceBlockOp *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XRSpaceBlockOp;
  v5 = -[XRSpaceBlockOp init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x227696724](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)main
{
  id block;

  (*((void (**)(void))self->_block + 2))();
  block = self->_block;
  self->_block = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
