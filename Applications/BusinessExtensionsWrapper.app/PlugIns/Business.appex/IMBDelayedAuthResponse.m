@implementation IMBDelayedAuthResponse

- (_TtC8Business22IMBDelayedAuthResponse)init
{
  _TtC8Business22IMBDelayedAuthResponse *result;

  result = (_TtC8Business22IMBDelayedAuthResponse *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBDelayedAuthResponse", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Business22IMBDelayedAuthResponse_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Business22IMBDelayedAuthResponse_messageBody));
}

@end
