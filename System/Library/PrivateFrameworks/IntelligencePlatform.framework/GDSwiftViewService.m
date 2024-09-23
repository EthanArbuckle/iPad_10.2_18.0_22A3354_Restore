@implementation GDSwiftViewService

- (id)visualIdentifierViewAndReturnError:(id *)a3
{
  return sub_1AE4F56E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.visualIdentifierView());
}

+ (GDSwiftViewService)clientService
{
  return (GDSwiftViewService *)static ViewService.clientService.getter();
}

- (GDSwiftViewService)init
{
  return (GDSwiftViewService *)ViewService.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

- (id)personViewAndReturnError:(id *)a3
{
  return sub_1AE4F56E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.personView());
}

- (id)donationViewAndReturnError:(id *)a3
{
  return sub_1AE4F56E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.donationView());
}

- (id)pageRankViewAndReturnError:(id *)a3
{
  return sub_1AE4F56E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.pageRankView());
}

- (id)gdFeatureViewAndReturnError:(id *)a3
{
  return sub_1AE4F56E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.gdFeatureView());
}

- (id)firstPartyLongTermTopicViewAndReturnError:(id *)a3
{
  return sub_1AE4F56E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.firstPartyLongTermTopicView());
}

- (id)firstPartyShortTermTopicViewAndReturnError:(id *)a3
{
  return sub_1AE4F56E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.firstPartyShortTermTopicView());
}

- (id)autonamingViewWithViewName:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GDSwiftViewService *v8;
  _QWORD *v9;

  v5 = sub_1AE925E3C();
  v7 = v6;
  v8 = self;
  v9 = ViewService.autonamingView(viewName:)(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (id)gdSwiftSubgraphViewContextWithName:(id)a3 tableName:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GDSwiftViewService *v12;
  _QWORD *v13;

  v6 = sub_1AE925E3C();
  v8 = v7;
  v9 = sub_1AE925E3C();
  v11 = v10;
  v12 = self;
  v13 = ViewService.gdSwiftSubgraphViewContext(name:tableName:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

@end
