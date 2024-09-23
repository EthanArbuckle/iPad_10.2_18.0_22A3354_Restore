@implementation VisionPrescriptionManualDataEntryImageSelectionHandler

- (void)dealloc
{
  _TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler *v2;

  v2 = self;
  sub_232299584();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler_fileManager));
  v3 = (char *)self
     + OBJC_IVAR____TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler__selectedImageURL;
  sub_23224BE78(0, &qword_255FACD78, (uint64_t (*)(uint64_t))sub_232245CCC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler)init
{
  _TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler *result;

  result = (_TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  _TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23229A700(v6, v7);

}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC21VisionHealthAppPlugin54VisionPrescriptionManualDataEntryImageSelectionHandler *v8;

  sub_2322B8000();
  v6 = sub_2322B8F30();
  v7 = a3;
  v8 = self;
  sub_23229BE40(v6);

  swift_bridgeObjectRelease();
}

@end
