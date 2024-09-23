@implementation ICSPIPButton

+ (id)buttonWithType:(int64_t)a3 alignment:(int64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPIPButton buttonWithType:](ICSPIPButton, "buttonWithType:", a3));
  objc_msgSend(v5, "setAlignment:", a4);
  return v5;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double y;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat width;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double x;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  height = a3.size.height;
  y = a3.origin.y;
  v25.receiver = self;
  v25.super_class = (Class)ICSPIPButton;
  -[ICSPIPButton imageRectForContentRect:](&v25, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width);
  v7 = v6;
  v9 = v8;
  width = v10;
  v13 = v12;
  v14 = -[ICSPIPButton alignment](self, "alignment");
  v15 = y + 5.0;
  v16 = height - (v13 + 5.0);
  if (v14 != 1)
    v16 = v9;
  if (v14 == 2)
    v17 = y + 5.0;
  else
    v17 = v16;
  if (v14 == 2)
    x = 5.0;
  else
    x = v7;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", 5.0, v15, v16));
  objc_msgSend(v19, "scale");
  if (v20 == 1.0)
  {
    v26.origin.x = x;
    v26.origin.y = v17;
    v26.size.width = width;
    v26.size.height = v13;
    v27 = CGRectIntegral(v26);
    x = v27.origin.x;
    v17 = v27.origin.y;
    width = v27.size.width;
    v13 = v27.size.height;
  }

  v21 = x;
  v22 = v17;
  v23 = width;
  v24 = v13;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

@end
