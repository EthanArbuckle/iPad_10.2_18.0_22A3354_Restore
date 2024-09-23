@implementation ZN2re4ecs216NetworkComponent23bindComponentToSyncableEPKNS0

re *___ZN2re4ecs216NetworkComponent23bindComponentToSyncableEPKNS0_9ComponentE21RESyncableRefRetainer_block_invoke(re *result, id *a2)
{
  uint64_t v3;

  if (a2)
  {
    if ((a2 & 1) == 0)
    {
      v3 = re::globalAllocators(result)[2];
      objc_destroyWeak(a2);
      *a2 = 0;
      return (re *)(*(uint64_t (**)(uint64_t, id *))(*(_QWORD *)v3 + 40))(v3, a2);
    }
  }
  return result;
}

@end
