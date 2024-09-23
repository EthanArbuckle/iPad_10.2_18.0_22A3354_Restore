@implementation MPMusicPlayerMediaItemProxyClass

Class __get_MPMusicPlayerMediaItemProxyClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaPlayerLibrary_3();
  result = objc_getClass("_MPMusicPlayerMediaItemProxy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_MPMusicPlayerMediaItemProxyClass_block_invoke_cold_1();
  get_MPMusicPlayerMediaItemProxyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_MPMusicPlayerMediaItemProxyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMPModelObjectMediaItemClass_block_invoke_cold_1(v0);
}

@end
