@implementation MUSizeLayout

+ (double)useIntrinsicContentSize
{
  double result;

  +[MUSizeLayoutInternal useIntrinsicContentSize](MUSizeLayoutInternal, "useIntrinsicContentSize");
  return result;
}

- (MUSizeLayout)initWithItem:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  MUSizeLayoutInternal *v8;
  MUSizeLayout *v9;
  MUSizeLayout *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = -[MUSizeLayoutInternal initWithItem:size:]([MUSizeLayoutInternal alloc], "initWithItem:size:", v7, width, height);

  v12.receiver = self;
  v12.super_class = (Class)MUSizeLayout;
  v9 = -[MUConstraintLayout initWithInternal:](&v12, sel_initWithInternal_, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_internal, v8);

  return v10;
}

- (MUSizeLayout)initWithItem:(id)a3 size:(CGSize)a4 priority:(float)a5
{
  double height;
  double width;
  id v9;
  MUSizeLayoutInternal *v10;
  double v11;
  MUSizeLayoutInternal *v12;
  MUSizeLayout *v13;
  MUSizeLayout *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = [MUSizeLayoutInternal alloc];
  *(float *)&v11 = a5;
  v12 = -[MUSizeLayoutInternal initWithItem:size:priority:](v10, "initWithItem:size:priority:", v9, width, height, v11);

  v16.receiver = self;
  v16.super_class = (Class)MUSizeLayout;
  v13 = -[MUConstraintLayout initWithInternal:](&v16, sel_initWithInternal_, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_internal, v12);

  return v14;
}

- (MULayoutItem)item
{
  return -[MUSizeLayoutInternal item](self->_internal, "item");
}

- (void)setItem:(id)a3
{
  -[MUSizeLayoutInternal setItem:](self->_internal, "setItem:", a3);
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[MUSizeLayoutInternal size](self->_internal, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  -[MUSizeLayoutInternal setSize:](self->_internal, "setSize:", a3.width, a3.height);
}

- (float)priority
{
  float result;

  -[MUSizeLayoutInternal priority](self->_internal, "priority");
  return result;
}

- (void)setPriority:(float)a3
{
  -[MUSizeLayoutInternal setPriority:](self->_internal, "setPriority:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
