@implementation GEOTransitNearbySchedule

void __132___GEOTransitNearbySchedule_nearbyScheduleCategoriesFromSchedule_departureSequenceContainers_scheduledDepartureSequences_incidents___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

}

@end
