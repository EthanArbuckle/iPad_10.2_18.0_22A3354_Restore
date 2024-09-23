@implementation ZN5apple6vision9libraries8facecore3mod6bundle17initializeGlobalsEv

_QWORD *___ZN5apple6vision9libraries8facecore3mod6bundle17initializeGlobalsEv_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD *result;

  v0 = objc_opt_new();
  v1 = (void *)apple::vision::libraries::facecore::mod::bundle::_semaphore;
  apple::vision::libraries::facecore::mod::bundle::_semaphore = v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.VN"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)apple::vision::libraries::facecore::mod::bundle::_bundle;
  apple::vision::libraries::facecore::mod::bundle::_bundle = v2;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  apple::vision::libraries::facecore::mod::bundle::_memoryBlockManager = (uint64_t)result;
  return result;
}

@end
