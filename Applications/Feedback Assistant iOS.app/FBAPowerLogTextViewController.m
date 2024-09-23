@implementation FBAPowerLogTextViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBAPowerLogTextViewController;
  -[FBAPowerLogTextViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogTextViewController contents](self, "contents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogTextViewController textView](self, "textView"));
  objc_msgSend(v4, "setText:", v3);

}

- (void)displayText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[FBAPowerLogTextViewController setContents:](self, "setContents:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogTextViewController textView](self, "textView"));

  if (v4)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FBAPowerLogTextViewController contents](self, "contents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogTextViewController textView](self, "textView"));
    objc_msgSend(v5, "setText:", v6);

  }
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (NSString)contents
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContents:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_textView);
}

@end
