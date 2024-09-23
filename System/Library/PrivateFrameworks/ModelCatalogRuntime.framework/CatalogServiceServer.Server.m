@implementation CatalogServiceServer.Server

- (void)requestResourcesWithRequestKey:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421A55E0);
}

- (void)releaseResourcesWithRequestKey:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421A5D80);
}

- (void)requestResourceWithIdentifier:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421A6664);
}

- (void)releaseResourceWithIdentifier:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421A7D4C);
}

- (void)resourceContainerWithIdentifier:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421A8948);
}

- (void)resourceBundleContainerWithIdentifier:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421A8E60);
}

- (void)resourceContainersWith:(id)a3
{
  sub_2421A9E48(self, (int)a2, a3, (void (*)(void))sub_2421A9378);
}

- (void)resourceBundleContainersWith:(id)a3
{
  sub_2421A9E48(self, (int)a2, a3, (void (*)(void))sub_2421A98E0);
}

- (void)sideloadWithResource:(id)a3 with:(id)a4
{
  sub_2421AA27C(self, (int)a2, a3, a4);
}

- (void)sideloadWithResourceBundle:(id)a3 with:(id)a4
{
  sub_2421AA27C(self, (int)a2, a3, a4);
}

- (void)removeSideloadWithResource:(id)a3 with:(id)a4
{
  sub_2421AA320(self, a2, a3, a4, "remove sideload resource: %s", MEMORY[0x24BE687D8]);
}

- (void)removeSideloadWithResourceBundle:(id)a3 with:(id)a4
{
  const char *v4;

  sub_2421AA320(self, a2, a3, a4, "remove sideload resource bundle: %s", v4);
}

- (void)resourceStatusWithIdentifier:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421AA6FC);
}

- (void)resourceInformationWithIdentifier:(id)a3 with:(id)a4
{
  sub_2421AC934(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2421AAB00);
}

- (void)isGenerativeExperiencesEssentialResourcesReadyWith:(id)a3
{
  sub_2421A9E48(self, (int)a2, a3, (void (*)(void))sub_2421AC9A8);
}

- (void)generativeExperiencesEssentialResourcesReadyWith:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtCC19ModelCatalogRuntime20CatalogServiceServer6Server *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  CatalogServiceServer.Server.generativeExperiencesEssentialResourcesReady(with:)((uint64_t)sub_242198E1C, v5);

  swift_release();
}

- (void)hasEnoughStorageForGenerativeExperiencesEssentialResourcesWith:(id)a3
{
  sub_2421A9E48(self, (int)a2, a3, (void (*)(void))sub_2421ACEF0);
}

- (_TtCC19ModelCatalogRuntime20CatalogServiceServer6Server)init
{
  CatalogServiceServer.Server.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL;
  v4 = sub_2421997A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
