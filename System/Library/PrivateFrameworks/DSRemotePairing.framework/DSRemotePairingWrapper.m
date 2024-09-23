@implementation DSRemotePairingWrapper

- (DSRemotePairingWrapper)init
{
  _TtC15DSRemotePairing15DSRemotePairing *v3;

  v3 = objc_alloc_init(_TtC15DSRemotePairing15DSRemotePairing);
  -[DSRemotePairingWrapper setRemotePairing:](self, "setRemotePairing:", v3);

  return self;
}

- (id)getPairedDevicesWithCompletion:(id)a3
{
  return -[DSRemotePairing getPairedDevicesWithCompletion:](self->_remotePairing, "getPairedDevicesWithCompletion:", a3);
}

- (id)removeAllPairedDevices
{
  void *v2;
  void *v3;

  -[DSRemotePairingWrapper remotePairing](self, "remotePairing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeSelectedDevices:(id)a3 onQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DSRemotePairingWrapper remotePairing](self, "remotePairing");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeSelectedDevices:invokingCompletionHandlerOn:completion:", v10, v9, v8);

}

- (_TtC15DSRemotePairing15DSRemotePairing)remotePairing
{
  return self->_remotePairing;
}

- (void)setRemotePairing:(id)a3
{
  objc_storeStrong((id *)&self->_remotePairing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePairing, 0);
}

@end
