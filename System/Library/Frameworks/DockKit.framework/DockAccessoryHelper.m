@implementation DockAccessoryHelper

- (_TtC7DockKit19DockAccessoryHelper)init
{
  return (_TtC7DockKit19DockAccessoryHelper *)sub_233129F18();
}

- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC7DockKit19DockAccessoryHelper *v15;

  v11 = sub_233147C80();
  v12 = sub_233147C80();
  v13 = sub_233147C80();
  v14 = a3;
  v15 = self;
  sub_233140F90(a8, (uint64_t)v14, v11, v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)systemEventDataWithInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _TtC7DockKit19DockAccessoryHelper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23312A194((uint64_t)v6, v7);

}

- (void)batteryStateDataWithInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _TtC7DockKit19DockAccessoryHelper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23312A2B4((uint64_t)v6, v7);

}

- (void)trackingSummaryDataWithInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _TtC7DockKit19DockAccessoryHelper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23312A514();

}

- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  _TtC7DockKit19DockAccessoryHelper *v13;

  v8 = sub_233147BF0();
  v10 = v9;
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_233141100(v8, v10, v12);

  swift_bridgeObjectRelease();
}

- (void)disconnectedWithErr:(id)a3
{
  _TtC7DockKit19DockAccessoryHelper *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_23312A7EC((uint64_t)a3);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_233129614(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback));
  sub_233129614(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback));
  sub_233129614(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback));
  sub_233129614(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_logger;
  v4 = sub_233147BB4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
