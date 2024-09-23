@implementation ICTextViewControllerView

- (ICTextViewControllerView)initWithTextView:(id)a3
{
  id v5;
  ICTextViewControllerView *v6;
  ICTextViewControllerView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextViewControllerView;
  v6 = -[ICTextViewControllerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textView, a3);

  return v7;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[ICTextViewControllerView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  -[ICTextViewControllerView textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  if (((-[ICTextViewControllerView ic_isRTL](self, "ic_isRTL") & 1) != 0 || x >= v10)
    && (!-[ICTextViewControllerView ic_isRTL](self, "ic_isRTL") || x <= v10 + v13))
  {
    v17.receiver = self;
    v17.super_class = (Class)ICTextViewControllerView;
    -[ICTextViewControllerView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICTextViewControllerView textView](self, "textView");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (ICTextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
