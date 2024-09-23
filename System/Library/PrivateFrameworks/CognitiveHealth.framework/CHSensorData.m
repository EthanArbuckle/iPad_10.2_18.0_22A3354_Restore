@implementation CHSensorData

- (CHSensorData)init
{
  CHSensorData *v2;
  CHSensorDataClient *v3;
  CHSensorDataProtocol *xpcClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHSensorData;
  v2 = -[CHSensorData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CHSensorDataClient);
    xpcClient = v2->_xpcClient;
    v2->_xpcClient = (CHSensorDataProtocol *)v3;

  }
  return v2;
}

- (void)aggregatedMotionAndAppLaunchDataFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  ch_sensor_data_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_238250000, v11, OS_LOG_TYPE_DEFAULT, "CHSensorData aggregatedMotionAndAppLaunchData api called", v12, 2u);
  }

  -[CHSensorDataProtocol aggregatedMotionAndAppLaunchDataFromDate:toDate:completion:](self->_xpcClient, "aggregatedMotionAndAppLaunchDataFromDate:toDate:completion:", v10, v9, v8);
}

- (void)embeddingVectorForBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  ch_sensor_data_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_238250000, v8, OS_LOG_TYPE_DEFAULT, "CHSensorData embeddingVectorForBundleId api called", v9, 2u);
  }

  -[CHSensorDataProtocol embeddingVectorForBundleId:completion:](self->_xpcClient, "embeddingVectorForBundleId:completion:", v7, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

@end
