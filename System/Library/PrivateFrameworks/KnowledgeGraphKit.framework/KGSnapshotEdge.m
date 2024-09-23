@implementation KGSnapshotEdge

- (KGSnapshotEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  KGSnapshotEdge *v16;
  KGSnapshotEdge *v17;
  uint64_t v18;
  NSSet *labels;
  uint64_t v20;
  NSDictionary *properties;
  objc_super v23;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)KGSnapshotEdge;
  v16 = -[KGSnapshotEdge init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_identifier = a3;
    v18 = objc_msgSend(v12, "copy");
    labels = v17->_labels;
    v17->_labels = (NSSet *)v18;

    v20 = objc_msgSend(v13, "copy");
    properties = v17->_properties;
    v17->_properties = (NSDictionary *)v20;

    objc_storeStrong((id *)&v17->_sourceNode, a6);
    objc_storeStrong((id *)&v17->_targetNode, a7);
  }

  return v17;
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:labels:properties:sourceNode:targetNode:", self->_identifier, self->_labels, self->_properties, self->_sourceNode, self->_targetNode);
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  KGSnapshotEdge *v4;
  BOOL v5;

  v4 = (KGSnapshotEdge *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_identifier == v4->_identifier;
  }

  return v5;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSSet)labels
{
  return self->_labels;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (KGNode)sourceNode
{
  return self->_sourceNode;
}

- (KGNode)targetNode
{
  return self->_targetNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
