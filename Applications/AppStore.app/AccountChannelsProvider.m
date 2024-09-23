@implementation AccountChannelsProvider

- (void)notifyObserver
{
  unsigned __int8 *updateObserver;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  _BYTE v8[24];

  updateObserver = self->updateObserver;
  swift_beginAccess(self->updateObserver, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(updateObserver);
  if (Strong)
  {
    v5 = Strong;
    v6 = *(_QWORD *)&self->updateObserver[8];
    ObjectType = swift_getObjectType();
    swift_retain(self);
    dispatch thunk of AccountChannelsProviderUpdateObserver.accountChannelsDidUpdate()(ObjectType, v6);
    swift_release(self);
    swift_unknownObjectRelease(v5);
  }
}

@end
