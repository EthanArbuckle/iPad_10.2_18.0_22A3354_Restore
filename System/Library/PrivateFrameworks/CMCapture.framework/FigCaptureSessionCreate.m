@implementation FigCaptureSessionCreate

uint64_t __FigCaptureSessionCreate_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMSessionForIsUsingCamera-%d"), *(unsigned int *)(*(_QWORD *)(result + 32) + 16));
    return CMSessionSetProperty();
  }
  return result;
}

@end
