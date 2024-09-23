@implementation _NearbyDevicesNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NearbyDevicesNavigationController;
  -[_NearbyDevicesNavigationController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NearbyDevicesNavigationController dismissObserver](self, "dismissObserver"));
  objc_msgSend(v4, "_nearbyDevicesNavigationControllerDidDismiss");

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[_NearbyDevicesNavigationController dismissObserver](self, "dismissObserver", a3));
  objc_msgSend(v3, "_nearbyDevicesNavigationControllerDidDismiss");

}

- (_NearbyDevicesNavigationControllerDelegate)dismissObserver
{
  return (_NearbyDevicesNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_dismissObserver);
}

- (void)setDismissObserver:(id)a3
{
  objc_storeWeak((id *)&self->_dismissObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dismissObserver);
}

@end
