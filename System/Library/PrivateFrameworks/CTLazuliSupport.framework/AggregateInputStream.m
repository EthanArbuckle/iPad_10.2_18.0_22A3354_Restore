@implementation AggregateInputStream

- (int64_t)read:(char *)a3 maxLength:(int64_t)a4
{
  _TtC15CTLazuliSupport20AggregateInputStream *v6;
  int64_t v7;

  v6 = self;
  v7 = sub_2376433FC((uint64_t)a3, a4);

  return v7;
}

- (BOOL)hasBytesAvailable
{
  return *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status) == (Class)2;
}

- (unint64_t)streamStatus
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status);
}

- (void)open
{
  _TtC15CTLazuliSupport20AggregateInputStream *v2;

  v2 = self;
  sub_237643DD0();

}

- (void)close
{
  _TtC15CTLazuliSupport20AggregateInputStream *v2;

  v2 = self;
  sub_237643FE4();

}

- (NSError)streamError
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)sub_23764A084();

  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (BOOL)getBuffer:(char *)a3 length:(int64_t *)a4
{
  return 0;
}

- (NSStreamDelegate)delegate
{
  return (NSStreamDelegate *)0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v5;
  _TtC15CTLazuliSupport20AggregateInputStream *v6;
  _OWORD v8[2];

  if (a3)
  {
    v5 = a4;
    v6 = self;
    swift_unknownObjectRetain();
    sub_23764A624();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_23764435C((uint64_t)v8);
  return 0;
}

- (_TtC15CTLazuliSupport20AggregateInputStream)initWithData:(id)a3
{
  id v3;
  _TtC15CTLazuliSupport20AggregateInputStream *result;

  v3 = a3;
  sub_23764A198();

  result = (_TtC15CTLazuliSupport20AggregateInputStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15CTLazuliSupport20AggregateInputStream)initWithURL:(id)a3
{
  uint64_t v3;
  _TtC15CTLazuliSupport20AggregateInputStream *result;

  v3 = sub_23764A120();
  MEMORY[0x24BDAC7A8](v3);
  sub_23764A0CC();
  result = (_TtC15CTLazuliSupport20AggregateInputStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError));
}

@end
