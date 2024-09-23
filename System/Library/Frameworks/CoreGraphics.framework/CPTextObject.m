@implementation CPTextObject

- (void)calculateMetrics
{
  int v3;
  int v4;
  uint64_t v5;
  id v6;
  float v7;
  double v8;
  float maxFontLineHeight;

  self->maxFontSize = 0.0;
  self->maxFontLineHeight = 0.0;
  v3 = -[CPObject count](self, "count");
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      v6 = -[CPObject childAtIndex:](self, "childAtIndex:", v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "maxFontSize");
        self->maxFontSize = fmaxf(v7, self->maxFontSize);
        objc_msgSend(v6, "maxFontLineHeight");
        *(float *)&v8 = v8;
        maxFontLineHeight = self->maxFontLineHeight;
        self->maxFontLineHeight = fmaxf(*(float *)&v8, maxFontLineHeight);
      }
      v5 = (v5 + 1);
    }
    while (v4 != (_DWORD)v5);
  }
  self->metricInfoCalculated = 1;
}

- (float)maxFontSize
{
  if (!self->metricInfoCalculated)
    -[CPTextObject calculateMetrics](self, "calculateMetrics");
  return self->maxFontSize;
}

- (double)maxFontLineHeight
{
  if (!self->metricInfoCalculated)
    -[CPTextObject calculateMetrics](self, "calculateMetrics");
  return self->maxFontLineHeight;
}

- (void)clearCachedInfo
{
  self->maxFontSize = 0.0;
  self->maxFontLineHeight = 0.0;
  self->metricInfoCalculated = 0;
}

- (void)translateObjectYBy:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPTextObject;
  -[CPChunk translateObjectYBy:](&v5, sel_translateObjectYBy_);
  self->anchor.y = self->anchor.y + a3;
}

@end
