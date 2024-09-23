@implementation FSAgentClientDelegate

- (void)instanceExited:(id)a3 instanceUUID:(id)a4
{
  id v6;
  FSAgentClientDelegate *v7;
  void (**instanceDeathHandler)(id, id, id);
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  instanceDeathHandler = (void (**)(id, id, id))v7->_instanceDeathHandler;
  if (instanceDeathHandler)
    instanceDeathHandler[2](instanceDeathHandler, v9, v6);
  objc_sync_exit(v7);

}

- (id)instanceDeathHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setInstanceDeathHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_instanceDeathHandler, 0);
}

@end
