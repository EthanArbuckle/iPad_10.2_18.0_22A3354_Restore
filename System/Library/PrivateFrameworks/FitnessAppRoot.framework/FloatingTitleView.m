@implementation FloatingTitleView

- (_TtC14FitnessAppRoot17FloatingTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC14FitnessAppRoot17FloatingTitleView *)sub_23BCB8EB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14FitnessAppRoot17FloatingTitleView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  objc_class *v8;
  _TtC14FitnessAppRoot17FloatingTitleView *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView;
  v6 = objc_allocWithZone((Class)type metadata accessor for FloatingTabView());
  v7 = a3;
  sub_23BCCA970(0, 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v8;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_leadingConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_trailingConstraint) = 0;

  result = (_TtC14FitnessAppRoot17FloatingTitleView *)sub_23BCD84AC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[FloatingTitleView layoutSubviews](&v3, sel_layoutSubviews);
  sub_23BCB95F0();

}

- (void).cxx_destruct
{
  sub_23BCB9988((uint64_t)self + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_leadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_trailingConstraint));
}

@end
