@implementation COClientObserver

- (COClientObserver)initWithConnection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  COClientObserver *v7;

  v4 = (void *)MEMORY[0x24BE19DF0];
  v5 = a3;
  objc_msgSend(v4, "homeCluster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COClientObserver initWithConnection:domain:cluster:](self, "initWithConnection:domain:cluster:", v5, CFSTR("default"), v6);

  return v7;
}

- (COClientObserver)initWithConnection:(id)a3 domain:(id)a4 cluster:(id)a5
{
  id v8;
  id v9;
  id v10;
  COClientObserver *v11;
  int v12;
  const char *v13;
  id v14;
  uint64_t v15;
  OS_os_transaction *transaction;
  objc_super v18;
  _OWORD buffer[4];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)COClientObserver;
  v11 = -[COCoordinationServiceClient initWithConnection:](&v18, sel_initWithConnection_, v8);
  if (v11)
  {
    v12 = objc_msgSend(v8, "processIdentifier");
    memset(buffer, 0, sizeof(buffer));
    *((_BYTE *)buffer + proc_name(v12, buffer, 0x40u)) = 0;
    if (LOBYTE(buffer[0]))
      v13 = (const char *)buffer;
    else
      v13 = "unknown";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.CoordinationCore.%@.observing-%s"), v9, v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "UTF8String");
    v15 = os_transaction_create();
    transaction = v11->_transaction;
    v11->_transaction = (OS_os_transaction *)v15;

    objc_storeStrong(&v11->_cluster, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COClientObserver;
  if (-[COCoordinationServiceClient isEqual:](&v9, sel_isEqual_, v4))
  {
    -[COClientObserver cluster](self, "cluster");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cluster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (id)cluster
{
  return self->_cluster;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
