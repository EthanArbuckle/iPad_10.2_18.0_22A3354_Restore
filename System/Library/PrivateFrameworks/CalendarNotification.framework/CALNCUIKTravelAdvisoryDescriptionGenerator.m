@implementation CALNCUIKTravelAdvisoryDescriptionGenerator

+ (CALNCUIKTravelAdvisoryDescriptionGenerator)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CALNCUIKTravelAdvisoryDescriptionGenerator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_14 != -1)
    dispatch_once(&sharedInstance_onceToken_14, block);
  return (CALNCUIKTravelAdvisoryDescriptionGenerator *)(id)sharedInstance_sharedInstance_11;
}

void __60__CALNCUIKTravelAdvisoryDescriptionGenerator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_11;
  sharedInstance_sharedInstance_11 = (uint64_t)v1;

}

- (id)travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 location:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BE14860], "travelAdvisoryDescriptionOfType:hypothesis:location:", a3, a4, a5);
}

@end
