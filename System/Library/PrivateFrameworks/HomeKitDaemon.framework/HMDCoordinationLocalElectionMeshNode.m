@implementation HMDCoordinationLocalElectionMeshNode

- (HMDCoordinationLocalElectionMeshNode)initWithMeshNode:(id)a3
{
  id v4;
  HMDCoordinationLocalElectionMeshNode *v5;
  HMDCoordinationLocalElectionMeshNode *v6;
  uint64_t v7;
  NSString *idsIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDCoordinationLocalElectionMeshNode;
  v5 = -[HMDCoordinationLocalElectionMeshNode init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_meshNode, v4);
    objc_msgSend(v4, "IDSIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    idsIdentifier = v6->_idsIdentifier;
    v6->_idsIdentifier = (NSString *)v7;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDCoordinationLocalElectionMeshNode *v4;
  HMDCoordinationLocalElectionMeshNode *v5;
  HMDCoordinationLocalElectionMeshNode *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDCoordinationLocalElectionMeshNode *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDCoordinationLocalElectionMeshNode idsIdentifier](self, "idsIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoordinationLocalElectionMeshNode idsIdentifier](v6, "idsIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = HMFEqualObjects();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCoordinationLocalElectionMeshNode idsIdentifier](self, "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCoordinationLocalElectionMeshNode meshNode](self, "meshNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMDLocalElectionMeshNode wrapping:%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCoordinationLocalElectionMeshNode meshNode](self, "meshNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMDLocalElectionMeshNode wrapping:%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)idsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (COMeshNode)meshNode
{
  return (COMeshNode *)objc_loadWeakRetained((id *)&self->_meshNode);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_meshNode);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end
