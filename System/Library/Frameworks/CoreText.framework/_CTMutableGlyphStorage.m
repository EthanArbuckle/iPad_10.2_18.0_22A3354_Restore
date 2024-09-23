@implementation _CTMutableGlyphStorage

- (void)setAdvance:(CGSize)a3 atIndex:(int64_t)a4
{
  -[CTGlyphStorageInterface setAdvance:forIndex:](self->_interface, "setAdvance:forIndex:", a4, a3.width, a3.height);
}

- (BOOL)hasCustomAdvances
{
  return self->_hasCustomAdvances;
}

- (void)sync
{
  int64_t count;
  id AssociatedObject;
  int64_t v5;

  count = self->super._count;
  self->super._count = self->_interface->_glyphCount;
  self->super._glyphs = self->_interface->_glyphs;
  self->super._advances = self->_interface->_advances;
  self->super._props = self->_interface->_props;
  self->super._stringIndices = self->_interface->_stringIndexes;
  if (!self->_implementsOrigins)
  {
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      v5 = self->super._count;
      if (v5 > count)
        objc_msgSend(AssociatedObject, "setLength:", 16 * v5);
    }
  }
}

- (void)resetOrigins:(id)a3
{
  int64_t var1;
  int64_t var0;
  id AssociatedObject;
  uint64_t v6;
  _OWORD *v7;
  unint64_t v8;
  _OWORD *v9;

  if (!self->_implementsOrigins)
  {
    var1 = a3.var1;
    var0 = a3.var0;
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      v6 = objc_msgSend(AssociatedObject, "mutableBytes");
      if (var1 >= 1)
      {
        v7 = (_OWORD *)(v6 + 16 * var0);
        v8 = var1 + 1;
        v9 = (_OWORD *)MEMORY[0x1E0C9D538];
        do
        {
          *v7++ = *v9;
          --v8;
        }
        while (v8 > 1);
      }
    }
  }
}

- (void)refCon
{
  return self->_interface;
}

- (int64_t)attachmentCountAtIndex:(int64_t)a3
{
  int64_t *absorbedCounts;

  absorbedCounts = self->_interface->_absorbedCounts;
  if (absorbedCounts)
    return absorbedCounts[a3];
  else
    return 0;
}

