@implementation AGXA10FamilyLateEvalEvent

- (unsigned)_encodeIOGPUKernelWaitEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  unsigned int v5;

  v5 = *(_DWORD *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE51610]);
  a3->var2 = a4;
  a3->var0 = v5;
  a3->var1 = a5;
  return 65540;
}

@end
