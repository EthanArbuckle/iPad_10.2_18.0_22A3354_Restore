@implementation ASDTIOServiceManagerDelegateProxy

+ (id)forDelegate:(id)a3 andIDValues:(id)a4
{
  id v5;
  id v6;
  ASDTIOServiceManagerDelegateProxy *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(ASDTIOServiceManagerDelegateProxy);
  -[ASDTIOServiceManagerDelegateProxy setDelegate:](v7, "setDelegate:", v6);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTIOServiceManagerDelegateProxy setIdValues:](v7, "setIdValues:", v8);
  return v7;
}

- (ASDTIOServiceManagerDelegate)delegate
{
  return (ASDTIOServiceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)idValues
{
  return self->_idValues;
}

- (void)setIdValues:(id)a3
{
  objc_storeStrong((id *)&self->_idValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idValues, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
