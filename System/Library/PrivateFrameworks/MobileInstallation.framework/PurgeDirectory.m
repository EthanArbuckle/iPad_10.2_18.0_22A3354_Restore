@implementation PurgeDirectory

uint64_t ___PurgeDirectory_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;

  if (!removefile(*(const char **)(a2 + 16), *(removefile_state_t *)(a1 + 40), 0)
    && *(_DWORD *)(a2 + 76) == 1
    && *(_DWORD *)(a2 + 56) == 1)
  {
    v6 = *(_QWORD *)(a2 + 8);
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6;
  }
  *a3 = 1;
  return 1;
}

uint64_t ___PurgeDirectory_block_invoke_2(uint64_t a1, char *path)
{
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    MOLogWrite();
  if (removefile(path, *(removefile_state_t *)(a1 + 32), 1u) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();
  return 1;
}

@end
