@implementation LocationDetectionManagerObserverProxy

- (void)locationDetectionManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = MEMORY[0x1BCCE5D40](self->delegate, a2);
  if (v6)
  {
    v7 = (void *)v6;
    swift_unknownObjectRetain();
    swift_retain();
    objc_msgSend(v7, sel_locationDetectionManager_didChangeAuthorizationStatus_, a3, v4);
    swift_unknownObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end
