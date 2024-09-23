@implementation ANLocalPlaybackSessionInterfaceDelegateProxy

- (void)announcementsWillStartPlaying:(unint64_t)a3
{
  id v4;

  -[ANLocalPlaybackSessionInterfaceDelegateProxy delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announcementsWillStartPlaying:", a3);

}

- (void)announcementsStateUpdate:(unint64_t)a3
{
  id v4;

  -[ANLocalPlaybackSessionInterfaceDelegateProxy delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announcementsStateUpdate:", a3);

}

- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ANLocalPlaybackSessionInterfaceDelegateProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didReceiveAnnouncement:forGroupID:", v7, v6);

}

- (ANLocalPlaybackSessionServiceInterfaceDelegate)delegate
{
  return (ANLocalPlaybackSessionServiceInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
