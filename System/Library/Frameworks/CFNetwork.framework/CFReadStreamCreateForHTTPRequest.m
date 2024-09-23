@implementation CFReadStreamCreateForHTTPRequest

void __CFReadStreamCreateForHTTPRequest_block_invoke(uint64_t a1, const void *a2)
{
  _OWORD *v4;
  uint64_t v5;
  HTTPRequestMessage *v6;

  v4 = CFAllocatorAllocate(*(CFAllocatorRef *)(a1 + 32), 152, 0);
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[8] = 0u;
  *((_QWORD *)v4 + 18) = 0;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    if (*(_BYTE *)(v5 + 40))
      v6 = 0;
    else
      v6 = (HTTPRequestMessage *)(v5 + 16);
  }
  else
  {
    v6 = 0;
  }
  HTTPReadStream::HTTPReadStream((HTTPReadStream *)v4, a2, v6, 0);
}

@end
