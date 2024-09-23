@implementation CHCBluetoothConnectionQueryingWrapper

- (CHCBluetoothConnectionQueryingWrapper)initWithQuerying:(id)a3
{
  id v5;
  CHCBluetoothConnectionQueryingWrapper *v6;
  CHCBluetoothConnectionQueryingWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHCBluetoothConnectionQueryingWrapper;
  v6 = -[CHCBluetoothConnectionQueryingWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_querying, a3);

  return v7;
}

- (BOOL)isApplicationConnectedToAnyPeripherals:(id)a3
{
  CHCBluetoothConnectionQuerying *querying;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  querying = self->_querying;
  v12 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHCBluetoothConnectionQuerying isApplicationConnectedToAnyPeripherals:](querying, "isApplicationConnectedToAnyPeripherals:", v6, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
    v10 = objc_msgSend(v8, "BOOLValue");
  else
    v10 = 0;

  return v10;
}

- (CHCBluetoothConnectionQuerying)querying
{
  return self->_querying;
}

- (void)setQuerying:(id)a3
{
  objc_storeStrong((id *)&self->_querying, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querying, 0);
}

@end
