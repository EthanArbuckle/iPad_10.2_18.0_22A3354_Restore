@implementation Simulator

uint64_t __Simulator_SetPropertyData_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);

  if (ADS::Simulator::sHost)
  {
    v1 = *(unsigned int *)(result + 56);
    v2 = *(unsigned int *)(result + 60);
    v3 = *(_QWORD *)(result + 32);
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))ADS::Simulator::sHost;
    pthread_once(&ADS::Simulator::sStaticInitializer, (void (*)(void))ADS::Simulator::StaticInitializer);
    return v4(ADS::Simulator::sHost, v1, v2, v3);
  }
  return result;
}

@end
