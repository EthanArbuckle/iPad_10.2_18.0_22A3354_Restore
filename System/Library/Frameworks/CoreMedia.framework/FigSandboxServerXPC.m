@implementation FigSandboxServerXPC

void __FigSandboxServerXPC_RemoveAssertionForPID_block_invoke(uint64_t a1)
{
  fsbsxpc_removeAssertionForPIDOnQueue(*(_DWORD *)(a1 + 40));
}

void __FigSandboxServerXPC_AddAssertionForPID_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = (const void *)*(int *)(a1 + 40);
  MEMORY[0x193FFAA5C](gFigSandboxServerXPC_2, v1);
  CFBagAddValue((CFMutableBagRef)gFigSandboxServerXPC_2, v1);
}

@end
