@implementation ECLocalMessageActionResults

- (ECLocalMessageActionResults)initWithError:(id)a3
{
  id v5;
  ECLocalMessageActionResults *v6;
  ECLocalMessageActionResults *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECLocalMessageActionResults;
  v6 = -[ECLocalMessageActionResults init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
