@implementation KGMemoryEdge

- (KGMemoryEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  KGMemoryEdge *v16;
  KGMemoryEdge *v17;
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
  v23.super_class = (Class)KGMemoryEdge;
  v16 = -[KGMemoryEdge init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_identifier = a3;
    v18 = objc_msgSend(v12, "copy");
    labels = v17->_labels;
    v17->_labels = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_targetNode, a7);
    objc_storeStrong((id *)&v17->_sourceNode, a6);
    v20 = objc_msgSend(v13, "copy");
    properties = v17->_properties;
    v17->_properties = (NSDictionary *)v20;

  }
  return v17;
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KGMemoryEdge *v4;
  unint64_t identifier;
  void *v6;
  void *v7;
  KGMemoryEdge *v8;

  v4 = +[KGMemoryEdge allocWithZone:](KGMemoryEdge, "allocWithZone:", a3);
  identifier = self->_identifier;
  v6 = (void *)-[NSSet copy](self->_labels, "copy");
  v7 = (void *)-[NSDictionary copy](self->_properties, "copy");
  v8 = -[KGMemoryEdge initWithIdentifier:labels:properties:sourceNode:targetNode:](v4, "initWithIdentifier:labels:properties:sourceNode:targetNode:", identifier, v6, v7, self->_sourceNode, self->_targetNode);

  return v8;
}

- (NSString)description
{
  void *v3;
  unint64_t identifier;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  -[KGMemoryEdge sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");
  -[KGMemoryEdge targetNode](self, "targetNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");
  -[KGMemoryEdge labels](self, "labels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGMemoryEdge properties](self, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KGMemoryEdge id:%lu sourceNodeIdentifier:%lu targetNodeIdentifier:%lu label:%@ properties:%@>"), identifier, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSSet)labels
{
  return self->_labels;
}

- (KGMemoryNode)targetNode
{
  return self->_targetNode;
}

- (KGMemoryNode)sourceNode
{
  return self->_sourceNode;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
