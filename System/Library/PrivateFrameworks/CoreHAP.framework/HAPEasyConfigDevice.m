@implementation HAPEasyConfigDevice

- (HAPEasyConfigDevice)initWithDeviceInfo:(id)a3 server:(id)a4
{
  id v7;
  id v8;
  HAPEasyConfigDevice *v9;
  HAPEasyConfigDevice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPEasyConfigDevice;
  v9 = -[EasyConfigDevice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)((char *)&v9->super.super.isa + (int)*MEMORY[0x1E0D1DB40]), a3);
    objc_storeWeak((id *)&v10->_server, v8);
  }

  return v10;
}

- (HAPAccessoryServerIP)server
{
  return (HAPAccessoryServerIP *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
}

@end
