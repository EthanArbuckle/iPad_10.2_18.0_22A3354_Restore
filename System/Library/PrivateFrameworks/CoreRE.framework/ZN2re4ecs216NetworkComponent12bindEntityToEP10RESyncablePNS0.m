@implementation ZN2re4ecs216NetworkComponent12bindEntityToEP10RESyncablePNS0

re *___ZN2re4ecs216NetworkComponent12bindEntityToEP10RESyncablePNS0_6EntityE_block_invoke(re *result, uint64_t a2)
{
  id *v2;
  uint64_t v3;

  if ((a2 & 1) != 0)
  {
    v2 = (id *)(a2 & 0xFFFFFFFFFFFFFFFELL);
    if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 0)
    {
      v3 = re::globalAllocators(result)[2];
      objc_destroyWeak(v2);
      *v2 = 0;
      return (re *)(*(uint64_t (**)(uint64_t, id *))(*(_QWORD *)v3 + 40))(v3, v2);
    }
  }
  return result;
}

@end
