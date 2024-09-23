@implementation OntologyShardStateObserver

- (void)ontologyStore:(id)a3 didStageEntry:(id)a4
{
  sub_1BC1DF568((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(id))sub_1BC1DF888);
}

- (void)ontologyStore:(id)a3 didImportEntry:(id)a4
{
  sub_1BC1DF568((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(id))sub_1BC1DFAC0);
}

- (void)ontologyStoreDidReconnect:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  _s19HealthMedicationsUI26OntologyShardStateObserverC13ontologyStore12didReconnectySo010HKOntologyI0C_tF_0();

  swift_release();
}

@end
