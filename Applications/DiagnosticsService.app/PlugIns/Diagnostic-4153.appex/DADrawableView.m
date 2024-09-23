@implementation DADrawableView

- (DADrawableView)initWithFrame:(CGRect)a3 rectangleFillColor:(id)a4 rectangleEdgeColor:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  DADrawableView *v14;
  DADrawableView *v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)DADrawableView;
  v14 = -[DADrawableView initWithFrame:](&v18, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rectangleFillColor, a4);
    objc_storeStrong((id *)&v15->_rectangleEdgeColor, a5);
    v15->_isDrawing = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[DADrawableView setBackgroundColor:](v15, "setBackgroundColor:", v16);

  }
  return v15;
}

- (void)updateDrawing:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  UIView *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[DADrawableView isDrawing](self, "isDrawing"))
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
    objc_msgSend(v19, "setFrame:", x, y, width, height);
  }
  else
  {
    -[DADrawableView setIsDrawing:](self, "setIsDrawing:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));

    if (!v8)
    {
      v9 = objc_opt_new(UIView);
      -[DADrawableView setShapeView:](self, "setShapeView:", v9);

      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DADrawableView rectangleEdgeColor](self, "rectangleEdgeColor")));
      v11 = objc_msgSend(v10, "CGColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
      objc_msgSend(v13, "setBorderColor:", v11);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
      objc_msgSend(v15, "setBorderWidth:", 4.0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView rectangleFillColor](self, "rectangleFillColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
      objc_msgSend(v17, "setBackgroundColor:", v16);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
    objc_msgSend(v18, "setFrame:", x, y, width, height);

    v19 = (id)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
    -[DADrawableView addSubview:](self, "addSubview:");
  }

}

- (void)endDrawing
{
  void *v3;
  double y;
  double width;
  double height;
  void *v7;

  if (-[DADrawableView isDrawing](self, "isDrawing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
    objc_msgSend(v3, "removeFromSuperview");

    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADrawableView shapeView](self, "shapeView"));
    objc_msgSend(v7, "setFrame:", CGRectZero.origin.x, y, width, height);

    -[DADrawableView setIsDrawing:](self, "setIsDrawing:", 0);
  }
}

- (UIColor)rectangleEdgeColor
{
  return self->_rectangleEdgeColor;
}

- (void)setRectangleEdgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_rectangleEdgeColor, a3);
}

- (UIColor)rectangleFillColor
{
  return self->_rectangleFillColor;
}

- (void)setRectangleFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_rectangleFillColor, a3);
}

- (UIView)shapeView
{
  return self->_shapeView;
}

- (void)setShapeView:(id)a3
{
  objc_storeStrong((id *)&self->_shapeView, a3);
}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (void)setIsDrawing:(BOOL)a3
{
  self->_isDrawing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeView, 0);
  objc_storeStrong((id *)&self->_rectangleFillColor, 0);
  objc_storeStrong((id *)&self->_rectangleEdgeColor, 0);
}

@end
