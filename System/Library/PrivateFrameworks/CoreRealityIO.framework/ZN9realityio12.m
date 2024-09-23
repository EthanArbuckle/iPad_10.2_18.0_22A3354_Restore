@implementation ZN9realityio12

_QWORD *___ZN9realityio12_GLOBAL__N_115StandaloneAsync10onCompleteEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  if (v4)
    RERetain();
  v2 = *(_QWORD *)(a1 + 64);
  if (!v2)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 48))(v2, &v4);
  return realityio::WrappedRERef<REAsset *>::~WrappedRERef(&v4);
}

@end
