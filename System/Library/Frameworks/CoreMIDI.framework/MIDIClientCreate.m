@implementation MIDIClientCreate

uint64_t __MIDIClientCreate_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, _QWORD))(result + 32);
  if (v2)
    return v2(a2, *(_QWORD *)(result + 40));
  return result;
}

@end
