@implementation CKRemotePeoplePickerViewController

- (void)loadView
{
  CKRemotePeoplePickerViewController *v2;

  v2 = self;
  RemotePeoplePickerViewController.loadView()();

}

- (void)viewDidLoad
{
  CKRemotePeoplePickerViewController *v2;

  v2 = self;
  RemotePeoplePickerViewController.viewDidLoad()();

}

- (void)viewDidDisappear:(BOOL)a3
{
  CKRemotePeoplePickerViewController *v4;

  v4 = self;
  RemotePeoplePickerViewController.viewDidDisappear(_:)(a3);

}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  CKRemotePeoplePickerViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = RemotePeoplePickerViewController.shouldAcceptXPCConnection(_:)((NSXPCConnection)v4);

  return self & 1;
}

- (CKRemotePeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (CKRemotePeoplePickerViewController *)RemotePeoplePickerViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (CKRemotePeoplePickerViewController)initWithCoder:(id)a3
{
  return (CKRemotePeoplePickerViewController *)RemotePeoplePickerViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKRemotePeoplePickerViewController_connection));
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___CKRemotePeoplePickerViewController____lazy_storage___contentViewController));
}

- (void)requestActivity:(id)a3
{
  void *v4;
  uint64_t v5;
  CKRemotePeoplePickerViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  RemotePeoplePickerViewController.requestActivity(completionHandler:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UIImage?) -> (), v5);

  swift_release();
}

- (void)dismissViewControllerWithSuccess:(BOOL)a3
{
  CKRemotePeoplePickerViewController *v4;

  v4 = self;
  RemotePeoplePickerViewController.dismissViewController(success:)(a3);

}

@end
