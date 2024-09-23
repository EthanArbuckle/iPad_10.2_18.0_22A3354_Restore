@implementation MinimumTimeIntervalRadarRequestFilter

- (BOOL)shouldRequestRadarForDisplayReason:(id)a3
{
  _TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter *v3;
  BOOL v4;

  v3 = self;
  v4 = sub_1CD02DDE0();

  return v4;
}

- (void)radarRequestedForDisplayReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_1CD0419FC();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory);
  v8 = self;
  v7();
  v9 = (uint64_t)v8 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  v10 = *(_QWORD *)(v9 + 24);
  v11 = *(_QWORD *)(v9 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v6, v10, v11);
  swift_endAccess();

}

- (_TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter)init
{
  _TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter *result;

  result = (_TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage);
  swift_release();
}

@end
