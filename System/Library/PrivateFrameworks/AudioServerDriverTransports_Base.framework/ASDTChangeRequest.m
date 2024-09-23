@implementation ASDTChangeRequest

- (ASDTChangeRequest)initWithIndex:(unsigned int)a3 andBlock:(id)a4
{
  uint64_t v4;
  id v6;
  ASDTChangeRequest *v7;
  ASDTChangeRequest *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASDTChangeRequest;
  v7 = -[ASDTChangeRequest init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ASDTChangeRequest setIndex:](v7, "setIndex:", v4);
    -[ASDTChangeRequest setBlock:](v8, "setBlock:", v6);
  }

  return v8;
}

+ (id)withIndex:(unsigned int)a3 andBlock:(id)a4
{
  uint64_t v4;
  id v5;
  ASDTChangeRequest *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = -[ASDTChangeRequest initWithIndex:andBlock:]([ASDTChangeRequest alloc], "initWithIndex:andBlock:", v4, v5);

  return v6;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
