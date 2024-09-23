@implementation CNBoundsPrediction

- (id)_initWithNormalizedBounds:(CGRect)a3 confidence:(float)a4
{
  double height;
  double width;
  double y;
  double x;
  CNBoundsPrediction *v9;
  CNBoundsPrediction *v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CNBoundsPrediction;
  v9 = -[CNBoundsPrediction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    -[CNBoundsPrediction setNormalizedBounds:](v9, "setNormalizedBounds:", x, y, width, height);
    *(float *)&v11 = a4;
    -[CNBoundsPrediction setConfidence:](v10, "setConfidence:", v11);
  }
  return v10;
}

+ (id)_predictionFromInternal:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  double v16;
  void *v17;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init((Class)a1);
    objc_msgSend(v4, "rect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "confidence");
    v15 = v14;

    LODWORD(v16) = v15;
    v17 = (void *)objc_msgSend(v5, "_initWithNormalizedBounds:confidence:", v7, v9, v11, v13, v16);

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  void *v15;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CNBoundsPrediction normalizedBounds](self, "normalizedBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CNBoundsPrediction confidence](self, "confidence");
  LODWORD(v14) = v13;
  v15 = (void *)objc_msgSend(v4, "_initWithNormalizedBounds:confidence:", v6, v8, v10, v12, v14);

  return v15;
}

- (unint64_t)hash
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  float v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  float v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[CNBoundsPrediction normalizedBounds](self, "normalizedBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CNBoundsPrediction confidence](self, "confidence");
  v12 = v11;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v13 = CGRectGetMinX(v18) + v12;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v14 = v13 + CGRectGetMinY(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v15 = v14 + CGRectGetWidth(v20);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v16 = v15 + CGRectGetHeight(v21);
  return (unint64_t)(v16 * 32767.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  float v18;
  float v19;
  float v20;
  BOOL v21;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CNBoundsPrediction normalizedBounds](self, "normalizedBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "normalizedBounds");
    v24.origin.x = v14;
    v24.origin.y = v15;
    v24.size.width = v16;
    v24.size.height = v17;
    v23.origin.x = v7;
    v23.origin.y = v9;
    v23.size.width = v11;
    v23.size.height = v13;
    if (CGRectEqualToRect(v23, v24))
    {
      -[CNBoundsPrediction confidence](self, "confidence");
      v19 = v18;
      objc_msgSend(v5, "confidence");
      v21 = v19 == v20;
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

  return v21;
}

- (CGRect)normalizedBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_normalizedBounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setNormalizedBounds:(CGRect)normalizedBounds
{
  CGRect v3;

  v3 = normalizedBounds;
  objc_copyStruct(&self->_normalizedBounds, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)confidence
{
  self->_confidence = confidence;
}

@end