- (_CTMutableGlyphStorage)initWithInterface:(id)a3 options:(unsigned int)a4
{
  char v4;
  uint64_t v6;
  _CTMutableGlyphStorage *v7;
  _CTMutableGlyphStorage *v8;
  objc_super v10;

  if (a3)
  {
    v4 = a4;
    v6 = *((_QWORD *)a3 + 1);
    v10.receiver = self;
    v10.super_class = (Class)_CTMutableGlyphStorage;
    v7 = -[_CTGlyphStorage initWithCount:](&v10, sel_initWithCount_, v6);
    v8 = v7;
    if (v7)
    {
      v7->_interface = (CTGlyphStorageInterface *)a3;
      v7->super._glyphs = (const unsigned __int16 *)*((_QWORD *)a3 + 2);
      v7->super._advances = (const CGSize *)*((_QWORD *)a3 + 3);
      v7->super._props = (const unsigned int *)*((_QWORD *)a3 + 4);
      v7->super._stringIndices = (const int64_t *)*((_QWORD *)a3 + 5);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8->_implementsOrigins = 1;
      if ((v4 & 1) != 0)
        v8->_hasCustomAdvances = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8->_implementsCustomAdvancesForIndexes = 1;
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (_CTMutableGlyphStorage)initWithInterface:(id)a3
{
  return -[_CTMutableGlyphStorage initWithInterface:options:](self, "initWithInterface:options:", a3, 0);
}

- (id)copyWithRange:(id)a3
{
  int64_t var1;
  int64_t var0;
  __CTGlyphStorage *v6;
  id AssociatedObject;
  uint64_t v8;
  void *v9;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[CTGlyphStorageInterface createCopy:](self->_interface, "createCopy:");
  if (!self->_implementsOrigins)
  {
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      v8 = objc_msgSend(AssociatedObject, "bytes");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", v8 + 16 * var0, 16 * var1);
      objc_setAssociatedObject(v6, (const void *)sOriginsAssociationKey, v9, (void *)0x301);

    }
  }
  return v6;
}

- (CGSize)customAdvanceForIndex:(int64_t)a3
{
  double v3;
  double v4;
  __int128 v5;
  CGSize result;

  if ((__int16)self->super._glyphs[a3] == -1)
  {
    v5 = *MEMORY[0x1E0C9D820];
  }
  else
  {
    *(_QWORD *)&v5 = -1;
    *((_QWORD *)&v5 + 1) = -1;
    -[CTGlyphStorageInterface getCustomAdvance:forIndex:](self->_interface, "getCustomAdvance:forIndex:", &v5, a3);
  }
  v4 = *((double *)&v5 + 1);
  v3 = *(double *)&v5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)getCustomAdvances:(CGSize *)a3 forIndexes:(const int64_t *)a4 count:(int64_t)a5
{
  if (self->_implementsCustomAdvancesForIndexes)
    -[CTGlyphStorageInterface getCustomAdvances:forIndexes:count:](self->_interface, "getCustomAdvances:forIndexes:count:", a3, a4, a5);
}

- (void)setAttachmentCount:(int64_t)a3 atIndex:(int64_t)a4
{
  -[CTGlyphStorageInterface setAbsorbedCount:forIndex:](self->_interface, "setAbsorbedCount:forIndex:", a3, a4);
}

- (CGPoint)originAtIndex:(int64_t)a3
{
  CGPoint *origins;
  double *p_x;
  id AssociatedObject;
  double v7;
  double v8;
  CGPoint result;

  if (self->_implementsOrigins)
  {
    origins = self->_interface->_origins;
    if (origins)
      p_x = &origins[a3].x;
    else
      p_x = (double *)MEMORY[0x1E0C9D538];
  }
  else
  {
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
      p_x = (double *)(objc_msgSend(AssociatedObject, "bytes") + 16 * a3);
    else
      p_x = (double *)MEMORY[0x1E0C9D538];
  }
  v7 = *p_x;
  v8 = p_x[1];
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setOrigin:(CGPoint)a3 atIndex:(int64_t)a4
{
  double y;
  double x;
  id AssociatedObject;
  double *v9;
  BOOL v10;

  y = a3.y;
  x = a3.x;
  if (self->_implementsOrigins)
  {
    -[CTGlyphStorageInterface setOrigin:forIndex:](self->_interface, "setOrigin:forIndex:", a4, a3.x, a3.y);
  }
  else
  {
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject
      || (x == *MEMORY[0x1E0C9D538] ? (v10 = y == *(double *)(MEMORY[0x1E0C9D538] + 8)) : (v10 = 0),
          !v10
       && (AssociatedObject = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 16 * self->_interface->_glyphCount), objc_setAssociatedObject(self, (const void *)sOriginsAssociationKey, AssociatedObject, (void *)0x301), AssociatedObject, AssociatedObject)))
    {
      v9 = (double *)(objc_msgSend(AssociatedObject, "mutableBytes") + 16 * a4);
      *v9 = x;
      v9[1] = y;
    }
  }
}

- (void)setProps:(unsigned int)a3 atIndex:(int64_t)a4
{
  -[CTGlyphStorageInterface setProps:forIndex:](self->_interface, "setProps:forIndex:", *(_QWORD *)&a3, a4);
}

- (void)setGlyph:(unsigned __int16)a3 atIndex:(int64_t)a4
{
  -[CTGlyphStorageInterface setGlyphID:forIndex:](self->_interface, "setGlyphID:forIndex:", a3, a4);
}

- (void)setStringIndex:(int64_t)a3 atIndex:(int64_t)a4
{
  -[CTGlyphStorageInterface setStringIndex:forIndex:](self->_interface, "setStringIndex:forIndex:", a3, a4);
}

- (void)puntStringIndicesInRange:(id)a3 by:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t var0;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a4 && a3.var1 >= 1)
  {
    v16 = v9;
    v17 = v8;
    v18 = v7;
    v19 = v6;
    v20 = v5;
    v21 = v4;
    v22 = v10;
    v23 = v11;
    var0 = a3.var0;
    v15 = a3.var0 + a3.var1;
    do
    {
      -[CTGlyphStorageInterface setStringIndex:forIndex:](self->_interface, "setStringIndex:forIndex:", self->_interface->_stringIndexes[var0] + a4, var0, v16, v17, v18, v19, v20, v21, v22, v23);
      ++var0;
    }
    while (var0 < v15);
  }
}

