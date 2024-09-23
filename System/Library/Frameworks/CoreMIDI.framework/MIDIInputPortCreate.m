@implementation MIDIInputPortCreate

uint64_t __MIDIInputPortCreate_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 32))(a2, *(_QWORD *)(a1 + 40));
}

@end
