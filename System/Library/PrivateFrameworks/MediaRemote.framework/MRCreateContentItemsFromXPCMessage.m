@implementation MRCreateContentItemsFromXPCMessage

MRContentItem *__MRCreateContentItemsFromXPCMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  return MRContentItemCreateFromExternalRepresentation(*MEMORY[0x1E0C9AE00], a2);
}

@end
