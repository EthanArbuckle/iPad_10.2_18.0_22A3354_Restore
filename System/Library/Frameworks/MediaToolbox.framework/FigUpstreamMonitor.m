@implementation FigUpstreamMonitor

void __FigUpstreamMonitor_CreateOrRetainSharedMonitor_block_invoke(uint64_t a1)
{
  _DWORD *context;
  uint64_t DefaultLocalCenter;
  char *v4;
  __int128 *v5;
  __int128 v6;

  context = dispatch_get_context(*(dispatch_object_t *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)context;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_12;
  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  v4 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0xA004049E9B67CuLL);
  if (!v4)
    goto LABEL_14;
  if (FigUpstreamMonitor_CreateGuts_functionsOnce != -1)
    dispatch_once(&FigUpstreamMonitor_CreateGuts_functionsOnce, &__block_literal_global_5_2);
  v5 = sUpstreamMonitorUsingCoreAUC == 1
     ? &FigUpstreamMonitor_CreateGuts_constRealFunctions
     : &FigUpstreamMonitor_CreateGuts_constStubFunctions;
  v6 = v5[1];
  *(_OWORD *)(v4 + 8) = *v5;
  *(_OWORD *)(v4 + 24) = v6;
  *((_QWORD *)v4 + 5) = *((_QWORD *)v5 + 4);
  if (CMNotificationCenterRegisterForBarrierSupport()
    || (*((_QWORD *)v4 + 6) = DefaultLocalCenter,
        (*((unsigned int (**)(void (*)(uint64_t), char *, _QWORD, char *))v4 + 1))(FigUpstreamMonitorProtectionStatusChangedCallback, v4, 0, v4)))
  {
LABEL_14:
    FigUpstreamMonitor_DisposeGuts((CFTypeRef *)v4);
    v4 = 0;
  }
  else
  {
    CMNotificationCenterAddListener();
  }
  *(_QWORD *)context = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
LABEL_12:
    ++context[2];
}

_DWORD *__FigUpstreamMonitor_ReleaseSharedMonitor_block_invoke(uint64_t a1)
{
  _DWORD *result;
  int v3;
  _QWORD *v4;

  result = dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  v3 = result[2] - 1;
  result[2] = v3;
  if (!v3)
  {
    v4 = result;
    result = (_DWORD *)FigUpstreamMonitor_DisposeGuts(*(void **)(a1 + 40));
    *v4 = 0;
  }
  return result;
}

void __FigUpstreamMonitor_CreateGuts_block_invoke()
{
  sUpstreamMonitorUsingCoreAUC = 1;
}

@end
