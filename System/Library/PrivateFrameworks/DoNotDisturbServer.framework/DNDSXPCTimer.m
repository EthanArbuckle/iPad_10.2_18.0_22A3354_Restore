@implementation DNDSXPCTimer

- (DNDSXPCTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 userVisible:(BOOL)a5
{
  id v9;
  id v10;
  DNDSXPCTimer *v11;
  DNDSXPCTimer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSXPCTimer;
  v11 = -[DNDSXPCTimer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    objc_storeStrong((id *)&v12->_serviceIdentifier, a4);
    v12->_userVisible = a5;
  }

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isUserVisible
{
  return self->_userVisible;
}

- (void)setUserVisible:(BOOL)a3
{
  self->_userVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
