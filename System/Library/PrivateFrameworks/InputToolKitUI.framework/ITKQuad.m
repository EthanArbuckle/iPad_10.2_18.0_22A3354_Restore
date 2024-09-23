@implementation ITKQuad

- (ITKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  ITKQuad *result;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  result = -[ITKQuad init](self, "init");
  if (result)
  {
    result->_bottomLeft.x = v9;
    result->_bottomLeft.y = v8;
    result->_bottomRight.x = x;
    result->_bottomRight.y = y;
    result->_topLeft.x = v13;
    result->_topLeft.y = v12;
    result->_topRight.x = v11;
    result->_topRight.y = v10;
  }
  return result;
}

- (ITKQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  ITKQuad *result;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  result = -[ITKQuad init](self, "init");
  if (result)
  {
    result->_bottomLeft.x = v13;
    result->_bottomLeft.y = v12;
    result->_bottomRight.x = v11;
    result->_bottomRight.y = v10;
    result->_topLeft.x = v9;
    result->_topLeft.y = v8;
    result->_topRight.x = x;
    result->_topRight.y = y;
  }
  return result;
}

- (ITKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  ITKQuad *result;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  result = -[ITKQuad init](self, "init");
  if (result)
  {
    result->_bottomLeft.x = x;
    result->_bottomLeft.y = y;
    result->_bottomRight.x = v9;
    result->_bottomRight.y = v8;
    result->_topLeft.x = v13;
    result->_topLeft.y = v12;
    result->_topRight.x = v11;
    result->_topRight.y = v10;
  }
  return result;
}

- (ITKQuad)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double MinY;
  double v11;
  double MaxX;
  double MaxY;
  double MinX;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxY = CGRectGetMaxY(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MaxX = CGRectGetMaxX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v8 = CGRectGetMaxY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v9 = CGRectGetMinX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MinY = CGRectGetMinY(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v11 = CGRectGetMaxX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", MinX, MaxY, MaxX, v8, v9, MinY, v11, CGRectGetMinY(v22));
}

- (ITKQuad)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
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
  void *v26;
  double v27;
  double v28;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BL_X"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BL_Y"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BR_X"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BR_Y"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TL_X"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TL_Y"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TR_X"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TR_Y"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v7, v10, v13, v16, v19, v22, v25, v28);
}

- (ITKQuad)initWithPoints:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  ITKQuad *v25;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 4)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itk_pointValue");
    v7 = v6;
    v9 = v8;

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itk_pointValue");
    v12 = v11;
    v14 = v13;

    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itk_pointValue");
    v17 = v16;
    v19 = v18;

    objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itk_pointValue");
    v22 = v21;
    v24 = v23;

    self = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v17, v19, v22, v24, v7, v9, v12, v14);
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)quadFromCGRect:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ITKQuad)initWithCoder:(id)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  ITKQuad *v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BL_X"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BL_Y"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BR_X"));
  v10 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BR_Y"));
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TL_X"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TL_Y"));
  v16 = v15;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TR_X"));
  v18 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TR_Y"));
  v20 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v6, v8, v10, v12, v14, v16, v18, v19);
  v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LD"));

  -[ITKQuad setLayoutDirection:](v20, "setLayoutDirection:", v21);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("BL_X"));
  -[ITKQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("BL_Y"), v4);
  -[ITKQuad bottomRight](self, "bottomRight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("BR_X"));
  -[ITKQuad bottomRight](self, "bottomRight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("BR_Y"), v5);
  -[ITKQuad topLeft](self, "topLeft");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("TL_X"));
  -[ITKQuad topLeft](self, "topLeft");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("TL_Y"), v6);
  -[ITKQuad topRight](self, "topRight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("TR_X"));
  -[ITKQuad topRight](self, "topRight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("TR_Y"), v7);
  objc_msgSend(v8, "encodeInteger:forKey:", -[ITKQuad layoutDirection](self, "layoutDirection"), CFSTR("LD"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[11];

  v15[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bottomLeft.x, CFSTR("BL_X"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("BL_Y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bottomLeft.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("BR_X");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bottomRight.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("BR_Y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bottomRight.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("TL_X");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_topLeft.x);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("TL_Y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_topLeft.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("TR_X");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_topRight.x);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("TR_Y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_topRight.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("LD");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_layoutDirection);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectEqualToRect(*MEMORY[0x24BDBF090], self->_boundingBox))
    -[ITKQuad calcluateBoundingBox](self, "calcluateBoundingBox");
  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)calcluateBoundingBox
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;

  ITKRectWithPoints();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  ITKRectWithPoints();
  v16.origin.x = v11;
  v16.origin.y = v12;
  v16.size.width = v13;
  v16.size.height = v14;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  self->_boundingBox = CGRectUnion(v15, v16);
}

- (double)area
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;

  -[ITKQuad sideLength](self, "sideLength");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  ITKAngleBetweenPoints();
  v11 = v10;
  ITKAngleBetweenPoints();
  v13 = v11 + v12;
  v14 = (v5 + v7 + v9 + v3) * 0.5;
  v15 = (v14 - v7) * ((v14 - v9) * (v14 - v3));
  v16 = v14 - v5;
  v17 = cos(v13 * 0.5);
  return sqrt(v5 * (v7 * -(v9 * v3)) * (v17 * v17) + v15 * v16);
}

- (double)boundingBoxArea
{
  double v2;
  double v3;

  -[ITKQuad boundingBox](self, "boundingBox");
  return v2 * v3;
}

- (NSString)summaryDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ITKQuad topLeft](self, "topLeft");
  v5 = v4;
  -[ITKQuad topLeft](self, "topLeft");
  v7 = v6;
  -[ITKQuad topRight](self, "topRight");
  v9 = v8;
  -[ITKQuad topRight](self, "topRight");
  v11 = v10;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  v13 = v12;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  v15 = v14;
  -[ITKQuad bottomRight](self, "bottomRight");
  v17 = v16;
  -[ITKQuad bottomRight](self, "bottomRight");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("TL:%.2f %.2f TR:%.2f %.2f BL:%.2f %.2f BR:%.2f %.2f"), v5, v7, v9, v11, v13, v15, v17, v18);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("topLeft    : %.2f %.2f \ntopRight   : %.2f %.2f \nbottomLeft : %.2f %.2f \nbottomRight: %.2f %.2f"), *(_QWORD *)&self->_topLeft.x, *(_QWORD *)&self->_topLeft.y, *(_QWORD *)&self->_topRight.x, *(_QWORD *)&self->_topRight.y, *(_QWORD *)&self->_bottomLeft.x, *(_QWORD *)&self->_bottomLeft.y, *(_QWORD *)&self->_bottomRight.x, *(_QWORD *)&self->_bottomRight.y);
}

