@implementation ESIntArray2D

+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  return -[ESIntArray2D initWithISize:jSize:]([ESIntArray2D alloc], "initWithISize:jSize:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_arrayData);
  v3.receiver = self;
  v3.super_class = (Class)ESIntArray2D;
  -[ESIntArray2D dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  unint64_t jSize;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 3 * self->_iSize + 3 + (3 * self->_iSize + 3) * self->_jSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  jSize = self->_jSize;
  v5 = self->_iSize + 1;
  if (v5 <= jSize + 1)
    v5 = jSize + 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%%0%ldld "), (uint64_t)(log10((double)v5) + 1.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_jSize)
  {
    v7 = 0;
    do
    {
      if (self->_iSize)
      {
        v8 = 0;
        do
          objc_msgSend(v3, "appendFormat:", v6, -[ESIntArray2D ::](self, "::", v8++, v7));
        while (v8 < self->_iSize);
      }
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
      ++v7;
    }
    while (v7 < self->_jSize);
  }

  return v3;
}

- (ESIntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  ESIntArray2D *v6;
  ESIntArray2D *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ESIntArray2D;
  v6 = -[ESIntArray2D init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_iSize = a3;
    v6->_jSize = a4;
    v6->_arrayData = (int64_t *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
  }
  return v7;
}

- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  return self->_iSize > a3 && self->_jSize > a4;
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4
{
  -[ESIntArray2D assertBoundsForIIndex:jIndex:](self, "assertBoundsForIIndex:jIndex:");
  return self->_arrayData[a3 + self->_iSize * a4];
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5
{
  if (-[ESIntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:"))
    return -[ESIntArray2D ::](self, "::", a3, a4);
  else
    return a5;
}

- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5
{
  -[ESIntArray2D assertBoundsForIIndex:jIndex:](self, "assertBoundsForIIndex:jIndex:");
  self->_arrayData[a3 + self->_iSize * a4] = a5;
}

- (unint64_t)iSize
{
  return self->_iSize;
}

- (unint64_t)jSize
{
  return self->_jSize;
}

- (BOOL)shouldBoundsCheck
{
  return self->_shouldBoundsCheck;
}

- (void)setShouldBoundsCheck:(BOOL)a3
{
  self->_shouldBoundsCheck = a3;
}

@end
