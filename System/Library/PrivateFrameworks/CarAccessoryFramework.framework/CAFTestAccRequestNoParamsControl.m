@implementation CAFTestAccRequestNoParamsControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccRequestNoParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestNoParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestNoParamsControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD v9[4];
  id v10;

  v5 = a4;
  -[CAFTestAccRequestNoParamsControl handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAFTestAccRequestNoParamsControl handler](self, "handler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__CAFTestAccRequestNoParamsControl__didRequestWithValue_response___block_invoke;
    v9[3] = &unk_2508FE2C0;
    v10 = v5;
    ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v9);

  }
  return v6 != 0;
}

void __66__CAFTestAccRequestNoParamsControl__didRequestWithValue_response___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

+ (id)controlIdentifier
{
  return CFSTR("0x00000000FF00002E");
}

+ (id)observerProtocol
{
  return &unk_25682DDB0;
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