- (NSArray)allPoints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad topLeft](self, "topLeft");
  objc_msgSend(v3, "itk_valueWithPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v5 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad topRight](self, "topRight");
  objc_msgSend(v5, "itk_valueWithPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v7 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v7, "itk_valueWithPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v9 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad bottomRight](self, "bottomRight");
  objc_msgSend(v9, "itk_valueWithPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (BOOL)containsIntersectingLines
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;

  -[ITKQuad topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[ITKQuad topRight](self, "topRight");
  v8 = v7;
  v10 = v9;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  v12 = v11;
  v14 = v13;
  -[ITKQuad bottomRight](self, "bottomRight");
  -[ITKQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v4, v6, v8, v10, v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = 1;
  }
  else
  {
    -[ITKQuad topRight](self, "topRight");
    v20 = v19;
    v22 = v21;
    -[ITKQuad bottomRight](self, "bottomRight");
    v24 = v23;
    v26 = v25;
    -[ITKQuad topLeft](self, "topLeft");
    v28 = v27;
    v30 = v29;
    -[ITKQuad bottomLeft](self, "bottomLeft");
    -[ITKQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v20, v22, v24, v26, v28, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v33 != 0;

  }
  return v18;
}

- (ITKQuadSideLength)sideLength
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  ITKQuadSideLength result;

  -[ITKQuad bottomLeft](self, "bottomLeft");
  -[ITKQuad topLeft](self, "topLeft");
  ITKDistance();
  v4 = v3;
  -[ITKQuad bottomRight](self, "bottomRight");
  -[ITKQuad topRight](self, "topRight");
  ITKDistance();
  v6 = v5;
  -[ITKQuad topLeft](self, "topLeft");
  -[ITKQuad topRight](self, "topRight");
  ITKDistance();
  v8 = v7;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKDistance();
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.var3 = v10;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (double)maxHeight
{
  double result;
  double v3;

  -[ITKQuad sideLength](self, "sideLength");
  if (result < v3)
    return v3;
  return result;
}

- (id)intersectionOfLineFrom:(CGPoint)a3 to:(CGPoint)a4 withLineFrom:(CGPoint)a5 to:(CGPoint)a6
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v15;
  double v16;
  double v17;
  double v19;

  v8 = a4.x - a3.x;
  v9 = a6.y - a5.y;
  v10 = a4.y - a3.y;
  v11 = a6.x - a5.x;
  v12 = v8 * (a6.y - a5.y) - v10 * (a6.x - a5.x);
  v13 = 0;
  if (v12 != 0.0)
  {
    v15 = a5.x - a3.x;
    v16 = a5.y - a3.y;
    v17 = ((a5.x - a3.x) * v9 - v16 * v11) / v12;
    if (v17 >= 0.0 && v17 <= 1.0)
    {
      v19 = (v15 * v10 - v16 * v8) / v12;
      if (v19 >= 0.0 && v19 <= 1.0)
      {
        objc_msgSend(MEMORY[0x24BDD1968], "itk_valueWithPoint:", a3.x + v17 * v8, a3.y + v17 * v10, v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v13;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  uint64_t v7;
  CGPoint topLeft;
  CGPoint bottomRight;
  double v10;
  CGFloat v11;
  double *p_y;
  unint64_t i;
  double v14;
  double v15;
  double v16;
  CGPoint v18;
  CGPoint topRight;
  CGPoint v20;
  CGPoint bottomLeft;
  CGPoint v22;
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  if (ITKPointIsFinite())
  {
    v7 = 0;
    topLeft = self->_topLeft;
    bottomRight = self->_bottomRight;
    bottomLeft = self->_bottomLeft;
    v22 = topLeft;
    topRight = self->_topRight;
    v20 = bottomRight;
    v18 = topLeft;
    v11 = topLeft.y;
    v10 = topLeft.x;
    p_y = &topRight.y;
    for (i = 1; i != 5; ++i)
    {
      v14 = v10;
      v15 = v11;
      v10 = *(p_y - 1);
      v11 = *p_y;
      -[ITKQuad pointInsideValueForStartPoint:endPoint:testPoint:](self, "pointInsideValueForStartPoint:endPoint:testPoint:", v14, v15, v10, *p_y, x, y, v18, topRight, v20, bottomLeft, v22);
      if (v16 != 0.0)
      {
        if (v16 > 0.0)
        {
          if (v7 < 0)
            return v6;
          ++v7;
        }
        if (v16 < 0.0)
        {
          if (v7 > 0)
            return v6;
          --v7;
        }
      }
      v6 = i > 3;
      p_y += 2;
    }
  }
  return v6;
}

- (BOOL)intersectsQuad:(id)a3
{
  id v4;
  ITKQuad *v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  BOOL v39;
  ITKQuad *v41;
  char v42;
  _QWORD v43[8];
  _QWORD v44[10];
  CGRect v45;
  CGRect v46;

  v44[8] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  v6 = v4;
  -[ITKQuad boundingBox](v5, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "boundingBox");
  v46.origin.x = v15;
  v46.origin.y = v16;
  v46.size.width = v17;
  v46.size.height = v18;
  v45.origin.x = v8;
  v45.origin.y = v10;
  v45.size.width = v12;
  v45.size.height = v14;
  if (CGRectIntersectsRect(v45, v46))
  {
    -[ITKQuad topLeft](v5, "topLeft");
    v44[0] = v19;
    v44[1] = v20;
    -[ITKQuad topRight](v5, "topRight");
    v44[2] = v21;
    v44[3] = v22;
    -[ITKQuad bottomRight](v5, "bottomRight");
    v44[4] = v23;
    v44[5] = v24;
    -[ITKQuad bottomLeft](v5, "bottomLeft");
    v44[6] = v25;
    v44[7] = v26;
    objc_msgSend(v6, "topLeft");
    v43[0] = v27;
    v43[1] = v28;
    objc_msgSend(v6, "topRight");
    v43[2] = v29;
    v43[3] = v30;
    objc_msgSend(v6, "bottomRight");
    v43[4] = v31;
    v43[5] = v32;
    objc_msgSend(v6, "bottomLeft");
    v33 = 0;
    v43[6] = v34;
    v43[7] = v35;
    v41 = v5;
    do
    {
      if (-[ITKQuad containsPoint:](v5, "containsPoint:", *(double *)&v43[v33], *(double *)&v43[v33 + 1], v41)
        || (objc_msgSend(v6, "containsPoint:", *(double *)&v44[v33], *(double *)&v44[v33 + 1]) & 1) != 0)
      {
        v42 = 1;
        goto LABEL_15;
      }
      v33 += 2;
    }
    while (v33 != 8);
    v36 = 0;
    v42 = 0;
    do
    {
      ++v36;
      v37 = v43;
      v38 = 1;
      while (v38 != 5)
      {
        v37 += 2;
        ++v38;
        if (ITKIntersectionOfLines())
        {
          v42 = 1;
          break;
        }
      }
    }
    while (v36 != 4);
LABEL_15:
    v39 = v42 & 1;
    v5 = v41;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (BOOL)isCompletelyInsideRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGPoint v17;
  CGPoint v18;
  CGPoint v19;
  CGPoint v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ITKQuad topLeft](self, "topLeft");
  v17.x = v8;
  v17.y = v9;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (!CGRectContainsPoint(v21, v17))
    return 0;
  -[ITKQuad topRight](self, "topRight");
  v18.x = v10;
  v18.y = v11;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (!CGRectContainsPoint(v22, v18))
    return 0;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  v19.x = v12;
  v19.y = v13;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  if (!CGRectContainsPoint(v23, v19))
    return 0;
  -[ITKQuad bottomRight](self, "bottomRight");
  v20.x = v14;
  v20.y = v15;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  return CGRectContainsPoint(v24, v20);
}

- (double)pointInsideValueForStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 testPoint:(CGPoint)a5
{
  return (a5.y - a3.y) * (a4.x - a3.x) - (a5.x - a3.x) * (a4.y - a3.y);
}

- (ITKQuad)quadByAdjustingOrientation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  ITKQuad *v46;
  ITKQuad *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  ITKQuad *v68;
  double v70;
  double v71;
  double v72;
  _QWORD v73[5];

  v73[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad topLeft](self, "topLeft");
  objc_msgSend(v3, "itk_valueWithPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v4;
  v5 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad topRight](self, "topRight");
  objc_msgSend(v5, "itk_valueWithPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v6;
  v7 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v7, "itk_valueWithPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v8;
  v9 = (void *)MEMORY[0x24BDD1968];
  -[ITKQuad bottomRight](self, "bottomRight");
  objc_msgSend(v9, "itk_valueWithPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pointValue");
  v15 = v14;
  v72 = v14;

  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pointValue");
  v18 = v17;

  v19 = 2;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pointValue");
  v22 = v21;

  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pointValue");
  v25 = v24;

  if (v25 >= v22)
    v26 = 2;
  else
    v26 = 3;
  if (v25 >= v22)
    v19 = 3;
  objc_msgSend(v12, "objectAtIndexedSubscript:", v15 >= v18, *(_QWORD *)&v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pointValue");
  v71 = v28;
  v30 = v29;

  objc_msgSend(v12, "objectAtIndexedSubscript:", v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "pointValue");
  v33 = v32;
  v35 = v34;

  objc_msgSend(v12, "objectAtIndexedSubscript:", v15 < v18);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "pointValue");
  v38 = v37;
  v40 = v39;

  objc_msgSend(v12, "objectAtIndexedSubscript:", v19);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "pointValue");
  v43 = v42;
  v45 = v44;

  v46 = -[ITKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([ITKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v71, v30, v33, v35, v38, v40, v43, v45);
  v47 = v46;
  if (v22 < v72 && v22 < v70 && -[ITKQuad containsIntersectingLines](v46, "containsIntersectingLines"))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "pointValue");
    v50 = v49;
    v52 = v51;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "pointValue");
    v55 = v54;
    v57 = v56;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "pointValue");
    v60 = v59;
    v62 = v61;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "pointValue");
    v65 = v64;
    v67 = v66;

    v68 = -[ITKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([ITKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v50, v52, v55, v57, v60, v62, v65, v67);
    v47 = v68;
  }

  return v47;
}

uint64_t __37__ITKQuad_quadByAdjustingOrientation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "pointValue");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "pointValue");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)quadByFlippingPointsWithSourceFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;

  -[ITKQuad topLeft](self, "topLeft");
  ITKFlipPoint();
  v17 = v5;
  v18 = v4;
  -[ITKQuad topRight](self, "topRight");
  ITKFlipPoint();
  v7 = v6;
  v9 = v8;
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKFlipPoint();
  v11 = v10;
  v13 = v12;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  ITKFlipPoint();
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v15, v11, v13, v18, v17, v7, v9);
}

