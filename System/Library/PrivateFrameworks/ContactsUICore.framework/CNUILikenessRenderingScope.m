@implementation CNUILikenessRenderingScope

- (PRMonogramColor)color
{
  return self->_color;
}

- (CGSize)pointSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pointSize.width;
  height = self->_pointSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)rightToLeft
{
  return self->_rightToLeft;
}

- (NSIndexSet)maskedAvatarIndices
{
  return self->_maskedAvatarIndices;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11
{
  _BOOL8 v14;
  double height;
  double width;
  id v21;
  id v22;
  void *v23;

  v14 = a7;
  height = a3.height;
  width = a3.width;
  v21 = a11;
  v22 = a10;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", a6, v14, a8, a9, v22, v21, width, height, a4, a5);

  return (CNUILikenessRenderingScope *)v23;
}

- (CNUILikenessRenderingScope)initWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11
{
  CGFloat height;
  CGFloat width;
  id v21;
  id v22;
  CNUILikenessRenderingScope *v23;
  CNUILikenessRenderingScope *v24;
  CGColorRef Copy;
  uint64_t v26;
  PRMonogramColor *color;
  uint64_t v28;
  NSIndexSet *maskedAvatarIndices;
  CNUILikenessRenderingScope *v30;
  objc_super v32;

  height = a3.height;
  width = a3.width;
  v21 = a10;
  v22 = a11;
  v32.receiver = self;
  v32.super_class = (Class)CNUILikenessRenderingScope;
  v23 = -[CNUILikenessRenderingScope init](&v32, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_pointSize.width = width;
    v23->_pointSize.height = height;
    v23->_scale = a4;
    v23->_strokeWidth = a5;
    Copy = CGColorCreateCopy(a6);
    v24->_rightToLeft = a7;
    v24->_strokeColor = Copy;
    v24->_style = a8;
    v24->_backgroundStyle = a9;
    v26 = objc_msgSend(v21, "copy");
    color = v24->_color;
    v24->_color = (PRMonogramColor *)v26;

    v28 = objc_msgSend(v22, "copy");
    maskedAvatarIndices = v24->_maskedAvatarIndices;
    v24->_maskedAvatarIndices = (NSIndexSet *)v28;

    v30 = v24;
  }

  return v24;
}

- (void)dealloc
{
  CGColor *strokeColor;
  objc_super v4;

  strokeColor = self->_strokeColor;
  if (strokeColor)
    CGColorRelease(strokeColor);
  v4.receiver = self;
  v4.super_class = (Class)CNUILikenessRenderingScope;
  -[CNUILikenessRenderingScope dealloc](&v4, sel_dealloc);
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)style
{
  return self->_style;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (CGColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setExcludePointSizeInEqualityCheck:(BOOL)a3
{
  self->_excludePointSizeInEqualityCheck = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNUILikenessRenderingScope *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGColor *v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  CNUILikenessRenderingScope *v19;

  v4 = [CNUILikenessRenderingScope alloc];
  -[CNUILikenessRenderingScope pointSize](self, "pointSize");
  v6 = v5;
  v8 = v7;
  -[CNUILikenessRenderingScope scale](self, "scale");
  v10 = v9;
  -[CNUILikenessRenderingScope strokeWidth](self, "strokeWidth");
  v12 = v11;
  v13 = -[CNUILikenessRenderingScope strokeColor](self, "strokeColor");
  v14 = -[CNUILikenessRenderingScope rightToLeft](self, "rightToLeft");
  v15 = -[CNUILikenessRenderingScope style](self, "style");
  v16 = -[CNUILikenessRenderingScope backgroundStyle](self, "backgroundStyle");
  -[CNUILikenessRenderingScope color](self, "color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUILikenessRenderingScope maskedAvatarIndices](self, "maskedAvatarIndices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CNUILikenessRenderingScope initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:](v4, "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", v13, v14, v15, v16, v17, v18, v6, v8, v10, v12);

  -[CNUILikenessRenderingScope setExcludePointSizeInEqualityCheck:](v19, "setExcludePointSizeInEqualityCheck:", -[CNUILikenessRenderingScope excludePointSizeInEqualityCheck](self, "excludePointSizeInEqualityCheck"));
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  CNUILikenessRenderingScope *v4;
  BOOL v5;
  PRMonogramColor *color;
  NSIndexSet *maskedAvatarIndices;
  BOOL v8;

  v4 = (CNUILikenessRenderingScope *)a3;
  v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || !-[CNUILikenessRenderingScope excludePointSizeInEqualityCheck](self, "excludePointSizeInEqualityCheck")
      && (self->_pointSize.width == v4->_pointSize.width
        ? (v5 = self->_pointSize.height == v4->_pointSize.height)
        : (v5 = 0),
          !v5)
      || vabdd_f64(self->_scale, v4->_scale) >= 0.0001
      || vabdd_f64(self->_strokeWidth, v4->_strokeWidth) >= 0.0001
      || !CGColorEqualToColor(self->_strokeColor, v4->_strokeColor)
      || !self->_rightToLeft == v4->_rightToLeft
      || self->_style != v4->_style
      || self->_backgroundStyle != v4->_backgroundStyle
      || (color = self->_color, (unint64_t)color | (unint64_t)v4->_color)
      && !-[PRMonogramColor isEqual:](color, "isEqual:")
      || (maskedAvatarIndices = self->_maskedAvatarIndices,
          (unint64_t)maskedAvatarIndices | (unint64_t)v4->_maskedAvatarIndices)
      && !-[NSIndexSet isEqual:](maskedAvatarIndices, "isEqual:"))
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *strokeColor;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (-[CNUILikenessRenderingScope excludePointSizeInEqualityCheck](self, "excludePointSizeInEqualityCheck"))
    v3 = 527;
  else
    v3 = 31 * objc_msgSend(MEMORY[0x1E0D13A78], "cgsizeHash:", self->_pointSize.width, self->_pointSize.height) + 16337;
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "cgfloatHash:", self->_scale);
  v5 = objc_msgSend(MEMORY[0x1E0D13A78], "cgfloatHash:", self->_strokeWidth);
  strokeColor = self->_strokeColor;
  if (strokeColor)
    strokeColor = (const void *)CFHash(strokeColor);
  v7 = v5 - (v4 + v3) + 32 * (v4 + v3);
  v8 = self->_rightToLeft - ((_QWORD)strokeColor + 32 * v7 - v7) + 32 * ((_QWORD)strokeColor + 32 * v7 - v7);
  v9 = self->_style - v8 + 32 * v8;
  v10 = self->_backgroundStyle - v9 + 32 * v9;
  v11 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_color) - v10 + 32 * v10;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_maskedAvatarIndices) - v11 + 32 * v11;
}

