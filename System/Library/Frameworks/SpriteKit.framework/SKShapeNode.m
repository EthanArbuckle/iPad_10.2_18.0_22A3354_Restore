@implementation SKShapeNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
  uint64_t v2;

  v2 = operator new();
  SKCNode::SKCNode((SKCNode *)v2);
  *(_QWORD *)v2 = off_1EA4FF9A0;
  *(_QWORD *)(v2 + 560) = 0;
  *(_QWORD *)(v2 + 620) = 1065353216;
  *(_QWORD *)(v2 + 632) = 0;
  *(_DWORD *)(v2 + 640) = 25;
  *(_BYTE *)(v2 + 644) = 0;
  *(_DWORD *)(v2 + 648) = -1082130432;
  *(_OWORD *)(v2 + 656) = 0u;
  *(_OWORD *)(v2 + 672) = 0u;
  *(_OWORD *)(v2 + 688) = 0u;
  *(_OWORD *)(v2 + 704) = 0u;
  *(_OWORD *)(v2 + 720) = 0u;
  *(_OWORD *)(v2 + 736) = 0u;
  *(_OWORD *)(v2 + 752) = 0u;
  *(_OWORD *)(v2 + 768) = 0u;
  return (void *)v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKShapeNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcShapeNode = -[SKNode _backingNode](self, "_backingNode");
}

+ (SKShapeNode)shapeNodeWithPath:(CGPathRef)path
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", path);
  return (SKShapeNode *)v4;
}

+ (SKShapeNode)shapeNodeWithPath:(CGPathRef)path centered:(BOOL)centered
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  const CGPath *v8;
  CGAffineTransform v10;
  CGRect PathBoundingBox;

  v4 = centered;
  objc_msgSend((id)objc_opt_class(), "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    PathBoundingBox = CGPathGetPathBoundingBox(path);
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeTranslation(&v10, -(PathBoundingBox.origin.x + PathBoundingBox.size.width * 0.5), -(PathBoundingBox.origin.y + PathBoundingBox.size.height * 0.5));
    v8 = CGPathCreateMutableCopyByTransformingPath(path, &v10);
    objc_msgSend(v7, "setPath:", v8);
    CGPathRelease(v8);
  }
  else
  {
    objc_msgSend(v6, "setPath:", path);
  }
  return (SKShapeNode *)v7;
}

+ (SKShapeNode)shapeNodeWithEllipseInRect:(CGRect)rect
{
  const CGPath *v3;
  void *v4;

  v3 = CGPathCreateWithEllipseInRect(rect, 0);
  objc_msgSend((id)objc_opt_class(), "shapeNodeWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v3);
  return (SKShapeNode *)v4;
}

+ (SKShapeNode)shapeNodeWithEllipseOfSize:(CGSize)size
{
  return (SKShapeNode *)objc_msgSend((id)objc_opt_class(), "shapeNodeWithEllipseInRect:", size.width * -0.5, size.height * -0.5, size.width, size.height);
}

+ (SKShapeNode)shapeNodeWithCircleOfRadius:(CGFloat)radius
{
  return (SKShapeNode *)objc_msgSend((id)objc_opt_class(), "shapeNodeWithEllipseOfSize:", radius + radius, radius + radius);
}

+ (SKShapeNode)shapeNodeWithRect:(CGRect)rect
{
  const CGPath *v3;
  void *v4;

  v3 = CGPathCreateWithRect(rect, 0);
  objc_msgSend((id)objc_opt_class(), "shapeNodeWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v3);
  return (SKShapeNode *)v4;
}

+ (SKShapeNode)shapeNodeWithRectOfSize:(CGSize)size
{
  return (SKShapeNode *)objc_msgSend((id)objc_opt_class(), "shapeNodeWithRect:", size.width * -0.5, size.height * -0.5, size.width, size.height);
}

+ (SKShapeNode)shapeNodeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  double width;
  double y;
  double x;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  const CGPath *v17;
  void *v18;
  uint64_t v19;

  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v7 = cornerRadius;
  v8 = rect.size.width * 0.5;
  if (v7 <= v8)
    v8 = cornerRadius;
  if (v8 < 0.0)
    v8 = 0.0;
  v9 = rect.size.height * 0.5;
  if (v7 > v9)
    v7 = rect.size.height * 0.5;
  if (v7 < 0.0)
    v7 = 0.0;
  if (((LODWORD(v8) & 0x80000000) != 0 || (LODWORD(v8) & 0x60000000) == 0)
    && ((LODWORD(v7) & 0x80000000) != 0 || (LODWORD(v7) & 0x60000000) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "shapeNodeWithRect:", x, y, width, rect.size.height);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v18 = (void *)v19;
    return (SKShapeNode *)v18;
  }
  v10 = v8;
  v11 = v7;
  v12 = -(v8 - width * 0.5);
  if ((LODWORD(v12) & 0x80000000) != 0 || (LODWORD(v12) & 0x60000000) == 0)
  {
    v13 = -(v11 - rect.size.height * 0.5);
    if ((LODWORD(v13) & 0x80000000) != 0 || (LODWORD(v13) & 0x60000000) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "shapeNodeWithEllipseInRect:", x, y, width, rect.size.height);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = CGPathCreateWithRoundedRect(rect, v10, v11, 0);
  objc_msgSend((id)objc_opt_class(), "shapeNodeWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v17);
  return (SKShapeNode *)v18;
}

+ (SKShapeNode)shapeNodeWithRectOfSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
  return (SKShapeNode *)objc_msgSend((id)objc_opt_class(), "shapeNodeWithRect:cornerRadius:", size.width * -0.5, size.height * -0.5, size.width, size.height, cornerRadius);
}

+ (SKShapeNode)shapeNodeWithTriangleA:(CGPoint)a3 B:(CGPoint)a4 C:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGPath *Mutable;
  void *v11;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.x;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v9, v7);
  CGPathAddLineToPoint(Mutable, 0, v8, v7);
  CGPathAddLineToPoint(Mutable, 0, x, y);
  CGPathCloseSubpath(Mutable);
  objc_msgSend((id)objc_opt_class(), "node");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPath:", Mutable);
  CGPathRelease(Mutable);
  return (SKShapeNode *)v11;
}

