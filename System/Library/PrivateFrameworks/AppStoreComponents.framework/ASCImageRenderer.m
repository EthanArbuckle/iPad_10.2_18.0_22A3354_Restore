@implementation ASCImageRenderer

- (ASCImageRenderer)initWithSize:(CGSize)a3 capInsets:(UIEdgeInsets)a4 renderingMode:(int64_t)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  ASCImageRenderer *result;
  objc_super v13;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)ASCImageRenderer;
  result = -[ASCImageRenderer init](&v13, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_capInsets.top = top;
    result->_capInsets.left = left;
    result->_capInsets.bottom = bottom;
    result->_capInsets.right = right;
    result->_renderingMode = a5;
  }
  return result;
}

- (ASCImageRenderer)initWithSize:(CGSize)a3
{
  return -[ASCImageRenderer initWithSize:capInsets:renderingMode:](self, "initWithSize:capInsets:renderingMode:", 0, a3.width, a3.height, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

+ (id)bundleImageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "asc_frameworkBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)systemImageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = a3;
  objc_msgSend(a4, "imageConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_systemImageNamed:withConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageWithActions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC3828]);
  -[ASCImageRenderer size](self, "size");
  v6 = (void *)objc_msgSend(v5, "initWithSize:");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__ASCImageRenderer_imageWithActions___block_invoke;
  v19[3] = &unk_1E7560890;
  v20 = v4;
  v7 = v4;
  objc_msgSend(v6, "imageWithActions:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCImageRenderer capInsets](self, "capInsets");
  if (v12 != *(double *)(MEMORY[0x1E0DC49E8] + 8)
    || v9 != *MEMORY[0x1E0DC49E8]
    || v11 != *(double *)(MEMORY[0x1E0DC49E8] + 24)
    || v10 != *(double *)(MEMORY[0x1E0DC49E8] + 16))
  {
    -[ASCImageRenderer capInsets](self, "capInsets");
    objc_msgSend(v8, "resizableImageWithCapInsets:");
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v16;
  }
  if (-[ASCImageRenderer renderingMode](self, "renderingMode") == 1)
  {
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v17;
  }

  return v8;
}

uint64_t __37__ASCImageRenderer_imageWithActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = a2;
  objc_msgSend(v3, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "CGContext");
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v6, v8, v10, v12);
}

- (unint64_t)hash
{
  ASCHasher *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCImageRenderer size](self, "size");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCImageRenderer size](self, "size");
  -[ASCHasher combineDouble:](v3, "combineDouble:", v4);
  -[ASCImageRenderer capInsets](self, "capInsets");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCImageRenderer capInsets](self, "capInsets");
  -[ASCHasher combineDouble:](v3, "combineDouble:", v5);
  -[ASCImageRenderer capInsets](self, "capInsets");
  -[ASCHasher combineDouble:](v3, "combineDouble:", v6);
  -[ASCImageRenderer capInsets](self, "capInsets");
  -[ASCHasher combineDouble:](v3, "combineDouble:", v7);
  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCImageRenderer renderingMode](self, "renderingMode"));
  v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  BOOL v27;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
    goto LABEL_14;
  -[ASCImageRenderer size](self, "size");
  v9 = v8;
  objc_msgSend(v7, "size");
  if (v9 != v10)
    goto LABEL_14;
  -[ASCImageRenderer size](self, "size");
  v12 = v11;
  objc_msgSend(v7, "size");
  if (v12 != v13)
    goto LABEL_14;
  -[ASCImageRenderer capInsets](self, "capInsets");
  v15 = v14;
  objc_msgSend(v7, "capInsets");
  if (v15 != v16)
    goto LABEL_14;
  -[ASCImageRenderer capInsets](self, "capInsets");
  v18 = v17;
  objc_msgSend(v7, "capInsets");
  if (v18 != v19)
    goto LABEL_14;
  -[ASCImageRenderer capInsets](self, "capInsets");
  v21 = v20;
  objc_msgSend(v7, "capInsets");
  if (v21 == v22
    && (-[ASCImageRenderer capInsets](self, "capInsets"), v24 = v23, objc_msgSend(v7, "capInsets"), v24 == v25))
  {
    v26 = -[ASCImageRenderer renderingMode](self, "renderingMode");
    v27 = v26 == objc_msgSend(v7, "renderingMode");
  }
  else
  {
LABEL_14:
    v27 = 0;
  }

  return v27;
}

- (id)description
{
  ASCDescriber *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  const __CFString *v19;
  void *v20;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ASCImageRenderer size](self, "size");
  v6 = v5;
  -[ASCImageRenderer size](self, "size");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("{%f, %f}"), v6, v7);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("size"));
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ASCImageRenderer capInsets](self, "capInsets");
  v11 = v10;
  -[ASCImageRenderer capInsets](self, "capInsets");
  v13 = v12;
  -[ASCImageRenderer capInsets](self, "capInsets");
  v15 = v14;
  -[ASCImageRenderer capInsets](self, "capInsets");
  v17 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("{%f, %f, %f, %f}"), v11, v13, v15, v16);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v17, CFSTR("capInsets"));
  v18 = -[ASCImageRenderer renderingMode](self, "renderingMode");
  if (!v18)
  {
    v19 = CFSTR("ASCImageRenderingModeAutomatic");
    goto LABEL_5;
  }
  if (v18 == 1)
  {
    v19 = CFSTR("ASCImageRenderingModeAlwaysTemplate");
LABEL_5:
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v19, CFSTR("renderingMode"));
  }
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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

- (UIEdgeInsets)capInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_capInsets.top;
  left = self->_capInsets.left;
  bottom = self->_capInsets.bottom;
  right = self->_capInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

@end
