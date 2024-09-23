@implementation NSArray(GKPlayerCanonicalization)

- (uint64_t)_gkIncompletePlayersFromPlayerIDs
{
  return objc_msgSend(a1, "_gkMapWithBlock:", &__block_literal_global_322_0);
}

- (uint64_t)_gkPlayersIDsFromPlayers
{
  return objc_msgSend(a1, "_gkMapWithBlock:", &__block_literal_global_328);
}

- (uint64_t)_gkPlayersIDsFromInternals
{
  return objc_msgSend(a1, "_gkMapWithBlock:", &__block_literal_global_333);
}

- (uint64_t)_gkPlayersFromInternals
{
  return objc_msgSend(a1, "_gkMapWithBlock:", &__block_literal_global_338);
}

- (uint64_t)_gkInternalsFromPlayers
{
  return objc_msgSend(a1, "_gkFilterWithBlock:", &__block_literal_global_339);
}

- (uint64_t)_gkInternalsFromUncheckedPlayers
{
  return objc_msgSend(a1, "_gkMapWithBlock:", &__block_literal_global_341);
}

- (uint64_t)_gkValidatePlayersForReturnFromAPI
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:", &__block_literal_global_343);
}

@end
