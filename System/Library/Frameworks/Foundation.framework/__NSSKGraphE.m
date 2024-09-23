@implementation __NSSKGraphE

- (void)dealloc
{
  unint64_t numV;
  uint64_t v4;
  void *v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  free(self->_edges);
  numV = self->_numV;
  if (numV)
  {
    v4 = 24 * numV - 8;
    do
    {
      v5 = *(void **)((char *)&self->_vertices->var0 + v4);
      if (v5)
        free(v5);
      v4 -= 24;
      --numV;
    }
    while (numV);
  }
  free(self->_vertices);
  v6.receiver = self;
  v6.super_class = (Class)__NSSKGraphE;
  -[__NSSKGraphE dealloc](&v6, sel_dealloc);
}

@end