- (double)averagedAngleFromBottomAndTopEdges
{
  long double v3;
  double v4;
  long double v5;

  -[ITKQuad topLeft](self, "topLeft");
  -[ITKQuad topRight](self, "topRight");
  ITKSlopeOfLine();
  v4 = atan(v3);
  -[ITKQuad bottomLeft](self, "bottomLeft");
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKSlopeOfLine();
  return (v4 + atan(v5)) * 0.5;
}

- (CGRect)minimumBoundingRectWithoutRotation
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[ITKQuad sideLength](self, "sideLength");
  -[ITKQuad vertexCentroid](self, "vertexCentroid");
  ITKRectWithCenterAndSize();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ITKQuad *v4;
  ITKQuad *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;

  v4 = (ITKQuad *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4
         && ((-[ITKQuad topLeft](self, "topLeft"), v7 = v6, v9 = v8, -[ITKQuad topLeft](v5, "topLeft"), v7 == v11)
           ? (v12 = v9 == v10)
           : (v12 = 0),
             v12))
  {
    -[ITKQuad topRight](self, "topRight");
    v16 = v15;
    v18 = v17;
    -[ITKQuad topRight](v5, "topRight");
    v13 = 0;
    if (v16 == v20 && v18 == v19)
    {
      -[ITKQuad bottomRight](self, "bottomRight");
      v22 = v21;
      v24 = v23;
      -[ITKQuad bottomRight](v5, "bottomRight");
      v13 = 0;
      if (v22 == v26 && v24 == v25)
      {
        -[ITKQuad bottomLeft](self, "bottomLeft");
        v28 = v27;
        v30 = v29;
        -[ITKQuad bottomLeft](v5, "bottomLeft");
        v13 = 0;
        if (v28 == v32 && v30 == v31)
        {
          v33 = -[ITKQuad layoutDirection](self, "layoutDirection");
          v13 = v33 == -[ITKQuad layoutDirection](v5, "layoutDirection");
        }
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  ITKQuad *v18;

  -[ITKQuad topLeft](self, "topLeft", a3);
  v5 = v4;
  v7 = v6;
  -[ITKQuad topRight](self, "topRight");
  v9 = v8;
  v11 = v10;
  -[ITKQuad bottomRight](self, "bottomRight");
  v13 = v12;
  v15 = v14;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  v18 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
  -[ITKQuad setLayoutDirection:](v18, "setLayoutDirection:", -[ITKQuad layoutDirection](self, "layoutDirection"));
  return v18;
}

- (UIBezierPath)path
{
  UIBezierPath *path;
  UIBezierPath *v4;
  UIBezierPath *v5;
  UIBezierPath *v6;
  UIBezierPath *v7;
  UIBezierPath *v8;
  UIBezierPath *v9;
  UIBezierPath *v10;

  path = self->_path;
  if (!path)
  {
    v4 = (UIBezierPath *)objc_alloc_init(MEMORY[0x24BEBD420]);
    v5 = self->_path;
    self->_path = v4;

    v6 = self->_path;
    -[ITKQuad topLeft](self, "topLeft");
    -[UIBezierPath moveToPoint:](v6, "moveToPoint:");
    v7 = self->_path;
    -[ITKQuad topRight](self, "topRight");
    -[UIBezierPath itk_addLineToPoint:](v7, "itk_addLineToPoint:");
    v8 = self->_path;
    -[ITKQuad bottomRight](self, "bottomRight");
    -[UIBezierPath itk_addLineToPoint:](v8, "itk_addLineToPoint:");
    v9 = self->_path;
    -[ITKQuad bottomLeft](self, "bottomLeft");
    -[UIBezierPath itk_addLineToPoint:](v9, "itk_addLineToPoint:");
    v10 = self->_path;
    -[ITKQuad topLeft](self, "topLeft");
    -[UIBezierPath itk_addLineToPoint:](v10, "itk_addLineToPoint:");
    -[UIBezierPath closePath](self->_path, "closePath");
    path = self->_path;
  }
  return path;
}

- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  ITKQuad *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  ITKQuad *v53;
  double v55;
  double v56;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "bounds");
  v10 = self;
  v11 = objc_msgSend(v8, "itk_isFlipped");
  if (v11 != objc_msgSend(v9, "itk_isFlipped"))
  {
    v12 = (void *)-[ITKQuad copy](v10, "copy");

    if (v5)
    {
      v13 = *MEMORY[0x24BE51E58];
      v14 = *(double *)(MEMORY[0x24BE51E58] + 8);
      v15 = *(double *)(MEMORY[0x24BE51E58] + 16);
      v16 = *(double *)(MEMORY[0x24BE51E58] + 24);
    }
    else
    {
      objc_msgSend(v8, "bounds");
    }
    objc_msgSend(v12, "quadByFlippingPointsWithSourceFrame:", v13, v14, v15, v16);
    v10 = (ITKQuad *)objc_claimAutoreleasedReturnValue();

  }
  -[ITKQuad topLeft](v10, "topLeft");
  if (v5)
  {
    ITKPointFromNormalizedRect();
    objc_msgSend(v8, "convertPoint:toView:", 0);
    v55 = v18;
    v56 = v17;
    -[ITKQuad topRight](v10, "topRight");
    ITKPointFromNormalizedRect();
    objc_msgSend(v8, "convertPoint:toView:", 0);
    v20 = v19;
    v22 = v21;
    -[ITKQuad bottomRight](v10, "bottomRight");
    ITKPointFromNormalizedRect();
    objc_msgSend(v8, "convertPoint:toView:", 0);
    v24 = v23;
    v26 = v25;
    -[ITKQuad bottomLeft](v10, "bottomLeft");
    v28 = v55;
    v27 = v56;
    ITKPointFromNormalizedRect();
  }
  else
  {
    objc_msgSend(v8, "convertPoint:toView:", 0);
    v27 = v29;
    v28 = v30;
    -[ITKQuad topRight](v10, "topRight");
    objc_msgSend(v8, "convertPoint:toView:", 0);
    v20 = v31;
    v22 = v32;
    -[ITKQuad bottomRight](v10, "bottomRight");
    objc_msgSend(v8, "convertPoint:toView:", 0);
    v24 = v33;
    v26 = v34;
    -[ITKQuad bottomLeft](v10, "bottomLeft");
  }
  objc_msgSend(v8, "convertPoint:toView:", 0);
  v36 = v35;
  v38 = v37;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v27, v28);
  v40 = v39;
  v42 = v41;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v20, v22);
  v44 = v43;
  v46 = v45;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v24, v26);
  v48 = v47;
  v50 = v49;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v36, v38);
  v53 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v51, v52, v48, v50, v40, v42, v44, v46);

  return v53;
}

