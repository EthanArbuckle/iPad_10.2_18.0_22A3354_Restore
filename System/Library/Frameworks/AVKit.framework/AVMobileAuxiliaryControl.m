@implementation AVMobileAuxiliaryControl

- (void)setIncluded:(BOOL)a3
{
  id v4;

  if (self->_included != a3)
  {
    self->_included = a3;
    -[AVMobileAuxiliaryControl delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auxiliaryControlDidChangeState:", self);

  }
}

- (BOOL)canOnlyAppearInOverflowMenu
{
  return self->_controlView == 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AVMobileAuxiliaryControl;
  -[AVMobileAuxiliaryControl description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ - %@]"), v4, self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AVMobileAuxiliaryControlDelegate)delegate
{
  return (AVMobileAuxiliaryControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (int64_t)displayPriority
{
  return self->_displayPriority;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIView)controlView
{
  return self->_controlView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)controlWithView:(id)a3 displayPriority:(int64_t)a4 identifier:(id)a5
{
  UIView *v7;
  NSString *v8;
  AVMobileAuxiliaryControl *v9;
  UIView *controlView;
  UIView *v11;
  NSString *identifier;

  v7 = (UIView *)a3;
  v8 = (NSString *)a5;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 0);
  v9 = objc_alloc_init(AVMobileAuxiliaryControl);
  controlView = v9->_controlView;
  v9->_controlView = v7;
  v11 = v7;

  identifier = v9->_identifier;
  v9->_displayPriority = a4;
  v9->_identifier = v8;

  return v9;
}

+ (id)controlWithDisplayPriority:(int64_t)a3 identifier:(id)a4
{
  NSString *v5;
  AVMobileAuxiliaryControl *v6;
  NSString *identifier;

  v5 = (NSString *)a4;
  v6 = objc_alloc_init(AVMobileAuxiliaryControl);
  identifier = v6->_identifier;
  v6->_displayPriority = a3;
  v6->_identifier = v5;

  return v6;
}

@end