- (BOOL)excludePointSizeInEqualityCheck
{
  return self->_excludePointSizeInEqualityCheck;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskedAvatarIndices, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 color:(id)a9
{
  _BOOL8 v10;
  double height;
  double width;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v10 = a7;
  height = a3.height;
  width = a3.width;
  v17 = a9;
  v18 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", a6, v10, a8, 0, v17, v19, width, height, a4, a5);

  return (CNUILikenessRenderingScope *)v20;
}

+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 color:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v8 = a5;
  height = a3.height;
  width = a3.width;
  v13 = a7;
  v14 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", 0, v8, a6, 0, v13, v15, width, height, a4, 0.0);

  return (CNUILikenessRenderingScope *)v16;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  void *v26;
  NSSize v28;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUILikenessRenderingScope pointSize](self, "pointSize");
  NSStringFromSize(v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("pointSize"), v4);

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[CNUILikenessRenderingScope scale](self, "scale");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%.1f"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scale"), v8);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[CNUILikenessRenderingScope strokeWidth](self, "strokeWidth");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%.1f"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("strokeWidth"), v12);

  if (-[CNUILikenessRenderingScope rightToLeft](self, "rightToLeft"))
    v14 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("text-direction"), CFSTR("RTL"));
  -[CNUILikenessRenderingScope color](self, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CNUILikenessRenderingScope color](self, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("color"), v17);

  }
  v19 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("style"), -[CNUILikenessRenderingScope style](self, "style"));
  v20 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("backgroundStyle"), -[CNUILikenessRenderingScope backgroundStyle](self, "backgroundStyle"));
  -[CNUILikenessRenderingScope maskedAvatarIndices](self, "maskedAvatarIndices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "_cn_map:", &__block_literal_global_6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = &stru_1EA606688;
  }
  v25 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("maskedAvatarIndices"), v24);

  objc_msgSend(v3, "build");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)setStrokeColor:(CGColor *)a3
{
  CGColor *strokeColor;

  strokeColor = self->_strokeColor;
  if (strokeColor != a3)
  {
    if (strokeColor)
      CGColorRelease(strokeColor);
    self->_strokeColor = CGColorRetain(a3);
  }
}

@end
