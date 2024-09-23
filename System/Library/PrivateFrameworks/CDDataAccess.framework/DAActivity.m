@implementation DAActivity

- (void)dealloc
{
  objc_super v3;

  -[DAAccount decrementXpcActivityContinueCount](self->_account, "decrementXpcActivityContinueCount");
  v3.receiver = self;
  v3.super_class = (Class)DAActivity;
  -[DAActivity dealloc](&v3, sel_dealloc);
}

- (DAActivity)initWithAccount:(id)a3
{
  id v5;
  DAActivity *v6;
  DAActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAActivity;
  v6 = -[DAActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    -[DAAccount incrementXpcActivityContinueCount](v7->_account, "incrementXpcActivityContinueCount");
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
