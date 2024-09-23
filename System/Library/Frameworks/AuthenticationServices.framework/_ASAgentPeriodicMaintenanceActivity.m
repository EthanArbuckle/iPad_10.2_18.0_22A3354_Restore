@implementation _ASAgentPeriodicMaintenanceActivity

- (_ASAgentPeriodicMaintenanceActivity)init
{
  _ASAgentPeriodicMaintenanceActivity *v2;
  _ASAgentPeriodicMaintenanceActivity *v3;
  _ASAgentPeriodicMaintenanceActivity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ASAgentPeriodicMaintenanceActivity;
  v2 = -[_ASAgentPeriodicMaintenanceActivity init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_ASAgentPeriodicMaintenanceActivity _registerActivity](v2, "_registerActivity");
    v4 = v3;
  }

  return v3;
}

- (void)_registerActivity
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_INFO, "Periodic maintenance activity checking in.", buf, 2u);
  }
  v4 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __56___ASAgentPeriodicMaintenanceActivity__registerActivity__block_invoke;
  handler[3] = &unk_24C94FDC0;
  handler[4] = self;
  xpc_activity_register("com.apple.AuthenticationServicesCore.AuthenticationServicesAgent.PeriodicMaintenanceActivity", v4, handler);
}

- (void)_activityDidTransitionToRunState:(id)a3
{
  _xpc_activity_s *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _xpc_activity_s *v9;
  _QWORD v10[4];
  _xpc_activity_s *v11;
  id v12;
  uint8_t buf[16];

  v4 = (_xpc_activity_s *)a3;
  v5 = (void *)os_transaction_create();
  v6 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E4D9000, v6, OS_LOG_TYPE_INFO, "Periodic maintenance activity transitioned to state Run.", buf, 2u);
  }
  if (!xpc_activity_set_state(v4, 4))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_ASAgentPeriodicMaintenanceActivity _activityDidTransitionToRunState:].cold.1();
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72___ASAgentPeriodicMaintenanceActivity__activityDidTransitionToRunState___block_invoke;
  v10[3] = &unk_24C94FDE8;
  v11 = v4;
  v12 = v5;
  v8 = v5;
  v9 = v4;
  -[_ASAgentPeriodicMaintenanceActivity _runActivityWithCompletionHandler:](self, "_runActivityWithCompletionHandler:", v10);

}

- (void)_runActivityWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73___ASAgentPeriodicMaintenanceActivity__runActivityWithCompletionHandler___block_invoke;
  block[3] = &unk_24C94FE10;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void)_activityDidTransitionToRunState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Periodic maintenance activity failed to transition to state Continue. Continuing, but activity may be interrupted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
