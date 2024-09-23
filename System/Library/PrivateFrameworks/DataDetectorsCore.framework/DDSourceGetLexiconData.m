@implementation DDSourceGetLexiconData

uint64_t __DDSourceGetLexiconData_block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;

  if (a2)
  {
    if (a3)
    {
      v3 = result;
      result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", a2, a3, &__block_literal_global_1470);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 40) = result;
    }
    else
    {
      return munmap(a2, 0);
    }
  }
  return result;
}

uint64_t __DDSourceGetLexiconData_block_invoke_3(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

uint64_t __DDSourceGetLexiconData_block_invoke_2(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end
