@implementation CLKUICurvedPathGlyphLayoutProvider

- (CLKUICurvedPathGlyphLayoutProvider)init
{
  char *v2;
  CLKUIBezierPathStepper *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedPathGlyphLayoutProvider;
  v2 = -[CLKUICurvedPathGlyphLayoutProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CLKUIBezierPathStepper);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    *((_QWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 5) = 0;
    *((_QWORD *)v2 + 7) = 1;
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E0C9D538];
  }
  return (CLKUICurvedPathGlyphLayoutProvider *)v2;
}

- (void)setPath:(id)a3
{
  double v5;
  UIBezierPath *v6;

  v6 = (UIBezierPath *)a3;
  if (self->_path != v6)
  {
    objc_storeStrong((id *)&self->_path, a3);
    -[CLKUIBezierPathStepper setPath:](self->_pathStepper, "setPath:", v6);
    -[CLKUIBezierPathStepper totalLength](self->_pathStepper, "totalLength");
    self->_pathLength = v5;
  }

}

- (void)setUsedWidth:(double)a3
{
  double v3;

  if (self->_usedWidth != a3)
  {
    self->_usedWidth = a3;
    v3 = 0.0;
    switch(self->_textAlignment)
    {
      case 0:
        goto LABEL_5;
      case 1:
      case 3:
      case 4:
        v3 = (self->_pathLength - a3) * 0.5;
        goto LABEL_5;
      case 2:
        v3 = self->_pathLength - a3;
LABEL_5:
        self->_startOffset = v3;
        break;
      default:
        return;
    }
  }
}

- (double)maxTextWidth
{
  return self->_pathLength - self->_extraWidthForImage;
}

- (CGAffineTransform)makeTransform
{
  CLKUIBezierPathStepper *pathStepper;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  CGAffineTransform *result;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  pathStepper = self->_pathStepper;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startOffset + self->_layoutLocation.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIBezierPathStepper mapOffsetsToPathPositions:](pathStepper, "mapOffsetsToPathPositions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tangent");
  v11 = v10;

  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tangent");
  v14 = v13;

  objc_msgSend(v8, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "point");
  v17 = v16 + self->_baselineOffset * v14;

  objc_msgSend(v8, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "point");
  v20 = v19 - self->_baselineOffset * v11;

  retstr->a = v11;
  retstr->b = v14;
  retstr->c = -v14;
  retstr->d = v11;
  retstr->tx = v17;
  retstr->ty = v20;

  return result;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (double)extraWidthForImage
{
  return self->_extraWidthForImage;
}

- (void)setExtraWidthForImage:(double)a3
{
  self->_extraWidthForImage = a3;
}

- (double)usedWidth
{
  return self->_usedWidth;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (CGPoint)layoutLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_layoutLocation.x;
  y = self->_layoutLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLayoutLocation:(CGPoint)a3
{
  self->_layoutLocation = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathStepper, 0);
}

@end
