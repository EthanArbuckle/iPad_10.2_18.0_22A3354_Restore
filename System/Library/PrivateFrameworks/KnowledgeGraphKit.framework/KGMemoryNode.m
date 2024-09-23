@implementation KGMemoryNode

- (KGMemoryNode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  KGMemoryNode *v10;
  KGMemoryNode *v11;
  uint64_t v12;
  NSSet *labels;
  uint64_t v14;
  NSDictionary *properties;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)KGMemoryNode;
  v10 = -[KGMemoryNode init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_identifier = a3;
    v12 = objc_msgSend(v8, "copy");
    labels = v11->_labels;
    v11->_labels = (NSSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    properties = v11->_properties;
    v11->_properties = (NSDictionary *)v14;

  }
  return v11;
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KGMemoryNode *v4;
  unint64_t identifier;
  void *v6;
  void *v7;
  KGMemoryNode *v8;

  v4 = +[KGMemoryNode allocWithZone:](KGMemoryNode, "allocWithZone:", a3);
  identifier = self->_identifier;
  v6 = (void *)-[NSSet copy](self->_labels, "copy");
  v7 = (void *)-[NSDictionary copy](self->_properties, "copy");
  v8 = -[KGMemoryNode initWithIdentifier:labels:properties:](v4, "initWithIdentifier:labels:properties:", identifier, v6, v7);

  return v8;
}

- (NSString)description
{
  void *v3;
  unint64_t identifier;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  -[KGMemoryNode labels](self, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGMemoryNode properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KGMemoryEdge id:%lu label:%@ properties:%@>"), identifier, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
