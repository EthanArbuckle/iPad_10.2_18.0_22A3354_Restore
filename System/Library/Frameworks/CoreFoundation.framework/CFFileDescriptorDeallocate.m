@implementation CFFileDescriptorDeallocate

void ____CFFileDescriptorDeallocate_block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  char v7;
  int v8;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = *(_DWORD *)(a1[6] + 16) == 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_DWORD *)(a1[6] + 16) = 1;
    __dmb(0xBu);
    v2 = (_QWORD *)a1[6];
    v3 = v2[4];
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = a1[6];
      if (*(_BYTE *)(v4 + 48))
      {
        *(_BYTE *)(v4 + 48) = 0;
        dispatch_resume(*(dispatch_object_t *)(v4 + 32));
        v4 = a1[6];
      }
      *(_QWORD *)(v4 + 32) = 0;
      v2 = (_QWORD *)a1[6];
    }
    v5 = v2[5];
    if (v5)
    {
      dispatch_source_cancel(v5);
      v6 = a1[6];
      if (*(_BYTE *)(v6 + 49))
      {
        *(_BYTE *)(v6 + 49) = 0;
        dispatch_resume(*(dispatch_object_t *)(v6 + 40));
        v6 = a1[6];
      }
      *(_QWORD *)(v6 + 40) = 0;
      v2 = (_QWORD *)a1[6];
    }
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v2[7];
    *(_QWORD *)(a1[6] + 56) = 0;
    v7 = atomic_load((unint64_t *)(a1[6] + 8));
    if ((v7 & 2) != 0)
    {
      shutdown(*(_DWORD *)(a1[6] + 20), 2);
      v8 = open("/dev/null", 0);
      dup2(v8, *(_DWORD *)(a1[6] + 20));
      close(v8);
      close(*(_DWORD *)(a1[6] + 20));
    }
    *(_DWORD *)(a1[6] + 20) = -1;
  }
}

@end
