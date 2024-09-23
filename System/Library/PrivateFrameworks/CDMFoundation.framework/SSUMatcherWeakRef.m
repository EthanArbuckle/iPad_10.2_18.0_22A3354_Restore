@implementation SSUMatcherWeakRef

- (SSUMatcherWeakRef)initWithMatcher:(id)a3
{
  id v3;
  SSUMatcherWeakRef *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUMatcherWeakRef;
  v3 = a3;
  v4 = -[SSUMatcherWeakRef init](&v6, sel_init);
  objc_storeWeak((id *)&v4->_matcher, v3);

  return v4;
}

- (SNLPSSUMatcher)matcher
{
  return (SNLPSSUMatcher *)objc_loadWeakRetained((id *)&self->_matcher);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_matcher);
}

@end
