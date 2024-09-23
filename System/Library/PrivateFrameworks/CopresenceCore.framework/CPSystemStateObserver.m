@implementation CPSystemStateObserver

- (BOOL)allowSharePlay
{
  return @objc CPSystemStateObserver.allowSharePlay.getter((char *)self, (uint64_t)a2, CPSystemStateObserver._allowSharePlay.getter);
}

- (BOOL)allowScreenSharing
{
  return @objc CPSystemStateObserver.allowSharePlay.getter((char *)self, (uint64_t)a2, CPSystemStateObserver._allowScreenSharing.getter);
}

- (BOOL)allowScreenSharingInitiation
{
  return @objc CPSystemStateObserver.allowSharePlay.getter((char *)self, (uint64_t)a2, CPSystemStateObserver._allowScreenSharingInitiation.getter);
}

- (CPSystemStateObserver)initWithQueue:(id)a3
{
  return (CPSystemStateObserver *)CPSystemStateObserver.init(queue:)(a3);
}

- (void)addObserver:(id)a3 withQueue:(id)a4
{
  uint64_t (*v7)(void);
  id v8;
  CPSystemStateObserver *v9;
  uint64_t v10;

  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0xE0);
  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = v7();
  (*(void (**)(id, id))(*(_QWORD *)v10 + 160))(a3, v8);
  swift_unknownObjectRelease();

  swift_release();
}

- (CPSystemStateObserver)init
{
  CPSystemStateObserver *result;

  result = (CPSystemStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  CPSystemStateObserver *v5;

  swift_unknownObjectRetain();
  v5 = self;
  specialized CPSystemStateObserver.audioPolicyManager(_:sharePlayAllowedStateChanged:)();
  swift_unknownObjectRelease();

}

- (void)conversationManager:(id)a3 screeningChangedForConversation:(id)a4
{
  id v6;
  id v7;
  CPSystemStateObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized CPSystemStateObserver.conversationManager(_:screeningChangedFor:)(v7);

}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6;
  id v7;
  CPSystemStateObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized CPSystemStateObserver.conversationManager(_:stateChangedFor:)(v7);

}

@end
