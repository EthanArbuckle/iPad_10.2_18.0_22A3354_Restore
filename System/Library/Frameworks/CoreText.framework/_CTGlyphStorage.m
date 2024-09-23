@implementation _CTGlyphStorage

- (_CTGlyphStorage)initWithCount:(int64_t)a3
{
  _CTGlyphStorage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CTGlyphStorage;
  result = -[_CTGlyphStorage init](&v5, sel_init);
  if (result)
    result->_count = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int64_t count;
  uint64_t v6;
  const CGSize *advances;
  const double *advanceWidths;
  uint64_t v9;
  double *v10;
  const unsigned __int16 *glyphs;
  unsigned __int16 *v12;
  double *v13;
  double *i;
  double v15;
  double v16;
  double *p_width;
  double *v18;
  BOOL v19;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    count = self->_count;
    if (count == *((_QWORD *)a3 + 1))
    {
      if (count < 1)
        return 1;
      v6 = 0;
      advanceWidths = self->_advanceWidths;
      advances = self->_advances;
      v10 = (double *)*((_QWORD *)a3 + 3);
      v9 = *((_QWORD *)a3 + 4);
      glyphs = self->_glyphs;
      v12 = (unsigned __int16 *)*((_QWORD *)a3 + 2);
      v13 = (double *)(v9 + 8);
      for (i = &advances->height; ; i += 2)
      {
        v15 = 0.0;
        v16 = 0.0;
        p_width = (double *)advanceWidths;
        if (advances)
        {
          p_width = &advances[v6].width;
          v16 = *i;
        }
        v18 = v10;
        if (v9)
        {
          v18 = (double *)(v9 + 16 * v6);
          v15 = *v13;
        }
        v19 = *p_width == *v18 && v16 == v15;
        if (!v19 || *glyphs != *v12)
          break;
        ++v6;
        ++v12;
        ++glyphs;
        ++v10;
        v13 += 2;
        ++advanceWidths;
        if (!--count)
          return 1;
      }
    }
  }
  return 0;
}

- (id)copyWithRange:(id)a3
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage copyWithRange:]", self);
  return 0;
}

- (void)refCon
{
  return 0;
}

- (const)allocatedAdvances
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage allocatedAdvances]", self);
  return 0;
}

- (int64_t)attachmentCountAtIndex:(int64_t)a3
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage attachmentCountAtIndex:]", self);
  return 0;
}

- (void)setAttachmentCount:(int64_t)a3 atIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage setAttachmentCount:atIndex:]", self);
}

- (BOOL)implementsOrigins
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage implementsOrigins]", self);
  return 0;
}

- (void)resetOrigins:(id)a3
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage resetOrigins:]", self);
}

- (CGPoint)originAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage originAtIndex:]", self);
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setOrigin:(CGPoint)a3 atIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage setOrigin:atIndex:]", self);
}

- (void)setProps:(unsigned int)a3 atIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage setProps:atIndex:]", self);
}

- (void)setGlyph:(unsigned __int16)a3 atIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage setGlyph:atIndex:]", self);
}

- (void)setAdvance:(CGSize)a3 atIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage setAdvance:atIndex:]", self);
}

- (void)setStringIndex:(int64_t)a3 atIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage setStringIndex:atIndex:]", self);
}

- (void)puntStringIndicesInRange:(id)a3 by:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage puntStringIndicesInRange:by:]", self);
}

- (void)insertGlyphsAtRange:(id)a3
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage insertGlyphsAtRange:]", self);
}

- (void)swapGlyphsAtIndex:(int64_t)a3 withIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage swapGlyphsAtIndex:withIndex:]", self);
}

- (void)moveGlyphsFromRange:(id)a3 toIndex:(int64_t)a4
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage moveGlyphsFromRange:toIndex:]", self);
}

- (void)initGlyphStackWithCapacity:(int64_t)a3
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage initGlyphStackWithCapacity:]", self);
}

- (void)pushGlyphAtIndex:(int64_t)a3
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage pushGlyphAtIndex:]", self);
}

- (void)popGlyphAtIndex:(int64_t)a3
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage popGlyphAtIndex:]", self);
}

@end
