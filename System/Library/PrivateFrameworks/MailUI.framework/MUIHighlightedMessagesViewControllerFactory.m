@implementation MUIHighlightedMessagesViewControllerFactory

+ (id)createViewControllerForMessages:(id)a3 cellLayoutValues:(id)a4 contactStore:(id)a5 delegate:(id)a6
{
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  id v15;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = a4;
  v8 = a5;
  swift_unknownObjectRetain();
  type metadata accessor for MUIHighlightedMessage();
  v10 = sub_1D565FF90();
  swift_getObjCClassMetadata();
  v15 = sub_1D560A820(v10, a4, a5, (uint64_t)a6);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return v15;
}

+ (void)updateContainerInsets:(NSDirectionalEdgeInsets)a3 forViewController:(id)a4
{
  id v4;

  swift_getObjCClassMetadata();
  v4 = a4;
  swift_getObjCClassMetadata();
  sub_1D560AC1C(a4, a3.top, a3.leading, a3.bottom, a3.trailing);

}

+ (void)updateMessages:(id)a3 forViewController:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = a4;
  type metadata accessor for MUIHighlightedMessage();
  v6 = sub_1D565FF90();
  swift_getObjCClassMetadata();
  sub_1D560ADE8(v6, a4);
  swift_bridgeObjectRelease();

}

+ (void)hideBelowLineMessagesForViewController:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  sub_1D560AF94(a3);

}

+ (void)resetSelectionForViewController:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  sub_1D560B0EC((uint64_t)a3);

}

- (MUIHighlightedMessagesViewControllerFactory)init
{
  swift_getObjectType();
  return (MUIHighlightedMessagesViewControllerFactory *)MUIHighlightedMessagesViewControllerFactory.init()();
}

@end
