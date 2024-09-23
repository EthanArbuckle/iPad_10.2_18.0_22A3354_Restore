@implementation PasteboardEventObserver

- (void)invalidateEnabledState
{
  uint64_t v2;
  Swift::OpaquePointer_optional v3;

  v2 = *(_QWORD *)self->pasteHelper;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v3.value._rawValue = 0;
  v3.is_nil = v2;
  PasteHelper.canPaste(_:)(v3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.setter();
}

@end
