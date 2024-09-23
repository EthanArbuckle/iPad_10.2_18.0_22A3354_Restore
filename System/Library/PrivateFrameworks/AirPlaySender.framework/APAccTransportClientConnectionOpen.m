@implementation APAccTransportClientConnectionOpen

uint64_t __APAccTransportClientConnectionOpen_block_invoke()
{
  return ((uint64_t (*)(uint64_t))softLinkacc_transportClient_serverDisconnectedHandler[0])((uint64_t)&__block_literal_global_7);
}

void __APAccTransportClientConnectionOpen_block_invoke_2()
{
  if (gLogCategory_APAccTransportClientConnection <= 60
    && (gLogCategory_APAccTransportClientConnection != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __APAccTransportClientConnectionOpen_block_invoke_3(uint64_t a1)
{
  const __CFAllocator *v2;
  const __CFUUID *v3;
  const __CFUUID *v4;
  CFStringRef v5;
  CFStringRef v6;
  const void *v7;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    if (v3)
    {
      v4 = v3;
      v5 = CFUUIDCreateString(v2, v3);
      if (v5)
      {
        v6 = v5;
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = ((uint64_t (*)(uint64_t, uint64_t))softLinkacc_transportClient_createConnection[0])(5, (uint64_t)v5);
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
        {
          if (gLogCategory_APAccTransportClientConnection <= 50
            && (gLogCategory_APAccTransportClientConnection != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        else
        {
          APSLogErrorAt();
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6700;
        }
        CFRelease(v4);
        v7 = v6;
      }
      else
      {
        APSLogErrorAt();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
        v7 = v4;
      }
      CFRelease(v7);
    }
    else
    {
      APSLogErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
    }
  }
}

@end
