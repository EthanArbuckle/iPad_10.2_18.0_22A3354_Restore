@implementation _SFBrowsingAssistantSwitchCell

- (_SFBrowsingAssistantSwitchCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  _SFBrowsingAssistantSwitchCell *result;

  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____SFBrowsingAssistantSwitchCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____SFBrowsingAssistantSwitchCell_title);
  *v5 = 0;
  v5[1] = 0;
  v6 = OBJC_IVAR____SFBrowsingAssistantSwitchCell_switch;
  v7 = objc_allocWithZone(MEMORY[0x1E0DC3D18]);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_SFBrowsingAssistantSwitchCell *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (_SFBrowsingAssistantSwitchCell)initWithFrame:(CGRect)a3
{
  return (_SFBrowsingAssistantSwitchCell *)sub_18B9301BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _SFBrowsingAssistantSwitchCell *v8;
  uint64_t v9;

  v4 = sub_18BAC05EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC05E0();
  v8 = self;
  sub_18B9306BC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isOn
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____SFBrowsingAssistantSwitchCell_switch), sel_isOn);
}

- (void)setOn:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____SFBrowsingAssistantSwitchCell_switch), sel_setOn_, a3);
}

- (void).cxx_destruct
{
  sub_18B913BBC((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantSwitchCell_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantSwitchCell_switch));
}

@end
