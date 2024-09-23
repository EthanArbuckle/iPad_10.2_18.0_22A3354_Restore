@implementation NSCollectionLayoutSize

- (unint64_t)_containerSizeDependentAxes
{
  int64_t widthSemantic;
  int64_t heightSemantic;
  unint64_t v5;

  widthSemantic = self->_widthSemantic;
  heightSemantic = self->_heightSemantic;
  v5 = widthSemantic == 1 || heightSemantic == 1;
  if (heightSemantic == 2 || widthSemantic == 2)
    return v5 | 2;
  else
    return v5;
}

- (unint64_t)_axesUniformAcrossSiblings
{
  if (self->_heightSemantic == 4)
    return (self->_widthSemantic == 4) | 2;
  else
    return self->_widthSemantic == 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightDimension, 0);
  objc_storeStrong((id *)&self->_widthDimension, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutSize size](self, "size");
  v6 = v5;
  v8 = v7;
  v9 = -[NSCollectionLayoutSize widthSemantic](self, "widthSemantic");
  v10 = -[NSCollectionLayoutSize heightSemantic](self, "heightSemantic");
  -[NSCollectionLayoutSize widthDimension](self, "widthDimension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSize heightDimension](self, "heightDimension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithSize:widthSemantic:heightSemantic:width:height:", v9, v10, v11, v12, v6, v8);

  return v13;
}

- (BOOL)_isEstimatedForAxis:(unint64_t)a3
{
  void *v4;
  void *v6;
  void *v7;
  char v8;

  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 2043, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("axis == CVCAxisHorizontal || axis == CVCAxisVertical"));

    goto LABEL_5;
  }
  if (a3 != 2)
  {
LABEL_5:
    -[NSCollectionLayoutSize widthDimension](self, "widthDimension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[NSCollectionLayoutSize heightDimension](self, "heightDimension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = v4;
  v8 = objc_msgSend(v4, "isEstimated");

  return v8;
}

- (NSCollectionLayoutDimension)heightDimension
{
  return self->_heightDimension;
}

- (NSCollectionLayoutDimension)widthDimension
{
  return self->_widthDimension;
}

- (CGSize)_effectiveSizeForContainer:(id)a3 displayScale:(double)a4 ignoringInsets:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double width;
  int64_t widthSemantic;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[4];
  id v26;
  NSCollectionLayoutSize *v27;
  _QWORD *v28;
  double v29;
  double v30;
  SEL v31;
  _QWORD v32[5];
  CGSize result;

  v5 = a5;
  v9 = a3;
  objc_msgSend(v9, "contentInsets");
  v32[0] = MEMORY[0x1E0C809B0];
  *(double *)&v32[4] = a4;
  v14 = v12 + v13;
  if (v5)
    v14 = 0.0;
  v32[1] = 3221225472;
  v32[2] = __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke;
  v32[3] = &__block_descriptor_40_e8_d16__0d8l;
  v15 = v10 + v11;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  if (v5)
    v15 = 0.0;
  v25[2] = __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke_2;
  v25[3] = &unk_1EA7CE480;
  v27 = self;
  v28 = v32;
  v29 = v15;
  v30 = v14;
  v31 = a2;
  v26 = v9;
  width = self->_size.width;
  widthSemantic = self->_widthSemantic;
  v18 = v9;
  __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke_2((uint64_t)v25, widthSemantic, width);
  v20 = v19;
  __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke_2((uint64_t)v25, self->_heightSemantic, self->_size.height);
  v22 = v21;

  v23 = v20;
  v24 = v22;
  result.height = v24;
  result.width = v23;
  return result;
}

void __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  switch(a2)
  {
    case 0:
    case 3:
    case 4:
      return;
    case 1:
      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "contentSize");
      v7 = v6 - *(double *)(a1 + 56);
      goto LABEL_5;
    case 2:
      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "contentSize");
      v7 = v9 - *(double *)(a1 + 64);
LABEL_5:
      (*(void (**)(uint64_t, double))(v5 + 16))(v5, v7 * a3);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("NSCollectionLayoutItem.m"), 2023, CFSTR("Unhandled dimensionSemantic."));

      break;
  }
}

double __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke(uint64_t a1, double result)
{
  double v2;

  v2 = *(double *)(a1 + 32);
  if (v2 > 0.0)
    return floor(v2 * result) / v2;
  return result;
}

- (NSCollectionLayoutSize)initWithSize:(CGSize)a3 widthSemantic:(int64_t)a4 heightSemantic:(int64_t)a5 width:(id)a6 height:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  NSCollectionLayoutSize *v16;
  NSCollectionLayoutSize *v17;
  objc_super v19;

  height = a3.height;
  width = a3.width;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NSCollectionLayoutSize;
  v16 = -[NSCollectionLayoutSize init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_size.width = width;
    v16->_size.height = height;
    v16->_widthSemantic = a4;
    v16->_heightSemantic = a5;
    objc_storeStrong((id *)&v16->_widthDimension, a6);
    objc_storeStrong((id *)&v17->_heightDimension, a7);
  }

  return v17;
}

