@implementation ZN8Espresso17generic

_QWORD *___ZN8Espresso17generic_factory_t6sharedERKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFNS1_10shared_ptrIS0_EEvE_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  _QWORD *result;

  v0 = dispatch_queue_create("com.apple.espresso.factorylock", 0);
  v1 = (void *)Espresso::factory_queue;
  Espresso::factory_queue = (uint64_t)v0;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  Espresso::factories = (uint64_t)result;
  return result;
}

@end
