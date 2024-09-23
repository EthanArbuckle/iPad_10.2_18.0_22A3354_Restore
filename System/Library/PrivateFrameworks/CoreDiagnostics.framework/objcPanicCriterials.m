@implementation objcPanicCriterials

- (objcPanicCriterials)initWithCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _SwiftPanicCriterials *v14;
  _SwiftPanicCriterials *swiftPanicCriterials;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[_SwiftPanicCriterials initWithCriterials::::]([_SwiftPanicCriterials alloc], "initWithCriterials::::", v13, v12, v11, v10);

  swiftPanicCriterials = self->_swiftPanicCriterials;
  self->_swiftPanicCriterials = v14;

  return self;
}

- (objcPanicCriterials)initWithSwiftPanicCriterials:(id)a3
{
  id v5;
  objcPanicCriterials *v6;
  objcPanicCriterials *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)objcPanicCriterials;
  v6 = -[objcPanicCriterials init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_swiftPanicCriterials, a3);

  return v7;
}

- (id)getPanicCriterials
{
  return self->_swiftPanicCriterials;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftPanicCriterials, 0);
}

@end
