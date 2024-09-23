@implementation AVEventManagerBlockAction

- (AVEventManagerBlockAction)initWithBlock:(id)a3 event:(id)a4
{
  id v6;
  AVEventManagerBlockAction *v7;
  uint64_t v8;
  id block;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVEventManagerBlockAction;
  v7 = -[AVEventManagerAction initWithEvent:](&v11, sel_initWithEvent_, a4);
  if (v7)
  {
    v8 = MEMORY[0x1AF43E9B8](v6);
    block = v7->_block;
    v7->_block = (id)v8;

  }
  return v7;
}

- (void)sendAction:(id)a3
{
  (*((void (**)(void))self->_block + 2))();
}

- (BOOL)isEqual:(id)a3
{
  AVEventManagerBlockAction *v4;
  id *v5;
  BOOL v6;
  objc_super v8;

  v4 = (AVEventManagerBlockAction *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8.receiver = self;
      v8.super_class = (Class)AVEventManagerBlockAction;
      if (-[AVEventManagerAction isEqual:](&v8, sel_isEqual_, v5))
        v6 = self->_block == v5[2];
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_msgSend(self->_block, "hash");
  v5.receiver = self;
  v5.super_class = (Class)AVEventManagerBlockAction;
  return -[AVEventManagerBlockAction hash](&v5, sel_hash) & v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
