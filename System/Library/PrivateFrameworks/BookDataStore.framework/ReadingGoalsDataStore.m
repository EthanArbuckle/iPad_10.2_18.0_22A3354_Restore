@implementation ReadingGoalsDataStore

- (void)handleCloudChangeNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = sub_227E5F048();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_227E5F030();
  swift_retain();
  sub_227E3C674();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end
