@implementation CADisplayPixelConstraints

- (CADisplayPixelConstraints)initWithConstraints:(const AveragePixelConstraints *)a3
{
  CADisplayPixelConstraints *v4;
  size_t v5;
  float *v6;
  size_t v7;
  float *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v11.receiver = self;
  v11.super_class = (Class)CADisplayPixelConstraints;
  v4 = -[CADisplayPixelConstraints init](&v11, sel_init);
  if (v4)
  {
    v5 = 4 * a3->var3;
    v6 = (float *)malloc_type_calloc(1uLL, v5, 0x6E163958uLL);
    v4->_nits = v6;
    memcpy(v6, a3->var0, v5);
    v7 = 4 * a3->var3;
    v8 = (float *)malloc_type_calloc(1uLL, v7, 0xA6D0F52BuLL);
    v4->_apl = v8;
    memcpy(v8, a3->var1, v7);
    v4->_n = a3->var3;
    v9 = *(_QWORD *)a3->var2;
    v4->_weights[2] = a3->var2[2];
    *(_QWORD *)v4->_weights = v9;
  }
  return v4;
}

- (const)nitsTable
{
  return self->_nits;
}

- (const)averagePixelTable
{
  return self->_apl;
}

- (unint64_t)tableSize
{
  return self->_n;
}

- (const)rgbWeights
{
  return self->_weights;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  free(self->_nits);
  free(self->_apl);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayPixelConstraints;
  -[CADisplayPixelConstraints dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  void *v3;
  unint64_t v4;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;

  if (!self->_n)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p; no constraints>"),
                         objc_opt_class(),
                         self);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p; nits ["), objc_opt_class(), self);
  if (self->_n == 1)
  {
    v4 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%f, "), self->_nits[v6]);
      v6 = v7;
      v4 = self->_n - 1;
      v8 = v4 > v7++;
    }
    while (v8);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("%f] averagePixel ["), self->_nits[v4]);
  if (self->_n == 1)
  {
    v9 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 1;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%f, "), self->_apl[v10]);
      v10 = v11;
      v9 = self->_n - 1;
      v8 = v9 > v11++;
    }
    while (v8);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("%f]>"), self->_apl[v9]);
  return (NSString *)v3;
}

@end
