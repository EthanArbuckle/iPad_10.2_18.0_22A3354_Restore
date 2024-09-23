@implementation NSString

void __79__NSString_MKAdditions___mapkit_localizedDistanceStringWithMeters_abbreviated___block_invoke()
{
  MKDistanceFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(MKDistanceFormatter);
  v1 = (void *)qword_1ECE2DA98;
  qword_1ECE2DA98 = (uint64_t)v0;

}

uint64_t __76__NSString_MKAdditions___mapkit_voiceOverLocalizedDistanceStringWithMeters___block_invoke()
{
  MKDistanceFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(MKDistanceFormatter);
  v1 = (void *)qword_1ECE2DAA8;
  qword_1ECE2DAA8 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECE2DAA8, "setUnitStyle:", 2);
}

@end
