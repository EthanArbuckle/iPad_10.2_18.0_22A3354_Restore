@implementation PKTextInputTextPlaceholder

+ (PKTextInputTextPlaceholder)placeholderWithTextPlaceholder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setPlaceholder:", v4);

  return (PKTextInputTextPlaceholder *)v5;
}

+ (PKTextInputTextPlaceholder)placeholderWithWebTextPlaceholder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setPlaceholder:", v4);

  objc_msgSend(v5, "setShouldIgnoreOrigin:", 1);
  return (PKTextInputTextPlaceholder *)v5;
}

+ (PKTextInputTextPlaceholder)placeholderWithToken:(id)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  PKTextInputTextSelectionRect *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setPlaceholder:", v9);

  v11 = [PKTextInputTextSelectionRect alloc];
  if (v11)
  {
    v16.receiver = v11;
    v16.super_class = (Class)PKTextInputTextSelectionRect;
    v12 = objc_msgSendSuper2(&v16, sel_init);
    v13 = v12;
    if (v12)
    {
      *((CGFloat *)v12 + 3) = x;
      *((CGFloat *)v12 + 4) = y;
      *((CGFloat *)v12 + 5) = width;
      *((CGFloat *)v12 + 6) = height;
    }
  }
  else
  {
    v13 = 0;
  }
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set_rects:", v14);

  return (PKTextInputTextPlaceholder *)v10;
}

+ (PKTextInputTextPlaceholder)placeholderWithText:(id)a3 rects:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setPlaceholder:", v7);

  objc_msgSend(v8, "set_rects:", v6);
  return (PKTextInputTextPlaceholder *)v8;
}

- (id)rects
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;

  -[PKTextInputTextPlaceholder _rects](self, "_rects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKTextInputTextPlaceholder _rects](self, "_rects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKTextInputTextPlaceholder placeholder](self, "placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PKTextInputTextPlaceholder placeholder](self, "placeholder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  return v4;
}

- (id)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong(&self->_placeholder, a3);
}

- (BOOL)shouldIgnoreOrigin
{
  return self->_shouldIgnoreOrigin;
}

- (void)setShouldIgnoreOrigin:(BOOL)a3
{
  self->_shouldIgnoreOrigin = a3;
}

- (NSArray)_rects
{
  return self->__rects;
}

- (void)set_rects:(id)a3
{
  objc_storeStrong((id *)&self->__rects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rects, 0);
  objc_storeStrong(&self->_placeholder, 0);
}

@end
