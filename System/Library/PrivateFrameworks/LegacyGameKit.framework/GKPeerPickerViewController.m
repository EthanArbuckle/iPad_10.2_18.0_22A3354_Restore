@implementation GKPeerPickerViewController

- (GKPeerPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKPeerPickerViewController;
  return -[GKPeerPickerViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (GKSession)currentSession
{
  return 0;
}

- (BOOL)isVisible
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (GKContentView)btView
{
  return self->_btView;
}

- (void)setBtView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 976);
}

- (GKContentView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (GKContentView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

- (GKContentView)inviteView
{
  return self->_inviteView;
}

- (void)setInviteView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1000);
}

- (GKContentView)connectTypeView
{
  return self->_connectTypeView;
}

- (void)setConnectTypeView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1008);
}

- (GKContentView)noPeersView
{
  return self->_noPeersView;
}

- (void)setNoPeersView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (GKContentView)currentView
{
  return self->_currentView;
}

- (unint64_t)connectionTypesMask
{
  return self->_connectionTypesMask;
}

- (void)setConnectionTypesMask:(unint64_t)a3
{
  self->_connectionTypesMask = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

@end
