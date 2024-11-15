@implementation SGBloomFilterChunkInMemory

- (SGBloomFilterChunkInMemory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGBloomFilterChunkInMemory;
  return -[SGBloomFilterChunkInMemory init](&v3, sel_init);
}

- (unsigned)count
{
  return self->_count;
}

- (void)add:(id)a3
{
  if (doInsert((uint64_t)self->_buf, a3.var1.var0, 7))
    ++self->_count;
}

- (BOOL)exists:(id)a3
{
  unsigned __int8 *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  char v7;

  v3 = &self->_buf[6150 * (a3.var0 & 7)];
  if (((v3[(unint64_t)(a3.var1.var0 % 0x1806) >> 3] >> ((a3.var1.var0 % 0x1806) & 7)) & 1) == 0)
    return 0;
  v4 = 2 * a3.var1.var0;
  v5 = -1;
  while (v5 != 8)
  {
    v6 = v3[(unint64_t)(v4 % 0x1806) >> 3];
    v7 = (v4 % 0x1806) & 7;
    v4 += a3.var1.var0;
    ++v5;
    if (((v6 >> v7) & 1) == 0)
      return v5 > 8;
  }
  v5 = 9;
  return v5 > 8;
}

@end
