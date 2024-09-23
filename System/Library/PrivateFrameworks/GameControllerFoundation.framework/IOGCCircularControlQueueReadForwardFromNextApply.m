@implementation IOGCCircularControlQueueReadForwardFromNextApply

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t result;
  uint64_t v14;
  _QWORD v18[6];
  _QWORD v19[9];

  result = 3758097112;
  if (a8 != -1 && a10 != -1)
  {
    v14 = a8;
    while (1)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 0x40000000;
      v19[2] = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_2;
      v19[3] = &unk_1EA4D3A20;
      v19[4] = *(_QWORD *)(a1 + 32);
      v19[5] = v14;
      v19[6] = a7;
      v19[7] = a9;
      result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(a12 + 16))(a12, v14, v19);
      if ((_DWORD)result != -536870166 && (_DWORD)result != -536870184)
        break;
      if (++v14 >= a10)
      {
        result = 3758097136;
        if (*(_BYTE *)(a1 + 40))
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 0x40000000;
          v18[2] = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_3;
          v18[3] = &unk_1EA4D3A48;
          v18[4] = *(_QWORD *)(a1 + 32);
          v18[5] = v14;
          LODWORD(result) = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(a12 + 16))(a12, a6, v18);
          if ((_DWORD)result == -536870166)
            return 3758097136;
          else
            return result;
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    return 3758097130;
  result = 0;
  **(_QWORD **)(a1 + 48) = *(_QWORD *)(a1 + 40);
  atomic_store(*(_QWORD *)(a1 + 40) + 1, *(unint64_t **)(a1 + 56));
  return result;
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, a2, a3))
  {
    return 0;
  }
  else
  {
    return 3758097130;
  }
}

@end
