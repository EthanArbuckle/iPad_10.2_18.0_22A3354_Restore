@implementation ICSharedWithYouControllerInternal

+ (ICSharedWithYouControllerInternal)sharedController
{
  if (qword_1EDBF9FD0 != -1)
    swift_once();
  return (ICSharedWithYouControllerInternal *)(id)qword_1EDBF9F10;
}

- (NSManagedObjectContext)managedObjectContext
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICSharedWithYouControllerInternal_managedObjectContext);
  swift_beginAccess();
  return (NSManagedObjectContext *)*v2;
}

- (void)setManagedObjectContext:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  ICSharedWithYouControllerInternal *v8;

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICSharedWithYouControllerInternal_managedObjectContext);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1DD90CAA0();
  sub_1DD90CE08();
  _s11NotesEditor23SharedWithYouControllerC34highlightCenterHighlightsDidChangeyySo011SWHighlightH0CF_0();

}

- (id)highlightForURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  void *v8;
  ICSharedWithYouControllerInternal *v9;
  id v10;
  unint64_t v11;
  void *v12;
  _BYTE v14[16];
  _BYTE *v15;

  v4 = sub_1DD9D0724();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DD9D06E8();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSharedWithYouControllerInternal_highlightCenter);
  v9 = self;
  v10 = objc_msgSend(v8, sel_highlights);
  sub_1DD7C0C74(0, &qword_1EDBFA188);
  v11 = sub_1DD9D22A8();

  v15 = v7;
  v12 = sub_1DD90D7E4(sub_1DD917CB8, (uint64_t)v14, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (void)fetchShareMetadataWithURLs:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  ICSharedWithYouControllerInternal *v8;

  v5 = _Block_copy(a4);
  sub_1DD9D0724();
  v6 = sub_1DD9D22A8();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  SharedWithYouController.fetchShareMetadata(_:_:)(v6, (uint64_t)sub_1DD9137AC, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)userAcceptedInvitationWithShareMetadata:(id)a3 associatedObjectID:(id)a4
{
  id v6;
  id v7;
  ICSharedWithYouControllerInternal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  SharedWithYouController.userAcceptedInvitation(_:_:)((CKShareMetadata)v6, (NSManagedObjectID)v7);

}

- (ICSharedWithYouControllerInternal)init
{
  return (ICSharedWithYouControllerInternal *)SharedWithYouController.init()();
}

- (void)dealloc
{
  ICSharedWithYouControllerInternal *v2;

  v2 = self;
  SharedWithYouController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___ICSharedWithYouControllerInternal_logger;
  v4 = sub_1DD9D0C40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4;
  ICSharedWithYouControllerInternal *v5;

  v4 = a3;
  v5 = self;
  _s11NotesEditor23SharedWithYouControllerC34highlightCenterHighlightsDidChangeyySo011SWHighlightH0CF_0();

}

@end
