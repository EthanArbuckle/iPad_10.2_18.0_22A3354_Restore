@implementation _SFBrowsingAssistantListCell

- (_SFBrowsingAssistantListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18BA849B4();
}

- (_SFBrowsingAssistantListCell)initWithFrame:(CGRect)a3
{
  return (_SFBrowsingAssistantListCell *)sub_18BA8229C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _SFBrowsingAssistantListCell *v8;
  uint64_t v9;

  v4 = sub_18BAC05EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC05E0();
  v8 = self;
  sub_18BA825F0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_18B913BBC((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_overrideColor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18BA53C70((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell____lazy_storage___reorderAccessory);
  sub_18BA53C70((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell____lazy_storage___deleteAccessory);
  sub_18BA53C70((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell____lazy_storage___insertAccessory);
  sub_18BA53C70((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_badgeAccessory);
  swift_bridgeObjectRelease();
  sub_18BA53C70((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_statusAlertAccessory);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_dotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_menuButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_popUpMenu));
  sub_18BA53C70((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_iconAccessory);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_icon));
}

@end
