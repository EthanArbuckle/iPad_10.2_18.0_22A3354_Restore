@implementation WidgetLocalNewsChannelService

- (void)fetchWidgetLocalNewsChannelIDWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7NewsUI229WidgetLocalNewsChannelService *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  sub_1D5EFD76C();
  v6 = self;
  sub_1D6E1AE1C();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1D6D4D5B8;
  *(_QWORD *)(v7 + 24) = v5;
  swift_retain();
  v8 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC24();
  swift_release();
  swift_release();

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1D6D4D5B8;
  *(_QWORD *)(v9 + 24) = v5;
  swift_retain();
  v10 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC60();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

}

- (_TtC7NewsUI229WidgetLocalNewsChannelService)init
{
  _TtC7NewsUI229WidgetLocalNewsChannelService *result;

  result = (_TtC7NewsUI229WidgetLocalNewsChannelService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229WidgetLocalNewsChannelService_localNewsChannelService);
}

@end
