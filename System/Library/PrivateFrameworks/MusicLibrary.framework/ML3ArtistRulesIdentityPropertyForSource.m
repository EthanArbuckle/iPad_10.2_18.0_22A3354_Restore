@implementation ML3ArtistRulesIdentityPropertyForSource

void __ML3ArtistRulesIdentityPropertyForSource_block_invoke()
{
  void *v0;

  v0 = (void *)ML3ArtistRulesIdentityPropertyForSource_values[0];
  ML3ArtistRulesIdentityPropertyForSource_values[0] = (uint64_t)CFSTR("item_artist.item_artist_pid");

  objc_storeStrong(qword_1ED077760, CFSTR("sync_id"));
  objc_storeStrong(&qword_1ED077760[1], CFSTR("store_id"));
  objc_storeStrong(&qword_1ED077760[2], CFSTR("sync_id"));
  objc_storeStrong(&qword_1ED077760[3], CFSTR("store_id"));
  objc_storeStrong(&qword_1ED077760[4], CFSTR("store_id"));
  objc_storeStrong(&qword_1ED077760[5], CFSTR("store_id"));
}

@end
