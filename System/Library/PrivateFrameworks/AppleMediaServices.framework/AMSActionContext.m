@implementation AMSActionContext

- (AMSActionContext)initWithAccount:(id)a3 bag:(id)a4 processInfo:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = a5;
  return (AMSActionContext *)ActionContext.init(account:bag:processInfo:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (AMSActionContext)init
{
  ActionContext.init()();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
