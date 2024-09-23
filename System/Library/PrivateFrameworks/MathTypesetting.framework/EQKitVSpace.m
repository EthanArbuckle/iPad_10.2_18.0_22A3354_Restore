@implementation EQKitVSpace

- (EQKitVSpace)initWithHeight:(double)a3 depth:(double)a4
{
  EQKitVSpace *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EQKitVSpace;
  result = -[EQKitVSpace init](&v7, sel_init);
  if (result)
  {
    result->_height = a3;
    result->_depth = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitVSpace height](self, "height");
  v6 = v5;
  -[EQKitVSpace depth](self, "depth");
  return (id)objc_msgSend(v4, "initWithHeight:depth:", v6, v7);
}

- (BOOL)isEqual:(id)a3
{
  EQKitVSpace *v4;
  EQKitVSpace *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = (EQKitVSpace *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[EQKitVSpace isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitVSpace height](self, "height");
    v7 = v6;
    -[EQKitVSpace height](v5, "height");
    if (v7 == v8)
    {
      -[EQKitVSpace depth](self, "depth");
      v10 = v9;
      -[EQKitVSpace depth](v5, "depth");
      v12 = v10 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitVSpace height](self, "height");
  v6 = v5;
  -[EQKitVSpace depth](self, "depth");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f"), v4, self, v6, v7);
}

- (double)layoutHeight
{
  return self->_height;
}

- (double)layoutDepth
{
  return self->_depth;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)height
{
  return self->_height;
}

- (double)depth
{
  return self->_depth;
}

@end
