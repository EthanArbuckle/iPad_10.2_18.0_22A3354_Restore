@implementation CAMFocusLockBadge

- (CAMFocusLockBadge)initWithFrame:(CGRect)a3
{
  CAMFocusLockBadge *v3;
  CAMFocusLockBadge *v4;
  CAMFocusLockBadge *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMFocusLockBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_focusLockType = 2;
    objc_msgSend(MEMORY[0x1E0D0D028], "_defaultTextInsets");
    -[CEKBadgeTextView _setTextInsets:](v4, "_setTextInsets:");
    -[CAMFocusLockBadge _updateText](v4, "_updateText");
    v5 = v4;
  }

  return v4;
}

- (void)_updateText
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[CAMFocusLockBadge focusLockType](self, "focusLockType");
  if (v3 > 3)
  {
    v4 = 0;
  }
  else
  {
    CAMLocalizedFrameworkString(off_1EA32A418[v3], 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[CEKBadgeTextView _setText:](self, "_setText:", v4);

}

- (void)setFocusLockType:(int64_t)a3
{
  if (self->_focusLockType != a3)
  {
    self->_focusLockType = a3;
    -[CAMFocusLockBadge _updateText](self, "_updateText");
  }
}

- (int64_t)focusLockType
{
  return self->_focusLockType;
}

@end
