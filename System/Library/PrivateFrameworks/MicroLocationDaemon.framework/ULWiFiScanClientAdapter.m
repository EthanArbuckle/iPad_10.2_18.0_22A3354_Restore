@implementation ULWiFiScanClientAdapter

- (void)didStopWifiRssiScanning
{
  void (**v2)(void);

  -[ULWiFiScanClientAdapter didStopWifiRssiScanningBlock](self, "didStopWifiRssiScanningBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)didStopWifiScanTimer
{
  void (**v2)(void);

  -[ULWiFiScanClientAdapter didStopWifiScanTimerBlock](self, "didStopWifiScanTimerBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)didUpdateWifiAPs:(void *)a3 withDate:(id)a4
{
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[ULWiFiScanClientAdapter didUpdateWifiAPsBlock](self, "didUpdateWifiAPsBlock");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))v6)[2](v6, a3, v7);

}

- (void)didReceiveWifiScanError
{
  void (**v2)(void);

  -[ULWiFiScanClientAdapter didReceiveWifiScanErrorBlock](self, "didReceiveWifiScanErrorBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)didReceiveWifiScanErrorBusy
{
  void (**v2)(void);

  -[ULWiFiScanClientAdapter didReceiveWifiScanErrorBlock](self, "didReceiveWifiScanErrorBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)didUpdateWiFiAssociatedState:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a3;
  -[ULWiFiScanClientAdapter didUpdateWiFiAssociatedStateBlock](self, "didUpdateWiFiAssociatedStateBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v5);

}

- (id)didStopWifiRssiScanningBlock
{
  return self->_didStopWifiRssiScanningBlock;
}

- (void)setDidStopWifiRssiScanningBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)didStopWifiScanTimerBlock
{
  return self->_didStopWifiScanTimerBlock;
}

- (void)setDidStopWifiScanTimerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didUpdateWifiAPsBlock
{
  return self->_didUpdateWifiAPsBlock;
}

- (void)setDidUpdateWifiAPsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)didReceiveWifiScanErrorBlock
{
  return self->_didReceiveWifiScanErrorBlock;
}

- (void)setDidReceiveWifiScanErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)didReceiveWifiScanErrorBusyBlock
{
  return self->_didReceiveWifiScanErrorBusyBlock;
}

- (void)setDidReceiveWifiScanErrorBusyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)didUpdateWiFiAssociatedStateBlock
{
  return self->_didUpdateWiFiAssociatedStateBlock;
}

- (void)setDidUpdateWiFiAssociatedStateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateWiFiAssociatedStateBlock, 0);
  objc_storeStrong(&self->_didReceiveWifiScanErrorBusyBlock, 0);
  objc_storeStrong(&self->_didReceiveWifiScanErrorBlock, 0);
  objc_storeStrong(&self->_didUpdateWifiAPsBlock, 0);
  objc_storeStrong(&self->_didStopWifiScanTimerBlock, 0);
  objc_storeStrong(&self->_didStopWifiRssiScanningBlock, 0);
}

@end
