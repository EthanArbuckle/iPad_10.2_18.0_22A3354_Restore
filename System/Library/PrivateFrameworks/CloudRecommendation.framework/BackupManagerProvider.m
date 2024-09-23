@implementation BackupManagerProvider

- (BackupManagerProvider)initWithAccount:(id)a3
{
  id v4;
  BackupManagerProvider *v5;
  uint64_t v6;
  id v7;
  MBManager *backupManager;
  NSObject *v9;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BackupManagerProvider;
  v5 = -[BackupManagerProvider init](&v12, sel_init);
  if (v5)
  {
    v11 = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE66C40]), "initWithAccount:delegate:eventQueue:error:", v4, 0, 0, &v11);
    v7 = v11;
    backupManager = v5->_backupManager;
    v5->_backupManager = (MBManager *)v6;

    if (v7)
    {
      _CELogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BackupManagerProvider initWithAccount:].cold.1((uint64_t)v7, v9);

    }
  }

  return v5;
}

- (NSString)backupDeviceUUID
{
  return (NSString *)-[MBManager backupDeviceUDID](self->_backupManager, "backupDeviceUDID");
}

- (void)setBackupDeviceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MBManager)backupManager
{
  return self->_backupManager;
}

- (void)setBackupManager:(id)a3
{
  objc_storeStrong((id *)&self->_backupManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManager, 0);
  objc_storeStrong((id *)&self->_backupDeviceUUID, 0);
}

- (void)initWithAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[BackupManagerProvider initWithAccount:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2380DF000, a2, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)&v2, 0x16u);
}

@end
