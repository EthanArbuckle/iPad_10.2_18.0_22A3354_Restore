@implementation ANRemotePlaybackSessionServiceClientInterfaceProxy

- (void)didUpdateAnnouncements:(id)a3 forGroupID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ANRemotePlaybackSessionServiceClientInterfaceProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didUpdateAnnouncements:forGroupID:", v7, v6);

}

- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ANRemotePlaybackSessionServiceClientInterfaceProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didReceiveAnnouncement:forGroupID:", v7, v6);

}

- (ANRemotePlaybackSessionServiceClientInterface)delegate
{
  return (ANRemotePlaybackSessionServiceClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
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
