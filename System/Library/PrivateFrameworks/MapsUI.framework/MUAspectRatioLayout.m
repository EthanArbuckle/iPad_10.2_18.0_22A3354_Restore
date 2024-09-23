@implementation MUAspectRatioLayout

- (MUAspectRatioLayout)initWithItem:(id)a3 aspectRatio:(double)a4
{
  id v6;
  MUAspectRatioLayoutInternal *v7;
  MUAspectRatioLayout *v8;
  MUAspectRatioLayout *v9;
  objc_super v11;

  v6 = a3;
  v7 = -[MUAspectRatioLayoutInternal initWithItem:aspectRatio:]([MUAspectRatioLayoutInternal alloc], "initWithItem:aspectRatio:", v6, a4);

  v11.receiver = self;
  v11.super_class = (Class)MUAspectRatioLayout;
  v8 = -[MUConstraintLayout initWithInternal:](&v11, sel_initWithInternal_, v7);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_internal, v7);

  return v9;
}

- (MULayoutItem)item
{
  return -[MUAspectRatioLayoutInternal item](self->_internal, "item");
}

- (void)setItem:(id)a3
{
  -[MUAspectRatioLayoutInternal setItem:](self->_internal, "setItem:", a3);
}

- (double)aspectRatio
{
  double result;

  -[MUAspectRatioLayoutInternal aspectRatio](self->_internal, "aspectRatio");
  return result;
}

- (void)setAspectRatio:(double)a3
{
  -[MUAspectRatioLayoutInternal setAspectRatio:](self->_internal, "setAspectRatio:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
