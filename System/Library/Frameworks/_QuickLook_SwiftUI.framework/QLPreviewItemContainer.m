@implementation QLPreviewItemContainer

- (NSURL)previewItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  sub_22700CD04((uint64_t)v6, (uint64_t)v5, &qword_2558AE7A8);
  v7 = sub_22700E5B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_22700E598();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setPreviewItemURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC18_QuickLook_SwiftUI22QLPreviewItemContainer *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AE7A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22700E5A4();
    v8 = sub_22700E5B0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_22700E5B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL;
  swift_beginAccess();
  v11 = self;
  sub_22700CD48((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (BOOL)isEqual:(id)a3
{
  _TtC18_QuickLook_SwiftUI22QLPreviewItemContainer *v4;
  _TtC18_QuickLook_SwiftUI22QLPreviewItemContainer *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22700E784();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_22700B1F8((uint64_t)v8);

  sub_22700D068((uint64_t)v8, &qword_2558AEA68);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC18_QuickLook_SwiftUI22QLPreviewItemContainer *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_22700B640();

  return v3;
}

- (_TtC18_QuickLook_SwiftUI22QLPreviewItemContainer)init
{
  _TtC18_QuickLook_SwiftUI22QLPreviewItemContainer *result;

  result = (_TtC18_QuickLook_SwiftUI22QLPreviewItemContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22700D068((uint64_t)self + OBJC_IVAR____TtC18_QuickLook_SwiftUI22QLPreviewItemContainer_previewItemURL, &qword_2558AE7A8);
}

@end
