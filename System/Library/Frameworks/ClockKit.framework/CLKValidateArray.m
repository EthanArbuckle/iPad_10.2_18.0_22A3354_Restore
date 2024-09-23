@implementation CLKValidateArray

void __CLKValidateArray_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Array validation failed: expected object class %@, found %@"), *(_QWORD *)(a1 + 32), v3);

}

@end
