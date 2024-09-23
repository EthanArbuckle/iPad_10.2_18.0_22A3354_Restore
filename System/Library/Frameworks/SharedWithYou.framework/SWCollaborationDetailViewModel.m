@implementation SWCollaborationDetailViewModel

- (NSItemProvider)itemProvider
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  return (NSItemProvider *)*v2;
}

- (void)setItemProvider:(id)a3
{
  SWCollaborationDetailViewModel *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_18EACE308(v5);

}

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  swift_beginAccess();
  return (UICloudSharingControllerDelegate *)(id)MEMORY[0x193FF6168](v2);
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (SWHighlight)highlight
{
  SWCollaborationDetailViewModel *v3;
  id v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  return (SWHighlight *)v5;
}

- (void)setHighlight:(id)a3
{
  id v5;
  SWCollaborationDetailViewModel *v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v5 = a3;
  v6 = self;
  sub_18EAE6A6C();
}

- (NSString)customContentTitle
{
  SWCollaborationDetailViewModel *v3;
  void *v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  if (!v6)
    return (NSString *)0;
  v4 = (void *)sub_18EAE6EB0();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setCustomContentTitle:(id)a3
{
  SWCollaborationDetailViewModel *v4;

  if (a3)
    sub_18EAE6ED4();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18EAE6A6C();
}

- (NSArray)customCollaborators
{
  SWCollaborationDetailViewModel *v3;
  void *v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  if (!v6)
    return (NSArray *)0;
  sub_18EAC570C(0, &qword_1EE12F9E8);
  v4 = (void *)sub_18EAE6F28();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (void)setCustomCollaborators:(id)a3
{
  SWCollaborationDetailViewModel *v4;

  if (a3)
  {
    sub_18EAC570C(0, &qword_1EE12F9E8);
    sub_18EAE6F34();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18EAE6A6C();
}

- (NSString)manageButtonTitle
{
  SWCollaborationDetailViewModel *v3;
  void *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  v4 = (void *)sub_18EAE6EB0();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setManageButtonTitle:(id)a3
{
  SWCollaborationDetailViewModel *v4;

  sub_18EAE6ED4();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18EAE6A6C();
}

- (BOOL)showManageButton
{
  SWCollaborationDetailViewModel *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  return v5;
}

- (void)setShowManageButton:(BOOL)a3
{
  SWCollaborationDetailViewModel *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18EAE6A6C();
}

- (SWCollaborationDetailViewModel)initWithHighlight:(id)a3
{
  id v4;
  SWCollaborationDetailViewModel *v5;

  v4 = a3;
  v5 = (SWCollaborationDetailViewModel *)sub_18EACD254(a3);

  return v5;
}

- (SWCollaborationDetailViewModel)initWithItemProvider:(id)a3
{
  return (SWCollaborationDetailViewModel *)CollaborationDetailViewModel.init(itemProvider:)(a3);
}

- (SWCollaborationDetailViewModel)init
{
  SWCollaborationDetailViewModel *result;

  result = (SWCollaborationDetailViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter));
  sub_18EACEE38((uint64_t)self + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate);
  v3 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__collaborationInfo;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__highlight;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__customContentTitle;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__headerFallback;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__customCollaborators;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F878);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F890);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  SWCollaborationDetailViewModel *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  v9 = a3;
  v10 = self;
  sub_18EAE6A60();
  swift_release();
  swift_release();
  sub_18EAC9778((uint64_t)v8);
  sub_18EACF070((uint64_t)v8, &qword_1EE12F8C8);

}

@end
