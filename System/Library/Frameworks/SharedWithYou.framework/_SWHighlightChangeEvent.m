@implementation _SWHighlightChangeEvent

- (_SWHighlightChangeEvent)initWithHighlightURL:(id)a3 type:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SWHighlightChangeEvent;
  return -[SWHighlightChangeEvent initWithHighlightURL:type:](&v5, sel_initWithHighlightURL_type_, a3, a4);
}

- (_SWHighlightChangeEvent)initWithHighlight:(id)a3 type:(int64_t)a4
{
  void *v6;
  _SWHighlightChangeEvent *v7;
  objc_super v9;

  objc_msgSend(a3, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)_SWHighlightChangeEvent;
  v7 = -[SWHighlightChangeEvent initWithHighlightURL:type:](&v9, sel_initWithHighlightURL_type_, v6, a4);

  return v7;
}

@end
