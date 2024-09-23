@implementation CATIBitVector

- (CATIBitVector)initWithNumberOfBits:(unint64_t)a3
{
  char *v4;
  CATIBitVector *v5;
  size_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CATIBitVector;
  v4 = -[CATIBitVector init](&v8, sel_init);
  v5 = (CATIBitVector *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = xmmword_21A467590;
    v6 = vcvtps_u32_f32((float)a3 * 0.125);
    v5->_numberOfBits = a3;
    v5->_numberOfBytes = v6;
    v5->_data = (char *)malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_data);
  v3.receiver = self;
  v3.super_class = (Class)CATIBitVector;
  -[CATIBitVector dealloc](&v3, sel_dealloc);
}

- (void)setAtIndex:(unint64_t)a3
{
  self->_data[a3 >> self->_bitShift] |= 1 << (a3 % self->_bitsPerBlock);
}

- (BOOL)testAtIndex:(unint64_t)a3
{
  return (self->_data[a3 >> self->_bitShift] >> (a3 % self->_bitsPerBlock)) & 1;
}

- (id)data
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", self->_data, self->_numberOfBytes);
}

- (unint64_t)numberOfBits
{
  return self->_numberOfBits;
}

- (unint64_t)numberOfBytes
{
  return self->_numberOfBytes;
}

@end
