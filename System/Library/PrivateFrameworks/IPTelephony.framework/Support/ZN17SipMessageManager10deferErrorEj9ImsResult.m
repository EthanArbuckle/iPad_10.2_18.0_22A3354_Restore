@implementation ZN17SipMessageManager10deferErrorEj9ImsResult

SipMessageManager::OutgoingMessage *___ZN17SipMessageManager10deferErrorEj9ImsResult_block_invoke(uint64_t a1)
{
  return SipMessageManager::generateError(*(SipMessageManager **)(a1 + 32), *(unsigned int *)(a1 + 112), (const ImsResult *)(a1 + 40));
}

@end
