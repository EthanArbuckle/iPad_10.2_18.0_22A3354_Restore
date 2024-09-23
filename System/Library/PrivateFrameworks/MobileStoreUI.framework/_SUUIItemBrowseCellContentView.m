@implementation _SUUIItemBrowseCellContentView

- (_SUUIItemBrowseCellContentView)initWithFrame:(CGRect)a3
{
  _SUUIItemBrowseCellContentView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SUUIItemBrowseCellContentView;
  v3 = -[_SUUIItemBrowseCellContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUUIItemBrowseCellContentView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[_SUUIItemBrowseCellContentView setContentMode:](v3, "setContentMode:", 7);
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  UILabel *subtitleLabel;
  UILabel *indexNumberLabel;
  UILabel *titleLabel;
  UILabel *userRatingLabel;
  id v8;

  subtitleLabel = self->_subtitleLabel;
  -[UILabel frame](subtitleLabel, "frame", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UILabel drawTextInRect:](subtitleLabel, "drawTextInRect:");
  indexNumberLabel = self->_indexNumberLabel;
  -[UILabel frame](indexNumberLabel, "frame");
  -[UILabel drawTextInRect:](indexNumberLabel, "drawTextInRect:");
  titleLabel = self->_titleLabel;
  -[UILabel frame](titleLabel, "frame");
  -[UILabel drawTextInRect:](titleLabel, "drawTextInRect:");
  userRatingLabel = self->_userRatingLabel;
  -[UILabel frame](userRatingLabel, "frame");
  -[UILabel drawTextInRect:](userRatingLabel, "drawTextInRect:");
  if ((-[SUUICellImageView isHidden](self->_userRatingImageView, "isHidden") & 1) == 0)
  {
    -[SUUICellImageView image](self->_userRatingImageView, "image");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUICellImageView frame](self->_userRatingImageView, "frame");
    objc_msgSend(v8, "drawInRect:");

  }
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *subtitleLabel;
  id v5;
  objc_super v6;

  subtitleLabel = self->_subtitleLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](subtitleLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_indexNumberLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  -[SUUICellImageView setBackgroundColor:](self->_userRatingImageView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_userRatingLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)_SUUIItemBrowseCellContentView;
  -[_SUUIItemBrowseCellContentView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (UILabel)indexNumberLabel
{
  return self->_indexNumberLabel;
}

- (void)setIndexNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_indexNumberLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)userRatingLabel
{
  return self->_userRatingLabel;
}

- (void)setUserRatingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_userRatingLabel, a3);
}

- (SUUICellImageView)userRatingImageView
{
  return self->_userRatingImageView;
}

- (void)setUserRatingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_userRatingImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingImageView, 0);
  objc_storeStrong((id *)&self->_userRatingLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_indexNumberLabel, 0);
}

@end
