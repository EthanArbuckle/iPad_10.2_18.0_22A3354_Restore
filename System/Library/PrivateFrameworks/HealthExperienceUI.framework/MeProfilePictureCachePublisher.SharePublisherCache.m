@implementation MeProfilePictureCachePublisher.SharePublisherCache

- (void)didReceiveMemoryWarning:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_1A9A91A74();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A91A38();
  swift_retain();
  sub_1A9A92314();
  swift_beginAccess();
  *(_QWORD *)self->sharePublisherForRenderConfiguration = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  sub_1A9A92320();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
