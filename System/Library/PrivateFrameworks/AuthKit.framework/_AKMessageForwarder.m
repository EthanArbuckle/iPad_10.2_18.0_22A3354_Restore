@implementation _AKMessageForwarder

- (_AKMessageForwarder)initWithReceiver:(id)a3 strong:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _AKMessageForwarder *v8;
  _AKMessageForwarder *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_AKMessageForwarder;
  v8 = -[_AKMessageForwarder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v4)
      objc_storeStrong(&v8->_strongReceiver, a3);
    else
      objc_storeWeak(&v8->_weakReceiver, v7);
  }

  return v9;
}

- (_AKMessageForwarder)initWithWeakReceiver:(id)a3
{
  return -[_AKMessageForwarder initWithReceiver:strong:](self, "initWithReceiver:strong:", a3, 0);
}

- (_AKMessageForwarder)initWithStrongReceiver:(id)a3
{
  return -[_AKMessageForwarder initWithReceiver:strong:](self, "initWithReceiver:strong:", a3, 1);
}

- (void)activate
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldHandleInvalidation:", 1);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[_AKMessageForwarder activate](self, "activate", a3);
  WeakRetained = objc_loadWeakRetained(&self->_weakReceiver);
  v5 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self->_strongReceiver;
  v6 = WeakRetained;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongReceiver, 0);
  objc_destroyWeak(&self->_weakReceiver);
}

@end
