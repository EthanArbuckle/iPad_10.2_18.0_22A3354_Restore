@implementation GKGraphNode3D

- (void)cGraphNode3D
{
  return self->_cGraphNode3D;
}

- (void)makeCGraphNode
{
  id *v3;

  v3 = (id *)operator new();
  GKCGraphNode3D::GKCGraphNode3D((GKCGraphNode3D *)v3);
  self->_cGraphNode3D = v3;
  objc_storeWeak(v3 + 10, self);
  return self->_cGraphNode3D;
}

- (void)setPosition:(vector_float3)position
{
  __int128 v3;

  *((_OWORD *)self->_cGraphNode3D + 4) = v3;
}

- (vector_float3)position
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)deleteCGraphNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKGraphNode3D;
  -[GKGraphNode deleteCGraphNode](&v3, sel_deleteCGraphNode);
  self->_cGraphNode3D = 0;
}

- (GKGraphNode3D)initWithPoint:(vector_float3)point
{
  __int128 v3;
  GKGraphNode3D *v4;
  GKGraphNode3D *v5;
  __int128 v7;
  objc_super v8;

  v7 = v3;
  v8.receiver = self;
  v8.super_class = (Class)GKGraphNode3D;
  v4 = -[GKGraphNode init](&v8, sel_init, point.i64[0], point.i64[1]);
  v5 = v4;
  if (v4)
  {
    -[GKGraphNode3D setPosition:](v4, "setPosition:", *(double *)&v7);
    *((_OWORD *)v5->_cGraphNode3D + 4) = v7;
  }
  return v5;
}

+ (GKGraphNode3D)nodeWithPoint:(vector_float3)point
{
  double v3;

  return (GKGraphNode3D *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:", v3);
}

- (GKGraphNode3D)init
{
  return -[GKGraphNode3D initWithPoint:](self, "initWithPoint:", 0.0);
}

- (float)estimatedCostToNode:(id)a3
{
  id v4;
  float v5;

  v4 = a3;
  v5 = (*(float (**)(void *, uint64_t))(*(_QWORD *)self->_cGraphNode3D + 24))(self->_cGraphNode3D, objc_msgSend(v4, "cGraphNode"));

  return v5;
}

- (float)costToNode:(id)a3
{
  id v4;
  float v5;

  v4 = a3;
  v5 = (*(float (**)(void *, uint64_t))(*(_QWORD *)self->_cGraphNode3D + 24))(self->_cGraphNode3D, objc_msgSend(v4, "cGraphNode"));

  return v5;
}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  float v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[GKGraphNode3D position](self, "position");
  v5 = v4;
  -[GKGraphNode3D position](self, "position");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("GKGraphNode2D: {%.2f, %.2f}"), *(_QWORD *)&v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGraphNode3D)initWithCoder:(id)a3
{
  id v4;
  GKGraphNode3D *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v9;
  unsigned int v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGraphNode3D;
  v5 = -[GKGraphNode initWithCoder:](&v11, sel_initWithCoder_, v4);
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionX"));
  v10 = v6;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionY"));
  v9 = v7;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("positionZ"));
  -[GKGraphNode3D setPosition:](v5, "setPosition:", COERCE_DOUBLE(__PAIR64__(v9, v10)));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  int v6;
  double v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKGraphNode3D;
  -[GKGraphNode encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[GKGraphNode3D position](self, "position");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("positionX"));
  -[GKGraphNode3D position](self, "position");
  LODWORD(v5) = HIDWORD(v5);
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("positionY"), v5);
  -[GKGraphNode3D position](self, "position");
  LODWORD(v7) = v6;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("positionZ"), v7);

}

@end
