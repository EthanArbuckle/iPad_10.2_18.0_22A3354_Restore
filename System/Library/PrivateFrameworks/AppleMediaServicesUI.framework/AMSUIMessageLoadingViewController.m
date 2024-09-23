@implementation AMSUIMessageLoadingViewController

+ (id)placeholderStyleLoadingControllerWithMessage:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
    sub_21124639C();
  static MessageLoadingViewController.placeholderStyleLoadingController(message:)();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

- (AMSUIMessageLoadingViewController)initWithCoder:(id)a3
{
  sub_2111FE95C();
}

- (void)viewDidLoad
{
  AMSUIMessageLoadingViewController *v2;

  v2 = self;
  sub_2111FE9C0();

}

- (void)removeMessage
{
  AMSUIMessageLoadingViewController *v2;

  v2 = self;
  sub_2111FEA40();

}

- (AMSUIMessageLoadingViewController)init
{
  MessageLoadingViewController.init()();
}

- (AMSUIMessageLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_21124639C();
  v5 = a4;
  MessageLoadingViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___AMSUIMessageLoadingViewController_loadingController));
  v3 = (char *)self + OBJC_IVAR___AMSUIMessageLoadingViewController_presentationContext;
  v4 = OUTLINED_FUNCTION_2_18();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
