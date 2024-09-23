@implementation KGSnapshotNode

- (KGSnapshotNode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  KGSnapshotNode *v10;
  KGSnapshotNode *v11;
  uint64_t v12;
  NSSet *labels;
  uint64_t v14;
  NSDictionary *properties;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)KGSnapshotNode;
  v10 = -[KGSnapshotNode init](&v17, sel_init);
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

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KGSnapshotNode;
  -[KGSnapshotNode description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("[%ld] [%@]"), self->_identifier, self->_labels);
  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[KGSnapshotNode initWithIdentifier:labels:properties:]([KGSnapshotNode alloc], "initWithIdentifier:labels:properties:", self->_identifier, self->_labels, self->_properties);
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  KGSnapshotNode *v4;
  BOOL v5;

  v4 = (KGSnapshotNode *)a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
