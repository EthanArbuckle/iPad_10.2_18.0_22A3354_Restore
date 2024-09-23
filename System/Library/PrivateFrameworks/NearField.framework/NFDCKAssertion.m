@implementation NFDCKAssertion

- (NFDCKAssertion)initWithSESAssertion:(id)a3
{
  id v5;
  NFDCKAssertion *v6;
  NFDCKAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFDCKAssertion;
  v6 = -[NFDCKAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sesAssertion, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NFDCKAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NFDCKAssertion;
  -[NFDCKAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)keyIdentifier
{
  return (NSString *)-[SESDCKAssertion keyIdentifier](self->_sesAssertion, "keyIdentifier");
}

- (void)invalidate
{
  -[SESDCKAssertion invalidate](self->_sesAssertion, "invalidate");
}

- (SESDCKAssertion)sesAssertion
{
  return self->_sesAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sesAssertion, 0);
}

@end
