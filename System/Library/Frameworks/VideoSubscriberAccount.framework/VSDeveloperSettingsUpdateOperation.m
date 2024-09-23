@implementation VSDeveloperSettingsUpdateOperation

- (VSDeveloperSettingsUpdateOperation)initWithSettings:(id)a3
{
  id v5;
  VSDeveloperSettingsUpdateOperation *v6;
  VSDeveloperSettingsUpdateOperation *v7;
  VSOptional *v8;
  VSOptional *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSDeveloperSettingsUpdateOperation;
  v6 = -[VSDeveloperSettingsUpdateOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = objc_alloc_init(VSOptional);
    v9 = v7->_result;
    v7->_result = v8;

  }
  return v7;
}

- (VSDeveloperSettingsUpdateOperation)init
{
  return -[VSDeveloperSettingsUpdateOperation initWithSettings:](self, "initWithSettings:", 0);
}

- (VSDeveloperServiceConnection)connection
{
  VSDeveloperSettingsUpdateOperation *v2;
  VSDeveloperServiceConnection *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_connection;
  if (!v3)
  {
    v3 = objc_alloc_init(VSDeveloperServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[VSDeveloperSettingsUpdateOperation settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Developer settings operation invoked with nil settings."));
  -[VSDeveloperSettingsUpdateOperation connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke;
  v8[3] = &unk_1E939ED90;
  v8[4] = self;
  objc_msgSend(v4, "serviceWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The settingsOrNil parameter must not be nil."));
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke_2;
  v7[3] = &unk_1E939EDB8;
  v7[4] = self;
  objc_msgSend(v6, "updateDeveloperSettings:completionHandler:", v3, v7);

}

uint64_t __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResult:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

uint64_t __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResult:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

- (VSDeveloperSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
