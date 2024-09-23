@implementation ICAudioAttachmentEditorCoordinator

- (ICNoteEditorViewController)noteEditorViewController
{
  return (ICNoteEditorViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_noteEditorViewController));
}

- (ICAudioAttachmentEditorCoordinator)initWithNoteEditorViewController:(id)a3
{
  return (ICAudioAttachmentEditorCoordinator *)AudioAttachmentEditorCoordinator.init(noteEditorViewController:)(a3);
}

- (void)presentRecordingViewControllerForAttachment:(id)a3
{
  id v5;
  ICAudioAttachmentEditorCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1DD97E7DC(a3);

}

- (void)attachmentViewDidMoveToWindow:(id)a3
{
  sub_1DD973B70(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1DD97ED6C);
}

- (void)attachmentWillBeDeleted:(id)a3
{
  sub_1DD973B70(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1DD97EF78);
}

- (void)attachmentWasUndeleted:(id)a3
{
  sub_1DD973B70(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1DD97F130);
}

- (void)audioControllerDidPlay:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICAudioAttachmentEditorCoordinator *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD980064();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isShowingInspector
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_isShowingInspector;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingInspector:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_isShowingInspector;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isShowingMiniPlayer
{
  ICAudioAttachmentEditorCoordinator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1DD97FE90();

  return v3 & 1;
}

- (void)textViewDidScroll:(id)a3
{
  id v4;
  ICAudioAttachmentEditorCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1DD980064();

}

- (void)teardown
{
  ICAudioAttachmentEditorCoordinator *v2;

  v2 = self;
  sub_1DD9807F0();

}

- (ICAudioAttachmentEditorCoordinator)init
{
  ICAudioAttachmentEditorCoordinator *result;

  result = (ICAudioAttachmentEditorCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1DD8FF244((uint64_t)self + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_temporaryExportURLToRemove, &qword_1EDBF97F0);

  swift_bridgeObjectRelease();
}

- (UITextView)textView
{
  void *v2;
  ICAudioAttachmentEditorCoordinator *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_noteEditorViewController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_textView);

  return (UITextView *)v4;
}

- (void)presentSharingViewForAttachment:(id)a3 fromSourceView:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  ICAudioAttachmentEditorCoordinator *v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBFA130);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DD9D2344();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_1DD9D2320();
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = v11;
  v15 = v12;
  v16 = sub_1DD9D2314();
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x1E0DF06E8];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v14;
  v17[6] = a4;
  sub_1DD8D46A8((uint64_t)v9, (uint64_t)&unk_1F03F8E28, (uint64_t)v17);

  swift_release();
}

- (void)presentExportViewForAttachment:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  ICAudioAttachmentEditorCoordinator *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBFA130);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD9D2344();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1DD9D2320();
  v9 = a3;
  v10 = self;
  v11 = v9;
  v12 = sub_1DD9D2314();
  v13 = (_QWORD *)swift_allocObject();
  v14 = MEMORY[0x1E0DF06E8];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v10;
  v13[5] = v11;
  sub_1DD8D46A8((uint64_t)v7, (uint64_t)&unk_1F03F8E20, (uint64_t)v13);

  swift_release();
}

- (void)viewWasDismissed
{
  ICAudioAttachmentEditorCoordinator *v2;

  v2 = self;
  AudioAttachmentEditorCoordinator.viewWasDismissed()();

}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4;
  ICAudioAttachmentEditorCoordinator *v5;

  v4 = a3;
  v5 = self;
  _s11NotesEditor015AudioAttachmentB11CoordinatorC14documentPicker_18didPickDocumentsAtySo010UIDocumentG14ViewControllerC_Say10Foundation3URLVGtF_0();

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5;
  ICAudioAttachmentEditorCoordinator *v6;

  v5 = a3;
  v6 = self;
  _s11NotesEditor015AudioAttachmentB11CoordinatorC14documentPicker_18didPickDocumentsAtySo010UIDocumentG14ViewControllerC_Say10Foundation3URLVGtF_0();

}

@end
