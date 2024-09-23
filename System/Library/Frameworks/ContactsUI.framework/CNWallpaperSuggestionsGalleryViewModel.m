@implementation CNWallpaperSuggestionsGalleryViewModel

- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18AD16E84(a4);

}

- (void)editingViewControllerDidFinishShowingContent:(id)a3
{
  id v4;
  _TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_18AD12B0C(v4);

}

- (_TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel)init
{
  _TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel *result;

  result = (_TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  sub_18ACCDE68((uint64_t)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__layoutDirection, &qword_1EDF94D58);
  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__isConfiguringPosterEditor;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94CD0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__shouldPresentPosterEditor, v4);
  v5((char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__shouldPresentPosterPhotoPicker, v4);
  v6 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__selectedSource;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94C70);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel_editorVC));
  v8 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__pickerType;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94C58);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__pickedImage;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D00);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__photoLibraryAssetID;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94CA8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__posterConfiguration;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94CE0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  sub_18ACCDE68((uint64_t)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel_lastSelectedSource, &qword_1EDF94A58);
  v16 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__selectedSuggestedAvatar;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94C88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel__suggestedAvatars;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94CC0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel_contact));
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10ContactsUI38CNWallpaperSuggestionsGalleryViewModel *v8;

  type metadata accessor for InfoKey(0);
  sub_18ACB7AD8((unint64_t *)&unk_1EDF99E70, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_18AF84B84);
  v6 = sub_18AF4FBA8();
  v7 = a3;
  v8 = self;
  sub_18AD149F0(v7, v6);

  swift_bridgeObjectRelease();
}

@end
