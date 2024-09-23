@implementation GDVUGallery

- (int64_t)version
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.version.getter();
  v4 = v3;

  return v4;
}

- (BOOL)ready
{
  GDVUGallery *v2;
  char v3;

  v2 = self;
  v3 = GDVUGallery.ready.getter();

  return v3 & 1;
}

- (int64_t)faceprintRevision
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.faceprintRevision.getter();
  v4 = v3;

  return v4;
}

- (int64_t)torsoprintRevision
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.torsoprintRevision.getter();
  v4 = v3;

  return v4;
}

- (int64_t)animalprintRevision
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.animalprintRevision.getter();
  v4 = v3;

  return v4;
}

- (int64_t)observationsCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.observationsCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)primaryCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.primaryCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)secondaryCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.secondaryCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)personObservationsCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.personObservationsCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)animalObservationsCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.animalObservationsCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)tagsCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.tagsCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)entityCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.entityCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)personEntitiesCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.personEntitiesCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)animalEntitiesCount
{
  GDVUGallery *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  GDVUGallery.animalEntitiesCount.getter();
  v4 = v3;

  return v4;
}

- (NSDictionary)observationsCountPerEntity
{
  GDVUGallery *v2;
  void *v3;

  v2 = self;
  GDVUGallery.observationsCountPerEntity.getter();

  sub_1AE524254(0, &qword_1EED94D28);
  sub_1AE524254(0, (unint64_t *)&qword_1ED318F50);
  sub_1AE8DBCEC();
  v3 = (void *)sub_1AE925C44();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSArray)assets
{
  return (NSArray *)sub_1AE8D8978(self, (uint64_t)a2, GDVUGallery.assets.getter);
}

- (NSSet)unassignedObservations
{
  GDVUGallery *v2;
  void *v3;

  v2 = self;
  GDVUGallery.unassignedObservations.getter();

  v3 = (void *)sub_1AE9263DC();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (BOOL)mutateAndReturnError:(id *)a3 handler:(id)a4
{
  GDVUGallery *v5;
  void *v7;

  v7 = _Block_copy(a4);
  v5 = self;
  GDVUGallery.mutate(handler:)();

  _Block_release(v7);
  return 1;
}

- (id)clustersFor:(id)a3
{
  id v4;
  GDVUGallery *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  GDVUGallery.clusters(for:)();

  sub_1AE501548(&qword_1EED94978);
  v6 = (void *)sub_1AE925C44();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)updateSocialGroupsWithSocialGroups:(id)a3
{
  uint64_t v4;
  GDVUGallery *v5;

  type metadata accessor for GDVUSocialGroup((uint64_t)self);
  v4 = sub_1AE9261CC();
  v5 = self;
  GDVUGallery.updateSocialGroups(with:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (BOOL)resetAndReturnError:(id *)a3
{
  return sub_1AE8DA060(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))GDVUGallery.reset());
}

- (BOOL)resetWithType:(int64_t)a3 error:(id *)a4
{
  return sub_1AE8D9934(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))GDVUGallery.reset(with:));
}

- (BOOL)updateAndReturnError:(id *)a3 progressHandler:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  GDVUGallery *v9;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_1AE8DBCC4;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  GDVUGallery.update(progressHandler:)((uint64_t)v8, v7);

  sub_1AE6263E0((uint64_t)v8);
  return 1;
}

- (void)updateInferredDeviceOwner
{
  GDVUGallery *v2;

  v2 = self;
  GDVUGallery.updateInferredDeviceOwner()();

}

- (id)keyObservationsFor:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5
{
  GDVUGallery *v6;
  void *v7;

  v6 = self;
  GDVUGallery.keyObservations(for:limit:offset:)(a3);

  sub_1AE501548(&qword_1EED9A490);
  v7 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)reportMetrics
{
  GDVUGallery *v2;

  v2 = self;
  GDVUGallery.reportMetrics()();

}

- (GDVUGallery)init
{
  GDVUGallery.init()();
}

- (void).cxx_destruct
{
  sub_1AE501338();
}

@end