- (id)quadByConvertingFromNormalizedRectToView:(id)a3 contentsRect:(CGRect)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;

  objc_msgSend(a3, "bounds");
  ITKRectFromNormalizedSubrect();
  -[ITKQuad topLeft](self, "topLeft");
  ITKPointFromNormalizedRect();
  v18 = v6;
  v19 = v5;
  -[ITKQuad topRight](self, "topRight");
  ITKPointFromNormalizedRect();
  v8 = v7;
  v10 = v9;
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKPointFromNormalizedRect();
  v12 = v11;
  v14 = v13;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  ITKPointFromNormalizedRect();
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v15, v16, v12, v14, v19, v18, v8, v10);
}

- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;

  v7 = a4;
  v8 = a3;
  -[ITKQuad topLeft](self, "topLeft");
  objc_msgSend(v8, "convertPoint:toView:", v7);
  -[ITKQuad topRight](self, "topRight");
  objc_msgSend(v8, "convertPoint:toView:", v7);
  -[ITKQuad bottomRight](self, "bottomRight");
  objc_msgSend(v8, "convertPoint:toView:", v7);
  -[ITKQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v8, "convertPoint:toView:", v7);

  ITKNormalizedPointInRect();
  v22 = v10;
  v23 = v9;
  ITKNormalizedPointInRect();
  v12 = v11;
  v14 = v13;
  ITKNormalizedPointInRect();
  v16 = v15;
  v18 = v17;
  ITKNormalizedPointInRect();
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v19, v20, v16, v18, v23, v22, v12, v14);
}

