@implementation CAFTestAccRequestWithReqParamsControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccRequestWithReqParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestWithReqParamsControl;
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
  v6.super_class = (Class)CAFTestAccRequestWithReqParamsControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[CAFTestAccRequestWithReqParamsControl handler](self, "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testInput1"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = (unint64_t)v9;
    else
      v10 = 0;

    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testInput2"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0)
      v12 = (unint64_t)v11;
    else
      v12 = 0;

    if (v10 | v12)
    {
      -[CAFTestAccRequestWithReqParamsControl handler](self, "handler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend((id)v10, "unsignedCharValue");
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __71__CAFTestAccRequestWithReqParamsControl__didRequestWithValue_response___block_invoke;
      v17[3] = &unk_2508FE2C0;
      v18 = v7;
      ((void (**)(_QWORD, uint64_t, unint64_t, _QWORD *))v13)[2](v13, v14, v12, v17);

    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

    }
  }

  return v8 != 0;
}

void __71__CAFTestAccRequestWithReqParamsControl__didRequestWithValue_response___block_invoke(uint64_t a1, void *a2)
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
  return CFSTR("0x00000000FF00002F");
}

+ (id)observerProtocol
{
  return &unk_25682FE50;
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
