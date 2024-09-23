@implementation CRKConnectedStudentDaemonProxyFactory

- (CRKConnectedStudentDaemonProxyFactory)initWithStudentDaemonProxy:(id)a3 didConnectHandler:(id)a4
{
  id v7;
  id v8;
  CRKConnectedStudentDaemonProxyFactory *v9;
  CRKConnectedStudentDaemonProxyFactory *v10;
  uint64_t v11;
  id didConnectHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKConnectedStudentDaemonProxyFactory;
  v9 = -[CRKConnectedStudentDaemonProxyFactory init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_studentDaemonProxy, a3);
    v11 = MEMORY[0x219A226E8](v8);
    didConnectHandler = v10->_didConnectHandler;
    v10->_didConnectHandler = (id)v11;

  }
  return v10;
}

+ (void)makeConnectedStudentDaemonProxyWithCompletion:(id)a3
{
  id v3;
  CRKConnectedStudentDaemonProxyFactory *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_opt_new();
  v4 = -[CRKConnectedStudentDaemonProxyFactory initWithStudentDaemonProxy:didConnectHandler:]([CRKConnectedStudentDaemonProxyFactory alloc], "initWithStudentDaemonProxy:didConnectHandler:", v5, v3);

  objc_msgSend(v5, "addObserver:", v4);
  -[CRKConnectedStudentDaemonProxyFactory beginConnection](v4, "beginConnection");

}

- (void)beginConnection
{
  id v3;

  -[CRKConnectedStudentDaemonProxyFactory setSelfReference:](self, "setSelfReference:", self);
  -[CRKConnectedStudentDaemonProxyFactory studentDaemonProxy](self, "studentDaemonProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connect");

}

- (void)daemonProxyDidConnect:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[CRKConnectedStudentDaemonProxyFactory didConnectHandler](self, "didConnectHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  -[CRKConnectedStudentDaemonProxyFactory setDidConnectHandler:](self, "setDidConnectHandler:", 0);
  v5[2](v5, v4);

  -[CRKConnectedStudentDaemonProxyFactory setSelfReference:](self, "setSelfReference:", 0);
}

- (CRKStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (id)didConnectHandler
{
  return self->_didConnectHandler;
}

- (void)setDidConnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CRKConnectedStudentDaemonProxyFactory)selfReference
{
  return self->_selfReference;
}

- (void)setSelfReference:(id)a3
{
  objc_storeStrong((id *)&self->_selfReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong(&self->_didConnectHandler, 0);
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

@end
