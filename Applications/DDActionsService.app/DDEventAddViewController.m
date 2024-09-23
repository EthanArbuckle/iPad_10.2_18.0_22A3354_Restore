@implementation DDEventAddViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionPresenter, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionViewService, a2, a1);
}

- (void)prepareForAction:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, char, id);
  void *v8;
  id v9;
  id v10;
  DDEventAddViewController *v11;
  id v12;
  id location[2];
  DDEventAddViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = objc_alloc_init((Class)EKEventStore);
  v3 = v12;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10000A4E0;
  v8 = &unk_100020858;
  v9 = location[0];
  v10 = v12;
  v11 = v14;
  objc_msgSend(v3, "requestFullAccessToEventsWithCompletion:");
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)setCancellable:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[DDEventAddViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v3, "actionCanBeCancelledExternally:", v4);

}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  ;
}

- (void)doneWithAddingEvent
{
  id v2;

  -[DDEventAddViewController setCancellable:](self, "setCancellable:", 1);
  v2 = -[DDEventAddViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v2, "actionDidFinishShouldDismiss:", 1);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  id v6;
  id v7;
  BOOL v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(id *, void *);
  void *v13;
  id v14;
  id v15;
  objc_super v16;
  id v17;
  id location[2];
  DDEventAddViewController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver = v19;
  v16.super_class = (Class)DDEventAddViewController;
  -[DDEventAddViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v16, "willTransitionToTraitCollection:withTransitionCoordinator:", location[0], v17);
  v6 = objc_msgSend(location[0], "verticalSizeClass");
  v7 = -[DDEventAddViewController traitCollection](v19, "traitCollection");
  v8 = v6 == objc_msgSend(v7, "verticalSizeClass");

  if (!v8)
  {
    v4 = v17;
    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_10000ADB4;
    v13 = &unk_100020880;
    v14 = location[0];
    v15 = v17;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", &v9);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  id location[2];
  DDEventAddViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[DDEventAddViewController doneWithAddingEvent](v4, "doneWithAddingEvent");
  objc_storeStrong(location, 0);
}

- (DDAction)action
{
  return (DDAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAddController, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
