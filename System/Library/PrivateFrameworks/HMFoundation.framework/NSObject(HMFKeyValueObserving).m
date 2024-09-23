@implementation NSObject(HMFKeyValueObserving)

- (HMFCancellationHandler)hmf_registerObserverForKeyPath:()HMFKeyValueObserving options:handler:
{
  id v8;
  id v9;
  void *v10;
  HMFKeyValueBlockObserver *v11;
  HMFCancellationHandler *v12;
  HMFCancellationHandler *v13;
  _QWORD v15[4];
  id v16;
  id v17[2];
  id from;
  id location;

  v8 = a3;
  v9 = a5;
  if (!v9)
    _HMFPreconditionFailure(CFSTR("handler"));
  v10 = v9;
  v11 = -[HMFKeyValueBlockObserver initWithKeyPath:object:options:]([HMFKeyValueBlockObserver alloc], "initWithKeyPath:object:options:", v8, a1, a4);
  -[HMFKeyValueBlockObserver setHandler:](v11, "setHandler:", v10);
  objc_setAssociatedObject(a1, a1, v11, (void *)0x301);
  objc_initWeak(&location, a1);
  objc_initWeak(&from, v11);
  v12 = [HMFCancellationHandler alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__NSObject_HMFKeyValueObserving__hmf_registerObserverForKeyPath_options_handler___block_invoke;
  v15[3] = &unk_1E3B39850;
  objc_copyWeak(&v16, &from);
  objc_copyWeak(v17, &location);
  v17[1] = a1;
  v13 = -[HMFCancellationHandler initWithBlock:](v12, "initWithBlock:", v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

@end
