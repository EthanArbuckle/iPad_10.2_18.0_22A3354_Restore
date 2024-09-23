@implementation DOCFixedRadiusRoundedRectShapeProvider

- (DOCFixedRadiusRoundedRectShapeProvider)initWithCornerRadius:(double)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  DOCFixedRadiusRoundedRectShapeProvider *result;
  objc_super v10;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10.receiver = self;
  v10.super_class = (Class)DOCFixedRadiusRoundedRectShapeProvider;
  result = -[DOCFixedRadiusRoundedRectShapeProvider init](&v10, sel_init);
  if (result)
  {
    result->_cornerRadius = a3;
    result->_insets.top = top;
    result->_insets.left = left;
    result->_insets.bottom = bottom;
    result->_insets.right = right;
  }
  return result;
}

- (id)resolvedShapeInContext:(id)a3
{
  id v4;
  void *v5;
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
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;

  v4 = a3;
  objc_msgSend(v4, "contentShape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[DOCFixedRadiusRoundedRectShapeProvider insets](self, "insets");
  v15 = v7 + v14;
  v17 = v9 + v16;
  v19 = v11 - (v14 + v18);
  v21 = v13 - (v16 + v20);

  v22 = (void *)MEMORY[0x24BDF6D88];
  -[DOCFixedRadiusRoundedRectShapeProvider cornerRadius](self, "cornerRadius");
  objc_msgSend(v22, "fixedRectShapeWithRect:cornerRadius:", v15, v17, v19, v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resolvedShapeInContext:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_insets, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