+ (SKShapeNode)shapeNodeWithPoints:(CGPoint *)points count:(size_t)numPoints
{
  CGPath *Mutable;
  CGPath *v7;
  CGFloat x;
  CGFloat *p_y;
  CGFloat y;
  void *v11;

  Mutable = CGPathCreateMutable();
  v7 = Mutable;
  if (numPoints)
  {
    x = points->x;
    y = points->y;
    p_y = &points->y;
    CGPathMoveToPoint(Mutable, 0, x, y);
    do
    {
      CGPathAddLineToPoint(v7, 0, *(p_y - 1), *p_y);
      p_y += 2;
      --numPoints;
    }
    while (numPoints);
  }
  objc_msgSend((id)objc_opt_class(), "node");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPath:", v7);
  CGPathRelease(v7);
  return (SKShapeNode *)v11;
}

+ (SKShapeNode)shapeNodeWithSplinePoints:(CGPoint *)points count:(size_t)numPoints
{
  double y;
  double x;
  CGPath *Mutable;
  CGPath *v9;
  uint64_t v10;
  CGFloat *p_y;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  Mutable = CGPathCreateMutable();
  v9 = Mutable;
  if (numPoints)
  {
    x = points->x;
    y = points->y;
    CGPathMoveToPoint(Mutable, 0, points->x, y);
  }
  v10 = 0;
  p_y = &points->y;
  v12 = y;
  v13 = x;
  v14 = x;
  v15 = y;
  do
  {
    v16 = v15;
    v17 = v14;
    if (numPoints != v10)
    {
      v14 = *(p_y - 1);
      v15 = *p_y;
    }
    if (v10)
    {
      if (CGPathIsEmpty(v9))
        CGPathMoveToPoint(v9, 0, v14, v15);
      else
        CGPathAddCurveToPoint(v9, 0, (v17 - (x - v13 * 6.0)) * 0.166666667, (v16 - (y - v12 * 6.0)) * 0.166666667, (v13 + v17 * 6.0 - v14) * 0.166666667, (v12 + v16 * 6.0 - v15) * 0.166666667, v17, v16);
    }
    ++v10;
    p_y += 2;
    y = v12;
    x = v13;
    v12 = v16;
    v13 = v17;
  }
  while (numPoints + 1 != v10);
  objc_msgSend((id)objc_opt_class(), "node");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPath:", v9);
  CGPathRelease(v9);
  return (SKShapeNode *)v18;
}

