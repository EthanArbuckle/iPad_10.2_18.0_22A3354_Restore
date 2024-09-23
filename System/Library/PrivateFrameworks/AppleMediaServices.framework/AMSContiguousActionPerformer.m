@implementation AMSContiguousActionPerformer

- (AMSContiguousActionPerformer)initWithQueue:(id)a3
{
  return (AMSContiguousActionPerformer *)ContiguousActionPerformer.init(queue:)(a3);
}

- (void).cxx_destruct
{
  swift_release();

}

- (void)async:(id)a3
{
  void *v4;
  AMSContiguousActionPerformer *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  ContiguousActionPerformer.async(_:)();

  swift_release();
}

- (void)continueContiguousActionWithIdentifier:(unint64_t)a3 withBlock:(id)a4
{
  void *v6;
  AMSContiguousActionPerformer *v7;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = self;
  ContiguousActionPerformer.continueContiguousAction(withIdentifier:work:)(a3);

  swift_release();
}

- (unint64_t)performInitialContiguousActionWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  AMSContiguousActionPerformer *v6;
  unint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = ContiguousActionPerformer.performInitialContiguousAction(_:)((uint64_t)sub_18C8CE724, v5);

  swift_release();
  return v7;
}

- (void)finishContiguousActionWithIdentifier:(unint64_t)a3
{
  AMSContiguousActionPerformer *v4;

  v4 = self;
  ContiguousActionPerformer.finishContiguousAction(identifier:)(a3);

}

- (void)sync:(id)a3
{
  void *v4;
  AMSContiguousActionPerformer *v5;
  _QWORD v6[4];

  v4 = _Block_copy(a3);
  v6[2] = v4;
  v5 = self;
  ContiguousActionPerformer.sync(_:)((uint64_t)sub_18C8CDCFC, (uint64_t)v6);
  _Block_release(v4);

}

- (void)dealloc
{
  AMSContiguousActionPerformer *v2;

  v2 = self;
  ContiguousActionPerformer.__deallocating_deinit();
}

- (AMSContiguousActionPerformer)init
{
  ContiguousActionPerformer.init()();
}

@end
