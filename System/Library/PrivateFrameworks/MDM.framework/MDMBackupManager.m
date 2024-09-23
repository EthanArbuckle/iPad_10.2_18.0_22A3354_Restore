@implementation MDMBackupManager

- (MDMBackupManager)init
{
  return -[MDMBackupManager initWithPersonaIdentifier:](self, "initWithPersonaIdentifier:", 0);
}

- (MDMBackupManager)initWithPersonaIdentifier:(id)a3
{
  id v5;
  MDMBackupManager *v6;
  MDMBackupManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  MBManager *manager;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MDMBackupManager;
  v6 = -[MDMBackupManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personaIdentifier, a3);
    v8 = dispatch_queue_create("com.apple.mdm.MDMBackupManager", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE66C40]), "initWithDelegate:eventQueue:personaIdentifier:", v7, v7->_queue, v5);
    manager = v7->_manager;
    v7->_manager = (MBManager *)v10;

  }
  return v7;
}

- (void)isCloudBackupInProgressWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MDMBackupManager manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__MDMBackupManager_isCloudBackupInProgressWithCompletion___block_invoke;
  v7[3] = &unk_24EB680F8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchiCloudRestoreIsCompleteWithCompletion:", v7);

}

uint64_t __58__MDMBackupManager_isCloudBackupInProgressWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (MBManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

@end
