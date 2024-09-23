@implementation ZN25SHTTPConnectionCacheEntry28dispatchConnectionToProtocolEP17HTTPNetConnectionP39SHTTPConnectionCacheEnqueuedRequestInfoh

_OWORD *___ZN25SHTTPConnectionCacheEntry28dispatchConnectionToProtocolEP17HTTPNetConnectionP39SHTTPConnectionCacheEnqueuedRequestInfoh_block_invoke(uint64_t a1, __CFReadStream *a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = CFAllocatorAllocate(*(CFAllocatorRef *)(*(_QWORD *)(a1 + 32) + 8), 184, 0);
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[8] = 0u;
  v4[9] = 0u;
  v4[10] = 0u;
  *((_QWORD *)v4 + 22) = 0;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 40);
  if (v6)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    v7 = v6 + 16;
    if (*(_BYTE *)(v6 + 40))
      v7 = 0;
  }
  else
  {
    v7 = *(_QWORD *)(v5 + 32);
  }
  HTTPNetStreamInfo::HTTPNetStreamInfo((HTTPNetStreamInfo *)v4, a2, (CFTypeRef)(v7 - 16), *(HTTPNetConnection **)(a1 + 48));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v9 = *((_QWORD *)v4 + 15);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  *((_QWORD *)v4 + 15) = v8;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  return v4;
}

@end
