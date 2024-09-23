@implementation HUGridCameraCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HUGridCameraCellLayoutOptions;
  objc_msgSendSuper2(&v9, sel_defaultOptionsForCellSizeSubclass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = &unk_1E7041A10;
  v10[1] = &unk_1E70419F8;
  v11[0] = &unk_1E7043748;
  v11[1] = &unk_1E7043768;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HUConstantForCellSizeSubclass(a3, v5);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v6, *MEMORY[0x1E0CEB5D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v7);

  objc_msgSend(v4, "setHeaderViewHeight:", 36.0);
  objc_msgSend(v4, "setCameraViewAspectRatio:", 1.77777778);
  objc_msgSend(v4, "setHeaderHorizontalInnerMargins:", 10.0);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridCameraCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[HUGridCameraCellLayoutOptions headerViewHeight](self, "headerViewHeight");
  objc_msgSend(v4, "setHeaderViewHeight:");
  -[HUGridCameraCellLayoutOptions cameraViewAspectRatio](self, "cameraViewAspectRatio");
  objc_msgSend(v4, "setCameraViewAspectRatio:");
  -[HUGridCameraCellLayoutOptions headerHorizontalInnerMargins](self, "headerHorizontalInnerMargins");
  objc_msgSend(v4, "setHeaderHorizontalInnerMargins:");
  -[HUGridCameraCellLayoutOptions cellHeight](self, "cellHeight");
  objc_msgSend(v4, "setCellHeight:");
  return v4;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_headerViewHeight = a3;
}

- (void)setHeaderHorizontalInnerMargins:(double)a3
{
  self->_headerHorizontalInnerMargins = a3;
}

- (void)setCameraViewAspectRatio:(double)a3
{
  self->_cameraViewAspectRatio = a3;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (double)headerHorizontalInnerMargins
{
  return self->_headerHorizontalInnerMargins;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (double)cameraViewAspectRatio
{
  return self->_cameraViewAspectRatio;
}

@end
