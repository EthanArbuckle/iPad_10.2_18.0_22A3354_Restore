@implementation UIImage(PKPaletteButtonAdditions)

+ (id)_pk_imageNamed:()PKPaletteButtonAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pk_undoButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("arrow.uturn.backward"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_redoButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("arrow.uturn.forward"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_ellipsisButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 2, 17.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("ellipsis"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_plusButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("plus"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_UCBButtonImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3888];
  if (qword_1EF560518 != -1)
    dispatch_once(&qword_1EF560518, &__block_literal_global_75);
  objc_msgSend(v2, "configurationWithPointSize:weight:scale:", 6, 1, *(double *)&_MergedGlobals_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("keyboard.badge.ellipsis"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pk_keyboardButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("keyboard"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_emojiButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("smiley"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_returnKeyButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("return"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_textButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("character.textbox"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_shapeButtonImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "pk_defaultImageSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("square.on.circle"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pk_handwritingToolLabelImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1440]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v3, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "configurationWithFont:scale:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", CFSTR("a"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
