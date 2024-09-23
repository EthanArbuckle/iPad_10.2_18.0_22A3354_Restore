@implementation CGFontCacheGetLocalCache

_QWORD *__CGFontCacheGetLocalCache_block_invoke()
{
  _QWORD *result;

  result = CGFontCacheCreate();
  CGFontCacheGetLocalCache_local_font_cache = (uint64_t)result;
  return result;
}

@end
