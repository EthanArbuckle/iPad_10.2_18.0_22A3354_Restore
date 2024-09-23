@implementation BradycardiaFeatureStatusAvailability

- (void)heartRhythmAvailabilityDidUpdate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_2312E9964(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v8 - v6;
  swift_retain();
  sub_23140FA38((uint64_t)v7);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_231306890((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_231413E4C();
  sub_2313068D4((uint64_t)v7);
  swift_release();
}

- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;

  sub_2312E9964(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v11 - v8;
  v10 = a3;
  swift_retain();
  sub_23140FA38((uint64_t)v9);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_231306890((uint64_t)v9, (uint64_t)v7);
  swift_retain();
  sub_231413E4C();
  sub_2313068D4((uint64_t)v9);

  swift_release();
}

@end
