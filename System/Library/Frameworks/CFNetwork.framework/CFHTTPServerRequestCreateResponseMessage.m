@implementation CFHTTPServerRequestCreateResponseMessage

void ___CFHTTPServerRequestCreateResponseMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *Instance;
  HTTPMessage *v6;
  const void *v7;
  CFTypeRef v8;

  v4 = *(_QWORD *)(a1 + 40);
  CFGetAllocator((CFTypeRef)(a2 - 16));
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v6 = (HTTPMessage *)Instance;
  if (Instance)
  {
    Instance[1] = 0u;
    v6 = (HTTPMessage *)(Instance + 1);
    Instance[18] = 0u;
    Instance[19] = 0u;
    Instance[16] = 0u;
    Instance[17] = 0u;
    Instance[14] = 0u;
    Instance[15] = 0u;
    Instance[12] = 0u;
    Instance[13] = 0u;
    Instance[10] = 0u;
    Instance[11] = 0u;
    Instance[8] = 0u;
    Instance[9] = 0u;
    Instance[6] = 0u;
    Instance[7] = 0u;
    Instance[4] = 0u;
    Instance[5] = 0u;
    Instance[2] = 0u;
    Instance[3] = 0u;
  }
  v7 = *(const void **)(a2 + 224);
  if (v7)
    v8 = CFRetain(v7);
  else
    v8 = 0;
  HTTPMessage::HTTPMessage(v6, "httpresponse", v8);
  *(_QWORD *)v6 = &off_1E14E9F38;
  *((_QWORD *)v6 + 1) = &unk_1E14E9FA8;
  *((_QWORD *)v6 + 2) = &unk_1E14E9FC8;
  *((_DWORD *)v6 + 32) = v4 & 0x3FF;
  *((_QWORD *)v6 + 17) = 0;
  *((_OWORD *)v6 + 10) = 0u;
  *((_OWORD *)v6 + 11) = 0u;
  *((_OWORD *)v6 + 12) = 0u;
  *((_OWORD *)v6 + 13) = 0u;
  *((_OWORD *)v6 + 14) = 0u;
  *((_OWORD *)v6 + 15) = 0u;
  *((_OWORD *)v6 + 16) = 0u;
  *((_OWORD *)v6 + 17) = 0u;
  *((_BYTE *)v6 + 296) = 0;
  if (v8)
    CFRelease(v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (char *)v6 - 16;
}

@end
