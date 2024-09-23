@implementation LARatchetViewControllerConfiguration

- (NSString)countdownPrimaryActionTitle
{
  return self->_countdownPrimaryActionTitle;
}

- (void)setCountdownPrimaryActionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_countdownPrimaryActionTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdownPrimaryActionTitle, 0);
}

@end
