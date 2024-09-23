@implementation ARUIHashBuilder

- (void)appendFloat:(float)a3
{
  unint64_t hash;

  hash = self->_hash;
  self->_hash = -[ARUIHashBuilder hashForFloat:](self, "hashForFloat:") - hash + 32 * hash;
}

- (unint64_t)hashForFloat:(float)a3
{
  return LODWORD(a3);
}

- (void)appendObject:(id)a3
{
  unint64_t hash;

  hash = self->_hash;
  self->_hash = objc_msgSend(a3, "hash") - hash + 32 * hash;
}

- (unint64_t)hash
{
  return self->_hash;
}

+ (id)builder
{
  return objc_alloc_init(ARUIHashBuilder);
}

- (ARUIHashBuilder)init
{
  ARUIHashBuilder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARUIHashBuilder;
  result = -[ARUIHashBuilder init](&v3, sel_init);
  if (result)
    result->_hash = 0;
  return result;
}

- (void)appendBool:(BOOL)a3
{
  self->_hash = 31 * self->_hash + a3;
}

- (void)appendFloat2:(ARUIHashBuilder *)self
{
  uint64_t v2;
  double v4;
  int v5;

  v5 = HIDWORD(v2);
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:");
  HIDWORD(v4) = v5;
  LODWORD(v4) = v5;
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:", v4);
}

- (void)appendUnsignedInt:(unint64_t)a3
{
  self->_hash = a3 - self->_hash + 32 * self->_hash;
}

- (void)appendInt:(int64_t)a3
{
  self->_hash = a3 - self->_hash + 32 * self->_hash;
}

- (unint64_t)hashForCGFloat:(double)a3
{
  return *(_QWORD *)&a3;
}

- (unint64_t)hashForDouble:(double)a3
{
  return *(_QWORD *)&a3;
}

- (unint64_t)hashForNSTimeInterval:(double)a3
{
  return *(_QWORD *)&a3;
}

- (void)appendCGFloat:(double)a3
{
  unint64_t hash;

  hash = self->_hash;
  self->_hash = -[ARUIHashBuilder hashForCGFloat:](self, "hashForCGFloat:", a3) - hash + 32 * hash;
}

- (void)appendTimeInterval:(double)a3
{
  unint64_t hash;

  hash = self->_hash;
  self->_hash = -[ARUIHashBuilder hashForNSTimeInterval:](self, "hashForNSTimeInterval:", a3) - hash + 32 * hash;
}

- (void)appendCGRect:(CGRect)a3
{
  double height;
  double width;
  double y;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  -[ARUIHashBuilder appendCGFloat:](self, "appendCGFloat:", a3.origin.x);
  -[ARUIHashBuilder appendCGFloat:](self, "appendCGFloat:", y);
  -[ARUIHashBuilder appendCGFloat:](self, "appendCGFloat:", width);
  -[ARUIHashBuilder appendCGFloat:](self, "appendCGFloat:", height);
}

- (void)appendDouble:(double)a3
{
  unint64_t hash;

  hash = self->_hash;
  self->_hash = -[ARUIHashBuilder hashForDouble:](self, "hashForDouble:", a3) - hash + 32 * hash;
}

- (void)appendFloat4:(ARUIHashBuilder *)self
{
  __int128 v2;
  double v4;
  __int128 v5;

  v5 = v2;
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:");
  HIDWORD(v4) = DWORD1(v5);
  LODWORD(v4) = DWORD1(v5);
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:", v4);
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v5), DWORD2(v5))));
  -[ARUIHashBuilder appendFloat:](self, "appendFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v5), HIDWORD(v5))));
}

- (uint64_t)appendFloat4x4:(double)a3
{
  objc_msgSend(a1, "appendFloat4:");
  objc_msgSend(a1, "appendFloat4:", a3);
  objc_msgSend(a1, "appendFloat4:", a4);
  return objc_msgSend(a1, "appendFloat4:", a5);
}

@end
