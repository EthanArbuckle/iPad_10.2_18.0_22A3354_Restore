@implementation EQKitHVSpace

- (EQKitHVSpace)initWithWidth:(double)a3 height:(double)a4 depth:(double)a5
{
  EQKitHVSpace *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EQKitHVSpace;
  result = -[EQKitHVSpace init](&v9, sel_init);
  if (result)
  {
    result->_width = a3;
    result->_height = a4;
    result->_depth = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitHVSpace width](self, "width");
  v6 = v5;
  -[EQKitHVSpace height](self, "height");
  v8 = v7;
  -[EQKitHVSpace depth](self, "depth");
  return (id)objc_msgSend(v4, "initWithWidth:height:depth:", v6, v8, v9);
}

- (BOOL)isEqual:(id)a3
{
  EQKitHVSpace *v4;
  EQKitHVSpace *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = (EQKitHVSpace *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else if (-[EQKitHVSpace isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitHVSpace width](self, "width");
    v7 = v6;
    -[EQKitHVSpace width](v5, "width");
    if (v7 == v8
      && (-[EQKitHVSpace height](self, "height"), v10 = v9, -[EQKitHVSpace height](v5, "height"), v10 == v11))
    {
      -[EQKitHVSpace depth](self, "depth");
      v13 = v12;
      -[EQKitHVSpace depth](v5, "depth");
      v15 = v13 == v14;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitHVSpace height](self, "height");
  v6 = v5;
  -[EQKitHVSpace depth](self, "depth");
  v8 = v7;
  -[EQKitHVSpace width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f"), v4, self, v6, v8, v9);
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

- (double)width
{
  return self->_width;
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
