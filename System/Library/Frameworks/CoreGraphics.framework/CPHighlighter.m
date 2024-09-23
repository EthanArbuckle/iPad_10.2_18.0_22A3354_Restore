@implementation CPHighlighter

- (CPHighlighter)initWithTextLine:(id)a3 inZone:(id)a4 ofColor:(CGColor *)a5
{
  CPHighlighter *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPHighlighter;
  result = -[CPHighlighter init](&v9, sel_init);
  if (result)
  {
    result->boundingZone = (CPZone *)a4;
    result->textLine = (CPTextLine *)a3;
    result->color = a5;
  }
  return result;
}

- (void)highlight
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  CPZone *boundingZone;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;

  v3 = -[CPTextLine charSequence](self->textLine, "charSequence");
  objc_msgSend(v3, "map:passing:", styleWithHighlight, self);
  v4 = -[CPObject parent](self->boundingZone, "parent");
  v5 = (void *)objc_msgSend(v4, "parent");
  v6 = (void *)objc_msgSend(v5, "charactersInZone");
  if (v6)
  {
    objc_msgSend(v6, "addCharsFromSequence:", v3);
  }
  else
  {
    v7 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v5, "setCharactersInZone:", v7);

  }
  v8 = -[CPObject count](self->boundingZone, "count");
  if (v8)
  {
    v9 = v8 - 1;
    do
    {
      objc_msgSend(v5, "add:", -[CPObject childAtIndex:](self->boundingZone, "childAtIndex:", v9));
      v9 = (v9 - 1);
    }
    while ((_DWORD)v9 != -1);
  }
  boundingZone = self->boundingZone;
  v11 = -[CPObject ancestorOfClass:](boundingZone, "ancestorOfClass:", objc_opt_class());
  if (v11)
  {
    v12 = v11;
    v13 = -[CPZone zoneBorders](boundingZone, "zoneBorders");
    v14 = objc_msgSend(v13, "count");
    if (v14)
    {
      v15 = 0;
      do
      {
        v16 = (void *)objc_msgSend(v13, "objectAtIndex:", v15);
        v17 = (void *)objc_msgSend(v16, "graphicObjects");
        v18 = objc_msgSend(v17, "count");
        if (v18)
        {
          v19 = 0;
          do
          {
            v20 = (void *)objc_msgSend(v17, "objectAtIndex:", v19);
            if (objc_msgSend(v20, "parent") && !objc_msgSend(v20, "user"))
              objc_msgSend(v20, "setUser:", v12);
            ++v19;
          }
          while (v18 != v19);
        }
        v21 = objc_msgSend(v16, "neighborCount");
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          do
          {
            v24 = (void *)objc_msgSend((id)objc_msgSend(v16, "neighborAtIndex:", v23), "neighborShape");
            if (!objc_msgSend(v24, "user"))
              objc_msgSend(v24, "setUser:", v12);
            v23 = (v23 + 1);
          }
          while (v22 != (_DWORD)v23);
        }
        ++v15;
      }
      while (v15 != v14);
    }
  }
  objc_msgSend(v4, "remove");
}

- (CGColor)color
{
  return self->color;
}

- (CPPDFStyle)style
{
  return self->style;
}

- (void)setStyle:(CPPDFStyle *)a3
{
  self->style = a3;
}

- (CPPDFStyle)highlightedStyle
{
  return self->highlightedStyle;
}

- (void)setHighlightedStyle:(CPPDFStyle *)a3
{
  self->highlightedStyle = a3;
}

+ (BOOL)reconstructHighlightFor:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  const void *v11;
  CPHighlighter *v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_2:
    LOBYTE(v4) = 0;
    return v4;
  }
  LODWORD(v4) = objc_msgSend(a3, "isRectangular");
  if ((_DWORD)v4)
  {
    v4 = objc_msgSend(a3, "parent");
    if (v4)
    {
      v5 = (void *)v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_2;
      v4 = objc_msgSend(v5, "parent");
      if (!v4)
        return v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_2;
      v6 = (void *)objc_msgSend(a3, "textLinesInZone");
      if (objc_msgSend(v6, "count") != 1)
        goto LABEL_2;
      if (objc_msgSend(v5, "countOfClass:", objc_opt_class()) != 1)
        goto LABEL_2;
      v7 = (void *)objc_msgSend(v6, "objectAtIndex:", 0);
      objc_msgSend(a3, "zoneBounds");
      v9 = v8;
      objc_msgSend(v7, "bounds");
      if (v9 > v10 * 3.0)
        goto LABEL_2;
      LODWORD(v4) = objc_msgSend((id)objc_msgSend(v7, "charSequence"), "map:passing:", canBeHighlighted, 0);
      if ((_DWORD)v4)
      {
        v4 = objc_msgSend(a3, "newBackgroundColor");
        if (v4)
        {
          v11 = (const void *)v4;
          v12 = -[CPHighlighter initWithTextLine:inZone:ofColor:]([CPHighlighter alloc], "initWithTextLine:inZone:ofColor:", v7, a3, v4);
          -[CPHighlighter highlight](v12, "highlight");

          CFRelease(v11);
          LOBYTE(v4) = 1;
        }
      }
    }
  }
  return v4;
}

@end
