@implementation LAUIPearlGlyphViewAutoLayoutWrapper

- (LAUIPearlGlyphViewAutoLayoutWrapper)initWithGlyphView:(id)a3
{
  id v5;
  LAUIPearlGlyphViewAutoLayoutWrapper *v6;
  LAUIPearlGlyphViewAutoLayoutWrapper *v7;
  LAUIPearlGlyphView **p_glyphView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LAUIPearlGlyphViewAutoLayoutWrapper;
  v6 = -[LAUIPearlGlyphViewAutoLayoutWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    p_glyphView = &v6->_glyphView;
    objc_storeStrong((id *)&v6->_glyphView, a3);
    if (*p_glyphView)
      -[LAUIPearlGlyphViewAutoLayoutWrapper addSubview:](v7, "addSubview:");
  }

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LAUIPearlGlyphViewAutoLayoutWrapper;
  -[LAUIPearlGlyphViewAutoLayoutWrapper layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_glyphView)
  {
    -[LAUIPearlGlyphViewAutoLayoutWrapper frame](self, "frame");
    -[LAUIPearlGlyphView setFrame:](self->_glyphView, "setFrame:", 0.0, 0.0);
  }
}

- (LAUIPearlGlyphView)glyphView
{
  return self->_glyphView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end
