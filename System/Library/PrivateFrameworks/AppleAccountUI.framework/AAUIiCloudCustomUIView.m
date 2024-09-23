@implementation AAUIiCloudCustomUIView

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[AAUIiCloudCustomUIView lockedColor](self, "lockedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AAUIiCloudCustomUIView lockedColor](self, "lockedColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)AAUIiCloudCustomUIView;
  -[AAUIiCloudCustomUIView setBackgroundColor:](&v8, sel_setBackgroundColor_, v6);

}

- (UIColor)lockedColor
{
  return self->_lockedColor;
}

- (void)setLockedColor:(id)a3
{
  objc_storeStrong((id *)&self->_lockedColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedColor, 0);
}

@end
