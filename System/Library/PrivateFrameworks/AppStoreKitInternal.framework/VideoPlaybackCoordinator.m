@implementation VideoPlaybackCoordinator

- (void)didChangeAutoPlayVideoSetting:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal24VideoPlaybackCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1D8379EB0(v4);

}

- (void)didEnterBackground
{
  _TtC19AppStoreKitInternal24VideoPlaybackCoordinator *v2;
  void *v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC19AppStoreKitInternal24VideoPlaybackCoordinator *v7;
  _TtC19AppStoreKitInternal24VideoPlaybackCoordinator *v8;

  v2 = self;
  sub_1D846EC8C();
  sub_1D846EFBC();
  v3 = *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator__activeVideo);
  if (v3)
  {
    v4 = *(_QWORD *)&v2->visibilityTracker[OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator__activeVideo];
    ObjectType = swift_getObjectType();
    v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 96);
    v8 = v3;
    if ((v6(ObjectType, v4) & 1) != 0)
      (*(void (**)(uint64_t, uint64_t))(v4 + 152))(ObjectType, v4);

    v7 = v8;
  }
  else
  {
    v7 = v2;
  }

}

- (void)willEnterForeground
{
  _TtC19AppStoreKitInternal24VideoPlaybackCoordinator *v2;

  v2 = self;
  sub_1D847132C();

}

- (_TtC19AppStoreKitInternal24VideoPlaybackCoordinator)init
{
  _TtC19AppStoreKitInternal24VideoPlaybackCoordinator *result;

  result = (_TtC19AppStoreKitInternal24VideoPlaybackCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator_metricsPipeline;
  v4 = sub_1D8929C2C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator__activeVideo));
}

@end
