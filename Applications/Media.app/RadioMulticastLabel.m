@implementation RadioMulticastLabel

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC5Media19RadioMulticastLabel)initWithCoder:(id)a3
{
  id v4;
  _TtC5Media19RadioMulticastLabel *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media19RadioMulticastLabel_forceDark) = 0;
  v4 = a3;

  result = (_TtC5Media19RadioMulticastLabel *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010007E630, "Media/RadioMulticastLabel.swift", 31, 2, 79, 0);
  __break(1u);
  return result;
}

- (_TtC5Media19RadioMulticastLabel)initWithFrame:(CGRect)a3
{
  _TtC5Media19RadioMulticastLabel *result;

  result = (_TtC5Media19RadioMulticastLabel *)_swift_stdlib_reportUnimplementedInitializer("Media.RadioMulticastLabel", 25, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->forceDark[OBJC_IVAR____TtC5Media19RadioMulticastLabel_multicast]);
}

@end
