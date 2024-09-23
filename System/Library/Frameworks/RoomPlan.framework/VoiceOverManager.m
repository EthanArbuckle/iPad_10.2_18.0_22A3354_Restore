@implementation VoiceOverManager

- (void)announcementFinished:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_22655BE40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22655BE34();
  self->isAnnouncingNewScanItems[0] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
