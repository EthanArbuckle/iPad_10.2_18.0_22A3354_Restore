@implementation MKAPIServerDaemon

- (MKAPIServerDaemon)init
{
  MKAPIServerDaemon *v2;
  MKPowerAssertion *v3;
  MKPowerAssertion *power;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKAPIServerDaemon;
  v2 = -[MKAPIServer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MKPowerAssertion);
    power = v2->_power;
    v2->_power = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MKAPIServerDaemon setTransaction:](self, "setTransaction:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MKAPIServerDaemon;
  -[MKAPIServer dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  MKPowerAssertion *power;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKAPIServerDaemon;
  -[MKAPIServer cancel](&v4, sel_cancel);
  -[MKAPIServerDaemon setTransaction:](self, "setTransaction:", 0);
  power = self->_power;
  self->_power = 0;

}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_power, 0);
}

@end
