@implementation CPBiomeSessionDonator

- (CPBiomeSessionDonator)initWithDataSource:(id)a3 parentQueue:(id)a4
{
  swift_unknownObjectRetain();
  return (CPBiomeSessionDonator *)BiomeSessionDonator.init(dataSource:parentQueue:)(a3, a4);
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v6;
  CPBiomeSessionDonator *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  specialized BiomeSessionDonator.conversationManager(_:conversationChanged:)(v6);
  swift_unknownObjectRelease();

}

- (CPBiomeSessionDonator)init
{
  CPBiomeSessionDonator *result;

  result = (CPBiomeSessionDonator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  _sxRi_zRi0_zlyytIseghHr_SgWOe(*(uint64_t *)((char *)&self->super.isa
                                           + OBJC_IVAR___CPBiomeSessionDonator_biomeStreamSender));
}

@end
