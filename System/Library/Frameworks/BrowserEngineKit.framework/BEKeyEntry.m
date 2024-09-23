@implementation BEKeyEntry

- (id)_initWithUIKitKeyEvent:(id)a3
{
  id v5;
  BEKeyEntry *v6;
  id *p_isa;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BEKeyEntry;
  v6 = -[BEKeyEntry init](&v15, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingKeyEvent, a3);
    v8 = objc_alloc_init(MEMORY[0x24BEBD6B0]);
    v9 = p_isa[2];
    p_isa[2] = v8;

    objc_msgSend(p_isa[2], "_setKeyCode:", objc_msgSend(v5, "keyCode"));
    v10 = p_isa[2];
    objc_msgSend(v5, "characters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setModifiedInput:", v11);

    v12 = p_isa[2];
    objc_msgSend(v5, "charactersIgnoringModifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setUnmodifiedInput:", v13);

    objc_msgSend(p_isa[2], "_setModifierFlags:", objc_msgSend(v5, "modifierFlags"));
  }

  return p_isa;
}

- (UIKey)key
{
  return self->_backingUIKey;
}

- (int64_t)type
{
  return -[UIKeyEvent type](self->_backingKeyEvent, "type");
}

- (int64_t)state
{
  return -[UIKeyEvent type](self->_backingKeyEvent, "type");
}

- (id)_uikitKeyEvent
{
  return self->_backingKeyEvent;
}

- (BOOL)isKeyRepeating
{
  return -[UIKeyEvent isKeyRepeating](self->_backingKeyEvent, "isKeyRepeating");
}

- (double)timestamp
{
  double result;

  -[UIKeyEvent timestamp](self->_backingKeyEvent, "timestamp");
  return result;
}

- (UIKeyEvent)backingKeyEvent
{
  return self->_backingKeyEvent;
}

- (UIKey)backingUIKey
{
  return self->_backingUIKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingUIKey, 0);
  objc_storeStrong((id *)&self->_backingKeyEvent, 0);
}

@end
