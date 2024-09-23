@implementation INThisProcessIsAssistantd

uint64_t __INThisProcessIsAssistantd_block_invoke()
{
  uint64_t result;

  result = INThisProcessHasAssistantdEntitlement();
  INThisProcessIsAssistantd_isAssistantd = result;
  return result;
}

@end
