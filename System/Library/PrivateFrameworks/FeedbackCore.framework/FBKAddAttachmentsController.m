@implementation FBKAddAttachmentsController

- (_TtC12FeedbackCore27FBKAddAttachmentsController)initWithDelegate:(id)a3 supportsDragAndDrop:(BOOL)a4
{
  char *v6;
  uint64_t v7;
  objc_super v9;

  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC12FeedbackCore27FBKAddAttachmentsController____lazy_storage___temporaryDirectory;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553999F0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_unknownObjectWeakAssign();
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore27FBKAddAttachmentsController_supportsDragAndDrop) = a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBKAddAttachmentsController();
  return -[FBKAddAttachmentsController init](&v9, sel_init);
}

- (id)sheetForController:(id)a3 selectedIndexPath:(id)a4 sender:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12FeedbackCore27FBKAddAttachmentsController *v15;
  char *v16;
  uint64_t v18;

  v8 = sub_21DAC3F28();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v13 = a3;
  v14 = a5;
  v15 = self;
  v16 = sub_21DA68E64(v13, (uint64_t)v12, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v16;
}

- (id)menuForController:(id)a3
{
  id v4;
  _TtC12FeedbackCore27FBKAddAttachmentsController *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = self;
  v6 = sub_21DA676FC(v4);
  v7 = objc_allocWithZone((Class)type metadata accessor for FBKActionMenuController());
  v8 = sub_21DA60E2C(0, 0, 0, 0, v6);
  v9 = (void *)sub_21DA61150();

  return v9;
}

- (_TtC12FeedbackCore27FBKAddAttachmentsController)init
{
  _TtC12FeedbackCore27FBKAddAttachmentsController *result;

  result = (_TtC12FeedbackCore27FBKAddAttachmentsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21DA5AE8C((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore27FBKAddAttachmentsController_attachmentDelegate);
  sub_21DA3BA38((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore27FBKAddAttachmentsController____lazy_storage___temporaryDirectory, &qword_255399B20);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12FeedbackCore27FBKAddAttachmentsController *v8;

  sub_21DAC3E44();
  v6 = sub_21DAC496C();
  v7 = a3;
  v8 = self;
  sub_21DA6BD7C(v6);

  swift_bridgeObjectRelease();
}

+ (void)handleErrorAttachingWithAttachment:(id)a3 viewController:(id)a4 devicesDiagnosticsController:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  swift_getObjCClassMetadata();
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  static FBKAddAttachmentsController.handleErrorAttaching(attachment:viewController:devicesDiagnosticsController:error:)(v10, v11, v12, v13);

}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  _TtC12FeedbackCore27FBKAddAttachmentsController *v7;
  char v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_21DA6BED8(a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC12FeedbackCore27FBKAddAttachmentsController *v16;
  id v17;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255399A00);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_21DAC3EF8();
    v13 = sub_21DAC3F28();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 0, 1, v13);
  }
  else
  {
    v14 = sub_21DAC3F28();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
  }
  v15 = a3;
  swift_unknownObjectRetain();
  v16 = self;
  v17 = FBKAddAttachmentsController.tableView(_:dropSessionDidUpdate:withDestinationIndexPath:)((uint64_t)v15, (uint64_t)a4, (uint64_t)v12);

  swift_unknownObjectRelease();
  sub_21DA3BA38((uint64_t)v12, &qword_255399A00);
  return v17;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  -[FBKAddAttachmentsController getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:](self, sel_getFilesFromFileProviderBeforeTheyDisappearWithCoordinator_, a4);
}

- (void)getFilesFromFileProviderBeforeTheyDisappearWithCoordinator:(id)a3
{
  _TtC12FeedbackCore27FBKAddAttachmentsController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_21DA6A360(a3);
  swift_unknownObjectRelease();

}

@end
