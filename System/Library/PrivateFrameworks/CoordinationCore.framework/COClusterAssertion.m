@implementation COClusterAssertion

- (id)_initWithCluster:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  COClusterAssertion *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterAssertion;
  v9 = -[COClusterAssertion init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cluster, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

+ (id)assertionForCluster:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCluster:delegate:", v7, v6);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[COClusterAssertion _notifyInvalidated](self, "_notifyInvalidated");
  v3.receiver = self;
  v3.super_class = (Class)COClusterAssertion;
  -[COClusterAssertion dealloc](&v3, sel_dealloc);
}

- (void)_notifyInvalidated
{
  void *v3;
  id v4;

  -[COClusterAssertion delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[COClusterAssertion cluster](self, "cluster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didInvalidateAssertionForCluster:", v3);

  }
}

- (COClusterAssertionDelegate)delegate
{
  return (COClusterAssertionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (COCluster)cluster
{
  return self->_cluster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
