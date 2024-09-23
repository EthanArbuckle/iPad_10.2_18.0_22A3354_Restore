@implementation EnsureClientEstablished

void __cryptorRemote_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  const char *v4;
  _OWORD v5[4];

  v5[0] = xmmword_1E28DA140;
  memset(&v5[1], 0, 48);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_DeathNoticeName"), CFSTR("FigCPECryptor_ServerConnectionDied"));
    FigRemote_ShouldConnectToMediaparserdForFileParsing();
    if (FigRemote_ShouldConnectToMediaplaybackd())
      v4 = "com.apple.coremedia.mediaplaybackd.figcpecryptor.xpc";
    else
      v4 = "com.apple.coremedia.figcpecryptor";
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)v4, (uint64_t)v5, 0, &gFigCPECryptorRemoteClient);
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt(4294949725, 0, 0, 0, 0, 0, 0);
  }
}

void __remoteVirtualCaptureCardClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  const __CFDictionary *v3;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_DeathNoticeName"), CFSTR("FigVirtualCaptureCard_ServerConnectionDied"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.figvirtualcapturecard.xpc", (uint64_t)&kFigVirtualCaptureCardNotification_ServerConnectionDied_block_invoke_callbacks, v3, &gFigVirtualCaptureCardRemoteClient);
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -16150;
  }
}

void __figEndpointStreamRemoteXPC_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_DeathNoticeName"), CFSTR("EndpointStream_ServerConnectionDied"));
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_PrivilegedConnection"), (const void *)*MEMORY[0x1E0C9AE50]);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointstream.xpc", (uint64_t)&kFigEndpointStreamNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointStreamRemoteClient);
  if (Mutable)
    CFRelease(Mutable);
}

void __figEndpointMessengerRemoteXPC_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_DeathNoticeName"), CFSTR("Endpoint_ServerConnectionDied"));
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_PrivilegedConnection"), (const void *)*MEMORY[0x1E0C9AE50]);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointmessenger.xpc", (uint64_t)&kFigEndpointMessengerNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointMessengerRemoteClient);
  if (Mutable)
    CFRelease(Mutable);
}

void __figCustomURLLoaderRemote_EnsureClientEstablished_block_invoke()
{
  __CFDictionary *Mutable;
  const char *v1;
  _OWORD v2[4];

  v2[0] = xmmword_1E28DED88;
  memset(&v2[1], 0, 32);
  v2[3] = *(_OWORD *)&off_1E28DEDB8;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_DeathNoticeName"), CFSTR("CustomURLHandler_ServerConnectionDied"));
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  if (FigRemote_ShouldConnectToMediaplaybackd())
    v1 = "com.apple.coremedia.mediaplaybackd.customurlloader.xpc";
  else
    v1 = "com.apple.coremedia.customurlloader.xpc";
  figCustomURLLoaderRemote_EnsureClientEstablished_err = FigXPCRemoteClientCreate((uint64_t)v1, (uint64_t)v2, Mutable, &gFigCustomURLLoaderRemoteClient);
  if (Mutable)
    CFRelease(Mutable);
}

void __remoteXPCEndpointPlaybackSessionClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_DeathNoticeName"), CFSTR("EndpointPlaybackSession_ServerConnectionDied"));
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_PrivilegedConnection"), (const void *)*MEMORY[0x1E0C9AE50]);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointplaybacksession.xpc", (uint64_t)&kFigEndpointPlaybackSessionNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointPlaybackSessionRemoteClient);
  if (Mutable)
    CFRelease(Mutable);
}

void __remoteXPCEndpointRemoteControlSessionClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_DeathNoticeName"), CFSTR("EndpointRemoteControlSession_ServerConnectionDied"));
  CFDictionarySetValue(Mutable, CFSTR("xpcRemoteClientOption_PrivilegedConnection"), (const void *)*MEMORY[0x1E0C9AE50]);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate((uint64_t)"com.apple.coremedia.endpointremotecontrolsession.xpc", (uint64_t)&kFigEndpointRemoteControlSessionNotification_ServerConnectionDied_block_invoke_clientCallbacks, Mutable, &gFigEndpointRemoteControlSessionRemoteClient);
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t __remoteClient_EnsureClientEstablished_block_invoke()
{
  const char *v0;
  uint64_t result;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v5 = 0u;
  v4 = 0u;
  v3 = 0u;
  v2 = 1;
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  if (FigRemote_ShouldConnectToMediaplaybackd())
    v0 = "com.apple.coremedia.mediaplaybackd.controlcommands.xpc";
  else
    v0 = "com.apple.coremedia.logging.xpc";
  result = FigXPCRemoteClientCreate((uint64_t)v0, (uint64_t)&v2, 0, &gFigControlCommandsRemoteClient);
  remoteClient_EnsureClientEstablished_err = result;
  return result;
}

@end
