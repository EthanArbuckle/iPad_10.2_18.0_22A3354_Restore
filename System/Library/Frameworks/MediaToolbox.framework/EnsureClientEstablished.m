@implementation EnsureClientEstablished

void __remoteXPCAIG_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("AssetImageGenerator_ServerConnectionDied"));
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

void __remoteXPCPlayerClient_EnsureClientEstablished_block_invoke()
{
  __CFDictionary *Mutable;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  gRemotePlayerNotificationQueue = MEMORY[0x1E0C80D38];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("ServerConnectionDied"));
  FigCFDictionarySetInt32();
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCPlayerClient_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (!remoteXPCPlayerClient_EnsureClientEstablished_err)
  {
    remoteXPCPlayerClient_EnsureClientEstablished_err = FigXPCPlaybackCoordinatorClientStartAsSubclient(gPlayerRemoteClient, (uint64_t)CFSTR("ServerConnectionDied"));
    if (!remoteXPCPlayerClient_EnsureClientEstablished_err)
      remoteXPCPlayerClient_EnsureClientEstablished_err = FigImageQueueGaugeXPCRemoteStartAsSubClient(gPlayerRemoteClient);
  }
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t __remoteXPCMutableMovieClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!FigRemote_ShouldConnectToMediaparserdForFileParsing())
    FigRemote_ShouldConnectToMediaplaybackd();
  result = FigXPCRemoteClientCreate();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __remoteXPCVideoTargetClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("FigVideoTarget_ServerConnectionDied"));
    FigRemote_ShouldConnectToMediaparserdForFileParsing();
    FigRemote_ShouldConnectToMediaplaybackd();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
  }
}

uint64_t __frbs_EnsureClientEstablished_block_invoke()
{
  uint64_t result;

  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  result = FigXPCRemoteClientCreate();
  frbs_EnsureClientEstablished_err = result;
  return result;
}

uint64_t __remoteXPCCPEClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  uint64_t result;

  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  result = FigXPCRemoteClientCreate();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __aptapR_EnsureClientEstablished_block_invoke()
{
  uint64_t result;

  if (FigRemote_ShouldConnectToAirplayd())
    result = FigXPCRemoteClientCreate();
  else
    result = FigSignalErrorAt();
  aptapR_EnsureClientEstablished_err = result;
  return result;
}

uint64_t __aptapR_EnsureClientEstablished_block_invoke_2()
{
  uint64_t result;

  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  result = FigXPCRemoteClientCreate();
  aptapR_EnsureClientEstablished_err = result;
  return result;
}

void __remoteSampleGenerator_EnsureClientEstablished_block_invoke()
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("SampleGenerator_ServerConnectionDied"));
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteSampleGenerator_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

void __remoteXPCVisualContextClient_EnsureClientEstablished_block_invoke()
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("VisualContext_ServerConnectionDied"));
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCVisualContextClient_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t __remoteXPCMutableCompositionClient_EnsureClientEstablished_block_invoke()
{
  uint64_t result;

  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  result = FigXPCRemoteClientCreate();
  remoteXPCMutableCompositionClient_EnsureClientEstablished_err = result;
  return result;
}

void __remoteXPCAssetClient_EnsureClientEstablished_block_invoke()
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("Asset_ServerConnectionDied"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54B0], (const void *)*MEMORY[0x1E0C9AE50]);
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCAssetClient_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

void __remoteXPCCPEProtectorClient_EnsureClientEstablished_block_invoke()
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("CPEProtector_ServerConnectionDied"));
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  remoteXPCCPEProtectorClient_EnsureClientEstablished_sCPEProtectorRemoteClientEstablishmentError = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t __remoteXPCFigCaptionGroupConverterClient_EnsureClientEstablished_block_invoke()
{
  uint64_t result;

  result = FigXPCRemoteClientCreate();
  remoteXPCFigCaptionGroupConverterClient_EnsureClientEstablished_err = result;
  if ((_DWORD)result)
  {
    result = FigSignalErrorAt();
    remoteXPCFigCaptionGroupConverterClient_EnsureClientEstablished_err = result;
  }
  return result;
}

void __remoteVideoCompositor_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("VideoCompositor_ServerConnectionDied"));
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  FigRemote_ShouldConnectToMediaplaybackd();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

@end
