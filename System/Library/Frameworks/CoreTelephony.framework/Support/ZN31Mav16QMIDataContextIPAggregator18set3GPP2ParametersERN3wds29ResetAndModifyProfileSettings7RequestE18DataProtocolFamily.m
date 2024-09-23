@implementation ZN31Mav16QMIDataContextIPAggregator18set3GPP2ParametersERN3wds29ResetAndModifyProfileSettings7RequestE18DataProtocolFamily

const void **___ZN31Mav16QMIDataContextIPAggregator18set3GPP2ParametersERN3wds29ResetAndModifyProfileSettings7RequestE18DataProtocolFamily_block_invoke_2_108(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t (*v7)(uint64_t);
  int v8;
  uint64_t v10;
  const void *v11;
  CFNumberRef number;
  int valuePtr;

  v3 = *(_QWORD *)(a1 + 32);
  valuePtr = 0;
  v4 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 88));
  v10 = *(_QWORD *)(v3 + 80);
  number = 0;
  (*(void (**)(const void **__return_ptr, uint64_t, const __CFString *, _QWORD, _QWORD))(*(_QWORD *)v10 + 368))(&v11, v10, CFSTR("PDNInactivityTimeout"), 0, 0);
  ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&number, &v11);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v11);
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  v7 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  if (!number)
    v7 = 0;
  if (v7)
  {
    CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
    v8 = valuePtr;
    if (!valuePtr)
      valuePtr = 0;
  }
  else
  {
    v8 = valuePtr;
  }
  *a2 = v8;
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&number);
}

@end
