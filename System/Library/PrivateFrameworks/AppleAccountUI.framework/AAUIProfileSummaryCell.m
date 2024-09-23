@implementation AAUIProfileSummaryCell

- (AAUIProfileSummaryCell)initWithName:(id)a3 email:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  AAUIProfileSummaryCell *v11;
  AAUIProfileSummaryView *v12;
  AAUIProfileSummaryView *contentView;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AAUIProfileSummaryCell;
  v11 = -[AAUIProfileSummaryCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, 0, v8);
  if (v11)
  {
    v12 = -[AAUIProfileSummaryView initWithName:email:image:]([AAUIProfileSummaryView alloc], "initWithName:email:image:", v8, v9, v10);
    contentView = v11->_contentView;
    v11->_contentView = v12;

    -[AAUIProfileSummaryView setHidesPhoto:](v11->_contentView, "setHidesPhoto:", 1);
    -[AAUIProfileSummaryCell addSubview:](v11, "addSubview:", v11->_contentView);
  }

  return v11;
}

- (void)layoutSubviews
{
  AAUIProfileSummaryView *contentView;
  double v4;
  double v5;
  objc_super v6;

  contentView = self->_contentView;
  -[AAUIProfileSummaryCell frame](self, "frame");
  v5 = v4;
  -[AAUIProfileSummaryCell frame](self, "frame");
  -[AAUIProfileSummaryView setFrame:](contentView, "setFrame:", 0.0, 0.0, v5);
  v6.receiver = self;
  v6.super_class = (Class)AAUIProfileSummaryCell;
  -[AAUIProfileSummaryCell layoutSubviews](&v6, sel_layoutSubviews);
}

+ (double)desiredHeight
{
  double result;

  +[AAUIProfileSummaryView desiredHeight](AAUIProfileSummaryView, "desiredHeight");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
