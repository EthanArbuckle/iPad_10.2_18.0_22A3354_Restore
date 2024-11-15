@implementation SeshatCreateSessionWithTimeout

dispatch_queue_t ___SeshatCreateSessionWithTimeout_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mobile.keybagd.seshat.sesion-timeout", 0);
  _SeshatCreateSessionWithTimeout_queue = (uint64_t)result;
  return result;
}

void ___SeshatCreateSessionWithTimeout_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v4[7];
  __int128 v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___SeshatCreateSessionWithTimeout_block_invoke_3;
  v4[3] = &unk_1E67577A0;
  v5 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = a3;
  v4[5] = v3;
  v6 = *(_QWORD *)(a1 + 56);
  v4[6] = a2;
  dispatch_sync((dispatch_queue_t)_SeshatCreateSessionWithTimeout_queue, v4);
}

void ___SeshatCreateSessionWithTimeout_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  char v20;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v9 + 24))
  {
    debuglog("_SeshatCreateSessionWithTimeout_block_invoke_3", CFSTR("doing nothing due to poison"), a3, a4, a5, a6, a7, a8, v20);
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      v11 = objc_msgSend((id)objc_msgSend(v10, "description"), "cStringUsingEncoding:", 1);
      debuglog("_SeshatCreateSessionWithTimeout_block_invoke_3", CFSTR("ERROR: %s"), v12, v13, v14, v15, v16, v17, v11);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v18 = *(id *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 64);
    }
    else
    {
      *(_BYTE *)(v9 + 24) = 1;
      v18 = *(id *)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 72);
    }
    *(_QWORD *)(*(_QWORD *)(v19 + 8) + 40) = v18;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

uint64_t ___SeshatCreateSessionWithTimeout_block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _BYTE *v9;
  char v10;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v8 = result;
    debuglog("_SeshatCreateSessionWithTimeout_block_invoke_4", CFSTR("signaling end of session due to failure to start"), a3, a4, a5, a6, a7, a8, v10);
    result = objc_msgSend(*(id *)(v8 + 32), "endSession");
    v9 = *(_BYTE **)(v8 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 40) + 8) + 24) = 1;
    if (v9)
      *v9 = 1;
  }
  return result;
}

@end
