@implementation AVPlayer(AirPlayKit)

- (id)outputDevices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "outputContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (APKKeyValueObserver)beginObserveringExternalPlaybackChangeWithChangeHandler:()AirPlayKit
{
  id v4;
  APKKeyValueObserver *v5;

  v4 = a3;
  v5 = -[APKKeyValueObserver initWithObservedObject:keyPath:options:changeHandler:]([APKKeyValueObserver alloc], "initWithObservedObject:keyPath:options:changeHandler:", a1, CFSTR("externalPlaybackActive"), 1, v4);

  return v5;
}

- (APKKeyValueObserver)beginObserveringTimeControlStatusWithChangeHandler:()AirPlayKit
{
  id v4;
  APKKeyValueObserver *v5;

  v4 = a3;
  v5 = -[APKKeyValueObserver initWithObservedObject:keyPath:options:changeHandler:]([APKKeyValueObserver alloc], "initWithObservedObject:keyPath:options:changeHandler:", a1, CFSTR("timeControlStatus"), 1, v4);

  return v5;
}

@end
