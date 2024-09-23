@implementation KeyValueDomainPinnedContentUpdateNotifier

- (void)didUpdateKeyValueDomain:(id)a3
{
  id v4;

  sub_1BC7A67A4();
  sub_1BC6E1788((unint64_t *)&unk_1ED6B9DB0, (uint64_t (*)(uint64_t))sub_1BC7A67A4, MEMORY[0x1E0C95F40]);
  v4 = a3;
  swift_retain();
  sub_1BC817818();

  swift_release();
}

@end
