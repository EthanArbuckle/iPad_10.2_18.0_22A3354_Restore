@implementation GKGridGraphNode

- (void)cGridGraphNode
{
  return self->_cGridGraphNode;
}

- (void)makeCGraphNode
{
  id *v3;

  v3 = (id *)operator new();
  GKCGridGraphNode::GKCGridGraphNode((GKCGridGraphNode *)v3);
  self->_cGridGraphNode = v3;
  objc_storeWeak(v3 + 9, self);
  return self->_cGridGraphNode;
}

- (void)deleteCGraphNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKGridGraphNode;
  -[GKGraphNode deleteCGraphNode](&v3, sel_deleteCGraphNode);
  self->_cGridGraphNode = 0;
}

- (GKGridGraphNode)init
{
  return -[GKGridGraphNode initWithGridPosition:](self, "initWithGridPosition:", 0.0);
}

+ (GKGridGraphNode)nodeWithGridPosition:(vector_int2)gridPosition
{
  return (GKGridGraphNode *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGridPosition:", *(double *)&gridPosition);
}

- (vector_int2)gridPosition
{
  return *(vector_int2 *)((char *)self->_cGridGraphNode + 64);
}

- (GKGridGraphNode)initWithGridPosition:(vector_int2)gridPosition
{
  GKGridGraphNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKGridGraphNode;
  result = -[GKGraphNode init](&v5, sel_init);
  if (result)
    *((vector_int2 *)result->_cGridGraphNode + 8) = gridPosition;
  return result;
}

- (float)estimatedCostToNode:(id)a3
{
  id v4;
  float v5;

  v4 = a3;
  v5 = (*(float (**)(void *, uint64_t))(*(_QWORD *)self->_cGridGraphNode + 24))(self->_cGridGraphNode, objc_msgSend(v4, "cGraphNode"));

  return v5;
}

- (float)costToNode:(id)a3
{
  id v4;
  float v5;

  v4 = a3;
  v5 = (*(float (**)(void *, uint64_t))(*(_QWORD *)self->_cGridGraphNode + 24))(self->_cGridGraphNode, objc_msgSend(v4, "cGraphNode"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGridGraphNode)initWithCoder:(id)a3
{
  id v4;
  GKGridGraphNode *v5;
  unsigned int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKGridGraphNode;
  v5 = -[GKGraphNode initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("positionX"));
  *((_QWORD *)v5->_cGridGraphNode + 8) = __PAIR64__(objc_msgSend(v4, "decodeIntForKey:", CFSTR("positionY")), v6);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKGridGraphNode;
  -[GKGraphNode encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[GKGridGraphNode gridPosition](self, "gridPosition");
  objc_msgSend(v4, "encodeInt:forKey:", v5, CFSTR("positionX"));
  -[GKGridGraphNode gridPosition](self, "gridPosition");
  objc_msgSend(v4, "encodeInt:forKey:", v6, CFSTR("positionY"));

}

@end
