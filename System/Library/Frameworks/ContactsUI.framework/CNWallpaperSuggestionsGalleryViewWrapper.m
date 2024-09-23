@implementation CNWallpaperSuggestionsGalleryViewWrapper

- (UIViewController)hostingController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper_hostingController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper)initWithDelegate:(id)a3 windowScene:(id)a4 mode:(int64_t)a5 contact:(id)a6 isEditingSNaP:(BOOL)a7 isOnboarding:(BOOL)a8 photoLibraryAssetID:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper *v20;

  v9 = a8;
  v10 = a7;
  if (a9)
  {
    v15 = sub_18AF4FC5C();
    v17 = v16;
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  swift_unknownObjectRetain();
  v18 = a4;
  v19 = a6;
  v20 = (_TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper *)sub_18AD3E5F0((uint64_t)a3, a4, a5, v19, v10, v9, v15, v17);
  swift_unknownObjectRelease();

  return v20;
}

- (_TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper)init
{
  _TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper *result;

  result = (_TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper_hostingController));
}

@end
