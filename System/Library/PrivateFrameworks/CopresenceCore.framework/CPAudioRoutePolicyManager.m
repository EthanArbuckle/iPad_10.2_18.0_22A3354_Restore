@implementation CPAudioRoutePolicyManager

+ (CPAudioRoutePolicyManager)sharedInstance
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return (CPAudioRoutePolicyManager *)(id)static CPAudioRoutePolicyManager.shared;
}

- (TURoute)pickedRoute
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPAudioRoutePolicyManager_pickedRoute);
  swift_beginAccess();
  return (TURoute *)*v2;
}

- (void)setPickedRoute:(id)a3
{
  id v5;
  CPAudioRoutePolicyManager *v6;

  v5 = a3;
  v6 = self;
  CPAudioRoutePolicyManager.pickedRoute.setter(a3);

}

- (BOOL)sharePlaySupported
{
  uint64_t (*v2)(void);
  CPAudioRoutePolicyManager *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x80);
  v3 = self;
  v4 = (void *)v2();
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(v4, sel_supportsSharePlay) & 1) != 0)
    {
      v6 = objc_msgSend(v5, sel_isCarKitRoute);

      return v6 ^ 1;
    }
    else
    {

      return 0;
    }
  }
  else
  {

    return 1;
  }
}

- (CPAudioRoutePolicyManager)init
{
  return (CPAudioRoutePolicyManager *)CPAudioRoutePolicyManager.init()();
}

- (void)switchToSpeakerRouteIfNecessary
{
  CPAudioRoutePolicyManager *v2;

  v2 = self;
  CPAudioRoutePolicyManager.switchToSpeakerRouteIfNecessary()();

}

- (void)addObserver:(id)a3 withQueue:(id)a4
{
  uint64_t (*v7)(void);
  id v8;
  CPAudioRoutePolicyManager *v9;
  uint64_t v10;

  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = v7();
  (*(void (**)(id, id))(*(_QWORD *)v10 + 160))(a3, v8);
  swift_unknownObjectRelease();

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();

}

- (void)routesChangedForRouteController:(id)a3
{
  id v4;
  id v5;
  CPAudioRoutePolicyManager *v6;

  v4 = a3;
  v6 = self;
  v5 = objc_msgSend(v4, sel_pickedRoute);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v6->super.isa) + 0x88))(v5);

}

@end