- (BOOL)isEqualToNode:(id)a3
{
  SKShapeNode *v4;
  SKShapeNode *v5;
  id v6;
  CGColor *v7;
  id v8;
  id v9;
  CGColor *v10;
  id v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  _BOOL4 v20;
  BOOL v21;
  SKBlendMode v23;
  objc_super v24;

  v4 = (SKShapeNode *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v24.receiver = self;
      v24.super_class = (Class)SKShapeNode;
      if (-[SKNode isEqualToNode:](&v24, sel_isEqualToNode_, v5)
        && CGPathEqualToPath(-[SKShapeNode path](self, "path"), -[SKShapeNode path](v5, "path")))
      {
        -[SKShapeNode fillColor](self, "fillColor");
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v7 = (CGColor *)objc_msgSend(v6, "CGColor");
        -[SKShapeNode fillColor](v5, "fillColor");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (CGColorEqualToColor(v7, (CGColorRef)objc_msgSend(v8, "CGColor")))
        {
          -[SKShapeNode strokeColor](self, "strokeColor");
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v10 = (CGColor *)objc_msgSend(v9, "CGColor");
          -[SKShapeNode strokeColor](v5, "strokeColor");
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          if (!CGColorEqualToColor(v10, (CGColorRef)objc_msgSend(v11, "CGColor")))
            goto LABEL_10;
          -[SKShapeNode lineWidth](self, "lineWidth");
          v13 = v12;
          -[SKShapeNode lineWidth](v5, "lineWidth");
          v14 = v13;
          *(float *)&v15 = v15;
          if ((COERCE_UNSIGNED_INT(v14 - *(float *)&v15) & 0x60000000) != 0)
            goto LABEL_10;
          -[SKShapeNode glowWidth](self, "glowWidth");
          v17 = v16;
          -[SKShapeNode glowWidth](v5, "glowWidth");
          v18 = v17;
          *(float *)&v19 = v19;
          if ((COERCE_UNSIGNED_INT(v18 - *(float *)&v19) & 0x60000000) == 0
            && (v20 = -[SKShapeNode isAntialiased](self, "isAntialiased"),
                v20 == -[SKShapeNode isAntialiased](v5, "isAntialiased")))
          {
            v23 = -[SKShapeNode blendMode](self, "blendMode");
            v21 = v23 == -[SKShapeNode blendMode](v5, "blendMode");
          }
          else
          {
LABEL_10:
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (void)_initialize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  -[SKShapeNode setPath:](self, "setPath:", 0);
  -[SKShapeNode setAntialiased:](self, "setAntialiased:", 1);
  -[SKShapeNode setGlowWidth:](self, "setGlowWidth:", 0.0);
  LODWORD(v3) = 1065353216;
  LODWORD(v4) = 1065353216;
  LODWORD(v5) = 1065353216;
  LODWORD(v6) = 1065353216;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShapeNode setStrokeColor:](self, "setStrokeColor:", v7);

  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShapeNode setFillColor:](self, "setFillColor:", v12);

  -[SKShapeNode setLineCap:](self, "setLineCap:", 0);
  -[SKShapeNode setLineJoin:](self, "setLineJoin:", 2);
  -[SKShapeNode setMiterLimit:](self, "setMiterLimit:", 0.5);
}

- (SKShapeNode)init
{
  SKShapeNode *v2;
  SKShapeNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKShapeNode;
  v2 = -[SKNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKShapeNode _initialize](v2, "_initialize");
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SKShapeNode;
  -[SKNode encodeWithCoder:](&v19, sel_encodeWithCoder_, v4);
  PKArrayFromCGPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_cgPath"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 155));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_lineWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 156));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_smoothWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)self->_skcShapeNode + 644));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_smoothStroke"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 148));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_fillColorR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 149));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_fillColorG"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 150));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_fillColorB"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 151));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_fillColorA"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 144));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_strokeColorR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 145));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_strokeColorG"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 146));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_strokeColorB"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)self->_skcShapeNode + 147));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_strokeColorA"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SKShapeNode lineJoin](self, "lineJoin"), CFSTR("_lineJoin"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKShapeNode lineCap](self, "lineCap"), CFSTR("_lineCap"));
  -[SKShapeNode miterLimit](self, "miterLimit");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_miterLimit"));
  -[SKShapeNode strokeTexture](self, "strokeTexture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("_strokeTexture"));

  -[SKShapeNode fillTexture](self, "fillTexture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("_fillTexture"));

}

- (SKShapeNode)initWithCoder:(id)a3
{
  id v4;
  SKShapeNode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const CGPath *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v51;
  _QWORD v52[8];

  v52[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SKShapeNode;
  v5 = -[SKNode initWithCoder:](&v51, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    v52[2] = objc_opt_class();
    v52[3] = objc_opt_class();
    v52[4] = objc_opt_class();
    v52[5] = objc_opt_class();
    v52[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_cgPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const CGPath *)PKCGPathCreateFromArray();

    -[SKShapeNode setPath:](v5, "setPath:", v10);
    CGPathRelease(v10);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smoothWidth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    -[SKShapeNode setGlowWidth:](v5, "setGlowWidth:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lineWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[SKShapeNode setLineWidth:](v5, "setLineWidth:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smoothStroke"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKShapeNode setAntialiased:](v5, "setAntialiased:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fillColorR"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fillColorG"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fillColorB"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fillColorA"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    *(float *)&v26 = v16;
    *(float *)&v27 = v19;
    *(float *)&v28 = v22;
    *(float *)&v29 = v25;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKShapeNode setFillColor:](v5, "setFillColor:", v30);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_strokeColorR"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_strokeColorG"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_strokeColorB"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v39 = v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_strokeColorA"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v42 = v41;

    *(float *)&v43 = v33;
    *(float *)&v44 = v36;
    *(float *)&v45 = v39;
    *(float *)&v46 = v42;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKShapeNode setStrokeColor:](v5, "setStrokeColor:", v47);

    -[SKShapeNode setLineJoin:](v5, "setLineJoin:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_lineJoin")));
    -[SKShapeNode setLineCap:](v5, "setLineCap:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_lineCap")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_miterLimit"));
    -[SKShapeNode setMiterLimit:](v5, "setMiterLimit:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_strokeTexture"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKShapeNode setStrokeTexture:](v5, "setStrokeTexture:", v48);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fillTexture"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKShapeNode setFillTexture:](v5, "setFillTexture:", v49);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGRect v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SKNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode calculateAccumulatedFrame](self, "calculateAccumulatedFrame");
  NSStringFromCGRect(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SKShapeNode> name:'%@' accumulatedFrame:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGPathRef)path
{
  return (CGPathRef)*((_QWORD *)self->_skcShapeNode + 79);
}

- (void)setPath:(CGPathRef)path
{
  const CGPath *v4;
  void *skcShapeNode;
  const CGPath *v6;
  SKCompositeBezierPath *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int32x2_t v13;
  float *v14;
  float *v15;
  float v16;
  BOOL v17;
  void *v18;
  const CGPath *v19;
  SKCompositeBezierPath *v20;

  if (path)
  {
    v4 = (const CGPath *)MEMORY[0x1DF0CEF24](path, a2);
    skcShapeNode = self->_skcShapeNode;
    v6 = (const CGPath *)*((_QWORD *)skcShapeNode + 79);
    if (v6)
    {
      CGPathRelease(v6);
      skcShapeNode = self->_skcShapeNode;
    }
    *((_QWORD *)skcShapeNode + 79) = v4;
    v7 = (SKCompositeBezierPath *)*((_QWORD *)self->_skcShapeNode + 70);
    if (v7)
    {
      SKCompositeBezierPath::~SKCompositeBezierPath(v7);
      MEMORY[0x1DF0CF560]();
    }
    v8 = operator new();
    *(_BYTE *)v8 = 0;
    *(_QWORD *)(v8 + 4) = 0;
    *(_QWORD *)(v8 + 24) = 0;
    *(_QWORD *)(v8 + 32) = 0;
    *(_QWORD *)(v8 + 16) = 0;
    v9 = operator new();
    *(_WORD *)v9 = 0;
    *(_QWORD *)(v9 + 4) = 0;
    *(_QWORD *)(v9 + 24) = 0;
    *(_QWORD *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 16) = 0;
    v10 = (uint64_t *)operator new(8uLL);
    *(_QWORD *)(v8 + 16) = v10;
    *v10++ = v9;
    *(_QWORD *)(v8 + 24) = v10;
    *(_QWORD *)(v8 + 32) = v10;
    CGPathApply(v4, (void *)v8, (CGPathApplierFunction)SKCompositeBezierPathPathApplyCGPath);
    v11 = *(_QWORD *)(v8 + 24);
    if (v11 != *(_QWORD *)(v8 + 16))
    {
      v12 = *(_QWORD *)(v11 - 8);
      if (!*(_BYTE *)v12)
      {
        v13 = *(int32x2_t *)(v12 + 4);
        *(int32x2_t *)(v8 + 4) = vadd_s32(*(int32x2_t *)(v8 + 4), v13);
        if (v13.i32[0] >= 1)
        {
          v14 = *(float **)(v12 + 16);
          v15 = &v14[6 * v13.i32[0]];
          v16 = v15[1];
          v17 = *v14 == *v15;
          if (v14[1] != v16)
            v17 = 0;
          *(_BYTE *)(v12 + 1) = v17;
        }
        *(_BYTE *)v12 = 1;
      }
    }
    *(_BYTE *)v8 = 1;
  }
  else
  {
    v18 = self->_skcShapeNode;
    v19 = (const CGPath *)*((_QWORD *)v18 + 79);
    if (v19)
    {
      CGPathRelease(v19);
      v18 = self->_skcShapeNode;
    }
    v20 = (SKCompositeBezierPath *)*((_QWORD *)v18 + 70);
    if (v20)
    {
      SKCompositeBezierPath::~SKCompositeBezierPath(v20);
      MEMORY[0x1DF0CF560]();
      v18 = self->_skcShapeNode;
    }
    v8 = 0;
    *((_QWORD *)v18 + 79) = 0;
  }
  *((_QWORD *)self->_skcShapeNode + 70) = v8;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  _QWORD *skcShapeNode;
  const CGPath *v5;
  float x;
  float y;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  CGPoint v12;
  CGFloat v13;
  const CGPath *CopyByStrokingPath;
  CGPoint v16;
  CGFloat v17;
  BOOL v18;
  float v19;
  float v20;
  float32x2_t v21;

  skcShapeNode = self->_skcShapeNode;
  v5 = (const CGPath *)skcShapeNode[79];
  x = a3.x;
  v19 = x;
  y = a3.y;
  v20 = y;
  *(double *)v8.i64 = (*(double (**)(_QWORD *, SEL))(*skcShapeNode + 112))(skcShapeNode, a2);
  v21 = (float32x2_t)vaddq_f32(v11, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v8, v19), v9, v20), (float32x4_t)0, v10)).u64[0];
  if (SKCShapeNode::shouldFill((SKCShapeNode *)self->_skcShapeNode))
  {
    v12 = (CGPoint)vcvtq_f64_f32(v21);
    v13 = v12.y;
    return CGPathContainsPoint(v5, 0, v12, 1);
  }
  else
  {
    CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v5, 0, (float)(*((float *)self->_skcShapeNode + 155) + *((float *)self->_skcShapeNode + 155)), (CGLineCap)*((_DWORD *)self->_skcShapeNode + 153), (CGLineJoin)*((_DWORD *)self->_skcShapeNode + 152), *((float *)self->_skcShapeNode + 154));
    v16 = (CGPoint)vcvtq_f64_f32(v21);
    v17 = v16.y;
    v18 = CGPathContainsPoint(v5, 0, v16, 1);
    CGPathRelease(CopyByStrokingPath);
    return v18;
  }
}

