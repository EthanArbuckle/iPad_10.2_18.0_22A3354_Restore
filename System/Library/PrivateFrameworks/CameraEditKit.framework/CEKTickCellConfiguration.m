@implementation CEKTickCellConfiguration

- (CEKTickCellConfiguration)initWithImage:(id)a3
{
  id v5;
  CEKTickCellConfiguration *v6;
  CEKTickCellConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CEKTickCellConfiguration;
  v6 = -[CEKTickCellConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (CEKTickCellConfiguration)initWithText:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  CEKTickCellConfiguration *v8;
  uint64_t v9;
  NSString *text;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CEKTickCellConfiguration;
  v8 = -[CEKTickCellConfiguration init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v9;

    objc_storeStrong((id *)&v8->_font, a4);
    v16 = *MEMORY[0x1E0DC32A0];
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 0, v11, 0, 3.40282347e38, 3.40282347e38);
    v8->_contentSize.width = v12;
    v8->_contentSize.height = v13;

  }
  return v8;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
