@implementation SOSGetBackupKeyCurveParameters

uint64_t __SOSGetBackupKeyCurveParameters_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x18D76FFBC]();
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