- (void)insertGlyphsAtRange:(id)a3
{
  int64_t var1;
  int64_t var0;
  CTGlyphStorageInterface *interface;
  int64_t glyphCount;
  id AssociatedObject;
  void *v9;
  uint64_t v10;

  var1 = a3.var1;
  var0 = a3.var0;
  interface = self->_interface;
  glyphCount = interface->_glyphCount;
  -[CTGlyphStorageInterface insertGlyphs:](interface, "insertGlyphs:", a3.var0 - 1);
  if (!self->_implementsOrigins)
  {
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      v9 = AssociatedObject;
      objc_msgSend(AssociatedObject, "setLength:", 16 * (glyphCount + var1));
      v10 = objc_msgSend(v9, "mutableBytes");
      if (glyphCount - var0 >= 1)
        memmove((void *)(v10 + 16 * (var0 + var1)), (const void *)(v10 + 16 * var0), 16 * (glyphCount - var0));
    }
  }
}

- (void)swapGlyphsAtIndex:(int64_t)a3 withIndex:(int64_t)a4
{
  id AssociatedObject;
  uint64_t v8;
  __int128 v9;

  -[CTGlyphStorageInterface swapGlyph:withIndex:](self->_interface, "swapGlyph:withIndex:");
  if (!self->_implementsOrigins)
  {
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      v8 = objc_msgSend(AssociatedObject, "mutableBytes");
      v9 = *(_OWORD *)(v8 + 16 * a3);
      *(_OWORD *)(v8 + 16 * a3) = *(_OWORD *)(v8 + 16 * a4);
      *(_OWORD *)(v8 + 16 * a4) = v9;
    }
  }
}

- (void)moveGlyphsFromRange:(id)a3 toIndex:(int64_t)a4
{
  int64_t var1;
  int64_t var0;
  id AssociatedObject;
  uint64_t v9;

  var1 = a3.var1;
  var0 = a3.var0;
  -[CTGlyphStorageInterface moveGlyphsTo:from:](self->_interface, "moveGlyphsTo:from:", a4, a3.var0, a3.var1);
  if (!self->_implementsOrigins)
  {
    AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      v9 = objc_msgSend(AssociatedObject, "mutableBytes");
      memmove((void *)(v9 + 16 * a4), (const void *)(v9 + 16 * var0), 16 * var1);
    }
  }
}

- (void)initGlyphStackWithCapacity:(int64_t)a3
{
  -[CTGlyphStorageInterface initGlyphStack:](self->_interface, "initGlyphStack:", a3);
}

- (void)pushGlyphAtIndex:(int64_t)a3
{
  -[CTGlyphStorageInterface pushGlyph:](self->_interface, "pushGlyph:", a3);
}

- (void)popGlyphAtIndex:(int64_t)a3
{
  -[CTGlyphStorageInterface popGlyph:](self->_interface, "popGlyph:", a3);
}

- (void)disposeGlyphStack
{
  -[CTGlyphStorageInterface disposeGlyphStack](self->_interface, "disposeGlyphStack");
}

- (BOOL)implementsOrigins
{
  return self->_implementsOrigins;
}

- (BOOL)implementsCustomAdvancesForIndexes
{
  return self->_implementsCustomAdvancesForIndexes;
}

@end
