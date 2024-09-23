@implementation LPSize

- (LPSize)init
{
  LPSize *v2;
  uint64_t v3;
  LPPointUnit *width;
  uint64_t v5;
  LPPointUnit *height;
  LPSize *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPSize;
  v2 = -[LPSize init](&v9, sel_init);
  if (v2)
  {
    +[LPPointUnit zero](LPPointUnit, "zero");
    v3 = objc_claimAutoreleasedReturnValue();
    width = v2->_width;
    v2->_width = (LPPointUnit *)v3;

    +[LPPointUnit zero](LPPointUnit, "zero");
    v5 = objc_claimAutoreleasedReturnValue();
    height = v2->_height;
    v2->_height = (LPPointUnit *)v5;

    v7 = v2;
  }

  return v2;
}

- (LPSize)initWithSize:(CGSize)a3
{
  double height;
  double width;
  LPSize *v5;
  LPPointUnit *v6;
  LPPointUnit *v7;
  LPPointUnit *v8;
  LPPointUnit *v9;
  LPSize *v10;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)LPSize;
  v5 = -[LPSize init](&v12, sel_init);
  if (v5)
  {
    v6 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", width);
    v7 = v5->_width;
    v5->_width = v6;

    v8 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", height);
    v9 = v5->_height;
    v5->_height = v8;

    v10 = v5;
  }

  return v5;
}

- (LPSize)initWithSquareSize:(double)a3
{
  LPSize *v4;
  LPPointUnit *v5;
  LPPointUnit *width;
  LPSize *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPSize;
  v4 = -[LPSize init](&v9, sel_init);
  if (v4)
  {
    v5 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", a3);
    width = v4->_width;
    v4->_width = v5;

    objc_storeStrong((id *)&v4->_height, v4->_width);
    v7 = v4;
  }

  return v4;
}

- (LPSize)initWithSquarePoints:(id)a3
{
  id v5;
  LPSize *v6;
  LPSize *v7;
  LPSize *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPSize;
  v6 = -[LPSize init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_width, a3);
    objc_storeStrong((id *)&v7->_height, a3);
    v8 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPSize *v4;
  id *p_isa;
  id *v6;

  v4 = +[LPSize allocWithZone:](LPSize, "allocWithZone:", a3);
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_width, self->_width);
    objc_storeStrong(p_isa + 2, self->_height);
    v6 = p_isa;
  }

  return p_isa;
}

- (CGSize)asSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[LPPointUnit value](self->_width, "value");
  v4 = v3;
  -[LPPointUnit value](self->_height, "value");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)isEmpty
{
  double v3;
  double v4;

  -[LPPointUnit value](self->_width, "value");
  if (v3 == 0.0)
    return 1;
  -[LPPointUnit value](self->_height, "value");
  return v4 == 0.0;
}

- (LPPointUnit)width
{
  return self->_width;
}

- (LPPointUnit)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
}

@end
