@implementation TSLocalDraftsDeviceManager

- (TSLocalDraftsDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___TSLocalDraftsDeviceManager_delegate;
  swift_beginAccess();
  return (TSLocalDraftsDelegate *)(id)MEMORY[0x1D82919D4](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (TSLocalDraftsDeviceManager)init
{
  return (TSLocalDraftsDeviceManager *)LocalDraftsDeviceManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR___TSLocalDraftsDeviceManager_delegate);
}

@end
