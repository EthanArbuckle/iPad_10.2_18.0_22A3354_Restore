@implementation NTKValidateArray

void __NTKValidateArray_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("Array validation failed: expected object class %@, found %@"), *(_QWORD *)(a1 + 32), v3);

}

@end
