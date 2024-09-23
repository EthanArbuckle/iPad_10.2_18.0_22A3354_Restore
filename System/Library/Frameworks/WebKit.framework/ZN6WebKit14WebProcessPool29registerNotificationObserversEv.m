@implementation ZN6WebKit14WebProcessPool29registerNotificationObserversEv

PAL *___ZN6WebKit14WebProcessPool29registerNotificationObserversEv_block_invoke_3(PAL *a1)
{
  uint64_t v1;
  PAL *result;
  uint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  WTF *v12;
  void *v13;
  uint64_t v14;
  char v15;
  IPC::Encoder *v16;

  v1 = *((_QWORD *)a1 + 4);
  result = (PAL *)PAL::updateCurrentUserInterfaceIdiom(a1);
  if ((_DWORD)result)
  {
    result = (PAL *)PAL::currentUserInterfaceIdiom(result);
    v3 = *(unsigned int *)(v1 + 84);
    if ((_DWORD)v3)
    {
      v4 = (char)result;
      v5 = *(uint64_t **)(v1 + 72);
      v6 = 8 * v3;
      do
      {
        v7 = *v5;
        v8 = *(_QWORD *)(*v5 + 136);
        if (v8 && *(_BYTE *)(v8 + 104) || *(_QWORD *)(v7 + 144))
        {
          v9 = WTF::fastMalloc((WTF *)0x240);
          *(_WORD *)v9 = 2657;
          *(_QWORD *)(v9 + 8) = 0;
          *(_QWORD *)(v9 + 528) = v9 + 16;
          *(_QWORD *)(v9 + 536) = v9 + 16;
          *(_OWORD *)(v9 + 544) = xmmword_1978CE2D0;
          *(_OWORD *)(v9 + 560) = 0u;
          IPC::Encoder::encodeHeader((IPC::Encoder *)v9);
          v16 = (IPC::Encoder *)v9;
          *IPC::Encoder::grow((IPC::Encoder *)v9, 1uLL, 1) = v4;
          LOBYTE(v14) = 0;
          v15 = 0;
          WebKit::AuxiliaryProcessProxy::sendMessage(v7, &v16, 0, (uint64_t)&v14, 1);
          if (v15)
          {
            v11 = v14;
            v14 = 0;
            if (v11)
              (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
          }
          result = v16;
          v16 = 0;
          if (result)
          {
            IPC::Encoder::~Encoder(result, v10);
            result = (PAL *)WTF::fastFree(v12, v13);
          }
        }
        ++v5;
        v6 -= 8;
      }
      while (v6);
    }
  }
  return result;
}

@end
