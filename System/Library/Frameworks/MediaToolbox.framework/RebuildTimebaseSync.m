@implementation RebuildTimebaseSync

void __dqr_RebuildTimebaseSync_block_invoke(uint64_t a1)
{
  int __s1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;

  v9 = 0;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4 = 0u;
  v3 = 0u;
  v2 = 0u;
  __s1 = 120;
  dqr_SyncServerTimebaseToMoment(*(_QWORD *)(a1 + 32), &__s1);
}

@end