- (id)normalizedQuadFromView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;

  objc_msgSend(a3, "bounds");
  -[ITKQuad topLeft](self, "topLeft");
  ITKNormalizedPointInRect();
  v17 = v5;
  v18 = v4;
  -[ITKQuad topRight](self, "topRight");
  ITKNormalizedPointInRect();
  v7 = v6;
  v9 = v8;
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKNormalizedPointInRect();
  v11 = v10;
  v13 = v12;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  ITKNormalizedPointInRect();
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v15, v11, v13, v18, v17, v7, v9);
}

- (id)subquadFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ITKQuad *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (ITKSizeIsEmptyOrHasNanOrInf())
  {
    v8 = objc_alloc_init(ITKQuad);
  }
  else
  {
    v9 = (void *)-[ITKQuad copy](self, "copy");
    objc_msgSend(v9, "quadFromSubtractingPoint:", x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "quadMultipliedBySize:", 1.0 / width, 1.0 / height);
    v8 = (ITKQuad *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)quadFromAddingPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[ITKQuad topLeft](self, "topLeft");
  ITKAddPoints();
  v5 = v4;
  v7 = v6;
  -[ITKQuad topRight](self, "topRight");
  ITKAddPoints();
  v9 = v8;
  v11 = v10;
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKAddPoints();
  v13 = v12;
  v15 = v14;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  ITKAddPoints();
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
}

