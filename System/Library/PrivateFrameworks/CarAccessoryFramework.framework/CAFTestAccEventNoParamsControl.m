@implementation CAFTestAccEventNoParamsControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccEventNoParamsControl;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824918))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestAccEventNoParamsControl;
  -[CAFControl registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824918))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestAccEventNoParamsControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)_didNotifyWithValue:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[CAFTestAccEventNoParamsControl handler](self, "handler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAFTestAccEventNoParamsControl handler](self, "handler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

+ (id)controlIdentifier
{
  return CFSTR("0x00000000FF000032");
}

+ (id)observerProtocol
{
  return &unk_256831298;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
