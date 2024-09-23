@implementation LACEnvironmentServiceXPCHost

- (LACEnvironmentServiceXPCHost)initWithDependencies:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  LACEnvironmentServiceXPCHost *v9;
  LACEnvironmentServiceXPCHost *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACEnvironmentServiceXPCHost;
  v9 = -[LACEnvironmentServiceXPCHost init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dependencies, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)environmentStateForUser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  LACEnvironmentDependencies *dependencies;
  void *v12;
  id v13;
  id v14;
  _BYTE v15[32];

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    -[LACEnvironmentServiceXPCHost environmentStateForUser:completion:].cold.1();
  v9 = (void *)v8;
  v10 = objc_msgSend(v6, "unsignedIntValue");
  objc_msgSend(v9, "auditToken");
  dependencies = self->_dependencies;
  v14 = 0;
  +[LACEnvironmentState environmentStateForUser:auditToken:dependencies:error:](LACEnvironmentState, "environmentStateForUser:auditToken:dependencies:error:", v10, v15, dependencies, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  v7[2](v7, v12, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_stateForUser, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
}

- (void)environmentStateForUser:completion:.cold.1()
{
  __assert_rtn("-[LACEnvironmentServiceXPCHost environmentStateForUser:completion:]", "LACEnvironmentServiceXPCHost.m", 33, "currentConnection");
}

@end
