@implementation IIOProcessEvent

uint64_t __IIOProcessEvent_block_invoke(uint64_t a1)
{
  IIOXPCLog("⬅️ XPC_READPLUGIN_IDENTIFY [%lld]\n", *(_QWORD *)(a1 + 32));
  return kdebug_trace();
}

uint64_t __IIOProcessEvent_block_invoke_2(uint64_t a1)
{
  IIOXPCLog("⬅️ XPC_READPLUGIN_IMAGECOUNT [%lld]\n", *(_QWORD *)(a1 + 32));
  return kdebug_trace();
}

uint64_t __IIOProcessEvent_block_invoke_3(uint64_t a1)
{
  IIOXPCLog("⬅️ XPC_READPLUGIN_SOURCEPROPERTIES [%lld]\n", *(_QWORD *)(a1 + 32));
  return kdebug_trace();
}

uint64_t __IIOProcessEvent_block_invoke_4(uint64_t a1)
{
  IIOXPCLog("⬅️ XPC_READPLUGIN_INITIMAGE [%lld]\n", *(_QWORD *)(a1 + 32));
  return kdebug_trace();
}

uint64_t __IIOProcessEvent_block_invoke_5(uint64_t a1)
{
  IIOXPCLog("⬅️ XPC_READPLUGIN_DECODE_IMAGE [%lld]\n", *(_QWORD *)(a1 + 32));
  return kdebug_trace();
}

@end
