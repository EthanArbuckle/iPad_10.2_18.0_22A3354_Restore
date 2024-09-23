@implementation APAdvertiserFlushBonjourRecords

void __APAdvertiserFlushBonjourRecords_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  dispatch_source_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  _QWORD handler[5];

  v2 = a1[6];
  if (!*(_QWORD *)(v2 + 64))
  {
    v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(v2 + 16));
    v4 = (_QWORD *)a1[6];
    v4[8] = v3;
    if (!v3)
    {
      APSLogErrorAt();
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6728;
      return;
    }
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = CFRetain(v4);
    v5 = MEMORY[0x24BDAC760];
    v6 = a1[5];
    v7 = *(NSObject **)(a1[6] + 64);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __APAdvertiserFlushBonjourRecords_block_invoke_2;
    handler[3] = &unk_24E21E7E8;
    handler[4] = v6;
    dispatch_source_set_event_handler(v7, handler);
    v8 = a1[5];
    v9 = *(NSObject **)(a1[6] + 64);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __APAdvertiserFlushBonjourRecords_block_invoke_3;
    v13[3] = &unk_24E21E7E8;
    v13[4] = v8;
    dispatch_source_set_cancel_handler(v9, v13);
    dispatch_resume(*(dispatch_object_t *)(a1[6] + 64));
    v2 = a1[6];
  }
  if (*(_BYTE *)(v2 + 121))
    v10 = 4;
  else
    v10 = 2;
  *(_DWORD *)(v2 + 52) |= 0x109 | v10;
  _APAdvertiserUpdate(v2);
  v11 = *(NSObject **)(a1[6] + 64);
  v12 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

uint64_t __APAdvertiserFlushBonjourRecords_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (*(_BYTE *)(v1 + 121))
    v2 = -270;
  else
    v2 = -268;
  *(_DWORD *)(v1 + 52) &= v2;
  return _APAdvertiserUpdate(v1);
}

void __APAdvertiserFlushBonjourRecords_block_invoke_3(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v1)
    CFRelease(v1);
}

@end
