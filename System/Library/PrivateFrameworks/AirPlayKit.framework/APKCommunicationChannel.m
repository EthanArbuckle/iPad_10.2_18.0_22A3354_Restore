@implementation APKCommunicationChannel

- (APKCommunicationChannel)initWithCommunicationChannel:(id)a3
{
  id v5;
  APKCommunicationChannel *v6;
  APKCommunicationChannel *v7;

  v5 = a3;
  v6 = -[APKCommunicationChannel init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_channel, a3);
    -[AVOutputDeviceCommunicationChannel setDelegate:](v7->_channel, "setDelegate:", v7);
  }

  return v7;
}

- (void)close
{
  id v2;

  -[APKCommunicationChannel channel](self, "channel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "close");

}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[APKCommunicationChannel channel](self, "channel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendData:completionHandler:", v7, v6);

}

- (void)communicationChannel:(id)a3 didReceiveData:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[APKCommunicationChannel onData](self, "onData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[APKCommunicationChannel onData](self, "onData");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)communicationChannelDidClose:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[APKCommunicationChannel onClose](self, "onClose", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[APKCommunicationChannel onClose](self, "onClose");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)onData
{
  return self->_onData;
}

- (void)setOnData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)onClose
{
  return self->_onClose;
}

- (void)setOnClose:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AVOutputDeviceCommunicationChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong(&self->_onClose, 0);
  objc_storeStrong(&self->_onData, 0);
}

@end
