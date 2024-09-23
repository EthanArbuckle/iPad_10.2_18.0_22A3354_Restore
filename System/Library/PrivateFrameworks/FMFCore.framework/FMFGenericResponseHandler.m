@implementation FMFGenericResponseHandler

- (void)didUpdateFences:(id)a3
{
  uint64_t v4;
  _TtC7FMFCore25FMFGenericResponseHandler *v5;

  if (a3)
  {
    sub_211911824(0, &qword_254ACC2B8);
    sub_211961268();
    v4 = sub_211A47C40();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  FMFGenericResponseHandler.didUpdate(_:)(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  _TtC7FMFCore25FMFGenericResponseHandler *v2;

  v2 = self;
  FMFGenericResponseHandler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_211962AB8((uint64_t)self + OBJC_IVAR____TtC7FMFCore25FMFGenericResponseHandler_delegate);

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7FMFCore25FMFGenericResponseHandler_secureLocationsManager));
}

- (_TtC7FMFCore25FMFGenericResponseHandler)init
{
  _TtC7FMFCore25FMFGenericResponseHandler *result;

  result = (_TtC7FMFCore25FMFGenericResponseHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
