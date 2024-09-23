@implementation _HandlerBox

- (void)invoke:(BOOL)a3 :(void *)a4
{
  _BOOL8 v4;
  void (*v5)(_BOOL8);
  _TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox *v6;

  v4 = a3;
  v5 = *(void (**)(_BOOL8))((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox_handler);
  v6 = self;
  swift_retain();
  v5(v4);

  swift_release();
}

- (_TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox)init
{
  _TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox *result;

  result = (_TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
