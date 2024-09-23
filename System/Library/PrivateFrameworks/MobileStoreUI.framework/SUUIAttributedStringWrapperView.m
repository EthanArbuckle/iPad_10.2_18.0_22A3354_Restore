@implementation SUUIAttributedStringWrapperView

- (SUUIAttributedStringWrapperView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SUUIAttributedStringWrapperView *v7;
  SUUIAttributedStringView *v8;
  SUUIAttributedStringView *delegateView;
  SUUIAttributedStringView *v10;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SUUIAttributedStringWrapperView;
  v7 = -[SUUIAttributedStringView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[SUUIAttributedStringView initWithFrame:]([SUUIAttributedStringView alloc], "initWithFrame:", x, y, width, height);
    delegateView = v7->_delegateView;
    v7->_delegateView = v8;

    v10 = v7->_delegateView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIAttributedStringView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SUUIAttributedStringWrapperView addSubview:](v7, "addSubview:", v7->_delegateView);
  }
  return v7;
}

- (void)viewWasRecycled
{
  -[SUUIAttributedStringView viewWasRecycled](self->_delegateView, "viewWasRecycled");
}

- (int64_t)badgePlacement
{
  return -[SUUIAttributedStringView badgePlacement](self->_delegateView, "badgePlacement");
}

- (double)baselineOffset
{
  double result;

  -[SUUIAttributedStringView baselineOffset](self->_delegateView, "baselineOffset");
  return result;
}

- (double)firstBaselineOffset
{
  double result;

  -[SUUIAttributedStringView firstBaselineOffset](self->_delegateView, "firstBaselineOffset");
  return result;
}

- (void)setBadgePlacement:(int64_t)a3
{
  -[SUUIAttributedStringView setBadgePlacement:](self->_delegateView, "setBadgePlacement:", a3);
}

- (void)setFirstLineTopInset:(int64_t)a3
{
  -[SUUIAttributedStringView setFirstLineTopInset:](self->_delegateView, "setFirstLineTopInset:", a3);
}

- (int64_t)firstLineTopInset
{
  return -[SUUIAttributedStringView firstLineTopInset](self->_delegateView, "firstLineTopInset");
}

- (void)setLayout:(id)a3
{
  -[SUUIAttributedStringView setLayout:](self->_delegateView, "setLayout:", a3);
}

- (id)layout
{
  return -[SUUIAttributedStringView layout](self->_delegateView, "layout");
}

- (void)setRequiredBadges:(id)a3
{
  -[SUUIAttributedStringView setRequiredBadges:](self->_delegateView, "setRequiredBadges:", a3);
}

- (id)requiredBadges
{
  return -[SUUIAttributedStringView requiredBadges](self->_delegateView, "requiredBadges");
}

- (void)setStringTreatment:(int64_t)a3
{
  -[SUUIAttributedStringView setStringTreatment:](self->_delegateView, "setStringTreatment:", a3);
}

- (int64_t)stringTreatment
{
  return -[SUUIAttributedStringView stringTreatment](self->_delegateView, "stringTreatment");
}

- (void)setTextColor:(id)a3
{
  -[SUUIAttributedStringView setTextColor:](self->_delegateView, "setTextColor:", a3);
}

- (id)textColor
{
  return -[SUUIAttributedStringView textColor](self->_delegateView, "textColor");
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  -[SUUIAttributedStringView setTextColorFollowsTintColor:](self->_delegateView, "setTextColorFollowsTintColor:", a3);
}

- (BOOL)textColorFollowsTintColor
{
  return -[SUUIAttributedStringView textColorFollowsTintColor](self->_delegateView, "textColorFollowsTintColor");
}

- (void)setTreatmentColor:(id)a3
{
  -[SUUIAttributedStringView setTreatmentColor:](self->_delegateView, "setTreatmentColor:", a3);
}

- (id)treatmentColor
{
  return -[SUUIAttributedStringView treatmentColor](self->_delegateView, "treatmentColor");
}

- (BOOL)usesTallCharacterSet
{
  return -[SUUIAttributedStringView usesTallCharacterSet](self->_delegateView, "usesTallCharacterSet");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SUUIAttributedStringWrapperView;
  -[SUUIAttributedStringWrapperView layoutSubviews](&v25, sel_layoutSubviews);
  -[SUUIAttributedStringWrapperView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "edgeInsetsForShadow");
  v5 = -v4;

  -[SUUIAttributedStringWrapperView layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "edgeInsetsForShadow");
  v8 = -v7;

  -[SUUIAttributedStringWrapperView layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "edgeInsetsForShadow");
  v11 = v10;
  -[SUUIAttributedStringWrapperView bounds](self, "bounds");
  v13 = v11 + v12;
  -[SUUIAttributedStringWrapperView layout](self, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "edgeInsetsForShadow");
  v16 = v13 + v15;

  -[SUUIAttributedStringWrapperView layout](self, "layout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "edgeInsetsForShadow");
  v19 = v18;
  -[SUUIAttributedStringWrapperView bounds](self, "bounds");
  v21 = v19 + v20;
  -[SUUIAttributedStringWrapperView layout](self, "layout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "edgeInsetsForShadow");
  v24 = v21 + v23;

  -[SUUIAttributedStringWrapperView sendSubviewToBack:](self, "sendSubviewToBack:", self->_delegateView);
  -[SUUIAttributedStringView setFrame:](self->_delegateView, "setFrame:", v5, v8, v16, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SUUIAttributedStringView sizeThatFits:](self->_delegateView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (SUUIAttributedStringView)delegateView
{
  return self->_delegateView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateView, 0);
}

@end
