@implementation FBATextViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBATextViewController;
  -[FBATextViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBATextViewController;
  -[FBATextViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBATextViewController;
  -[FBATextViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBATextViewController text](self, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBATextViewController textView](self, "textView"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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
  objc_storeStrong((id *)&self->_text, 0);
}

@end
