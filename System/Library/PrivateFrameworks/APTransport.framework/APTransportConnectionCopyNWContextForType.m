@implementation APTransportConnectionCopyNWContextForType

uint64_t __APTransportConnectionCopyNWContextForType_block_invoke()
{
  APTransportConnectionCopyNWContextForType_sAPTNWContextDefault = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  return nw_context_activate();
}

uint64_t __APTransportConnectionCopyNWContextForType_block_invoke_2()
{
  APTransportConnectionCopyNWContextForType_sAPTNWContextBufferedAudio = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  return nw_context_activate();
}

uint64_t __APTransportConnectionCopyNWContextForType_block_invoke_3()
{
  APTransportConnectionCopyNWContextForType_sAPTNWContextLowLatency = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  return nw_context_activate();
}

@end
