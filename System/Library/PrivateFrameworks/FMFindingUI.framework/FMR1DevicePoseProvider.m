@implementation FMR1DevicePoseProvider

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC11FMFindingUI22FMR1DevicePoseProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A9C4504((uint64_t)v6, (uint64_t)v7);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC11FMFindingUI22FMR1DevicePoseProvider *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_23A9C4804(v8);

}

- (_TtC11FMFindingUI22FMR1DevicePoseProvider)initWithARSession:(id)a3
{
  objc_super v6;

  *(PRDevicePoseProviderDelegate **)((char *)&self->super.super._delegate
                                   + OBJC_IVAR____TtC11FMFindingUI22FMR1DevicePoseProvider_frameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMR1DevicePoseProvider();
  return -[PRVIODevicePoseProvider initWithARSession:](&v6, sel_initWithARSession_, a3);
}

- (_TtC11FMFindingUI22FMR1DevicePoseProvider)init
{
  objc_super v4;

  *(PRDevicePoseProviderDelegate **)((char *)&self->super.super._delegate
                                   + OBJC_IVAR____TtC11FMFindingUI22FMR1DevicePoseProvider_frameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMR1DevicePoseProvider();
  return -[FMR1DevicePoseProvider init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI22FMR1DevicePoseProvider_frameDelegate);
}

@end
