@implementation CLSDarwinNotification

- (CLSDarwinNotification)initWithObserver:(id)a3 name:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLSDarwinNotification *v11;
  CLSDarwinNotification *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  id block;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CLSDarwinNotification;
  v11 = -[CLSDarwinNotification init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_observer, v8);
    v15 = objc_msgSend_copy(v9, v13, v14);
    name = v12->_name;
    v12->_name = (NSString *)v15;

    v17 = MEMORY[0x1D82575D0](v10);
    block = v12->_block;
    v12->_block = (id)v17;

  }
  return v12;
}

- (NSObject)observer
{
  return objc_loadWeakRetained((id *)&self->_observer);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
