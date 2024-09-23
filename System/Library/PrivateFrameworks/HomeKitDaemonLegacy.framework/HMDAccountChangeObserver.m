@implementation HMDAccountChangeObserver

- (HMDAccountChangeObserverDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HMDAccountChangeObserver_delegate;
  swift_beginAccess();
  return (HMDAccountChangeObserverDelegate *)(id)MEMORY[0x1D17BA964](v2);
}

- (void)setDelegate:(id)a3
{
  HMDAccountChangeObserver *v4;

  swift_unknownObjectRetain();
  v4 = self;
  Account.ChangeObserver.delegate.setter();

}

- (HMDAccountChangeObserver)init
{
  id v2;
  objc_class *v3;
  char *v4;
  HMDAccountChangeObserver *v5;
  objc_super v7;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedSubscriber);
  v3 = (objc_class *)type metadata accessor for Account.ChangeObserver();
  v4 = (char *)objc_allocWithZone(v3);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR___HMDAccountChangeObserver_eventSubscriber] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = -[HMDAccountChangeObserver init](&v7, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1CD0C9A48((uint64_t)self + OBJC_IVAR___HMDAccountChangeObserver_delegate);
}

@end
