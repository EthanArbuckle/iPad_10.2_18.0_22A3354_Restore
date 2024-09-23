@implementation ASVWrappedButton

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ASVWrappedButton;
  -[ASVWrappedButton setHighlighted:](&v6, sel_setHighlighted_);
  -[ASVWrappedButton wrapperButton](self, "wrapperButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (void)sendAction:(SEL)a3 to:(id)a4 forEvent:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[ASVWrappedButton wrapperButton](self, "wrapperButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendAction:to:forEvent:", a3, v9, v8);

}

@end
