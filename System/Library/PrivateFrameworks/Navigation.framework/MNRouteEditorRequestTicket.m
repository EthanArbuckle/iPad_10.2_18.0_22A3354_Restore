@implementation MNRouteEditorRequestTicket

- (void)cancel
{
  self->_isCancelled = 1;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

@end
