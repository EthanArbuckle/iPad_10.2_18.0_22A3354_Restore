@implementation RGBLivenessClassifierManager

- (void)stitchDetectedWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = sub_213A13C40();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213A13C28();
  swift_retain();
  sub_2139F49C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end
