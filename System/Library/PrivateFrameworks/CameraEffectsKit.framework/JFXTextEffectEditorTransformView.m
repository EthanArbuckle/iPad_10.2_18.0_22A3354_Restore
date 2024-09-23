@implementation JFXTextEffectEditorTransformView

- (JFXTextEffectEditorTransformView)initWithFrame:(CGRect)a3 textView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  JFXTextEffectEditorTransformView *v11;
  JFXTextEffectEditorTransformView *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)JFXTextEffectEditorTransformView;
  v11 = -[JFXTextEffectEditorTransformView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    v13 = *MEMORY[0x24BDBEFB0];
    v14 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[JFXTextEffectEditorTransformView layer](v11, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnchorPoint:", v13, v14);

    -[JFXTextEffectEditorTransformView layer](v12, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGeometryFlipped:", 1);

    -[JFXTextEffectEditorTransformView setClipsToBounds:](v12, "setClipsToBounds:", 0);
    objc_storeStrong((id *)&v12->_textView, a4);
  }

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[JFXTextEffectEditorTransformView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTransformView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[JFXTextEffectEditorTransformView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  return (char)v8;
}

- (JFXTextEffectEditorTextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
