@implementation DDReminderViewController

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
  dispatch_queue_t queue;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10[2];
  id location;
  SEL v12;
  DDReminderViewController *v13;

  v13 = self;
  v12 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  queue = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100010C74;
  v8 = &unk_1000209C0;
  v9 = location;
  v10[0] = v13;
  v10[1] = (id)v12;
  dispatch_async(queue, &v4);

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

- (id)title
{
  __CFString *v2;
  __CFString *v4;
  NSAttributedString *v5;
  NSString *v6;

  v5 = -[DDReminderCreationController title](self->_reminderDelegate, "title");
  v6 = -[NSAttributedString string](v5, "string");
  if (v6)
    v2 = v6;
  else
    v2 = &stru_100020FA8;
  v4 = v2;

  return v4;
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  ;
}

- (void)setCancellable:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[DDReminderViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v3, "actionCanBeCancelledExternally:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderDelegate, 0);
  objc_storeStrong((id *)&self->_reminderViewController, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
