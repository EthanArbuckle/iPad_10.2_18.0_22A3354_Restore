@implementation FIReplicaNode

- (id)init:(id)a3
{
  FINode *v4;
  FIReplicaNode *v5;
  FINode *original;
  objc_super v8;

  v4 = (FINode *)a3;
  v8.receiver = self;
  v8.super_class = (Class)FIReplicaNode;
  v5 = -[FIReplicaNode init](&v8, sel_init);
  original = v5->_original;
  v5->_original = v4;

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  TReplicaRegistry::RemoveReplica((TReplicaRegistry *)self, (FINode *)a2);
  v3.receiver = self;
  v3.super_class = (Class)FIReplicaNode;
  -[FIReplicaNode dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FIReplicaNode;
  -[FIReplicaNode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FINode description](self->_original, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ -> %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)original
{
  return self->_original;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_original;
}

- (BOOL)isKindOfClass:(Class)a3
{
  char isKindOfClass;
  objc_super v7;

  if ((Class)objc_opt_class() == a3
    || (v7.receiver = self,
        v7.super_class = (Class)FIReplicaNode,
        -[FIReplicaNode isKindOfClass:](&v7, sel_isKindOfClass_, a3)))
  {
    isKindOfClass = 1;
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((-[FINode conformsToProtocol:](self->_original, "conformsToProtocol:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)FIReplicaNode;
    v5 = -[FIReplicaNode conformsToProtocol:](&v7, sel_conformsToProtocol_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
}

@end
