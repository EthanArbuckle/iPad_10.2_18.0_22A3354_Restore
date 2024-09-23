@implementation HKFullScreenTextViewController

- (UITextView)textView
{
  void *v4;
  char isKindOfClass;
  void *v7;

  -[HKFullScreenTextViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFullScreenTextViewController.m"), 20, CFSTR("Yea, that's not going to work :("));

  }
  return (UITextView *)-[HKFullScreenTextViewController view](self, "view");
}

- (void)setDetailText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_detailText, a3);
  v5 = a3;
  -[HKFullScreenTextViewController textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFullScreenTextViewController;
  -[HKFullScreenTextViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFullScreenTextViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HKFullScreenTextViewController createTextView](self, "createTextView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKFullScreenTextViewController;
  -[HKFullScreenTextViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[HKFullScreenTextViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInset");
  v6 = -v5;
  -[HKFullScreenTextViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:", 0.0, v6);

}

- (void)createTextView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  -[HKFullScreenTextViewController setView:](self, "setView:", v4);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v4, "setEditable:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFullScreenTextViewController detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
}

@end
