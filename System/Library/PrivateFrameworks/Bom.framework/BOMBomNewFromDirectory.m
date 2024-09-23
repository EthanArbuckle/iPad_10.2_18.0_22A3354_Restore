@implementation BOMBomNewFromDirectory

void __BOMBomNewFromDirectory_parallel_block_invoke(uint64_t a1)
{
  char *ActualPath;
  char *Name;
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  NSObject *v7;

  ActualPath = (char *)BOMCopierSourceEntryGetActualPath(*(_QWORD *)(a1 + 40));
  Name = BOMCopierSourceEntryGetName(*(_QWORD **)(a1 + 40));
  v4 = BOMFSObjectNewFromPathWithSys(ActualPath, *(_WORD *)(a1 + 64), *(unsigned int (***)(_QWORD, char *, __int128 *))(a1 + 48));
  if (v4)
  {
    v5 = v4;
    BOMFSObjectSetPathName((uint64_t)v4, Name, 1);
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v5;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Could not create BOMFSObject for %s\n", ActualPath);
    v6 = *(_QWORD *)(a1 + 56);
    *(_BYTE *)(v6 + 52) = 1;
    *(_QWORD *)(v6 + 56) = strdup(ActualPath);
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 64) = strdup(Name);
  }
  v7 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (v7)
    dispatch_group_leave(v7);
}

@end
