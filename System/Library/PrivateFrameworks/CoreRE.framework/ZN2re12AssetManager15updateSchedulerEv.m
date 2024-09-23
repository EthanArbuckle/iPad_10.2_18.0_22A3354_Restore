@implementation ZN2re12AssetManager15updateSchedulerEv

re::AssetManager *___ZN2re12AssetManager15updateSchedulerEv_block_invoke_2(uint64_t a1)
{
  re::AssetManager *result;

  result = *(re::AssetManager **)(a1 + 32);
  if (!*((_BYTE *)result + 1410))
  {
    if (*((_BYTE *)result + 1785))
      return (re::AssetManager *)re::AssetManager::update(result, 1u, 1);
  }
  return result;
}

@end
