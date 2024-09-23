@implementation AUGenericViewClumpTitleSupplementalView

- (_TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView *v10;
  _TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView_label;
  v9 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for AUGenericViewClumpTitleSupplementalView();
  v11 = -[AUGenericViewClumpTitleSupplementalView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_213163F80();

  return v11;
}

- (_TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView *result;

  v5 = OBJC_IVAR____TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView_label;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView *)sub_2131E1DF4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit39AUGenericViewClumpTitleSupplementalView_label));
}

@end
