@implementation MAGraphReference

- (MAGraphReference)initWithGraph:(id)a3
{
  id v4;
  MAGraphReference *v5;
  MAGraphReference *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAGraphReference;
  v5 = -[MAGraphReference init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_concreteGraph, v4);
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_hash = objc_msgSend(v7, "hash");

  }
  return v6;
}

- (MAGraphProxy)graph
{
  return (MAGraphProxy *)objc_loadWeakRetained((id *)&self->_concreteGraph);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (MAGraph)concreteGraph
{
  return (MAGraph *)objc_loadWeakRetained((id *)&self->_concreteGraph);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_concreteGraph);
}

@end
