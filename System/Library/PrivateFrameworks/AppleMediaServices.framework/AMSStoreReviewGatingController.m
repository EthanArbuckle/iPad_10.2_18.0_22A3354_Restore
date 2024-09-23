@implementation AMSStoreReviewGatingController

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

- (AMSStoreReviewGatingController)initWithBag:(id)a3
{
  swift_unknownObjectRetain();
  return (AMSStoreReviewGatingController *)StoreReviewGatingController.init(bag:)((uint64_t)a3);
}

- (void)didEnterForegroundWithCompletionHandler:(id)a3
{
  sub_18C904488(self, (int)a2, a3, (uint64_t)&unk_1E252B600, (uint64_t)&unk_1EE056608);
}

- (AMSBagProtocol)bag
{
  return (AMSBagProtocol *)(id)StoreReviewGatingController.bag.getter();
}

- (void)didPromptWithCompletionHandler:(id)a3
{
  sub_18C904488(self, (int)a2, a3, (uint64_t)&unk_1E252B5D8, (uint64_t)&unk_1EE0565F8);
}

- (void)isEnabledWithCompletionHandler:(id)a3
{
  sub_18C904488(self, (int)a2, a3, (uint64_t)&unk_1E252B5B0, (uint64_t)&unk_1EE0565E8);
}

- (void)canPromptWithCompletionHandler:(id)a3
{
  sub_18C904488(self, (int)a2, a3, (uint64_t)&unk_1E252B588, (uint64_t)&unk_1EE0565D8);
}

- (AMSStoreReviewGatingController)init
{
  StoreReviewGatingController.init()();
}

@end
