@implementation NUNIClassicGeometry

- (void)dealloc
{
  objc_super v3;

  free(self->_vertices);
  free(self->_indices);
  v3.receiver = self;
  v3.super_class = (Class)NUNIClassicGeometry;
  -[NUNIClassicGeometry dealloc](&v3, sel_dealloc);
}

- (int)addVertices:(const NUNIClassicVertex *)a3 count:(int)a4
{
  uint64_t vcount;
  NUNIClassicVertex *v8;

  vcount = self->_vcount;
  v8 = (NUNIClassicVertex *)malloc_type_realloc(self->_vertices, 32 * ((int)vcount + a4), 0x10000406D1CE384uLL);
  self->_vertices = v8;
  memcpy((char *)v8 + 32 * vcount, a3, 32 * a4);
  self->_vcount += a4;
  return vcount;
}

- (int)addIndices:(const unsigned __int16 *)a3 count:(int)a4 vbase:(int)a5
{
  __int16 v5;
  uint64_t icount;
  unsigned __int16 *v10;
  uint64_t v11;
  unsigned __int16 *v12;
  __int16 v13;

  v5 = a5;
  icount = self->_icount;
  v10 = (unsigned __int16 *)malloc_type_realloc(self->_indices, 2 * ((int)icount + a4), 0x1000040BDFB0063uLL);
  self->_indices = v10;
  if (a4 >= 1)
  {
    v11 = a4;
    v12 = &v10[icount];
    do
    {
      v13 = *a3++;
      *v12++ = v13 + v5;
      --v11;
    }
    while (v11);
  }
  self->_icount += a4;
  return icount;
}

- (const)vertices
{
  return self->_vertices;
}

- (const)indices
{
  return self->_indices;
}

- (int)vcount
{
  return self->_vcount;
}

- (int)icount
{
  return self->_icount;
}

@end
