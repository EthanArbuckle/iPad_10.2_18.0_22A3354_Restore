@implementation CircleIconView

- (void)layoutSubviews
{
  _TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView *v2;

  v2 = self;
  sub_1B8F16C10();

}

- (_TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView *result;

  v5 = OBJC_IVAR____TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView_iconView;
  v6 = objc_allocWithZone(MEMORY[0x1E0D33720]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

- (_TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView)initWithFrame:(CGRect)a3
{
  _TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView *result;

  result = (_TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUIP33_D96FE4879830C8E6988A7635203F311B14CircleIconView_backgroundView));
}

@end
