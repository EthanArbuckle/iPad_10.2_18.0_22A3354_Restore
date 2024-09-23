@implementation EventStoreManager

- (_TtC8AppStore17EventStoreManager)init
{
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  _TtC8AppStore17EventStoreManager *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = OBJC_IVAR____TtC8AppStore17EventStoreManager_eventStore;
  v5 = objc_allocWithZone((Class)EKEventStore);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v5, "init");

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[EventStoreManager init](&v8, "init");
}

- (void).cxx_destruct
{

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  _TtC8AppStore17EventStoreManager *v5;
  _TtC8AppStore17EventStoreManager *v6;
  _TtC8AppStore17EventStoreManager *v7;
  _TtC8AppStore17EventStoreManager *v8;

  v5 = (_TtC8AppStore17EventStoreManager *)a3;
  v8 = self;
  v6 = (_TtC8AppStore17EventStoreManager *)-[EventStoreManager presentingViewController](v5, "presentingViewController");
  if (v6)
  {
    v7 = v6;
    -[EventStoreManager dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, 0);

    v5 = v8;
    v8 = v7;
  }

}

@end
