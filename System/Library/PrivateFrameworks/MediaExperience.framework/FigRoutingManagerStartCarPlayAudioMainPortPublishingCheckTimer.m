@implementation FigRoutingManagerStartCarPlayAudioMainPortPublishingCheckTimer

void __FigRoutingManagerStartCarPlayAudioMainPortPublishingCheckTimer_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  CFTypeRef v7;
  CFTypeRef cf;

  v7 = 0;
  cf = 0;
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *MEMORY[0x1E0C9AE00];
    CMBaseObject = FigEndpointGetCMBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v4)
      v4(CMBaseObject, *MEMORY[0x1E0CA4258], v2, &cf);
    v5 = FigEndpointGetCMBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
      v6(v5, *MEMORY[0x1E0CA4348], v2, &v7);
    FigRoutingManagerContextUtilities_ResetCurrentlyActivatingEndpointInfo(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), (uint64_t)CFSTR("configUpdateReasonEndedSuccess"));
    FigRoutingManagerPostProcessPickEndpoint(*(const void **)(a1 + 32), *(_QWORD *)(a1 + 40));
    FigRoutingManagerContextUtilities_SetPickingState(*(_QWORD *)(a1 + 40), 0);
    if (cf)
      CFRelease(cf);
    if (v7)
      CFRelease(v7);
  }
}

void __FigRoutingManagerStartCarPlayAudioMainPortPublishingCheckTimer_block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

@end