- (id)quadFromSubtractingPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[ITKQuad topLeft](self, "topLeft");
  ITKSubtractPoints();
  v5 = v4;
  v7 = v6;
  -[ITKQuad topRight](self, "topRight");
  ITKSubtractPoints();
  v9 = v8;
  v11 = v10;
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKSubtractPoints();
  v13 = v12;
  v15 = v14;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  ITKSubtractPoints();
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
}

- (id)quadMultipliedBySize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[ITKQuad topLeft](self, "topLeft");
  ITKMultiplyPointBySize();
  v5 = v4;
  v7 = v6;
  -[ITKQuad topRight](self, "topRight");
  ITKMultiplyPointBySize();
  v9 = v8;
  v11 = v10;
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKMultiplyPointBySize();
  v13 = v12;
  v15 = v14;
  -[ITKQuad bottomLeft](self, "bottomLeft");
  ITKMultiplyPointBySize();
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
}

- (CGPoint)vertexCentroid
{
  double v3;
  double v4;
  CGPoint result;

  -[ITKQuad topLeft](self, "topLeft");
  -[ITKQuad topRight](self, "topRight");
  -[ITKQuad bottomLeft](self, "bottomLeft");
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKVertexCentroidOfQuad();
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)quadFromUnionWithQuad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  ITKQuad *v31;

  v4 = a3;
  -[ITKQuad quadByAdjustingOrientation](self, "quadByAdjustingOrientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quadByAdjustingOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "topLeft");
  v8 = v7;
  objc_msgSend(v5, "topLeft");
  if (v8 >= v9)
    v8 = v9;
  objc_msgSend(v6, "topLeft");
  v11 = v10;
  objc_msgSend(v5, "topLeft");
  if (v11 >= v12)
    v11 = v12;
  objc_msgSend(v6, "topRight");
  v14 = v13;
  objc_msgSend(v5, "topRight");
  if (v14 < v15)
    v14 = v15;
  objc_msgSend(v6, "topRight");
  v17 = v16;
  objc_msgSend(v5, "topRight");
  if (v17 >= v18)
    v17 = v18;
  objc_msgSend(v6, "bottomRight");
  v20 = v19;
  objc_msgSend(v5, "bottomRight");
  if (v20 < v21)
    v20 = v21;
  objc_msgSend(v6, "bottomRight");
  v23 = v22;
  objc_msgSend(v5, "bottomRight");
  if (v23 < v24)
    v23 = v24;
  objc_msgSend(v6, "bottomLeft");
  v26 = v25;
  objc_msgSend(v5, "bottomLeft");
  if (v26 >= v27)
    v26 = v27;
  objc_msgSend(v6, "bottomLeft");
  v29 = v28;
  objc_msgSend(v5, "bottomLeft");
  if (v29 < v30)
    v29 = v30;
  v31 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v26, v29, v20, v23, v8, v11, v14, v17);

  return v31;
}

