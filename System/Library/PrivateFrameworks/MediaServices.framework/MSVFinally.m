@implementation MSVFinally

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (MSVFinally)initWithBlock:(id)a3
{
  id v4;
  MSVFinally *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSVFinally;
  v5 = -[MSVFinally init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  (*((void (**)(void))self->_block + 2))();
  v3.receiver = self;
  v3.super_class = (Class)MSVFinally;
  -[MSVFinally dealloc](&v3, sel_dealloc);
}

@end
