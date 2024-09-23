@implementation ZN15AsyncTargetFile5closeEPx

int *___ZN15AsyncTargetFile5closeEPx_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *result;
  int v4;
  stat v5;

  v2 = *(_QWORD *)(a1 + 40);
  result = (int *)*(unsigned int *)(v2 + 20);
  if ((_DWORD)result == -1)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 22;
  }
  else
  {
    fstat((int)result, &v5);
    **(_QWORD **)(a1 + 48) = v5.st_size;
    result = (int *)close(*(_DWORD *)(v2 + 20));
    if ((_DWORD)result)
    {
      result = __error();
      v4 = *result;
    }
    else
    {
      v4 = 0;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
    *(_DWORD *)(v2 + 20) = -1;
  }
  return result;
}

@end
