@implementation AMSUIActionContext

- (AMSUIActionContext)initWithAccount:(id)a3 bag:(id)a4 presentingViewController:(id)a5 processInfo:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a3;
  swift_unknownObjectRetain();
  v11 = a5;
  v12 = a6;
  return (AMSUIActionContext *)UIActionContext.init(account:bag:presentingViewController:processInfo:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
}

- (AMSUIActionContext)init
{
  UIActionContext.init()();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
