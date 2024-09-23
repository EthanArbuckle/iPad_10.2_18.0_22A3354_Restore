@implementation MSNCarPlay

- (MSNCarPlay)init
{
  MSNCarPlay *v2;
  uint64_t v3;
  MXSystemController *systemController;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  MSNCarPlay *v9;
  NSObject *v10;
  _BOOL4 carplayConnected;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  _BOOL4 v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MSNCarPlay;
  v2 = -[MSNCarPlay init](&v14, sel_init);
  if (!v2)
  {
LABEL_13:
    v9 = v2;
    goto LABEL_14;
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D48568]), "initWithPID:", getpid());
  systemController = v2->_systemController;
  v2->_systemController = (MXSystemController *)v3;

  if (!v2->_systemController)
  {
    MSNLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MSNCarPlay init].cold.1(v5);
    goto LABEL_9;
  }
  v17[0] = *MEMORY[0x1E0D49FD0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D8258BF0](-[MXSystemController setAttributeForKey:andValue:](v2->_systemController, "setAttributeForKey:andValue:", *MEMORY[0x1E0D4A060], v5));
  v6 = CMNotificationCenterAddListener();
  if (!v6)
  {
    v13 = 0;
    -[MXSystemController copyAttributeForKey:withValueOut:](v2->_systemController, "copyAttributeForKey:withValueOut:", *MEMORY[0x1E0D4A050], &v13);
    v2->_carplayConnected = objc_msgSend(v13, "BOOLValue");
    MSNLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      carplayConnected = v2->_carplayConnected;
      *(_DWORD *)buf = 67109120;
      v16 = carplayConnected;
      _os_log_impl(&dword_1D416F000, v10, OS_LOG_TYPE_INFO, "Registered for CarPlay status changes with initial state: %{BOOL}d.", buf, 8u);
    }

    goto LABEL_13;
  }
  v7 = v6;
  MSNLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MSNCarPlay init].cold.2(v7, v8);

LABEL_9:
  v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)carplayConnected
{
  NSObject *v3;
  _BOOL4 carplayConnected;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    carplayConnected = self->_carplayConnected;
    v6[0] = 67109120;
    v6[1] = carplayConnected;
    _os_log_impl(&dword_1D416F000, v3, OS_LOG_TYPE_INFO, "CarPlay connected: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  return self->_carplayConnected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemController, 0);
}

- (void)init
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D416F000, a2, OS_LOG_TYPE_ERROR, "CMNotificationCenterAddListener error %i", (uint8_t *)v2, 8u);
}

@end
