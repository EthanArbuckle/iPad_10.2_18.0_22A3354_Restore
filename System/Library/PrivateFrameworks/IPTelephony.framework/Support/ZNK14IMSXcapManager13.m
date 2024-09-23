@implementation ZNK14IMSXcapManager13

const void **___ZNK14IMSXcapManager13_notifyClientEN3ctu2cf11CFSharedRefIK14__CFDictionaryEERKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v4;

  v2 = IMSClientManager::delegateForStack((void **)(a1 + 32));
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v4, (const void **)(a1 + 56));
  (*(void (**)(uint64_t, const void **))(*(_QWORD *)(v2 + 56) + 16))(v2 + 56, &v4);
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v4);
}

@end
