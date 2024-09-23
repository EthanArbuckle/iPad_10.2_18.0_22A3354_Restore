@implementation NUTitleViewStyler

- (NUTitleViewStyler)init
{
  void *v3;
  NUTitleViewStyler *v4;

  objc_msgSend(MEMORY[0x24BDF6950], "nu_defaultTitleTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NUTitleViewStyler initWithTextColor:](self, "initWithTextColor:", v3);

  return v4;
}

- (NUTitleViewStyler)initWithTextColor:(id)a3
{
  id v5;
  NUTitleViewStyler *v6;
  NUTitleViewStyler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUTitleViewStyler;
  v6 = -[NUTitleViewStyler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textColor, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
}

- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  NUTitleViewStyler *v10;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  switch(a4)
  {
    case 0uLL:
      -[NUTitleViewStyler styleTextAsTitle:boundingSize:](self, "styleTextAsTitle:boundingSize:", v9, width, height);
      v10 = (NUTitleViewStyler *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[NUTitleViewStyler styleTextAsMessage:boundingSize:](self, "styleTextAsMessage:boundingSize:", v9, width, height);
      v10 = (NUTitleViewStyler *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      v10 = (NUTitleViewStyler *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v9);
LABEL_7:
      self = v10;
      break;
  }

  return self;
}

- (id)styleTextAsMessage:(id)a3 boundingSize:(CGSize)a4
{
  double width;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];
  uint64_t v20;
  _QWORD v21[2];

  width = a4.width;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = *MEMORY[0x24BDF65F8];
  v7 = v20;
  -[NUTitleViewStyler messageLargeFont](self, "messageLargeFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeWithAttributes:", v9);
  v11 = v10;

  v18[0] = v7;
  if (v11 > width)
    -[NUTitleViewStyler messageSmallFont](self, "messageSmallFont");
  else
    -[NUTitleViewStyler messageLargeFont](self, "messageLargeFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v18[1] = *MEMORY[0x24BDF6628];
  -[NUTitleViewStyler messageParagraphStyle](self, "messageParagraphStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = *MEMORY[0x24BDF6600];
  -[NUTitleViewStyler textColor](self, "textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v15);
  return v16;
}

- (id)styleTextAsTitle:(id)a3 boundingSize:(CGSize)a4
{
  double width;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[4];
  uint64_t v20;
  _QWORD v21[2];

  width = a4.width;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = *MEMORY[0x24BDF65F8];
  v7 = v20;
  -[NUTitleViewStyler titleLargeFont](self, "titleLargeFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeWithAttributes:", v9);
  v11 = v10;

  v18[0] = v7;
  if (v11 <= width)
    -[NUTitleViewStyler titleLargeFont](self, "titleLargeFont");
  else
    -[NUTitleViewStyler titleSmallFont](self, "titleSmallFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v18[1] = *MEMORY[0x24BDF6628];
  -[NUTitleViewStyler titleParagraphStyleWithWrapping:](self, "titleParagraphStyleWithWrapping:", v11 > width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = *MEMORY[0x24BDF6600];
  -[NUTitleViewStyler textColor](self, "textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = *MEMORY[0x24BDF6608];
  v19[2] = v14;
  v19[3] = &unk_24D5BA9E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v15);
  return v16;
}

- (id)messageLargeFont
{
  if (messageLargeFont_onceToken_0 != -1)
    dispatch_once(&messageLargeFont_onceToken_0, &__block_literal_global_16);
  return (id)messageLargeFont_largeFont_0;
}

void __37__NUTitleViewStyler_messageLargeFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithSize:", 15.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageLargeFont_largeFont_0;
  messageLargeFont_largeFont_0 = v0;

}

- (id)messageSmallFont
{
  if (messageSmallFont_onceToken_0 != -1)
    dispatch_once(&messageSmallFont_onceToken_0, &__block_literal_global_5_1);
  return (id)messageSmallFont_smallFont_0;
}

void __37__NUTitleViewStyler_messageSmallFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithSize:", 13.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageSmallFont_smallFont_0;
  messageSmallFont_smallFont_0 = v0;

}

- (id)messageParagraphStyle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6748], "defaultParagraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setAlignment:", 1);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)titleLargeFont
{
  if (titleLargeFont_onceToken != -1)
    dispatch_once(&titleLargeFont_onceToken, &__block_literal_global_7_0);
  return (id)titleLargeFont_largeFont;
}

void __35__NUTitleViewStyler_titleLargeFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 24.0, *MEMORY[0x24BDF7868]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)titleLargeFont_largeFont;
  titleLargeFont_largeFont = v0;

  objc_msgSend((id)titleLargeFont_largeFont, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF77A8];
  v9[0] = &unk_24D5BAB48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v3);

  v5 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)titleLargeFont_largeFont, "pointSize");
  objc_msgSend(v5, "fontWithDescriptor:size:", v2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)titleLargeFont_largeFont;
  titleLargeFont_largeFont = v6;

}

- (id)titleSmallFont
{
  if (titleSmallFont_onceToken != -1)
    dispatch_once(&titleSmallFont_onceToken, &__block_literal_global_9);
  return (id)titleSmallFont_smallFont;
}

void __35__NUTitleViewStyler_titleSmallFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.5, *MEMORY[0x24BDF7868]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)titleSmallFont_smallFont;
  titleSmallFont_smallFont = v0;

  objc_msgSend((id)titleSmallFont_smallFont, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF77A8];
  v9[0] = &unk_24D5BAB48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v3);

  v5 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)titleSmallFont_smallFont, "pointSize");
  objc_msgSend(v5, "fontWithDescriptor:size:", v2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)titleSmallFont_smallFont;
  titleSmallFont_smallFont = v6;

}

- (id)titleParagraphStyleWithWrapping:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6748], "defaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setLineBreakMode:", 4);
  objc_msgSend(v5, "setAlignment:", 1);
  if (v3)
  {
    objc_msgSend(v5, "setMinimumLineHeight:", 20.0);
    objc_msgSend(v5, "setMaximumLineHeight:", 21.0);
  }
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (UIColor)textColor
{
  return self->_textColor;
}

@end
