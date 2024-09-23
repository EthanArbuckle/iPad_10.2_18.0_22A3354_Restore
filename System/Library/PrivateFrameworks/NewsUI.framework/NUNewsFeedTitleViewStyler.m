@implementation NUNewsFeedTitleViewStyler

- (NUNewsFeedTitleViewStyler)init
{
  return -[NUNewsFeedTitleViewStyler initWithTextAlignment:](self, "initWithTextAlignment:", 1);
}

- (NUNewsFeedTitleViewStyler)initWithTextAlignment:(int64_t)a3
{
  NUNewsFeedTitleViewStyler *v4;
  uint64_t v5;
  UIColor *textColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUNewsFeedTitleViewStyler;
  v4 = -[NUNewsFeedTitleViewStyler init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "nu_defaultTitleTextColor");
    v5 = objc_claimAutoreleasedReturnValue();
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v5;

    v4->_textAlignment = a3;
  }
  return v4;
}

- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  NUNewsFeedTitleViewStyler *v10;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  switch(a4)
  {
    case 0uLL:
      -[NUNewsFeedTitleViewStyler styleTextAsTitle:boundingSize:](self, "styleTextAsTitle:boundingSize:", v9, width, height);
      v10 = (NUNewsFeedTitleViewStyler *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[NUNewsFeedTitleViewStyler styleTextAsMessage:boundingSize:](self, "styleTextAsMessage:boundingSize:", v9, width, height);
      v10 = (NUNewsFeedTitleViewStyler *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      v10 = (NUNewsFeedTitleViewStyler *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v9);
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
  -[NUNewsFeedTitleViewStyler messageLargeFont](self, "messageLargeFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeWithAttributes:", v9);
  v11 = v10;

  v18[0] = v7;
  if (v11 <= width)
    -[NUNewsFeedTitleViewStyler messageLargeFont](self, "messageLargeFont");
  else
    -[NUNewsFeedTitleViewStyler messageSmallFont](self, "messageSmallFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v18[1] = *MEMORY[0x24BDF6628];
  -[NUNewsFeedTitleViewStyler titleParagraphStyleWithWrapping:](self, "titleParagraphStyleWithWrapping:", v11 > width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = *MEMORY[0x24BDF6600];
  -[NUNewsFeedTitleViewStyler textColor](self, "textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v15);
  return v16;
}

- (id)styleTextAsTitle:(id)a3 boundingSize:(CGSize)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = *MEMORY[0x24BDF65F8];
  v5 = a3;
  -[NUNewsFeedTitleViewStyler titleExtraLargeFont](self, "titleExtraLargeFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x24BDF6628];
  -[NUNewsFeedTitleViewStyler titleParagraphStyleWithWrapping:](self, "titleParagraphStyleWithWrapping:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = *MEMORY[0x24BDF6600];
  -[NUNewsFeedTitleViewStyler textColor](self, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = *MEMORY[0x24BDF6608];
  v13[2] = v8;
  v13[3] = &unk_24D5BA9D0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v9);
  return v10;
}

- (id)messageLargeFont
{
  if (messageLargeFont_onceToken != -1)
    dispatch_once(&messageLargeFont_onceToken, &__block_literal_global_8);
  return (id)messageLargeFont_largeFont;
}

void __45__NUNewsFeedTitleViewStyler_messageLargeFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithSize:", 15.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageLargeFont_largeFont;
  messageLargeFont_largeFont = v0;

}

- (id)messageSmallFont
{
  if (messageSmallFont_onceToken != -1)
    dispatch_once(&messageSmallFont_onceToken, &__block_literal_global_5_0);
  return (id)messageSmallFont_smallFont;
}

void __45__NUNewsFeedTitleViewStyler_messageSmallFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithSize:", 13.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageSmallFont_smallFont;
  messageSmallFont_smallFont = v0;

}

- (id)titleExtraLargeFont
{
  if (titleExtraLargeFont_onceToken != -1)
    dispatch_once(&titleExtraLargeFont_onceToken, &__block_literal_global_6);
  return (id)titleExtraLargeFont_extraLargeFont;
}

void __48__NUNewsFeedTitleViewStyler_titleExtraLargeFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 29.0, *MEMORY[0x24BDF7860]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)titleExtraLargeFont_extraLargeFont;
  titleExtraLargeFont_extraLargeFont = v0;

}

- (id)titleParagraphStyleWithWrapping:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6748], "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setLineBreakMode:", 4);
  objc_msgSend(v6, "setAlignment:", -[NUNewsFeedTitleViewStyler textAlignment](self, "textAlignment"));
  if (v3)
  {
    objc_msgSend(v6, "setMinimumLineHeight:", 20.0);
    objc_msgSend(v6, "setMaximumLineHeight:", 20.0);
  }
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
