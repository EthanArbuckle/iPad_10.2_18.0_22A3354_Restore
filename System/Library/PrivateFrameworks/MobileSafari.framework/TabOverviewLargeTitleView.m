@implementation TabOverviewLargeTitleView

- (_TtC12MobileSafari25TabOverviewLargeTitleView)init
{
  return -[TabOverviewLargeTitleView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 320.0, 44.0);
}

- (_TtC12MobileSafari25TabOverviewLargeTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari25TabOverviewLargeTitleView *)sub_18B89784C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari25TabOverviewLargeTitleView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari25TabOverviewLargeTitleView *)sub_18B897A34(a3);
}

- (void)shareButtonReceivedTap
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC12MobileSafari25TabOverviewLargeTitleView *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super._subviewCache
                                      + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_configuration);
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_shareButton);
  v4 = self;
  sub_18BABFBB4();
  v2(v3);

  swift_release();
}

- (void)cancelEditingButtonReceivedTap
{
  _TtC12MobileSafari25TabOverviewLargeTitleView *v2;

  v2 = self;
  sub_18B8988B0();

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC12MobileSafari25TabOverviewLargeTitleView *v5;

  v4 = a3;
  v5 = self;
  sub_18B89B96C();

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC12MobileSafari25TabOverviewLargeTitleView *v5;

  v4 = a3;
  v5 = self;
  sub_18B89A7B0(v4);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_configuration);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
  return 1;
}

- (BOOL)_textFieldShouldScrollToVisibleWhenBecomingFirstResponder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(void **)((char *)&self->super.super.super._responderFlags
                + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_configuration);
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_collaborationButtonWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_placeholderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_titleTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_titleTextFieldToTrailingButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari25TabOverviewLargeTitleView_cancelEditingButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
