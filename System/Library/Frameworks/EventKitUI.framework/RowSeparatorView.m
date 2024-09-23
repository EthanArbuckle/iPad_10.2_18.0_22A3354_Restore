@implementation RowSeparatorView

- (void)tintColorDidChange
{
  id v3;

  if (-[RowSeparatorView vibrant](self, "vibrant"))
  {
    -[RowSeparatorView tintColor](self, "tintColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[RowSeparatorView setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
}

- (BOOL)vibrant
{
  return self->_vibrant;
}

- (void)setVibrant:(BOOL)a3
{
  self->_vibrant = a3;
}

@end
