@implementation MessageListCellLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MessageListCellLabel attributedText](self, "attributedText");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
  objc_msgSend(v8, "setCachesLayout:", 1);
  objc_msgSend(v8, "setLayout:", self->_layout);
  objc_msgSend(v10, "drawWithRect:options:context:", 33, v8, x, y, width, height);
  objc_msgSend(v8, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCellLabel setLayout:](self, "setLayout:", v9);

}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  if (!v4
    || (-[MessageListCellLabel attributedText](self, "attributedText"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToAttributedString:", v4),
        v5,
        (v6 & 1) == 0))
  {
    -[MessageListCellLabel setLayout:](self, "setLayout:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)MessageListCellLabel;
  -[MessageListCellLabel setAttributedText:](&v7, sel_setAttributedText_, v4);

}

- (void)setLayout:(id)a3
{
  objc_storeStrong(&self->_layout, a3);
}

- (id)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layout, 0);
}

@end
