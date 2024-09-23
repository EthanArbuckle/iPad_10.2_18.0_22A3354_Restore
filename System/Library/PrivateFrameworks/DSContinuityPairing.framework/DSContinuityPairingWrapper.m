@implementation DSContinuityPairingWrapper

- (DSContinuityPairingWrapper)init
{
  DSContinuityPairingWrapper *v2;
  _TtC19DSContinuityPairing19DSContinuityPairing *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DSContinuityPairingWrapper;
  v2 = -[DSContinuityPairingWrapper init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC19DSContinuityPairing19DSContinuityPairing);
    -[DSContinuityPairingWrapper setContinuityPairing:](v2, "setContinuityPairing:", v3);

  }
  return v2;
}

- (void)fetchContinuityEligibleDevicesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DSContinuityPairingWrapper continuityPairing](self, "continuityPairing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchContinuityDevicesWithCompletionHandler:", v4);

}

- (void)unpairHostWithDeviceID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DSContinuityPairingWrapper continuityPairing](self, "continuityPairing");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unpairDeviceWith:completionHandler:", v7, v6);

}

- (id)formattedStartDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DSContinuityPairingWrapper continuityPairing](self, "continuityPairing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formatStartDateWithStart:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)formattedDurationStart:(id)a3 toEnd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[DSContinuityPairingWrapper continuityPairing](self, "continuityPairing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formatDurationWithStart:end:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_TtC19DSContinuityPairing19DSContinuityPairing)continuityPairing
{
  return self->_continuityPairing;
}

- (void)setContinuityPairing:(id)a3
{
  objc_storeStrong((id *)&self->_continuityPairing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuityPairing, 0);
}

@end
