@implementation MKUSBEndpoint

- (MKUSBEndpoint)initWithValue:(id)a3
{
  id v4;
  MKUSBEndpoint *v5;
  MKUSBEndpoint *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKUSBEndpoint;
  v5 = -[MKUSBEndpoint init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MKUSBEndpoint setValue:](v5, "setValue:", v4);

  return v6;
}

- (NSThread)thread
{
  return self->_thread;
}

- (void)setThread:(id)a3
{
  objc_storeStrong((id *)&self->_thread, a3);
}

- (NSValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

@end
