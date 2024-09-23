@implementation EQKitHSpace

- (EQKitHSpace)initWithWidth:(double)a3
{
  EQKitHSpace *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitHSpace;
  result = -[EQKitHSpace init](&v5, sel_init);
  if (result)
    result->_width = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitHSpace width](self, "width");
  return (id)objc_msgSend(v4, "initWithWidth:");
}

- (BOOL)isEqual:(id)a3
{
  EQKitHSpace *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = (EQKitHSpace *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[EQKitHSpace isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[EQKitHSpace width](self, "width");
    v6 = v5;
    -[EQKitHSpace width](v4, "width");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitHSpace width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: width=%f"), v4, self, v5);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)width
{
  return self->_width;
}

@end