+ (id)quadFromUnionOfQuads:(id)a3 baselineAngle:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "quadFromRotatingAroundOriginWithAngle:", -a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v8)
        {
          objc_msgSend(v8, "quadFromUnionWithQuad:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v13;
        }
        else
        {
          v8 = v11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "quadFromRotatingAroundOriginWithAngle:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (CGPoint)vertexCentroidFromQuads:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vertexCentroid");
    v6 = v5;
    v8 = v7;

    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 2)
      {
        v9 = 1;
        do
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "vertexCentroid");
          ITKAddPoints();

          ++v9;
        }
        while (objc_msgSend(v3, "count") > v9);
      }
      objc_msgSend(v3, "count");
      ITKMultiplyPointScalar();
      v6 = v11;
      v8 = v12;
    }
  }
  else
  {
    v6 = *MEMORY[0x24BDBEFB0];
    v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }

  v13 = v6;
  v14 = v8;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)quadFromRotatingAroundCentroidWithAngle:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  ITKQuad *v11;
  _QWORD v13[4];
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v18;
  CGAffineTransform v19;

  -[ITKQuad vertexCentroid](self, "vertexCentroid");
  v6 = v5;
  v8 = v7;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, -v5, -v7);
  CGAffineTransformMakeRotation(&t2, a3);
  t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &t2);
  v19 = v18;
  CGAffineTransformMakeTranslation(&v15, v6, v8);
  t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &v15);
  v19 = v18;
  -[ITKQuad allPoints](self, "allPoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__ITKQuad_quadFromRotatingAroundCentroidWithAngle___block_invoke;
  v13[3] = &__block_descriptor_80_e23__32__0__NSValue_8q16q24l;
  v14 = v19;
  objc_msgSend(v9, "itk_map:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ITKQuad initWithPoints:]([ITKQuad alloc], "initWithPoints:", v10);
  return v11;
}

uint64_t __51__ITKQuad_quadFromRotatingAroundCentroidWithAngle___block_invoke(float64x2_t *a1, void *a2)
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "pointValue");
  return objc_msgSend(v3, "itk_valueWithPoint:", vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], v4), a1[2], v5)));
}

