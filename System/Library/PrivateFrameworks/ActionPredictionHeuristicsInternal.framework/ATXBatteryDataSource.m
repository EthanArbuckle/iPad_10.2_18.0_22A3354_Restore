@implementation ATXBatteryDataSource

- (ATXBatteryDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXBatteryDataSource *v6;
  ATXBatteryDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXBatteryDataSource;
  v6 = -[ATXBatteryDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)batteryInformationWithCallback:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, void *))a3;
  IOPSCopyPowerSourcesByTypePrecise();
  __atxlog_handle_heuristic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXBatteryDataSource batteryInformationWithCallback:].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)batteryInformationWithCallback:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C99DF000, a1, a3, "ATXBatteryDataSource: Failed to obtain power sources list", a5, a6, a7, a8, 0);
}

- (void)batteryInformationWithCallback:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C99DF000, a1, a3, "ATXBatteryDataSource: Failed to obtain power sources info", a5, a6, a7, a8, 0);
}

@end
