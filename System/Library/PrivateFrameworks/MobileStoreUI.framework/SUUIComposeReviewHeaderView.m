@implementation SUUIComposeReviewHeaderView

- (SUUIComposeReviewHeaderView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  SUUIComposeReviewHeaderView *v5;
  SUUIComposeReviewHeaderView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SKStarRatingControl *ratingControl;
  SKStarRatingControl *v15;
  void *v16;
  void *v17;
  SUUIComposeTextFieldListView *v18;
  uint64_t v19;
  SUUIComposeTextFieldListView *textFieldListView;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SUUIComposeReviewHeaderView;
  v5 = -[SUUIComposeReviewHeaderView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("star"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("star.fill"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SKGetRatingStarsImage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SKGetRatingStarsImage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDEA6D0]), "initWithBackgroundImage:foregroundImage:", v11, v12);
    ratingControl = v6->_ratingControl;
    v6->_ratingControl = (SKStarRatingControl *)v13;

    v15 = v6->_ratingControl;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RATING_EXPLANATION"), &stru_2511FF0C8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKStarRatingControl setExplanationText:](v15, "setExplanationText:", v17);

    -[SKStarRatingControl setStarWidth:](v6->_ratingControl, "setStarWidth:", 27.5);
    -[SKStarRatingControl setHitPadding:](v6->_ratingControl, "setHitPadding:", 70.0, 3.0);
    -[SKStarRatingControl sizeToFit](v6->_ratingControl, "sizeToFit");
    -[SUUIComposeReviewHeaderView addSubview:](v6, "addSubview:", v6->_ratingControl);
    v18 = [SUUIComposeTextFieldListView alloc];
    v19 = -[SUUIComposeTextFieldListView initWithFrame:style:](v18, "initWithFrame:style:", v6->_style, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textFieldListView = v6->_textFieldListView;
    v6->_textFieldListView = (SUUIComposeTextFieldListView *)v19;

    -[SUUIComposeTextFieldListView setDelegate:](v6->_textFieldListView, "setDelegate:", v6);
    -[SUUIComposeTextFieldListView reloadData](v6->_textFieldListView, "reloadData");
    -[SUUIComposeReviewHeaderView addSubview:](v6, "addSubview:", v6->_textFieldListView);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIComposeTextFieldListView setDelegate:](self->_textFieldListView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeReviewHeaderView;
  -[SUUIComposeReviewHeaderView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;

  -[SUUIComposeReviewHeaderView bounds](self, "bounds");
  v4 = v3;
  -[SKStarRatingControl frame](self->_ratingControl, "frame");
  v6 = (v4 - v5) * 0.5;
  -[SKStarRatingControl setFrame:](self->_ratingControl, "setFrame:", floorf(v6), 5.0);
  -[SUUIComposeTextFieldListView frame](self->_textFieldListView, "frame");
  v8 = v7;
  -[SUUIComposeTextFieldListView height](self->_textFieldListView, "height");
  -[SUUIComposeTextFieldListView setFrame:](self->_textFieldListView, "setFrame:", v8, 44.0, v4, v9);
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SUUIComposeReviewHeaderView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[SUUIComposeTextFieldListView height](self->_textFieldListView, "height");
  -[SUUIComposeReviewHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v9 + 44.0);
}

- (UIResponder)initialFirstResponder
{
  return -[SUUIComposeTextFieldListView initialFirstResponder](self->_textFieldListView, "initialFirstResponder");
}

- (float)rating
{
  float result;

  -[SKStarRatingControl value](self->_ratingControl, "value");
  return result;
}

- (void)setRating:(float)a3
{
  -[SKStarRatingControl setValue:](self->_ratingControl, "setValue:");
}

- (void)setReview:(id)a3
{
  SUUIReviewMetadata *review;
  SKStarRatingControl *ratingControl;
  SUUIReviewMetadata *v7;

  review = (SUUIReviewMetadata *)a3;
  v7 = review;
  if (self->_review != review)
  {
    objc_storeStrong((id *)&self->_review, a3);
    review = self->_review;
  }
  ratingControl = self->_ratingControl;
  -[SUUIReviewMetadata rating](review, "rating");
  -[SKStarRatingControl setValue:](ratingControl, "setValue:");
  -[SUUIComposeTextFieldListView reloadData](self->_textFieldListView, "reloadData");

}

- (NSString)title
{
  return (NSString *)-[SUUIComposeTextFieldListView textForFieldAtIndex:](self->_textFieldListView, "textForFieldAtIndex:", 0);
}

- (int64_t)numberOfColumnsInTextFieldList:(id)a3
{
  return 1;
}

- (int64_t)numberOfFieldsInTextFieldList:(id)a3
{
  return 1;
}

- (id)textFieldList:(id)a3 configurationForFieldAtIndex:(unint64_t)a4
{
  SUUIComposeTextFieldConfiguration *v6;
  int64_t style;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = objc_alloc_init(SUUIComposeTextFieldConfiguration);
  if (!a4)
  {
    style = self->_style;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (style == 1)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SUBJECT_LABEL"), &stru_2511FF0C8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIComposeTextFieldConfiguration setLabel:](v6, "setLabel:", v10);
    }
    else
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SUBJECT_PLACEHOLDER"), &stru_2511FF0C8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIComposeTextFieldConfiguration setPlaceholder:](v6, "setPlaceholder:", v10);
    }

    -[SUUIComposeTextFieldConfiguration setMaxLength:](v6, "setMaxLength:", -[SUUIReviewMetadata titleMaxLength](self->_review, "titleMaxLength"));
    -[SUUIReviewMetadata title](self->_review, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIComposeTextFieldConfiguration setValue:](v6, "setValue:", v11);

  }
  return v6;
}

- (void)textFieldListValidityDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeHeaderViewValidityDidChange:", self);

}

- (void)textFieldListValuesDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeHeaderViewValuesDidChange:", self);

}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (SUUIComposeReviewHeaderDelegate)delegate
{
  return (SUUIComposeReviewHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIReviewMetadata)review
{
  return self->_review;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldListView, 0);
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_ratingControlBackground, 0);
  objc_storeStrong((id *)&self->_ratingControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
