@implementation GLKDisplayLinkMessenger

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

- (void)message
{
  objc_msgSend(self->_target, "performSelector:", sel__updateAndDraw);
}

@end
