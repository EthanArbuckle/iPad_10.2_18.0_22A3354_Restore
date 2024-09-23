@implementation CNPREditorColorPalette

- (CNPREditorColorPalette)initWithEditorColorPalette:(id)a3
{
  id v5;
  CNPREditorColorPalette *v6;
  CNPREditorColorPalette *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPREditorColorPalette;
  v6 = -[CNPREditorColorPalette init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedEditorColorPalette, a3);

  return v7;
}

- (id)colors
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorColorPalette colors](self->_wrappedEditorColorPalette, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CNPREditorColorPalette_colors__block_invoke;
  v7[3] = &unk_1E2050078;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedEditorColorPalette, 0);
}

void __32__CNPREditorColorPalette_colors__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "color");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)standardPalette
{
  CNPREditorColorPalette *v2;
  void *v3;
  CNPREditorColorPalette *v4;

  v2 = [CNPREditorColorPalette alloc];
  objc_msgSend((Class)getPREditorColorPaletteClass[0](), "standardPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPREditorColorPalette initWithEditorColorPalette:](v2, "initWithEditorColorPalette:", v3);

  return v4;
}

@end