- (CGFloat)glowWidth
{
  return *((float *)self->_skcShapeNode + 156);
}

- (void)setGlowWidth:(CGFloat)glowWidth
{
  float v3;
  float *skcShapeNode;

  if (glowWidth < 0.0)
    glowWidth = 0.0;
  v3 = glowWidth;
  skcShapeNode = (float *)self->_skcShapeNode;
  skcShapeNode[156] = v3;
  SKCNode::setDirty((SKCNode *)skcShapeNode);
}

- (SKTexture)fillTexture
{
  return (SKTexture *)*((id *)self->_skcShapeNode + 83);
}

- (void)setFillTexture:(SKTexture *)fillTexture
{
  SKTexture *v5;

  objc_storeStrong((id *)self->_skcShapeNode + 83, fillTexture);
  v5 = fillTexture;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);

}

- (void)setFillShader:(SKShader *)fillShader
{
  SKShader *v5;

  v5 = fillShader;
  objc_msgSend(*((id *)self->_skcShapeNode + 85), "_removeTargetNode:", self);
  objc_storeStrong((id *)self->_skcShapeNode + 85, fillShader);
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
  SKCNode::recomputeFlags((SKCNode *)self->_skcShapeNode, 1);
  -[SKShader _addTargetNode:](v5, "_addTargetNode:", self);

}

