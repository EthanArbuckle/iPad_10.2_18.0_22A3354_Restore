@implementation _COClusterRoleMonitorRoleObserver

- (_COClusterRoleMonitorRoleObserver)initWithRole:(id)a3 inCluster:(id)a4 queue:(id)a5 block:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _COClusterRoleMonitorRoleObserver *v15;
  _COClusterRoleMonitorRoleObserver *v16;
  uint64_t v17;
  id cluster;
  uint64_t v19;
  id block;
  NSSet *lastValue;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_COClusterRoleMonitorRoleObserver;
  v15 = -[_COClusterRoleMonitorRoleObserver init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_role, a3);
    v17 = objc_msgSend(v12, "copy");
    cluster = v16->_cluster;
    v16->_cluster = (id)v17;

    objc_storeStrong((id *)&v16->_queue, a5);
    v19 = objc_msgSend(v14, "copy");
    block = v16->_block;
    v16->_block = (id)v19;

    lastValue = v16->_lastValue;
    v16->_lastValue = 0;

  }
  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_COClusterRoleMonitorRoleObserver role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_COClusterRoleMonitorRoleObserver cluster](self, "cluster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, role = %@, cluster = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  -[_COClusterRoleMonitorRoleObserver lastValue](self, "lastValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    COLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_COClusterRoleMonitorRoleObserver notify:].cold.1();
    goto LABEL_10;
  }
  -[_COClusterRoleMonitorRoleObserver lastValue](self, "lastValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToSet:", v6);

  COLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) == 0)
  {
    if (v9)
      -[_COClusterRoleMonitorRoleObserver notify:].cold.3();
LABEL_10:

    -[_COClusterRoleMonitorRoleObserver setLastValue:](self, "setLastValue:", v4);
    -[_COClusterRoleMonitorRoleObserver queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44___COClusterRoleMonitorRoleObserver_notify___block_invoke;
    v11[3] = &unk_24CD3EF20;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v10, v11);

    goto LABEL_11;
  }
  if (v9)
    -[_COClusterRoleMonitorRoleObserver notify:].cold.2();

LABEL_11:
}

- (COClusterRole)role
{
  return self->_role;
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
  objc_storeStrong((id *)&self->_role, 0);
}

- (void)notify:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v0, v1, "%@ invoking block for initial Members(%@)");
  OUTLINED_FUNCTION_1();
}

- (void)notify:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v0, v1, "%@ not invoking block due to no change in Members(%@)");
  OUTLINED_FUNCTION_1();
}

- (void)notify:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v0, v1, "%@ invoking block for changed Members(%@)");
  OUTLINED_FUNCTION_1();
}

@end
