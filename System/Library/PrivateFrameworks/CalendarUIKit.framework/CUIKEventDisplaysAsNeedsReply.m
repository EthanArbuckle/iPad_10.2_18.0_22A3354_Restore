@implementation CUIKEventDisplaysAsNeedsReply

uint64_t __CUIKEventDisplaysAsNeedsReply_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CAA0E0], "needsResponseForParticipantStatus:", a2);
}

@end
