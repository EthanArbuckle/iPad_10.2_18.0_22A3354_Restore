@implementation IDSServiceDelegateProperties

- (BOOL)wantsCrossAccountMessaging
{
  return self->_wantsCrossAccountMessaging;
}

- (void)setWantsCrossAccountMessaging:(BOOL)a3
{
  self->_wantsCrossAccountMessaging = a3;
}

@end
