@implementation AIRecognizedText

- (AIRecognizedText)initWithTextObservation:(id)a3
{
  id v4;
  AIRecognizedText *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double MidX;
  double v11;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AIRecognizedText;
  v5 = -[AIRecognizedText init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "topCandidates:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText setRecognizedText:](v5, "setRecognizedText:", v7);

    -[AIRecognizedText recognizedText](v5, "recognizedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText setString:](v5, "setString:", v9);

    objc_msgSend(v4, "boundingBox");
    MidX = CGRectGetMidX(v14);
    objc_msgSend(v4, "boundingBox");
    -[AIRecognizedText setCenter:](v5, "setCenter:", MidX, CGRectGetMidY(v15));
    objc_msgSend(v4, "boundingBox");
    -[AIRecognizedText setWidth:](v5, "setWidth:", v11);
  }

  return v5;
}

- (AIRecognizedText)initWithTextObservation:(id)a3 regionOfInterest:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  AIRecognizedText *v8;
  AIRecognizedText *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = -[AIRecognizedText initWithTextObservation:](self, "initWithTextObservation:", a3);
  v9 = v8;
  if (v8)
  {
    -[AIRecognizedText setRegionOfInterest:](v8, "setRegionOfInterest:", x, y, width, height);
    -[AIRecognizedText center](v9, "center");
    v11 = v10;
    v13 = v12;
    -[AIRecognizedText regionOfInterest](v9, "regionOfInterest");
    -[AIRecognizedText _point:adjustedByRegionOfInterest:](v9, "_point:adjustedByRegionOfInterest:", v11, v13, v14, v15, v16, v17);
    -[AIRecognizedText setCenter:](v9, "setCenter:");
  }
  return v9;
}

- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4 width:(double)a5 numericalValue:(id)a6
{
  AIRecognizedText *v7;
  AIRecognizedText *v8;

  v7 = -[AIRecognizedText initWithString:center:numericalValue:](self, "initWithString:center:numericalValue:", a3, a6, a4.x, a4.y);
  v8 = v7;
  if (v7)
    -[AIRecognizedText setWidth:](v7, "setWidth:", a5);
  return v8;
}

- (CGRect)boundingBoxForRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[AIRecognizedText recognizedText](self, "recognizedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AIRecognizedText recognizedText](self, "recognizedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundingBoxForRange:error:", location, length, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "topLeft");
    v12 = v11;
    v14 = v13;
    -[AIRecognizedText regionOfInterest](self, "regionOfInterest");
    -[AIRecognizedText _point:adjustedByRegionOfInterest:](self, "_point:adjustedByRegionOfInterest:", v12, v14, v15, v16, v17, v18);
    v20 = v19;
    v22 = v21;
    objc_msgSend(v10, "topRight");
    v24 = v23;
    v26 = v25;
    -[AIRecognizedText regionOfInterest](self, "regionOfInterest");
    -[AIRecognizedText _point:adjustedByRegionOfInterest:](self, "_point:adjustedByRegionOfInterest:", v24, v26, v27, v28, v29, v30);
    v32 = v31 - v20;
    v34 = v33 - v22;

  }
  else
  {
    v20 = *MEMORY[0x24BDBF090];
    v22 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v32 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v34 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v35 = v20;
  v36 = v22;
  v37 = v32;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGPoint)_point:(CGPoint)a3 adjustedByRegionOfInterest:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  if (!CGRectIsEmpty(a4))
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v10 = CGRectGetWidth(v15);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v11 = CGRectGetHeight(v16);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v9 = CGRectGetMinX(v17) + v10 * v9;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v8 = CGRectGetMinY(v18) + v11 * v8;
  }
  v12 = v9;
  v13 = v8;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_super v13;
  objc_super v14;
  CGPoint v15;
  CGPoint v16;

  -[AIRecognizedText numericalValue](self, "numericalValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    v14.receiver = self;
    v14.super_class = (Class)AIRecognizedText;
    -[AIRecognizedText description](&v14, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText string](self, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText numericalValue](self, "numericalValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText center](self, "center");
    NSStringFromCGPoint(v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText width](self, "width");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ '%@' (%@) at point %@ width %f"), v5, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AIRecognizedText;
    -[AIRecognizedText description](&v13, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText string](self, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText center](self, "center");
    NSStringFromCGPoint(v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIRecognizedText width](self, "width");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ '%@' at point %@ width %f"), v5, v6, v7, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (AIRecognizedText)initWithString:(id)a3
{
  id v4;
  AIRecognizedText *v5;
  AIRecognizedText *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AIRecognizedText;
  v5 = -[AIRecognizedText init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AIRecognizedText setString:](v5, "setString:", v4);

  return v6;
}

- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4
{
  double y;
  double x;
  AIRecognizedText *v6;
  AIRecognizedText *v7;

  y = a4.y;
  x = a4.x;
  v6 = -[AIRecognizedText initWithString:](self, "initWithString:", a3);
  v7 = v6;
  if (v6)
    -[AIRecognizedText setCenter:](v6, "setCenter:", x, y);
  return v7;
}

- (AIRecognizedText)initWithString:(id)a3 center:(CGPoint)a4 numericalValue:(id)a5
{
  double y;
  double x;
  id v9;
  AIRecognizedText *v10;
  AIRecognizedText *v11;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = -[AIRecognizedText initWithString:center:](self, "initWithString:center:", a3, x, y);
  v11 = v10;
  if (v10)
    -[AIRecognizedText setNumericalValue:](v10, "setNumericalValue:", v9);

  return v11;
}

- (NSNumber)numericalValue
{
  return self->_numericalValue;
}

- (void)setNumericalValue:(id)a3
{
  objc_storeStrong((id *)&self->_numericalValue, a3);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (VNRecognizedText)recognizedText
{
  return self->_recognizedText;
}

- (void)setRecognizedText:(id)a3
{
  objc_storeStrong((id *)&self->_recognizedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_numericalValue, 0);
}

@end
