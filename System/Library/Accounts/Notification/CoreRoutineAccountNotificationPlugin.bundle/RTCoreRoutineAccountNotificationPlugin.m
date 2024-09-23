@implementation RTCoreRoutineAccountNotificationPlugin

- (RTCoreRoutineAccountNotificationPlugin)init
{
  RTCoreRoutineAccountNotificationPlugin *v2;
  uint64_t v3;
  RTRoutineManager *routineManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTCoreRoutineAccountNotificationPlugin;
  v2 = -[RTCoreRoutineAccountNotificationPlugin init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE27ED0], "defaultManager");
    v3 = objc_claimAutoreleasedReturnValue();
    routineManager = v2->_routineManager;
    v2->_routineManager = (RTRoutineManager *)v3;

  }
  return v2;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v9 = objc_msgSend(a3, "coreRoutineDataclassEnabled");
  v10 = objc_msgSend(v8, "coreRoutineDataclassEnabled");

  if ((_DWORD)v9 != v10)
  {
    sub_230F01754(qword_255EABA80);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_230F00000, v11, OS_LOG_TYPE_INFO, "Setting the routine cloud sync auth state, %d", (uint8_t *)v12, 8u);
    }

    -[RTRoutineManager updateCloudSyncProvisionedForAccount:handler:](self->_routineManager, "updateCloudSyncProvisionedForAccount:handler:", v9, &unk_24FFAA718);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end
