@implementation COClusterRoleMonitorClientInterfaceMediator

- (COClusterRoleMonitorClientInterfaceMediator)initWithClusterRoleMonitor:(id)a3
{
  id v4;
  COClusterRoleMonitorClientInterfaceMediator *v5;
  COClusterRoleMonitorClientInterfaceMediator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COClusterRoleMonitorClientInterfaceMediator;
  v5 = -[COClusterRoleMonitorClientInterfaceMediator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_monitor, v4);

  return v6;
}

- (void)roleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  v11 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "roleOfMember:inCluster:didChangeTo:", v12, v8, v9);

}

- (void)membersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  v11 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "membersWithRole:inCluster:didChangeTo:", v12, v8, v9);

}

- (void)snapshotOfCluster:(id)a3 didChangeTo:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_monitor);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "snapshotOfCluster:didChangeTo:", v9, v6);

}

- (COClusterRoleMonitor)monitor
{
  return (COClusterRoleMonitor *)objc_loadWeakRetained((id *)&self->_monitor);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_monitor);
}

@end
