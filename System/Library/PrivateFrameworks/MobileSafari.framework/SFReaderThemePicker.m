@implementation SFReaderThemePicker

- (_TtC12MobileSafari19SFReaderThemePicker)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari19SFReaderThemePicker *)sub_18BA4FE40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari19SFReaderThemePicker)initWithCoder:(id)a3
{
  id v4;
  _TtC12MobileSafari19SFReaderThemePicker *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafari19SFReaderThemePicker__clientIsChangingSelection) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari19SFReaderThemePicker___selectedTheme) = 0;
  v4 = a3;
  sub_18BAC0214();

  result = (_TtC12MobileSafari19SFReaderThemePicker *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC12MobileSafari19SFReaderThemePicker___observationRegistrar;
  v3 = sub_18BAC0220();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
