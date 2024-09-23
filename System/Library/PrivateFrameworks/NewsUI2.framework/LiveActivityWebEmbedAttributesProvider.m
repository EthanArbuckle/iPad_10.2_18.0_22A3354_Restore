@implementation LiveActivityWebEmbedAttributesProvider

- (BOOL)supportsLiveActivities
{
  _TtC7NewsUI238LiveActivityWebEmbedAttributesProvider *v3;
  char v4;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7NewsUI238LiveActivityWebEmbedAttributesProvider_liveActivityManager), *(_QWORD *)&self->liveActivityManager[OBJC_IVAR____TtC7NewsUI238LiveActivityWebEmbedAttributesProvider_liveActivityManager+ 16]);
  v3 = self;
  v4 = sub_1D6E1C46C();

  return v4 & 1;
}

- (_TtC7NewsUI238LiveActivityWebEmbedAttributesProvider)init
{
  _TtC7NewsUI238LiveActivityWebEmbedAttributesProvider *result;

  result = (_TtC7NewsUI238LiveActivityWebEmbedAttributesProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI238LiveActivityWebEmbedAttributesProvider_liveActivityManager);
}

@end
