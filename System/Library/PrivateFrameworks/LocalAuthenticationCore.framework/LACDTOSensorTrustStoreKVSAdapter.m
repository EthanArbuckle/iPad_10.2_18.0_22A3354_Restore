@implementation LACDTOSensorTrustStoreKVSAdapter

- (LACDTOSensorTrustStoreKVSAdapter)initWithKVStore:(id)a3
{
  id v5;
  LACDTOSensorTrustStoreKVSAdapter *v6;
  LACDTOSensorTrustStoreKVSAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOSensorTrustStoreKVSAdapter;
  v6 = -[LACDTOSensorTrustStoreKVSAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_kvStore, a3);

  return v7;
}

- (void)storeSensorTrustState:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  LACDTOKVStoreValue *v8;

  v6 = a4;
  if ((objc_msgSend(a3, "isDisapproved") & 1) != 0)
  {
    v8 = -[LACDTOKVStoreValue initWithBoolValue:]([LACDTOKVStoreValue alloc], "initWithBoolValue:", 0);
    -[LACDTOKVStoreWriter setValue:forKey:completion:](self->_kvStore, "setValue:forKey:completion:", v8, 6, v6);

  }
  else
  {
    LACLogDTOSensor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[LACDTOSensorTrustStoreKVSAdapter storeSensorTrustState:completion:].cold.1(v7);

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvStore, 0);
}

- (void)storeSensorTrustState:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2409DC000, log, OS_LOG_TYPE_DEBUG, "Skipping trust state update because trust can only be regained in SEP", v1, 2u);
}

@end
