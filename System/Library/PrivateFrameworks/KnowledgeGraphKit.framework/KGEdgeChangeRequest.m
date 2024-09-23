@implementation KGEdgeChangeRequest

- (KGEdgeChangeRequest)initWithEdge:(id)a3 properties:(id)a4
{
  id v7;
  id v8;
  KGEdgeChangeRequest *v9;
  KGEdgeChangeRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGEdgeChangeRequest;
  v9 = -[KGEdgeChangeRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_edge, a3);
    objc_storeStrong((id *)&v10->_properties, a4);
  }

  return v10;
}

- (KGEdge)edge
{
  return self->_edge;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_edge, 0);
}

@end
