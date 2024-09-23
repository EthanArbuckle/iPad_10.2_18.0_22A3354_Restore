@implementation CAFTestAccEventWithParamsControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestAccEventWithParamsControl;
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
  v6.super_class = (Class)CAFTestAccEventWithParamsControl;
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
  v6.super_class = (Class)CAFTestAccEventWithParamsControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)_didNotifyWithValue:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a3;
  -[CAFTestAccEventWithParamsControl handler](self, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("testInput9"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
      v6 = (unint64_t)v5;
    else
      v6 = 0;

    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("testInput10"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
      v8 = (unint64_t)v7;
    else
      v8 = 0;

    if (v6 | v8)
    {
      -[CAFTestAccEventWithParamsControl handler](self, "handler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, objc_msgSend((id)v6, "unsignedCharValue"), v8);

    }
  }

}

+ (id)controlIdentifier
{
  return CFSTR("0x00000000FF000033");
}

+ (id)observerProtocol
{
  return &unk_25682D078;
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
