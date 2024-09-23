@implementation FMIPItemImageCacheOperation

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8FMIPCore27FMIPItemImageCacheOperation__isFinished);
}

- (void)setFinished:(BOOL)a3
{
  _TtC8FMIPCore27FMIPItemImageCacheOperation *v4;
  void *v5;
  id v6;

  v4 = self;
  v5 = (void *)sub_1CCB63964();
  -[FMIPItemImageCacheOperation willChangeValueForKey:](v4, sel_willChangeValueForKey_, v5);

  *((_BYTE *)&v4->super.super.isa + OBJC_IVAR____TtC8FMIPCore27FMIPItemImageCacheOperation__isFinished) = a3;
  v6 = (id)sub_1CCB63964();
  -[FMIPItemImageCacheOperation didChangeValueForKey:](v4, sel_didChangeValueForKey_, v6);

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _TtC8FMIPCore27FMIPItemImageCacheOperation *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  _TtC8FMIPCore27FMIPItemImageCacheOperation *v6;
  NSObject *oslog;

  v2 = self;
  if (-[FMIPItemImageCacheOperation isCancelled](v2, sel_isCancelled))
  {
    if (qword_1ED8AA630 != -1)
      swift_once();
    v3 = sub_1CCB637FC();
    sub_1CCA16C20(v3, (uint64_t)qword_1ED8AD7F8);
    oslog = sub_1CCB637D8();
    v4 = sub_1CCB63D48();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CC9BF000, oslog, v4, "FMItemImageCreationOperation: operation cancelled", v5, 2u);
      MEMORY[0x1D17B214C](v5, -1, -1);
    }

    v6 = (_TtC8FMIPCore27FMIPItemImageCacheOperation *)oslog;
  }
  else
  {
    v6 = v2;
  }

}

- (void)start
{
  _TtC8FMIPCore27FMIPItemImageCacheOperation *v2;

  v2 = self;
  sub_1CCB34B9C();

}

- (_TtC8FMIPCore27FMIPItemImageCacheOperation)init
{
  _TtC8FMIPCore27FMIPItemImageCacheOperation *result;

  result = (_TtC8FMIPCore27FMIPItemImageCacheOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;

  v2 = *(NSOperationQueue **)((char *)&self->super._iop.__queue
                            + OBJC_IVAR____TtC8FMIPCore27FMIPItemImageCacheOperation_request);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end
