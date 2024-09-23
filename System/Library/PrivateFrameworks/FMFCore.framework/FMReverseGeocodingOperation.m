@implementation FMReverseGeocodingOperation

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7FMFCore27FMReverseGeocodingOperation__isFinished);
}

- (void)setFinished:(BOOL)a3
{
  _TtC7FMFCore27FMReverseGeocodingOperation *v4;
  void *v5;
  id v6;

  v4 = self;
  v5 = (void *)sub_211A478EC();
  -[FMReverseGeocodingOperation willChangeValueForKey:](v4, sel_willChangeValueForKey_, v5);

  *((_BYTE *)&v4->super.super.isa + OBJC_IVAR____TtC7FMFCore27FMReverseGeocodingOperation__isFinished) = a3;
  v6 = (id)sub_211A478EC();
  -[FMReverseGeocodingOperation didChangeValueForKey:](v4, sel_didChangeValueForKey_, v6);

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _TtC7FMFCore27FMReverseGeocodingOperation *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  _TtC7FMFCore27FMReverseGeocodingOperation *v6;
  NSObject *oslog;

  v2 = self;
  if (-[FMReverseGeocodingOperation isCancelled](v2, sel_isCancelled))
  {
    if (qword_254AC7B88 != -1)
      swift_once();
    v3 = sub_211A47748();
    sub_21194F3E0(v3, (uint64_t)qword_254ADC800);
    oslog = sub_211A47724();
    v4 = sub_211A47D30();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21190D000, oslog, v4, "FMReverseGeocodingOperation: operation cancelled", v5, 2u);
      MEMORY[0x212BE48A0](v5, -1, -1);
    }

    v6 = (_TtC7FMFCore27FMReverseGeocodingOperation *)oslog;
  }
  else
  {
    v6 = v2;
  }

}

- (void)start
{
  _TtC7FMFCore27FMReverseGeocodingOperation *v2;

  v2 = self;
  sub_211977A80();

}

- (_TtC7FMFCore27FMReverseGeocodingOperation)init
{
  _TtC7FMFCore27FMReverseGeocodingOperation *result;

  result = (_TtC7FMFCore27FMReverseGeocodingOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_211978524((uint64_t)self + OBJC_IVAR____TtC7FMFCore27FMReverseGeocodingOperation_request);
  swift_release();
}

@end
