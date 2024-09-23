@implementation FBAAddAttachmentsController

- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)initWithDelegate:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  objc_super v9;

  v5 = (char *)self + OBJC_IVAR____TtC18Feedback_Assistant27FBAAddAttachmentsController_attachmentDelegate;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant27FBAAddAttachmentsController_attachmentDelegate, 0);
  v6 = (char *)self
     + OBJC_IVAR____TtC18Feedback_Assistant27FBAAddAttachmentsController____lazy_storage___temporaryDirectory;
  v7 = sub_10004BB9C(&qword_100116790);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_unknownObjectWeakAssign(v5, a3);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBAAddAttachmentsController(0);
  return -[FBAAddAttachmentsController init](&v9, "init");
}

- (id)sheetForController:(id)a3 selectedIndexPath:(id)a4 sender:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v15;
  char *v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = a5;
  v15 = self;
  v16 = sub_1000588B8(v13, (uint64_t)v12, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

- (id)menuForController:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v5;
  uint64_t v6;
  id v7;
  id v8;
  Class v9;

  v4 = a3;
  v5 = self;
  v6 = sub_100057074(v4);
  v7 = objc_allocWithZone((Class)type metadata accessor for FBAActionMenuController());
  v8 = sub_1000704CC(0, 0, 0, 0, v6);
  v9 = sub_1000707F0();

  return v9;
}

- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)init
{
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *result;

  result = (_TtC18Feedback_Assistant27FBAAddAttachmentsController *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAAddAttachmentsController", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000535EC((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant27FBAAddAttachmentsController_attachmentDelegate);
  sub_10004F588((uint64_t)self+ OBJC_IVAR____TtC18Feedback_Assistant27FBAAddAttachmentsController____lazy_storage___temporaryDirectory, &qword_1001168D8);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v10;
  uint64_t v11;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10005BA84(v8, v11);

  swift_bridgeObjectRelease(v8);
}

+ (void)handleErrorAttachingWithAttachment:(id)a3 viewController:(id)a4 devicesDiagnosticsController:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  swift_getObjCClassMetadata(a1);
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sub_100059460(v10, v11, v12, (uint64_t)v13);

}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v7;
  char v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_10005BB68(a4);

  swift_unknownObjectRelease(a4);
  return v8 & 1;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v15;
  id v16;
  uint64_t v18;

  v9 = sub_10004BB9C(&qword_100116880);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  v16 = sub_100059ADC((uint64_t)v14, (uint64_t)a4, (uint64_t)v11);

  swift_unknownObjectRelease(a4);
  sub_10004F588((uint64_t)v11, &qword_100116880);
  return v16;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  -[FBAAddAttachmentsController getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:](self, "getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:", a4);
}

- (void)getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:(id)a3
{
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100059D7C(a3);
  swift_unknownObjectRelease(a3);

}

@end
