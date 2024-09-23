@implementation ConsentNoticeViewController

- (_TtC11Diagnostics27ConsentNoticeViewController)init
{
  return (_TtC11Diagnostics27ConsentNoticeViewController *)sub_100085CF4((uint64_t)self, (uint64_t)a2);
}

- (_TtC11Diagnostics27ConsentNoticeViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC11Diagnostics27ConsentNoticeViewController *)sub_100085FC8(v3, v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11Diagnostics27ConsentNoticeViewController *v4;

  v4 = self;
  sub_1000862B8(a3);

}

- (BOOL)hasSecondaryButton
{
  return 1;
}

- (void)primaryButtonPressed:(id)a3
{
  sub_100087C04((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_primaryAction);
}

- (void)secondaryButtonPressed:(id)a3
{
  sub_100087C04((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_secondaryAction);
}

- (void)cancelButtonPressed:(id)a3
{
  sub_100087C04((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_cancelAction);
}

- (_TtC11Diagnostics27ConsentNoticeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11Diagnostics27ConsentNoticeViewController *result;

  v4 = a4;
  result = (_TtC11Diagnostics27ConsentNoticeViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.ConsentNoticeViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SEL v9;
  id v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  SEL v16;
  id v17;
  int v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SEL v23;
  id v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;

  swift_bridgeObjectRelease(*(DARootViewController **)&self->fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_titleText], a2, v2, v3, v4, v5, v6, v7);
  swift_bridgeObjectRelease(*(DARootViewController **)&self->fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_bodyText], v9, v10, v11, v12, v13, v14, v15);
  swift_bridgeObjectRelease(*(DARootViewController **)&self->fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_primaryActionTitle], v16, v17, v18, v19, v20, v21, v22);
  swift_bridgeObjectRelease(*(DARootViewController **)&self->fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_secondaryActionTitle], v23, v24, v25, v26, v27, v28, v29);
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_primaryAction), *(_QWORD *)&self->fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_primaryAction]);
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_secondaryAction), *(_QWORD *)&self->fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_secondaryAction]);
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_cancelAction), *(_QWORD *)&self->fontSizeTitleRegular[OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_cancelAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_secondaryButton));
}

@end
