@implementation CRKBlockCancelable

- (void)dealloc
{
  objc_super v3;

  -[CRKBlockCancelable cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKBlockCancelable;
  -[CRKBlockCancelable dealloc](&v3, sel_dealloc);
}

- (CRKBlockCancelable)initWithBlock:(id)a3
{
  id v4;
  CRKBlockCancelable *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKBlockCancelable;
  v5 = -[CRKBlockCancelable init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

+ (id)cancelableWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return v5;
}

- (void)cancel
{
  void *v3;
  id v4;

  -[CRKBlockCancelable block](self, "block");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKBlockCancelable setBlock:](self, "setBlock:", 0);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
