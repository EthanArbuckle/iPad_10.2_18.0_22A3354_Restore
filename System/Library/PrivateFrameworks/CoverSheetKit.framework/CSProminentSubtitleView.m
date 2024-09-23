@implementation CSProminentSubtitleView

- (CSProminentSubtitleView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSProminentSubtitleView *v11;
  CSProminentSubtitleDateView *v12;
  CSProminentSubtitleDateView *dateView;
  CSProminentSubtitleDateView *v14;
  CSProminentSubtitleDateView *compactDateView;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSProminentSubtitleView;
  v11 = -[CSProminentTextElementView initWithDate:font:textColor:](&v17, sel_initWithDate_font_textColor_, v8, v9, v10);
  if (v11)
  {
    v12 = -[CSProminentSubtitleDateView initWithDate:font:textColor:]([CSProminentSubtitleDateView alloc], "initWithDate:font:textColor:", v8, v9, v10);
    dateView = v11->_dateView;
    v11->_dateView = v12;

    v14 = -[CSProminentSubtitleDateView initWithDate:font:textColor:]([CSProminentSubtitleDateView alloc], "initWithDate:font:textColor:", v8, v9, v10);
    compactDateView = v11->_compactDateView;
    v11->_compactDateView = v14;

  }
  return v11;
}

+ (unint64_t)elementType
{
  return 2;
}

- (void)setDate:(id)a3
{
  CSProminentSubtitleDateView *dateView;
  id v5;

  dateView = self->_dateView;
  v5 = a3;
  -[CSProminentSubtitleDateView setDate:](dateView, "setDate:", v5);
  -[CSProminentSubtitleDateView setDate:](self->_compactDateView, "setDate:", v5);

}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSProminentSubtitleView;
  -[CSProminentTextElementView layoutSubviews](&v2, sel_layoutSubviews);
}

- (BOOL)_usesCompactDate
{
  return 0;
}

- (CSProminentSubtitleDateView)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
  objc_storeStrong((id *)&self->_dateView, a3);
}

- (CSProminentSubtitleDateView)compactDateView
{
  return self->_compactDateView;
}

- (void)setCompactDateView:(id)a3
{
  objc_storeStrong((id *)&self->_compactDateView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactDateView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
}

@end
