@implementation FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager

void __FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int started;
  uint64_t *DerivedStorage;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef cf;

  v2 = *(_QWORD *)(a1 + 40);
  FigRoutingSessionManagerGetClassID();
  started = CMDerivedObjectCreate();
  if (started)
    goto LABEL_26;
  DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
  v5 = _Block_copy(&__block_literal_global_66);
  *DerivedStorage = (uint64_t)v5;
  if (!v5
    || (v6 = FigSimpleMutexCreate(), (DerivedStorage[1] = v6) == 0)
    || (v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v8 = dispatch_queue_create("com.apple.coremedia.routing-session-manager.remote-replacement", v7),
        (DerivedStorage[3] = (uint64_t)v8) == 0))
  {
    started = FigSignalErrorAt();
    goto LABEL_26;
  }
  v9 = 0;
  v10 = *DerivedStorage;
  cf = 0;
  do
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *))(v10 + 16))(v10, v2, &cf);
  while ((v11 == -16155 || v11 == -15394) && v9++ < 4);
  v14 = v11;
  v15 = cf;
  if (!v14)
  {
    if (cf)
    {
      v16 = CFRetain(cf);
      v15 = cf;
    }
    else
    {
      v16 = 0;
    }
    DerivedStorage[2] = (uint64_t)v16;
  }
  if (v15)
    CFRelease(v15);
  if (!v14)
  {
    started = routingSessionManagerResilientRemote_startObservingRemoteManager();
    if (!started)
    {
      v14 = 0;
      FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager_sLongFormManager = 0;
      goto LABEL_24;
    }
LABEL_26:
    v14 = started;
  }
LABEL_24:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v14;
}

uint64_t __FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager_block_invoke_2(uint64_t a1, const __CFAllocator *a2, _QWORD *a3)
{
  return FigRoutingSessionManagerRemoteCopyLongFormVideoManager(a2, a3);
}

@end
