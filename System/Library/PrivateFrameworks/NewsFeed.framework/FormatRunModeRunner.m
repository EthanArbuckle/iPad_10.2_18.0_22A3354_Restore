@implementation FormatRunModeRunner

- (void)debugClearRunModeCache
{
  uint64_t v3;

  swift_beginAccess();
  v3 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)self->seenOnce = MEMORY[0x1E0DEE9E8];
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)self->seenOnceOnScreen = v3;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)self->seenOnceSinceRefresh = v3;
  swift_release();
  swift_bridgeObjectRelease();
}

@end
