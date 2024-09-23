@implementation CFFileDescriptorPerform

uint64_t ____CFFileDescriptorPerform_block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 72) + 16) == 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v1 = (_QWORD *)result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 72) + 50);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    {
      v2 = *(_QWORD *)(result + 72);
      *(_BYTE *)(v2 + 50) = 0;
      result = cffd_is_readable(*(_DWORD *)(v2 + 24));
      *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = result;
    }
    *(_BYTE *)(*(_QWORD *)(v1[6] + 8) + 24) = *(_BYTE *)(v1[9] + 51);
    if (*(_BYTE *)(*(_QWORD *)(v1[6] + 8) + 24))
    {
      v3 = v1[9];
      *(_BYTE *)(v3 + 51) = 0;
      result = cffd_is_writeable(*(_DWORD *)(v3 + 28));
      *(_BYTE *)(*(_QWORD *)(v1[6] + 8) + 24) = result;
    }
    v4 = v1[9];
    v5 = *(uint64_t (**)(_QWORD))(v4 + 88);
    if (v5 && (*(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) || *(_BYTE *)(*(_QWORD *)(v1[6] + 8) + 24)))
    {
      result = v5(*(_QWORD *)(v4 + 80));
      *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 24) = result;
      v6 = v1[8];
      v7 = *(_QWORD *)(v1[9] + 96);
    }
    else
    {
      v7 = *(_QWORD *)(v4 + 80);
      v6 = v1[7];
    }
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 24) = v7;
  }
  return result;
}

@end
