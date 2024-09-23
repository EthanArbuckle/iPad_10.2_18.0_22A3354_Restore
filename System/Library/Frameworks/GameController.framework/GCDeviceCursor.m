@implementation GCDeviceCursor

- (GCDeviceCursor)initWithDigital:(BOOL)a3 descriptionName:(id)a4
{
  GCDeviceCursor *v4;
  GCDeviceCursor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCDeviceCursor;
  v4 = -[GCControllerDirectionPad initWithDigital:descriptionName:](&v7, sel_initWithDigital_descriptionName_, a3, a4);
  v5 = v4;
  if (v4)
    -[GCDeviceCursor setFrame:](v4, "setFrame:", -1.0, -1.0, 2.0, 2.0);
  return v5;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_frame;
  void *v9;
  float MinX;
  CGFloat MaxX;
  double v12;
  float MinY;
  CGFloat MaxY;
  double v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_frame = &self->_frame;
  if (!CGRectEqualToRect(a3, self->_frame))
  {
    p_frame->origin.x = x;
    p_frame->origin.y = y;
    p_frame->size.width = width;
    p_frame->size.height = height;
    -[GCControllerDirectionPad xAxis](self, "xAxis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinX = CGRectGetMinX(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MaxX = CGRectGetMaxX(v18);
    *(float *)&v12 = MaxX;
    *(float *)&MaxX = MinX;
    objc_msgSend(v9, "setMinValue:andMaxValue:", MaxX, v12);

    -[GCControllerDirectionPad yAxis](self, "yAxis");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MinY = CGRectGetMinY(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    MaxY = CGRectGetMaxY(v20);
    *(float *)&v15 = MaxY;
    *(float *)&MaxY = MinY;
    objc_msgSend(v16, "setMinValue:andMaxValue:", MaxY, v15);

  }
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
