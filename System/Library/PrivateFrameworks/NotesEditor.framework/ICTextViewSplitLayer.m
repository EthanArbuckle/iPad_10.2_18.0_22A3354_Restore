@implementation ICTextViewSplitLayer

- (void)drawInContext:(CGContext *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  UIGraphicsPushContext(a3);
  -[ICTextViewSplitLayer textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewSplitLayer textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "glyphRangeForTextContainer:", v7);
  v10 = v9;

  -[ICTextViewSplitLayer sublayerTransform](self, "sublayerTransform", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  -[ICTextViewSplitLayer textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawGlyphsForGlyphRange:atPoint:updateAttachments:", v8, v10, 0, 0.0, 0.0);

  UIGraphicsPopContext();
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
}

@end
