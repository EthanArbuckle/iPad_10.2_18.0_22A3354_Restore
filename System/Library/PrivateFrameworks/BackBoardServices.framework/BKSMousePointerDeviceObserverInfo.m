@implementation BKSMousePointerDeviceObserverInfo

- (BKSMousePointerDeviceObserver)observer
{
  return self->_observer;
}

- (NSSet)visibleDevices
{
  return self->_visibleDevices;
}

- (void)setVisibleDevices:(id)a3
{
  objc_storeStrong((id *)&self->_visibleDevices, a3);
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleDevices, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