- (id)quadFromRotatingAroundOriginWithAngle:(double)a3
{
  void *v4;
  void *v5;
  ITKQuad *v6;
  _QWORD v8[4];
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeRotation(&v10, a3);
  -[ITKQuad allPoints](self, "allPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__ITKQuad_quadFromRotatingAroundOriginWithAngle___block_invoke;
  v8[3] = &__block_descriptor_80_e23__32__0__NSValue_8q16q24l;
  v9 = v10;
  objc_msgSend(v4, "itk_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ITKQuad initWithPoints:]([ITKQuad alloc], "initWithPoints:", v5);
  return v6;
}

uint64_t __49__ITKQuad_quadFromRotatingAroundOriginWithAngle___block_invoke(float64x2_t *a1, void *a2)
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "pointValue");
  return objc_msgSend(v3, "itk_valueWithPoint:", vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], v4), a1[2], v5)));
}

- (CGAffineTransform)rotationTransformAndBoundingBox:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  -[ITKQuad topLeft](self, "topLeft");
  -[ITKQuad bottomLeft](self, "bottomLeft");
  ITKAveragePoints();
  v8 = v7;
  -[ITKQuad topRight](self, "topRight");
  -[ITKQuad bottomRight](self, "bottomRight");
  ITKAveragePoints();
  if (v8 == v9)
  {
    ITKSubtractPoints();
    v11 = dbl_23F100020[v12 > 0.0];
  }
  else
  {
    ITKAngleOfLine();
    v11 = v10;
  }
  -[ITKQuad quadFromRotatingAroundCentroidWithAngle:](self, "quadFromRotatingAroundCentroidWithAngle:", -v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingBox");
  a4->origin.x = v14;
  a4->origin.y = v15;
  a4->size.width = v16;
  a4->size.height = v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return CGAffineTransformMakeRotation(retstr, v11);
}

- (double)minimumDistanceToPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  double result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = -[ITKQuad containsPoint:](self, "containsPoint:");
  result = 0.0;
  if (!v6)
  {
    -[ITKQuad topLeft](self, "topLeft", 0.0);
    v28 = v8;
    v29 = v9;
    -[ITKQuad topRight](self, "topRight");
    v30 = v10;
    v31 = v11;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    v13 = fmin(v12, INFINITY);
    -[ITKQuad topRight](self, "topRight");
    v28 = v14;
    v29 = v15;
    -[ITKQuad bottomRight](self, "bottomRight");
    v30 = v16;
    v31 = v17;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (v18 < v13)
      v13 = v18;
    -[ITKQuad bottomRight](self, "bottomRight");
    v28 = v19;
    v29 = v20;
    -[ITKQuad bottomLeft](self, "bottomLeft");
    v30 = v21;
    v31 = v22;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (v23 < v13)
      v13 = v23;
    -[ITKQuad bottomLeft](self, "bottomLeft");
    v28 = v24;
    v29 = v25;
    -[ITKQuad topLeft](self, "topLeft");
    v30 = v26;
    v31 = v27;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (result >= v13)
      return v13;
  }
  return result;
}

- (double)distanceFromLine:(CGPoint *)a3 toPoint:(CGPoint)a4
{
  double result;

  ITKNearestPointOnLineSegmentToPoint();
  ITKDistance();
  return result;
}

- (CGPoint)topLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)topRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_topRight.x;
  y = self->_topRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomRight.x;
  y = self->_bottomRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

+ (CATransform3D)transformToConvertLayer:(SEL)a3 intoQuad:(id)a4 frame:(id)a5
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CATransform3D *result;
  CGFloat v32;
  CGFloat v33;
  double v34[9];

  v34[8] = *(double *)MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v9, "topLeft");
  v34[0] = v11;
  v34[1] = v12;
  objc_msgSend(v9, "topRight");
  v34[2] = v13;
  v34[3] = v14;
  objc_msgSend(v9, "bottomRight");
  v34[4] = v15;
  v34[5] = v16;
  objc_msgSend(v9, "bottomLeft");
  v18 = v17;
  v20 = v19;

  v34[6] = v18;
  v34[7] = v20;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  objc_msgSend(v10, "bounds");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v10, "anchorPoint");
  objc_msgSend(v10, "frame", computeCornerMatrix(v34, (uint64_t)retstr, v22, v24, v25, v26));
  v28 = v27;
  v30 = v29;
  objc_msgSend(v10, "anchorPoint");
  objc_msgSend(v10, "bounds");

  ITKPointFromNormalizedRect();
  result = (CATransform3D *)ITKMultiplyPointScalar();
  a6->origin.x = v32;
  a6->origin.y = v33;
  a6->size.width = v28;
  a6->size.height = v30;
  return result;
}

@end
