@implementation FeatureAvailabilityObserverProxy

- (void)sportsTopicNotificationsWithDidChange:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = MEMORY[0x1D82919D4](self->delegate, a2);
  if (v4)
  {
    v5 = (void *)v4;
    swift_retain();
    objc_msgSend(v5, sel_sportsTopicNotificationsWithDidChange_, v3);
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end
