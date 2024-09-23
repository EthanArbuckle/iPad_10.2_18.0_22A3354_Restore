@implementation ML3TrackRulesIdentityPropertyForSource

void __ML3TrackRulesIdentityPropertyForSource_block_invoke()
{
  void *v0;

  v0 = (void *)ML3TrackRulesIdentityPropertyForSource_values[0];
  ML3TrackRulesIdentityPropertyForSource_values[0] = (uint64_t)CFSTR("item_store.item_pid");

  objc_storeStrong(qword_1EEC7C938, CFSTR("item_store.sync_id"));
  objc_storeStrong(&qword_1EEC7C938[1], CFSTR("item_store.store_saga_id"));
  objc_storeStrong(&qword_1EEC7C938[2], CFSTR("item_store.sync_id"));
  objc_storeStrong(&qword_1EEC7C938[3], CFSTR("item_store.purchase_history_id"));
  objc_storeStrong(&qword_1EEC7C938[4], CFSTR("item_store.store_item_id"));
  objc_storeStrong(&qword_1EEC7C938[5], CFSTR("item_store.subscription_store_item_id"));
}

@end
