@implementation SRCarPlayCardViewController

- (void)viewDidLoad
{
  _TtC4Siri27SRCarPlayCardViewController *v2;

  v2 = self;
  sub_100074D7C();

}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC4Siri27SRCarPlayCardViewController *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  void (*v12)(_TtC4Siri27SRCarPlayCardViewController *, uint64_t, uint64_t);

  v4 = qword_10014ECE0;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_10014ECE0, sub_100098388);
  v7 = type metadata accessor for Logger(0);
  sub_1000760E8(v7, (uint64_t)qword_100150068);
  v8 = static os_log_type_t.info.getter();
  sub_10009973C(v8, 0x10uLL, 0xD000000000000017, 0x80000001000DE920, 0xD000000000000036, 0x80000001000DE940);
  v9 = *(uint64_t *)((char *)&v6->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate);
  v10 = *(_QWORD *)&v6->super.isRightHandDrive[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate];
  ObjectType = swift_getObjectType(v9);
  v12 = *(void (**)(_TtC4Siri27SRCarPlayCardViewController *, uint64_t, uint64_t))(v10 + 24);
  swift_unknownObjectRetain(v9);
  v12(v6, ObjectType, v10);

  swift_unknownObjectRelease(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardSnippet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardViewController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_widthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_heightConstraint));
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  double height;
  double width;
  id v8;
  _TtC4Siri27SRCarPlayCardViewController *v9;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = self;
  sub_100075EB0(width, height);

}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v5;
  _TtC4Siri27SRCarPlayCardViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100075248(a3);

  return 0;
}

@end
