@implementation UpdatingRectValue

- (UpdatingRectValue)initWithUpdateBlock:(id)a3
{
  id v4;
  UpdatingRectValue *v5;
  uint64_t v6;
  id updateBlock;
  UpdatingRectValue *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UpdatingRectValue;
  v5 = -[UpdatingRectValue init](&v10, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A0C7F8](v4);
    updateBlock = v5->_updateBlock;
    v5->_updateBlock = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (CGRect)CGRectValue
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  (*((void (**)(void))self->_updateBlock + 2))();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
}

@end
