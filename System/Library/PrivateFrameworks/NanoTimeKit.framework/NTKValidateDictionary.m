@implementation NTKValidateDictionary

void __NTKValidateDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  _QWORD *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (_QWORD *)MEMORY[0x1E0CB2C88];
  if ((isKindOfClass & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("Dictionary validation failed: expected key class %@, found %@"), *(_QWORD *)(a1 + 32), v8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("Dictionary validation failed: expected value class %@, found %@"), *(_QWORD *)(a1 + 40), v5);

}

@end
