@implementation HRMonogrammer

- (HRMonogrammer)initWithDiameter:(double)a3
{
  HRMonogrammer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRMonogrammer;
  result = -[HRMonogrammer init](&v5, sel_init);
  if (result)
  {
    result->_monogramSize.width = a3;
    result->_monogramSize.height = a3;
  }
  return result;
}

- (id)_monogramSymbolNameWith:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", &stru_1E74EA150);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (__CFString *)objc_msgSend(v8, "mutableCopy");
  CFStringTransform(v9, 0, (CFStringRef)*MEMORY[0x1E0C9B360], 0);
  CFStringTransform(v9, 0, (CFStringRef)*MEMORY[0x1E0C9B358], 0);
  -[__CFString lowercaseString](v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v10, "substringToIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (__CFString *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.circle.fill"), v12);

  }
  else
  {
    v13 = CFSTR("number.circle.fill");
  }

  return v13;
}

- (id)_monogramWith:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[HRMonogrammer _monogramSymbolNameWith:](self, "_monogramSymbolNameWith:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, self->_monogramSize.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.65, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithPaletteColors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "configurationByApplyingConfiguration:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "imageWithoutBaseline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("number.circle.fill"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithoutBaseline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (CGSize)monogramSize
{
  double width;
  double height;
  CGSize result;

  width = self->_monogramSize.width;
  height = self->_monogramSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMonogramSize:(CGSize)a3
{
  self->_monogramSize = a3;
}

@end
