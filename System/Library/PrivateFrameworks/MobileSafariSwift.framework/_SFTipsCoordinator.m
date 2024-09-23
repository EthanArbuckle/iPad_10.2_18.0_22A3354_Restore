@implementation _SFTipsCoordinator

- (void)setObserver:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_SFTipsCoordinator)init
{
  return (_SFTipsCoordinator *)SFTipsCoordinator.init()();
}

- (void)startObserving
{
  _SFTipsCoordinator *v2;

  v2 = self;
  _s17MobileSafariSwift17SFTipsCoordinatorC14startObservingyyF_0();

}

- (BOOL)webSearchTipAvailable
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable;
  swift_beginAccess();
  return *v2;
}

- (void)setWebSearchTipAvailable:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable;
  swift_beginAccess();
  *v4 = a3;
}

- (_SFTipsObserver)observer
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____SFTipsCoordinator_observer;
  swift_beginAccess();
  return (_SFTipsObserver *)(id)MEMORY[0x1D82A28F4](v2);
}

- (void).cxx_destruct
{
  sub_1D7FB49C0((uint64_t)self + OBJC_IVAR____SFTipsCoordinator_observer);
  swift_release();
}

+ (uint64_t)configureTipsCenter
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  v0 = sub_1D7FB6E5C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1D7FB6E80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A4A0);
  sub_1D7FB6E98();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D7FB7AF0;
  sub_1D7FB6E74();
  sub_1D7FB6E8C();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  sub_1D7FB6E50();
  sub_1D7FB6E68();
  (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v3, v0);
  sub_1D7FB6EEC();
  return swift_bridgeObjectRelease();
}

- (UIViewController)webSearchTipViewController
{
  return (UIViewController *)sub_1D7FB5110(self, (uint64_t)a2, (uint64_t (*)(void))sub_1D7FB4F24);
}

- (UIView)webSearchTipView
{
  return (UIView *)sub_1D7FB5110(self, (uint64_t)a2, (uint64_t (*)(void))sub_1D7FB4FC8);
}

- (void)invalidateWebSearchTip
{
  _SFTipsCoordinator *v2;

  v2 = self;
  SFTipsCoordinator.invalidateWebSearchTip()();

}

@end
