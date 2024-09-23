@implementation DMChangeGraphicalProgressVisibility

uint64_t __DMChangeGraphicalProgressVisibility_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _DMLogFunc(v2, 5, CFSTR("Data migrator visibility change to %@ completed with success: %s."));

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
