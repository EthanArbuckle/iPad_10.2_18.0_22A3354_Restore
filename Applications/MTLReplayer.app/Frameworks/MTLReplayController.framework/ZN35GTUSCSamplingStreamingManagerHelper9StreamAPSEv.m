@implementation ZN35GTUSCSamplingStreamingManagerHelper9StreamAPSEv

unsigned __int8 *___ZN35GTUSCSamplingStreamingManagerHelper9StreamAPSEv_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unsigned __int8 *result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 16), "firstObject"));
  objc_msgSend(v2, "startSampling");

  result = GTUSCSamplingStreamingManagerHelper::WaitForPreSampling((unsigned __int8 *)v1);
  atomic_store(1u, (unsigned __int8 *)(v1 + 2761));
  return result;
}

@end