- (SKShader)fillShader
{
  return (SKShader *)*((id *)self->_skcShapeNode + 85);
}

- (void)setStrokeTexture:(SKTexture *)strokeTexture
{
  SKTexture *v5;

  objc_storeStrong((id *)self->_skcShapeNode + 82, strokeTexture);
  v5 = strokeTexture;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);

}

- (SKTexture)strokeTexture
{
  return (SKTexture *)*((id *)self->_skcShapeNode + 82);
}

- (void)setStrokeShader:(SKShader *)strokeShader
{
  SKShader *v5;

  v5 = strokeShader;
  objc_msgSend(*((id *)self->_skcShapeNode + 84), "_removeTargetNode:", self);
  objc_storeStrong((id *)self->_skcShapeNode + 84, strokeShader);
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
  SKCNode::recomputeFlags((SKCNode *)self->_skcShapeNode, 1);
  -[SKShader _addTargetNode:](v5, "_addTargetNode:", self);

}

- (SKShader)strokeShader
{
  return (SKShader *)*((id *)self->_skcShapeNode + 84);
}

- (double)renderQualityRatio
{
  return 1.0;
}

- (SKBlendMode)blendMode
{
  return *((_QWORD *)self->super._skcNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
  SKCNode::setBlendMode((SKCNode *)self->super._skcNode, blendMode);
}

- (BOOL)isAntialiased
{
  return *((_BYTE *)self->_skcShapeNode + 644);
}

- (void)setAntialiased:(BOOL)antialiased
{
  SKCNode *skcShapeNode;

  skcShapeNode = (SKCNode *)self->_skcShapeNode;
  *((_BYTE *)skcShapeNode + 644) = antialiased;
  SKCNode::setDirty(skcShapeNode);
}

- (CGFloat)lineWidth
{
  return *((float *)self->_skcShapeNode + 155);
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  float v3;
  float *skcShapeNode;

  v3 = lineWidth;
  skcShapeNode = (float *)self->_skcShapeNode;
  skcShapeNode[155] = v3;
  SKCNode::setDirty((SKCNode *)skcShapeNode);
}

- (UIColor)fillColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)self->_skcShapeNode + 148), *((float *)self->_skcShapeNode + 149), *((float *)self->_skcShapeNode + 150), *((float *)self->_skcShapeNode + 151));
}

- (void)setFillColor:(UIColor *)fillColor
{
  __int128 v4;
  UIColor *v5;

  v5 = fillColor;
  -[UIColor vectorRGBA](v5, "vectorRGBA");
  *((_OWORD *)self->_skcShapeNode + 37) = v4;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);

}

- (UIColor)strokeColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)self->_skcShapeNode + 144), *((float *)self->_skcShapeNode + 145), *((float *)self->_skcShapeNode + 146), *((float *)self->_skcShapeNode + 147));
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  __int128 v4;
  UIColor *v5;

  v5 = strokeColor;
  -[UIColor vectorRGBA](v5, "vectorRGBA");
  *((_OWORD *)self->_skcShapeNode + 36) = v4;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);

}

- (void)setLineCap:(CGLineCap)lineCap
{
  SKCNode *skcShapeNode;

  skcShapeNode = (SKCNode *)self->_skcShapeNode;
  *((_DWORD *)skcShapeNode + 153) = lineCap;
  SKCNode::setDirty(skcShapeNode);
}

- (CGLineCap)lineCap
{
  return *((_DWORD *)self->_skcShapeNode + 153);
}

- (void)setLineJoin:(CGLineJoin)lineJoin
{
  SKCNode *skcShapeNode;

  skcShapeNode = (SKCNode *)self->_skcShapeNode;
  *((_DWORD *)skcShapeNode + 152) = lineJoin;
  SKCNode::setDirty(skcShapeNode);
}

