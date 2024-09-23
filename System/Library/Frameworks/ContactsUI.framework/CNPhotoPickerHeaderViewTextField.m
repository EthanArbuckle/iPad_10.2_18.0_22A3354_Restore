@implementation CNPhotoPickerHeaderViewTextField

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width;
  double y;
  double x;
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
  double height;
  objc_super v26;
  objc_super v27;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)CNPhotoPickerHeaderViewTextField;
  height = a3.size.height;
  -[CNPhotoPickerHeaderViewTextField editingRectForBounds:](&v27, sel_editingRectForBounds_);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (-[CNPhotoPickerHeaderViewTextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)v15 = -10.0;
  else
    v15 = 10.0;
  v16 = v12 + 10.0;
  -[CNPhotoPickerHeaderViewTextField maxWidth](self, "maxWidth");
  if (v16 >= v17)
  {
    v26.receiver = self;
    v26.super_class = (Class)CNPhotoPickerHeaderViewTextField;
    -[CNPhotoPickerHeaderViewTextField editingRectForBounds:](&v26, sel_editingRectForBounds_, x, y, width, height);
    v10 = v19;
    v16 = v20;
    v14 = v21;
  }
  else
  {
    v18 = v8 - v15;
  }
  v22 = v10;
  v23 = v16;
  v24 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v18;
  return result;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

@end
