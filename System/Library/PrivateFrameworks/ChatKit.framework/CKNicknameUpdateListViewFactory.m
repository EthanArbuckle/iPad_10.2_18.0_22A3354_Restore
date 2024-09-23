@implementation CKNicknameUpdateListViewFactory

+ (id)listViewWithUpdates:(id)a3 delegate:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  id v7;

  sub_18E00F31C(0, &qword_1EE10CA10);
  v5 = sub_18E768AE0();
  type metadata accessor for NicknameUpdateListViewFactory();
  swift_unknownObjectRetain();
  v6 = sub_18E5FC488(v5, (uint64_t)a4);
  v7 = sub_18E5FBFE0(v6, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

- (CKNicknameUpdateListViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NicknameUpdateListViewFactory();
  return -[CKNicknameUpdateListViewFactory init](&v3, sel_init);
}

@end
