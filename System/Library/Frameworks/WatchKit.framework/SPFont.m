@implementation SPFont

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPFont)initWithFont:(id)a3
{
  id v3;
  SPFont *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPFont;
  v3 = a3;
  v4 = -[SPFont init](&v6, sel_init);
  -[SPFont setFont:](v4, "setFont:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  UIFont *font;
  id v4;
  void *v5;
  id v6;

  font = self->_font;
  v4 = a3;
  -[UIFont fontDescriptor](font, "fontDescriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SPFontAttributes"));

}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  objc_class *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v5 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SPFont")),
        v6,
        v7))
  {
    objc_msgSend(a4, "font");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a4;
  }
  v9 = v8;

  return v9;
}

- (SPFont)initWithCoder:(id)a3
{
  id v4;
  SPFont *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPFont;
  v5 = -[SPFont init](&v14, sel_init);
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SPFontAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v7 = (void *)getUIFontClass_softClass;
  v23 = getUIFontClass_softClass;
  if (!getUIFontClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getUIFontClass_block_invoke;
    v18 = &unk_24D3BB130;
    v19 = &v20;
    __getUIFontClass_block_invoke((uint64_t)&v15);
    v7 = (void *)v21[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v20, 8);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v9 = (void *)getUIFontDescriptorClass_softClass;
  v23 = getUIFontDescriptorClass_softClass;
  if (!getUIFontDescriptorClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getUIFontDescriptorClass_block_invoke;
    v18 = &unk_24D3BB130;
    v19 = &v20;
    __getUIFontDescriptorClass_block_invoke((uint64_t)&v15);
    v9 = (void *)v21[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v10, "fontDescriptorWithFontAttributes:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFont setFont:](v5, "setFont:", v12);

  return v5;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
}

@end
