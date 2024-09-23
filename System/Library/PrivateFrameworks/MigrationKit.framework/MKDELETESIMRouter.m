@implementation MKDELETESIMRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  -[MKDELETESIMRouterDelegate routerDidDeleteSIM:](self->_delegate, "routerDidDeleteSIM:", self, a4, a5);
}

- (MKDELETESIMRouterDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MKDELETESIMRouterDelegate *)a3;
}

@end
