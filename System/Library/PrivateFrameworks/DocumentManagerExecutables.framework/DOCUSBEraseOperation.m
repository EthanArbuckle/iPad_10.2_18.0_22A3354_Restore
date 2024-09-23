@implementation DOCUSBEraseOperation

- (int64_t)operationState
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_operationState);
  swift_beginAccess();
  return *v2;
}

- (void)setOperationState:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_operationState);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)description
{
  _TtC26DocumentManagerExecutables20DOCUSBEraseOperation *v2;
  void *v3;

  v2 = self;
  DOCUSBEraseOperation.description.getter();

  v3 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC26DocumentManagerExecutables20DOCUSBEraseOperation)init
{
  _TtC26DocumentManagerExecutables20DOCUSBEraseOperation *result;

  result = (_TtC26DocumentManagerExecutables20DOCUSBEraseOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_source));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_newFileSystem));
  swift_bridgeObjectRelease();
  sub_21EA5CA7C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_completionHandler));
}

@end
