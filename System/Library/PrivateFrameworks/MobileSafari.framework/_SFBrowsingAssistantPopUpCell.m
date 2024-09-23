@implementation _SFBrowsingAssistantPopUpCell

- (_SFBrowsingAssistantPopUpCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _SFBrowsingAssistantPopUpCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____SFBrowsingAssistantPopUpCell_title);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____SFBrowsingAssistantPopUpCell_subtitle);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____SFBrowsingAssistantPopUpCell_actions) = (Class)MEMORY[0x1E0DEE9D8];
  v6 = a3;

  result = (_SFBrowsingAssistantPopUpCell *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (_SFBrowsingAssistantPopUpCell)initWithFrame:(CGRect)a3
{
  return (_SFBrowsingAssistantPopUpCell *)sub_18BA52A8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _SFBrowsingAssistantPopUpCell *v8;
  uint64_t v9;

  v4 = sub_18BAC05EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC05E0();
  v8 = self;
  sub_18BA52CF4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)updateActions
{
  _SFBrowsingAssistantPopUpCell *v2;

  v2 = self;
  sub_18BA52F00();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
