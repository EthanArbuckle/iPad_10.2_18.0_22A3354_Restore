@implementation CKTextEffectCoordinatorConfiguration

- (CKTextEffectCoordinatorConfiguration)initWithLogIdentifier:(id)a3 timeAfterLastAnimationInSeconds:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  CKTextEffectCoordinatorConfiguration *result;

  v5 = sub_18E768984();
  CKTextEffectCoordinator.Configuration.init(logIdentifier:timeAfterLastAnimationInSeconds:)(v5, v6, a4);
  return result;
}

- (CKTextEffectCoordinatorConfiguration)initWithLogIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CKTextEffectCoordinatorConfiguration *v10;
  uint64_t v12;

  v3 = sub_18E76866C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_18E768984();
  v9 = v8;
  swift_getObjectType();
  *v6 = 5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF4A0], v3);
  v10 = (CKTextEffectCoordinatorConfiguration *)sub_18E620344(v7, v9, (uint64_t)v6, 1);
  swift_deallocPartialClassInstance();
  return v10;
}

- (CKTextEffectCoordinatorConfiguration)init
{
  CKTextEffectCoordinatorConfiguration *result;

  result = (CKTextEffectCoordinatorConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CKTextEffectCoordinatorConfiguration_loopDelayProvider);
}

@end
