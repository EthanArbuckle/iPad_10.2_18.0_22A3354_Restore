@implementation MPAVErrorResolver

- (void)resolveError:(id)a3
{
  -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", a3, 0);
}

- (void)sendDidResolveError:(id)a3 withResolution:(int64_t)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "errorResolver:didResolveError:withResolution:", self, v7, a4);

}

- (MPAVErrorResolverDelegate)delegate
{
  return (MPAVErrorResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
