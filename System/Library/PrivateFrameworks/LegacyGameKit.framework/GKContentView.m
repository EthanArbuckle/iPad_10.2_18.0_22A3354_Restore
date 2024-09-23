@implementation GKContentView

- (GKContentView)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKContentView;
  return -[GKContentView init](&v8, sel_init, a3, a4, a5, a6, a7);
}

- (UIImage)icon
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (int64_t)numberOfTitleLines
{
  int64_t result;

  result = (int64_t)self->_titleLabel;
  if (result)
    return objc_msgSend((id)result, "numberOfLines");
  return result;
}

- (NSString)message
{
  return 0;
}

- (int64_t)numberOfMessageLines
{
  return 0;
}

- (UITableView)table
{
  return 0;
}

+ (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)maxTextWidth
{
  return 0.0;
}

- (UIFont)titleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0);
}

- (UIFont)messageFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (UIButton)otherButton
{
  return self->_otherButton;
}

- (void)setOtherButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (NSArray)connectionButtons
{
  return self->_connectionButtons;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

@end
