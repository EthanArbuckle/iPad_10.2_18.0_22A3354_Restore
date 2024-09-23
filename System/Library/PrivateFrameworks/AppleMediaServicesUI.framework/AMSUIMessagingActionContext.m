@implementation AMSUIMessagingActionContext

- (AMSUIMessagingActionContext)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = a5;
  return (AMSUIMessagingActionContext *)ActionContext.init(bag:account:clientInfo:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (AMSUIMessagingActionContext)init
{
  ActionContext.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
