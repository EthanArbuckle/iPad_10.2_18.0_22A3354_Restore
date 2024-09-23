@implementation FigMemoryRecipientCreateWithXPCMessage1AndUpdateXPCMessage2

uint64_t __FigMemoryRecipientCreateWithXPCMessage1AndUpdateXPCMessage2_block_invoke()
{
  const __CFAllocator *v0;

  qword_1EE141618 = (uint64_t)FigSimpleMutexCreate();
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  FigCFWeakReferenceTableCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 1, &qword_1EE141620);
  return FigCFWeakReferenceTableCreate(v0, 1, &qword_1EE141628);
}

@end
