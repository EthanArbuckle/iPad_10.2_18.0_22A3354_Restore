@implementation IntentHandler

- (_TtC16SelectPerson_iOS13IntentHandler)init
{
  return (_TtC16SelectPerson_iOS13IntentHandler *)sub_100003114();
}

- (void)providePeopleOptionsCollectionForSelectPeople:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC16SelectPerson_iOS13IntentHandler *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject(&unk_100008668, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_1000032F0(v12, v9, (uint64_t)a4, (uint64_t)sub_1000066FC, v11);

  swift_release(v11);
  swift_bridgeObjectRelease(a4);
}

- (id)defaultPeopleForSelectPeople:(id)a3
{
  id v4;
  _TtC16SelectPerson_iOS13IntentHandler *v5;
  uint64_t v6;
  NSArray v7;

  v4 = a3;
  v5 = self;
  v6 = sub_100005F14();

  if (v6)
  {
    type metadata accessor for PersonType(0);
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (void).cxx_destruct
{
  sub_100006784((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher));
  sub_100006784((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter));
  sub_100006784((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter));
  sub_100006784((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts));
}

@end
