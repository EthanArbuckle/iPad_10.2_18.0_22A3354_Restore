@implementation EQKitSelection

- (EQKitSelection)initWithBox:(id)a3
{
  EQKitSelection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitSelection;
  result = -[EQKitSelection init](&v5, sel_init);
  if (result)
    result->_box = (EQKitBox *)a3;
  return result;
}

- (EQKitSelection)initWithInspectable:(id)a3
{
  EQKitSelection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EQKitSelection;
  v4 = -[EQKitSelection init](&v6, sel_init);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_box = (EQKitBox *)objc_msgSend(a3, "box");
  }
  return v4;
}

- (id)inspectables
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_box)
    return (id)MEMORY[0x24BDBD1A8];
  v3[0] = -[_EQKitInspectableBox initWithBox:]([_EQKitInspectableBox alloc], "initWithBox:", self->_box);
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)containsBox:(id)a3
{
  return self->_box == a3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[EQKitBox isEqual:](-[EQKitSelection box](self, "box"), "isEqual:", objc_msgSend(a3, "box"));
}

- (EQKitBox)box
{
  return self->_box;
}

@end