- (CGLineJoin)lineJoin
{
  return *((_DWORD *)self->_skcShapeNode + 152);
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  float v3;
  float *skcShapeNode;

  v3 = miterLimit;
  skcShapeNode = (float *)self->_skcShapeNode;
  skcShapeNode[154] = v3;
  SKCNode::setDirty((SKCNode *)skcShapeNode);
}

- (CGFloat)miterLimit
{
  return *((float *)self->_skcShapeNode + 154);
}

- (CGFloat)lineLength
{
  return SKCShapeNode::strokeLength((SKCShapeNode *)self->_skcShapeNode);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKShapeNode;
  v4 = -[SKNode copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPath:", -[SKShapeNode path](self, "path"));
  -[SKShapeNode fillColor](self, "fillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillColor:", v5);

  -[SKShapeNode strokeColor](self, "strokeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeColor:", v6);

  objc_msgSend(v4, "setAntialiased:", -[SKShapeNode isAntialiased](self, "isAntialiased"));
  -[SKShapeNode renderQualityRatio](self, "renderQualityRatio");
  objc_msgSend(v4, "setRenderQualityRatio:");
  -[SKShapeNode lineWidth](self, "lineWidth");
  objc_msgSend(v4, "setLineWidth:");
  -[SKShapeNode glowWidth](self, "glowWidth");
  objc_msgSend(v4, "setGlowWidth:");
  objc_msgSend(v4, "setBlendMode:", -[SKShapeNode blendMode](self, "blendMode"));
  -[SKShapeNode fillShader](self, "fillShader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillShader:", v7);

  -[SKShapeNode fillTexture](self, "fillTexture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillTexture:", v8);

  -[SKShapeNode strokeShader](self, "strokeShader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeShader:", v9);

  -[SKShapeNode strokeTexture](self, "strokeTexture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeTexture:", v10);

  objc_msgSend(v4, "setLineJoin:", -[SKShapeNode lineJoin](self, "lineJoin"));
  objc_msgSend(v4, "setLineCap:", -[SKShapeNode lineCap](self, "lineCap"));
  -[SKShapeNode miterLimit](self, "miterLimit");
  objc_msgSend(v4, "setMiterLimit:");
  return v4;
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKShapeNode;
  -[SKNode valueForAttributeNamed:](&v4, sel_valueForAttributeNamed_, key);
  return (SKAttributeValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKShapeNode;
  -[SKNode setValue:forAttributeNamed:](&v4, sel_setValue_forAttributeNamed_, value, key);
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  CFNumberRef v12;
  __CFDictionary *v13;
  CFNumberRef v14;
  __CFDictionary *v15;
  CFNumberRef v16;
  __CFDictionary *v17;
  CFNumberRef v18;
  CFNumberRef v19;
  __CFDictionary *v20;
  CFNumberRef v21;
  CFNumberRef v22;
  void *v23;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  uint64_t valuePtr;
  _QWORD v29[13];

  v29[12] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("antialiased"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v27 = Mutable;
  v29[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("fillColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("color"));
  v26 = v5;
  v29[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("fillShader"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v25 = v6;
  v29[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("glowWidth"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("color"));
  v29[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("lineWidth"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("CGf"));
  v29[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("strokeColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("color"));
  v29[5] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("strokeShader"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v29[6] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("blendMode"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("SKBlendMode"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("integer"));
  valuePtr = 1;
  v12 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v11, CFSTR("propertyOptions"), v12);
  CFRelease(v12);
  v29[7] = v11;
  v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("fillTexture"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 1;
  v14 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v13, CFSTR("propertyOptions"), v14);
  CFRelease(v14);
  v29[8] = v13;
  v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("strokeTexture"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 1;
  v16 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v15, CFSTR("propertyOptions"), v16);
  CFRelease(v16);
  v29[9] = v15;
  v17 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("visualRepresentation"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 8;
  v18 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v17, CFSTR("visibility"), v18);
  CFRelease(v18);
  valuePtr = 1;
  v19 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v17, CFSTR("propertyOptions"), v19);
  CFRelease(v19);
  v29[10] = v17;
  v20 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("visualRepresentationOffset"));
  CFDictionaryAddValue(v20, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v20, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  valuePtr = 8;
  v21 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v20, CFSTR("visibility"), v21);
  CFRelease(v21);
  valuePtr = 1;
  v22 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v20, CFSTR("propertyOptions"), v22);
  CFRelease(v22);
  v29[11] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  id v9;
  void *v10;
  CGImage *v11;
  uint64_t v12;
  CGImageDestination *v13;
  const __CFAllocator *v14;
  CFNumberRef v15;
  const __CFDictionary *v16;
  void *v17;
  uint64_t v18;
  CGImageDestination *v19;
  const __CFAllocator *v20;
  CFNumberRef v21;
  const __CFDictionary *v22;
  id v23;
  CGColor *v24;
  size_t NumberOfComponents;
  uint64_t v26;
  CFIndex v27;
  __CFString *v28;
  CFIndex v29;
  uint64_t v30;
  CGColor *v31;
  size_t v32;
  uint64_t v33;
  CFIndex v34;
  CFIndex v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  const void **v39;
  uint64_t v40;
  char v41;
  char v42;
  CFNumberRef v43;
  const CGFloat *Components;
  const void **v45;
  const void **v46;
  uint64_t v47;
  CFNumberRef *v48;
  CFArrayRef v49;
  uint64_t v50;
  CFTypeRef *v51;
  id v52;
  id v53;
  NSString *v54;
  const CGFloat *v55;
  const void **v56;
  const void **v57;
  uint64_t v58;
  CFNumberRef *v59;
  CFArrayRef v60;
  uint64_t v61;
  CFTypeRef *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSString *v68;
  id v69;
  __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  __CFString *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  CGColorSpace *space;
  CGColorSpace *spacea;
  CFStringRef value;
  CFStringRef valuea;
  id v83;
  int valuePtr;
  const __CFString *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  const __CFString *v89;
  uint64_t v90;
  void *values[3];
  void *keys;
  __CFString *v93;
  const __CFString *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v83 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("strokeTexture")))
  {
    objc_msgSend(v83, "strokeTexture");
    Mutable = (id *)objc_claimAutoreleasedReturnValue();

    if (Mutable)
    {
      objc_msgSend(v83, "strokeTexture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (CGImage *)objc_msgSend(v10, "CGImage");

      if (v11)
      {
        valuePtr = 1065353216;
        Mutable = (id *)CFDataCreateMutable(0, 0);
        v12 = *MEMORY[0x1E0CA5C10];
        v13 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
        v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
        keys = (void *)*MEMORY[0x1E0CBC780];
        values[0] = v15;
        v16 = CFDictionaryCreate(v14, (const void **)&keys, (const void **)values, 1, 0, 0);
        CGImageDestinationAddImage(v13, v11, v16);
        CGImageDestinationFinalize(v13);
        CFRelease(v16);
        CFRelease(v15);
        CFRelease(v13);
        v89 = CFSTR("propertyFormat");
        v90 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        Mutable = 0;
      }
LABEL_30:
      CGImageRelease(v11);
      goto LABEL_93;
    }
    goto LABEL_93;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("fillTexture")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("strokeColor")))
    {
      objc_msgSend(v83, "strokeColor");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = (CGColor *)objc_msgSend(v23, "CGColor");
      if (v24)
      {
        Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
        space = CGColorGetColorSpace(v24);
        value = CGColorSpaceCopyName(space);
        NumberOfComponents = CGColorGetNumberOfComponents(v24);
        v26 = NumberOfComponents << 32;
        v27 = (int)NumberOfComponents;
        if (NumberOfComponents << 32)
        {
          v28 = CFStringCreateMutable(0, 0);
          v77 = v23;
          v29 = v27 - 1;
          if ((unint64_t)v27 <= 1)
            v30 = 1;
          else
            v30 = v27;
          do
          {
            CFStringAppend(v28, CFSTR("CGf"));
            if (v29)
              CFStringAppend(v28, CFSTR(", "));
            --v29;
            --v30;
          }
          while (v30);
          v23 = v77;
        }
        else
        {
          v28 = &stru_1EA5021F8;
        }
        Components = CGColorGetComponents(v24);
        v45 = (const void **)malloc_type_malloc(v26 >> 29, 0x6004044C4A2DFuLL);
        v46 = v45;
        if (v26 >= 1)
        {
          if (v27 <= 1)
            v47 = 1;
          else
            v47 = v27;
          v48 = (CFNumberRef *)v45;
          do
          {
            *v48++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
            --v47;
          }
          while (v47);
        }
        v49 = CFArrayCreate(0, v46, v27, MEMORY[0x1E0C9B378]);
        if (v26 >= 1)
        {
          if (v27 <= 1)
            v50 = 1;
          else
            v50 = v27;
          v51 = v46;
          do
          {
            CFRelease(*v51++);
            --v50;
          }
          while (v50);
        }
        free(v46);
        CGColorSpaceGetModel(space);
        if (v49)
          CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValues"), v49);
        if (v28)
          CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValuesFormat"), v28);
        if (value)
          CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("colorSpaceName"), value);
        if (v49)
          CFRelease(v49);
        if (value)
          CFRelease(value);
        if (!v28)
          goto LABEL_92;
        goto LABEL_91;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("fillColor")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentationOffset")))
        {
          objc_msgSend(v83, "_untransformedBounds");
          keys = v37;
          v93 = v38;
          v39 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
          v40 = 0;
          v41 = 1;
          do
          {
            v42 = v41;
            v43 = CFNumberCreate(0, kCFNumberCGFloatType, &keys + v40);
            v41 = 0;
            v39[v40] = v43;
            v40 = 1;
          }
          while ((v42 & 1) != 0);
          Mutable = (id *)CFArrayCreate(0, v39, 2, MEMORY[0x1E0C9B378]);
          CFRelease(*v39);
          CFRelease(v39[1]);
          free(v39);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentation")))
        {
          objc_msgSend(v83, "createDebugHierarchyVisualRepresentation");
          Mutable = (id *)objc_claimAutoreleasedReturnValue();
          v85 = CFSTR("propertyFormat");
          v86 = *MEMORY[0x1E0CA5C10];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v52 = v83;
          v53 = v9;
          if (!objc_msgSend(v53, "length"))
            goto LABEL_103;
          NSSelectorFromString((NSString *)v53);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v54 = (NSString *)v53;
          }
          else
          {
            if ((unint64_t)objc_msgSend(v53, "length") < 2)
            {
              objc_msgSend(v53, "uppercaseString");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v53, "substringToIndex:", 1);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "uppercaseString");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "substringFromIndex:", 1);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "stringByAppendingString:", v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(CFSTR("is"), "stringByAppendingString:", v67);
            v68 = (NSString *)objc_claimAutoreleasedReturnValue();
            NSSelectorFromString(v68);
            v54 = (objc_opt_respondsToSelector() & 1) != 0 ? v68 : 0;

          }
          if (v54)
          {
            objc_msgSend(v52, "valueForKey:", v54);
            Mutable = (id *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_103:
            if (Mutable)
            {
              v69 = v52;
              v70 = (__CFString *)v53;
              if (v69)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v69);
                v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v71 = &stru_1EA5021F8;
              }
              if (v70)
                v72 = v70;
              else
                v72 = &stru_1EA5021F8;
              v73 = v72;
              values[0] = CFSTR("propertyName");
              values[1] = CFSTR("objectDescription");
              keys = v73;
              v93 = v71;
              values[2] = CFSTR("errorDescription");
              v94 = &stru_1EA5021F8;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &keys, values, 3);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v74);
              v75 = (void *)objc_claimAutoreleasedReturnValue();

              v76 = objc_retainAutorelease(v75);
              *Mutable = v76;

              v54 = 0;
              Mutable = 0;
            }
            else
            {
              v54 = 0;
            }
          }

        }
        goto LABEL_93;
      }
      objc_msgSend(v83, "fillColor");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = (CGColor *)objc_msgSend(v23, "CGColor");
      if (v31)
      {
        Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
        spacea = CGColorGetColorSpace(v31);
        valuea = CGColorSpaceCopyName(spacea);
        v32 = CGColorGetNumberOfComponents(v31);
        v33 = v32 << 32;
        v34 = (int)v32;
        if (v32 << 32)
        {
          v28 = CFStringCreateMutable(0, 0);
          v78 = v23;
          v35 = v34 - 1;
          if ((unint64_t)v34 <= 1)
            v36 = 1;
          else
            v36 = v34;
          do
          {
            CFStringAppend(v28, CFSTR("CGf"));
            if (v35)
              CFStringAppend(v28, CFSTR(", "));
            --v35;
            --v36;
          }
          while (v36);
          v23 = v78;
        }
        else
        {
          v28 = &stru_1EA5021F8;
        }
        v55 = CGColorGetComponents(v31);
        v56 = (const void **)malloc_type_malloc(v33 >> 29, 0x6004044C4A2DFuLL);
        v57 = v56;
        if (v33 >= 1)
        {
          if (v34 <= 1)
            v58 = 1;
          else
            v58 = v34;
          v59 = (CFNumberRef *)v56;
          do
          {
            *v59++ = CFNumberCreate(0, kCFNumberCGFloatType, v55++);
            --v58;
          }
          while (v58);
        }
        v60 = CFArrayCreate(0, v57, v34, MEMORY[0x1E0C9B378]);
        if (v33 >= 1)
        {
          if (v34 <= 1)
            v61 = 1;
          else
            v61 = v34;
          v62 = v57;
          do
          {
            CFRelease(*v62++);
            --v61;
          }
          while (v61);
        }
        free(v57);
        CGColorSpaceGetModel(spacea);
        if (v60)
          CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValues"), v60);
        if (v28)
          CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValuesFormat"), v28);
        if (valuea)
          CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("colorSpaceName"), valuea);
        if (v60)
          CFRelease(v60);
        if (valuea)
          CFRelease(valuea);
        if (!v28)
          goto LABEL_92;
LABEL_91:
        CFRelease(v28);
        goto LABEL_92;
      }
    }
    Mutable = 0;
LABEL_92:

    goto LABEL_93;
  }
  objc_msgSend(v83, "fillTexture");
  Mutable = (id *)objc_claimAutoreleasedReturnValue();

  if (Mutable)
  {
    objc_msgSend(v83, "fillTexture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (CGImage *)objc_msgSend(v17, "CGImage");

    if (v11)
    {
      valuePtr = 1065353216;
      Mutable = (id *)CFDataCreateMutable(0, 0);
      v18 = *MEMORY[0x1E0CA5C10];
      v19 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
      v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
      keys = (void *)*MEMORY[0x1E0CBC780];
      values[0] = v21;
      v22 = CFDictionaryCreate(v20, (const void **)&keys, (const void **)values, 1, 0, 0);
      CGImageDestinationAddImage(v19, v11, v22);
      CGImageDestinationFinalize(v19);
      CFRelease(v22);
      CFRelease(v21);
      CFRelease(v19);
      v87 = CFSTR("propertyFormat");
      v88 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      Mutable = 0;
    }
    goto LABEL_30;
  }
LABEL_93:

  return Mutable;
}

@end
