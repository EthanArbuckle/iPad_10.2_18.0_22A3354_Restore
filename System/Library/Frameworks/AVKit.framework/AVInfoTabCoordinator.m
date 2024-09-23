@implementation AVInfoTabCoordinator

- (UIViewController)infoTabViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController));
}

- (void)setInfoTabViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AVInfoTabCoordinator_infoTabViewController) = (Class)a3;
  v3 = a3;

}

- (AVPlayerItem)playerItem
{
  return (AVPlayerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___AVInfoTabCoordinator_playerItem));
}

- (void)setPlayerItem:(id)a3
{
  AVInfoTabCoordinator *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AC4FC630(a3);

}

- (NSArray)actions
{
  void *v2;

  sub_1AC4FC5F4();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AC5DD738();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActions:(id)a3
{
  uint64_t v4;
  AVInfoTabCoordinator *v5;

  sub_1AC4FC5F4();
  v4 = sub_1AC5DD744();
  v5 = self;
  sub_1AC4FC314(v4);

}

- (AVInfoTabCoordinator)initWithPlayerItem:(id)a3 actions:(id)a4
{
  uint64_t v5;

  sub_1AC4FC5F4();
  v5 = sub_1AC5DD744();
  return (AVInfoTabCoordinator *)sub_1AC4FC3EC(a3, v5);
}

- (AVInfoTabCoordinator)init
{
  AVInfoTabCoordinator *result;

  result = (AVInfoTabCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
