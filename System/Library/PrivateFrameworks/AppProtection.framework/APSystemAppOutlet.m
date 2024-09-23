@implementation APSystemAppOutlet

- (void)noteSceneWillBecomeForegroundVisibleForApplication:(id)a3
{
  id v4;
  APSystemAppOutlet *v5;

  v4 = a3;
  v5 = self;
  sub_236261F80(v4);

}

- (APSystemAppOutlet)initWithSystemAppInterface:(id)a3
{
  APSystemAppOutlet *v4;

  swift_unknownObjectRetain();
  v4 = (APSystemAppOutlet *)sub_236264404((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (BOOL)shouldShieldLaunchOfApplication:(id)a3
{
  return objc_msgSend(a3, sel_isEffectivelyLocked);
}

- (void)noteAllScenesDismissedForApplication:(id)a3
{
  id v4;
  APSystemAppOutlet *v5;

  v4 = a3;
  v5 = self;
  sub_23626176C(v4);

}

- (void)resume
{
  APSystemAppOutlet *v2;

  v2 = self;
  sub_236262880();

}

- (void)invalidate
{
  APSystemAppOutlet *v2;

  v2 = self;
  sub_236262B48();

}

- (APSystemAppOutlet)init
{
  APSystemAppOutlet *result;

  result = (APSystemAppOutlet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

- (void)addShield:(id)a3
{
  sub_2362632B4(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *, uint64_t, uint64_t, void *))sub_236262EB0);
}

- (void)removeShield:(id)a3
{
  sub_2362632B4(self, (uint64_t)a2, a3, (void (*)(os_unfair_lock_s *, uint64_t, uint64_t, void *))sub_236263130);
}

@end
