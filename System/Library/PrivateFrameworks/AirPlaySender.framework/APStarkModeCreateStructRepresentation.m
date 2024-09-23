@implementation APStarkModeCreateStructRepresentation

uint64_t __APStarkModeCreateStructRepresentation_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = CFDictionaryGetInt64();
  result = CFDictionaryGetInt64();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  v4 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  switch(v4)
  {
    case 1:
      v9 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (v9 == 2)
        v10 = 1;
      else
        v10 = 2 * (v9 == 1);
      *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = v10;
      result = CFDictionaryGetInt64();
      if ((_DWORD)result == -1)
      {
        v11 = 0;
      }
      else
      {
        result = CFDictionaryGetInt64();
        if ((_DWORD)result == 1)
          v11 = 10;
        else
          v11 = 11;
      }
      *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 44) = v11;
      break;
    case 3:
      v7 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (v7 == 2)
        v8 = 1;
      else
        v8 = 2 * (v7 == 1);
      *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 52) = v8;
      break;
    case 2:
      v5 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (v5 == 2)
        v6 = 1;
      else
        v6 = 2 * (v5 == 1);
      *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 48) = v6;
      break;
  }
  return result;
}

uint64_t __APStarkModeCreateStructRepresentation_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = CFDictionaryGetInt64();
  result = CFDictionaryGetInt64();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  v4 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v4 == 1)
  {
    v8 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    if (v8 == 2)
      v9 = 1;
    else
      v9 = 2 * (v8 == 1);
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
    result = CFDictionaryGetInt64();
    if ((_DWORD)result == 2)
    {
      v10 = 1;
    }
    else
    {
      result = CFDictionaryGetInt64();
      v10 = 2 * ((_DWORD)result == 1);
    }
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 28) = v10;
  }
  else if (v4 == 2)
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    if (v5 == 2)
      v6 = 1;
    else
      v6 = 2 * (v5 == 1);
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 32) = v6;
    result = CFDictionaryGetInt64();
    if ((_DWORD)result == 2)
    {
      v7 = 1;
    }
    else
    {
      result = CFDictionaryGetInt64();
      v7 = 2 * ((_DWORD)result == 1);
    }
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 36) = v7;
  }
  return result;
}

@end
