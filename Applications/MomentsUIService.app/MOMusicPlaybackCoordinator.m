@implementation MOMusicPlaybackCoordinator

- (void)updateDelegateProgressIndication
{
  swift_retain(self);
  MOMusicPlaybackCoordinator.updateDelegateProgressIndication()();
  swift_release(self);
}

- (void)playbackStateDidChangeWithNote:(id)a3
{
  void (*v4)(uint64_t);
  id v5;
  uint64_t v6;

  v4 = *(void (**)(uint64_t))(*(_QWORD *)self->_TtCs12_SwiftObject_opaque + 280);
  v5 = a3;
  v6 = swift_retain(self);
  v4(v6);

  swift_release(self);
}

- (void)nowPlayingItemChangedWithNote:(id)a3
{
  void (*v4)(uint64_t);
  id v5;
  uint64_t v6;

  v4 = *(void (**)(uint64_t))(*(_QWORD *)self->_TtCs12_SwiftObject_opaque + 272);
  v5 = a3;
  v6 = swift_retain(self);
  v4(v6);

  swift_release(self);
}

@end
