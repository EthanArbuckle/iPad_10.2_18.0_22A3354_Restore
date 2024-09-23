@implementation _HMNetworkPath

- (_HMNetworkPath)initWithNwPath:(id)a3
{
  id v5;
  _HMNetworkPath *v6;
  _HMNetworkPath *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMNetworkPath;
  v6 = -[_HMNetworkPath init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nwPath, a3);

  return v7;
}

- (int)status
{
  NSObject *v2;
  nw_path_status_t status;

  -[_HMNetworkPath nwPath](self, "nwPath");
  v2 = objc_claimAutoreleasedReturnValue();
  status = nw_path_get_status(v2);

  return status;
}

- (OS_nw_path)nwPath
{
  return self->_nwPath;
}

- (void)setNwPath:(id)a3
{
  objc_storeStrong((id *)&self->_nwPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwPath, 0);
}

@end
