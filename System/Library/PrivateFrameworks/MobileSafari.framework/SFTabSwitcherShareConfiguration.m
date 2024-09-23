@implementation SFTabSwitcherShareConfiguration

- (SFTabSwitcherShareConfiguration)initWithShareHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  objc_super v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped);
  *v6 = 0;
  v6[1] = 0;
  v6[2] = sub_18B998E14;
  v6[3] = v5;
  v8.receiver = self;
  v8.super_class = (Class)SFTabSwitcherShareConfiguration;
  return -[SFTabSwitcherShareConfiguration init](&v8, sel_init);
}

- (NSArray)allCollaborationButtons
{
  SFTabSwitcherShareConfiguration *v2;
  void *v3;

  v2 = self;
  sub_18B990FD0();

  sub_18B8918E0(0, (unint64_t *)&qword_1EDFE9740);
  v3 = (void *)sub_18BAC0F1C();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (UIView)collaborationButtonForLargeTitle
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped));
}

- (void)setCollaborationButtonForLargeTitle:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped) = (Class)a3;
  v3 = a3;

}

- (UIView)collaborationButtonForNavigationBar
{
  return (UIView *)*(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped];
}

- (void)setCollaborationButtonForNavigationBar:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped];
  *(_QWORD *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped] = a3;
  v3 = a3;

}

- (id)shareHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped + 16];
  v5[4] = *(_QWORD *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped + 8];
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_18B989E38;
  v5[3] = &block_descriptor_19;
  v3 = _Block_copy(v5);
  sub_18BABFBB4();
  swift_release();
  return v3;
}

- (void)setShareHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  char *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (char *)self + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped;
  *((_QWORD *)v6 + 2) = sub_18B998E14;
  *((_QWORD *)v6 + 3) = v5;
  swift_release();
}

- (SFTabSwitcherShareConfiguration)init
{
  SFTabSwitcherShareConfiguration *result;

  result = (SFTabSwitcherShareConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B9912F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped, (void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

@end
