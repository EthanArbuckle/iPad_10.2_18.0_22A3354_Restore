@implementation HUIdentifierAndBlockPair

- (HUIdentifierAndBlockPair)initWithIdentifier:(id)a3 andBlock:(id)a4
{
  id v6;
  id v7;
  HUIdentifierAndBlockPair *v8;
  HUIdentifierAndBlockPair *v9;
  uint64_t v10;
  id block;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUIdentifierAndBlockPair;
  v8 = -[HUIdentifierAndBlockPair init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_identifier = v6;
    v10 = objc_msgSend(v7, "copy");
    block = v9->_block;
    v9->_block = (id)v10;

  }
  return v9;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = a3;
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
