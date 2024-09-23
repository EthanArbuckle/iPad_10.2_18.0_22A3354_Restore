@implementation _COClusterRoleMonitorSnapshotObserver

- (id)initInCluster:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _COClusterRoleMonitorSnapshotObserver *v11;
  uint64_t v12;
  id cluster;
  uint64_t v14;
  id block;
  NSSet *lastValue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_COClusterRoleMonitorSnapshotObserver;
  v11 = -[_COClusterRoleMonitorSnapshotObserver init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    cluster = v11->_cluster;
    v11->_cluster = (id)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    v14 = objc_msgSend(v10, "copy");
    block = v11->_block;
    v11->_block = (id)v14;

    lastValue = v11->_lastValue;
    v11->_lastValue = 0;

  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_COClusterRoleMonitorSnapshotObserver cluster](self, "cluster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, cluster = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)notify:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[_COClusterRoleMonitorSnapshotObserver lastValue](self, "lastValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    COLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_COClusterRoleMonitorSnapshotObserver notify:].cold.1();
    goto LABEL_10;
  }
  -[_COClusterRoleMonitorSnapshotObserver lastValue](self, "lastValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToSet:", v6);

  COLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) == 0)
  {
    if (v9)
      -[_COClusterRoleMonitorSnapshotObserver notify:].cold.3();
LABEL_10:

    -[_COClusterRoleMonitorSnapshotObserver setLastValue:](self, "setLastValue:", v4);
    -[_COClusterRoleMonitorSnapshotObserver queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __48___COClusterRoleMonitorSnapshotObserver_notify___block_invoke;
    v11[3] = &unk_24CD3EF20;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v10, v11);

    goto LABEL_11;
  }
  if (v9)
    -[_COClusterRoleMonitorSnapshotObserver notify:].cold.2();

LABEL_11:
}

- (id)cluster
{
  return self->_cluster;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

- (NSSet)lastValue
{
  return self->_lastValue;
}

- (void)setLastValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastValue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cluster, 0);
}

- (void)notify:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v0, v1, "%@ invoking block for initial Snapshot(%@)");
  OUTLINED_FUNCTION_1();
}

- (void)notify:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v0, v1, "%@ not invoking block due to no change in Snapshot(%@)");
  OUTLINED_FUNCTION_1();
}

- (void)notify:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v0, v1, "%@ invoking block for changed Snapshot(%@)");
  OUTLINED_FUNCTION_1();
}

@end
