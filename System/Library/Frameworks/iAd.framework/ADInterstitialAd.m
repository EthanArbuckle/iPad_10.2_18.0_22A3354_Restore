@implementation ADInterstitialAd

- (BOOL)presentInView:(id)a3
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (BOOL)isActionInProgress
{
  return self->_actionInProgress;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

@end
