@implementation ML3TrackRulesRemovalSourceIdentityPropertyForSource

void __ML3TrackRulesRemovalSourceIdentityPropertyForSource_block_invoke()
{
  void *v0;

  v0 = (void *)ML3TrackRulesRemovalSourceIdentityPropertyForSource_values[0];
  ML3TrackRulesRemovalSourceIdentityPropertyForSource_values[0] = (uint64_t)CFSTR("item_store.item_pid");

  objc_storeStrong(qword_1EEC7CBB0, CFSTR("item_store.sync_id"));
  objc_storeStrong(&qword_1EEC7CBB0[1], CFSTR("item_store.store_saga_id"));
  objc_storeStrong(&qword_1EEC7CBB0[2], CFSTR("item_store.sync_id"));
  objc_storeStrong(&qword_1EEC7CBB0[3], CFSTR("item_store.purchase_history_id"));
  objc_storeStrong(&qword_1EEC7CBB0[4], CFSTR("item_store.is_ota_purchased"));
  objc_storeStrong(&qword_1EEC7CBB0[5], CFSTR("item_store.is_subscription"));
}

@end
