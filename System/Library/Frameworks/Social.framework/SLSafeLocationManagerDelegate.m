@implementation SLSafeLocationManagerDelegate

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;

  v5 = *(_QWORD *)&a4;
  v8 = a3;
  -[SLSafeLocationManagerDelegate delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLSafeLocationManagerDelegate locationManager:didChangeAuthorizationStatus: calling strong delegate %@"));
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "locationManager:didChangeAuthorizationStatus:", v8, v5, v7);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  -[SLSafeLocationManagerDelegate delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLSafeLocationManagerDelegate locationManager:didUpdateLocations: calling strong delegate %@"));
  objc_msgSend(v9, "locationManager:didUpdateLocations:", v8, v7, v9);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  -[SLSafeLocationManagerDelegate delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLSafeLocationManagerDelegate locationManager:didFailWithError: calling strong delegate %@"));
  objc_msgSend(v9, "locationManager:didFailWithError:", v8, v7, v9);

}

- (CLLocationManagerDelegate)delegate
{
  return (CLLocationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
