@implementation CAFUIProminentAncestorObserver

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v6;
  _TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver *v7;

  if (MEMORY[0x23B813CDC]((char *)self+ OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_delegate, a2, a3, a4))
  {
    v6 = a3;
    v7 = self;
    CAFUITileDataSource.refreshProminentSection(reloadSection:)(1);

    swift_unknownObjectRelease();
  }
}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver *v6;

  v5 = a3;
  v6 = self;
  specialized CAFUIProminentAncestorObserver.automakerSettingService(_:didUpdateHidden:)();

}

- (_TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver)init
{
  objc_super v4;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_observedAncestors) = (Class)MEMORY[0x24BEE4B08];
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAFUIProminentAncestorObserver();
  return -[CAFUIProminentAncestorObserver init](&v4, sel_init);
}

- (void).cxx_destruct
{
  outlined destroy of weak CAFUIAutomakerSettingObserverDelegate?((uint64_t)self + OBJC_IVAR____TtC5CAFUIP33_0E4D121C5C9C3A69D68EDC06FF2740D730CAFUIProminentAncestorObserver_delegate);
  swift_bridgeObjectRelease();
}

@end
