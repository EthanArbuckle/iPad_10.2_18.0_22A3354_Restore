@implementation BKSMousePointerPreferencesObserverInfo

- (BKSMousePointerPreferencesObserver)observer
{
  return (BKSMousePointerPreferencesObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
