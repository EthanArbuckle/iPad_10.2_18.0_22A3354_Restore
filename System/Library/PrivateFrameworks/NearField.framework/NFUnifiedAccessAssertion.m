@implementation NFUnifiedAccessAssertion

- (NFUnifiedAccessAssertion)initWithSESAssertion:(id)a3
{
  id v5;
  NFUnifiedAccessAssertion *v6;
  NFUnifiedAccessAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFUnifiedAccessAssertion;
  v6 = -[NFUnifiedAccessAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sesAssertion, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NFUnifiedAccessAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NFUnifiedAccessAssertion;
  -[NFUnifiedAccessAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)keyIdentifier
{
  return (NSString *)-[SESAssertion keyIdentifier](self->_sesAssertion, "keyIdentifier");
}

- (void)invalidate
{
  -[SESAssertion invalidate](self->_sesAssertion, "invalidate");
}

- (SESAssertion)sesAssertion
{
  return self->_sesAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sesAssertion, 0);
}

@end
