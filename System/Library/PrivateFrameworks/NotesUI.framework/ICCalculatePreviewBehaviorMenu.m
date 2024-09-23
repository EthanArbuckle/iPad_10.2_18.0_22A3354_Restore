@implementation ICCalculatePreviewBehaviorMenu

- (ICNote)note
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_note;
  swift_beginAccess();
  return (ICNote *)(id)MEMORY[0x1AF446658](v2);
}

- (void)setNote:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)isMathEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_isMathEnabled);
}

- (ICCalculatePreviewBehaviorMenu)initWithNote:(id)a3 isMathEnabled:(BOOL)a4
{
  objc_super v7;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_allBehaviors) = (Class)&unk_1E5C24760;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_isMathEnabled) = a4;
  v7.receiver = self;
  v7.super_class = (Class)ICCalculatePreviewBehaviorMenu;
  return -[ICCalculatePreviewBehaviorMenu init](&v7, sel_init);
}

- (id)makeMenu
{
  ICCalculatePreviewBehaviorMenu *v2;
  void *v3;

  v2 = self;
  v3 = (void *)ICCalculatePreviewBehaviorMenu.makeMenu()();

  return v3;
}

- (ICCalculatePreviewBehaviorMenu)init
{
  ICCalculatePreviewBehaviorMenu *result;

  result = (ICCalculatePreviewBehaviorMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end
