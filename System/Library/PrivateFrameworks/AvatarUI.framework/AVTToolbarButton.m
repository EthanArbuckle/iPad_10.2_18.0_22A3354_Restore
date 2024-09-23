@implementation AVTToolbarButton

- (AVTToolbarButton)initWithTitle:(id)a3 isDefault:(BOOL)a4
{
  id v7;
  AVTToolbarButton *v8;
  AVTToolbarButton *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTToolbarButton;
  v8 = -[AVTToolbarButton init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_isDefault = a4;
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
