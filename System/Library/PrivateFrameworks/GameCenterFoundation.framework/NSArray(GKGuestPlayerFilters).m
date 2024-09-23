@implementation NSArray(GKGuestPlayerFilters)

- (uint64_t)_gkNonGuestPlayersFromPlayers
{
  return objc_msgSend(a1, "_gkFilterWithBlock:", &__block_literal_global_358);
}

- (uint64_t)_gkGuestPlayersFromPlayers
{
  return objc_msgSend(a1, "_gkFilterWithBlock:", &__block_literal_global_359);
}

@end
