@implementation ZN14HTTPReadStream12startRequestEP13CFStreamError

_OWORD *___ZN14HTTPReadStream12startRequestEP13CFStreamError_block_invoke(uint64_t a1, __CFReadStream *a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = CFAllocatorAllocate(*(CFAllocatorRef *)(*(_QWORD *)(a1 + 40) + 8), 184, 0);
  *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v5[4] = 0u;
  v5[5] = 0u;
  v5[6] = 0u;
  v5[7] = 0u;
  v5[8] = 0u;
  v5[9] = 0u;
  v5[10] = 0u;
  *((_QWORD *)v5 + 22) = 0;
  HTTPNetStreamInfo::HTTPNetStreamInfo((HTTPNetStreamInfo *)v5, a2, (CFTypeRef)(*(_QWORD *)(v4 + 32) - 16), *(HTTPNetConnection **)(a1 + 40));
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v6 + 112))(v6, *(_QWORD *)(v4 + 40), 0);
  return v5;
}

_OWORD *___ZN14HTTPReadStream12startRequestEP13CFStreamError_block_invoke_2(uint64_t a1, __CFReadStream *a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = CFAllocatorAllocate(*(CFAllocatorRef *)(*(_QWORD *)(a1 + 40) + 8), 184, 0);
  *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v5[4] = 0u;
  v5[5] = 0u;
  v5[6] = 0u;
  v5[7] = 0u;
  v5[8] = 0u;
  v5[9] = 0u;
  v5[10] = 0u;
  *((_QWORD *)v5 + 22) = 0;
  HTTPNetStreamInfo::HTTPNetStreamInfo((HTTPNetStreamInfo *)v5, a2, (CFTypeRef)(*(_QWORD *)(v4 + 32) - 16), *(HTTPNetConnection **)(a1 + 40));
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v6 + 112))(v6, 0, 0);
  return v5;
}

@end
