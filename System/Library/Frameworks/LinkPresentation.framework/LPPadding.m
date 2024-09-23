@implementation LPPadding

- (LPPadding)init
{
  LPPadding *v2;
  uint64_t v3;
  LPPointUnit *top;
  uint64_t v5;
  LPPointUnit *leading;
  uint64_t v7;
  LPPointUnit *bottom;
  uint64_t v9;
  LPPointUnit *trailing;
  LPPadding *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LPPadding;
  v2 = -[LPPadding init](&v13, sel_init);
  if (v2)
  {
    +[LPPointUnit zero](LPPointUnit, "zero");
    v3 = objc_claimAutoreleasedReturnValue();
    top = v2->_top;
    v2->_top = (LPPointUnit *)v3;

    +[LPPointUnit zero](LPPointUnit, "zero");
    v5 = objc_claimAutoreleasedReturnValue();
    leading = v2->_leading;
    v2->_leading = (LPPointUnit *)v5;

    +[LPPointUnit zero](LPPointUnit, "zero");
    v7 = objc_claimAutoreleasedReturnValue();
    bottom = v2->_bottom;
    v2->_bottom = (LPPointUnit *)v7;

    +[LPPointUnit zero](LPPointUnit, "zero");
    v9 = objc_claimAutoreleasedReturnValue();
    trailing = v2->_trailing;
    v2->_trailing = (LPPointUnit *)v9;

    v11 = v2;
  }

  return v2;
}

- (UIEdgeInsets)asInsetsForLTR:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = a3;
  -[LPPointUnit value](self->_top, "value");
  v6 = v5;
  if (v3)
    v7 = 16;
  else
    v7 = 32;
  if (v3)
    v8 = 32;
  else
    v8 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "value");
  v10 = v9;
  -[LPPointUnit value](self->_bottom, "value");
  v12 = v11;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "value");
  v14 = v13;
  v15 = v6;
  v16 = v10;
  v17 = v12;
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)_lp_CSSText
{
  _BOOL4 IsLTR;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  IsLTR = appIsLTR();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[LPPointUnit value](self->_top, "value");
  v6 = v5;
  if (IsLTR)
    v7 = 32;
  else
    v7 = 16;
  if (IsLTR)
    v8 = 16;
  else
    v8 = 32;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "value");
  v10 = v9;
  -[LPPointUnit value](self->_bottom, "value");
  v12 = v11;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "value");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%gpx %gpx %gpx %gpx"), v6, v10, v12, v13);
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPPadding *v4;
  id *p_isa;
  id *v6;

  v4 = +[LPPadding allocWithZone:](LPPadding, "allocWithZone:", a3);
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_top, self->_top);
    objc_storeStrong(p_isa + 2, self->_leading);
    objc_storeStrong(p_isa + 3, self->_bottom);
    objc_storeStrong(p_isa + 4, self->_trailing);
    v6 = p_isa;
  }

  return p_isa;
}

- (LPPointUnit)top
{
  return self->_top;
}

- (void)setTop:(id)a3
{
  objc_storeStrong((id *)&self->_top, a3);
}

- (LPPointUnit)leading
{
  return self->_leading;
}

- (void)setLeading:(id)a3
{
  objc_storeStrong((id *)&self->_leading, a3);
}

- (LPPointUnit)bottom
{
  return self->_bottom;
}

- (void)setBottom:(id)a3
{
  objc_storeStrong((id *)&self->_bottom, a3);
}

- (LPPointUnit)trailing
{
  return self->_trailing;
}

- (void)setTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_trailing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_leading, 0);
  objc_storeStrong((id *)&self->_top, 0);
}

@end
