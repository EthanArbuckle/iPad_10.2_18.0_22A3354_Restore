@implementation SCNPhysicsCustomField

- (void)dealloc
{
  id block;
  objc_super v4;

  block = self->_block;
  if (block)
  {
    _Block_release(block);
    self->_block = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsCustomField;
  -[SCNPhysicsField dealloc](&v4, sel_dealloc);
}

- (void)setBlock:(id)a3
{
  id block;
  void *v6;
  c3dPhysicsField *field;

  block = self->_block;
  if (block)
    _Block_release(block);
  self->_block = 0;
  if (a3)
  {
    v6 = _Block_copy(a3);
    self->_block = v6;
  }
  else
  {
    v6 = 0;
  }
  field = self->super._field;
  if (field)
    *(_QWORD *)&field[7].var5 = v6;
}

- (id)block
{
  return self->_block;
}

- (c3dPhysicsField)_createField
{
  c3dPhysicsFieldCustom *v3;
  id block;

  v3 = (c3dPhysicsFieldCustom *)operator new();
  c3dPhysicsFieldCustom::c3dPhysicsFieldCustom(v3);
  block = self->_block;
  if (block)
    *((_QWORD *)v3 + 30) = block;
  return (c3dPhysicsField *)v3;
}

@end
