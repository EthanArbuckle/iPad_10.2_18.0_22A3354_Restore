@implementation APAdvertiserRapportManagerGetMode

uint64_t __APAdvertiserRapportManagerGetMode_block_invoke(uint64_t result)
{
  **(_WORD **)(result + 48) = *(_WORD *)(*(_QWORD *)(result + 40) + 56);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

@end
