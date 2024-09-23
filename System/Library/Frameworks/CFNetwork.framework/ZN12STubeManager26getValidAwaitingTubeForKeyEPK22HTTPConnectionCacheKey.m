@implementation ZN12STubeManager26getValidAwaitingTubeForKeyEPK22HTTPConnectionCacheKey

_QWORD **___ZN12STubeManager26getValidAwaitingTubeForKeyEPK22HTTPConnectionCacheKey_block_invoke(uint64_t a1)
{
  _QWORD **result;

  result = STubeManager::_onqueue_getValidAwaitingTubeForKey(*(CFArrayRef **)(a1 + 40), *(const HTTPConnectionCacheKey **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
