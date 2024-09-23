@implementation EndpointNotificationCallback

void __endpointCentricPlugin_EndpointNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("Endpoint_Dissociated"));
  if (endpointCentricPlugin_UpdateEndpoint(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2))
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __endpointCentricPlugin_EndpointNotificationCallback_block_invoke_2;
    block[3] = &__block_descriptor_tmp_12_3;
    block[4] = v3;
    dispatch_async(v4, block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __endpointCentricPlugin_EndpointNotificationCallback_block_invoke_2(uint64_t a1)
{
  FigHALAudioPropertySendChanges(**(uint64_t (****)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 32), 1, 2, (uint64_t)"#vedbolg");
}

@end
