@implementation BSUIFontProvider

+ (id)preferredFontProvider
{
  _BYTE *v2;
  objc_super v4;

  v2 = objc_alloc((Class)a1);
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)BSUIFontProvider;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
      v2[8] = 0;
  }
  return v2;
}

+ (id)defaultFontProvider
{
  _BYTE *v2;
  objc_super v4;

  v2 = objc_alloc((Class)a1);
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)BSUIFontProvider;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
      v2[8] = 1;
  }
  return v2;
}

- (id)preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (self->_isDefault)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "bsui_defaultFontForTextStyle:hiFontStyle:", v6, a4);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "bsui_preferredFontForTextStyle:hiFontStyle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4 contentSizeCategory:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  if (self->_isDefault)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "bsui_defaultFontForTextStyle:hiFontStyle:", v8, a4);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
