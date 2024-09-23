@implementation AMSCampaignAttributor

- (AMSBagProtocol)bag
{
  return (AMSBagProtocol *)(id)CampaignAttributor.bag.getter();
}

- (ACAccount)account
{
  return (ACAccount *)CampaignAttributor.account.getter();
}

- (void)setAccount:(id)a3
{
  id v5;
  AMSCampaignAttributor *v6;

  v5 = a3;
  v6 = self;
  CampaignAttributor.account.setter(a3);

}

- (AMSCampaignAttributor)initWithAppBag:(id)a3
{
  AMSCampaignAttributor *result;

  swift_unknownObjectRetain();
  CampaignAttributor.init(appBag:)((uint64_t)a3);
  return result;
}

- (AMSCampaignAttributor)initWithBag:(id)a3
{
  AMSCampaignAttributor *result;

  swift_unknownObjectRetain();
  CampaignAttributor.init(bag:)((uint64_t)a3);
  return result;
}

- (void)processURL:(NSURL *)a3 ignoreMarketing:(BOOL)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  NSURL *v10;
  AMSCampaignAttributor *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_18C869ACC((uint64_t)&unk_1EE055A70, v9);
}

- (AMSCampaignAttributor)init
{
  CampaignAttributor.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
