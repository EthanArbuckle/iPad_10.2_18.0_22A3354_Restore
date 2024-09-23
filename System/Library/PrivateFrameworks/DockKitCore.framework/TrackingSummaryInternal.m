@implementation TrackingSummaryInternal

- (NSDate)time
{
  return (NSDate *)sub_23A6871BC((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &OBJC_IVAR____TtC11DockKitCore23TrackingSummaryInternal_time, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE5D8]);
}

- (void)setTime:(id)a3
{
  sub_23A6872D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], (void (*)(uint64_t))MEMORY[0x24BDCE878], &OBJC_IVAR____TtC11DockKitCore23TrackingSummaryInternal_time);
}

+ (id)decodeWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = a3;
  v4 = sub_23A690624();
  v6 = v5;

  swift_getObjCClassMetadata();
  v7 = (void *)static TrackingSummaryInternal.decode(data:)();
  sub_23A5CA254(v4, v6);
  return v7;
}

- (id)encode
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;

  swift_retain();
  v2 = sub_23A687A44();
  v4 = v3;
  swift_release();
  if (v4 >> 60 == 15)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)sub_23A690618();
    sub_23A608C74(v2, v4);
  }
  return v5;
}

- (NSString)description
{
  void *v2;

  swift_retain();
  sub_23A687C60();
  swift_release();
  v2 = (void *)sub_23A690E04();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end
