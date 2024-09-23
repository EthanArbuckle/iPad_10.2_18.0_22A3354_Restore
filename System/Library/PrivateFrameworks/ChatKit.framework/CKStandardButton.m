@implementation CKStandardButton

- (CKStandardButton)init
{
  CKStandardButton *v3;

  +[CKStandardButton buttonWithType:](CKStandardButton, "buttonWithType:", 0);
  v3 = (CKStandardButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKStandardButton tintColorDidChange](v3, "tintColorDidChange");
  return v3;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKStandardButton;
  -[CKStandardButton tintColorDidChange](&v4, sel_tintColorDidChange);
  -[CKStandardButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKStandardButton setTitleColor:forState:](self, "setTitleColor:forState:", v3, 0);

}

@end
