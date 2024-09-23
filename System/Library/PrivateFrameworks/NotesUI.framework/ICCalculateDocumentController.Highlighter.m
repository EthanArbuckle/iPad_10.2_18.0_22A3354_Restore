@implementation ICCalculateDocumentController.Highlighter

- (void)performHighlightsUpdate
{
  swift_retain();
  sub_1ACA1E494();
  swift_release();
}

- (void)textStorageDidProcessEndEditing:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1ACA3F45C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  swift_retain();
  sub_1ACA1F1EC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)calculateDocumentControllerDidUpdateDocument:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;

  v3 = sub_1ACA3F45C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  swift_retain();
  v7 = sub_1ACA1E408();
  objc_msgSend(v7, sel_requestFire);
  swift_release();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)noteDidChangeCalculatePreviewBehavior:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1ACA3F45C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  swift_retain();
  sub_1ACA1D578();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
