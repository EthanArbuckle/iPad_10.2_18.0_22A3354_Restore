@implementation AudioPlayerView.AudioPlayerViewModel

- (void)takeValuesViaNotification
{
  swift_retain();
  sub_1DD94DF2C();
  swift_release();
}

- (uint64_t)audioControllerTimeChanged:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1DD9D0538();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  swift_retain();
  sub_1DD94EF18();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

- (void)audioControllerStopped:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1DD9D0538();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  swift_retain();
  sub_1DD94F170();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
