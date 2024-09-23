@implementation CITextFeature

- (id)type
{
  return CFSTR("Text");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CITextFeature;
  -[CITextFeature dealloc](&v3, sel_dealloc);
}

- (CITextFeature)initWithBounds:(CGRect)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 bottomRight:(CGPoint)a7 subFeatures:(id)a8 messageString:(id)a9
{
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat height;
  CGFloat width;
  CGFloat v17;
  CGFloat v18;
  CITextFeature *v19;
  CITextFeature *v20;
  objc_super v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;

  y = a6.y;
  x = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  v13 = a4.y;
  v14 = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v17 = a3.origin.y;
  v18 = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CITextFeature;
  v19 = -[CIFeature init](&v22, sel_init, *(_QWORD *)&a6.x, *(_QWORD *)&a6.y, *(_QWORD *)&a7.x, *(_QWORD *)&a7.y, a8, a9);
  v20 = v19;
  if (v19)
  {
    v19->bounds.origin.x = v18;
    v19->bounds.origin.y = v17;
    v19->bounds.size.width = width;
    v19->bounds.size.height = height;
    v19->topLeft.x = v14;
    v19->topLeft.y = v13;
    v19->topRight.x = v12;
    v19->topRight.y = v11;
    v19->bottomLeft.x = v23;
    v19->bottomLeft.y = v24;
    v19->bottomRight.x = v25;
    v19->bottomRight.y = v26;
    v19->subFeatures = (NSArray *)objc_msgSend(*(id *)&x, "copy");
    v20->messageString = (NSString *)objc_msgSend(*(id *)&y, "copy");
  }
  return v20;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
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

- (CGPoint)topLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->topLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->topRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->bottomLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->bottomRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSArray)subFeatures
{
  return self->subFeatures;
}

- (NSString)messageString
{
  return self->messageString;
}

@end
