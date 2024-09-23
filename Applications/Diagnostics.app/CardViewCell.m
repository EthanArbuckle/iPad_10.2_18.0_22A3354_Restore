@implementation CardViewCell

- (_TtC11Diagnostics13CardStackView)stackView
{
  return (_TtC11Diagnostics13CardStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView));
}

- (void)dealloc
{
  _TtC11Diagnostics12CardViewCell *v2;
  objc_super v3;

  v2 = self;
  sub_100079EF4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CardViewCell();
  -[CardViewCell dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC11Diagnostics12CardViewCell_deviceStateNotificationToken));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardStateNotificationToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackViewContainer));
  sub_100036FA0((uint64_t)self + OBJC_IVAR____TtC11Diagnostics12CardViewCell_controller, (uint64_t *)&unk_10016D850);
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics12CardViewCell_layoutUpdateHandler), *(_QWORD *)&self->spacing[OBJC_IVAR____TtC11Diagnostics12CardViewCell_layoutUpdateHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC11Diagnostics12CardViewCell_cardState));
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v2;
  _TtC11Diagnostics12CardViewCell *v3;
  id v4;
  id v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackViewContainer);
  v3 = self;
  v4 = objc_msgSend(v2, "layer");
  v5 = objc_msgSend((id)objc_opt_self(UIColor), "opaqueSeparatorColor");
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v4, "setBorderColor:", v6);
}

- (void)layoutSubviews
{
  _TtC11Diagnostics12CardViewCell *v2;

  v2 = self;
  sub_10007A5A4();

}

- (_TtC11Diagnostics12CardViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DARootViewController *v5;
  DARootViewController *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC11Diagnostics12CardViewCell *)sub_10007A79C(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics12CardViewCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics12CardViewCell *)sub_10007A940(a3);
}

@end
