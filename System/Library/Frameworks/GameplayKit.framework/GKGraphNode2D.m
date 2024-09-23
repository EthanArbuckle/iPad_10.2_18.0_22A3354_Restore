@implementation GKGraphNode2D

- (void)cGraphNode2D
{
  return self->_cGraphNode2D;
}

- (void)makeCGraphNode
{
  id *v3;

  v3 = (id *)operator new();
  GKCGraphNode2D::GKCGraphNode2D((GKCGraphNode2D *)v3);
  self->_cGraphNode2D = v3;
  objc_storeWeak(v3 + 9, self);
  return self->_cGraphNode2D;
}

- (void)setPosition:(vector_float2)position
{
  *((vector_float2 *)self->_cGraphNode2D + 8) = position;
}

- (vector_float2)position
{
  return *(vector_float2 *)((char *)self->_cGraphNode2D + 64);
}

- (void)deleteCGraphNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKGraphNode2D;
  -[GKGraphNode deleteCGraphNode](&v3, sel_deleteCGraphNode);
  self->_cGraphNode2D = 0;
}

- (GKGraphNode2D)initWithPoint:(vector_float2)point
{
  GKGraphNode2D *v4;
  GKGraphNode2D *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGraphNode2D;
  v4 = -[GKGraphNode init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[GKGraphNode2D setPosition:](v4, "setPosition:", *(double *)&point);
    *((vector_float2 *)v5->_cGraphNode2D + 8) = point;
  }
  return v5;
}

+ (GKGraphNode2D)nodeWithPoint:(vector_float2)point
{
  return (GKGraphNode2D *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:", *(double *)&point);
}

- (GKGraphNode2D)init
{
  return -[GKGraphNode2D initWithPoint:](self, "initWithPoint:", 0.0);
}

- (float)estimatedCostToNode:(id)a3
{
  id v4;
  float v5;

  v4 = a3;
  v5 = (*(float (**)(void *, uint64_t))(*(_QWORD *)self->_cGraphNode2D + 24))(self->_cGraphNode2D, objc_msgSend(v4, "cGraphNode"));

  return v5;
}

- (float)costToNode:(id)a3
{
  id v4;
  float v5;

  v4 = a3;
  v5 = (*(float (**)(void *, uint64_t))(*(_QWORD *)self->_cGraphNode2D + 24))(self->_cGraphNode2D, objc_msgSend(v4, "cGraphNode"));

  return v5;
}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  float v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[GKGraphNode2D position](self, "position");
  v5 = v4;
  -[GKGraphNode2D position](self, "position");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("GKGraphNode2D: {%.2f, %.2f}"), *(_QWORD *)&v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGraphNode2D)initWithCoder:(id)a3
{
  id v4;
  GKGraphNode2D *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGraphNode2D;
  v5 = -[GKGraphNode initWithCoder:](&v10, sel_initWithCoder_, v4);
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionX"));
  v9 = v6;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionY"));
  -[GKGraphNode2D setPosition:](v5, "setPosition:", COERCE_DOUBLE(__PAIR64__(v7, v9)));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GKGraphNode2D;
  -[GKGraphNode encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[GKGraphNode2D position](self, "position");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("positionX"));
  -[GKGraphNode2D position](self, "position");
  LODWORD(v5) = HIDWORD(v5);
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("positionY"), v5);

}

@end