- (int64_t)widthSemantic
{
  return self->_widthSemantic;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)heightSemantic
{
  return self->_heightSemantic;
}

+ (NSCollectionLayoutSize)sizeWithWidthDimension:(NSCollectionLayoutDimension *)width heightDimension:(NSCollectionLayoutDimension *)height
{
  NSCollectionLayoutDimension *v6;
  NSCollectionLayoutDimension *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v6 = height;
  v7 = width;
  v8 = -[NSCollectionLayoutDimension semantic](v7, "semantic");
  v9 = -[NSCollectionLayoutDimension semantic](v6, "semantic");
  -[NSCollectionLayoutDimension dimension](v7, "dimension");
  v11 = v10;
  -[NSCollectionLayoutDimension dimension](v6, "dimension");
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", v8, v9, v7, v6, v11, v12);

  return (NSCollectionLayoutSize *)v13;
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutSize *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (NSCollectionLayoutSize *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[NSCollectionLayoutSize widthDimension](self, "widthDimension"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSCollectionLayoutSize widthDimension](v4, "widthDimension"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = __objectEqual(v5, v6),
          v6,
          v5,
          v7))
    {
      -[NSCollectionLayoutSize heightDimension](self, "heightDimension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutSize heightDimension](v4, "heightDimension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = __objectEqual(v8, v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isEstimated
{
  int64_t widthSemantic;

  widthSemantic = self->_widthSemantic;
  if (widthSemantic == 3)
    return 1;
  return widthSemantic == 4 || (unint64_t)(self->_heightSemantic - 3) < 2;
}

- (id)description
{
  unint64_t widthSemantic;
  const __CFString *v3;
  unint64_t heightSemantic;
  const __CFString *v5;

  widthSemantic = self->_widthSemantic;
  if (widthSemantic > 4)
    v3 = &stru_1EA7CEF88;
  else
    v3 = off_1EA7CE520[widthSemantic];
  heightSemantic = self->_heightSemantic;
  if (heightSemantic > 4)
    v5 = &stru_1EA7CEF88;
  else
    v5 = off_1EA7CE520[heightSemantic];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@(%g), %@(%g)}"), v3, *(_QWORD *)&self->_size.width, v5, *(_QWORD *)&self->_size.height);
}

+ (NSCollectionLayoutSize)sizeWithContainerSize
{
  void *v3;
  void *v4;
  void *v5;

  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 1, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 2, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", objc_msgSend(v3, "semantic"), objc_msgSend(v4, "semantic"), v3, v4, 1.0, 1.0);

  return (NSCollectionLayoutSize *)v5;
}

- (BOOL)isContainerSize
{
  return self->_widthSemantic == 1
      && fabs(self->_size.width + -1.0) < 2.22044605e-16
      && self->_heightSemantic == 2
      && fabs(self->_size.height + -1.0) < 2.22044605e-16;
}

+ (NSCollectionLayoutSize)sizeWithAbsoluteSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 0, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", 0, 0, v6, v7, width, height);

  return (NSCollectionLayoutSize *)v8;
}

+ (NSCollectionLayoutSize)sizeWithContainerWidthFactor:(double)a3 containerHeightFactor:(double)a4
{
  void *v7;
  void *v8;
  void *v9;

  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 2, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", 1, 2, v7, v8, a3, a4);

  return (NSCollectionLayoutSize *)v9;
}

+ (NSCollectionLayoutSize)sizeWithSize:(CGSize)a3 widthSemantic:(int64_t)a4 heightSemantic:(int64_t)a5
{
  double height;
  double width;
  void *v10;
  void *v11;
  void *v12;

  height = a3.height;
  width = a3.width;
  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 2, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", a4, a5, v10, v11, width, height);

  return (NSCollectionLayoutSize *)v12;
}

+ (NSCollectionLayoutSize)sizeWithWidth:(double)a3 widthSemantic:(int64_t)a4 height:(double)a5 heightSemantic:(int64_t)a6
{
  void *v11;
  void *v12;
  void *v13;

  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 2, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", a4, a6, v11, v12, a3, a5);

  return (NSCollectionLayoutSize *)v13;
}

- (void)setWidthDimension:(id)a3
{
  objc_storeStrong((id *)&self->_widthDimension, a3);
}

- (void)setHeightDimension:(id)a3
{
  objc_storeStrong((id *)&self->_heightDimension, a3);
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setWidthSemantic:(int64_t)a3
{
  self->_widthSemantic = a3;
}

- (void)setHeightSemantic:(int64_t)a3
{
  self->_heightSemantic = a3;
}

@end
